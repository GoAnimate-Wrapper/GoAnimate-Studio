package anifire.studio.skins
{
   import anifire.studio.components.BubbleThumbRenderer;
   import anifire.studio.components.BusyIndicator;
   import anifire.studio.components.DecoratedList;
   import mx.binding.BindingManager;
   import mx.core.ClassFactory;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.GradientEntry;
   import mx.graphics.LinearGradient;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.DataGroup;
   import spark.components.Group;
   import spark.components.Scroller;
   import spark.layouts.TileLayout;
   import spark.primitives.Rect;
   import spark.skins.SparkSkin;
   
   public class BubbleListSkin extends SparkSkin implements IStateClient2
   {
       
      
      public var _BubbleListSkin_Rect3:Rect;
      
      private var _1332194002background:Rect;
      
      private var _1395787140borderStroke:SolidColorStroke;
      
      private var _385593099dataGroup:DataGroup;
      
      private var _1419185120dropIndicator:ClassFactory;
      
      private var _1389660835loadingGroup:Group;
      
      private var _402164678scroller:Scroller;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _213507019hostComponent:DecoratedList;
      
      public function BubbleListSkin()
      {
         super();
         mx_internal::_document = this;
         this.minWidth = 112;
         this.blendMode = "normal";
         this.mxmlContent = [this._BubbleListSkin_Rect1_i(),this._BubbleListSkin_Scroller1_i(),this._BubbleListSkin_Rect2_c(),this._BubbleListSkin_Rect3_i()];
         this.currentState = "normal";
         this._BubbleListSkin_ClassFactory1_i();
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._BubbleListSkin_Group1_i);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"loading",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_BubbleListSkin_Rect3"]
            })]
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
      
      private function _BubbleListSkin_ClassFactory1_i() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = BubbleListSkinInnerClass0;
         _loc1_.properties = {"outerDocument":this};
         this.dropIndicator = _loc1_;
         BindingManager.executeBindings(this,"dropIndicator",this.dropIndicator);
         return _loc1_;
      }
      
      private function _BubbleListSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._BubbleListSkin_SolidColorStroke1_i();
         _loc1_.fill = this._BubbleListSkin_SolidColor1_c();
         _loc1_.initialized(this,"background");
         this.background = _loc1_;
         BindingManager.executeBindings(this,"background",this.background);
         return _loc1_;
      }
      
      private function _BubbleListSkin_SolidColorStroke1_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.weight = 1;
         _loc1_.color = 14737632;
         this.borderStroke = _loc1_;
         BindingManager.executeBindings(this,"borderStroke",this.borderStroke);
         return _loc1_;
      }
      
      private function _BubbleListSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 15594230;
         return _loc1_;
      }
      
      private function _BubbleListSkin_Scroller1_i() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.hasFocusableChildren = false;
         _loc1_.minViewportInset = 1;
         _loc1_.viewport = this._BubbleListSkin_DataGroup1_i();
         _loc1_.setStyle("horizontalScrollPolicy","off");
         _loc1_.setStyle("verticalScrollPolicy","on");
         _loc1_.id = "scroller";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.scroller = _loc1_;
         BindingManager.executeBindings(this,"scroller",this.scroller);
         return _loc1_;
      }
      
      private function _BubbleListSkin_DataGroup1_i() : DataGroup
      {
         var _loc1_:DataGroup = new DataGroup();
         _loc1_.itemRenderer = this._BubbleListSkin_ClassFactory2_c();
         _loc1_.layout = this._BubbleListSkin_TileLayout1_c();
         _loc1_.id = "dataGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dataGroup = _loc1_;
         BindingManager.executeBindings(this,"dataGroup",this.dataGroup);
         return _loc1_;
      }
      
      private function _BubbleListSkin_ClassFactory2_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = BubbleThumbRenderer;
         return _loc1_;
      }
      
      private function _BubbleListSkin_TileLayout1_c() : TileLayout
      {
         var _loc1_:TileLayout = new TileLayout();
         _loc1_.horizontalGap = 2;
         _loc1_.verticalGap = 2;
         _loc1_.columnAlign = "justifyUsingGap";
         _loc1_.paddingTop = 6;
         _loc1_.paddingBottom = 6;
         _loc1_.requestedColumnCount = 4;
         _loc1_.orientation = "rows";
         _loc1_.useVirtualLayout = true;
         return _loc1_;
      }
      
      private function _BubbleListSkin_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.top = 1;
         _loc1_.left = 0;
         _loc1_.right = 16;
         _loc1_.height = 10;
         _loc1_.fill = this._BubbleListSkin_LinearGradient1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _BubbleListSkin_LinearGradient1_c() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.rotation = 90;
         _loc1_.entries = [this._BubbleListSkin_GradientEntry1_c(),this._BubbleListSkin_GradientEntry2_c()];
         return _loc1_;
      }
      
      private function _BubbleListSkin_GradientEntry1_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 3355443;
         _loc1_.alpha = 0.1;
         return _loc1_;
      }
      
      private function _BubbleListSkin_GradientEntry2_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 3355443;
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      private function _BubbleListSkin_Rect3_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.bottom = 1;
         _loc1_.left = 0;
         _loc1_.right = 16;
         _loc1_.height = 10;
         _loc1_.fill = this._BubbleListSkin_LinearGradient2_c();
         _loc1_.initialized(this,"_BubbleListSkin_Rect3");
         this._BubbleListSkin_Rect3 = _loc1_;
         BindingManager.executeBindings(this,"_BubbleListSkin_Rect3",this._BubbleListSkin_Rect3);
         return _loc1_;
      }
      
      private function _BubbleListSkin_LinearGradient2_c() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.rotation = 90;
         _loc1_.entries = [this._BubbleListSkin_GradientEntry3_c(),this._BubbleListSkin_GradientEntry4_c()];
         return _loc1_;
      }
      
      private function _BubbleListSkin_GradientEntry3_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 3355443;
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      private function _BubbleListSkin_GradientEntry4_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 3355443;
         _loc1_.alpha = 0.1;
         return _loc1_;
      }
      
      private function _BubbleListSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.mxmlContent = [this._BubbleListSkin_Rect4_c(),this._BubbleListSkin_BusyIndicator1_c()];
         _loc1_.id = "loadingGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.loadingGroup = _loc1_;
         BindingManager.executeBindings(this,"loadingGroup",this.loadingGroup);
         return _loc1_;
      }
      
      private function _BubbleListSkin_Rect4_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._BubbleListSkin_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _BubbleListSkin_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.alpha = 0.5;
         return _loc1_;
      }
      
      private function _BubbleListSkin_BusyIndicator1_c() : BusyIndicator
      {
         var _loc1_:BusyIndicator = new BusyIndicator();
         _loc1_.width = 60;
         _loc1_.height = 60;
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
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
      public function get dropIndicator() : ClassFactory
      {
         return this._1419185120dropIndicator;
      }
      
      public function set dropIndicator(param1:ClassFactory) : void
      {
         var _loc2_:Object = this._1419185120dropIndicator;
         if(_loc2_ !== param1)
         {
            this._1419185120dropIndicator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dropIndicator",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get loadingGroup() : Group
      {
         return this._1389660835loadingGroup;
      }
      
      public function set loadingGroup(param1:Group) : void
      {
         var _loc2_:Object = this._1389660835loadingGroup;
         if(_loc2_ !== param1)
         {
            this._1389660835loadingGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"loadingGroup",_loc2_,param1));
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
      public function get hostComponent() : DecoratedList
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:DecoratedList) : void
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
