import 'package:diamond_node_slider/diamond_node_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SliderHomePage(),
    );
  }
}

class SliderHomePage extends StatefulWidget {
  const SliderHomePage({Key? key}) : super(key: key);

  @override
  State<SliderHomePage> createState() => _SliderHomePageState();
}

class _SliderHomePageState extends State<SliderHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///常用
            DiamondNodeSlisder(
              (value) {
                print('value===$value');
              },
              activeTrackColor: Color(0xFF878E9A),
              unActiveTrackColor: Color(0xFFEBEBEB),
              width: 300.0,
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
              width: 300.0,
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
              width: 300.0,
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
              width: 300.0,
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
              width: 300.0,
              height: 2.5,
              divisions: 5,
              maxValue: 150,
              minValue: 0,
              textUnitStr: 'm',
              toNodeBool: true,
            ),
          ],
        ),
      ),
    );
  }
}
