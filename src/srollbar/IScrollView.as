package srollbar
{ 
	/**
	 *滚动的内容区域   都要实现这个接口
	 * @author dangweiwei
	 * 
	 */	
	public interface IScrollView
	{
		
		/**
		 *当前滚动区域的位置 
	 	*/	
		function set position(value:int):void;
		function get position():int;
		/**
	 	*滚动区域内容的总高 
	 	*/	
		function get contentTotalHeight():int;
		/**
	 	* 窗口的高
	 	*/	
		function get winHeight():int;	
		
		function set minY(value:int):void;
		function get minY():int;
	 }
}