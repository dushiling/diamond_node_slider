# diamond_node_slider
1. The node is a diamond slider.The node can also be circular.
2. which can achieve two effects with transition value and no transition value. 
3. bubble displays its value, and the node text can not be displayed.

## 使用
```
          ///常用
           DiamondNodeSlisder((value) {
             print('value===${value}');
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




           ///最小值不为0
           DiamondNodeSlisder((value) {
             print('value===${value}');
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



           ///节点文字不显示
           DiamondNodeSlisder((value) {
               print('value===${value}');
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

    

           ///节点圆形、设置轨道高度
           DiamondNodeSlisder((value) {
             print('value===${value}');
           },
             activeTrackColor: Colors.orange,
             unActiveTrackColor: Color(0xFFEBEBEB),
             width: 300,
             height: 5,//轨道高度
             divisions: 4,
             maxValue: 120,
             minValue: 0,
             isRhombus: false,//非菱形
           ),

   

           ///直接跳到节点，无过渡
           DiamondNodeSlisder((value) {
             print('value===${value}');
           },
             activeTrackColor:  Colors.green,
             unActiveTrackColor: Color(0xFFEBEBEB),
             width: 300,
             height: 2.5,
             divisions: 5,
             maxValue: 150,
             minValue: 0,
             textUnitStr: 'm',
             toNodeBool: true,//滑动跳到节点
           ),          

```
## 效果
![diamond_node_slider](https://user-images.githubusercontent.com/13375221/196411667-8b846ad9-3237-43af-b64a-0b8a53bae173.gif)|


