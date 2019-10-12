package anifire.studio.skins
{
   import anifire.studio.components.IconButtonBarButton;
   import anifire.studio.components.PopUpAnchor;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
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
   import spark.components.Group;
   import spark.components.Label;
   import spark.effects.Fade;
   import spark.primitives.BitmapImage;
   import spark.primitives.Ellipse;
   import spark.primitives.Line;
   import spark.primitives.Path;
   import spark.primitives.Rect;
   import spark.primitives.RectangularDropShadow;
   import spark.skins.SparkSkin;
   
   use namespace mx_internal;
   
   public class IconButtonBarButtonSkin extends SparkSkin implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _IconButtonBarButtonSkin_Group1:Group;
      
      public var _IconButtonBarButtonSkin_Group3:Group;
      
      public var _IconButtonBarButtonSkin_Line1:Line;
      
      public var _IconButtonBarButtonSkin_Line2:Line;
      
      public var _IconButtonBarButtonSkin_Path1:Path;
      
      public var _IconButtonBarButtonSkin_PopUpAnchor1:PopUpAnchor;
      
      public var _IconButtonBarButtonSkin_Rect2:Rect;
      
      public var _IconButtonBarButtonSkin_RectangularDropShadow1:RectangularDropShadow;
      
      private var _1332194002background:Rect;
      
      private var _1391998104bgFill:SolidColor;
      
      private var _1282133823fadeIn:Fade;
      
      private var _1031744009iconDisplay:BitmapImage;
      
      private var _1184053038labelDisplay:Label;
      
      private var _1594140588notificationGroup:Group;
      
      private var _1590042423notificationLabel:Label;
      
      private var _268453613popUpGroup:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:IconButtonBarButton;
      
      public function IconButtonBarButtonSkin()
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
         bindings = this._IconButtonBarButtonSkin_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_skins_IconButtonBarButtonSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return IconButtonBarButtonSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.minWidth = 50;
         this.minHeight = 30;
         this.mxmlContent = [this._IconButtonBarButtonSkin_Rect1_i(),this._IconButtonBarButtonSkin_Line2_i(),this._IconButtonBarButtonSkin_Group1_i(),this._IconButtonBarButtonSkin_Group4_i()];
         this.currentState = "up";
         this._IconButtonBarButtonSkin_Fade1_i();
         var _IconButtonBarButtonSkin_Line1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._IconButtonBarButtonSkin_Line1_i);
         var _IconButtonBarButtonSkin_Path1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._IconButtonBarButtonSkin_Path1_i);
         var _IconButtonBarButtonSkin_PopUpAnchor1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._IconButtonBarButtonSkin_PopUpAnchor1_i);
         var _IconButtonBarButtonSkin_Rect2_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._IconButtonBarButtonSkin_Rect2_i);
         var _IconButtonBarButtonSkin_RectangularDropShadow1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._IconButtonBarButtonSkin_RectangularDropShadow1_i);
         states = [new State({
            "name":"up",
            "stateGroups":["normalStates"],
            "overrides":[]
         }),new State({
            "name":"over",
            "stateGroups":["normalStates","overStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_IconButtonBarButtonSkin_PopUpAnchor1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_IconButtonBarButtonSkin_Group1"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_IconButtonBarButtonSkin_Path1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_IconButtonBarButtonSkin_Group1"]
            })]
         }),new State({
            "name":"down",
            "stateGroups":["normalStates","downStates"],
            "overrides":[]
         }),new State({
            "name":"disabled",
            "stateGroups":["normalStates","disabledStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            })]
         }),new State({
            "name":"upAndSelected",
            "stateGroups":["selectedStates","selectedUpStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_IconButtonBarButtonSkin_RectangularDropShadow1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_IconButtonBarButtonSkin_Line2"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_IconButtonBarButtonSkin_Line1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["background"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_IconButtonBarButtonSkin_Rect2_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["background"]
            }),new SetProperty().initializeFromObject({
               "target":"bgFill",
               "name":"alpha",
               "value":1
            })]
         }),new State({
            "name":"overAndSelected",
            "stateGroups":["selectedStates","overStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_IconButtonBarButtonSkin_PopUpAnchor1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_IconButtonBarButtonSkin_Group1"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_IconButtonBarButtonSkin_Path1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_IconButtonBarButtonSkin_Group1"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_IconButtonBarButtonSkin_RectangularDropShadow1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_IconButtonBarButtonSkin_Line2"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_IconButtonBarButtonSkin_Line1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["background"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_IconButtonBarButtonSkin_Rect2_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["background"]
            }),new SetProperty().initializeFromObject({
               "target":"bgFill",
               "name":"alpha",
               "value":1
            })]
         }),new State({
            "name":"downAndSelected",
            "stateGroups":["selectedStates","downStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_IconButtonBarButtonSkin_RectangularDropShadow1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_IconButtonBarButtonSkin_Line2"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_IconButtonBarButtonSkin_Line1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["background"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_IconButtonBarButtonSkin_Rect2_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["background"]
            }),new SetProperty().initializeFromObject({
               "target":"bgFill",
               "name":"alpha",
               "value":1
            })]
         }),new State({
            "name":"disabledAndSelected",
            "stateGroups":["selectedStates","selectedUpStates","disabledStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_IconButtonBarButtonSkin_RectangularDropShadow1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_IconButtonBarButtonSkin_Line2"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_IconButtonBarButtonSkin_Line1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["background"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_IconButtonBarButtonSkin_Rect2_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["background"]
            }),new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            }),new SetProperty().initializeFromObject({
               "target":"bgFill",
               "name":"alpha",
               "value":1
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
         IconButtonBarButtonSkin._watcherSetupUtil = param1;
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
      
      private function _IconButtonBarButtonSkin_Fade1_i() : Fade
      {
         var _loc1_:Fade = new Fade();
         _loc1_.alphaFrom = 0;
         _loc1_.alphaTo = 1;
         _loc1_.duration = 500;
         this.fadeIn = _loc1_;
         BindingManager.executeBindings(this,"fadeIn",this.fadeIn);
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 5;
         _loc1_.bottom = 0;
         _loc1_.fill = this._IconButtonBarButtonSkin_SolidColor1_i();
         _loc1_.initialized(this,"background");
         this.background = _loc1_;
         BindingManager.executeBindings(this,"background",this.background);
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         _loc1_.alpha = 0;
         this.bgFill = _loc1_;
         BindingManager.executeBindings(this,"bgFill",this.bgFill);
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_Rect2_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 1;
         _loc1_.top = 0;
         _loc1_.height = 5;
         _loc1_.fill = this._IconButtonBarButtonSkin_SolidColor2_c();
         _loc1_.initialized(this,"_IconButtonBarButtonSkin_Rect2");
         this._IconButtonBarButtonSkin_Rect2 = _loc1_;
         BindingManager.executeBindings(this,"_IconButtonBarButtonSkin_Rect2",this._IconButtonBarButtonSkin_Rect2);
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 15301947;
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_Line1_i() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.bottom = 0;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.stroke = this._IconButtonBarButtonSkin_SolidColorStroke1_c();
         _loc1_.initialized(this,"_IconButtonBarButtonSkin_Line1");
         this._IconButtonBarButtonSkin_Line1 = _loc1_;
         BindingManager.executeBindings(this,"_IconButtonBarButtonSkin_Line1",this._IconButtonBarButtonSkin_Line1);
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_Line2_i() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.right = 0;
         _loc1_.top = 5;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._IconButtonBarButtonSkin_SolidColorStroke2_c();
         _loc1_.initialized(this,"_IconButtonBarButtonSkin_Line2");
         this._IconButtonBarButtonSkin_Line2 = _loc1_;
         BindingManager.executeBindings(this,"_IconButtonBarButtonSkin_Line2",this._IconButtonBarButtonSkin_Line2);
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 13619151;
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_RectangularDropShadow1_i() : RectangularDropShadow
      {
         var _loc1_:RectangularDropShadow = new RectangularDropShadow();
         _loc1_.left = 0;
         _loc1_.right = 1;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.angle = 270;
         _loc1_.blurX = 8;
         _loc1_.blurY = 8;
         _loc1_.distance = 4;
         _loc1_.alpha = 0.3;
         _loc1_.id = "_IconButtonBarButtonSkin_RectangularDropShadow1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._IconButtonBarButtonSkin_RectangularDropShadow1 = _loc1_;
         BindingManager.executeBindings(this,"_IconButtonBarButtonSkin_RectangularDropShadow1",this._IconButtonBarButtonSkin_RectangularDropShadow1);
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 4;
         _loc1_.bottom = 0;
         _loc1_.mxmlContent = [this._IconButtonBarButtonSkin_BitmapImage1_i()];
         _loc1_.id = "_IconButtonBarButtonSkin_Group1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._IconButtonBarButtonSkin_Group1 = _loc1_;
         BindingManager.executeBindings(this,"_IconButtonBarButtonSkin_Group1",this._IconButtonBarButtonSkin_Group1);
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.initialized(this,"iconDisplay");
         this.iconDisplay = _loc1_;
         BindingManager.executeBindings(this,"iconDisplay",this.iconDisplay);
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_Path1_i() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.horizontalCenter = 0;
         _loc1_.bottom = 0;
         _loc1_.alpha = 0.9;
         _loc1_.data = "M 0 5 l 5 -5 l 5 5 Z";
         _loc1_.fill = this._IconButtonBarButtonSkin_SolidColor3_c();
         _loc1_.initialized(this,"_IconButtonBarButtonSkin_Path1");
         this._IconButtonBarButtonSkin_Path1 = _loc1_;
         BindingManager.executeBindings(this,"_IconButtonBarButtonSkin_Path1",this._IconButtonBarButtonSkin_Path1);
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_SolidColor3_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 2829099;
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_PopUpAnchor1_i() : PopUpAnchor
      {
         var _loc1_:PopUpAnchor = new PopUpAnchor();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.autoClose = false;
         _loc1_.popUpPosition = "belowCenter";
         _loc1_.popUp = this._IconButtonBarButtonSkin_Group2_i();
         _loc1_.id = "_IconButtonBarButtonSkin_PopUpAnchor1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._IconButtonBarButtonSkin_PopUpAnchor1 = _loc1_;
         BindingManager.executeBindings(this,"_IconButtonBarButtonSkin_PopUpAnchor1",this._IconButtonBarButtonSkin_PopUpAnchor1);
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mouseEnabled = false;
         _loc1_.mouseChildren = false;
         _loc1_.blendMode = "layer";
         _loc1_.alpha = 0.9;
         _loc1_.mxmlContent = [this._IconButtonBarButtonSkin_Group3_i()];
         _loc1_.id = "popUpGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.popUpGroup = _loc1_;
         BindingManager.executeBindings(this,"popUpGroup",this.popUpGroup);
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._IconButtonBarButtonSkin_Rect3_c(),this._IconButtonBarButtonSkin_Label1_i()];
         _loc1_.id = "_IconButtonBarButtonSkin_Group3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._IconButtonBarButtonSkin_Group3 = _loc1_;
         BindingManager.executeBindings(this,"_IconButtonBarButtonSkin_Group3",this._IconButtonBarButtonSkin_Group3);
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_Rect3_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._IconButtonBarButtonSkin_SolidColor4_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_SolidColor4_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 2829099;
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.setStyle("color",16777215);
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("paddingLeft",7);
         _loc1_.setStyle("paddingRight",7);
         _loc1_.setStyle("paddingTop",5);
         _loc1_.setStyle("paddingBottom",5);
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",this.labelDisplay);
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_Group4_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.top = 10;
         _loc1_.right = 5;
         _loc1_.width = 18;
         _loc1_.height = 18;
         _loc1_.mxmlContent = [this._IconButtonBarButtonSkin_Ellipse1_c(),this._IconButtonBarButtonSkin_Label2_i()];
         _loc1_.id = "notificationGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.notificationGroup = _loc1_;
         BindingManager.executeBindings(this,"notificationGroup",this.notificationGroup);
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_Ellipse1_c() : Ellipse
      {
         var _loc1_:Ellipse = new Ellipse();
         _loc1_.width = 17;
         _loc1_.height = 17;
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.stroke = this._IconButtonBarButtonSkin_SolidColorStroke3_c();
         _loc1_.fill = this._IconButtonBarButtonSkin_SolidColor5_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_SolidColorStroke3_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 2079654;
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_SolidColor5_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 2079654;
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.setStyle("color",16777215);
         _loc1_.setStyle("fontSize",10);
         _loc1_.id = "notificationLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.notificationLabel = _loc1_;
         BindingManager.executeBindings(this,"notificationLabel",this.notificationLabel);
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Boolean
         {
            return hostComponent.hasLabel;
         },null,"_IconButtonBarButtonSkin_Path1.visible");
         result[1] = new Binding(this,function():Boolean
         {
            return hostComponent.hasLabel;
         },null,"_IconButtonBarButtonSkin_PopUpAnchor1.displayPopUp");
         result[2] = new Binding(this,function():Number
         {
            return background.width;
         },null,"_IconButtonBarButtonSkin_Group3.minWidth");
         result[3] = new Binding(this,null,function(param1:*):void
         {
            notificationGroup.setStyle("showEffect",param1);
         },"notificationGroup.showEffect","fadeIn");
         return result;
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
      public function get fadeIn() : Fade
      {
         return this._1282133823fadeIn;
      }
      
      public function set fadeIn(param1:Fade) : void
      {
         var _loc2_:Object = this._1282133823fadeIn;
         if(_loc2_ !== param1)
         {
            this._1282133823fadeIn = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fadeIn",_loc2_,param1));
            }
         }
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
      public function get notificationGroup() : Group
      {
         return this._1594140588notificationGroup;
      }
      
      public function set notificationGroup(param1:Group) : void
      {
         var _loc2_:Object = this._1594140588notificationGroup;
         if(_loc2_ !== param1)
         {
            this._1594140588notificationGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"notificationGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get notificationLabel() : Label
      {
         return this._1590042423notificationLabel;
      }
      
      public function set notificationLabel(param1:Label) : void
      {
         var _loc2_:Object = this._1590042423notificationLabel;
         if(_loc2_ !== param1)
         {
            this._1590042423notificationLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"notificationLabel",_loc2_,param1));
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
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : IconButtonBarButton
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:IconButtonBarButton) : void
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
