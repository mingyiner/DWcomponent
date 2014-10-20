package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	public class Test3 extends Sprite
	{
		private var circle:Sprite
		public function Test3()
		{
			circle = new Sprite();
			circle.graphics.beginFill(0xFFCC00);
			circle.graphics.drawCircle(200, 200, 200);
			circle.scrollRect = new Rectangle(0, 0, 200, 200);
			addChild(circle);
			
//			circle.addEventListener(MouseEvent.CLICK, clicked);
			
			circle.addEventListener(MouseEvent.MOUSE_DOWN,downHandler);

		}
		private function downHandler(e:MouseEvent):void
		{
			_startPoint.x = mouseX;
			_startPoint.y = mouseY;
			circle.addEventListener(MouseEvent.MOUSE_MOVE,moveHandler);
			circle.addEventListener(MouseEvent.MOUSE_UP,upHandler);
			circle.addEventListener(MouseEvent.MOUSE_OUT,outHandler);
		}
		private function outHandler(e:MouseEvent):void
		{
			this.circle.removeEventListener(MouseEvent.MOUSE_MOVE,moveHandler);
			this.circle.removeEventListener(MouseEvent.MOUSE_UP,upHandler);
			this.circle.removeEventListener(MouseEvent.MOUSE_OUT,outHandler);
		}
		private function upHandler(e:MouseEvent):void
		{
			this.circle.removeEventListener(MouseEvent.MOUSE_MOVE,moveHandler);
			this.circle.removeEventListener(MouseEvent.MOUSE_UP,upHandler);
			this.circle.removeEventListener(MouseEvent.MOUSE_OUT,outHandler);
		}
		private var _startPoint:Point = new Point();
		private var _currPoint:Point = new Point();
		
		private function moveHandler(e:MouseEvent):void
		{
			_currPoint.x = mouseX;
			_currPoint.y = mouseY;

			var vx:Number = _currPoint.x - _startPoint.x;
			var vy:Number = _currPoint.y - _startPoint.y;
			var rect:Rectangle = e.target.scrollRect;
			trace(vy, rect.y, circle.y)
			if ((rect.y <=0 && vy >0 )|| (rect.y >=200 && vy < 0)) {
				vy = 0
			}
			rect.y -= vy;

			e.target.scrollRect = rect;
			_startPoint.x = mouseX;
			_startPoint.y = mouseY;
		}
	}
}