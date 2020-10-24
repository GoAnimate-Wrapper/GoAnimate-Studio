package anifire.studio.skins
{
	import mx.binding.BindingManager;
	import mx.core.IFlexModuleFactory;
	import mx.core.IStateClient2;
	import mx.events.PropertyChangeEvent;
	import mx.graphics.SolidColor;
	import mx.graphics.SolidColorStroke;
	import mx.states.SetProperty;
	import mx.states.State;
	import spark.primitives.BitmapImage;
	import spark.primitives.Line;
	import spark.primitives.Rect;
	import spark.skins.SparkButtonSkin;
	
	public class LookAtCameraToggleButtonSkin extends SparkButtonSkin implements IStateClient2
	{
		 
		
		private var _1473242507_LookAtCameraToggleButtonSkin_BitmapImage1:BitmapImage;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		private var _embed_mxml__styles_images_tray_sideway_icon_png_634197055:Class;
		
		private var _embed_mxml__styles_images_tray_facecamera_icon_png_1903023641:Class;
		
		public function LookAtCameraToggleButtonSkin()
		{
			this._embed_mxml__styles_images_tray_sideway_icon_png_634197055 = LookAtCameraToggleButtonSkin__embed_mxml__styles_images_tray_sideway_icon_png_634197055;
			this._embed_mxml__styles_images_tray_facecamera_icon_png_1903023641 = LookAtCameraToggleButtonSkin__embed_mxml__styles_images_tray_facecamera_icon_png_1903023641;
			super();
			mx_internal::_document = this;
			this.percentHeight = 100;
			this.mxmlContent = [this._LookAtCameraToggleButtonSkin_Line1_c(),this._LookAtCameraToggleButtonSkin_Rect1_c(),this._LookAtCameraToggleButtonSkin_BitmapImage1_i()];
			this.currentState = "up";
			states = [new State({
				"name":"up",
				"overrides":[]
			}),new State({
				"name":"over",
				"stateGroups":["overStates","overDownStates"],
				"overrides":[]
			}),new State({
				"name":"down",
				"stateGroups":["downStates","overDownStates"],
				"overrides":[]
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
					"target":"_LookAtCameraToggleButtonSkin_BitmapImage1",
					"name":"source",
					"value":this._embed_mxml__styles_images_tray_facecamera_icon_png_1903023641
				})]
			}),new State({
				"name":"overAndSelected",
				"stateGroups":["selectedStates","overDownSelectedStates","overStates"],
				"overrides":[new SetProperty().initializeFromObject({
					"target":"_LookAtCameraToggleButtonSkin_BitmapImage1",
					"name":"source",
					"value":this._embed_mxml__styles_images_tray_facecamera_icon_png_1903023641
				})]
			}),new State({
				"name":"downAndSelected",
				"stateGroups":["selectedStates","downStates","overDownSelectedStates"],
				"overrides":[new SetProperty().initializeFromObject({
					"target":"_LookAtCameraToggleButtonSkin_BitmapImage1",
					"name":"source",
					"value":this._embed_mxml__styles_images_tray_facecamera_icon_png_1903023641
				})]
			}),new State({
				"name":"disabledAndSelected",
				"stateGroups":["selectedStates","selectedUpStates","disabledStates"],
				"overrides":[new SetProperty().initializeFromObject({
					"name":"alpha",
					"value":0.5
				}),new SetProperty().initializeFromObject({
					"target":"_LookAtCameraToggleButtonSkin_BitmapImage1",
					"name":"source",
					"value":this._embed_mxml__styles_images_tray_facecamera_icon_png_1903023641
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
		
		private function _LookAtCameraToggleButtonSkin_Line1_c() : Line
		{
			var _loc1_:Line = new Line();
			_loc1_.left = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.stroke = this._LookAtCameraToggleButtonSkin_SolidColorStroke1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _LookAtCameraToggleButtonSkin_SolidColorStroke1_c() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.color = 11649221;
			return _loc1_;
		}
		
		private function _LookAtCameraToggleButtonSkin_Rect1_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.fill = this._LookAtCameraToggleButtonSkin_SolidColor1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _LookAtCameraToggleButtonSkin_SolidColor1_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.alpha = 0;
			return _loc1_;
		}
		
		private function _LookAtCameraToggleButtonSkin_BitmapImage1_i() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.verticalCenter = 0;
			_loc1_.left = 8;
			_loc1_.right = 8;
			_loc1_.source = this._embed_mxml__styles_images_tray_sideway_icon_png_634197055;
			_loc1_.initialized(this,"_LookAtCameraToggleButtonSkin_BitmapImage1");
			this._LookAtCameraToggleButtonSkin_BitmapImage1 = _loc1_;
			BindingManager.executeBindings(this,"_LookAtCameraToggleButtonSkin_BitmapImage1",this._LookAtCameraToggleButtonSkin_BitmapImage1);
			return _loc1_;
		}
		
		[Bindable(event="propertyChange")]
		public function get _LookAtCameraToggleButtonSkin_BitmapImage1() : BitmapImage
		{
			return this._1473242507_LookAtCameraToggleButtonSkin_BitmapImage1;
		}
		
		public function set _LookAtCameraToggleButtonSkin_BitmapImage1(param1:BitmapImage) : void
		{
			var _loc2_:Object = this._1473242507_LookAtCameraToggleButtonSkin_BitmapImage1;
			if(_loc2_ !== param1)
			{
				this._1473242507_LookAtCameraToggleButtonSkin_BitmapImage1 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_LookAtCameraToggleButtonSkin_BitmapImage1",_loc2_,param1));
				}
			}
		}
	}
}
