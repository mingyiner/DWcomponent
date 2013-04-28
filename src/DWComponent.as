package
{
	import Utils.DWTileList;
	import Utils.DataProvider;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
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
			tileList.x =25;
			tileList.y = 25;			
			
			tileList._cellWidth = 50;
			tileList.rowHeight = 50
			tileList.setSize(206,300);
			tileList.setStyle("horizontalGap",2);
			tileList.setStyle("cellRender",Ball);
			var arr:Array = [];
			for (var i:int = 0; i < 24; i++) 
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
		}
	}
}