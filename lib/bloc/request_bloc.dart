import 'package:avtoservicelocator/bloc/common/base_bloc.dart';
import 'package:avtoservicelocator/data/repository.dart';
import 'package:avtoservicelocator/model/car.dart';
import 'package:avtoservicelocator/model/request.dart';
import 'package:avtoservicelocator/model/request_item.dart';
import 'package:avtoservicelocator/model/user.dart';
import 'package:avtoservicelocator/service/current_user_service.dart';
import 'package:avtoservicelocator/service/screen_builder_service.dart';
import 'package:avtoservicelocator/service/stream_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:page_transition/page_transition.dart';

class RequestBloc extends BlocBase {
  RequestBloc(
      {@required ScreenBuilderService screenBuilderService,
      @required StreamService streamService,
      @required Repository repository,
      @required CurrentUserService currentUserService})
      : _screenBuilderService = screenBuilderService,
        _streamService = streamService,
        _repository = repository,
        currentUser = currentUserService.getCurrentUser() {
    outRequestItems = _streamService.listRequestItems.stream;
    listCarDescription = _getListCarDescription();
    _log.d('RequestBloc create');
  }

  final ScreenBuilderService _screenBuilderService;
  final StreamService _streamService;
  final Repository _repository;
  final User currentUser;
  List<String> listCarDescription;
  Stream<List<RequestItem>> outRequestItems;
  BuildContext context;
  final int bottomNavigationBarIndex = 0;
  SelectedFilterMenu selectedFilterMenu = SelectedFilterMenu.ACTIVE;
  final FimberLog _log = FimberLog('AvtoService Locator');

  void onTapRequestItem({RequestItem item}) {
    _log.d(
        'onTapRequestItem() item.descProposals = ${item.descProposals?.length}');
    if (_isItemCanTapped(item)) {
      _streamService.filterRequestId = item.id;
      _streamService.refreshData.add(RefreshDataEvent.LIST_REQUEST);

      var nextScreen = _screenBuilderService.getProposalScreenBuilder();
      Navigator.push<Widget>(
          context,
          MaterialPageRoute<Widget>(
              builder: (BuildContext context) => nextScreen(item.id)));
    }
  }

  void onSelectedItemMenu(RequestItem requestItem, SelectedItemMenu menuItem) {
    if (menuItem == SelectedItemMenu.CANCEL) {
      _repository.updateRequest(
          requestId: requestItem.id, newStatus: RequestStatus.CANCEL);
    }
  }

  void onSelectedFilterMenu(SelectedFilterMenu result) {
    if (result == SelectedFilterMenu.ALL) {
      _streamService.filterRequestItems = '';
      selectedFilterMenu = SelectedFilterMenu.ALL;
    } else if (result == SelectedFilterMenu.ACTIVE) {
      _streamService.filterRequestItems = 'ACTIVE';
      selectedFilterMenu = SelectedFilterMenu.ACTIVE;
    }
    _repository.onRefreshData(RefreshDataEvent.LIST_REQUEST);
  }

  void addRequest(
      {Car car,
      String description,
      DateTime dateRepair,
      bool signYourParts,
      bool signNeedEvacuation}) {
    var newRequest = Request(
        userId: currentUser.id,
        date: DateTime.now(),
//        number: 0,
        status: RequestStatus.ACTIVE,
        car: car,
        description: description,
//        List<String> photos;
        dateRepair: dateRepair,
        signYourParts: signYourParts,
        signNeedEvacuation: signNeedEvacuation);
    _repository.addRequest(request: newRequest);
  }

  void onTapBottomNavigationBar(int index) {
    Widget Function() nextScreen;
    if (index == 1) {
      nextScreen = _screenBuilderService.getSearchScreenBuilder();
    } else if (index == 2) {
      nextScreen = _screenBuilderService.getProfileScreenBuilder();
    } else {
      return;
    }
    Navigator.pushReplacement(
        context,
        PageTransition<Widget>(
            type: PageTransitionType.fade, child: nextScreen()));
  }

  bool _isItemCanTapped(RequestItem item) {
    if (/*(item.status == RequestStatus.ACTIVE ||
            item.status == RequestStatus.WORK) &&*/
        item.descProposals?.length == 2) {
      return true;
    } else {
      return false;
    }
  }

  List<String> _getListCarDescription() {
    List<String> result = [];
    if (currentUser.cars != null && currentUser.cars.isNotEmpty) {
      currentUser.cars.forEach((element) {
        result.add(element.getCarDescription());
      });
    }
    return result;
  }

  bool isPossibleAddRequest() {
    var result = true;
    if (currentUser.cars == null || currentUser.cars.isEmpty) {
      result = false;
//      var snackBar = SnackBar(content: Text('Yay! A SnackBar!'));
//      Scaffold.of(context).showSnackBar(snackBar);
    }
    return result;
  }

  @override
  void dispose() {
    _streamService.filterRequestId = '';
    _log.d('RequestBloc dispose');
  }
}

enum SelectedItemMenu { CANCEL }

enum SelectedFilterMenu { ACTIVE, ALL }
