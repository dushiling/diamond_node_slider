import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:diamond_node_slider/diamond_node_slider.dart';

void main() {
  test('adds one to input values', () {});

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ///常用
          DiamondNodeSlisder(
            (value) {
              print('value===$value');
            },
            activeTrackColor: Color(0xFF878E9A),
            unActiveTrackColor: Color(0xFFEBEBEB),
            width: 300,
            height: 2.5,
            divisions: 4,
            maxValue: 100,
            minValue: 0,
            textUnitStr: '%',
          ),

          SizedBox(height: 30),

          ///最小值不为0
          DiamondNodeSlisder(
            (value) {
              print('value===$value');
            },
            activeTrackColor: Colors.red,
            unActiveTrackColor: Color(0xFFEBEBEB),
            width: 300,
            height: 2.5,
            divisions: 5,
            maxValue: 125,
            minValue: 1,
            textUnitStr: 'x',
          ),

          SizedBox(height: 30),

          ///节点文字不显示
          DiamondNodeSlisder(
            (value) {
              print('value===$value');
            },
            activeTrackColor: Colors.blue,
            unActiveTrackColor: Color(0xFFEBEBEB),
            width: 300,
            height: 2.5,
            divisions: 4,
            maxValue: 80,
            minValue: 0,
            textShowBool: false,
          ),

          SizedBox(height: 30),

          ///节点圆形、设置轨道高度
          DiamondNodeSlisder(
            (value) {
              print('value===$value');
            },
            activeTrackColor: Colors.orange,
            unActiveTrackColor: Color(0xFFEBEBEB),
            width: 300,
            height: 5, //轨道高度
            divisions: 4,
            maxValue: 120,
            minValue: 0,
            isRhombus: false, //非菱形
          ),

          SizedBox(height: 30),

          ///直接跳到节点，无过渡
          DiamondNodeSlisder(
            (value) {
              print('value===$value');
            },
            activeTrackColor: Colors.green,
            unActiveTrackColor: Color(0xFFEBEBEB),
            width: 300,
            height: 2.5,
            divisions: 5,
            maxValue: 150,
            minValue: 0,
            textUnitStr: 'm',
            toNodeBool: true,
          ),
        ],
      ),
    );
  }
}
