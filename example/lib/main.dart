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

  int _currentValue=0;
  double _ratioValue = 0.0;
  int sliderMaxValue=20;
  int sliderMinValue=0;

  TextEditingController leverController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _currentValue = 10;  //输入框 初始值
    _ratioValue = _currentValue/sliderMaxValue;//  10/20

    leverController.text='${_currentValue}x';//给输入框赋值
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///常用
            DiamondNodeSlisder(
              activeTrackColor: Color(0xFF878E9A),
              unActiveTrackColor: Color(0xFFEBEBEB),
              width: 300.0,
              height: 2.5,
              divisions: 4,
              maxValue: 100,
              minValue: 0,
              textUnitStr: '%',
              valueChanged:(value,ratioV) {
                print('value===$value');
              },
            ),

            SizedBox(height: 30),

            ///最小值不为0
            DiamondNodeSlisder(
              activeTrackColor: Colors.red,
              unActiveTrackColor: Color(0xFFEBEBEB),
              width: 300.0,
              height: 2.5,
              divisions: 5,
              maxValue: 125,
              minValue: 1,
              textUnitStr: 'x',
              valueChanged:(value,ratioV) {
                print('value===$value');
              },
            ),

            SizedBox(height: 30),

            ///节点文字不显示
            DiamondNodeSlisder(
              activeTrackColor: Colors.blue,
              unActiveTrackColor: Color(0xFFEBEBEB),
              width: 300.0,
              height: 2.5,
              divisions: 4,
              maxValue: 80,
              minValue: 0,
              textShowBool: false,
              valueChanged:(value,ratioV) {
                print('value===$value');
              },
            ),

            SizedBox(height: 30),

            ///节点圆形、设置轨道高度
            DiamondNodeSlisder(
              activeTrackColor: Colors.orange,
              unActiveTrackColor: Color(0xFFEBEBEB),
              width: 300.0,
              height: 5, //轨道高度
              nodeWidth: 15, //节点宽高
              divisions: 4,
              maxValue: 120,
              minValue: 0,
              isRhombus: false, //非菱形
              valueChanged:(value,ratioV) {
                print('value===$value');
              },
            ),

            SizedBox(height: 30),

            ///直接跳到节点，无过渡
            DiamondNodeSlisder(
              activeTrackColor: Colors.green,
              unActiveTrackColor: Color(0xFFEBEBEB),
              width: 300.0,
              height: 2.5,
              divisions: 5,
              maxValue: 150,
              minValue: 0,
              textUnitStr: 'm',
              toNodeBool: true,
              valueChanged:(value,ratioV) {
                print('value===$value');
              },
            ),


            /*********************************************************************/

            SizedBox(height: 30),
            //输入框、加减号
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    child: Text('-',style: TextStyle(fontSize: 30)),
                    onPressed: (){
                      if(_currentValue>sliderMinValue) {
                        _currentValue--;
                        leverController.text='${_currentValue}x';//更新输入框值
                        _ratioValue = _currentValue.toDouble() / sliderMaxValue;//更新slider进度值
                        setState(() {});
                      }
                    }
                ),
                Container(
                  width: 200,
                  height: 40,
                  decoration: BoxDecoration(
                      color:  Colors.grey[100],
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      border:  Border.all(width:1,color: Color(0xFFAEB4BB))
                  ),
                  child: TextField(
                    controller: leverController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintText: '杠杆值',
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey)
                    ),
                    onChanged: (V){
                      if(V==''){
                        _currentValue=0;
                        leverController.text='${0}x';//更新输入框值
                        _ratioValue = 0.0 / sliderMaxValue;//更新slider进度值
                        setState(() {});
                      }
                    },
                  ),
                ),
                TextButton(
                  child: Text('+',style: TextStyle(fontSize: 30)),
                  onPressed: (){
                    if(_currentValue<sliderMaxValue){

                      _currentValue++;
                      leverController.text='${_currentValue}x';//更新输入框值
                      _ratioValue=_currentValue.toDouble()/sliderMaxValue;//更新slider进度值
                      setState(() {});
                    }
                  },
                ),
              ],
            ),


            ///有初始值
            DiamondNodeSlisder(
              ratioValue: _ratioValue,
              activeTrackColor: Color(0xFF878E9A),
              unActiveTrackColor: Color(0xFFEBEBEB),
              width: 300.0,
              height: 2.5,
              divisions: 4,
              maxValue: sliderMaxValue,
              minValue: sliderMinValue,
              textUnitStr: 'x',
              valueChanged:(value,ratioV) {

                setState(() {
                  _currentValue=  value;
                  print('_currentValue===$_currentValue');

                  _ratioValue = ratioV;
                  print('ratioV===$_ratioValue');

                  //输入框赋值
                  leverController.text='${value}x';
                });
              },
            ),

          ],
        ),
      ),
    );
  }
}
