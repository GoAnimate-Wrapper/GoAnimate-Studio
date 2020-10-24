package anifire.studio.skins
{
	import anifire.studio.components.IconButton;
	import anifire.studio.components.PopUpAnchor;
	import anifire.studio.components.SearchSuggestionInput;
	import anifire.studio.components.SearchSuggestionList;
	import mx.binding.BindingManager;
	import mx.core.DeferredInstanceFromFunction;
	import mx.core.IFlexModuleFactory;
	import mx.core.IStateClient2;
	import mx.events.PropertyChangeEvent;
	import mx.states.AddItems;
	import mx.states.SetProperty;
	import mx.states.SetStyle;
	import mx.states.State;
	import spark.components.Button;
	import spark.components.Group;
	import spark.components.HGroup;
	import spark.components.Label;
	import spark.components.RichEditableText;
	import spark.skins.SparkSkin;
	
	public class SearchSuggestionInputSkin extends SparkSkin implements IStateClient2
	{
		
		private static const focusExclusions:Array = ["textDisplay","contentGroup"];
		 
		
		public var _SearchSuggestionInputSkin_HGroup2:HGroup;
		
		private var _1990131276cancelButton:Button;
		
		private var _236983790confirmButton:IconButton;
		
		private var _809612678contentGroup:HGroup;
		
		private var _433014735dropDown:Group;
		
		private var _106851532popUp:PopUpAnchor;
		
		private var _263438014promptDisplay:Label;
		
		private var _53785406suggestionList:SearchSuggestionList;
		
		private var _831827669textDisplay:RichEditableText;
		
		private var _1059785390textGroup:Group;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		private var _embed_mxml__styles_images_tray_magglass_png_474504759:Class;
		
		private var _213507019hostComponent:SearchSuggestionInput;
		
		public function SearchSuggestionInputSkin()
		{
			this._embed_mxml__styles_images_tray_magglass_png_474504759 = SearchSuggestionInputSkin__embed_mxml__styles_images_tray_magglass_png_474504759;
			super();
			mx_internal::_document = this;
			this.blendMode = "normal";
			this.mxmlContent = [this._SearchSuggestionInputSkin_PopUpAnchor1_i(),this._SearchSuggestionInputSkin_HGroup1_i()];
			this.currentState = "normal";
			var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._SearchSuggestionInputSkin_Label1_i);
			states = [new State({
				"name":"normal",
				"overrides":[]
			}),new State({
				"name":"focused",
				"overrides":[new SetStyle().initializeFromObject({
					"target":"cancelButton",
					"name":"color",
					"value":6382437
				})]
			}),new State({
				"name":"disabled",
				"stateGroups":["disabledStates"],
				"overrides":[new SetProperty().initializeFromObject({
					"name":"alpha",
					"value":0.5
				})]
			}),new State({
				"name":"normalWithPrompt",
				"stateGroups":["promptStates"],
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":_loc1_,
					"destination":"textGroup",
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["_SearchSuggestionInputSkin_HGroup2"]
				})]
			}),new State({
				"name":"disabledWithPrompt",
				"stateGroups":["promptStates","disabledStates"],
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":_loc1_,
					"destination":"textGroup",
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["_SearchSuggestionInputSkin_HGroup2"]
				}),new SetProperty().initializeFromObject({
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
		
		override public function get focusSkinExclusions() : Array
		{
			return focusExclusions;
		}
		
		private function _SearchSuggestionInputSkin_PopUpAnchor1_i() : PopUpAnchor
		{
			var _loc1_:PopUpAnchor = new PopUpAnchor();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.popUpWidthMatchesAnchorWidth = true;
			_loc1_.popUpPosition = "below";
			_loc1_.popUp = this._SearchSuggestionInputSkin_Group1_i();
			_loc1_.id = "popUp";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.popUp = _loc1_;
			BindingManager.executeBindings(this,"popUp",this.popUp);
			return _loc1_;
		}
		
		private function _SearchSuggestionInputSkin_Group1_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.percentWidth = 100;
			_loc1_.mxmlContent = [this._SearchSuggestionInputSkin_SearchSuggestionList1_i()];
			_loc1_.id = "dropDown";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.dropDown = _loc1_;
			BindingManager.executeBindings(this,"dropDown",this.dropDown);
			return _loc1_;
		}
		
		private function _SearchSuggestionInputSkin_SearchSuggestionList1_i() : SearchSuggestionList
		{
			var _loc1_:SearchSuggestionList = new SearchSuggestionList();
			_loc1_.left = 0;
			_loc1_.top = 3;
			_loc1_.right = 0;
			_loc1_.bottom = 3;
			_loc1_.id = "suggestionList";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.suggestionList = _loc1_;
			BindingManager.executeBindings(this,"suggestionList",this.suggestionList);
			return _loc1_;
		}
		
		private function _SearchSuggestionInputSkin_HGroup1_i() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.gap = 3;
			_loc1_.percentWidth = 100;
			_loc1_.verticalAlign = "middle";
			_loc1_.paddingLeft = 7;
			_loc1_.paddingRight = 5;
			_loc1_.paddingTop = 7;
			_loc1_.paddingBottom = 7;
			_loc1_.mxmlContent = [this._SearchSuggestionInputSkin_Group2_i()];
			_loc1_.id = "contentGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.contentGroup = _loc1_;
			BindingManager.executeBindings(this,"contentGroup",this.contentGroup);
			return _loc1_;
		}
		
		private function _SearchSuggestionInputSkin_Group2_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.mxmlContent = [this._SearchSuggestionInputSkin_HGroup2_i()];
			_loc1_.id = "textGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.textGroup = _loc1_;
			BindingManager.executeBindings(this,"textGroup",this.textGroup);
			return _loc1_;
		}
		
		private function _SearchSuggestionInputSkin_HGroup2_i() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.verticalAlign = "middle";
			_loc1_.gap = 3;
			_loc1_.mxmlContent = [this._SearchSuggestionInputSkin_RichEditableText1_i(),this._SearchSuggestionInputSkin_Button1_i(),this._SearchSuggestionInputSkin_IconButton1_i()];
			_loc1_.id = "_SearchSuggestionInputSkin_HGroup2";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._SearchSuggestionInputSkin_HGroup2 = _loc1_;
			BindingManager.executeBindings(this,"_SearchSuggestionInputSkin_HGroup2",this._SearchSuggestionInputSkin_HGroup2);
			return _loc1_;
		}
		
		private function _SearchSuggestionInputSkin_RichEditableText1_i() : RichEditableText
		{
			var _loc1_:RichEditableText = new RichEditableText();
			_loc1_.percentWidth = 100;
			_loc1_.setStyle("textAlign","left");
			_loc1_.setStyle("color",16777215);
			_loc1_.setStyle("paddingTop",4);
			_loc1_.setStyle("fontSize",13);
			_loc1_.id = "textDisplay";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.textDisplay = _loc1_;
			BindingManager.executeBindings(this,"textDisplay",this.textDisplay);
			return _loc1_;
		}
		
		private function _SearchSuggestionInputSkin_Button1_i() : Button
		{
			var _loc1_:Button = new Button();
			_loc1_.buttonMode = true;
			_loc1_.setStyle("color",16777215);
			_loc1_.setStyle("skinClass",ClearCharacterActionButtonSkin);
			_loc1_.id = "cancelButton";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.cancelButton = _loc1_;
			BindingManager.executeBindings(this,"cancelButton",this.cancelButton);
			return _loc1_;
		}
		
		private function _SearchSuggestionInputSkin_IconButton1_i() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.setStyle("icon",this._embed_mxml__styles_images_tray_magglass_png_474504759);
			_loc1_.id = "confirmButton";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.confirmButton = _loc1_;
			BindingManager.executeBindings(this,"confirmButton",this.confirmButton);
			return _loc1_;
		}
		
		private function _SearchSuggestionInputSkin_Label1_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.maxDisplayedLines = 1;
			_loc1_.percentWidth = 100;
			_loc1_.mouseEnabled = false;
			_loc1_.mouseChildren = false;
			_loc1_.setStyle("paddingTop",4);
			_loc1_.setStyle("textAlign","left");
			_loc1_.setStyle("verticalAlign","middle");
			_loc1_.setStyle("color",6133984);
			_loc1_.setStyle("fontSize",13);
			_loc1_.id = "promptDisplay";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.promptDisplay = _loc1_;
			BindingManager.executeBindings(this,"promptDisplay",this.promptDisplay);
			return _loc1_;
		}
		
		[Bindable(event="propertyChange")]
		public function get cancelButton() : Button
		{
			return this._1990131276cancelButton;
		}
		
		public function set cancelButton(param1:Button) : void
		{
			var _loc2_:Object = this._1990131276cancelButton;
			if(_loc2_ !== param1)
			{
				this._1990131276cancelButton = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cancelButton",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get confirmButton() : IconButton
		{
			return this._236983790confirmButton;
		}
		
		public function set confirmButton(param1:IconButton) : void
		{
			var _loc2_:Object = this._236983790confirmButton;
			if(_loc2_ !== param1)
			{
				this._236983790confirmButton = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"confirmButton",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get contentGroup() : HGroup
		{
			return this._809612678contentGroup;
		}
		
		public function set contentGroup(param1:HGroup) : void
		{
			var _loc2_:Object = this._809612678contentGroup;
			if(_loc2_ !== param1)
			{
				this._809612678contentGroup = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"contentGroup",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get dropDown() : Group
		{
			return this._433014735dropDown;
		}
		
		public function set dropDown(param1:Group) : void
		{
			var _loc2_:Object = this._433014735dropDown;
			if(_loc2_ !== param1)
			{
				this._433014735dropDown = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dropDown",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get popUp() : PopUpAnchor
		{
			return this._106851532popUp;
		}
		
		public function set popUp(param1:PopUpAnchor) : void
		{
			var _loc2_:Object = this._106851532popUp;
			if(_loc2_ !== param1)
			{
				this._106851532popUp = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"popUp",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get promptDisplay() : Label
		{
			return this._263438014promptDisplay;
		}
		
		public function set promptDisplay(param1:Label) : void
		{
			var _loc2_:Object = this._263438014promptDisplay;
			if(_loc2_ !== param1)
			{
				this._263438014promptDisplay = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"promptDisplay",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get suggestionList() : SearchSuggestionList
		{
			return this._53785406suggestionList;
		}
		
		public function set suggestionList(param1:SearchSuggestionList) : void
		{
			var _loc2_:Object = this._53785406suggestionList;
			if(_loc2_ !== param1)
			{
				this._53785406suggestionList = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"suggestionList",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get textDisplay() : RichEditableText
		{
			return this._831827669textDisplay;
		}
		
		public function set textDisplay(param1:RichEditableText) : void
		{
			var _loc2_:Object = this._831827669textDisplay;
			if(_loc2_ !== param1)
			{
				this._831827669textDisplay = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textDisplay",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get textGroup() : Group
		{
			return this._1059785390textGroup;
		}
		
		public function set textGroup(param1:Group) : void
		{
			var _loc2_:Object = this._1059785390textGroup;
			if(_loc2_ !== param1)
			{
				this._1059785390textGroup = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textGroup",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get hostComponent() : SearchSuggestionInput
		{
			return this._213507019hostComponent;
		}
		
		public function set hostComponent(param1:SearchSuggestionInput) : void
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
