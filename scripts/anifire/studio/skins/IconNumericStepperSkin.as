package anifire.studio.skins
{
   import anifire.studio.components.IconNumericStepper;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.TextInput;
   import spark.components.VGroup;
   import spark.primitives.BitmapImage;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   import spark.skins.SparkSkin;
   
   use namespace mx_internal;
   
   public class IconNumericStepperSkin extends SparkSkin implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _IconNumericStepperSkin_BitmapImage1:BitmapImage;
      
      public var _IconNumericStepperSkin_Group1:Group;
      
      private var _172501357_IconNumericStepperSkin_SolidColor1:SolidColor;
      
      private var _959704509_IconNumericStepperSkin_SolidColorStroke3:SolidColorStroke;
      
      private var _853009829decrementButton:Button;
      
      private var _766836075frameDisplay:Rect;
      
      private var _454226047incrementButton:Button;
      
      private var _903579360shadow:Rect;
      
      private var _831827669textDisplay:TextInput;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:IconNumericStepper;
      
      public function IconNumericStepperSkin()
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
         bindings = this._IconNumericStepperSkin_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_skins_IconNumericStepperSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return IconNumericStepperSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.minWidth = 60;
         this.minHeight = 32;
         this.width = 93;
         this.height = 32;
         this.mxmlContent = [this._IconNumericStepperSkin_Rect1_i(),this._IconNumericStepperSkin_Rect2_i(),this._IconNumericStepperSkin_Line1_c(),this._IconNumericStepperSkin_HGroup1_c(),this._IconNumericStepperSkin_VGroup1_c()];
         this.currentState = "normal";
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"disabled",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_IconNumericStepperSkin_SolidColor1",
               "name":"color",
               "value":15592941
            }),new SetProperty().initializeFromObject({
               "target":"textDisplay",
               "name":"enabled",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"incrementButton",
               "name":"enabled",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"_IconNumericStepperSkin_SolidColorStroke3",
               "name":"color",
               "value":11184810
            }),new SetProperty().initializeFromObject({
               "target":"decrementButton",
               "name":"enabled",
               "value":false
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
         IconNumericStepperSkin._watcherSetupUtil = param1;
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
      
      private function _IconNumericStepperSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.radiusX = 4;
         _loc1_.radiusY = 4;
         _loc1_.stroke = this._IconNumericStepperSkin_SolidColorStroke1_c();
         _loc1_.fill = this._IconNumericStepperSkin_SolidColor1_i();
         _loc1_.initialized(this,"frameDisplay");
         this.frameDisplay = _loc1_;
         BindingManager.executeBindings(this,"frameDisplay",this.frameDisplay);
         return _loc1_;
      }
      
      private function _IconNumericStepperSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 13289940;
         return _loc1_;
      }
      
      private function _IconNumericStepperSkin_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         this._IconNumericStepperSkin_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_IconNumericStepperSkin_SolidColor1",this._IconNumericStepperSkin_SolidColor1);
         return _loc1_;
      }
      
      private function _IconNumericStepperSkin_Rect2_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.top = 1;
         _loc1_.right = 1;
         _loc1_.height = 1;
         _loc1_.radiusX = 3;
         _loc1_.fill = this._IconNumericStepperSkin_SolidColor2_c();
         _loc1_.initialized(this,"shadow");
         this.shadow = _loc1_;
         BindingManager.executeBindings(this,"shadow",this.shadow);
         return _loc1_;
      }
      
      private function _IconNumericStepperSkin_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 0;
         _loc1_.alpha = 0.12;
         return _loc1_;
      }
      
      private function _IconNumericStepperSkin_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.top = 5;
         _loc1_.bottom = 4;
         _loc1_.right = 26;
         _loc1_.stroke = this._IconNumericStepperSkin_SolidColorStroke2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _IconNumericStepperSkin_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 13289940;
         return _loc1_;
      }
      
      private function _IconNumericStepperSkin_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentHeight = 100;
         _loc1_.verticalAlign = "middle";
         _loc1_.left = 1;
         _loc1_.right = 25;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._IconNumericStepperSkin_Group1_i(),this._IconNumericStepperSkin_TextInput1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _IconNumericStepperSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentHeight = 100;
         _loc1_.width = 27;
         _loc1_.mxmlContent = [this._IconNumericStepperSkin_BitmapImage1_i()];
         _loc1_.id = "_IconNumericStepperSkin_Group1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._IconNumericStepperSkin_Group1 = _loc1_;
         BindingManager.executeBindings(this,"_IconNumericStepperSkin_Group1",this._IconNumericStepperSkin_Group1);
         return _loc1_;
      }
      
      private function _IconNumericStepperSkin_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.smooth = true;
         _loc1_.initialized(this,"_IconNumericStepperSkin_BitmapImage1");
         this._IconNumericStepperSkin_BitmapImage1 = _loc1_;
         BindingManager.executeBindings(this,"_IconNumericStepperSkin_BitmapImage1",this._IconNumericStepperSkin_BitmapImage1);
         return _loc1_;
      }
      
      private function _IconNumericStepperSkin_TextInput1_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.percentWidth = 100;
         _loc1_.verticalCenter = 1;
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("textAlign","right");
         _loc1_.setStyle("skinClass",FlatNumericStepperTextInputSkin);
         _loc1_.id = "textDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.textDisplay = _loc1_;
         BindingManager.executeBindings(this,"textDisplay",this.textDisplay);
         return _loc1_;
      }
      
      private function _IconNumericStepperSkin_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.right = 1;
         _loc1_.width = 25;
         _loc1_.top = 1;
         _loc1_.bottom = 1;
         _loc1_.gap = 0;
         _loc1_.horizontalAlign = "center";
         _loc1_.mxmlContent = [this._IconNumericStepperSkin_Button1_i(),this._IconNumericStepperSkin_Line2_c(),this._IconNumericStepperSkin_Button2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _IconNumericStepperSkin_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.width = 25;
         _loc1_.percentHeight = 50;
         _loc1_.tabEnabled = false;
         _loc1_.buttonMode = true;
         _loc1_.setStyle("skinClass",FlatNumericStepperIncrementButtonSkin);
         _loc1_.id = "incrementButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.incrementButton = _loc1_;
         BindingManager.executeBindings(this,"incrementButton",this.incrementButton);
         return _loc1_;
      }
      
      private function _IconNumericStepperSkin_Line2_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.width = 15;
         _loc1_.stroke = this._IconNumericStepperSkin_SolidColorStroke3_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _IconNumericStepperSkin_SolidColorStroke3_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 13289940;
         this._IconNumericStepperSkin_SolidColorStroke3 = _loc1_;
         BindingManager.executeBindings(this,"_IconNumericStepperSkin_SolidColorStroke3",this._IconNumericStepperSkin_SolidColorStroke3);
         return _loc1_;
      }
      
      private function _IconNumericStepperSkin_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.width = 25;
         _loc1_.percentHeight = 50;
         _loc1_.tabEnabled = false;
         _loc1_.buttonMode = true;
         _loc1_.setStyle("skinClass",FlatNumericStepperDecrementButtonSkin);
         _loc1_.id = "decrementButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.decrementButton = _loc1_;
         BindingManager.executeBindings(this,"decrementButton",this.decrementButton);
         return _loc1_;
      }
      
      private function _IconNumericStepperSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Boolean
         {
            return hostComponent.icon != null;
         },null,"_IconNumericStepperSkin_Group1.visible");
         result[1] = new Binding(this,function():Boolean
         {
            return hostComponent.icon != null;
         },null,"_IconNumericStepperSkin_Group1.includeInLayout");
         result[2] = new Binding(this,function():Object
         {
            return hostComponent.icon;
         },null,"_IconNumericStepperSkin_BitmapImage1.source");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _IconNumericStepperSkin_SolidColor1() : SolidColor
      {
         return this._172501357_IconNumericStepperSkin_SolidColor1;
      }
      
      public function set _IconNumericStepperSkin_SolidColor1(param1:SolidColor) : void
      {
         var _loc2_:Object = this._172501357_IconNumericStepperSkin_SolidColor1;
         if(_loc2_ !== param1)
         {
            this._172501357_IconNumericStepperSkin_SolidColor1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_IconNumericStepperSkin_SolidColor1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _IconNumericStepperSkin_SolidColorStroke3() : SolidColorStroke
      {
         return this._959704509_IconNumericStepperSkin_SolidColorStroke3;
      }
      
      public function set _IconNumericStepperSkin_SolidColorStroke3(param1:SolidColorStroke) : void
      {
         var _loc2_:Object = this._959704509_IconNumericStepperSkin_SolidColorStroke3;
         if(_loc2_ !== param1)
         {
            this._959704509_IconNumericStepperSkin_SolidColorStroke3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_IconNumericStepperSkin_SolidColorStroke3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get decrementButton() : Button
      {
         return this._853009829decrementButton;
      }
      
      public function set decrementButton(param1:Button) : void
      {
         var _loc2_:Object = this._853009829decrementButton;
         if(_loc2_ !== param1)
         {
            this._853009829decrementButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"decrementButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get frameDisplay() : Rect
      {
         return this._766836075frameDisplay;
      }
      
      public function set frameDisplay(param1:Rect) : void
      {
         var _loc2_:Object = this._766836075frameDisplay;
         if(_loc2_ !== param1)
         {
            this._766836075frameDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"frameDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get incrementButton() : Button
      {
         return this._454226047incrementButton;
      }
      
      public function set incrementButton(param1:Button) : void
      {
         var _loc2_:Object = this._454226047incrementButton;
         if(_loc2_ !== param1)
         {
            this._454226047incrementButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"incrementButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get shadow() : Rect
      {
         return this._903579360shadow;
      }
      
      public function set shadow(param1:Rect) : void
      {
         var _loc2_:Object = this._903579360shadow;
         if(_loc2_ !== param1)
         {
            this._903579360shadow = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"shadow",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get textDisplay() : TextInput
      {
         return this._831827669textDisplay;
      }
      
      public function set textDisplay(param1:TextInput) : void
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
      public function get hostComponent() : IconNumericStepper
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:IconNumericStepper) : void
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
