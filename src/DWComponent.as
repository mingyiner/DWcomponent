package
{
	import Utils.DWTileList;
	import Utils.DataProvider;
	
	import flash.display.Sprite;
	
	[SWF(width = "600",height = "600")]
	public class DWComponent extends Sprite
	{ 
		private var tileList:DWTileList;
		public function DWComponent()
		{
			tileList = new DWTileList();
			tileList.x = 50;
			tileList.y = 50;			
			
			tileList._cellWidth = 50;
			tileList.rowHeight = 50
			tileList.setSize(206,200);
			tileList.setStyle("horizontalGap",2);
			tileList.setStyle("cellRender",Ball);
			tileList.dataProvider.sourceData = [1,2,3,4,5,6,7,8,8];
			addChild(tileList);
			
		}
	}
}