import 'package:avtoservicelocator/data/i_data_source.dart';
import 'package:avtoservicelocator/model/autoservice.dart';
import 'package:avtoservicelocator/model/autoservice_item.dart';
import 'package:avtoservicelocator/model/proposal.dart';
import 'package:avtoservicelocator/model/proposal_item.dart';
import 'package:avtoservicelocator/model/request.dart';
import 'package:avtoservicelocator/model/request_item.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:rxdart/rxdart.dart';

class StreamService {
  StreamService() {
    filterRequestItems = 'ACTIVE';
    filterRequestId = '';
    filterAutoService = '';
    listRequests.listen(_convertRequestsToRequestItems);
    listRequests.listen(_convertRequestsToProposalItems);
    listAutoService
        .map(_filterAutoService)
        .map(_convertAutoServiceToAutoServiceItems)
        .listen(listAutoServiceItems.add);
    _log.d('StreamsService create');
  }

  final changeInDataSource = PublishSubject<DataSourceEvent>();
  final refreshData = PublishSubject<RefreshDataEvent>();

  final listRequests = BehaviorSubject<List<Request>>();
  final listRequestItems = BehaviorSubject<List<RequestItem>>();
  final listProposalItems = BehaviorSubject<List<ProposalItem>>();

  final listAutoService = BehaviorSubject<List<AutoService>>();
  final listAutoServiceItems = BehaviorSubject<List<AutoServiceItem>>();

  String filterRequestItems;
  String filterRequestId;
  String filterAutoService;
  final _log = FimberLog('AvtoService Locator');

  List<AutoService> _filterAutoService(List<AutoService> inList) {
    List<AutoService> outList;

    if (filterAutoService.isEmpty) {
      outList = inList;
    } else {
      outList = [];
      String filter = filterAutoService.toLowerCase();
      String name;
      String address;
      inList.forEach((AutoService item) {
        name = item.name.toLowerCase();
        address = item.address.toLowerCase();
        if (name.contains(filter) || address.contains(filter)) {
          outList.add(item);
        }
      });
    }
    return outList;
  }

  List<AutoServiceItem> _convertAutoServiceToAutoServiceItems(
      List<AutoService> inList) {
    List<AutoServiceItem> outList = [];
    AutoServiceItem item;

    inList.forEach((AutoService autoService) {
      item = autoService.toAutoServiceItem();
      outList.add(item);
    });
    return outList;
  }

  List<RequestItem> _filterRequestItems(List<RequestItem> inRequestItems) {
    _log.d('StreamService _filterRequestItems() start');
    List<RequestItem> outRequestItems;

    if (filterRequestItems.isEmpty) {
      outRequestItems = inRequestItems;
    } else if (filterRequestItems == 'ACTIVE') {
      outRequestItems = [];
      inRequestItems.forEach((item) {
        if (item.status == RequestStatus.ACTIVE ||
            item.status == RequestStatus.WORK) {
          outRequestItems.add(item);
        }
      });
//      outRequestItems = [];
//      inRequestItems.forEach((item) {
//        if (item.descRequest
//            .toLowerCase()
//            .contains(filterRequestItems.toLowerCase())) {
//          outRequestItems.add(item);
//        }
//      });
    }
    _log.d('StreamService _filterRequestItems(${outRequestItems.length})');
    return outRequestItems;
  }

  void _convertRequestsToRequestItems(List<Request> requests) {
    _log.d('StreamService _convertRequestsToRequestItems() start');
    var requestItems = <RequestItem>[];
    RequestItem item;

    requests.forEach((Request request) {
      item = request.toRequestItem();
      requestItems.add(item);
    });
    _log.d(
        'StreamService _convertRequestsToRequestItems(${requestItems.length})');
    listRequestItems.add(_filterRequestItems(requestItems));
  }

  void _convertRequestsToProposalItems(List<Request> requests) {
    _log.d('StreamService _convertRequestsToProposalItems() start');
    var proposalItems = <ProposalItem>[];
    ProposalItem item;

    var requestIndex =
        requests.indexWhere((Request element) => element.id == filterRequestId);
    List<Proposal> proposals;
    if (requestIndex != -1) {
      proposals = requests[requestIndex].proposals;
    }
    if (proposals != null && proposals.isNotEmpty) {
      proposals.forEach((Proposal proposal) {
        item = proposal.toProposalItem();
        proposalItems.add(item);
      });
      listProposalItems.add(proposalItems);
    }
    _log.d(
        'StreamService _convertRequestsToProposalItems(${proposalItems.length}) end.');
  }

  @override
  void dispose() {
    changeInDataSource.close();
    refreshData.close();
    listRequests.close();
    listRequestItems.close();
    listProposalItems.close();
    listAutoService.close();
    listAutoServiceItems.close();
    _log.d('StreamService dispose');
  }
}

enum RefreshDataEvent { LIST_REQUEST, LIST_AUTOSERVICES }
