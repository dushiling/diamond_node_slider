library diamond_node_slider;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class DiamondNodeSlisder extends StatefulWidget {

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

  final Function(int) valueChanged;


  DiamondNodeSlisder(this.valueChanged, {
    this.width = double.infinity,
    this.height = 2.5,
    this.unActiveTrackColor= const Color(0xFFEBEBEB),
    this.activeTrackColor= const Color(0xFF878E9A),
    this.divisions =4,
    this.maxValue,
    this.minValue = 0,
    this.textUnitStr = '',
    this.textShowBool = true,
    this.isRhombus = true,
    this.nodeWidth = 10,
    this.toNodeBool = false
  });

  @override
  State<DiamondNodeSlisder> createState() => _DiamondNodeSlisderState();
}

class _DiamondNodeSlisderState extends State<DiamondNodeSlisder> {
  double dx = 0;
  double maxX = 0;

  double value=0.0;//0-1
  bool bubbleShowBool=false;//气泡是否显示

  List list=[];//节点数组

  @override
  void initState() {
    super.initState();
    for(int i=0;i<widget.divisions+1;i++){
      list.add(i);
    }
  }


  @override
  Widget build(BuildContext context) {

    return Container(
      height: 50-(widget.textShowBool==false?15:0) ,
      width:  widget.width,
      // color: Colors.red,
      child:  GestureDetector(
        child: Stack(
          alignment: widget.textShowBool==false?Alignment.bottomCenter:Alignment.center,
          children: [

            //上部tips气泡文字
            bubbleShowBool?  Align(
              alignment: FractionalOffset(value, 0),
              child: Container(width: 40, height:  15,
                decoration: BoxDecoration(
                  color:widget.activeTrackColor,
                  borderRadius: BorderRadius.all(Radius.circular(20),),
                ),
                child: Text((int.parse((widget.maxValue!*value).toStringAsFixed(0))<=widget.minValue!)?'${widget.minValue}${widget.textUnitStr}':'${(widget.maxValue!*value).toStringAsFixed(0)}${widget.textUnitStr}',style: TextStyle(fontSize: 13,color: Colors.white),textAlign: TextAlign.center,),
              ),
            ):Container(),

            //slider
            Container(
              width:  widget.width ,
              height: widget.height ,
              margin: EdgeInsets.only(bottom: widget.textShowBool==false? 7.5 :0),
              decoration:  BoxDecoration(color: widget.unActiveTrackColor),
              child: CustomPaint(
                painter: SliderPainter((double maxDx) {
                  print('value ===${value}');//0-1的值
                  print('maxDx ===${maxDx}');//总长度
                  print('value * maxDx===${value * maxDx}');//划的长度

                  maxX = maxDx;
                  return value * maxDx;
                },
                    activeTrackColor: widget.activeTrackColor,
                    divisions: widget.divisions
                ),
              ),
            ),

            //节点
            Container(
                width:  widget.width,
                height:  widget.nodeWidth,
                margin: EdgeInsets.only( bottom: widget.textShowBool==false? 7.5-(widget.nodeWidth-widget.height)/2 : 0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: widget.nodeWidth, minHeight: widget.nodeWidth, maxWidth: widget.width),
                  child:  Wrap(
                    spacing: (widget.width-(widget.nodeWidth+0.15)*(widget.divisions+1)) / widget.divisions,//横向间距  10.15:  0.15作为误差
                    runSpacing: 0,//纵向间距
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children:list.map((valueS) {

                      int currentValue= int.parse((widget.maxValue!*value).toStringAsFixed(0));
                      int nodeValue= (widget.maxValue!/widget.divisions).toInt() * list.indexOf(valueS);

                      return  Transform.rotate(angle:math.pi / 4,  child: Container(
                        width:  widget.nodeWidth,
                        height: widget.nodeWidth,
                        decoration: BoxDecoration(
                          color:currentValue>=nodeValue ?  widget.activeTrackColor:  Colors.white,//背景色
                          border: new Border.all(
                            color: currentValue>=nodeValue ? Colors.white:  widget.unActiveTrackColor!, //边框颜色
                            width: 1, //边框宽度
                          ), // 边色与边宽度q
                          borderRadius: BorderRadius.circular(widget.isRhombus?2:widget.nodeWidth/2),//圆角弧度
                        ),
                        // transform: Matrix4.rotationZ(math.pi /4),
                      ));
                    }).toList(),
                  ),
                )
            ),

            //滑块
            Align(
              alignment: FractionalOffset(value, widget.textShowBool==false? 1: 0.5),
              child:  Transform.rotate(angle: math.pi / 4, child:

              Container(width: widget.nodeWidth+2.5, height:  widget.nodeWidth+2.5,
                margin: EdgeInsets.only( bottom: widget.textShowBool==false? 5/2 : 0),
                decoration: BoxDecoration(
                  color:value<=0&&widget.minValue!<=0? Colors.white : widget.activeTrackColor,
                  border: new Border.all(
                    color: value<=0&&widget.minValue!<=0? widget.activeTrackColor!:  Colors.white, //边框颜色
                    width: value<=0&&widget.minValue!<=0? 1.5:1, //边框宽度
                  ), // 边色与边宽度
                  borderRadius: BorderRadius.circular(widget.isRhombus?2:(widget.nodeWidth+2.5)/2),
                ),
                alignment: Alignment.center,
              )
              ),

            ),

            //节点文字
            widget.textShowBool? Positioned(
                bottom: 3,
                child: Container(
                  width: widget.width,
                  height: widget.height+8,
                  // decoration: BoxDecoration(color: Colors.pink[300]),
                  child: CustomPaint(
                    painter: SliderPainter2(
                        widget.maxValue!,
                        widget.minValue!,
                        divisions: widget.divisions,
                        textUnitStr: widget.textUnitStr
                    ),
                  ),
                )):Container(),

          ],
        ),

        onTapDown: (details) {
          updateDx(getPoint(context, details.globalPosition),true);

        },
        onTapUp: (details) {
          setValue(true,false);

        },
        onPanUpdate: (details){
          updateDx(getPoint(context, details.globalPosition),true);

        },
        onPanEnd: (details){
          setValue(true,false);

        },
      )
      ,
    );
  }

  Offset getPoint(BuildContext context, Offset globalPosition) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    return renderBox.globalToLocal(globalPosition);
  }

  void updateDx(Offset value,bool bubbleShowBool) {

    dx = value.dx;

    dx = dx < 0 ? 0 : dx;
    dx = dx > maxX ? maxX : dx;


    setValue(false,bubbleShowBool);
  }

  void setValue(bool isEnd,bool bubbleShow) {
    //更新value值
    setState(() {
      value = dx/maxX;;//0-1


      if(widget.toNodeBool){
        gotoNode();//直接到节点
      }

      bubbleShowBool=bubbleShow;//气泡是否显示
    });

    //回调滑竿值
    widget.valueChanged( int.parse(((dx/maxX)* widget.maxValue!).toStringAsFixed(0)) );//值 取整数
  }


  //直接跳到节点，无过渡
  void gotoNode(){
    int precent=int.parse(((dx/maxX)* widget.maxValue!).toStringAsFixed(0));

    double divisionsV=widget.maxValue!/widget.divisions;//100/4/100=0.25
    print('precent===$precent');
    print('divisionsV===$divisionsV');

    if (0<precent  && precent<= divisionsV*1){
      value=divisionsV*1/widget.maxValue!;
    }else if(divisionsV*1 <precent && precent<= divisionsV*2 ){
      value=divisionsV*2/widget.maxValue!;
    }else if(divisionsV*2 <precent && precent<= divisionsV*3 ){
      value=divisionsV*3/widget.maxValue!;
    }else if(divisionsV*3 <precent && precent<= divisionsV*4 ){
      value=divisionsV*4/widget.maxValue!;
    }else if(divisionsV*4 <precent && precent<= divisionsV*5 ){
      value=divisionsV*5/widget.maxValue!;
    } else if(divisionsV*5 <value && value<= divisionsV*6 ){
      value=divisionsV*6/widget.maxValue!;
    }else if(divisionsV*6 <value && value<= divisionsV*7 ){
      value=divisionsV*7/widget.maxValue!;
    }else if(divisionsV*7 <value && value<= divisionsV*8 ){
      value=divisionsV*8/widget.maxValue!;
    }else if(divisionsV*8 <value && value<= divisionsV*9 ){
      value=divisionsV*9/widget.maxValue!;
    }else if(divisionsV*9 <value && value<= divisionsV*10 ){
      value=divisionsV*10/widget.maxValue!;
    }
  }
}




