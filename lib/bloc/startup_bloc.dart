import 'package:avtoservicelocator/bloc/common/base_bloc.dart';
import 'package:avtoservicelocator/data/repository.dart';
import 'package:avtoservicelocator/service/current_user_service.dart';
import 'package:avtoservicelocator/service/screen_builder_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:page_transition/page_transition.dart';

class StartupBloc extends BlocBase {
  StartupBloc(
      {@required Repository repository,
      @required CurrentUserService currentUserService,
      @required ScreenBuilderService screenBuilderService})
      : _repository = repository,
        _currentUserService = currentUserService,
        _screenBuilderService = screenBuilderService {
    _log.d('StartupBloc create start');
    isRepoInit = _repository.isInitialized;
    _log.d('StartupBloc create end');
  }

  final Repository _repository;
  final CurrentUserService _currentUserService;
  final ScreenBuilderService _screenBuilderService;
  Future<bool> isRepoInit;
  BuildContext context;

  final FimberLog _log = FimberLog('AvtoService Locator');

  void gotoNextScreen() {
    Widget Function() nextScreen;
    var currentUser = _currentUserService.getCurrentUser();
    if (currentUser == null) {
      nextScreen = _screenBuilderService.getLoginScreenBuilder();
      Navigator.pushReplacement<Widget, Widget>(
          context,
          PageTransition<Widget>(
              type: PageTransitionType.fade, child: nextScreen()));
    } else {
      nextScreen = _screenBuilderService.getRequestScreenBuilder();
      Navigator.pushReplacement<Widget, Widget>(
          context,
          PageTransition<Widget>(
              type: PageTransitionType.fade, child: nextScreen()));
    }
  }

  @override
  void dispose() {
    _log.d('StartupBloc dispose');
  }
}
