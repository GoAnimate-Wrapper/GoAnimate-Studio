package anifire.studio.skins
{
   import anifire.component.ColorInputPanel;
   import anifire.studio.components.ColorPaletteDropDown;
   import anifire.studio.components.ColorPickerOpenButton;
   import anifire.studio.components.ColorPickerSwatchRenderer;
   import anifire.studio.components.OpacitySlider;
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
   import spark.components.Group;
   import spark.components.PopUpAnchor;
   import spark.components.Scroller;
   import spark.components.VGroup;
   import spark.layouts.TileLayout;
   import spark.primitives.Rect;
   import spark.skins.SparkSkin;
   
   use namespace mx_internal;
   
   public class MiniColorPaletteDropDownSkin extends SparkSkin implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _1161397219colorInputPanel:ColorInputPanel;
      
      private var _104194354colorInputPanelAnchor:Group;
      
      private var _385593099dataGroup:DataGroup;
      
      private var _433014735dropDown:Group;
      
      private var _575137996opacitySlider:OpacitySlider;
      
      private var _137111012openButton:ColorPickerOpenButton;
      
      private var _556712917paletteScroller:Scroller;
      
      private var _106851532popUp:PopUpAnchor;
      
      private var _605271256swatchPanel:VGroup;
      
      private var _251129000tilelayout:TileLayout;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:ColorPaletteDropDown;
      
      public function MiniColorPaletteDropDownSkin()
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
         bindings = this._MiniColorPaletteDropDownSkin_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_skins_MiniColorPaletteDropDownSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return MiniColorPaletteDropDownSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._MiniColorPaletteDropDownSkin_ColorPickerOpenButton1_i()];
         this.currentState = "normal";
         var _MiniColorPaletteDropDownSkin_PopUpAnchor1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._MiniColorPaletteDropDownSkin_PopUpAnchor1_i,this._MiniColorPaletteDropDownSkin_PopUpAnchor1_r);
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
               "itemsFactory":_MiniColorPaletteDropDownSkin_PopUpAnchor1_factory,
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
         MiniColorPaletteDropDownSkin._watcherSetupUtil = param1;
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
      
      private function _MiniColorPaletteDropDownSkin_PopUpAnchor1_i() : PopUpAnchor
      {
         var _loc1_:PopUpAnchor = new PopUpAnchor();
         _loc1_.left = 0;
         _loc1_.top = 14;
         _loc1_.bottom = 0;
         _loc1_.popUpPosition = "below";
         _loc1_.popUpWidthMatchesAnchorWidth = false;
         _loc1_.popUp = this._MiniColorPaletteDropDownSkin_Group1_i();
         _loc1_.id = "popUp";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.popUp = _loc1_;
         BindingManager.executeBindings(this,"popUp",this.popUp);
         return _loc1_;
      }
      
      private function _MiniColorPaletteDropDownSkin_PopUpAnchor1_r() : void
      {
      }
      
      private function _MiniColorPaletteDropDownSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._MiniColorPaletteDropDownSkin_Rect1_c(),this._MiniColorPaletteDropDownSkin_VGroup1_i(),this._MiniColorPaletteDropDownSkin_Group2_i()];
         _loc1_.id = "dropDown";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dropDown = _loc1_;
         BindingManager.executeBindings(this,"dropDown",this.dropDown);
         return _loc1_;
      }
      
      private function _MiniColorPaletteDropDownSkin_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.radiusX = 4;
         _loc1_.radiusY = 4;
         _loc1_.fill = this._MiniColorPaletteDropDownSkin_SolidColor1_c();
         _loc1_.stroke = this._MiniColorPaletteDropDownSkin_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _MiniColorPaletteDropDownSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         _loc1_.alpha = 0.8;
         return _loc1_;
      }
      
      private function _MiniColorPaletteDropDownSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 14013917;
         _loc1_.weight = 1;
         return _loc1_;
      }
      
      private function _MiniColorPaletteDropDownSkin_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.gap = 4;
         _loc1_.paddingLeft = 11;
         _loc1_.paddingRight = 11;
         _loc1_.paddingTop = 11;
         _loc1_.paddingBottom = 11;
         _loc1_.mxmlContent = [this._MiniColorPaletteDropDownSkin_Scroller1_i(),this._MiniColorPaletteDropDownSkin_OpacitySlider1_i()];
         _loc1_.id = "swatchPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.swatchPanel = _loc1_;
         BindingManager.executeBindings(this,"swatchPanel",this.swatchPanel);
         return _loc1_;
      }
      
      private function _MiniColorPaletteDropDownSkin_Scroller1_i() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.percentWidth = 100;
         _loc1_.maxHeight = 150;
         _loc1_.viewport = this._MiniColorPaletteDropDownSkin_DataGroup1_i();
         _loc1_.setStyle("verticalScrollPolicy","auto");
         _loc1_.setStyle("horizontalScrollPolicy","off");
         _loc1_.id = "paletteScroller";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.paletteScroller = _loc1_;
         BindingManager.executeBindings(this,"paletteScroller",this.paletteScroller);
         return _loc1_;
      }
      
      private function _MiniColorPaletteDropDownSkin_DataGroup1_i() : DataGroup
      {
         var _loc1_:DataGroup = new DataGroup();
         _loc1_.itemRenderer = this._MiniColorPaletteDropDownSkin_ClassFactory1_c();
         _loc1_.layout = this._MiniColorPaletteDropDownSkin_TileLayout1_i();
         _loc1_.id = "dataGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dataGroup = _loc1_;
         BindingManager.executeBindings(this,"dataGroup",this.dataGroup);
         return _loc1_;
      }
      
      private function _MiniColorPaletteDropDownSkin_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = ColorPickerSwatchRenderer;
         return _loc1_;
      }
      
      private function _MiniColorPaletteDropDownSkin_TileLayout1_i() : TileLayout
      {
         var _loc1_:TileLayout = new TileLayout();
         _loc1_.columnAlign = "justifyUsingGap";
         _loc1_.paddingLeft = 4;
         _loc1_.paddingRight = 4;
         _loc1_.paddingTop = 4;
         _loc1_.paddingBottom = 4;
         _loc1_.verticalGap = 10;
         _loc1_.horizontalGap = 10;
         _loc1_.requestedColumnCount = 6;
         this.tilelayout = _loc1_;
         BindingManager.executeBindings(this,"tilelayout",this.tilelayout);
         return _loc1_;
      }
      
      private function _MiniColorPaletteDropDownSkin_OpacitySlider1_i() : OpacitySlider
      {
         var _loc1_:OpacitySlider = new OpacitySlider();
         _loc1_.percentWidth = 100;
         _loc1_.minimum = 0;
         _loc1_.maximum = 100;
         _loc1_.stepSize = 1;
         _loc1_.setStyle("skinClass",OpacitySliderSkin);
         _loc1_.id = "opacitySlider";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.opacitySlider = _loc1_;
         BindingManager.executeBindings(this,"opacitySlider",this.opacitySlider);
         return _loc1_;
      }
      
      private function _MiniColorPaletteDropDownSkin_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 0;
         _loc1_.height = 0;
         _loc1_.includeInLayout = false;
         _loc1_.mxmlContent = [this._MiniColorPaletteDropDownSkin_ColorInputPanel1_i()];
         _loc1_.id = "colorInputPanelAnchor";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.colorInputPanelAnchor = _loc1_;
         BindingManager.executeBindings(this,"colorInputPanelAnchor",this.colorInputPanelAnchor);
         return _loc1_;
      }
      
      private function _MiniColorPaletteDropDownSkin_ColorInputPanel1_i() : ColorInputPanel
      {
         var _loc1_:ColorInputPanel = null;
         _loc1_ = new ColorInputPanel();
         _loc1_.bottom = 14;
         _loc1_.left = 0;
         _loc1_.visible = false;
         _loc1_.id = "colorInputPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.colorInputPanel = _loc1_;
         BindingManager.executeBindings(this,"colorInputPanel",this.colorInputPanel);
         return _loc1_;
      }
      
      private function _MiniColorPaletteDropDownSkin_ColorPickerOpenButton1_i() : ColorPickerOpenButton
      {
         var _loc1_:ColorPickerOpenButton = new ColorPickerOpenButton();
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.buttonMode = true;
         _loc1_.focusEnabled = false;
         _loc1_.tabEnabled = false;
         _loc1_.setStyle("skinClass",SimpleColorPickerOpenButtonSkin);
         _loc1_.id = "openButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.openButton = _loc1_;
         BindingManager.executeBindings(this,"openButton",this.openButton);
         return _loc1_;
      }
      
      private function _MiniColorPaletteDropDownSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Number
         {
            return hostComponent.selectedAlpha;
         },null,"opacitySlider.value");
         result[1] = new Binding(this,function():uint
         {
            return hostComponent.selectedColor;
         },null,"opacitySlider.baseColor");
         result[2] = new Binding(this,function():Boolean
         {
            return hostComponent.allowTransparent;
         },null,"opacitySlider.visible");
         result[3] = new Binding(this,function():Boolean
         {
            return hostComponent.allowTransparent;
         },null,"opacitySlider.includeInLayout");
         result[4] = new Binding(this,function():uint
         {
            return hostComponent.selectedColor;
         },null,"openButton.color");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get colorInputPanel() : ColorInputPanel
      {
         return this._1161397219colorInputPanel;
      }
      
      public function set colorInputPanel(param1:ColorInputPanel) : void
      {
         var _loc2_:Object = this._1161397219colorInputPanel;
         if(_loc2_ !== param1)
         {
            this._1161397219colorInputPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"colorInputPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get colorInputPanelAnchor() : Group
      {
         return this._104194354colorInputPanelAnchor;
      }
      
      public function set colorInputPanelAnchor(param1:Group) : void
      {
         var _loc2_:Object = this._104194354colorInputPanelAnchor;
         if(_loc2_ !== param1)
         {
            this._104194354colorInputPanelAnchor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"colorInputPanelAnchor",_loc2_,param1));
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
      public function get opacitySlider() : OpacitySlider
      {
         return this._575137996opacitySlider;
      }
      
      public function set opacitySlider(param1:OpacitySlider) : void
      {
         var _loc2_:Object = this._575137996opacitySlider;
         if(_loc2_ !== param1)
         {
            this._575137996opacitySlider = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"opacitySlider",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get openButton() : ColorPickerOpenButton
      {
         return this._137111012openButton;
      }
      
      public function set openButton(param1:ColorPickerOpenButton) : void
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
      public function get paletteScroller() : Scroller
      {
         return this._556712917paletteScroller;
      }
      
      public function set paletteScroller(param1:Scroller) : void
      {
         var _loc2_:Object = this._556712917paletteScroller;
         if(_loc2_ !== param1)
         {
            this._556712917paletteScroller = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"paletteScroller",_loc2_,param1));
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
      public function get swatchPanel() : VGroup
      {
         return this._605271256swatchPanel;
      }
      
      public function set swatchPanel(param1:VGroup) : void
      {
         var _loc2_:Object = this._605271256swatchPanel;
         if(_loc2_ !== param1)
         {
            this._605271256swatchPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"swatchPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tilelayout() : TileLayout
      {
         return this._251129000tilelayout;
      }
      
      public function set tilelayout(param1:TileLayout) : void
      {
         var _loc2_:Object = this._251129000tilelayout;
         if(_loc2_ !== param1)
         {
            this._251129000tilelayout = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tilelayout",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : ColorPaletteDropDown
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:ColorPaletteDropDown) : void
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
