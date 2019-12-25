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
	
	public class SoundToggleButtonSkin extends SparkButtonSkin implements IStateClient2
	{
		 
		
		private var _1450006831_SoundToggleButtonSkin_BitmapImage1:BitmapImage;
		
		private var _1450006830_SoundToggleButtonSkin_BitmapImage2:BitmapImage;
		
		private var _1450006829_SoundToggleButtonSkin_BitmapImage3:BitmapImage;
		
		private var _1450006828_SoundToggleButtonSkin_BitmapImage4:BitmapImage;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		private var _embed_mxml__styles_images_panel_enter_exit_sound_mute_png_450505961:Class;
		
		private var _embed_mxml__styles_images_panel_enterexit_sound_on_hover_png_1296496311:Class;
		
		private var _embed_mxml__styles_images_panel_enter_exit_mute_hover_png_1689668599:Class;
		
		private var _embed_mxml__styles_images_panel_enterexit_sound_on_png_1505466693:Class;
		
		public function SoundToggleButtonSkin()
		{
			this._embed_mxml__styles_images_panel_enter_exit_sound_mute_png_450505961 = SoundToggleButtonSkin__embed_mxml__styles_images_panel_enter_exit_sound_mute_png_450505961;
			this._embed_mxml__styles_images_panel_enterexit_sound_on_hover_png_1296496311 = SoundToggleButtonSkin__embed_mxml__styles_images_panel_enterexit_sound_on_hover_png_1296496311;
			this._embed_mxml__styles_images_panel_enter_exit_mute_hover_png_1689668599 = SoundToggleButtonSkin__embed_mxml__styles_images_panel_enter_exit_mute_hover_png_1689668599;
			this._embed_mxml__styles_images_panel_enterexit_sound_on_png_1505466693 = SoundToggleButtonSkin__embed_mxml__styles_images_panel_enterexit_sound_on_png_1505466693;
			super();
			mx_internal::_document = this;
			this.mxmlContent = [this._SoundToggleButtonSkin_BitmapImage1_i(),this._SoundToggleButtonSkin_BitmapImage2_i(),this._SoundToggleButtonSkin_BitmapImage3_i(),this._SoundToggleButtonSkin_BitmapImage4_i()];
			this.currentState = "up";
			states = [new State({
				"name":"up",
				"overrides":[new SetProperty().initializeFromObject({
					"target":"_SoundToggleButtonSkin_BitmapImage1",
					"name":"visible",
					"value":true
				})]
			}),new State({
				"name":"over",
				"stateGroups":["overStates","overDownStates"],
				"overrides":[new SetProperty().initializeFromObject({
					"target":"_SoundToggleButtonSkin_BitmapImage2",
					"name":"visible",
					"value":true
				})]
			}),new State({
				"name":"down",
				"stateGroups":["downStates","overDownStates"],
				"overrides":[new SetProperty().initializeFromObject({
					"target":"_SoundToggleButtonSkin_BitmapImage2",
					"name":"visible",
					"value":true
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
					"target":"_SoundToggleButtonSkin_BitmapImage3",
					"name":"visible",
					"value":true
				})]
			}),new State({
				"name":"overAndSelected",
				"stateGroups":["selectedStates","overDownSelectedStates","overStates"],
				"overrides":[new SetProperty().initializeFromObject({
					"target":"_SoundToggleButtonSkin_BitmapImage4",
					"name":"visible",
					"value":true
				})]
			}),new State({
				"name":"downAndSelected",
				"stateGroups":["selectedStates","downStates","overDownSelectedStates"],
				"overrides":[new SetProperty().initializeFromObject({
					"target":"_SoundToggleButtonSkin_BitmapImage4",
					"name":"visible",
					"value":true
				})]
			}),new State({
				"name":"disabledAndSelected",
				"stateGroups":["selectedStates","selectedUpStates","disabledStates"],
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
		
		private function _SoundToggleButtonSkin_BitmapImage1_i() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.source = this._embed_mxml__styles_images_panel_enter_exit_sound_mute_png_450505961;
			_loc1_.visible = false;
			_loc1_.verticalCenter = 0;
			_loc1_.initialized(this,"_SoundToggleButtonSkin_BitmapImage1");
			this._SoundToggleButtonSkin_BitmapImage1 = _loc1_;
			BindingManager.executeBindings(this,"_SoundToggleButtonSkin_BitmapImage1",this._SoundToggleButtonSkin_BitmapImage1);
			return _loc1_;
		}
		
		private function _SoundToggleButtonSkin_BitmapImage2_i() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.source = this._embed_mxml__styles_images_panel_enter_exit_mute_hover_png_1689668599;
			_loc1_.visible = false;
			_loc1_.verticalCenter = 0;
			_loc1_.initialized(this,"_SoundToggleButtonSkin_BitmapImage2");
			this._SoundToggleButtonSkin_BitmapImage2 = _loc1_;
			BindingManager.executeBindings(this,"_SoundToggleButtonSkin_BitmapImage2",this._SoundToggleButtonSkin_BitmapImage2);
			return _loc1_;
		}
		
		private function _SoundToggleButtonSkin_BitmapImage3_i() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.source = this._embed_mxml__styles_images_panel_enterexit_sound_on_png_1505466693;
			_loc1_.visible = false;
			_loc1_.verticalCenter = 0;
			_loc1_.initialized(this,"_SoundToggleButtonSkin_BitmapImage3");
			this._SoundToggleButtonSkin_BitmapImage3 = _loc1_;
			BindingManager.executeBindings(this,"_SoundToggleButtonSkin_BitmapImage3",this._SoundToggleButtonSkin_BitmapImage3);
			return _loc1_;
		}
		
		private function _SoundToggleButtonSkin_BitmapImage4_i() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.source = this._embed_mxml__styles_images_panel_enterexit_sound_on_hover_png_1296496311;
			_loc1_.visible = false;
			_loc1_.verticalCenter = 0;
			_loc1_.initialized(this,"_SoundToggleButtonSkin_BitmapImage4");
			this._SoundToggleButtonSkin_BitmapImage4 = _loc1_;
			BindingManager.executeBindings(this,"_SoundToggleButtonSkin_BitmapImage4",this._SoundToggleButtonSkin_BitmapImage4);
			return _loc1_;
		}
		
		[Bindable(event="propertyChange")]
		public function get _SoundToggleButtonSkin_BitmapImage1() : BitmapImage
		{
			return this._1450006831_SoundToggleButtonSkin_BitmapImage1;
		}
		
		public function set _SoundToggleButtonSkin_BitmapImage1(param1:BitmapImage) : void
		{
			var _loc2_:Object = this._1450006831_SoundToggleButtonSkin_BitmapImage1;
			if(_loc2_ !== param1)
			{
				this._1450006831_SoundToggleButtonSkin_BitmapImage1 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SoundToggleButtonSkin_BitmapImage1",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _SoundToggleButtonSkin_BitmapImage2() : BitmapImage
		{
			return this._1450006830_SoundToggleButtonSkin_BitmapImage2;
		}
		
		public function set _SoundToggleButtonSkin_BitmapImage2(param1:BitmapImage) : void
		{
			var _loc2_:Object = this._1450006830_SoundToggleButtonSkin_BitmapImage2;
			if(_loc2_ !== param1)
			{
				this._1450006830_SoundToggleButtonSkin_BitmapImage2 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SoundToggleButtonSkin_BitmapImage2",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _SoundToggleButtonSkin_BitmapImage3() : BitmapImage
		{
			return this._1450006829_SoundToggleButtonSkin_BitmapImage3;
		}
		
		public function set _SoundToggleButtonSkin_BitmapImage3(param1:BitmapImage) : void
		{
			var _loc2_:Object = this._1450006829_SoundToggleButtonSkin_BitmapImage3;
			if(_loc2_ !== param1)
			{
				this._1450006829_SoundToggleButtonSkin_BitmapImage3 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SoundToggleButtonSkin_BitmapImage3",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _SoundToggleButtonSkin_BitmapImage4() : BitmapImage
		{
			return this._1450006828_SoundToggleButtonSkin_BitmapImage4;
		}
		
		public function set _SoundToggleButtonSkin_BitmapImage4(param1:BitmapImage) : void
		{
			var _loc2_:Object = this._1450006828_SoundToggleButtonSkin_BitmapImage4;
			if(_loc2_ !== param1)
			{
				this._1450006828_SoundToggleButtonSkin_BitmapImage4 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SoundToggleButtonSkin_BitmapImage4",_loc2_,param1));
				}
			}
		}
	}
}
