package
{
	import Utils.ICellRender;
	
	import flash.display.Sprite;
	import flash.text.TextField;
	
	public class Ball extends Sprite implements ICellRender
	{
		private var _data:Object;
		private var tf:TextField;
		public function Ball()
		{
			super();
			intMc()
			drawBall()
		}
		
		private function intMc():void
		{
			tf = new TextField();
			addChild(tf);
		}
		
		private function drawBall():void
		{
			this.graphics.beginFill(0xcc0000,1);
			this.graphics.drawCircle(0,0,25);
			this.graphics.endFill();
		} 
		public function set data(value:Object):void{
			_data = value;
			tf.text = String(value)
		}
		public function get data():Object{
			return _data;
		}
	}
}