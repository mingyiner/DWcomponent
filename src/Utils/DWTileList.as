package Utils
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import org.osmf.layout.HorizontalAlign;

	/**
	 * 网格平铺
	 * @author dangweiwei
	 * 
	 */	
	public class DWTileList extends BaseList
	{
		
		private var _rowHeight:int;


		private var _columnWidth:int;
		private var _cellRender:Class
		public var _cellWidth:int;
		private var itemList:Array;
		public var dataProvider:DataProvider;

		public function DWTileList()
		{ 
			itemList = new Array();
			dataProvider = new DataProvider();
			dataProvider.addEventListener(Event.CHANGE,dataChangeHandler);
		}
		
		public function set rowHeight(h:int):void{
			_rowHeight = h;
		}
		public function get rowHeight():int{
			return _rowHeight;
		}
		public function set columnWidth(w:int):void{
			_columnWidth = w;
		}
		public function get columnWidth():int{
			return _columnWidth;
		}
		/**
		 *平铺 (铺满整个list列表)
		 */		
		override public function layout():void{
			
			//计算出每行排多少
			if(columnWidth <= 0){
				columnWidth = this.width;
			}
			var columnNum:int = columnWidth/( _cellWidth + styleDic["horizontalGap"]);
			//可以忽略最后一列的间距
			if(columnWidth - columnNum * _cellWidth >= _cellWidth){
				columnNum +=1;
			}
			//总共可以排多少行
			if(_rowHeight==0){
				_rowHeight = styleDic["cellRender"].height;
			}
			var rowNum:int = this.height/(_rowHeight+styleDic["verticalGap"]);
			//可以忽略最后一行的间距
			if(this.height - rowNum*_rowHeight >= _rowHeight){
				rowNum +=1;
			}
			//开始平铺
			if(!styleDic["cellRender"] || itemList.length!=0){
				return;
			}
			for (var i:int = 0; i < rowNum; i++) 
			{
				for (var j:int = 0; j < columnNum; j++) 
				{
						
						var item:DisplayObject = new styleDic["cellRender"] as DisplayObject;
						item.visible = false;
						//item.setData
						item.x = (_cellWidth + styleDic["horizontalGap"])*(j%columnNum);
						item.y = (_rowHeight +styleDic["verticalGap"])*i;
						addChild(item);
						itemList.push(item)
				}
				
			}
		}
		//数据源变更
		protected function dataChangeHandler(event:Event):void
		{
			if(!styleDic["cellRender"]){
				return;
			}
			
			if(itemList.length == 0){
				layout();
			}
			var allItemListLen:int = itemList.length;
			//数据源的长度
			var len:int = dataProvider.sourceData.length;
			for (var i:int = 0; i < allItemListLen; i++) 
			{
				//超出数据源  视图不可见
				if(i >=len){
					itemList[i].visible = false;
				}else{
					itemList[i].visible = true;
					//给每个单元格设置数据
					if(itemList[i] is ICellRender){
						ICellRender(itemList[i]).data = dataProvider.sourceData[i];
					}
				}
			}
			
		}

	}
}