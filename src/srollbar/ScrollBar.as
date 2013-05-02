package srollbar
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.utils.clearInterval;
	import flash.utils.clearTimeout;
	import flash.utils.setInterval;
	import flash.utils.setTimeout;
	
	public class ScrollBar extends Sprite
	{ 
		/**
		 * 一次滚动的距离 
		 */		
		public var scrollUnit:int;
		
		/**
		 * 内容区域
		 */
		public var content:IScrollView;
		/**
		 * 内容区域的最小位置
		 */		
		public var contentMinPositionY:Number;
		/**
		 * 内容区域的最大位置
		 */		
		public var contentMaxPostionY:Number;

		/**
		 * 滑块的最小位置
		 */		
		public var thumbMinY:Number;
		/**
		 * 滑块的最大位置
		 */		
		public var thumbMaxY:Number;
		
		/**
		 *滑块可以滚动的Y轴距离
		 */		
		public var thumbCanScrollY:Number;
		
		/**
		 * 滑道
		 */		
		public var track:MovieClip;
		public var thumbButton:MovieClip;
		public var upButton:MovieClip;
		public var downButton:MovieClip;
		
		private static const UP:int = 0;
		private static const DOWN:int = 1;
		private var direct:int = 1;
		private var tid:int;
		private var ui:MovieClip;
		private var isButtonDown:Boolean;
		public function ScrollBar(ui:MovieClip)
		{
			super();
			this.thumbButton = ui.thumbButton;
			this.upButton = ui.upButton;
			this.downButton = ui.downButton;
			this.track = ui.trackMc;
			this.ui = ui;
			initListener()
		}
		
		private function initListener():void
		{
			thumbButton.addEventListener(MouseEvent.MOUSE_DOWN,thumbDownHandler);
			upButton.addEventListener(MouseEvent.MOUSE_DOWN,onUpOrDownBtnDownHandler);
			downButton.addEventListener(MouseEvent.MOUSE_DOWN,onUpOrDownBtnDownHandler);
		}
		
		protected function thumbDownHandler(event:MouseEvent):void
		{
			var thumbY:int;
			//拖动
			thumbButton.startDrag(false,new Rectangle((track.width - thumbButton.width)/2,thumbMinY,0,thumbCanScrollY));
			ui.stage.addEventListener(MouseEvent.MOUSE_UP,upHandler);
			ui.stage.addEventListener(MouseEvent.MOUSE_MOVE,moveHandler);
			function upHandler(e:MouseEvent):void{
				thumbButton.stopDrag();
				ui.stage.removeEventListener(MouseEvent.MOUSE_UP,upHandler);
				ui.stage.removeEventListener(MouseEvent.MOUSE_MOVE,moveHandler);
			}
			function moveHandler(e:MouseEvent):void{
				var ty:int = int(thumbButton.y);
				//更新 content
				content.position = (contentMaxPostionY - contentMinPositionY)*(ty - thumbMinY)/(thumbMaxY-thumbMinY);
			}
		}
		
		protected function onUpOrDownBtnDownHandler(event:MouseEvent):void
		{
			if(event.currentTarget == upButton){
				this.direct = UP;
			}
			if(event.currentTarget == downButton){
				this.direct = DOWN;
			}
			isButtonDown = true;
			doScroll();
			var aa:int = setTimeout(function():void{
				clearTimeout(aa);
				continueScroll();
			},500);
			
			ui.stage.addEventListener(MouseEvent.MOUSE_UP,function(event:MouseEvent):void{
				event.currentTarget.removeEventListener(event.type,arguments.callee);
				isButtonDown = false;
				clearInterval(tid);
				clearTimeout(aa);
			});
		}
		private function continueScroll():void{
			tid = setInterval(doScroll,50);
		}
		private function doScroll():void
		{
			if(!isButtonDown){
				return;
			}
			//如果向上滚动
			if(direct == UP && isButtonDown){
				//内容区域 位置 更新
				content.position -= scrollUnit;
				//判断是否越界
				content.position = Math.max(content.position,contentMinPositionY);
			}
			//向下滚动
			if(direct == DOWN && isButtonDown){
				content.position += scrollUnit;
				content.position = Math.min(content.position,contentMaxPostionY);
			}
			//更新滑块
			upDataThumbPostion();
			trace("执行到这儿了");
		}
		
		public function setContent(value:IScrollView,unit:int):void{
			this.content = value;
			this.scrollUnit = unit;
			//更新内容的位置
			getContentY();
		}
		private function getContentY():void{
			contentMaxPostionY = content.contentTotalHeight - content.winHeight;
			contentMinPositionY = content.minY;
			contentMaxPostionY = Math.max(contentMaxPostionY,contentMinPositionY);
			
			upDate();
		}
		public function upDate():void{
			upDateButtonYAndThumb();
			upDateHeight();
			thumbGotoFirst()
		}
		public function upDateHeight():void{
			if(content.contentTotalHeight <= content.winHeight){
				this.ui.visible = false;
				content.position = 0;
			}else{
				this.ui.visible = true;
				//计算滑块的高 
				var thumbH:int = thumbCanScrollY*content.winHeight/content.contentTotalHeight;
				//滑块高  最小是15
				thumbH = Math.max(thumbH,15);
				updateThumbHeight(thumbH);
				if(content.position > contentMaxPostionY){
					thumbGotoEnd();
				}
			}
		}
		//设置滚动条的高
		override public function set height(value:Number):void{
			track.height = value;
			//摆放上下按钮的位置  及滑块的范围
			upDate();
		}
		
		private function upDateButtonYAndThumb():void
		{
			downButton.y = track.height - downButton.height;
			thumbCanScrollY = track.height - downButton.height - upButton.height - thumbButton.height;
			
			thumbMaxY = track.height - downButton.height-thumbButton.height;
			thumbMinY = upButton.height;
		}
		private function upDataThumbPostion():void{
			var thumbY:int = thumbMinY+(thumbMaxY - thumbMinY)*content.position/(contentMaxPostionY - contentMinPositionY);
			thumbButton.y = Math.min(Math.max(thumbY,thumbMinY),thumbMaxY);
		}
		
		private function thumbGotoFirst():void{
			thumbButton.y = thumbMinY;
			content.position = contentMinPositionY;
		}
		private function thumbGotoEnd():void{
			thumbButton.y = thumbMaxY;
			content.position =contentMaxPostionY;
		}
		private function updateThumbHeight(h:int):void{
			this.thumbButton.height = h;
			upDateButtonYAndThumb();
		}
	}
	
}