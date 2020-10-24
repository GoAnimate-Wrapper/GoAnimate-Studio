package anifire.studio.skins
{
	import anifire.studio.components.IconButton;
	import mx.binding.BindingManager;
	import mx.core.IFlexModuleFactory;
	import mx.core.IStateClient2;
	import mx.events.PropertyChangeEvent;
	import mx.states.SetStyle;
	import mx.states.State;
	import spark.components.Label;
	import spark.components.supportClasses.Skin;
	import spark.primitives.BitmapImage;
	
	public class AddLinkButtonSkin extends Skin implements IStateClient2
	{
		 
		
		private var _1031744009iconDisplay:BitmapImage;
		
		private var _1184053038labelDisplay:Label;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		private var _213507019hostComponent:IconButton;
		
		public function AddLinkButtonSkin()
		{
			super();
			mx_internal::_document = this;
			this.mxmlContent = [this._AddLinkButtonSkin_BitmapImage1_i(),this._AddLinkButtonSkin_Label1_i()];
			this.currentState = "disabled";
			states = [new State({
				"name":"disabled",
				"overrides":[]
			}),new State({
				"name":"down",
				"overrides":[]
			}),new State({
				"name":"over",
				"overrides":[new SetStyle().initializeFromObject({
					"target":"labelDisplay",
					"name":"color",
					"value":16552705
				})]
			}),new State({
				"name":"up",
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
		
		private function _AddLinkButtonSkin_BitmapImage1_i() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.smooth = true;
			_loc1_.verticalCenter = 0;
			_loc1_.horizontalCenter = 0;
			_loc1_.initialized(this,"iconDisplay");
			this.iconDisplay = _loc1_;
			BindingManager.executeBindings(this,"iconDisplay",this.iconDisplay);
			return _loc1_;
		}
		
		private function _AddLinkButtonSkin_Label1_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.verticalCenter = 0;
			_loc1_.setStyle("fontWeight","bold");
			_loc1_.id = "labelDisplay";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.labelDisplay = _loc1_;
			BindingManager.executeBindings(this,"labelDisplay",this.labelDisplay);
			return _loc1_;
		}
		
		[Bindable(event="propertyChange")]
		public function get iconDisplay() : BitmapImage
		{
			return this._1031744009iconDisplay;
		}
		
		public function set iconDisplay(param1:BitmapImage) : void
		{
			var _loc2_:Object = this._1031744009iconDisplay;
			if(_loc2_ !== param1)
			{
				this._1031744009iconDisplay = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"iconDisplay",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get labelDisplay() : Label
		{
			return this._1184053038labelDisplay;
		}
		
		public function set labelDisplay(param1:Label) : void
		{
			var _loc2_:Object = this._1184053038labelDisplay;
			if(_loc2_ !== param1)
			{
				this._1184053038labelDisplay = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"labelDisplay",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get hostComponent() : IconButton
		{
			return this._213507019hostComponent;
		}
		
		public function set hostComponent(param1:IconButton) : void
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