///slider通道
class SliderPainter extends CustomPainter {

  final Color? activeTrackColor;

  final double Function(double maxDx) getDx;
  final int divisions;


  SliderPainter(this.getDx, {
    this.activeTrackColor,
    this.divisions =4,
  });

  // 初始化画笔
  var lineP = Paint()
    ..strokeCap = StrokeCap.butt;


  @override
  void paint(Canvas canvas, Size size) {
    double width =  size.width;
    double height = size.height;

    //背景线Paint
    lineP.strokeWidth = height;
    lineP.color = this.activeTrackColor ?? Colors.grey;


    double dx = getDx(width);
    Offset endPoint = Offset.zero;

    double centerW = height / 2;

    // 通过canvas画线
    endPoint = Offset(dx, centerW);
    canvas.drawLine(Offset(0, centerW), endPoint, lineP);


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}


///节点文字
class SliderPainter2 extends CustomPainter {

  final int maxValue;
  final int minValue;
  final int divisions;
  final String textUnitStr;

  SliderPainter2(this.maxValue,this.minValue, {this.divisions =4,this.textUnitStr =''});


  @override
  void paint(Canvas canvas2, Size size) {
    double width =  size.width;
    double height =  size.height;


    //画文字
    for(int i=0;i<=divisions;i++){


      //minValue  如果有最小值，则首位显示最小值  其他 显示节点值   textUnitStr：单位 %、x等
      String textStr= (minValue>0&&i==0)?'${minValue.toStringAsFixed(0)}${textUnitStr}': '${((maxValue)/divisions * i).toStringAsFixed(0)}${textUnitStr}';
      print('textStr===${textStr}');


      TextPainter textPainter =TextPainter();
      final TextSpan textSpan = TextSpan(
        text: textStr,
        style:TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: Color(0xFF878E9A)),
      );
      textPainter.text = textSpan;
      textPainter.textDirection = i==divisions?TextDirection.rtl:TextDirection.ltr;
      textPainter.textAlign = i==divisions?TextAlign.end:TextAlign.center;
      textPainter.layout(maxWidth: 35);

      //文字位移宽度： 前移本身长度的1/2
      double space =  i==0 ? 0: (i== divisions ? -textPainter.width : -(textPainter.width/2)); //textPainter.width: 文字长度

      textPainter.paint(canvas2,Offset(i*(width/divisions)+ space, 0),);

    }

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}




