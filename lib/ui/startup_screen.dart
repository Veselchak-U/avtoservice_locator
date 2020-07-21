import 'package:avtoservicelocator/bloc/common/bloc_provider.dart';
import 'package:avtoservicelocator/bloc/startup_bloc.dart';
import 'package:flutter/material.dart';

class StartupScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen> {
  StartupBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of(context);
    _bloc.context = context;
  }

  @override
  Widget build(BuildContext context) => Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 1.0],
                colors: [Colors.redAccent, Colors.yellowAccent],
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Auto Service\nLocator',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none),
                ),
              ],
            ),
          ),
          FutureBuilder<bool>(
            future: _bloc.isRepoInit,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data) {
                Future.microtask(() => _bloc.gotoNextScreen());
              }
              return Align(
                  alignment: Alignment(0.0, 0.3),
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ));
            },
          ),
        ],
      );
}
