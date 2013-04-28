package Utils
{
	import flash.display.Sprite;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.geom.Rectangle;
	
	import srollbar.IScrollView;
	
	public class LayoutPort extends Sprite implements IScrollView
	{
		public var rect:Rectangle;
		private var _minY:int;
		public function LayoutPort(rect:Rectangle)
		{
			this.rect = rect;
			this.scrollRect = rect;
		}
		public function set position(value:int):void{
			this.rect.y = value;
			this.scrollRect = rect;
		}
		public function get position():int{
			return this.scrollRect.y;
		}
		
		public function get contentTotalHeight():int{
			return Math.max(this.height,winHeight);
		}
		public function get winHeight():int{
			return this.scrollRect.height;
		}
		public function set minY(_minY:int):void{
			this._minY = _minY;
		}
		public function get minY():int{
			return _minY;
		}
	}
}