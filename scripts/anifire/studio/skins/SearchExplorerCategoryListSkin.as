package anifire.studio.skins
{
   import anifire.studio.components.SearchExplorerCategoryRenderer;
   import mx.binding.BindingManager;
   import mx.core.ClassFactory;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.DataGroup;
   import spark.components.List;
   import spark.layouts.HorizontalLayout;
   import spark.primitives.Rect;
   import spark.primitives.RectangularDropShadow;
   import spark.skins.SparkSkin;
   
   public class SearchExplorerCategoryListSkin extends SparkSkin implements IStateClient2
   {
       
      
      private var _385593099dataGroup:DataGroup;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _213507019hostComponent:List;
      
      public function SearchExplorerCategoryListSkin()
      {
         super();
         mx_internal::_document = this;
         this.minWidth = 0;
         this.blendMode = "normal";
         this.mxmlContent = [this._SearchExplorerCategoryListSkin_Rect1_c(),this._SearchExplorerCategoryListSkin_Rect2_c(),this._SearchExplorerCategoryListSkin_RectangularDropShadow1_c(),this._SearchExplorerCategoryListSkin_DataGroup1_i()];
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
      
      private function _SearchExplorerCategoryListSkin_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 10;
         _loc1_.fill = this._SearchExplorerCategoryListSkin_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SearchExplorerCategoryListSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 15659768;
         return _loc1_;
      }
      
      private function _SearchExplorerCategoryListSkin_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.height = 10;
         _loc1_.fill = this._SearchExplorerCategoryListSkin_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SearchExplorerCategoryListSkin_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _SearchExplorerCategoryListSkin_RectangularDropShadow1_c() : RectangularDropShadow
      {
         var _loc1_:RectangularDropShadow = new RectangularDropShadow();
         _loc1_.left = -1;
         _loc1_.right = -1;
         _loc1_.bottom = 10;
         _loc1_.angle = 270;
         _loc1_.blurX = 0;
         _loc1_.blurY = 6;
         _loc1_.distance = 3;
         _loc1_.alpha = 0.1;
         _loc1_.color = 3355443;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SearchExplorerCategoryListSkin_DataGroup1_i() : DataGroup
      {
         var _loc1_:DataGroup = new DataGroup();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 10;
         _loc1_.itemRenderer = this._SearchExplorerCategoryListSkin_ClassFactory1_c();
         _loc1_.clipAndEnableScrolling = true;
         _loc1_.layout = this._SearchExplorerCategoryListSkin_HorizontalLayout1_c();
         _loc1_.id = "dataGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dataGroup = _loc1_;
         BindingManager.executeBindings(this,"dataGroup",this.dataGroup);
         return _loc1_;
      }
      
      private function _SearchExplorerCategoryListSkin_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = SearchExplorerCategoryRenderer;
         return _loc1_;
      }
      
      private function _SearchExplorerCategoryListSkin_HorizontalLayout1_c() : HorizontalLayout
      {
         var _loc1_:HorizontalLayout = new HorizontalLayout();
         _loc1_.gap = 0;
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
