package anifire.studio.skins
{
   import anifire.studio.components.ArrowTipContainer;
   import anifire.studio.components.ColorPalettePickerItemRenderer;
   import anifire.studio.components.ColorPalettePickerOpenButton;
   import anifire.util.UtilDict;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.ClassFactory;
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
   import spark.components.DataGroup;
   import spark.components.DropDownList;
   import spark.components.Group;
   import spark.components.Label;
   import spark.components.List;
   import spark.components.PopUpAnchor;
   import spark.components.VGroup;
   import spark.layouts.TileLayout;
   import spark.primitives.Rect;
   import spark.primitives.RectangularDropShadow;
   import spark.skins.SparkSkin;
   
   use namespace mx_internal;
   
   public class ColorPalettePickerSkin extends SparkSkin implements IBindingClient, IStateClient2
   {
      
      private static const contentFill:Array = ["bgFill"];
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _ColorPalettePickerSkin_Label1:Label;
      
      public var _ColorPalettePickerSkin_Label2:Label;
      
      private var _1332194002background:Rect;
      
      private var _1391998104bgFill:SolidColor;
      
      private var _1383304148border:Rect;
      
      private var _1395787140borderStroke:SolidColorStroke;
      
      private var _385593099dataGroup:DataGroup;
      
      private var _433014735dropDown:Group;
      
      private var _906978543dropShadow:RectangularDropShadow;
      
      private var _2037826537nonSingleColorSection:VGroup;
      
      private var _137111012openButton:ColorPalettePickerOpenButton;
      
      private var _106851532popUp:PopUpAnchor;
      
      private var _1253779655singleColorList:List;
      
      private var _525726102singleColorSection:VGroup;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:DropDownList;
      
      public function ColorPalettePickerSkin()
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
         bindings = this._ColorPalettePickerSkin_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_skins_ColorPalettePickerSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ColorPalettePickerSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._ColorPalettePickerSkin_ColorPalettePickerOpenButton1_i()];
         this.currentState = "normal";
         var _ColorPalettePickerSkin_PopUpAnchor1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ColorPalettePickerSkin_PopUpAnchor1_i,this._ColorPalettePickerSkin_PopUpAnchor1_r);
         states = [new State({
            "name":"normal",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"popUp",
               "name":"displayPopUp",
               "value":false
            })]
         }),new State({
            "name":"open",
            "overrides":[new AddItems().initializeFromObject({
               "destructionPolicy":"auto",
               "itemsFactory":_ColorPalettePickerSkin_PopUpAnchor1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new SetProperty().initializeFromObject({
               "target":"popUp",
               "name":"displayPopUp",
               "value":true
            })]
         }),new State({
            "name":"disabled",
            "overrides":[new SetProperty().initializeFromObject({
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
         ColorPalettePickerSkin._watcherSetupUtil = param1;
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
      
      override public function get contentItems() : Array
      {
         return contentFill;
      }
      
      private function _ColorPalettePickerSkin_PopUpAnchor1_i() : PopUpAnchor
      {
         var _loc1_:PopUpAnchor = new PopUpAnchor();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.popUpPosition = "below";
         _loc1_.popUpWidthMatchesAnchorWidth = false;
         _loc1_.popUp = this._ColorPalettePickerSkin_Group1_i();
         _loc1_.id = "popUp";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.popUp = _loc1_;
         BindingManager.executeBindings(this,"popUp",this.popUp);
         return _loc1_;
      }
      
      private function _ColorPalettePickerSkin_PopUpAnchor1_r() : void
      {
      }
      
      private function _ColorPalettePickerSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._ColorPalettePickerSkin_RectangularDropShadow1_i(),this._ColorPalettePickerSkin_Rect1_i(),this._ColorPalettePickerSkin_Rect2_i(),this._ColorPalettePickerSkin_ArrowTipContainer1_c()];
         _loc1_.id = "dropDown";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dropDown = _loc1_;
         BindingManager.executeBindings(this,"dropDown",this.dropDown);
         return _loc1_;
      }
      
      private function _ColorPalettePickerSkin_RectangularDropShadow1_i() : RectangularDropShadow
      {
         var _loc1_:RectangularDropShadow = new RectangularDropShadow();
         _loc1_.blurX = 20;
         _loc1_.blurY = 20;
         _loc1_.alpha = 0;
         _loc1_.distance = 7;
         _loc1_.angle = 90;
         _loc1_.color = 0;
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.id = "dropShadow";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dropShadow = _loc1_;
         BindingManager.executeBindings(this,"dropShadow",this.dropShadow);
         return _loc1_;
      }
      
      private function _ColorPalettePickerSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.alpha = 0;
         _loc1_.stroke = this._ColorPalettePickerSkin_SolidColorStroke1_i();
         _loc1_.initialized(this,"border");
         this.border = _loc1_;
         BindingManager.executeBindings(this,"border",this.border);
         return _loc1_;
      }
      
      private function _ColorPalettePickerSkin_SolidColorStroke1_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.weight = 1;
         this.borderStroke = _loc1_;
         BindingManager.executeBindings(this,"borderStroke",this.borderStroke);
         return _loc1_;
      }
      
      private function _ColorPalettePickerSkin_Rect2_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.right = 1;
         _loc1_.top = 1;
         _loc1_.bottom = 1;
         _loc1_.alpha = 0;
         _loc1_.fill = this._ColorPalettePickerSkin_SolidColor1_i();
         _loc1_.initialized(this,"background");
         this.background = _loc1_;
         BindingManager.executeBindings(this,"background",this.background);
         return _loc1_;
      }
      
      private function _ColorPalettePickerSkin_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         this.bgFill = _loc1_;
         BindingManager.executeBindings(this,"bgFill",this.bgFill);
         return _loc1_;
      }
      
      private function _ColorPalettePickerSkin_ArrowTipContainer1_c() : ArrowTipContainer
      {
         var _loc1_:ArrowTipContainer = new ArrowTipContainer();
         _loc1_.tipPosition = "below";
         _loc1_.offset = -5;
         _loc1_.content = [this._ColorPalettePickerSkin_VGroup1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ColorPalettePickerSkin_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.paddingLeft = 10;
         _loc1_.paddingRight = 10;
         _loc1_.paddingTop = 10;
         _loc1_.paddingBottom = 10;
         _loc1_.gap = 15;
         _loc1_.mxmlContent = [this._ColorPalettePickerSkin_VGroup2_i(),this._ColorPalettePickerSkin_VGroup3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ColorPalettePickerSkin_VGroup2_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.gap = 10;
         _loc1_.mxmlContent = [this._ColorPalettePickerSkin_Label1_i(),this._ColorPalettePickerSkin_DataGroup1_i()];
         _loc1_.id = "nonSingleColorSection";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.nonSingleColorSection = _loc1_;
         BindingManager.executeBindings(this,"nonSingleColorSection",this.nonSingleColorSection);
         return _loc1_;
      }
      
      private function _ColorPalettePickerSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("typographicCase","uppercase");
         _loc1_.id = "_ColorPalettePickerSkin_Label1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ColorPalettePickerSkin_Label1 = _loc1_;
         BindingManager.executeBindings(this,"_ColorPalettePickerSkin_Label1",this._ColorPalettePickerSkin_Label1);
         return _loc1_;
      }
      
      private function _ColorPalettePickerSkin_DataGroup1_i() : DataGroup
      {
         var _loc1_:DataGroup = new DataGroup();
         _loc1_.itemRenderer = this._ColorPalettePickerSkin_ClassFactory1_c();
         _loc1_.layout = this._ColorPalettePickerSkin_TileLayout1_c();
         _loc1_.id = "dataGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dataGroup = _loc1_;
         BindingManager.executeBindings(this,"dataGroup",this.dataGroup);
         return _loc1_;
      }
      
      private function _ColorPalettePickerSkin_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = ColorPalettePickerItemRenderer;
         return _loc1_;
      }
      
      private function _ColorPalettePickerSkin_TileLayout1_c() : TileLayout
      {
         var _loc1_:TileLayout = new TileLayout();
         _loc1_.requestedColumnCount = 2;
         _loc1_.horizontalGap = 0;
         _loc1_.verticalGap = 0;
         return _loc1_;
      }
      
      private function _ColorPalettePickerSkin_VGroup3_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.gap = 10;
         _loc1_.mxmlContent = [this._ColorPalettePickerSkin_Label2_i(),this._ColorPalettePickerSkin_List1_i()];
         _loc1_.id = "singleColorSection";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.singleColorSection = _loc1_;
         BindingManager.executeBindings(this,"singleColorSection",this.singleColorSection);
         return _loc1_;
      }
      
      private function _ColorPalettePickerSkin_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("typographicCase","uppercase");
         _loc1_.id = "_ColorPalettePickerSkin_Label2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ColorPalettePickerSkin_Label2 = _loc1_;
         BindingManager.executeBindings(this,"_ColorPalettePickerSkin_Label2",this._ColorPalettePickerSkin_Label2);
         return _loc1_;
      }
      
      private function _ColorPalettePickerSkin_List1_i() : List
      {
         var _loc1_:List = new List();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("skinClass",ColorPaletteSingleColorListSkin);
         _loc1_.id = "singleColorList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.singleColorList = _loc1_;
         BindingManager.executeBindings(this,"singleColorList",this.singleColorList);
         return _loc1_;
      }
      
      private function _ColorPalettePickerSkin_ColorPalettePickerOpenButton1_i() : ColorPalettePickerOpenButton
      {
         var _loc1_:ColorPalettePickerOpenButton = new ColorPalettePickerOpenButton();
         _loc1_.focusEnabled = false;
         _loc1_.tabEnabled = false;
         _loc1_.buttonMode = true;
         _loc1_.setStyle("skinClass",ColorPalettePickerOpenButtonSkin);
         _loc1_.id = "openButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.openButton = _loc1_;
         BindingManager.executeBindings(this,"openButton",this.openButton);
         return _loc1_;
      }
      
      private function _ColorPalettePickerSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Pick a color scheme:");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_ColorPalettePickerSkin_Label1.text");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Use a single color:");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_ColorPalettePickerSkin_Label2.text");
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
      public function get dataGroup() : DataGroup
      {
         return this._385593099dataGroup;
      }
      
      public function set dataGroup(param1:DataGroup) : void
      {
         var _loc2_:Object = this._385593099dataGroup;
         if(_loc2_ !== param1)
         {
            this._385593099dataGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dataGroup",_loc2_,param1));
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
      public function get nonSingleColorSection() : VGroup
      {
         return this._2037826537nonSingleColorSection;
      }
      
      public function set nonSingleColorSection(param1:VGroup) : void
      {
         var _loc2_:Object = this._2037826537nonSingleColorSection;
         if(_loc2_ !== param1)
         {
            this._2037826537nonSingleColorSection = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"nonSingleColorSection",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get openButton() : ColorPalettePickerOpenButton
      {
         return this._137111012openButton;
      }
      
      public function set openButton(param1:ColorPalettePickerOpenButton) : void
      {
         var _loc2_:Object = this._137111012openButton;
         if(_loc2_ !== param1)
         {
            this._137111012openButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"openButton",_loc2_,param1));
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
      public function get singleColorList() : List
      {
         return this._1253779655singleColorList;
      }
      
      public function set singleColorList(param1:List) : void
      {
         var _loc2_:Object = this._1253779655singleColorList;
         if(_loc2_ !== param1)
         {
            this._1253779655singleColorList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"singleColorList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get singleColorSection() : VGroup
      {
         return this._525726102singleColorSection;
      }
      
      public function set singleColorSection(param1:VGroup) : void
      {
         var _loc2_:Object = this._525726102singleColorSection;
         if(_loc2_ !== param1)
         {
            this._525726102singleColorSection = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"singleColorSection",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : DropDownList
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:DropDownList) : void
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
