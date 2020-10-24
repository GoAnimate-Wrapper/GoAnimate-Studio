package anifire.studio.components
{
	import flashx.textLayout.conversion.TextConverter;
	import mx.binding.BindingManager;
	import mx.core.IFlexModuleFactory;
	import mx.events.PropertyChangeEvent;
	import spark.components.Group;
	import spark.components.RichText;
	import spark.primitives.BitmapImage;
	
	public class StudioProgressBar extends Group
	{
		 
		
		private var _1154545361barDisplay:BitmapImage;
		
		private var _1393759000loadingLabel:RichText;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		private var _embed_mxml__styles_images_preloader_loading_track_png_2029973121:Class;
		
		private var _embed_mxml__styles_images_preloader_loading_fill_png_1641426009:Class;
		
		public function StudioProgressBar()
		{
			this._embed_mxml__styles_images_preloader_loading_track_png_2029973121 = StudioProgressBar__embed_mxml__styles_images_preloader_loading_track_png_2029973121;
			this._embed_mxml__styles_images_preloader_loading_fill_png_1641426009 = StudioProgressBar__embed_mxml__styles_images_preloader_loading_fill_png_1641426009;
			super();
			mx_internal::_document = this;
			this.width = 224;
			this.height = 12;
			this.mxmlContent = [this._StudioProgressBar_BitmapImage1_c(),this._StudioProgressBar_Group2_c(),this._StudioProgressBar_RichText1_i()];
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
		
		public function setProgress(param1:Number) : void
		{
			var _loc2_:Number = Math.max(0,Math.min(param1,100));
			visible = _loc2_ >= 0 && _loc2_ < 100;
			this.barDisplay.percentWidth = _loc2_;
		}
		
		public function startAnimation() : void
		{
		}
		
		public function stopAnimation() : void
		{
			visible = false;
		}
		
		public function setLabal(param1:String) : void
		{
		}
		
		public function resetLabel() : void
		{
		}
		
		public function updateStatus(param1:String) : void
		{
			this.loadingLabel.textFlow = TextConverter.importToFlow(param1,TextConverter.TEXT_FIELD_HTML_FORMAT);
		}
		
		private function _StudioProgressBar_BitmapImage1_c() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.source = this._embed_mxml__styles_images_preloader_loading_track_png_2029973121;
			_loc1_.smooth = true;
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _StudioProgressBar_Group2_c() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.width = 221;
			_loc1_.height = 8;
			_loc1_.verticalCenter = 0;
			_loc1_.horizontalCenter = 0;
			_loc1_.mxmlContent = [this._StudioProgressBar_BitmapImage2_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _StudioProgressBar_BitmapImage2_i() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.percentHeight = 100;
			_loc1_.fillMode = "clip";
			_loc1_.smooth = true;
			_loc1_.source = this._embed_mxml__styles_images_preloader_loading_fill_png_1641426009;
			_loc1_.initialized(this,"barDisplay");
			this.barDisplay = _loc1_;
			BindingManager.executeBindings(this,"barDisplay",this.barDisplay);
			return _loc1_;
		}
		
		private function _StudioProgressBar_RichText1_i() : RichText
		{
			var _loc1_:RichText = new RichText();
			_loc1_.horizontalCenter = 0;
			_loc1_.y = 15;
			_loc1_.id = "loadingLabel";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.loadingLabel = _loc1_;
			BindingManager.executeBindings(this,"loadingLabel",this.loadingLabel);
			return _loc1_;
		}
		
		[Bindable(event="propertyChange")]
		public function get barDisplay() : BitmapImage
		{
			return this._1154545361barDisplay;
		}
		
		public function set barDisplay(param1:BitmapImage) : void
		{
			var _loc2_:Object = this._1154545361barDisplay;
			if(_loc2_ !== param1)
			{
				this._1154545361barDisplay = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"barDisplay",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get loadingLabel() : RichText
		{
			return this._1393759000loadingLabel;
		}
		
		public function set loadingLabel(param1:RichText) : void
		{
			var _loc2_:Object = this._1393759000loadingLabel;
			if(_loc2_ !== param1)
			{
				this._1393759000loadingLabel = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"loadingLabel",_loc2_,param1));
				}
			}
		}
	}
}
