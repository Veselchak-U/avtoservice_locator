import 'package:avtoservicelocator/bloc/common/base_bloc.dart';
import 'package:avtoservicelocator/data/repository.dart';
import 'package:avtoservicelocator/model/autoservice.dart';
import 'package:avtoservicelocator/model/request.dart';
import 'package:avtoservicelocator/service/screen_builder_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fimber/flutter_fimber.dart';

class AutoserviceBloc extends BlocBase {
  AutoserviceBloc(
      {@required String requestId,
      @required String autoServiceId,
      @required this.price,
      @required ScreenBuilderService screenBuilderService,
      @required Repository repository})
      : _request = requestId != null
            ? repository.getRequestById(requestId: requestId)
            : null,
        autoService =
            repository.getAutoServiceById(autoServiceId: autoServiceId),
        _screenBuilderService = screenBuilderService,
        _repository = repository {
    _initSubscribeButton();
    _log.d('AutoserviceBlock create');
  }

  final Request _request;
  final AutoService autoService;
  final int price;
  final ScreenBuilderService _screenBuilderService;
  final Repository _repository;
  bool isSubscribeButtonVisible;
  bool isSubscribeButtonEnable;
  String subscribeButtonText;

  BuildContext context;

  final FimberLog _log = FimberLog('AvtoService Locator');

  void onPressedSubscribeButton() {
    if (_request.status == RequestStatus.ACTIVE) {
      _repository.updateRequest(
          requestId: _request.id, newStatus: RequestStatus.WORK);
      isSubscribeButtonEnable = false;
    }
  }

  void onTapAutoserviceLocation() {
    var nextScreen = _screenBuilderService.getLocationScreenBuilder();
    Navigator.push<Widget>(
        context,
        MaterialPageRoute<Widget>(
            builder: (BuildContext context) => nextScreen(autoService)));
  }

  void onTapButtonBack() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _log.d('AutoserviceBlock dispose');
  }

  void _initSubscribeButton() {
    if (_request == null) {
      isSubscribeButtonVisible = false;
    } else {
      isSubscribeButtonVisible = true;
      isSubscribeButtonEnable = _request.status == RequestStatus.ACTIVE;

      if (_request.status == RequestStatus.ACTIVE) {
        subscribeButtonText = 'Записаться на ремонт за $price \u{20BD}';
      } else if (_request.status == RequestStatus.WORK) {
        subscribeButtonText = 'Заявка в работе';
      } else if (_request.status == RequestStatus.DONE) {
        subscribeButtonText = 'Заявка завершена';
      } else if (_request.status == RequestStatus.CANCEL) {
        subscribeButtonText = 'Заявка отменена';
      }
    }
  }
}
