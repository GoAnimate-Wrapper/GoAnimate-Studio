package anifire.studio.components
{
	import anifire.event.WidgetEvent;
	import anifire.studio.commands.ChangeWidgetTitleCommand;
	import anifire.studio.commands.ICommand;
	import anifire.studio.core.Widget;
	import anifire.studio.skins.AddTitleButton;
	import anifire.studio.skins.WidgetTextInputSkin;
	import anifire.util.UtilDict;
	import flash.events.Event;
	import flash.events.FocusEvent;
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
	import mx.states.AddItems;
	import mx.states.State;
	import spark.components.Button;
	import spark.components.Group;
	import spark.components.HGroup;
	import spark.components.Label;
	import spark.components.TextInput;
	import spark.components.VGroup;
	import spark.events.TextOperationEvent;
	
	use namespace mx_internal;
	
	public class WidgetTitleTextInput extends Group implements IBindingClient, IStateClient2
	{
		
		private static var _watcherSetupUtil:IWatcherSetupUtil2;
		 
		
		public var _WidgetTitleTextInput_Button1:Button;
		
		public var _WidgetTitleTextInput_Label1:Label;
		
		public var _WidgetTitleTextInput_VGroup1:VGroup;
		
		private var _1793852334titleInput:TextInput;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		private var _widget:Widget;
		
		private var _command:ICommand;
		
		private var _remainingTextHint:String;
		
		private var _1464826535_title:String;
		
		private var _embed_mxml__styles_images_icons_icon_trash_png_922299341:Class;
		
		mx_internal var _bindings:Array;
		
		mx_internal var _watchers:Array;
		
		mx_internal var _bindingsByDestination:Object;
		
		mx_internal var _bindingsBeginWithWord:Object;
		
		public function WidgetTitleTextInput()
		{
			var bindings:Array = null;
			var target:Object = null;
			var watcherSetupUtilClass:Object = null;
			this._embed_mxml__styles_images_icons_icon_trash_png_922299341 = WidgetTitleTextInput__embed_mxml__styles_images_icons_icon_trash_png_922299341;
			this._bindings = [];
			this._watchers = [];
			this._bindingsByDestination = {};
			this._bindingsBeginWithWord = {};
			super();
			mx_internal::_document = this;
			bindings = this._WidgetTitleTextInput_bindingsSetup();
			var watchers:Array = [];
			target = this;
			if(_watcherSetupUtil == null)
			{
				watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_WidgetTitleTextInputWatcherSetupUtil");
				watcherSetupUtilClass["init"](null);
			}
			_watcherSetupUtil.setup(this,function(param1:String):*
			{
				return target[param1];
			},function(param1:String):*
			{
				return WidgetTitleTextInput[param1];
			},bindings,watchers);
			mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
			mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
			this.mxmlContent = [];
			this.currentState = "normal";
			this.addEventListener("creationComplete",this.___WidgetTitleTextInput_Group1_creationComplete);
			var _WidgetTitleTextInput_Button1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._WidgetTitleTextInput_Button1_i);
			var _WidgetTitleTextInput_VGroup1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._WidgetTitleTextInput_VGroup1_i);
			states = [new State({
				"name":"normal",
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":_WidgetTitleTextInput_Button1_factory,
					"destination":null,
					"propertyName":"mxmlContent",
					"position":"first"
				})]
			}),new State({
				"name":"hasTitle",
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":_WidgetTitleTextInput_VGroup1_factory,
					"destination":null,
					"propertyName":"mxmlContent",
					"position":"first"
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
			WidgetTitleTextInput._watcherSetupUtil = param1;
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
		
		public function set target(param1:Object) : void
		{
			if(this._widget != param1)
			{
				if(this._widget)
				{
					this._widget.removeEventListener(WidgetEvent.WIDGET_DATA_CHANGE,this.onWidgetDataChange);
					this._widget = null;
				}
				this._widget = param1 as Widget;
				this.updateUI();
				if(this._widget)
				{
					this._widget.addEventListener(WidgetEvent.WIDGET_DATA_CHANGE,this.onWidgetDataChange);
				}
			}
		}
		
		private function onWidgetDataChange(param1:WidgetEvent) : void
		{
			this.updateUI();
		}
		
		private function updateUI() : void
		{
			if(this._widget)
			{
				this.text = this._widget.title;
			}
			else
			{
				this.text = "";
			}
		}
		
		public function set text(param1:String) : void
		{
			if(param1)
			{
				this._title = param1;
				this.currentState = "hasTitle";
			}
			else
			{
				this._title = "";
				this.currentState = "normal";
			}
		}
		
		public function get text() : String
		{
			return this._title;
		}
		
		protected function onDeleteButtonClick(param1:MouseEvent) : void
		{
			if(this._widget)
			{
				this._command = new ChangeWidgetTitleCommand(this._widget,"");
				(this._command as ChangeWidgetTitleCommand).executeNow("");
				this.currentState = "normal";
			}
		}
		
		protected function titleInput_changeHandler(param1:Event) : void
		{
			if(this._widget)
			{
				this._widget.title = this.titleInput.text;
			}
		}
		
		protected function titleInput_focusInHandler(param1:Event) : void
		{
			if(this._widget)
			{
				this._command = new ChangeWidgetTitleCommand(this._widget,this._widget.title);
			}
		}
		
		protected function titleInput_focusOutHandler(param1:Event) : void
		{
			if(this._command is ChangeWidgetTitleCommand)
			{
				(this._command as ChangeWidgetTitleCommand).executeNow(this.titleInput.text);
			}
		}
		
		protected function titleInput_enterHandler(param1:Event) : void
		{
			if(this._command is ChangeWidgetTitleCommand)
			{
				(this._command as ChangeWidgetTitleCommand).executeNow(this.titleInput.text);
				this._command = new ChangeWidgetTitleCommand(this._widget,this._widget.title);
			}
		}
		
		private function addButton_clickHandler() : void
		{
			this.currentState = "hasTitle";
			this.titleInput.setFocus();
		}
		
		protected function init() : void
		{
			this._remainingTextHint = UtilDict.toDisplay("go","{0} characters remaining");
		}
		
		private function _WidgetTitleTextInput_Button1_i() : Button
		{
			var _loc1_:Button = new Button();
			_loc1_.buttonMode = true;
			_loc1_.setStyle("skinClass",AddTitleButton);
			_loc1_.addEventListener("click",this.___WidgetTitleTextInput_Button1_click);
			_loc1_.id = "_WidgetTitleTextInput_Button1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._WidgetTitleTextInput_Button1 = _loc1_;
			BindingManager.executeBindings(this,"_WidgetTitleTextInput_Button1",this._WidgetTitleTextInput_Button1);
			return _loc1_;
		}
		
		public function ___WidgetTitleTextInput_Button1_click(param1:MouseEvent) : void
		{
			this.addButton_clickHandler();
		}
		
		private function _WidgetTitleTextInput_VGroup1_i() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.percentWidth = 100;
			_loc1_.mxmlContent = [this._WidgetTitleTextInput_Label1_i(),this._WidgetTitleTextInput_HGroup1_c()];
			_loc1_.id = "_WidgetTitleTextInput_VGroup1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._WidgetTitleTextInput_VGroup1 = _loc1_;
			BindingManager.executeBindings(this,"_WidgetTitleTextInput_VGroup1",this._WidgetTitleTextInput_VGroup1);
			return _loc1_;
		}
		
		private function _WidgetTitleTextInput_Label1_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.setStyle("fontWeight","bold");
			_loc1_.setStyle("typographicCase","uppercase");
			_loc1_.id = "_WidgetTitleTextInput_Label1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._WidgetTitleTextInput_Label1 = _loc1_;
			BindingManager.executeBindings(this,"_WidgetTitleTextInput_Label1",this._WidgetTitleTextInput_Label1);
			return _loc1_;
		}
		
		private function _WidgetTitleTextInput_HGroup1_c() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.verticalAlign = "middle";
			_loc1_.percentWidth = 100;
			_loc1_.gap = 0;
			_loc1_.mxmlContent = [this._WidgetTitleTextInput_TextInput1_i(),this._WidgetTitleTextInput_IconButton1_c()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _WidgetTitleTextInput_TextInput1_i() : TextInput
		{
			var _loc1_:TextInput = new TextInput();
			_loc1_.percentWidth = 100;
			_loc1_.maxChars = 500;
			_loc1_.setStyle("skinClass",WidgetTextInputSkin);
			_loc1_.addEventListener("change",this.__titleInput_change);
			_loc1_.addEventListener("focusIn",this.__titleInput_focusIn);
			_loc1_.addEventListener("focusOut",this.__titleInput_focusOut);
			_loc1_.addEventListener("enter",this.__titleInput_enter);
			_loc1_.id = "titleInput";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.titleInput = _loc1_;
			BindingManager.executeBindings(this,"titleInput",this.titleInput);
			return _loc1_;
		}
		
		public function __titleInput_change(param1:TextOperationEvent) : void
		{
			this.titleInput_changeHandler(param1);
		}
		
		public function __titleInput_focusIn(param1:FocusEvent) : void
		{
			this.titleInput_focusInHandler(param1);
		}
		
		public function __titleInput_focusOut(param1:FocusEvent) : void
		{
			this.titleInput_focusOutHandler(param1);
		}
		
		public function __titleInput_enter(param1:FlexEvent) : void
		{
			this.titleInput_enterHandler(param1);
		}
		
		private function _WidgetTitleTextInput_IconButton1_c() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.buttonMode = true;
			_loc1_.width = 35;
			_loc1_.percentHeight = 100;
			_loc1_.setStyle("icon",this._embed_mxml__styles_images_icons_icon_trash_png_922299341);
			_loc1_.addEventListener("click",this.___WidgetTitleTextInput_IconButton1_click);
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		public function ___WidgetTitleTextInput_IconButton1_click(param1:MouseEvent) : void
		{
			this.onDeleteButtonClick(param1);
		}
		
		public function ___WidgetTitleTextInput_Group1_creationComplete(param1:FlexEvent) : void
		{
			this.init();
		}
		
		private function _WidgetTitleTextInput_bindingsSetup() : Array
		{
			var result:Array = [];
			result[0] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","+ Title");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_WidgetTitleTextInput_Button1.label");
			result[1] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Title");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_WidgetTitleTextInput_Label1.text");
			result[2] = new Binding(this,function():String
			{
				var _loc1_:* = _title;
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"titleInput.text");
			return result;
		}
		
		[Bindable(event="propertyChange")]
		public function get titleInput() : TextInput
		{
			return this._1793852334titleInput;
		}
		
		public function set titleInput(param1:TextInput) : void
		{
			var _loc2_:Object = this._1793852334titleInput;
			if(_loc2_ !== param1)
			{
				this._1793852334titleInput = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"titleInput",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get _title() : String
		{
			return this._1464826535_title;
		}
		
		private function set _title(param1:String) : void
		{
			var _loc2_:Object = this._1464826535_title;
			if(_loc2_ !== param1)
			{
				this._1464826535_title = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_title",_loc2_,param1));
				}
			}
		}
	}
}
