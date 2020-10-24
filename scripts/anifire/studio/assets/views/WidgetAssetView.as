package anifire.studio.assets.views
{
	import anifire.event.WidgetEvent;
	import anifire.studio.assets.image.IAssetImageProvider;
	import anifire.studio.assets.image.WidgetAssetImage;
	import anifire.studio.core.Asset;
	import anifire.studio.core.Widget;
	import anifire.studio.events.AssetViewEvent;
	import flash.events.Event;
	
	public class WidgetAssetView extends PropAssetView
	{
		 
		
		protected var isSwapping:Boolean;
		
		public function WidgetAssetView(param1:Asset, param2:IAssetImageProvider = null)
		{
			super(param1,param2);
		}
		
		override protected function handleImageReady() : void
		{
			this.updateWidgetImageData();
			this.updateWidgetImageOption();
			this.resizeWidgetImage();
			super.handleImageReady();
			alpha = 1;
			if(this.isSwapping && _asset)
			{
				(_asset as Widget).dispatchSwapComplete();
			}
		}
		
		override protected function createImage(param1:Asset) : void
		{
			if(_assetImage)
			{
				_assetImage.removeEventListener(WidgetEvent.WIDGET_ICON_LOAD_COMPLETE,this.onWidgetIconLoadComplete);
			}
			super.createImage(param1);
		}
		
		private function onAssetImageChange(param1:AssetViewEvent) : void
		{
			if(_assetImage)
			{
				removeEventListener(AssetViewEvent.VIEW_IMAGE_CHANGE,this.onAssetImageChange);
				_assetImage.addEventListener(WidgetEvent.WIDGET_ICON_LOAD_COMPLETE,this.onWidgetIconLoadComplete);
			}
		}
		
		override protected function addAssetEventListeners() : void
		{
			super.addAssetEventListeners();
			addEventListener(AssetViewEvent.VIEW_IMAGE_CHANGE,this.onAssetImageChange);
			if(_asset)
			{
				_asset.addEventListener(WidgetEvent.WIDGET_SWAP_START,this.onWidgetSwapStart);
				_asset.addEventListener(WidgetEvent.WIDGET_DATA_CHANGE,this.onWidgetDataChange);
				_asset.addEventListener(WidgetEvent.WIDGET_OPTION_CHANGE,this.onWidgetOptionChange);
				_asset.addEventListener(WidgetEvent.WIDGET_STYLE_CHANGE,this.onWidgetOptionChange);
				_asset.addEventListener(WidgetEvent.WIDGET_RESIZED,this.onWidgetResized);
				_asset.addEventListener(WidgetEvent.WIDGET_AXIS_SWAP,this.widget_axisSwapHandler);
			}
		}
		
		override protected function removeAssetEventListeners() : void
		{
			super.removeAssetEventListeners();
			removeEventListener(AssetViewEvent.VIEW_IMAGE_CHANGE,this.onAssetImageChange);
			if(_asset)
			{
				_asset.removeEventListener(WidgetEvent.WIDGET_SWAP_START,this.onWidgetSwapStart);
				_asset.removeEventListener(WidgetEvent.WIDGET_DATA_CHANGE,this.onWidgetDataChange);
				_asset.removeEventListener(WidgetEvent.WIDGET_OPTION_CHANGE,this.onWidgetOptionChange);
				_asset.removeEventListener(WidgetEvent.WIDGET_STYLE_CHANGE,this.onWidgetOptionChange);
				_asset.removeEventListener(WidgetEvent.WIDGET_RESIZED,this.onWidgetResized);
				_asset.removeEventListener(WidgetEvent.WIDGET_AXIS_SWAP,this.widget_axisSwapHandler);
			}
		}
		
		protected function onWidgetResized(param1:Event) : void
		{
			this.resizeWidgetImage();
		}
		
		protected function resizeWidgetImage() : void
		{
			var _loc1_:WidgetAssetImage = assetImage as WidgetAssetImage;
			var _loc2_:Widget = asset as Widget;
			if(_loc1_ && _loc2_)
			{
				_loc1_.resizeWidget(_loc2_.bounds);
				dispatchEvent(new AssetViewEvent(AssetViewEvent.VIEW_CHANGE,true));
			}
		}
		
		protected function onWidgetSwapStart(param1:WidgetEvent) : void
		{
			this.isSwapping = true;
			alpha = 0.5;
		}
		
		protected function onWidgetDataChange(param1:WidgetEvent) : void
		{
			this.updateWidgetImageData();
		}
		
		protected function onWidgetOptionChange(param1:WidgetEvent) : void
		{
			this.updateWidgetImageOption();
		}
		
		protected function widget_axisSwapHandler(param1:WidgetEvent) : void
		{
			this.updateWidgetImageData();
		}
		
		public function onWidgetIconLoadComplete(param1:WidgetEvent) : void
		{
			dispatchEvent(new AssetViewEvent(AssetViewEvent.VIEW_CHANGE,true));
		}
		
		protected function updateWidgetImageData() : void
		{
			var _loc1_:WidgetAssetImage = assetImage as WidgetAssetImage;
			var _loc2_:Widget = asset as Widget;
			if(_loc1_ && _loc2_)
			{
				_loc1_.updateRangesAndRows(_loc2_.dataRanges,_loc2_.dataRows);
				_loc1_.title = _loc2_.title;
				_loc1_.setDateValues(_loc2_.currentDate,_loc2_.selectedDate,_loc2_.selectedDateEnd);
			}
			dispatchEvent(new AssetViewEvent(AssetViewEvent.VIEW_CHANGE,true));
		}
		
		protected function updateWidgetImageOption() : void
		{
			var _loc1_:WidgetAssetImage = assetImage as WidgetAssetImage;
			var _loc2_:Widget = asset as Widget;
			if(_loc1_ && _loc2_)
			{
				_loc1_.styleModel = _loc2_.styleModel;
				_loc1_.displayInPercentage = _loc2_.displayInPercentage;
				_loc1_.displayValueLabel = _loc2_.displayValueLabel;
				_loc1_.displayDataLabel = _loc2_.displayDataLabel;
				_loc1_.displayAxis = _loc2_.displayAxis;
				_loc1_.displayLegend = _loc2_.displayLegend;
				_loc1_.swapAxis = _loc2_.swapAxis;
				_loc1_.iconDirection = _loc2_.iconDirection;
				_loc1_.numberFormatType = _loc2_.numberFormatType;
				_loc1_.propId = _loc2_.propId;
				if(_loc2_.autoGrid)
				{
					_loc1_.setAutoGrid();
				}
				else
				{
					_loc1_.setManualGrid(_loc2_.gridRows,_loc2_.gridColumns);
				}
			}
			dispatchEvent(new AssetViewEvent(AssetViewEvent.VIEW_CHANGE,true));
		}
	}
}
