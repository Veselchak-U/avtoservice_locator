import 'dart:async';
import 'dart:math';

import 'package:avtoservicelocator/data/i_data_source.dart';
import 'package:avtoservicelocator/model/address.dart';
import 'package:avtoservicelocator/model/autoservice.dart';
import 'package:avtoservicelocator/model/proposal.dart';
import 'package:avtoservicelocator/model/request.dart';
import 'package:avtoservicelocator/service/current_user_service.dart';
import 'package:avtoservicelocator/service/stream_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_fimber/flutter_fimber.dart';

class Repository {
  Repository(
      {@required IDataSource dataSource,
      @required CurrentUserService currentUserService,
      @required StreamService streamService}) {
    _dataSource = dataSource;
    _currentUserService = currentUserService;
    isInitialized = initialize();
    streamService.changeInDataSource.listen(onChangeInDataSource);
    streamService.refreshData.listen(onRefreshData);
    _inListRequests = streamService.listRequests.sink;
    _inListAutoServices = streamService.listAutoService.sink;
    _log.d('Repository create');
  }

  IDataSource _dataSource;
  CurrentUserService _currentUserService;
  Future<bool> isInitialized;
  List<Request> _requests;
  List<AutoService> _autoServices;
  List<Address> _addresses;
  Map<String, List<String>> _carReferenceList;

  Sink<List<Request>> _inListRequests;
  Sink<List<AutoService>> _inListAutoServices;

  Timer _jobEvery15sec;

  final FimberLog _log = FimberLog('AvtoService Locator');

  Future<bool> initialize() async {
    _log.d('Repository initRepository() start');
    try {
      _dataSource.isInitialized = await _dataSource.initialize();
      _log.d(
          'Repository initRepository() _dataSource.isInitialized = ${_dataSource.isInitialized}');
      _currentUserService.isInitialized =
          await _currentUserService.initialize();
      _log.d(
          'Repository initRepository() _currentUserService.isInitialized = ${_currentUserService.isInitialized}');
      _log.d(
          'Repository initRepository() _currentUserService.getCurrentUser().phoneNumber = ${_currentUserService.getCurrentUser()?.phoneNumber}');
    } on Exception catch (error, stackTrace) {
      _handleException(error, stackTrace);
    }

//    onChangeInDataSource(DataSourceEvent.ALL_REFRESH);
    _requests = await _dataSource.loadRequests(
        user: _currentUserService.getCurrentUser());
    _inListRequests.add(_requests);

    _autoServices = await _dataSource.loadAutoServices(
        user: _currentUserService.getCurrentUser());
    _inListAutoServices.add(_autoServices);

    _addresses = await _dataSource.loadAddresses();
    _carReferenceList = await _dataSource.loadCarReferenceList();

//    var job = JobService(repository: this);
    _jobEvery15sec = Timer.periodic(Duration(seconds: 15), (timer) {
      _log.d('_jobEvery15sec');
      _addRandomProposals();
    });

    _log.d(
        'Repository initRepository() _requests.length = ${_requests.length}');
    _log.d('Repository initRepository() end');
    return true;
  }

  void logoutCurrentUser() async {
    _currentUserService.logoutCurrentUser();
    _requests = await _dataSource.loadRequests(
        user: _currentUserService.getCurrentUser());
    _inListRequests.add(_requests);
  }

  Future<void> onChangeInDataSource(DataSourceEvent event) async {
    if (event == DataSourceEvent.REQUESTS_REFRESH) {
      _requests = await _dataSource.loadRequests(
          user: _currentUserService.getCurrentUser());
      _inListRequests.add(_requests);
      _log.d('Repository onChangeInDataSource REQUESTS_REFRESH');
    } else if (event == DataSourceEvent.MESSAGES_REFRESH) {
      _log.d('Repository onChangeInDataSource MESSAGES_REFRESH');
    } else if (event == DataSourceEvent.ALL_REFRESH) {
      onChangeInDataSource(DataSourceEvent.REQUESTS_REFRESH);
      onChangeInDataSource(DataSourceEvent.MESSAGES_REFRESH);
      _log.d('Repository onChangeInDataSource ALL_REFRESH');
    }
  }

