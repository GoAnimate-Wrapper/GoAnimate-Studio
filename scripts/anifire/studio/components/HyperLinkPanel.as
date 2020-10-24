package anifire.studio.components
{
	import anifire.studio.assets.controllers.TextCollectionController;
	import anifire.studio.core.BubbleAsset;
	import anifire.studio.events.AssetCollectionEvent;
	import anifire.studio.skins.AddLinkButtonSkin;
	import anifire.studio.validators.HyperLinkValidator;
	import anifire.util.UtilDict;
	import anifire.util.UtilSite;
	import anifire.util.UtilUser;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.getDefinitionByName;
	import mx.binding.Binding;
	import mx.binding.BindingManager;
	import mx.binding.IBindingClient;
	import mx.binding.IWatcherSetupUtil2;
	import mx.core.DeferredInstanceFromFunction;
	import mx.core.IFlexModuleFactory;
	import mx.core.IStateClient2;
	import mx.core.mx_internal;
	import mx.events.FlexEvent;
	import mx.events.PropertyChangeEvent;
	import mx.events.ValidationResultEvent;
	import mx.graphics.SolidColor;
	import mx.graphics.SolidColorStroke;
	import mx.states.AddItems;
	import mx.states.SetStyle;
	import mx.states.State;
	import spark.components.CheckBox;
	import spark.components.Group;
	import spark.components.Label;
	import spark.components.RichText;
	import spark.components.VGroup;
	import spark.events.TextOperationEvent;
	import spark.primitives.Line;
	import spark.primitives.Path;
	import spark.primitives.Rect;
	
	use namespace mx_internal;
	
	public class HyperLinkPanel extends Group implements IBindingClient, IStateClient2
	{
		
		private static var DEFAULT_URL:String = UtilDict.toDisplay("go","hlwin_default");
		
		private static var VAL_URL:String = UtilDict.toDisplay("go","Your link looks all good!");
		
		private static var _watcherSetupUtil:IWatcherSetupUtil2;
		 
		
		private var _538666691UrlValidator:HyperLinkValidator;
		
		public var _HyperLinkPanel_Group2:Group;
		
		private var _25980249_HyperLinkPanel_VGroup2:VGroup;
		
		private var _205984886btnLink:IconButton;
		
		private var _611758404checkNewWin:CheckBox;
		
		private var _1279270963helpLabel:Label;
		
		private var _66491520mainContent:VGroup;
		
		private var _1304200403messageLabel:Label;
		
		private var _990662757urlInput:FocusTextInput;
		
		private var _1198930449validateMessage:RichText;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		private var _bubbleAsset:BubbleAsset;
		
		private var _allowExternalLink:Boolean = false;
		
		private var _controller:TextCollectionController;
		
		private var _873112108messageText:String;
		
		private var _381878489maxChars:int;
		
		private var _2946224_url:String;
		
		private var _789774322helpText:String;
		
		private var _embed_mxml__styles_images_common_addlink_icon_png_1921952449:Class;
		
		mx_internal var _bindings:Array;
		
		mx_internal var _watchers:Array;
		
		mx_internal var _bindingsByDestination:Object;
		
		mx_internal var _bindingsBeginWithWord:Object;
		
		public function HyperLinkPanel()
		{
			var bindings:Array = null;
			var target:Object = null;
			var watcherSetupUtilClass:Object = null;
			this._embed_mxml__styles_images_common_addlink_icon_png_1921952449 = HyperLinkPanel__embed_mxml__styles_images_common_addlink_icon_png_1921952449;
			this._bindings = [];
			this._watchers = [];
			this._bindingsByDestination = {};
			this._bindingsBeginWithWord = {};
			super();
			mx_internal::_document = this;
			bindings = this._HyperLinkPanel_bindingsSetup();
			var watchers:Array = [];
			target = this;
			if(_watcherSetupUtil == null)
			{
				watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_HyperLinkPanelWatcherSetupUtil");
				watcherSetupUtilClass["init"](null);
			}
			_watcherSetupUtil.setup(this,function(param1:String):*
			{
				return target[param1];
			},function(param1:String):*
			{
				return HyperLinkPanel[param1];
			},bindings,watchers);
			mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
			mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
			this.percentWidth = 100;
			this.mxmlContent = [];
			this.currentState = "normal";
			this._HyperLinkPanel_HyperLinkValidator1_i();
			this.addEventListener("creationComplete",this.___HyperLinkPanel_Group1_creationComplete);
			var _HyperLinkPanel_Group2_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._HyperLinkPanel_Group2_i);
			var _HyperLinkPanel_IconButton1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._HyperLinkPanel_IconButton1_i);
			var _HyperLinkPanel_VGroup1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._HyperLinkPanel_VGroup1_i);
			states = [new State({
				"name":"normal",
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":_HyperLinkPanel_IconButton1_factory,
					"destination":null,
					"propertyName":"mxmlContent",
					"position":"first"
				})]
			}),new State({
				"name":"expand",
				"stateGroups":["expandedStates"],
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":_HyperLinkPanel_VGroup1_factory,
					"destination":null,
					"propertyName":"mxmlContent",
					"position":"first"
				})]
			}),new State({
				"name":"expandAndValid",
				"stateGroups":["expandedStates"],
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":_HyperLinkPanel_VGroup1_factory,
					"destination":null,
					"propertyName":"mxmlContent",
					"position":"first"
				})]
			}),new State({
				"name":"expandAndInvalid",
				"stateGroups":["expandedStates"],
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":_HyperLinkPanel_Group2_factory,
					"destination":"_HyperLinkPanel_VGroup2",
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["urlInput"]
				}),new AddItems().initializeFromObject({
					"itemsFactory":_HyperLinkPanel_VGroup1_factory,
					"destination":null,
					"propertyName":"mxmlContent",
					"position":"first"
				}),new SetStyle().initializeFromObject({
					"target":"urlInput",
					"name":"borderColor",
					"value":16736613
				})]
			})];
			var i:uint = 0;
			while(i < bindings.length)
			{
				Binding(bindings[i]).execute();
				i++;
			}
		}
		
		public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
		{
			HyperLinkPanel._watcherSetupUtil = param1;
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
		
		private function onCreationComplete() : void
		{
			this.helpText = UtilDict.toDisplay("go","Note: Links only work when watching videos on GoAnimate or using GoAnimate\'s player on other sites.\nLinks are lost when downloading or exporting videos.");
			if(UtilUser.hasProFeatures)
			{
				this._allowExternalLink = true;
				DEFAULT_URL = "http://";
				this.messageText = UtilDict.toDisplay("go","Add a link to any website");
				this.maxChars = 0;
			}
			else
			{
				DEFAULT_URL = UtilSite.domainName;
				this.maxChars = 99;
				this.messageText = UtilDict.toDisplay("go","Add a link to a GoAnimate page");
			}
			this.updateForm();
		}
		
		public function set target(param1:Object) : void
		{
			if(param1 is TextCollectionController)
			{
				if(this._controller)
				{
					this._controller.removeEventListener(AssetCollectionEvent.COLLECTION_CHANGED,this.onTargetCollectionChanged);
				}
				this._controller = param1 as TextCollectionController;
				this._bubbleAsset = (param1 as TextCollectionController).singleBubbleAsset;
				this.updateForm();
				this._controller.addEventListener(AssetCollectionEvent.COLLECTION_CHANGED,this.onTargetCollectionChanged);
			}
		}
		
		private function updateForm() : void
		{
			var _loc1_:String = null;
			if(this._bubbleAsset && this._bubbleAsset.bubble)
			{
				_loc1_ = this._bubbleAsset.bubble.textURL;
				if(_loc1_ && _loc1_ != "")
				{
					currentState = "expandAndValid";
					if(_loc1_.indexOf("http") != 0)
					{
						_loc1_ = UtilSite.domainName + _loc1_;
					}
					this._url = _loc1_;
					if(this._bubbleAsset.bubble.islinkNewWin)
					{
						this.checkNewWin.selected = true;
					}
					else
					{
						this.checkNewWin.selected = false;
					}
					this.UrlValidator.validate(this._url);
				}
				else
				{
					currentState = "normal";
				}
			}
		}
		
		private function saveURL() : void
		{
			var _loc1_:String = this._url;
			if(_loc1_ == DEFAULT_URL)
			{
				_loc1_ = "";
			}
			if(_loc1_.length > 0 && _loc1_.indexOf("http") != 0)
			{
				_loc1_ = "http://" + _loc1_;
			}
			var _loc2_:RegExp = /(http:\/\/)?(\w*\.)?goanimate\.\w*\//;
			if(_loc1_.search(_loc2_) == 0)
			{
				_loc1_ = _loc1_.replace(_loc2_,"");
			}
			if(!this._allowExternalLink)
			{
				if(_loc1_.indexOf("http") == 0)
				{
					_loc1_ = _loc1_.substr(4);
				}
			}
			if(this._bubbleAsset)
			{
				this._bubbleAsset.bubble.textURL = _loc1_;
				this._bubbleAsset.bubble.islinkNewWin = this.checkNewWin.selected;
			}
		}
		
		private function reset() : void
		{
			if(this._bubbleAsset)
			{
				this._bubbleAsset.bubble.textURL = "";
			}
			this._url = DEFAULT_URL;
			currentState = "normal";
		}
		
		private function onUrlChange(param1:Event) : void
		{
			this._url = this.urlInput.text;
			this.UrlValidator.validate(this._url);
		}
		
		private function onUrlFocusIn(param1:Event) : void
		{
			if(!this._allowExternalLink)
			{
				this.urlInput.selectAll();
			}
		}
		
		private function onUrlInvalid(param1:ValidationResultEvent) : void
		{
			currentState = "expandAndInvalid";
			this.validateMessage.text = param1.message;
		}
		
		private function onUrlValid(param1:ValidationResultEvent) : void
		{
			currentState = "expandAndValid";
			this.saveURL();
		}
		
		private function onUrlInputCancel() : void
		{
			currentState = "normal";
		}
		
		private function onClickNewWin() : void
		{
			this.UrlValidator.validate(this._url);
		}
		
		private function onTargetCollectionChanged(param1:AssetCollectionEvent) : void
		{
			this._bubbleAsset = this._controller.singleBubbleAsset;
			this.updateForm();
		}
		
		private function onLinkButtonClick() : void
		{
			currentState = "expand";
			this._url = DEFAULT_URL;
			this.checkNewWin.selected = false;
		}
		
		private function _HyperLinkPanel_HyperLinkValidator1_i() : HyperLinkValidator
		{
			var _loc1_:HyperLinkValidator = new HyperLinkValidator();
			_loc1_.addEventListener("invalid",this.__UrlValidator_invalid);
			_loc1_.addEventListener("valid",this.__UrlValidator_valid);
			_loc1_.initialized(this,"UrlValidator");
			this.UrlValidator = _loc1_;
			BindingManager.executeBindings(this,"UrlValidator",this.UrlValidator);
			return _loc1_;
		}
		
		public function __UrlValidator_invalid(param1:ValidationResultEvent) : void
		{
			this.onUrlInvalid(param1);
		}
		
		public function __UrlValidator_valid(param1:ValidationResultEvent) : void
		{
			this.onUrlValid(param1);
		}
		
		private function _HyperLinkPanel_IconButton1_i() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.buttonMode = true;
			_loc1_.height = 32;
			_loc1_.setStyle("skinClass",AddLinkButtonSkin);
			_loc1_.setStyle("icon",this._embed_mxml__styles_images_common_addlink_icon_png_1921952449);
			_loc1_.addEventListener("click",this.__btnLink_click);
			_loc1_.id = "btnLink";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.btnLink = _loc1_;
			BindingManager.executeBindings(this,"btnLink",this.btnLink);
			return _loc1_;
		}
		
		public function __btnLink_click(param1:MouseEvent) : void
		{
			this.onLinkButtonClick();
		}
		
		private function _HyperLinkPanel_VGroup1_i() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.percentWidth = 100;
			_loc1_.gap = 14;
			_loc1_.mxmlContent = [this._HyperLinkPanel_VGroup2_i(),this._HyperLinkPanel_Label1_i(),this._HyperLinkPanel_CheckBox1_i(),this._HyperLinkPanel_Line1_c(),this._HyperLinkPanel_Label2_i()];
			_loc1_.id = "mainContent";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.mainContent = _loc1_;
			BindingManager.executeBindings(this,"mainContent",this.mainContent);
			return _loc1_;
		}
		
		private function _HyperLinkPanel_VGroup2_i() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.percentWidth = 100;
			_loc1_.gap = -4;
			_loc1_.mxmlContent = [this._HyperLinkPanel_FocusTextInput1_i()];
			_loc1_.id = "_HyperLinkPanel_VGroup2";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._HyperLinkPanel_VGroup2 = _loc1_;
			BindingManager.executeBindings(this,"_HyperLinkPanel_VGroup2",this._HyperLinkPanel_VGroup2);
			return _loc1_;
		}
		
		private function _HyperLinkPanel_FocusTextInput1_i() : FocusTextInput
		{
			var _loc1_:FocusTextInput = new FocusTextInput();
			_loc1_.percentWidth = 100;
			_loc1_.isSearching = true;
			_loc1_.addEventListener("change",this.__urlInput_change);
			_loc1_.addEventListener("cancel",this.__urlInput_cancel);
			_loc1_.id = "urlInput";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.urlInput = _loc1_;
			BindingManager.executeBindings(this,"urlInput",this.urlInput);
			return _loc1_;
		}
		
		public function __urlInput_change(param1:TextOperationEvent) : void
		{
			this.onUrlChange(param1);
		}
		
		public function __urlInput_cancel(param1:Event) : void
		{
			this.reset();
		}
		
		private function _HyperLinkPanel_Group2_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.percentWidth = 100;
			_loc1_.mxmlContent = [this._HyperLinkPanel_Path1_c(),this._HyperLinkPanel_Group3_c()];
			_loc1_.id = "_HyperLinkPanel_Group2";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._HyperLinkPanel_Group2 = _loc1_;
			BindingManager.executeBindings(this,"_HyperLinkPanel_Group2",this._HyperLinkPanel_Group2);
			return _loc1_;
		}
		
		private function _HyperLinkPanel_Path1_c() : Path
		{
			var _loc1_:Path = new Path();
			_loc1_.left = 6;
			_loc1_.top = 0;
			_loc1_.data = "M 0 6 l 6 -6 l 6 6 Z";
			_loc1_.fill = this._HyperLinkPanel_SolidColor1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _HyperLinkPanel_SolidColor1_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 13184304;
			return _loc1_;
		}
		
		private function _HyperLinkPanel_Group3_c() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.percentWidth = 100;
			_loc1_.top = 6;
			_loc1_.mxmlContent = [this._HyperLinkPanel_Rect1_c(),this._HyperLinkPanel_RichText1_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _HyperLinkPanel_Rect1_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.radiusX = 4;
			_loc1_.fill = this._HyperLinkPanel_SolidColor2_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _HyperLinkPanel_SolidColor2_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 13184304;
			return _loc1_;
		}
		
		private function _HyperLinkPanel_RichText1_i() : RichText
		{
			var _loc1_:RichText = new RichText();
			_loc1_.percentWidth = 100;
			_loc1_.setStyle("paddingLeft",10);
			_loc1_.setStyle("paddingRight",10);
			_loc1_.setStyle("paddingTop",7);
			_loc1_.setStyle("paddingBottom",7);
			_loc1_.setStyle("fontWeight","normal");
			_loc1_.setStyle("color",16777215);
			_loc1_.setStyle("fontSize",14);
			_loc1_.id = "validateMessage";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.validateMessage = _loc1_;
			BindingManager.executeBindings(this,"validateMessage",this.validateMessage);
			return _loc1_;
		}
		
		private function _HyperLinkPanel_Label1_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.percentWidth = 100;
			_loc1_.setStyle("fontWeight","bold");
			_loc1_.id = "messageLabel";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.messageLabel = _loc1_;
			BindingManager.executeBindings(this,"messageLabel",this.messageLabel);
			return _loc1_;
		}
		
		private function _HyperLinkPanel_CheckBox1_i() : CheckBox
		{
			var _loc1_:CheckBox = new CheckBox();
			_loc1_.percentWidth = 100;
			_loc1_.buttonMode = true;
			_loc1_.addEventListener("click",this.__checkNewWin_click);
			_loc1_.id = "checkNewWin";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.checkNewWin = _loc1_;
			BindingManager.executeBindings(this,"checkNewWin",this.checkNewWin);
			return _loc1_;
		}
		
		public function __checkNewWin_click(param1:MouseEvent) : void
		{
			this.onClickNewWin();
		}
		
		private function _HyperLinkPanel_Line1_c() : Line
		{
			var _loc1_:Line = new Line();
			_loc1_.percentWidth = 100;
			_loc1_.stroke = this._HyperLinkPanel_SolidColorStroke1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _HyperLinkPanel_SolidColorStroke1_c() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.color = 14870509;
			return _loc1_;
		}
		
		private function _HyperLinkPanel_Label2_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.percentWidth = 100;
			_loc1_.alpha = 0.7;
			_loc1_.setStyle("fontSize",12);
			_loc1_.id = "helpLabel";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.helpLabel = _loc1_;
			BindingManager.executeBindings(this,"helpLabel",this.helpLabel);
			return _loc1_;
		}
		
		public function ___HyperLinkPanel_Group1_creationComplete(param1:FlexEvent) : void
		{
			this.onCreationComplete();
		}
		
		private function _HyperLinkPanel_bindingsSetup() : Array
		{
			var result:Array = [];
			result[0] = new Binding(this,function():String
			{
				var _loc1_:* = _url;
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"urlInput.text");
			result[1] = new Binding(this,function():int
			{
				return maxChars;
			},null,"urlInput.maxChars");
			result[2] = new Binding(this,function():String
			{
				var _loc1_:* = messageText;
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"messageLabel.text");
			result[3] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Open link in a new window");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"checkNewWin.label");
			result[4] = new Binding(this,function():String
			{
				var _loc1_:* = helpText;
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"helpLabel.text");
			return result;
		}
		
		[Bindable(event="propertyChange")]
		public function get UrlValidator() : HyperLinkValidator
		{
			return this._538666691UrlValidator;
		}
		
		public function set UrlValidator(param1:HyperLinkValidator) : void
		{
			var _loc2_:Object = this._538666691UrlValidator;
			if(_loc2_ !== param1)
			{
				this._538666691UrlValidator = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"UrlValidator",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _HyperLinkPanel_VGroup2() : VGroup
		{
			return this._25980249_HyperLinkPanel_VGroup2;
		}
		
		public function set _HyperLinkPanel_VGroup2(param1:VGroup) : void
		{
			var _loc2_:Object = this._25980249_HyperLinkPanel_VGroup2;
			if(_loc2_ !== param1)
			{
				this._25980249_HyperLinkPanel_VGroup2 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_HyperLinkPanel_VGroup2",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get btnLink() : IconButton
		{
			return this._205984886btnLink;
		}
		
		public function set btnLink(param1:IconButton) : void
		{
			var _loc2_:Object = this._205984886btnLink;
			if(_loc2_ !== param1)
			{
				this._205984886btnLink = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnLink",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get checkNewWin() : CheckBox
		{
			return this._611758404checkNewWin;
		}
		
		public function set checkNewWin(param1:CheckBox) : void
		{
			var _loc2_:Object = this._611758404checkNewWin;
			if(_loc2_ !== param1)
			{
				this._611758404checkNewWin = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"checkNewWin",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get helpLabel() : Label
		{
			return this._1279270963helpLabel;
		}
		
		public function set helpLabel(param1:Label) : void
		{
			var _loc2_:Object = this._1279270963helpLabel;
			if(_loc2_ !== param1)
			{
				this._1279270963helpLabel = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"helpLabel",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get mainContent() : VGroup
		{
			return this._66491520mainContent;
		}
		
		public function set mainContent(param1:VGroup) : void
		{
			var _loc2_:Object = this._66491520mainContent;
			if(_loc2_ !== param1)
			{
				this._66491520mainContent = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mainContent",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get messageLabel() : Label
		{
			return this._1304200403messageLabel;
		}
		
		public function set messageLabel(param1:Label) : void
		{
			var _loc2_:Object = this._1304200403messageLabel;
			if(_loc2_ !== param1)
			{
				this._1304200403messageLabel = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"messageLabel",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get urlInput() : FocusTextInput
		{
			return this._990662757urlInput;
		}
		
		public function set urlInput(param1:FocusTextInput) : void
		{
			var _loc2_:Object = this._990662757urlInput;
			if(_loc2_ !== param1)
			{
				this._990662757urlInput = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"urlInput",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get validateMessage() : RichText
		{
			return this._1198930449validateMessage;
		}
		
		public function set validateMessage(param1:RichText) : void
		{
			var _loc2_:Object = this._1198930449validateMessage;
			if(_loc2_ !== param1)
			{
				this._1198930449validateMessage = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"validateMessage",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get messageText() : String
		{
			return this._873112108messageText;
		}
		
		private function set messageText(param1:String) : void
		{
			var _loc2_:Object = this._873112108messageText;
			if(_loc2_ !== param1)
			{
				this._873112108messageText = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"messageText",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get maxChars() : int
		{
			return this._381878489maxChars;
		}
		
		private function set maxChars(param1:int) : void
		{
			var _loc2_:Object = this._381878489maxChars;
			if(_loc2_ !== param1)
			{
				this._381878489maxChars = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"maxChars",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get _url() : String
		{
			return this._2946224_url;
		}
		
		private function set _url(param1:String) : void
		{
			var _loc2_:Object = this._2946224_url;
			if(_loc2_ !== param1)
			{
				this._2946224_url = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_url",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get helpText() : String
		{
			return this._789774322helpText;
		}
		
		private function set helpText(param1:String) : void
		{
			var _loc2_:Object = this._789774322helpText;
			if(_loc2_ !== param1)
			{
				this._789774322helpText = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"helpText",_loc2_,param1));
				}
			}
		}
	}
}
