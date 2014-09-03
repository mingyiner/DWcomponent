package
{
	import Utils.DWTileList;
	import Utils.DataProvider;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.utils.clearInterval;
	import flash.utils.setInterval;
	import flash.utils.setTimeout;
	
	import srollbar.ScrollBar;
	import srollbar.ScrollBarManager;
	
	[SWF(width = "600",height = "600")]
	public class DWComponent extends Sprite
	{ 
		private var tileList:DWTileList;
		private var scrollUI:MovieClip;
		public function DWComponent()
		{
			tileList = new DWTileList();		
			
			tileList._cellWidth = 50;
			tileList.rowHeight = 50
			tileList.setSize(206,500);
			tileList.setStyle("horizontalGap",2);
			tileList.setStyle("cellRender",Ball);
			var arr:Array = [];
			for (var i:int = 0; i < 40; i++) 
			{
				arr.push(i);
			}
			
			tileList.dataProvider.sourceData = arr;
			//addChild(tileList);
			
			scrollUI = new UiAsset();
			addChild(scrollUI);
			var scrollBar:ScrollBar = new ScrollBar(scrollUI.scrollBar);
			var scrollManager:ScrollBarManager = new ScrollBarManager(this,scrollBar,scrollUI.palceHolder);
			scrollManager.add(tileList);
			
			var i:int = 61222
			trace(i.toString().split(""));
			
			var tf:TextField = new TextField();
			//tf.text = "455566";
			tf.htmlText = "<font color = '#cccccc'>45677</font>"
			tf.y = 400
			addChild(tf);
			
			var s:String = '喵了个咪~.s23';
			var codeS:String = s.charAt(s.length - 1);
			var id:int = s.charCodeAt(2);
			trace(codeS,id +"id");
		}
	}
}