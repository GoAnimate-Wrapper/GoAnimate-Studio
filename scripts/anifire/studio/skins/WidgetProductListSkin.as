package anifire.studio.skins
{
   import mx.binding.BindingManager;
   import mx.core.ClassFactory;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.GradientEntry;
   import mx.graphics.LinearGradient;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.DataGroup;
   import spark.components.List;
   import spark.components.Scroller;
   import spark.layouts.TileLayout;
   import spark.primitives.Rect;
   import spark.skins.SparkSkin;
   import spark.skins.spark.DefaultItemRenderer;
   
   public class WidgetProductListSkin extends SparkSkin implements IStateClient2
   {
      
      private static const focusExclusions:Array = ["scroller"];
       
      
      private var _385593099dataGroup:DataGroup;
      
      private var _402164678scroller:Scroller;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _213507019hostComponent:List;
      
      public function WidgetProductListSkin()
      {
         super();
         mx_internal::_document = this;
         this.minWidth = 112;
         this.blendMode = "normal";
         this.mxmlContent = [this._WidgetProductListSkin_Scroller1_i(),this._WidgetProductListSkin_Rect1_c(),this._WidgetProductListSkin_Rect2_c()];
         this.currentState = "normal";
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"disabled",
            "overrides":[new SetProperty().initializeFromObject({
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
      
      private function _WidgetProductListSkin_Scroller1_i() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.minViewportInset = 1;
         _loc1_.hasFocusableChildren = false;
         _loc1_.viewport = this._WidgetProductListSkin_DataGroup1_i();
         _loc1_.id = "scroller";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.scroller = _loc1_;
         BindingManager.executeBindings(this,"scroller",this.scroller);
         return _loc1_;
      }
      
      private function _WidgetProductListSkin_DataGroup1_i() : DataGroup
      {
         var _loc1_:DataGroup = new DataGroup();
         _loc1_.itemRenderer = this._WidgetProductListSkin_ClassFactory1_c();
         _loc1_.layout = this._WidgetProductListSkin_TileLayout1_c();
         _loc1_.id = "dataGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dataGroup = _loc1_;
         BindingManager.executeBindings(this,"dataGroup",this.dataGroup);
         return _loc1_;
      }
      
      private function _WidgetProductListSkin_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = DefaultItemRenderer;
         return _loc1_;
      }
      
      private function _WidgetProductListSkin_TileLayout1_c() : TileLayout
      {
         var _loc1_:TileLayout = new TileLayout();
         _loc1_.columnAlign = "justifyUsingWidth";
         _loc1_.horizontalAlign = "center";
         _loc1_.paddingTop = 6;
         _loc1_.paddingBottom = 6;
         _loc1_.paddingLeft = 6;
         _loc1_.paddingRight = 6;
         _loc1_.useVirtualLayout = true;
         _loc1_.requestedColumnCount = 3;
         _loc1_.orientation = "rows";
         return _loc1_;
      }
      
      private function _WidgetProductListSkin_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.top = 0;
         _loc1_.left = 0;
         _loc1_.right = 16;
         _loc1_.height = 10;
         _loc1_.fill = this._WidgetProductListSkin_LinearGradient1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _WidgetProductListSkin_LinearGradient1_c() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.rotation = 90;
         _loc1_.entries = [this._WidgetProductListSkin_GradientEntry1_c(),this._WidgetProductListSkin_GradientEntry2_c()];
         return _loc1_;
      }
      
      private function _WidgetProductListSkin_GradientEntry1_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 3355443;
         _loc1_.alpha = 0.1;
         return _loc1_;
      }
      
      private function _WidgetProductListSkin_GradientEntry2_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 3355443;
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      private function _WidgetProductListSkin_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.bottom = 0;
         _loc1_.left = 0;
         _loc1_.right = 16;
         _loc1_.height = 10;
         _loc1_.fill = this._WidgetProductListSkin_LinearGradient2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _WidgetProductListSkin_LinearGradient2_c() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.rotation = 90;
         _loc1_.entries = [this._WidgetProductListSkin_GradientEntry3_c(),this._WidgetProductListSkin_GradientEntry4_c()];
         return _loc1_;
      }
      
      private function _WidgetProductListSkin_GradientEntry3_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 3355443;
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      private function _WidgetProductListSkin_GradientEntry4_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 3355443;
         _loc1_.alpha = 0.1;
         return _loc1_;
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
      public function get scroller() : Scroller
      {
         return this._402164678scroller;
      }
      
      public function set scroller(param1:Scroller) : void
      {
         var _loc2_:Object = this._402164678scroller;
         if(_loc2_ !== param1)
         {
            this._402164678scroller = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scroller",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : List
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:List) : void
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
