package
{
 import flash.display.MovieClip;
 import flash.display.Shape;
 public class main2 extends MovieClip
 {
  //第一条线段；
  private var line1:Array = [ { x:200, y:100 }, { x:100, y:120 }];
  //第二条线段；
  private var line2:Array = [ { x:200, y:100 }, { x:290, y:200 } ];
  private var myShape:Shape = new Shape();
  
  public function main2()
  {
   drawLine(line1[0], line1[1]);
   drawLine(line2[0], line2[1]);
   //
   var myside:Number = tgFun(line1[0], line1[1], line2[0]) * tgFun(line1[0], line1[1], line2[1]);
   var myside2:Number = tgFun(line2[0], line2[1], line1[0]) * tgFun(line2[0], line2[1], line1[1]);
   trace(myside,myside2);
   if (myside<=0 && myside2<=0)
   {
    trace('intersect');
   }else
   {
    trace('no');
   }
  }
  
  //tg的差值；
  private function tgFun(p1:Object, p2:Object,p:Object):Number
  {
   //var tg:Number = (p.x - p1.x) / (p.y - p1.y) - (p2.x - p1.x) / (p2.y - p1.y);
   var tg:Number = (p.x - p1.x) * (p2.y - p1.y) - (p2.x - p1.x) * (p.y - p1.y);
   return tg;
  }
  //画出一条线段的函数；
  private function drawLine(p1:Object,p2:Object):void
  {
   myShape.graphics.lineStyle(2, 0x990000, .75);
   myShape.graphics.moveTo(p1.x, p1.y);
            myShape.graphics.lineTo(p2.x, p2.y);
   addChild(myShape);
  }
 }
}
第二种方法我自己瞎想的，感觉比第一种方法更好理解，姑且称之为：单纯长度计算法。
这种方法是根据三角形的两边和大于第三边来求证的，比第一种方法好理解。四个点能产生（4-1）！=6个线段，这是三对。三对中的相交的线段和必然也是分别大于等于另两组线段和，并且相交的线段和的二倍必然也是大于等于两组线段和。
 
package
{
 import flash.display.MovieClip;
 import flash.display.Shape;
 public class main extends MovieClip
 {
  //第一条线段；
  private var line1:Array = [ { x:100, y:100 },{ x:160, y:110 }  ];
  //第二条线段；
  private var line2:Array = [ { x:100, y:110 },{ x:160, y:100 } ];
  private var longArr:Array = new Array();
  private var long:Number;
  private var myShape:Shape = new Shape();
  
  public function main()
  {
   drawLine(line1[0], line1[1]);
   drawLine(line2[0], line2[1]);
   //求出每条线段长度，并放入数组，前两个是你画出的，后面四个是辅助计算的
   everylong();
   //计算两线段是否相交？
   //这个值决定了是否有相交的可能？
   var myTrue:Number = (longArr[0] + longArr[1]) * 2 - (longArr[2]+longArr[3]+longArr[4]+longArr[5]);
      //这个值决定了是否是否是相交的那组线？
   var my1:Number = (longArr[0] + longArr[1]) - (longArr[2] + longArr[3]);
      var my2:Number = (longArr[0] + longArr[1]) - (longArr[4] + longArr[5]);
   trace("--------------", myTrue);
   if (myTrue >= 0 && my1 >= 0 && my2 >= 0 )
   {
    trace('intersect ')
   }else
   {
    trace('not intersect ')
   }
  }
  
  //画出一条线段的函数；
  private function drawLine(p1:Object,p2:Object):void
  {
   myShape.graphics.lineStyle(2, 0x990000, .75);
   myShape.graphics.moveTo(p1.x, p1.y);
            myShape.graphics.lineTo(p2.x, p2.y);
   addChild(myShape);
  }
  //求线段长度；
  private function longFun(p1:Object, p2:Object):Number
  {
   var mylong:Number = Math.sqrt(Math.pow((p1.x - p2.x), 2) + Math.pow((p1.y - p2.y), 2));
   return mylong;
  }
  //计算每个线段的长度；（4-1）！=6，即四个点产生了六条线段；
  private function everylong():void
  {
   long = longFun(line1[0], line1[1]);
   longArr.push(long);
   long = longFun(line2[0], line2[1]);
   longArr.push(long);
   //第二组
   long = longFun(line1[0], line2[0]);
   longArr.push(long);
   long = longFun(line1[1], line2[1]);
   longArr.push(long);
   //第三组
   long = longFun(line1[1], line2[0]);
   longArr.push(long);
   long = longFun(line1[0], line2[1]);
   longArr.push(long);
   trace(longArr);
  }
 }
}
把上面的源码，在文档类写上类名即可运行。