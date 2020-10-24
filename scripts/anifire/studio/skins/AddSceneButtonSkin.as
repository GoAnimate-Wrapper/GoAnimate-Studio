package anifire.studio.skins
{
	import mx.core.IFlexModuleFactory;
	import mx.core.IStateClient2;
	import mx.events.PropertyChangeEvent;
	import mx.graphics.SolidColorStroke;
	import mx.states.State;
	import spark.components.Button;
	import spark.components.Group;
	import spark.components.supportClasses.Skin;
	import spark.primitives.BitmapImage;
	import spark.primitives.Line;
	
	public class AddSceneButtonSkin extends Skin implements IStateClient2
	{
		 
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		private var _embed_mxml__styles_images_timeline_timeline_add_png_156900351:Class;
		
		private var _213507019hostComponent:Button;
		
		public function AddSceneButtonSkin()
		{
			this._embed_mxml__styles_images_timeline_timeline_add_png_156900351 = AddSceneButtonSkin__embed_mxml__styles_images_timeline_timeline_add_png_156900351;
			super();
			mx_internal::_document = this;
			this.mxmlContent = [this._AddSceneButtonSkin_Group1_c(),this._AddSceneButtonSkin_Line1_c()];
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
		
		private function _AddSceneButtonSkin_Group1_c() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.left = 0;
			_loc1_.right = 1;
			_loc1_.height = 52;
			_loc1_.mxmlContent = [this._AddSceneButtonSkin_BitmapImage1_c()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _AddSceneButtonSkin_BitmapImage1_c() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.source = this._embed_mxml__styles_images_timeline_timeline_add_png_156900351;
			_loc1_.smooth = true;
			_loc1_.verticalCenter = 0;
			_loc1_.horizontalCenter = 0;
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _AddSceneButtonSkin_Line1_c() : Line
		{
			var _loc1_:Line = new Line();
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.stroke = this._AddSceneButtonSkin_SolidColorStroke1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _AddSceneButtonSkin_SolidColorStroke1_c() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.color = 14804459;
			return _loc1_;
		}
		
		[Bindable(event="propertyChange")]
		public function get hostComponent() : Button
		{
			return this._213507019hostComponent;
		}
		
		public function set hostComponent(param1:Button) : void
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
