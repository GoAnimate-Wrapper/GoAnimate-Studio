package anifire.studio.skins
{
   import anifire.studio.components.PublishPanel;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.controls.Spacer;
   import mx.core.DeferredInstanceFromFunction;
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
   import spark.layouts.HorizontalLayout;
   import spark.layouts.VerticalLayout;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   import spark.primitives.RectangularDropShadow;
   import spark.skins.SparkSkin;
   
   use namespace mx_internal;
   
   public class PublishPanelSkin extends SparkSkin implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _PublishPanelSkin_Line1:Line;
      
      public var _PublishPanelSkin_Spacer1:Spacer;
      
      private var _1906413305backButton:Button;
      
      private var _1332194002background:Rect;
      
      private var _1427077073backgroundFill:SolidColor;
      
      private var _631173356bottomGroup:Group;
      
      private var _809612678contentGroup:Group;
      
      private var _567321830contents:Group;
      
      private var _139410089controlBarGroup:Group;
      
      private var _906978543dropShadow:RectangularDropShadow;
      
      private var _1893287094titleDisplay:Label;
      
      private var _988229078topGroup:HGroup;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:PublishPanel;
      
      public function PublishPanelSkin()
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
         bindings = this._PublishPanelSkin_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_skins_PublishPanelSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return PublishPanelSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.blendMode = "normal";
         this.mouseEnabled = false;
         this.minWidth = 300;
         this.minHeight = 200;
         this.mxmlContent = [this._PublishPanelSkin_RectangularDropShadow1_i(),this._PublishPanelSkin_Group1_c()];
         this.currentState = "normal";
         var _PublishPanelSkin_Group4_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._PublishPanelSkin_Group4_i);
         states = [new State({
            "name":"normal",
            "stateGroups":["normalStates"],
            "overrides":[]
         }),new State({
            "name":"disabled",
            "stateGroups":["disabledStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"contents",
               "name":"alpha",
               "value":0.5
            })]
         }),new State({
            "name":"normalWithControlBar",
            "stateGroups":["withControls"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_PublishPanelSkin_Group4_factory,
               "destination":"contents",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["contentGroup"]
            })]
         }),new State({
            "name":"disabledWithControlBar",
            "stateGroups":["withControls","disabledStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_PublishPanelSkin_Group4_factory,
               "destination":"contents",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["contentGroup"]
            }),new SetProperty().initializeFromObject({
               "target":"contents",
               "name":"alpha",
               "value":0.5
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
         PublishPanelSkin._watcherSetupUtil = param1;
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
      
      private function _PublishPanelSkin_RectangularDropShadow1_i() : RectangularDropShadow
      {
         var _loc1_:RectangularDropShadow = new RectangularDropShadow();
         _loc1_.blurX = 20;
         _loc1_.blurY = 20;
         _loc1_.alpha = 0.32;
         _loc1_.distance = 11;
         _loc1_.angle = 90;
         _loc1_.color = 0;
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.tlRadius = 3;
         _loc1_.trRadius = 3;
         _loc1_.blRadius = 3;
         _loc1_.brRadius = 3;
         _loc1_.id = "dropShadow";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dropShadow = _loc1_;
         BindingManager.executeBindings(this,"dropShadow",this.dropShadow);
         return _loc1_;
      }
      
      private function _PublishPanelSkin_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.mxmlContent = [this._PublishPanelSkin_Rect1_i(),this._PublishPanelSkin_Group2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _PublishPanelSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.top = 1;
         _loc1_.right = 1;
         _loc1_.bottom = 1;
         _loc1_.radiusX = 3;
         _loc1_.fill = this._PublishPanelSkin_SolidColor1_i();
         _loc1_.initialized(this,"background");
         this.background = _loc1_;
         BindingManager.executeBindings(this,"background",this.background);
         return _loc1_;
      }
      
      private function _PublishPanelSkin_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         this.backgroundFill = _loc1_;
         BindingManager.executeBindings(this,"backgroundFill",this.backgroundFill);
         return _loc1_;
      }
      
      private function _PublishPanelSkin_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 1;
         _loc1_.right = 1;
         _loc1_.top = 1;
         _loc1_.bottom = 1;
         _loc1_.layout = this._PublishPanelSkin_VerticalLayout1_c();
         _loc1_.mxmlContent = [this._PublishPanelSkin_HGroup1_i(),this._PublishPanelSkin_Group3_i()];
         _loc1_.id = "contents";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.contents = _loc1_;
         BindingManager.executeBindings(this,"contents",this.contents);
         return _loc1_;
      }
      
      private function _PublishPanelSkin_VerticalLayout1_c() : VerticalLayout
      {
         var _loc1_:VerticalLayout = new VerticalLayout();
         _loc1_.gap = 0;
         _loc1_.horizontalAlign = "justify";
         return _loc1_;
      }
      
      private function _PublishPanelSkin_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.minHeight = 30;
         _loc1_.gap = 0;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._PublishPanelSkin_Button1_i(),this._PublishPanelSkin_Line1_i(),this._PublishPanelSkin_Spacer1_i(),this._PublishPanelSkin_Label1_i()];
         _loc1_.id = "topGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.topGroup = _loc1_;
         BindingManager.executeBindings(this,"topGroup",this.topGroup);
         return _loc1_;
      }
      
      private function _PublishPanelSkin_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.width = 50;
         _loc1_.percentHeight = 100;
         _loc1_.setStyle("skinClass",PublishPanelBackButtonSkin);
         _loc1_.id = "backButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.backButton = _loc1_;
         BindingManager.executeBindings(this,"backButton",this.backButton);
         return _loc1_;
      }
      
      private function _PublishPanelSkin_Line1_i() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentHeight = 100;
         _loc1_.stroke = this._PublishPanelSkin_SolidColorStroke1_c();
         _loc1_.initialized(this,"_PublishPanelSkin_Line1");
         this._PublishPanelSkin_Line1 = _loc1_;
         BindingManager.executeBindings(this,"_PublishPanelSkin_Line1",this._PublishPanelSkin_Line1);
         return _loc1_;
      }
      
      private function _PublishPanelSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 14804459;
         return _loc1_;
      }
      
      private function _PublishPanelSkin_Spacer1_i() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.width = 15;
         _loc1_.id = "_PublishPanelSkin_Spacer1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._PublishPanelSkin_Spacer1 = _loc1_;
         BindingManager.executeBindings(this,"_PublishPanelSkin_Spacer1",this._PublishPanelSkin_Spacer1);
         return _loc1_;
      }
      
      private function _PublishPanelSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.maxDisplayedLines = 1;
         _loc1_.setStyle("paddingLeft",13);
         _loc1_.setStyle("paddingRight",28);
         _loc1_.setStyle("paddingTop",15);
         _loc1_.setStyle("paddingBottom",15);
         _loc1_.setStyle("fontSize",21);
         _loc1_.setStyle("color",5267058);
         _loc1_.id = "titleDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.titleDisplay = _loc1_;
         BindingManager.executeBindings(this,"titleDisplay",this.titleDisplay);
         return _loc1_;
      }
      
      private function _PublishPanelSkin_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.minWidth = 0;
         _loc1_.minHeight = 0;
         _loc1_.id = "contentGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.contentGroup = _loc1_;
         BindingManager.executeBindings(this,"contentGroup",this.contentGroup);
         return _loc1_;
      }
      
      private function _PublishPanelSkin_Group4_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.minWidth = 0;
         _loc1_.minHeight = 0;
         _loc1_.mxmlContent = [this._PublishPanelSkin_Line2_c(),this._PublishPanelSkin_Group5_i()];
         _loc1_.id = "bottomGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.bottomGroup = _loc1_;
         BindingManager.executeBindings(this,"bottomGroup",this.bottomGroup);
         return _loc1_;
      }
      
      private function _PublishPanelSkin_Line2_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.top = 0;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.stroke = this._PublishPanelSkin_SolidColorStroke2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _PublishPanelSkin_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 14738923;
         return _loc1_;
      }
      
      private function _PublishPanelSkin_Group5_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 1;
         _loc1_.bottom = 1;
         _loc1_.minWidth = 0;
         _loc1_.minHeight = 0;
         _loc1_.layout = this._PublishPanelSkin_HorizontalLayout1_c();
         _loc1_.id = "controlBarGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.controlBarGroup = _loc1_;
         BindingManager.executeBindings(this,"controlBarGroup",this.controlBarGroup);
         return _loc1_;
      }
      
      private function _PublishPanelSkin_HorizontalLayout1_c() : HorizontalLayout
      {
         var _loc1_:HorizontalLayout = new HorizontalLayout();
         _loc1_.horizontalAlign = "center";
         _loc1_.gap = 14;
         _loc1_.paddingLeft = 14;
         _loc1_.paddingRight = 14;
         _loc1_.paddingTop = 14;
         _loc1_.paddingBottom = 14;
         return _loc1_;
      }
      
      private function _PublishPanelSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Boolean
         {
            return hostComponent.showBackButton;
         },null,"_PublishPanelSkin_Line1.visible");
         result[1] = new Binding(this,function():Boolean
         {
            return hostComponent.showBackButton;
         },null,"_PublishPanelSkin_Line1.includeInLayout");
         result[2] = new Binding(this,function():Boolean
         {
            return !hostComponent.showBackButton;
         },null,"_PublishPanelSkin_Spacer1.visible");
         result[3] = new Binding(this,function():Boolean
         {
            return !hostComponent.showBackButton;
         },null,"_PublishPanelSkin_Spacer1.includeInLayout");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get backButton() : Button
      {
         return this._1906413305backButton;
      }
      
      public function set backButton(param1:Button) : void
      {
         var _loc2_:Object = this._1906413305backButton;
         if(_loc2_ !== param1)
         {
            this._1906413305backButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"backButton",_loc2_,param1));
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
      public function get backgroundFill() : SolidColor
      {
         return this._1427077073backgroundFill;
      }
      
      public function set backgroundFill(param1:SolidColor) : void
      {
         var _loc2_:Object = this._1427077073backgroundFill;
         if(_loc2_ !== param1)
         {
            this._1427077073backgroundFill = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"backgroundFill",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bottomGroup() : Group
      {
         return this._631173356bottomGroup;
      }
      
      public function set bottomGroup(param1:Group) : void
      {
         var _loc2_:Object = this._631173356bottomGroup;
         if(_loc2_ !== param1)
         {
            this._631173356bottomGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bottomGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get contentGroup() : Group
      {
         return this._809612678contentGroup;
      }
      
      public function set contentGroup(param1:Group) : void
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
      public function get contents() : Group
      {
         return this._567321830contents;
      }
      
      public function set contents(param1:Group) : void
      {
         var _loc2_:Object = this._567321830contents;
         if(_loc2_ !== param1)
         {
            this._567321830contents = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"contents",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get controlBarGroup() : Group
      {
         return this._139410089controlBarGroup;
      }
      
      public function set controlBarGroup(param1:Group) : void
      {
         var _loc2_:Object = this._139410089controlBarGroup;
         if(_loc2_ !== param1)
         {
            this._139410089controlBarGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"controlBarGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dropShadow() : RectangularDropShadow
      {
         return this._906978543dropShadow;
      }
      
      public function set dropShadow(param1:RectangularDropShadow) : void
      {
         var _loc2_:Object = this._906978543dropShadow;
         if(_loc2_ !== param1)
         {
            this._906978543dropShadow = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dropShadow",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get titleDisplay() : Label
      {
         return this._1893287094titleDisplay;
      }
      
      public function set titleDisplay(param1:Label) : void
      {
         var _loc2_:Object = this._1893287094titleDisplay;
         if(_loc2_ !== param1)
         {
            this._1893287094titleDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"titleDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get topGroup() : HGroup
      {
         return this._988229078topGroup;
      }
      
      public function set topGroup(param1:HGroup) : void
      {
         var _loc2_:Object = this._988229078topGroup;
         if(_loc2_ !== param1)
         {
            this._988229078topGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"topGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : PublishPanel
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:PublishPanel) : void
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
