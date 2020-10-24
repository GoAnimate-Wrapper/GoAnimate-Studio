package anifire.studio.skins
{
	import mx.binding.BindingManager;
	import mx.core.DeferredInstanceFromFunction;
	import mx.core.IFlexModuleFactory;
	import mx.core.IStateClient2;
	import mx.events.PropertyChangeEvent;
	import mx.graphics.SolidColor;
	import mx.states.AddItems;
	import mx.states.SetProperty;
	import mx.states.State;
	import spark.components.Group;
	import spark.components.Label;
	import spark.components.PopUpAnchor;
	import spark.primitives.BitmapImage;
	import spark.primitives.Path;
	import spark.primitives.Rect;
	import spark.skins.SparkButtonSkin;
	
	public class MicRecordButtonSkin extends SparkButtonSkin implements IStateClient2
	{
		
		private static const exclusions:Array = ["labelDisplay"];
		 
		
		private var _1418388803_MicRecordButtonSkin_BitmapImage2:BitmapImage;
		
		public var _MicRecordButtonSkin_PopUpAnchor1:PopUpAnchor;
		
		private var _2064979230customToolTipLabel:Label;
		
		private var _268453613popUpGroup:Group;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		private var cornerRadius:Number = 2;
		
		private var _embed_mxml__styles_images_panel_voice_record_hover_png_1155513161:Class;
		
		private var _embed_mxml__styles_images_panel_voice_record_png_1082760769:Class;
		
		public function MicRecordButtonSkin()
		{
			this._embed_mxml__styles_images_panel_voice_record_hover_png_1155513161 = MicRecordButtonSkin__embed_mxml__styles_images_panel_voice_record_hover_png_1155513161;
			this._embed_mxml__styles_images_panel_voice_record_png_1082760769 = MicRecordButtonSkin__embed_mxml__styles_images_panel_voice_record_png_1082760769;
			super();
			mx_internal::_document = this;
			this.minWidth = 21;
			this.minHeight = 21;
			this.mxmlContent = [this._MicRecordButtonSkin_BitmapImage1_c(),this._MicRecordButtonSkin_BitmapImage2_i()];
			this.currentState = "up";
			var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._MicRecordButtonSkin_PopUpAnchor1_i);
			states = [new State({
				"name":"up",
				"overrides":[]
			}),new State({
				"name":"over",
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":_loc1_,
					"destination":null,
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["_MicRecordButtonSkin_BitmapImage2"]
				}),new SetProperty().initializeFromObject({
					"target":"_MicRecordButtonSkin_BitmapImage2",
					"name":"visible",
					"value":true
				})]
			}),new State({
				"name":"down",
				"overrides":[]
			}),new State({
				"name":"disabled",
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
		
		private function _MicRecordButtonSkin_BitmapImage1_c() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.source = this._embed_mxml__styles_images_panel_voice_record_png_1082760769;
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _MicRecordButtonSkin_BitmapImage2_i() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.source = this._embed_mxml__styles_images_panel_voice_record_hover_png_1155513161;
			_loc1_.visible = false;
			_loc1_.initialized(this,"_MicRecordButtonSkin_BitmapImage2");
			this._MicRecordButtonSkin_BitmapImage2 = _loc1_;
			BindingManager.executeBindings(this,"_MicRecordButtonSkin_BitmapImage2",this._MicRecordButtonSkin_BitmapImage2);
			return _loc1_;
		}
		
		private function _MicRecordButtonSkin_PopUpAnchor1_i() : PopUpAnchor
		{
			var _loc1_:PopUpAnchor = new PopUpAnchor();
			_loc1_.left = -15;
			_loc1_.right = 0;
			_loc1_.bottom = 5;
			_loc1_.popUpPosition = "below";
			_loc1_.displayPopUp = true;
			_loc1_.scaleX = 2;
			_loc1_.scaleY = 2;
			_loc1_.popUp = this._MicRecordButtonSkin_Group1_i();
			_loc1_.id = "_MicRecordButtonSkin_PopUpAnchor1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._MicRecordButtonSkin_PopUpAnchor1 = _loc1_;
			BindingManager.executeBindings(this,"_MicRecordButtonSkin_PopUpAnchor1",this._MicRecordButtonSkin_PopUpAnchor1);
			return _loc1_;
		}
		
		private function _MicRecordButtonSkin_Group1_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.width = 50;
			_loc1_.mouseEnabled = false;
			_loc1_.mouseChildren = false;
			_loc1_.blendMode = "layer";
			_loc1_.alpha = 0.9;
			_loc1_.mxmlContent = [this._MicRecordButtonSkin_Path1_c(),this._MicRecordButtonSkin_Group2_c()];
			_loc1_.id = "popUpGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.popUpGroup = _loc1_;
			BindingManager.executeBindings(this,"popUpGroup",this.popUpGroup);
			return _loc1_;
		}
		
		private function _MicRecordButtonSkin_Path1_c() : Path
		{
			var _loc1_:Path = new Path();
			_loc1_.horizontalCenter = 0;
			_loc1_.data = "M 0 5 l 5 -5 l 5 5 Z";
			_loc1_.fill = this._MicRecordButtonSkin_SolidColor1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _MicRecordButtonSkin_SolidColor1_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 2829099;
			return _loc1_;
		}
		
		private function _MicRecordButtonSkin_Group2_c() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.minWidth = 50;
			_loc1_.horizontalCenter = 0;
			_loc1_.top = 5;
			_loc1_.mxmlContent = [this._MicRecordButtonSkin_Rect1_c(),this._MicRecordButtonSkin_Label1_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _MicRecordButtonSkin_Rect1_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.fill = this._MicRecordButtonSkin_SolidColor2_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _MicRecordButtonSkin_SolidColor2_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 2829099;
			return _loc1_;
		}
		
		private function _MicRecordButtonSkin_Label1_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.setStyle("color",16777215);
			_loc1_.setStyle("textAlign","center");
			_loc1_.setStyle("paddingLeft",10);
			_loc1_.setStyle("paddingRight",10);
			_loc1_.setStyle("paddingTop",5);
			_loc1_.setStyle("paddingBottom",5);
			_loc1_.id = "customToolTipLabel";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.customToolTipLabel = _loc1_;
			BindingManager.executeBindings(this,"customToolTipLabel",this.customToolTipLabel);
			return _loc1_;
		}
		
		[Bindable(event="propertyChange")]
		public function get _MicRecordButtonSkin_BitmapImage2() : BitmapImage
		{
			return this._1418388803_MicRecordButtonSkin_BitmapImage2;
		}
		
		public function set _MicRecordButtonSkin_BitmapImage2(param1:BitmapImage) : void
		{
			var _loc2_:Object = this._1418388803_MicRecordButtonSkin_BitmapImage2;
			if(_loc2_ !== param1)
			{
				this._1418388803_MicRecordButtonSkin_BitmapImage2 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_MicRecordButtonSkin_BitmapImage2",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get customToolTipLabel() : Label
		{
			return this._2064979230customToolTipLabel;
		}
		
		public function set customToolTipLabel(param1:Label) : void
		{
			var _loc2_:Object = this._2064979230customToolTipLabel;
			if(_loc2_ !== param1)
			{
				this._2064979230customToolTipLabel = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"customToolTipLabel",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get popUpGroup() : Group
		{
			return this._268453613popUpGroup;
		}
		
		public function set popUpGroup(param1:Group) : void
		{
			var _loc2_:Object = this._268453613popUpGroup;
			if(_loc2_ !== param1)
			{
				this._268453613popUpGroup = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"popUpGroup",_loc2_,param1));
				}
			}
		}
	}
}
