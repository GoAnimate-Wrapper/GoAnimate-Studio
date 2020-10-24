package anifire.skins
{
	import mx.binding.BindingManager;
	import mx.core.IFlexModuleFactory;
	import mx.core.IStateClient2;
	import mx.events.PropertyChangeEvent;
	import mx.states.SetProperty;
	import mx.states.State;
	import spark.primitives.BitmapImage;
	import spark.skins.SparkButtonSkin;
	
	public class EyeDropperButtonSkin extends SparkButtonSkin implements IStateClient2
	{
		 
		
		private var _550816025_EyeDropperButtonSkin_BitmapImage1:BitmapImage;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		private var _embed_mxml__styles_images_icons_icon_colorpicker_active_png_574257180:Class;
		
		private var _embed_mxml__styles_images_icons_icon_colorpicker_png_2048739724:Class;
		
		public function EyeDropperButtonSkin()
		{
			this._embed_mxml__styles_images_icons_icon_colorpicker_active_png_574257180 = EyeDropperButtonSkin__embed_mxml__styles_images_icons_icon_colorpicker_active_png_574257180;
			this._embed_mxml__styles_images_icons_icon_colorpicker_png_2048739724 = EyeDropperButtonSkin__embed_mxml__styles_images_icons_icon_colorpicker_png_2048739724;
			super();
			mx_internal::_document = this;
			this.mxmlContent = [this._EyeDropperButtonSkin_BitmapImage1_i()];
			this.currentState = "up";
			states = [new State({
				"name":"up",
				"overrides":[]
			}),new State({
				"name":"over",
				"overrides":[new SetProperty().initializeFromObject({
					"target":"_EyeDropperButtonSkin_BitmapImage1",
					"name":"source",
					"value":this._embed_mxml__styles_images_icons_icon_colorpicker_active_png_574257180
				})]
			}),new State({
				"name":"down",
				"overrides":[]
			}),new State({
				"name":"disabled",
				"overrides":[new SetProperty().initializeFromObject({
					"name":"alpha",
					"value":0.5
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
		
		private function _EyeDropperButtonSkin_BitmapImage1_i() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.verticalCenter = 0;
			_loc1_.horizontalCenter = 0;
			_loc1_.source = this._embed_mxml__styles_images_icons_icon_colorpicker_png_2048739724;
			_loc1_.initialized(this,"_EyeDropperButtonSkin_BitmapImage1");
			this._EyeDropperButtonSkin_BitmapImage1 = _loc1_;
			BindingManager.executeBindings(this,"_EyeDropperButtonSkin_BitmapImage1",this._EyeDropperButtonSkin_BitmapImage1);
			return _loc1_;
		}
		
		[Bindable(event="propertyChange")]
		public function get _EyeDropperButtonSkin_BitmapImage1() : BitmapImage
		{
			return this._550816025_EyeDropperButtonSkin_BitmapImage1;
		}
		
		public function set _EyeDropperButtonSkin_BitmapImage1(param1:BitmapImage) : void
		{
			var _loc2_:Object = this._550816025_EyeDropperButtonSkin_BitmapImage1;
			if(_loc2_ !== param1)
			{
				this._550816025_EyeDropperButtonSkin_BitmapImage1 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_EyeDropperButtonSkin_BitmapImage1",_loc2_,param1));
				}
			}
		}
	}
}
