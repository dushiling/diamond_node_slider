# diamond_node_slider
1. 该节点是菱形滑块。该节点也可以是圆形的.
2. 可以实现有过渡值和无过渡值两种效果.
3. 气泡显示其值，节点底部文本可选择显示或不展示.
4. 可与其配置初始值

## 使用
```
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

```
## 效果
![diamond_node_slider](https://user-images.githubusercontent.com/13375221/196411667-8b846ad9-3237-43af-b64a-0b8a53bae173.gif)|![diamond_node_slider2](https://upload-images.jianshu.io/upload_images/4886952-739a448eafdcc6ba.gif?imageMogr2/auto-orient/strip)
|--|--|

## 参数说明
```
 final double width;//长度
 final double height;//高度

 final int? maxValue;//最大值
 final int? minValue;//最小值

 final int divisions;//段数

 final Color?  unActiveTrackColor;//不活跃颜色
 final Color?  activeTrackColor;//活跃颜色

 final String textUnitStr;//文字单位：%、x等
 final bool textShowBool;//是否显示节点下的文字

 final double nodeWidth;//节点宽高
 final bool isRhombus;//true:菱形（默认） false：圆形
 final bool toNodeBool;//滑动直接跳到节点，无过渡
 
  final double? ratioValue; //百分率，范围:0-1,  初始值/ maxValue

 final Function(int) valueChanged;//回调slider值
```

