package
{
	import flash.geom.Point;
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
			tf.width =24;
			tf.height = 16;
			tf.y =  18;
			tf.x = 18;
			addChild(tf);
		}
		
		private function drawBall():void
		{
			this.graphics.beginFill(0xcc0000,1);
			this.graphics.drawCircle(25,25,25);
			this.graphics.endFill();
		} 
		public function set data(value:Object):void{
			_data = value;
			tf.text = String(value)
		}
		
		public function get data():Object{
			return _data;
		}
		public function refresh():void {
			
			
		}
		public function refresh1():void {
			
		}
		public function refresh2():void {
			
		}
		public function masterRefresh():void {
			
		}
		public function masterRefresh1():void {
			
		}
		//四个点中最小横坐标点
		private var minX:int;
		//四个点中最大横坐标点
		private var maxX:int;
		//四个点中最小纵坐标点
		private var minY:int;
		//四个点钟最大纵坐标点
		private var maxY:int;
		private function randomPoint():Point {
			var p:Point = new Point;
			p.x = minX + Math.random() * (maxX - minX);
			p.y = minY + Math.random() * (maxY - minY);
			return p;
		}
	}
}