  void onRefreshData(RefreshDataEvent event) {
    if (event == RefreshDataEvent.LIST_REQUEST) {
      _inListRequests.add(_requests);
    } else if (event == RefreshDataEvent.LIST_AUTOSERVICES) {
      _inListAutoServices.add(_autoServices);
    }
  }

  Request getRequestById({String requestId, String proposalId}) {
    assert(requestId != null || proposalId != null, 'There are no props!');
    Request result;

    if (requestId != null) {
      result = _requests.firstWhere((element) => element.id == requestId);
    } else if (proposalId != null) {
      Proposal proposal;
      for (var req in _requests) {
        result = req;
        proposal = result.proposals?.firstWhere(
            (element) => element.id == proposalId,
            orElse: () => null);
        if (proposal != null) break;
      }
    }
    return result;
  }

  Proposal getProposalById({@required String proposalId}) {
    Proposal result;
    for (var request in _requests) {
      result = request.proposals?.firstWhere(
          (element) => element.id == proposalId,
          orElse: () => null);
      if (result != null) break;
    }
    return result;
  }

  AutoService getAutoServiceById({@required String autoServiceId}) {
    AutoService result;
    if (autoServiceId != null) {
      result =
          _autoServices.firstWhere((element) => element.id == autoServiceId);
    }
    return result;
  }

  List<String> getAddressElements({String country, String region}) {
    Set<String> result = <String>{};

    if (country == null) {
      _addresses.forEach((element) {
        result.add(element.country);
      });
    } else if (region == null) {
      _addresses.forEach((element) {
        if (element.country == country) {
          result.add(element.region);
        }
      });
    }
    return result.isEmpty ? null : result.toList();
  }

  Map<String, String> getCityAddress({String country, String region}) {
    Map<String, String> result = <String, String>{};

    _addresses.forEach((element) {
      if (element.country == country && element.region == region) {
        result[element.city] = '${element.lat},${element.lng}';
      }
    });
    return result.isEmpty ? null : result;
  }

  List<String> getCarElements({String carMark}) {
    List<String> result = [];
    if (carMark == null) {
      result = _carReferenceList.keys.toList();
    } else {
      result = _carReferenceList[carMark];
    }
    return result;
  }

  void updateRequest(
      {String requestId, String proposalId, RequestStatus newStatus}) {
    assert(requestId != null || proposalId != null, 'There are no props!');
    assert(newStatus != null, 'Nothing to change!');
    // Finding request
    var request = getRequestById(requestId: requestId, proposalId: proposalId);
    // Modifying request
    if (newStatus != null) {
      request.status = newStatus;
    }
    _dataSource.updateRequest(request: request);
    onRefreshData(RefreshDataEvent.LIST_REQUEST);
  }

  void addRequest({@required Request request}) {
    _dataSource.addRequest(request: request);
    int lastRequestNumber;
    if (_requests == null || _requests.isEmpty) {
      lastRequestNumber = 0;
    } else {
      lastRequestNumber = _requests
          .reduce(
              (current, next) => current.number > next.number ? current : next)
          .number;
    }
    request.number = lastRequestNumber + 1;
    _requests.add(request);
    onRefreshData(RefreshDataEvent.LIST_REQUEST);
  }

  void _addRandomProposals() {
    var countServices = _autoServices.length;
    if (_requests != null && _requests.isNotEmpty) {
      _requests.forEach((request) {
        request.proposals ??= [];
        var countProposals = request.proposals.length;
        if (request.status == RequestStatus.ACTIVE &&
            countProposals < countServices) {
          var autoService = _autoServices[countProposals];
          var price = (Random().nextInt(15) + 5) * 100;
          var randomProposal = Proposal(autoService: autoService, price: price);
          request.proposals.add(randomProposal);
          onRefreshData(RefreshDataEvent.LIST_REQUEST);
        }
      });
    }
  }

  void dispose() {
    _jobEvery15sec.cancel();
    _log.d('Repository dispose');
  }

  void _handleException(Exception error, StackTrace stackTrace) {
    _log.d('Error in class Repository', ex: error, stacktrace: stackTrace);
  }


}
