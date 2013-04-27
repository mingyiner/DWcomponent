package Utils
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class DataProvider extends EventDispatcher
	{
		private var _source:Array
		public function DataProvider()
		{

		}
		
		public function set sourceData(value:Array):void{
			_source = value;
			fireDataChange();
		} 
		public function get sourceData():Array{
			return _source;
		}
		private function fireDataChange():void
		{
			dispatchEvent(new Event(Event.CHANGE));		
		}
	}
}