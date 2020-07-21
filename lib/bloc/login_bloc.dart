import 'package:avtoservicelocator/bloc/common/base_bloc.dart';
import 'package:avtoservicelocator/model/user.dart';
import 'package:avtoservicelocator/service/current_user_service.dart';
import 'package:avtoservicelocator/service/screen_builder_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:page_transition/page_transition.dart';

class LoginBloc extends BlocBase {
  LoginBloc(
      {@required CurrentUserService currentUserService,
      @required ScreenBuilderService screenBuilderService})
      : _currentUserService = currentUserService,
        _screenBuilderService = screenBuilderService {
    _log.d('LoginBloc create');
  }

  final CurrentUserService _currentUserService;
  final ScreenBuilderService _screenBuilderService;
  BuildContext context;
  final FimberLog _log = FimberLog('AvtoService Locator');

  void loginUser({@required String phoneNumber}) async {
    var newUser = User(phoneNumber: phoneNumber);
    var result = await _currentUserService.setCurrentUser(newUser: newUser);
    if (result) {
      var nextScreen = _screenBuilderService.getRequestScreenBuilder();
      Navigator.pushReplacement<Widget, Widget>(
          context,
          PageTransition<Widget>(
              type: PageTransitionType.fade, child: nextScreen()));
    }
  }

  @override
  void dispose() {
    _log.d('LoginBloc dispose');
  }
}
