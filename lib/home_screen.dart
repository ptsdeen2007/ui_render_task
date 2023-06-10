import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:ui_render_task/app_const.dart';
import 'package:ui_render_task/second_screen.dart';

import 'Util.dart';
import 'main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var registry=JsonWidgetRegistry.instance;
  @override
  void initState() {
    registry.registerFunction('navigatePage', ({args, required registry}) async {
      await navigatorKey.currentState!.push(
        MaterialPageRoute(
          builder: (BuildContext context) => SecondScreen(
          ),
        ),
      );
    });
    super.initState();

  }
  
  @override
  Widget build(BuildContext context) {
    var map = jsonDecode(AppConst.jsonData);
    var convertedMap=convertTypeValuesToSnakeCase(map);
    print("Converted Map ${json.encode(convertedMap)}");
    var widget=JsonWidgetData.fromDynamic(convertedMap,registry: registry);
    return Scaffold(
      appBar: AppBar(title: Text("Test")),
      body: widget!.build(context: context),
    );
  }
}
