import 'package:avtoservicelocator/bloc/common/base_bloc.dart';
import 'package:avtoservicelocator/model/autoservice.dart';
import 'package:avtoservicelocator/service/screen_builder_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fimber/flutter_fimber.dart';

class LocationBloc extends BlocBase {
  LocationBloc(
      {@required this.autoService,
      @required ScreenBuilderService screenBuilderService})
      : _screenBuilderService = screenBuilderService{
    _log.d('LocationBlock create');
  }

  final ScreenBuilderService _screenBuilderService;
  final AutoService autoService;
  BuildContext context;
  final FimberLog _log = FimberLog('AvtoService Locator');

  @override
  void dispose() {}
}
