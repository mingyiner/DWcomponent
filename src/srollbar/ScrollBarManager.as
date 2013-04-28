package srollbar
{
	import Utils.LayoutPort;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.geom.Rectangle;

	/**
	 *滚动管理 
	 * @author dangweiwei
	 * 
	 */	
	public class ScrollBarManager
	{
		/**
		 *滚动条关联的滚动区域 
		 */		
		public var scrollBarDisplayRectContainer:LayoutPort
		public var elementsList:Array;
		public var scrollBar:ScrollBar;
		private var placeHolder:DisplayObject
		
		private var view:IScrollView
		/**
		 * 
		 * @param container
		 * @param scrollBar
		 * @param placeHolder
		 * 
		 */		
		public function ScrollBarManager(container:DisplayObjectContainer,scrollBar:ScrollBar,placeHolder:DisplayObject)
		{
			scrollBarDisplayRectContainer = new LayoutPort(new Rectangle(placeHolder.x,placeHolder.y,placeHolder.width,placeHolder.height));
			scrollBarDisplayRectContainer.minY = placeHolder.y;
			container.addChild(scrollBarDisplayRectContainer);
			
			if(placeHolder.parent){
				placeHolder.parent.removeChild(placeHolder);
			}
			this.scrollBar = scrollBar;
		}
		public function add(obj:DisplayObject):void{
			if(obj){
				scrollBarDisplayRectContainer.addChild(obj);
				//添加滚动条
				scrollBar.setContent(scrollBarDisplayRectContainer as IScrollView,10);
			}
		}
		public function remove():void{
			
		}
	}
}