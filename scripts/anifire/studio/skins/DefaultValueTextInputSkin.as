package anifire.studio.skins
{
   import anifire.studio.components.DefaultValueTextInput;
   import anifire.util.UtilDict;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.FlexVersion;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.RichEditableText;
   import spark.primitives.Rect;
   import spark.skins.SparkSkin;
   
   use namespace mx_internal;
   
   public class DefaultValueTextInputSkin extends SparkSkin implements IBindingClient, IStateClient2
   {
      
      private static const exclusions:Array = ["background","textDisplay","promptDisplay","border"];
      
      private static const exclusions_4_0:Array = ["background","textDisplay","promptDisplay"];
      
      private static const contentFill:Array = ["bgFill"];
      
      private static const focusExclusions:Array = ["textDisplay"];
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _106622970_DefaultValueTextInputSkin_HGroup1:HGroup;
      
      private var _1332194002background:Rect;
      
      private var _1391998104bgFill:SolidColor;
      
      private var _1383304148border:Rect;
      
      private var _1395787140borderStroke:SolidColorStroke;
      
      private var _1454002652editButton:Button;
      
      private var _263438014promptDisplay:Label;
      
      private var _1258309279resetButton:Button;
      
      private var _831827669textDisplay:RichEditableText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var paddingChanged:Boolean;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:DefaultValueTextInput;
      
      public function DefaultValueTextInputSkin()
      {
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._DefaultValueTextInputSkin_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_skins_DefaultValueTextInputSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return DefaultValueTextInputSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.blendMode = "normal";
         this.mxmlContent = [this._DefaultValueTextInputSkin_Rect1_i(),this._DefaultValueTextInputSkin_HGroup1_i(),this._DefaultValueTextInputSkin_Button2_i()];
         this.currentState = "normal";
         var _DefaultValueTextInputSkin_Label1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._DefaultValueTextInputSkin_Label1_i);
         states = [new State({
            "name":"normal",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_DefaultValueTextInputSkin_Label1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_DefaultValueTextInputSkin_HGroup1"]
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
            "overrides":[]
         }),new State({
            "name":"disabledWithPrompt",
            "stateGroups":["disabledStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            })]
         }),new State({
            "name":"normalWithDefaultValue",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_DefaultValueTextInputSkin_HGroup1",
               "name":"visible",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"editButton",
               "name":"visible",
               "value":true
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
         DefaultValueTextInputSkin._watcherSetupUtil = param1;
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
         if(FlexVersion.compatibilityVersion < FlexVersion.VERSION_4_5)
         {
            return exclusions_4_0;
         }
         return exclusions;
      }
      
      override public function get contentItems() : Array
      {
         return contentFill;
      }
      
      override protected function commitProperties() : void
      {
         super.commitProperties();
         if(this.paddingChanged)
         {
            this.updatePadding();
            this.paddingChanged = false;
         }
      }
      
      override protected function initializationComplete() : void
      {
         useChromeColor = true;
         super.initializationComplete();
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         if(getStyle("borderVisible") == true)
         {
            this.border.visible = true;
            this.background.left = this.background.top = this.background.right = this.background.bottom = 1;
            this.textDisplay.left = this.textDisplay.top = this.textDisplay.right = this.textDisplay.bottom = 1;
            if(this.promptDisplay)
            {
               this.promptDisplay.setLayoutBoundsSize(param1 - 2,param2 - 2);
               this.promptDisplay.setLayoutBoundsPosition(1,1);
            }
         }
         else
         {
            this.border.visible = false;
            this.background.left = this.background.top = this.background.right = this.background.bottom = 0;
            this.textDisplay.left = this.textDisplay.top = this.textDisplay.right = this.textDisplay.bottom = 0;
            if(this.promptDisplay)
            {
               this.promptDisplay.setLayoutBoundsSize(param1,param2);
               this.promptDisplay.setLayoutBoundsPosition(0,0);
            }
         }
         this.borderStroke.color = getStyle("borderColor");
         this.borderStroke.alpha = getStyle("borderAlpha");
         super.updateDisplayList(param1,param2);
      }
      
      private function updatePadding() : void
      {
         var _loc1_:Number = NaN;
         if(!this.textDisplay)
         {
            return;
         }
         _loc1_ = getStyle("paddingLeft");
         if(this.textDisplay.getStyle("paddingLeft") != _loc1_)
         {
            this.textDisplay.setStyle("paddingLeft",_loc1_);
         }
         _loc1_ = getStyle("paddingTop");
         if(this.textDisplay.getStyle("paddingTop") != _loc1_)
         {
            this.textDisplay.setStyle("paddingTop",_loc1_);
         }
         _loc1_ = getStyle("paddingRight");
         if(this.textDisplay.getStyle("paddingRight") != _loc1_)
         {
            this.textDisplay.setStyle("paddingRight",_loc1_);
         }
         _loc1_ = getStyle("paddingBottom");
         if(this.textDisplay.getStyle("paddingBottom") != _loc1_)
         {
            this.textDisplay.setStyle("paddingBottom",_loc1_);
         }
         if(!this.promptDisplay)
         {
            return;
         }
         _loc1_ = getStyle("paddingLeft");
         if(this.promptDisplay.getStyle("paddingLeft") != _loc1_)
         {
            this.promptDisplay.setStyle("paddingLeft",_loc1_);
         }
         _loc1_ = getStyle("paddingTop");
         if(this.promptDisplay.getStyle("paddingTop") != _loc1_)
         {
            this.promptDisplay.setStyle("paddingTop",_loc1_);
         }
         _loc1_ = getStyle("paddingRight");
         if(this.promptDisplay.getStyle("paddingRight") != _loc1_)
         {
            this.promptDisplay.setStyle("paddingRight",_loc1_);
         }
         _loc1_ = getStyle("paddingBottom");
         if(this.promptDisplay.getStyle("paddingBottom") != _loc1_)
         {
            this.promptDisplay.setStyle("paddingBottom",_loc1_);
         }
      }
      
      override public function styleChanged(param1:String) : void
      {
         var _loc2_:Boolean = !param1 || param1 == "styleName";
         super.styleChanged(param1);
         if(_loc2_ || param1.indexOf("padding") == 0)
         {
            this.paddingChanged = true;
            invalidateProperties();
         }
      }
      
      override public function get focusSkinExclusions() : Array
      {
         return focusExclusions;
      }
      
      private function _DefaultValueTextInputSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._DefaultValueTextInputSkin_SolidColor1_i();
         _loc1_.initialized(this,"background");
         this.background = _loc1_;
         BindingManager.executeBindings(this,"background",this.background);
         return _loc1_;
      }
      
      private function _DefaultValueTextInputSkin_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         this.bgFill = _loc1_;
         BindingManager.executeBindings(this,"bgFill",this.bgFill);
         return _loc1_;
      }
      
      private function _DefaultValueTextInputSkin_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._DefaultValueTextInputSkin_Group1_c(),this._DefaultValueTextInputSkin_Button1_i()];
         _loc1_.id = "_DefaultValueTextInputSkin_HGroup1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._DefaultValueTextInputSkin_HGroup1 = _loc1_;
         BindingManager.executeBindings(this,"_DefaultValueTextInputSkin_HGroup1",this._DefaultValueTextInputSkin_HGroup1);
         return _loc1_;
      }
      
      private function _DefaultValueTextInputSkin_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._DefaultValueTextInputSkin_Rect2_i(),this._DefaultValueTextInputSkin_RichEditableText1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _DefaultValueTextInputSkin_Rect2_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._DefaultValueTextInputSkin_SolidColorStroke1_i();
         _loc1_.initialized(this,"border");
         this.border = _loc1_;
         BindingManager.executeBindings(this,"border",this.border);
         return _loc1_;
      }
      
      private function _DefaultValueTextInputSkin_SolidColorStroke1_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.weight = 1;
         this.borderStroke = _loc1_;
         BindingManager.executeBindings(this,"borderStroke",this.borderStroke);
         return _loc1_;
      }
      
      private function _DefaultValueTextInputSkin_RichEditableText1_i() : RichEditableText
      {
         var _loc1_:RichEditableText = new RichEditableText();
         _loc1_.percentWidth = 100;
         _loc1_.left = 1;
         _loc1_.right = 1;
         _loc1_.top = 1;
         _loc1_.bottom = 1;
         _loc1_.setStyle("verticalAlign","middle");
         _loc1_.id = "textDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.textDisplay = _loc1_;
         BindingManager.executeBindings(this,"textDisplay",this.textDisplay);
         return _loc1_;
      }
      
      private function _DefaultValueTextInputSkin_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.setStyle("skinClass",ResetButtonSkin);
         _loc1_.id = "resetButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.resetButton = _loc1_;
         BindingManager.executeBindings(this,"resetButton",this.resetButton);
         return _loc1_;
      }
      
      private function _DefaultValueTextInputSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.maxDisplayedLines = 1;
         _loc1_.mouseEnabled = false;
         _loc1_.mouseChildren = false;
         _loc1_.includeInLayout = false;
         _loc1_.setStyle("verticalAlign","middle");
         _loc1_.id = "promptDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.promptDisplay = _loc1_;
         BindingManager.executeBindings(this,"promptDisplay",this.promptDisplay);
         return _loc1_;
      }
      
      private function _DefaultValueTextInputSkin_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.visible = false;
         _loc1_.buttonMode = true;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.setStyle("skinClass",DefaultValueTextInputEditButtonSkin);
         _loc1_.id = "editButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.editButton = _loc1_;
         BindingManager.executeBindings(this,"editButton",this.editButton);
         return _loc1_;
      }
      
      private function _DefaultValueTextInputSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Reset");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"resetButton.label");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _DefaultValueTextInputSkin_HGroup1() : HGroup
      {
         return this._106622970_DefaultValueTextInputSkin_HGroup1;
      }
      
      public function set _DefaultValueTextInputSkin_HGroup1(param1:HGroup) : void
      {
         var _loc2_:Object = this._106622970_DefaultValueTextInputSkin_HGroup1;
         if(_loc2_ !== param1)
         {
            this._106622970_DefaultValueTextInputSkin_HGroup1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DefaultValueTextInputSkin_HGroup1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get background() : Rect
      {
         return this._1332194002background;
      }
      
      public function set background(param1:Rect) : void
      {
         var _loc2_:Object = this._1332194002background;
         if(_loc2_ !== param1)
         {
            this._1332194002background = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"background",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bgFill() : SolidColor
      {
         return this._1391998104bgFill;
      }
      
      public function set bgFill(param1:SolidColor) : void
      {
         var _loc2_:Object = this._1391998104bgFill;
         if(_loc2_ !== param1)
         {
            this._1391998104bgFill = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bgFill",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get border() : Rect
      {
         return this._1383304148border;
      }
      
      public function set border(param1:Rect) : void
      {
         var _loc2_:Object = this._1383304148border;
         if(_loc2_ !== param1)
         {
            this._1383304148border = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"border",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get borderStroke() : SolidColorStroke
      {
         return this._1395787140borderStroke;
      }
      
      public function set borderStroke(param1:SolidColorStroke) : void
      {
         var _loc2_:Object = this._1395787140borderStroke;
         if(_loc2_ !== param1)
         {
            this._1395787140borderStroke = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"borderStroke",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get editButton() : Button
      {
         return this._1454002652editButton;
      }
      
      public function set editButton(param1:Button) : void
      {
         var _loc2_:Object = this._1454002652editButton;
         if(_loc2_ !== param1)
         {
            this._1454002652editButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"editButton",_loc2_,param1));
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
      public function get resetButton() : Button
      {
         return this._1258309279resetButton;
      }
      
      public function set resetButton(param1:Button) : void
      {
         var _loc2_:Object = this._1258309279resetButton;
         if(_loc2_ !== param1)
         {
            this._1258309279resetButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"resetButton",_loc2_,param1));
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
      public function get hostComponent() : DefaultValueTextInput
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:DefaultValueTextInput) : void
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
