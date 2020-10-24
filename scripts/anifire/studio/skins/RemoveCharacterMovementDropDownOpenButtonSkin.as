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
	import spark.primitives.Path;
	import spark.primitives.Rect;
	import spark.skins.SparkButtonSkin;
	
	public class RemoveCharacterMovementDropDownOpenButtonSkin extends SparkButtonSkin implements IStateClient2
	{
		 
		
		private var _1783681403_RemoveCharacterMovementDropDownOpenButtonSkin_BitmapImage1:BitmapImage;
		
		private var _2105021062_RemoveCharacterMovementDropDownOpenButtonSkin_SolidColor2:SolidColor;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		private var _embed_mxml__styles_images_toolbar_ico_walk_on_hover_png_872794167:Class;
		
		private var _embed_mxml__styles_images_toolbar_ico_walk_on_init_png_587201281:Class;
		
		public function RemoveCharacterMovementDropDownOpenButtonSkin()
		{
			this._embed_mxml__styles_images_toolbar_ico_walk_on_hover_png_872794167 = RemoveCharacterMovementDropDownOpenButtonSkin__embed_mxml__styles_images_toolbar_ico_walk_on_hover_png_872794167;
			this._embed_mxml__styles_images_toolbar_ico_walk_on_init_png_587201281 = RemoveCharacterMovementDropDownOpenButtonSkin__embed_mxml__styles_images_toolbar_ico_walk_on_init_png_587201281;
			super();
			mx_internal::_document = this;
			this.width = 46;
			this.height = 35;
			this.mxmlContent = [this._RemoveCharacterMovementDropDownOpenButtonSkin_Rect1_c(),this._RemoveCharacterMovementDropDownOpenButtonSkin_BitmapImage1_i(),this._RemoveCharacterMovementDropDownOpenButtonSkin_Path1_c()];
			this.currentState = "up";
			states = [new State({
				"name":"up",
				"overrides":[]
			}),new State({
				"name":"over",
				"stateGroups":["overAndDownStates"],
				"overrides":[new SetProperty().initializeFromObject({
					"target":"_RemoveCharacterMovementDropDownOpenButtonSkin_BitmapImage1",
					"name":"source",
					"value":this._embed_mxml__styles_images_toolbar_ico_walk_on_hover_png_872794167
				}),new SetProperty().initializeFromObject({
					"target":"_RemoveCharacterMovementDropDownOpenButtonSkin_SolidColor2",
					"name":"color",
					"value":16777215
				})]
			}),new State({
				"name":"down",
				"stateGroups":["overAndDownStates"],
				"overrides":[new SetProperty().initializeFromObject({
					"target":"_RemoveCharacterMovementDropDownOpenButtonSkin_BitmapImage1",
					"name":"source",
					"value":this._embed_mxml__styles_images_toolbar_ico_walk_on_hover_png_872794167
				}),new SetProperty().initializeFromObject({
					"target":"_RemoveCharacterMovementDropDownOpenButtonSkin_SolidColor2",
					"name":"color",
					"value":16777215
				})]
			}),new State({
				"name":"disabled",
				"overrides":[]
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
		
		private function _RemoveCharacterMovementDropDownOpenButtonSkin_Rect1_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.fill = this._RemoveCharacterMovementDropDownOpenButtonSkin_SolidColor1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _RemoveCharacterMovementDropDownOpenButtonSkin_SolidColor1_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.alpha = 0;
			return _loc1_;
		}
		
		private function _RemoveCharacterMovementDropDownOpenButtonSkin_BitmapImage1_i() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.verticalCenter = 0;
			_loc1_.horizontalCenter = 0;
			_loc1_.source = this._embed_mxml__styles_images_toolbar_ico_walk_on_init_png_587201281;
			_loc1_.initialized(this,"_RemoveCharacterMovementDropDownOpenButtonSkin_BitmapImage1");
			this._RemoveCharacterMovementDropDownOpenButtonSkin_BitmapImage1 = _loc1_;
			BindingManager.executeBindings(this,"_RemoveCharacterMovementDropDownOpenButtonSkin_BitmapImage1",this._RemoveCharacterMovementDropDownOpenButtonSkin_BitmapImage1);
			return _loc1_;
		}
		
		private function _RemoveCharacterMovementDropDownOpenButtonSkin_Path1_c() : Path
		{
			var _loc1_:Path = new Path();
			_loc1_.right = 2;
			_loc1_.bottom = 2;
			_loc1_.data = "M 0 5 L 5 5 L 5 0 Z";
			_loc1_.fill = this._RemoveCharacterMovementDropDownOpenButtonSkin_SolidColor2_i();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _RemoveCharacterMovementDropDownOpenButtonSkin_SolidColor2_i() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 12767718;
			this._RemoveCharacterMovementDropDownOpenButtonSkin_SolidColor2 = _loc1_;
			BindingManager.executeBindings(this,"_RemoveCharacterMovementDropDownOpenButtonSkin_SolidColor2",this._RemoveCharacterMovementDropDownOpenButtonSkin_SolidColor2);
			return _loc1_;
		}
		
		[Bindable(event="propertyChange")]
		public function get _RemoveCharacterMovementDropDownOpenButtonSkin_BitmapImage1() : BitmapImage
		{
			return this._1783681403_RemoveCharacterMovementDropDownOpenButtonSkin_BitmapImage1;
		}
		
		public function set _RemoveCharacterMovementDropDownOpenButtonSkin_BitmapImage1(param1:BitmapImage) : void
		{
			var _loc2_:Object = this._1783681403_RemoveCharacterMovementDropDownOpenButtonSkin_BitmapImage1;
			if(_loc2_ !== param1)
			{
				this._1783681403_RemoveCharacterMovementDropDownOpenButtonSkin_BitmapImage1 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_RemoveCharacterMovementDropDownOpenButtonSkin_BitmapImage1",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _RemoveCharacterMovementDropDownOpenButtonSkin_SolidColor2() : SolidColor
		{
			return this._2105021062_RemoveCharacterMovementDropDownOpenButtonSkin_SolidColor2;
		}
		
		public function set _RemoveCharacterMovementDropDownOpenButtonSkin_SolidColor2(param1:SolidColor) : void
		{
			var _loc2_:Object = this._2105021062_RemoveCharacterMovementDropDownOpenButtonSkin_SolidColor2;
			if(_loc2_ !== param1)
			{
				this._2105021062_RemoveCharacterMovementDropDownOpenButtonSkin_SolidColor2 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_RemoveCharacterMovementDropDownOpenButtonSkin_SolidColor2",_loc2_,param1));
				}
			}
		}
	}
}
