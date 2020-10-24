package anifire.studio.skins
{
	import mx.binding.BindingManager;
	import mx.core.IFlexModuleFactory;
	import mx.core.IStateClient2;
	import mx.states.State;
	import spark.components.HGroup;
	import spark.components.Label;
	import spark.primitives.BitmapImage;
	import spark.skins.SparkButtonSkin;
	
	public class AddAssetTransitionButtonSkin extends SparkButtonSkin implements IStateClient2
	{
		
		private static const exclusions:Array = ["labelDisplay"];
		 
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		private var cornerRadius:Number = 2;
		
		private var _embed_mxml__styles_images_panel_enterexit_add_png_1988917465:Class;
		
		public function AddAssetTransitionButtonSkin()
		{
			this._embed_mxml__styles_images_panel_enterexit_add_png_1988917465 = AddAssetTransitionButtonSkin__embed_mxml__styles_images_panel_enterexit_add_png_1988917465;
			super();
			mx_internal::_document = this;
			this.minWidth = 21;
			this.minHeight = 21;
			this.mxmlContent = [this._AddAssetTransitionButtonSkin_HGroup1_c()];
			this.currentState = "up";
			states = [new State({
				"name":"up",
				"overrides":[]
			}),new State({
				"name":"over",
				"overrides":[]
			}),new State({
				"name":"down",
				"overrides":[]
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
		
		override public function get colorizeExclusions() : Array
		{
			return exclusions;
		}
		
		override protected function initializationComplete() : void
		{
			useChromeColor = true;
			super.initializationComplete();
		}
		
		override protected function updateDisplayList(param1:Number, param2:Number) : void
		{
			var _loc3_:Number = getStyle("cornerRadius");
			if(this.cornerRadius != _loc3_)
			{
				this.cornerRadius = _loc3_;
			}
			super.updateDisplayList(param1,param2);
		}
		
		private function _AddAssetTransitionButtonSkin_HGroup1_c() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.verticalAlign = "middle";
			_loc1_.mxmlContent = [this._AddAssetTransitionButtonSkin_Label1_i(),this._AddAssetTransitionButtonSkin_BitmapImage1_c()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _AddAssetTransitionButtonSkin_Label1_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.width = 40;
			_loc1_.setStyle("textAlign","right");
			_loc1_.setStyle("color",2210726);
			_loc1_.setStyle("fontWeight","bold");
			_loc1_.setStyle("fontSize",10);
			_loc1_.setStyle("typographicCase","uppercase");
			_loc1_.id = "labelDisplay";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			labelDisplay = _loc1_;
			BindingManager.executeBindings(this,"labelDisplay",labelDisplay);
			return _loc1_;
		}
		
		private function _AddAssetTransitionButtonSkin_BitmapImage1_c() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.source = this._embed_mxml__styles_images_panel_enterexit_add_png_1988917465;
			_loc1_.initialized(this,null);
			return _loc1_;
		}
	}
}
