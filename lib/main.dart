
import 'package:avtoservicelocator/di/di_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fimber/flutter_fimber.dart';

void main() {
  Fimber.plantTree(FimberTree()); // initialize logger
  DiContainer.initialize(); // initialize DI
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AvtoService Locator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DiContainer.getStartupScreen());
}