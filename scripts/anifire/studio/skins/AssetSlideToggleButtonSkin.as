package anifire.studio.skins
{
	import mx.binding.BindingManager;
	import mx.core.IFlexModuleFactory;
	import mx.core.IStateClient2;
	import mx.events.PropertyChangeEvent;
	import mx.graphics.SolidColor;
	import mx.states.SetProperty;
	import mx.states.State;
	import spark.primitives.BitmapImage;
	import spark.primitives.Rect;
	import spark.skins.SparkButtonSkin;
	
	public class AssetSlideToggleButtonSkin extends SparkButtonSkin implements IStateClient2
	{
		 
		
		private var _871485025_AssetSlideToggleButtonSkin_BitmapImage1:BitmapImage;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		private var _embed_mxml__styles_images_toolbar_tools_slide_on_png_488116919:Class;
		
		private var _embed_mxml__styles_images_toolbar_tools_slide_png_1963897473:Class;
		
		private var _embed_mxml__styles_images_toolbar_tools_slide_on_hover_png_1761774657:Class;
		
		private var _embed_mxml__styles_images_toolbar_tools_slide_hover_png_674154751:Class;
		
		public function AssetSlideToggleButtonSkin()
		{
			this._embed_mxml__styles_images_toolbar_tools_slide_on_png_488116919 = AssetSlideToggleButtonSkin__embed_mxml__styles_images_toolbar_tools_slide_on_png_488116919;
			this._embed_mxml__styles_images_toolbar_tools_slide_png_1963897473 = AssetSlideToggleButtonSkin__embed_mxml__styles_images_toolbar_tools_slide_png_1963897473;
			this._embed_mxml__styles_images_toolbar_tools_slide_on_hover_png_1761774657 = AssetSlideToggleButtonSkin__embed_mxml__styles_images_toolbar_tools_slide_on_hover_png_1761774657;
			this._embed_mxml__styles_images_toolbar_tools_slide_hover_png_674154751 = AssetSlideToggleButtonSkin__embed_mxml__styles_images_toolbar_tools_slide_hover_png_674154751;
			super();
			mx_internal::_document = this;
			this.mxmlContent = [this._AssetSlideToggleButtonSkin_Rect1_c(),this._AssetSlideToggleButtonSkin_BitmapImage1_i()];
			this.currentState = "up";
			states = [new State({
				"name":"up",
				"overrides":[]
			}),new State({
				"name":"over",
				"stateGroups":["overStates","overDownStates"],
				"overrides":[new SetProperty().initializeFromObject({
					"target":"_AssetSlideToggleButtonSkin_BitmapImage1",
					"name":"source",
					"value":this._embed_mxml__styles_images_toolbar_tools_slide_hover_png_674154751
				})]
			}),new State({
				"name":"down",
				"stateGroups":["downStates","overDownStates"],
				"overrides":[new SetProperty().initializeFromObject({
					"target":"_AssetSlideToggleButtonSkin_BitmapImage1",
					"name":"source",
					"value":this._embed_mxml__styles_images_toolbar_tools_slide_hover_png_674154751
				})]
			}),new State({
				"name":"disabled",
				"stateGroups":["disabledStates"],
				"overrides":[new SetProperty().initializeFromObject({
					"name":"alpha",
					"value":0.5
				})]
			}),new State({
				"name":"upAndSelected",
				"stateGroups":["selectedStates","selectedUpStates"],
				"overrides":[new SetProperty().initializeFromObject({
					"target":"_AssetSlideToggleButtonSkin_BitmapImage1",
					"name":"source",
					"value":this._embed_mxml__styles_images_toolbar_tools_slide_on_png_488116919
				})]
			}),new State({
				"name":"overAndSelected",
				"stateGroups":["selectedStates","overDownSelectedStates","overStates"],
				"overrides":[new SetProperty().initializeFromObject({
					"target":"_AssetSlideToggleButtonSkin_BitmapImage1",
					"name":"source",
					"value":this._embed_mxml__styles_images_toolbar_tools_slide_on_hover_png_1761774657
				})]
			}),new State({
				"name":"downAndSelected",
				"stateGroups":["selectedStates","downStates","overDownSelectedStates"],
				"overrides":[new SetProperty().initializeFromObject({
					"target":"_AssetSlideToggleButtonSkin_BitmapImage1",
					"name":"source",
					"value":this._embed_mxml__styles_images_toolbar_tools_slide_on_hover_png_1761774657
				})]
			}),new State({
				"name":"disabledAndSelected",
				"stateGroups":["selectedStates","selectedUpStates","disabledStates"],
				"overrides":[new SetProperty().initializeFromObject({
					"name":"alpha",
					"value":0.5
				}),new SetProperty().initializeFromObject({
					"target":"_AssetSlideToggleButtonSkin_BitmapImage1",
					"name":"source",
					"value":this._embed_mxml__styles_images_toolbar_tools_slide_on_png_488116919
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
		
		private function _AssetSlideToggleButtonSkin_Rect1_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.fill = this._AssetSlideToggleButtonSkin_SolidColor1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _AssetSlideToggleButtonSkin_SolidColor1_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.alpha = 0;
			return _loc1_;
		}
		
		private function _AssetSlideToggleButtonSkin_BitmapImage1_i() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.verticalCenter = 0;
			_loc1_.horizontalCenter = 0;
			_loc1_.source = this._embed_mxml__styles_images_toolbar_tools_slide_png_1963897473;
			_loc1_.initialized(this,"_AssetSlideToggleButtonSkin_BitmapImage1");
			this._AssetSlideToggleButtonSkin_BitmapImage1 = _loc1_;
			BindingManager.executeBindings(this,"_AssetSlideToggleButtonSkin_BitmapImage1",this._AssetSlideToggleButtonSkin_BitmapImage1);
			return _loc1_;
		}
		
		[Bindable(event="propertyChange")]
		public function get _AssetSlideToggleButtonSkin_BitmapImage1() : BitmapImage
		{
			return this._871485025_AssetSlideToggleButtonSkin_BitmapImage1;
		}
		
		public function set _AssetSlideToggleButtonSkin_BitmapImage1(param1:BitmapImage) : void
		{
			var _loc2_:Object = this._871485025_AssetSlideToggleButtonSkin_BitmapImage1;
			if(_loc2_ !== param1)
			{
				this._871485025_AssetSlideToggleButtonSkin_BitmapImage1 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_AssetSlideToggleButtonSkin_BitmapImage1",_loc2_,param1));
				}
			}
		}
	}
}
