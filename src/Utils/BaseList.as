package Utils
{
	import flash.display.Sprite;
	import flash.utils.Dictionary;

	public class BaseList extends Sprite
	{
		/**
		 *样式容器 
		 */		
		public var styleDic:Dictionary;
		
		private var _horizontalGap:int;
		private var _verticalGap:int;
		private var _width:int;
		private var _height:int;
		public function BaseList()
		{
			styleDic = new Dictionary();
		}
		/**
		 * 设置组件的宽高
		 * @param w
		 * @param h
		 * 
		 */		
		public function setSize(w:int,h:int):void{
			this._width = w;
			this._height = h;
		}
		/**
		 * 设置样式
		 * @param style
		 * @param value
		 * 
		 */		
		public function setStyle(style:String,value:*):void{
			//设置间隔的默认值
			styleDic["horizontalGap"] = 0;
			styleDic["verticalGap"] =0;
			
			//水平间隔
			if(style == "horizontalGap"){
				styleDic["horizontalGap"] = value;
			}
			//垂直间隔
			if(style == "verticalGap"){
				styleDic["verticalGap"] = value;
			}
			//单元格渲染
			if(style == "cellRender"){
				styleDic["cellRender"] = value;
			}
			layout();
		}
		/**
		 * 布局
		 */		
		public function layout():void
		{
			
		}
		
		override public function set width(value:Number):void{
			this._width = value;
		}
		override public function get width():Number{
			return _width;
		}
		override public function set height(value:Number):void{
			this._height =value;
		}
		override public function get height():Number{
			return _height;
		}
	}
}