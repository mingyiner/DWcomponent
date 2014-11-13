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
		//先随机出所在规则矩形边缘的所有点
		private function randomPoint():Point {
			var minX:int = 10;
			var maxX:int = 300;
			var minY:int = 10;
			var maxY:int = 1
			var maxY:int = 180
			var p:Point = new Point;
			
			p.x = minX + Math.random() * (maxX - minX);
			p.y = minY + Math.random() * (maxY - minY);
			
			//特殊判断确保在不规则图形内部
			
			return p;
		}

		private function enterframeHandler(e:Event):void {
			if (randomPoint() != null) {
				//trace(randomPoint().x,randomPoint().y)
			}
			
		}
        //主分支上
		private function master_branch():void{
            trace("主分支modify");
            trace("aa breach modify this File");
            trace("");
        }
        private function aa_branch_test():void{
            trace("aa分支test");
        }
	}

}