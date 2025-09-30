import 'package:atvd_diego_map/map.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Mapa SP",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MapaSP(),
    );
  }
}
