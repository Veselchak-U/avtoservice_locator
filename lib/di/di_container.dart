import 'package:avtoservicelocator/bloc/autoservice_bloc.dart';
import 'package:avtoservicelocator/bloc/common/bloc_provider.dart';
import 'package:avtoservicelocator/bloc/location_bloc.dart';
import 'package:avtoservicelocator/bloc/login_bloc.dart';
import 'package:avtoservicelocator/bloc/profile_bloc.dart';
import 'package:avtoservicelocator/bloc/proposal_bloc.dart';
import 'package:avtoservicelocator/bloc/request_bloc.dart';
import 'package:avtoservicelocator/bloc/search_bloc.dart';
import 'package:avtoservicelocator/bloc/startup_bloc.dart';
import 'package:avtoservicelocator/data/dummy_data_source.dart';
import 'package:avtoservicelocator/data/i_data_source.dart';
import 'package:avtoservicelocator/data/repository.dart';
import 'package:avtoservicelocator/model/autoservice.dart';
import 'package:avtoservicelocator/service/current_user_service.dart';
import 'package:avtoservicelocator/service/screen_builder_service.dart';
import 'package:avtoservicelocator/service/stream_service.dart';
import 'package:avtoservicelocator/ui/autoservice_screen.dart';
import 'package:avtoservicelocator/ui/location_screen.dart';
import 'package:avtoservicelocator/ui/login_screen.dart';
import 'package:avtoservicelocator/ui/profile_screen.dart';
import 'package:avtoservicelocator/ui/proposal_screen.dart';
import 'package:avtoservicelocator/ui/request_screen.dart';
import 'package:avtoservicelocator/ui/search_screen.dart';
import 'package:avtoservicelocator/ui/startup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class DiContainer {
  static Injector _injector;

  static void initialize() {
    _injector = Injector.getInjector();
    _registerServices();
    _registerScreenBuilders();
  }

  static Widget getStartupScreen() {
    return (_injector.get<StartupScreenBuilder>())();
  }

  static void _registerServices() {
    _injector.map<IDataSource>(
        (i) => DummyDataSource(streamService: i.get<StreamService>()),
        isSingleton: true);

    _injector.map<CurrentUserService>(
        (i) => CurrentUserService(dataSource: i.get<IDataSource>()),
        isSingleton: true);

    _injector.map<Repository>(
        (i) => Repository(
            dataSource: i.get<IDataSource>(),
            currentUserService: i.get<CurrentUserService>(),
            streamService: i.get<StreamService>()),
        isSingleton: true);

    _injector.map<ScreenBuilderService>(
        (i) => ScreenBuilderService(injector: i),
        isSingleton: true);

    _injector.map<StreamService>((i) => StreamService(), isSingleton: true);
  }

  static void _registerScreenBuilders() {
    // Startup screen
    _injector.map<StartupScreenBuilder>(
        (i) => () => BlocProvider<StartupBloc>(
            child: StartupScreen(),
            bloc: StartupBloc(
              repository: i.get<Repository>(),
              currentUserService: i.get<CurrentUserService>(),
              screenBuilderService: i.get<ScreenBuilderService>(),
            )),
        isSingleton: true);

    // Login screen
    _injector.map<LoginScreenBuilder>(
        (i) => () => BlocProvider<LoginBloc>(
              child: LoginScreen(),
              bloc: LoginBloc(
                  currentUserService: i.get<CurrentUserService>(),
                  screenBuilderService: i.get<ScreenBuilderService>()),
            ),
        isSingleton: true);

    // Request screen
    _injector.map<RequestScreenBuilder>(
        (i) => () => BlocProvider<RequestBloc>(
              child: RequestScreen(),
              bloc: RequestBloc(
                  screenBuilderService: i.get<ScreenBuilderService>(),
                  streamService: i.get<StreamService>(),
                  repository: i.get<Repository>(),
                  currentUserService: i.get<CurrentUserService>()),
            ),
        isSingleton: true);

    // Proposal screen
    _injector.map<ProposalScreenBuilder>(
        (i) => (String requestId) => BlocProvider<ProposalBloc>(
              child: ProposalScreen(),
              bloc: ProposalBloc(
                  requestId: requestId,
                  screenBuilderService: i.get<ScreenBuilderService>(),
                  streamService: i.get<StreamService>(),
                  repository: i.get<Repository>()),
            ),
        isSingleton: true);

    // Autoservice screen
    _injector.map<AutoserviceScreenBuilder>(
        (i) => (String requestId, String autoServiceId, int price) =>
            BlocProvider<AutoserviceBloc>(
              child: AutoserviceScreen(),
              bloc: AutoserviceBloc(
                  requestId: requestId,
                  autoServiceId: autoServiceId,
                  price: price,
                  screenBuilderService: i.get<ScreenBuilderService>(),
                  repository: i.get<Repository>()),
            ),
        isSingleton: true);

    // Location screen
    _injector.map<LocationScreenBuilder>(
        (i) => (AutoService autoService) => BlocProvider<LocationBloc>(
              child: LocationScreen(),
              bloc: LocationBloc(
                  autoService: autoService,
                  screenBuilderService: i.get<ScreenBuilderService>()),
            ),
        isSingleton: true);

    // Search screen
    _injector.map<SearchScreenBuilder>(
        (i) => () => BlocProvider<SearchBloc>(
              child: SearchScreen(),
              bloc: SearchBloc(
                  screenBuilderService: i.get<ScreenBuilderService>(),
                  streamService: i.get<StreamService>(),
                  currentUserService: i.get<CurrentUserService>()),
            ),
        isSingleton: true);

    // Profile screen
    _injector.map<ProfileScreenBuilder>(
        (i) => () => BlocProvider<ProfileBloc>(
              child: ProfileScreen(),
              bloc: ProfileBloc(
                  currentUserService: i.get<CurrentUserService>(),
                  screenBuilderService: i.get<ScreenBuilderService>(),
                  repository: i.get<Repository>()),
            ),
        isSingleton: true);
  }
}
