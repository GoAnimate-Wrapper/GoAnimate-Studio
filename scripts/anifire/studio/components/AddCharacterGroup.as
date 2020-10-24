package anifire.studio.components
{
	import mx.binding.BindingManager;
	import mx.core.DeferredInstanceFromFunction;
	import mx.core.IFlexModuleFactory;
	import mx.core.IStateClient2;
	import mx.states.AddItems;
	import mx.states.SetProperty;
	import mx.states.State;
	import spark.components.Group;
	import spark.primitives.BitmapImage;
	
	public class AddCharacterGroup extends Group implements IStateClient2
	{
		 
		
		public var _AddCharacterGroup_BitmapImage1:BitmapImage;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		protected var _active:Boolean;
		
		private var _embed_mxml__styles_images_tray_add_cc_png_962341247:Class;
		
		public function AddCharacterGroup()
		{
			this._embed_mxml__styles_images_tray_add_cc_png_962341247 = AddCharacterGroup__embed_mxml__styles_images_tray_add_cc_png_962341247;
			super();
			mx_internal::_document = this;
			this.mxmlContent = [];
			this.currentState = "normal";
			var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._AddCharacterGroup_BitmapImage1_i);
			states = [new State({
				"name":"normal",
				"overrides":[new SetProperty().initializeFromObject({
					"name":"visible",
					"value":false
				})]
			}),new State({
				"name":"active",
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":_loc1_,
					"destination":null,
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
		
		public function get active() : Boolean
		{
			return this._active;
		}
		
		public function set active(param1:Boolean) : void
		{
			if(param1 != this._active)
			{
				this._active = param1;
				currentState = !!this._active?"active":"normal";
			}
		}
		
		private function _AddCharacterGroup_BitmapImage1_i() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.source = this._embed_mxml__styles_images_tray_add_cc_png_962341247;
			_loc1_.initialized(this,"_AddCharacterGroup_BitmapImage1");
			this._AddCharacterGroup_BitmapImage1 = _loc1_;
			BindingManager.executeBindings(this,"_AddCharacterGroup_BitmapImage1",this._AddCharacterGroup_BitmapImage1);
			return _loc1_;
		}
	}
}
