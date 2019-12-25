package anifire.studio.skins
{
	import mx.binding.BindingManager;
	import mx.core.IFlexModuleFactory;
	import mx.core.IStateClient2;
	import mx.events.PropertyChangeEvent;
	import mx.states.SetProperty;
	import mx.states.State;
	import spark.primitives.BitmapImage;
	import spark.skins.SparkButtonSkin;
	
	public class PlayFadingToggleButtonSkin extends SparkButtonSkin implements IStateClient2
	{
		 
		
		private var _983623179_PlayFadingToggleButtonSkin_BitmapImage1:BitmapImage;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		private var _embed_mxml__styles_images_fading_play_hover_png_1336749435:Class;
		
		private var _embed_mxml__styles_images_fading_pause_hover_png_47643447:Class;
		
		private var _embed_mxml__styles_images_fading_pause_png_930516407:Class;
		
		private var _embed_mxml__styles_images_fading_play_png_51113971:Class;
		
		public function PlayFadingToggleButtonSkin()
		{
			this._embed_mxml__styles_images_fading_play_hover_png_1336749435 = PlayFadingToggleButtonSkin__embed_mxml__styles_images_fading_play_hover_png_1336749435;
			this._embed_mxml__styles_images_fading_pause_hover_png_47643447 = PlayFadingToggleButtonSkin__embed_mxml__styles_images_fading_pause_hover_png_47643447;
			this._embed_mxml__styles_images_fading_pause_png_930516407 = PlayFadingToggleButtonSkin__embed_mxml__styles_images_fading_pause_png_930516407;
			this._embed_mxml__styles_images_fading_play_png_51113971 = PlayFadingToggleButtonSkin__embed_mxml__styles_images_fading_play_png_51113971;
			super();
			mx_internal::_document = this;
			this.minWidth = 21;
			this.minHeight = 21;
			this.mxmlContent = [this._PlayFadingToggleButtonSkin_BitmapImage1_i()];
			this.currentState = "up";
			states = [new State({
				"name":"up",
				"overrides":[]
			}),new State({
				"name":"over",
				"stateGroups":["overStates","overDownStates"],
				"overrides":[new SetProperty().initializeFromObject({
					"target":"_PlayFadingToggleButtonSkin_BitmapImage1",
					"name":"source",
					"value":this._embed_mxml__styles_images_fading_play_hover_png_1336749435
				})]
			}),new State({
				"name":"down",
				"stateGroups":["downStates","overDownStates"],
				"overrides":[new SetProperty().initializeFromObject({
					"target":"_PlayFadingToggleButtonSkin_BitmapImage1",
					"name":"source",
					"value":this._embed_mxml__styles_images_fading_play_hover_png_1336749435
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
					"target":"_PlayFadingToggleButtonSkin_BitmapImage1",
					"name":"source",
					"value":this._embed_mxml__styles_images_fading_pause_png_930516407
				})]
			}),new State({
				"name":"overAndSelected",
				"stateGroups":["selectedStates","overDownSelectedStates","overStates"],
				"overrides":[new SetProperty().initializeFromObject({
					"target":"_PlayFadingToggleButtonSkin_BitmapImage1",
					"name":"source",
					"value":this._embed_mxml__styles_images_fading_pause_hover_png_47643447
				})]
			}),new State({
				"name":"downAndSelected",
				"stateGroups":["selectedStates","downStates","overDownSelectedStates"],
				"overrides":[new SetProperty().initializeFromObject({
					"target":"_PlayFadingToggleButtonSkin_BitmapImage1",
					"name":"source",
					"value":this._embed_mxml__styles_images_fading_pause_hover_png_47643447
				})]
			}),new State({
				"name":"disabledAndSelected",
				"stateGroups":["selectedStates","selectedUpStates","disabledStates"],
				"overrides":[new SetProperty().initializeFromObject({
					"name":"alpha",
					"value":0.5
				}),new SetProperty().initializeFromObject({
					"target":"_PlayFadingToggleButtonSkin_BitmapImage1",
					"name":"source",
					"value":this._embed_mxml__styles_images_fading_pause_png_930516407
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
		
		private function _PlayFadingToggleButtonSkin_BitmapImage1_i() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.verticalCenter = 0;
			_loc1_.horizontalCenter = 0;
			_loc1_.source = this._embed_mxml__styles_images_fading_play_png_51113971;
			_loc1_.initialized(this,"_PlayFadingToggleButtonSkin_BitmapImage1");
			this._PlayFadingToggleButtonSkin_BitmapImage1 = _loc1_;
			BindingManager.executeBindings(this,"_PlayFadingToggleButtonSkin_BitmapImage1",this._PlayFadingToggleButtonSkin_BitmapImage1);
			return _loc1_;
		}
		
		[Bindable(event="propertyChange")]
		public function get _PlayFadingToggleButtonSkin_BitmapImage1() : BitmapImage
		{
			return this._983623179_PlayFadingToggleButtonSkin_BitmapImage1;
		}
		
		public function set _PlayFadingToggleButtonSkin_BitmapImage1(param1:BitmapImage) : void
		{
			var _loc2_:Object = this._983623179_PlayFadingToggleButtonSkin_BitmapImage1;
			if(_loc2_ !== param1)
			{
				this._983623179_PlayFadingToggleButtonSkin_BitmapImage1 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_PlayFadingToggleButtonSkin_BitmapImage1",_loc2_,param1));
				}
			}
		}
	}
}
