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
		public var scrollUnit:Number
		
		/**
		 * 内容区域
		 */
		public var content:DisplayObjectContainer;
		/**
		 * 内容区域的总高
		 */
		public var contentTotalHeight:Number;
		/**
		 * 内容区域  需要显窗口的高
		 */
		public var windowHeight:Number
		/**
		 *内容区域的位置  
		 */		
		public var contentPositionY:Number;
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
		public var upButton:SimpleButton;
		public var downButton:SimpleButton;
		
		private static const UP:int = 0;
		private static const DOWN:int = 1;
		private var direct:int = 1;
		private var tid:int;
		public function ScrollBar()
		{
			super();
			initListener()
		}
		
		private function initListener():void
		{
			thumbButton.addEventListener(MouseEvent.CLICK,thumbClickHandler);
			upButton.addEventListener(MouseEvent.MOUSE_DOWN,onUpOrDownBtnDownHandler);
			downButton.addEventListener(MouseEvent.MOUSE_DOWN,onUpOrDownBtnDownHandler);
		}
		
		protected function thumbClickHandler(event:MouseEvent):void
		{
			var thumbY:int;
			//拖动
			thumbButton.startDrag(false,new Rectangle((track.width - thumbButton.width)/2,thumbMinY,0,thumbCanScrollY);
			stage.addEventListener(MouseEvent.MOUSE_UP,upHandler);
			stage.addEventListener(MouseEvent.MOUSE_MOVE,moveHandler);
			function upHandler(e:MouseEvent):void{
				thumbButton.stopDrag();
				stage.removeEventListener(MouseEvent.MOUSE_UP,upHandler);
				stage.removeEventListener(MouseEvent.MOUSE_MOVE,moveHandler);
			}
			function moveHandler(e:MouseEvent):void{
				var ty:int = int(thumbButton.y);
				//更新 content
				contentPositionY = (contentMaxPostionY - contentMinPositionY)*(ty - thumbMinY)/(thumbMaxY-thumbMinY);
			}
		}
		
		protected function onUpOrDownBtnDownHandler(event:MouseEvent):void
		{
			if(event.currentTarget == upButton){
				this.direct = UP;
				var tid:int = setTimeout(function():void{
					clearTimeout(tid);
					continueScroll();
				},500);
			}
			if(event.currentTarget == downButton){
				this.direct = DOWN;
			}
			stage.addEventListener(MouseEvent.MOUSE_UP,function():void{
				clearInterval(tid);
			});
			//开始滚动
			doScroll()
		}
		private function continueScroll():void{
			tid = setInterval(doScroll,50);
		}
		private function doScroll():void
		{
			//如果向上滚动
			if(direct == UP){
				//内容区域 位置 更新
				contentPositionY -= scrollUnit;
				//判断是否越界
				contentPositionY = Math.min(contentPositionY,contentMinPositionY);
			}
			//向下滚动
			if(direct == DOWN){
				contentPositionY += scrollUnit;
				contentPositionY = Math.min(contentPositionY,contentMaxPostionY);
			}
			//更新滑块
			upDataThumbPostion();
		}
		
		public function setContent(value:DisplayObjectContainer):void{
			this.content = value;
			//更新内容的位置
			getContentY();
		}
		private function getContentY():void{
			contentMaxPostionY = contentTotalHeight - windowHeight;
			contentMinPositionY = 0;
		}
		public function upDateContentPosition():void{
			
		}
		public function upDateThumbPostion():void{
			
		}
		public function upDate():void{
			upDateHeight();
			
		}
		public function upDateHeight():void{
			if(contentTotalHeight <= windowHeight){
				this.visible = false;
				contentPositionY = 0;
			}else{
				this.visible = true;
				//计算滑块的高 
				var thumbH:int = thumbCanScrollY*windowHeight/contentTotalHeight;
				//滑块高  最小是15
				thumbH = Math.max(thumbH,15);
			}
		}
		//设置滚动条的高
		override public function set height(value:int):void{
			track.height = value;
			//摆放上下按钮的位置  及滑块的范围
			upDateButtonYAndThumb();
			upDate();
		}
		
		private function upDateButtonYAndThumb():void
		{
			downButton.y = track.height - downButton.height;
			thumbCanScrollY = track.height - downButton.height - upButton.height;
			
			thumbMaxY = track.height - downButton.height-thumbButton.height;
			thumbMinY = upButton.height;
		}
		private function upDataThumbPostion():void{
			var thumbY:int = (thumbMaxY - thumbMinY)*contentPositionY/(contentMaxPostionY - contentMinPositionY);
			thumbButton.y = Math.max(Math.min(thumbY,thumbMinY));
		}
	}
	
}