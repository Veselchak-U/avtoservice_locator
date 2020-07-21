import 'package:avtoservicelocator/bloc/autoservice_bloc.dart';
import 'package:avtoservicelocator/bloc/common/bloc_provider.dart';
import 'package:avtoservicelocator/bloc/location_bloc.dart';
import 'package:avtoservicelocator/bloc/login_bloc.dart';
import 'package:avtoservicelocator/bloc/profile_bloc.dart';
import 'package:avtoservicelocator/bloc/proposal_bloc.dart';
import 'package:avtoservicelocator/bloc/request_bloc.dart';
import 'package:avtoservicelocator/bloc/search_bloc.dart';
import 'package:avtoservicelocator/bloc/startup_bloc.dart';
import 'package:avtoservicelocator/model/autoservice.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

typedef StartupScreenBuilder = BlocProvider<StartupBloc> Function();
typedef LoginScreenBuilder = BlocProvider<LoginBloc> Function();
typedef RequestScreenBuilder = BlocProvider<RequestBloc> Function();
typedef ProposalScreenBuilder = BlocProvider<ProposalBloc> Function(
    String requestId);
typedef AutoserviceScreenBuilder = BlocProvider<AutoserviceBloc> Function(
    String requestId, String autoServiceId, int price);
typedef LocationScreenBuilder = BlocProvider<LocationBloc> Function(
    AutoService autoService);
typedef SearchScreenBuilder = BlocProvider<SearchBloc> Function();
typedef ProfileScreenBuilder = BlocProvider<ProfileBloc> Function();

class ScreenBuilderService {
  ScreenBuilderService({@required Injector injector}) : _injector = injector;

  final Injector _injector;

  Widget Function() getLoginScreenBuilder() =>
      _injector.get<LoginScreenBuilder>();

  Widget Function() getRequestScreenBuilder() =>
      _injector.get<RequestScreenBuilder>();

  Widget Function(String) getProposalScreenBuilder() =>
      _injector.get<ProposalScreenBuilder>();

  Widget Function(String, String, int) getAutoserviceScreenBuilder() =>
      _injector.get<AutoserviceScreenBuilder>();

  Widget Function(AutoService) getLocationScreenBuilder() =>
      _injector.get<LocationScreenBuilder>();

  Widget Function() getSearchScreenBuilder() =>
      _injector.get<SearchScreenBuilder>();

  Widget Function() getProfileScreenBuilder() =>
      _injector.get<ProfileScreenBuilder>();
}
