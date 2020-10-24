package anifire.studio.skins
{
	import mx.binding.BindingManager;
	import mx.core.IFlexModuleFactory;
	import mx.core.IStateClient2;
	import mx.events.PropertyChangeEvent;
	import mx.states.SetProperty;
	import mx.states.State;
	import spark.components.ToggleButton;
	import spark.primitives.BitmapImage;
	import spark.skins.SparkSkin;
	
	public class PlayVoiceToggleButtonSkin extends SparkSkin implements IStateClient2
	{
		 
		
		private var _481507230_PlayVoiceToggleButtonSkin_BitmapImage1:BitmapImage;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		private var _embed_mxml__styles_images_panel_voice_playbutton_png_1042866151:Class;
		
		private var _embed_mxml__styles_images_panel_voice_stopbutton_png_1184254329:Class;
		
		private var _embed_mxml__styles_images_panel_voice_playbutton_hover_png_286555137:Class;
		
		private var _213507019hostComponent:ToggleButton;
		
		public function PlayVoiceToggleButtonSkin()
		{
			this._embed_mxml__styles_images_panel_voice_playbutton_png_1042866151 = PlayVoiceToggleButtonSkin__embed_mxml__styles_images_panel_voice_playbutton_png_1042866151;
			this._embed_mxml__styles_images_panel_voice_stopbutton_png_1184254329 = PlayVoiceToggleButtonSkin__embed_mxml__styles_images_panel_voice_stopbutton_png_1184254329;
			this._embed_mxml__styles_images_panel_voice_playbutton_hover_png_286555137 = PlayVoiceToggleButtonSkin__embed_mxml__styles_images_panel_voice_playbutton_hover_png_286555137;
			super();
			mx_internal::_document = this;
			this.width = 42;
			this.height = 42;
			this.mxmlContent = [this._PlayVoiceToggleButtonSkin_BitmapImage1_i()];
			this.currentState = "up";
			states = [new State({
				"name":"up",
				"overrides":[]
			}),new State({
				"name":"over",
				"stateGroups":["overStates","overDownStates"],
				"overrides":[new SetProperty().initializeFromObject({
					"target":"_PlayVoiceToggleButtonSkin_BitmapImage1",
					"name":"source",
					"value":this._embed_mxml__styles_images_panel_voice_playbutton_hover_png_286555137
				})]
			}),new State({
				"name":"down",
				"stateGroups":["downStates","overDownStates"],
				"overrides":[new SetProperty().initializeFromObject({
					"target":"_PlayVoiceToggleButtonSkin_BitmapImage1",
					"name":"source",
					"value":this._embed_mxml__styles_images_panel_voice_playbutton_hover_png_286555137
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
					"target":"_PlayVoiceToggleButtonSkin_BitmapImage1",
					"name":"source",
					"value":this._embed_mxml__styles_images_panel_voice_stopbutton_png_1184254329
				})]
			}),new State({
				"name":"overAndSelected",
				"stateGroups":["selectedStates","overDownSelectedStates","overStates"],
				"overrides":[new SetProperty().initializeFromObject({
					"target":"_PlayVoiceToggleButtonSkin_BitmapImage1",
					"name":"source",
					"value":this._embed_mxml__styles_images_panel_voice_stopbutton_png_1184254329
				})]
			}),new State({
				"name":"downAndSelected",
				"stateGroups":["selectedStates","downStates","overDownSelectedStates"],
				"overrides":[new SetProperty().initializeFromObject({
					"target":"_PlayVoiceToggleButtonSkin_BitmapImage1",
					"name":"source",
					"value":this._embed_mxml__styles_images_panel_voice_stopbutton_png_1184254329
				})]
			}),new State({
				"name":"disabledAndSelected",
				"stateGroups":["selectedStates","selectedUpStates","disabledStates"],
				"overrides":[new SetProperty().initializeFromObject({
					"name":"alpha",
					"value":0.5
				}),new SetProperty().initializeFromObject({
					"target":"_PlayVoiceToggleButtonSkin_BitmapImage1",
					"name":"source",
					"value":this._embed_mxml__styles_images_panel_voice_stopbutton_png_1184254329
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
		
		private function _PlayVoiceToggleButtonSkin_BitmapImage1_i() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.verticalCenter = 0;
			_loc1_.horizontalCenter = 0;
			_loc1_.source = this._embed_mxml__styles_images_panel_voice_playbutton_png_1042866151;
			_loc1_.initialized(this,"_PlayVoiceToggleButtonSkin_BitmapImage1");
			this._PlayVoiceToggleButtonSkin_BitmapImage1 = _loc1_;
			BindingManager.executeBindings(this,"_PlayVoiceToggleButtonSkin_BitmapImage1",this._PlayVoiceToggleButtonSkin_BitmapImage1);
			return _loc1_;
		}
		
		[Bindable(event="propertyChange")]
		public function get _PlayVoiceToggleButtonSkin_BitmapImage1() : BitmapImage
		{
			return this._481507230_PlayVoiceToggleButtonSkin_BitmapImage1;
		}
		
		public function set _PlayVoiceToggleButtonSkin_BitmapImage1(param1:BitmapImage) : void
		{
			var _loc2_:Object = this._481507230_PlayVoiceToggleButtonSkin_BitmapImage1;
			if(_loc2_ !== param1)
			{
				this._481507230_PlayVoiceToggleButtonSkin_BitmapImage1 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_PlayVoiceToggleButtonSkin_BitmapImage1",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get hostComponent() : ToggleButton
		{
			return this._213507019hostComponent;
		}
		
		public function set hostComponent(param1:ToggleButton) : void
		{
			var _loc2_:Object = this._213507019hostComponent;
			if(_loc2_ !== param1)
			{
				this._213507019hostComponent = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hostComponent",_loc2_,param1));
				}
			}
		}
	}
}
