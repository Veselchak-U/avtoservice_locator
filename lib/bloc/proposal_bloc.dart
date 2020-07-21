import 'package:avtoservicelocator/bloc/common/base_bloc.dart';
import 'package:avtoservicelocator/data/repository.dart';
import 'package:avtoservicelocator/model/proposal_item.dart';
import 'package:avtoservicelocator/service/screen_builder_service.dart';
import 'package:avtoservicelocator/service/stream_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fimber/flutter_fimber.dart';

class ProposalBloc extends BlocBase {
  ProposalBloc(
      {@required String requestId,
      @required ScreenBuilderService screenBuilderService,
      @required StreamService streamService,
      @required Repository repository})
      : _requestId = requestId,
        _screenBuilderService = screenBuilderService,
        _streamService = streamService,
        _repository = repository {
    _streamService.filterRequestId = requestId;
    outProposalItems = _streamService.listProposalItems.stream;
    _log.d('ProposalBloc create');
  }

  final String _requestId;
  final ScreenBuilderService _screenBuilderService;
  final StreamService _streamService;
  final Repository _repository;
  Stream<List<ProposalItem>> outProposalItems;

  BuildContext context;

  final _log = FimberLog('AvtoService Locator');

  void onTapProposalItem({ProposalItem item}) {
    _log.d('onTapProposalItem() item.id= ${item.id}');
    var proposal = _repository.getProposalById(proposalId: item.id);
    var nextScreen = _screenBuilderService.getAutoserviceScreenBuilder();
    Navigator.push<Widget>(
        context,
        MaterialPageRoute<Widget>(
            builder: (BuildContext context) => nextScreen(
                _requestId, proposal.autoService.id, proposal.price)));
  }

  @override
  void dispose() {
    _streamService.filterRequestId = '';
    _log.d('ProposalBloc dispose');
  }
}
