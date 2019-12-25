package anifire.studio.components
{
	import anifire.studio.assets.views.AssetViewCollection;
	import anifire.studio.core.AnimeScene;
	import anifire.studio.core.Asset;
	import anifire.studio.core.Background;
	import anifire.studio.core.Console;
	import anifire.studio.core.EffectAsset;
	import anifire.studio.interfaces.IAssetView;
	import mx.binding.BindingManager;
	import mx.core.DeferredInstanceFromFunction;
	import mx.core.IFlexModuleFactory;
	import mx.core.IStateClient2;
	import mx.events.PropertyChangeEvent;
	import mx.graphics.SolidColor;
	import mx.states.AddItems;
	import mx.states.State;
	import spark.components.Group;
	import spark.primitives.BitmapImage;
	import spark.primitives.Rect;
	import spark.primitives.RectangularDropShadow;
	
	public class PropertyThumbnail extends Group implements IStateClient2
	{
		 
		
		public var _PropertyThumbnail_BitmapImage1:BitmapImage;
		
		private var _1743282138_PropertyThumbnail_Group2:Group;
		
		private var _1693766620assetThumbnail:AssetThumbnail;
		
		private var _563989056sceneThumbnail:SceneThumbnail;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		private var _embed_mxml__styles_images_panel_thumb_multiSelect_png_814286071:Class;
		
		public function PropertyThumbnail()
		{
			this._embed_mxml__styles_images_panel_thumb_multiSelect_png_814286071 = PropertyThumbnail__embed_mxml__styles_images_panel_thumb_multiSelect_png_814286071;
			super();
			mx_internal::_document = this;
			this.width = 50;
			this.height = 50;
			this.mxmlContent = [this._PropertyThumbnail_Rect1_c(),this._PropertyThumbnail_RectangularDropShadow1_c(),this._PropertyThumbnail_Group2_i()];
			this.currentState = "scene";
			var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._PropertyThumbnail_AssetThumbnail1_i);
			var _loc2_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._PropertyThumbnail_BitmapImage1_i);
			var _loc3_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._PropertyThumbnail_SceneThumbnail1_i);
			states = [new State({
				"name":"scene",
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":_loc3_,
					"destination":"_PropertyThumbnail_Group2",
					"propertyName":"mxmlContent",
					"position":"first"
				})]
			}),new State({
				"name":"asset",
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":_loc1_,
					"destination":"_PropertyThumbnail_Group2",
					"propertyName":"mxmlContent",
					"position":"first"
				})]
			}),new State({
				"name":"assetCollection",
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":_loc2_,
					"destination":"_PropertyThumbnail_Group2",
					"propertyName":"mxmlContent",
					"position":"first"
				})]
			})];
		}
		
		override public function set moduleFactory(param1:IFlexModuleFactory) : void
		{
			super.moduleFactory = param1;
			if(this.__moduleFactoryInitialized)
			{
				return;
			}
			this.__moduleFactoryInitialized = true;
		}
		
		override public function initialize() : void
		{
			super.initialize();
		}
		
		public function set target(param1:Object) : void
		{
			var _loc2_:Asset = null;
			if(param1 is IAssetView)
			{
				_loc2_ = IAssetView(param1).asset as Asset;
			}
			if(param1 is AnimeScene)
			{
				currentState = "scene";
				this.sceneThumbnail.target = param1 as AnimeScene;
			}
			else if(_loc2_ is Background)
			{
				currentState = "scene";
				this.sceneThumbnail.target = _loc2_.scene;
			}
			else if(Console.getConsole().metaData.mver > 3 && _loc2_ is EffectAsset)
			{
				currentState = "scene";
				this.sceneThumbnail.target = _loc2_.scene;
			}
			else if(param1 is AssetViewCollection)
			{
				currentState = "assetCollection";
			}
			else
			{
				currentState = "asset";
				this.assetThumbnail.target = param1;
			}
			visible = param1 != null;
		}
		
		private function _PropertyThumbnail_Rect1_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.radiusX = 5;
			_loc1_.fill = this._PropertyThumbnail_SolidColor1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _PropertyThumbnail_SolidColor1_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 11126214;
			return _loc1_;
		}
		
		private function _PropertyThumbnail_RectangularDropShadow1_c() : RectangularDropShadow
		{
			var _loc1_:RectangularDropShadow = new RectangularDropShadow();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.color = 0;
			_loc1_.alpha = 0.2;
			_loc1_.blurX = 4;
			_loc1_.blurY = 4;
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _PropertyThumbnail_Group2_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.width = 50;
			_loc1_.height = 50;
			_loc1_.verticalCenter = 0;
			_loc1_.horizontalCenter = 0;
			_loc1_.mxmlContent = [];
			_loc1_.id = "_PropertyThumbnail_Group2";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._PropertyThumbnail_Group2 = _loc1_;
			BindingManager.executeBindings(this,"_PropertyThumbnail_Group2",this._PropertyThumbnail_Group2);
			return _loc1_;
		}
		
		private function _PropertyThumbnail_SceneThumbnail1_i() : SceneThumbnail
		{
			var _loc1_:SceneThumbnail = new SceneThumbnail();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.id = "sceneThumbnail";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.sceneThumbnail = _loc1_;
			BindingManager.executeBindings(this,"sceneThumbnail",this.sceneThumbnail);
			return _loc1_;
		}
		
		private function _PropertyThumbnail_AssetThumbnail1_i() : AssetThumbnail
		{
			var _loc1_:AssetThumbnail = new AssetThumbnail();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.id = "assetThumbnail";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.assetThumbnail = _loc1_;
			BindingManager.executeBindings(this,"assetThumbnail",this.assetThumbnail);
			return _loc1_;
		}
		
		private function _PropertyThumbnail_BitmapImage1_i() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.source = this._embed_mxml__styles_images_panel_thumb_multiSelect_png_814286071;
			_loc1_.initialized(this,"_PropertyThumbnail_BitmapImage1");
			this._PropertyThumbnail_BitmapImage1 = _loc1_;
			BindingManager.executeBindings(this,"_PropertyThumbnail_BitmapImage1",this._PropertyThumbnail_BitmapImage1);
			return _loc1_;
		}
		
		[Bindable(event="propertyChange")]
		public function get _PropertyThumbnail_Group2() : Group
		{
			return this._1743282138_PropertyThumbnail_Group2;
		}
		
		public function set _PropertyThumbnail_Group2(param1:Group) : void
		{
			var _loc2_:Object = this._1743282138_PropertyThumbnail_Group2;
			if(_loc2_ !== param1)
			{
				this._1743282138_PropertyThumbnail_Group2 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_PropertyThumbnail_Group2",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get assetThumbnail() : AssetThumbnail
		{
			return this._1693766620assetThumbnail;
		}
		
		public function set assetThumbnail(param1:AssetThumbnail) : void
		{
			var _loc2_:Object = this._1693766620assetThumbnail;
			if(_loc2_ !== param1)
			{
				this._1693766620assetThumbnail = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"assetThumbnail",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get sceneThumbnail() : SceneThumbnail
		{
			return this._563989056sceneThumbnail;
		}
		
		public function set sceneThumbnail(param1:SceneThumbnail) : void
		{
			var _loc2_:Object = this._563989056sceneThumbnail;
			if(_loc2_ !== param1)
			{
				this._563989056sceneThumbnail = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sceneThumbnail",_loc2_,param1));
				}
			}
		}
	}
}
