package  
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author dangww
	 */
	public class MainTest extends Sprite 
	{
		private var rectMc:MovieClip;
				var minX:int = 470;
			var maxX:int = 840;
			var minY:int = 460;
			var maxY:int = 600
			private var pointArr:Array=[{x:370,y:160},{x:540,y:160},{x:170,y:270},{x:470,y:300}]

		public function MainTest() 
		{
			super();
			//绘制矩形
			rectMc = new MovieClip();
			rectMc.graphics.clear();
			rectMc.graphics.beginFill(0x000000,1);

			rectMc.graphics.lineStyle(1);
			rectMc.graphics.moveTo(10, 100);
			rectMc.graphics.lineTo(100, 10);
			rectMc.graphics.lineTo(300, 120);
			rectMc.graphics.lineTo(100, 180);
			rectMc.graphics.lineTo(10, 100);
			rectMc.graphics.endFill();
			addChild(rectMc);
		
			addEventListener(Event.ENTER_FRAME,enterframeHandler)
		}
		private function randomPoint():Point {
			var minX:int = 10;
			var maxX:int = 300;
			var minY:int = 10;
<<<<<<< HEAD
			var maxY:int = 1
=======
			var maxY:int = 180
>>>>>>> 53c55d0... fenzhi
			var p:Point = new Point;
			p.x = minX + Math.random() * (maxX - minX);
			p.y = minY + Math.random() * (maxY - minY);
			
			if (rectMc.hitTestPoint(p.x,p.y)) {
				return p
			}
			return null;
			
		}
		private function enterframeHandler(e:Event):void {
			if (randomPoint() != null) {
				trace(randomPoint().x,randomPoint().y)
			}
			
		}
		
	}

}