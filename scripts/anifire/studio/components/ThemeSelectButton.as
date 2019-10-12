package anifire.studio.components
{
   import anifire.util.UtilDict;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.State;
   import spark.components.Group;
   import spark.components.Label;
   import spark.primitives.Line;
   import spark.primitives.Path;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class ThemeSelectButton extends Group implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _1593054941displayGroup:Group;
      
      private var _766836075frameDisplay:Rect;
      
      private var _1184053038labelDisplay:Label;
      
      private var _903579360shadow:Rect;
      
      private var _193270912themeIconDisplay:ThemeIcon;
      
      private var _1497762312triangle:Path;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _themeId:String;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ThemeSelectButton()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._ThemeSelectButton_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_ThemeSelectButtonWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ThemeSelectButton[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 68;
         this.height = 36;
         this.buttonMode = true;
         this.mouseChildren = false;
         this.mxmlContent = [this._ThemeSelectButton_Rect1_i(),this._ThemeSelectButton_Rect2_i(),this._ThemeSelectButton_Group2_c(),this._ThemeSelectButton_Group3_i()];
         this.currentState = "normal";
         this.addEventListener("mouseOver",this.___ThemeSelectButton_Group1_mouseOver);
         this.addEventListener("mouseOut",this.___ThemeSelectButton_Group1_mouseOut);
         this.addEventListener("creationComplete",this.___ThemeSelectButton_Group1_creationComplete);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"hovered",
            "overrides":[]
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
         ThemeSelectButton._watcherSetupUtil = param1;
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
      
      [Bindable(event="propertyChange")]
      public function get themeId() : String
      {
         return this._themeId;
      }
      
      private function set _1349701436themeId(param1:String) : void
      {
         this._themeId = param1;
      }
      
      protected function mouseOverHandler(param1:MouseEvent) : void
      {
         currentState = "hovered";
      }
      
      protected function mouseOutHandler(param1:MouseEvent) : void
      {
         currentState = "normal";
      }
      
      protected function init() : void
      {
         this.themeId = null;
      }
      
      private function _ThemeSelectButton_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.radiusX = 4;
         _loc1_.radiusY = 4;
         _loc1_.stroke = this._ThemeSelectButton_SolidColorStroke1_c();
         _loc1_.fill = this._ThemeSelectButton_SolidColor1_c();
         _loc1_.initialized(this,"frameDisplay");
         this.frameDisplay = _loc1_;
         BindingManager.executeBindings(this,"frameDisplay",this.frameDisplay);
         return _loc1_;
      }
      
      private function _ThemeSelectButton_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 13289940;
         return _loc1_;
      }
      
      private function _ThemeSelectButton_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _ThemeSelectButton_Rect2_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.top = 1;
         _loc1_.right = 1;
         _loc1_.height = 1;
         _loc1_.radiusX = 3;
         _loc1_.fill = this._ThemeSelectButton_SolidColor2_c();
         _loc1_.initialized(this,"shadow");
         this.shadow = _loc1_;
         BindingManager.executeBindings(this,"shadow",this.shadow);
         return _loc1_;
      }
      
      private function _ThemeSelectButton_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 0;
         _loc1_.alpha = 0.12;
         return _loc1_;
      }
      
      private function _ThemeSelectButton_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 24;
         _loc1_.right = 1;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.mxmlContent = [this._ThemeSelectButton_Line1_c(),this._ThemeSelectButton_Path1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ThemeSelectButton_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.left = 0;
         _loc1_.top = 8;
         _loc1_.bottom = 8;
         _loc1_.stroke = this._ThemeSelectButton_SolidColorStroke2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ThemeSelectButton_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 13289940;
         return _loc1_;
      }
      
      private function _ThemeSelectButton_Path1_i() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.data = "M 0 0 l 4 4 l 4 -4";
         _loc1_.stroke = this._ThemeSelectButton_SolidColorStroke3_c();
         _loc1_.initialized(this,"triangle");
         this.triangle = _loc1_;
         BindingManager.executeBindings(this,"triangle",this.triangle);
         return _loc1_;
      }
      
      private function _ThemeSelectButton_SolidColorStroke3_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 4439205;
         _loc1_.weight = 2;
         _loc1_.caps = "square";
         return _loc1_;
      }
      
      private function _ThemeSelectButton_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 44;
         _loc1_.height = 36;
         _loc1_.mxmlContent = [this._ThemeSelectButton_Label1_i(),this._ThemeSelectButton_ThemeIcon1_i()];
         _loc1_.id = "displayGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.displayGroup = _loc1_;
         BindingManager.executeBindings(this,"displayGroup",this.displayGroup);
         return _loc1_;
      }
      
      private function _ThemeSelectButton_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.maxDisplayedLines = 1;
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 1;
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("color",4439205);
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("verticalAlign","middle");
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",this.labelDisplay);
         return _loc1_;
      }
      
      private function _ThemeSelectButton_ThemeIcon1_i() : ThemeIcon
      {
         var _loc1_:ThemeIcon = new ThemeIcon();
         _loc1_.width = 30;
         _loc1_.height = 30;
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.id = "themeIconDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.themeIconDisplay = _loc1_;
         BindingManager.executeBindings(this,"themeIconDisplay",this.themeIconDisplay);
         return _loc1_;
      }
      
      public function ___ThemeSelectButton_Group1_mouseOver(param1:MouseEvent) : void
      {
         this.mouseOverHandler(param1);
      }
      
      public function ___ThemeSelectButton_Group1_mouseOut(param1:MouseEvent) : void
      {
         this.mouseOutHandler(param1);
      }
      
      public function ___ThemeSelectButton_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      private function _ThemeSelectButton_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","All");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"labelDisplay.text");
         result[1] = new Binding(this,function():Boolean
         {
            return themeId == null;
         },null,"labelDisplay.visible");
         result[2] = new Binding(this,null,null,"themeIconDisplay.themeId","themeId");
         result[3] = new Binding(this,function():Boolean
         {
            return themeId != null;
         },null,"themeIconDisplay.visible");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get displayGroup() : Group
      {
         return this._1593054941displayGroup;
      }
      
      public function set displayGroup(param1:Group) : void
      {
         var _loc2_:Object = this._1593054941displayGroup;
         if(_loc2_ !== param1)
         {
            this._1593054941displayGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"displayGroup",_loc2_,param1));
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
      public function get themeIconDisplay() : ThemeIcon
      {
         return this._193270912themeIconDisplay;
      }
      
      public function set themeIconDisplay(param1:ThemeIcon) : void
      {
         var _loc2_:Object = this._193270912themeIconDisplay;
         if(_loc2_ !== param1)
         {
            this._193270912themeIconDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"themeIconDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get triangle() : Path
      {
         return this._1497762312triangle;
      }
      
      public function set triangle(param1:Path) : void
      {
         var _loc2_:Object = this._1497762312triangle;
         if(_loc2_ !== param1)
         {
            this._1497762312triangle = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"triangle",_loc2_,param1));
            }
         }
      }
      
      public function set themeId(param1:String) : void
      {
         var _loc2_:Object = this.themeId;
         if(_loc2_ !== param1)
         {
            this._1349701436themeId = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"themeId",_loc2_,param1));
            }
         }
      }
   }
}
