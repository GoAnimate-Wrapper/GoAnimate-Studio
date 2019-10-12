package anifire.studio.skins
{
   import anifire.studio.components.FontDropDownListItemRenderer;
   import anifire.studio.components.MenuItemList;
   import mx.binding.BindingManager;
   import mx.core.ClassFactory;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.DataGroup;
   import spark.components.Scroller;
   import spark.layouts.VerticalLayout;
   import spark.skins.SparkSkin;
   
   public class FontMenuItemListSkin extends SparkSkin implements IStateClient2
   {
       
      
      private var _385593099dataGroup:DataGroup;
      
      private var _1419185120dropIndicator:ClassFactory;
      
      private var _402164678scroller:Scroller;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _213507019hostComponent:MenuItemList;
      
      public function FontMenuItemListSkin()
      {
         super();
         mx_internal::_document = this;
         this.minWidth = 112;
         this.blendMode = "normal";
         this.mxmlContent = [this._FontMenuItemListSkin_Scroller1_i()];
         this.currentState = "normal";
         this._FontMenuItemListSkin_ClassFactory1_i();
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
      
      private function _FontMenuItemListSkin_ClassFactory1_i() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = FontMenuItemListSkinInnerClass0;
         _loc1_.properties = {"outerDocument":this};
         this.dropIndicator = _loc1_;
         BindingManager.executeBindings(this,"dropIndicator",this.dropIndicator);
         return _loc1_;
      }
      
      private function _FontMenuItemListSkin_Scroller1_i() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.minViewportInset = 1;
         _loc1_.hasFocusableChildren = false;
         _loc1_.viewport = this._FontMenuItemListSkin_DataGroup1_i();
         _loc1_.id = "scroller";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.scroller = _loc1_;
         BindingManager.executeBindings(this,"scroller",this.scroller);
         return _loc1_;
      }
      
      private function _FontMenuItemListSkin_DataGroup1_i() : DataGroup
      {
         var _loc1_:DataGroup = new DataGroup();
         _loc1_.itemRenderer = this._FontMenuItemListSkin_ClassFactory2_c();
         _loc1_.layout = this._FontMenuItemListSkin_VerticalLayout1_c();
         _loc1_.id = "dataGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dataGroup = _loc1_;
         BindingManager.executeBindings(this,"dataGroup",this.dataGroup);
         return _loc1_;
      }
      
      private function _FontMenuItemListSkin_ClassFactory2_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = FontDropDownListItemRenderer;
         return _loc1_;
      }
      
      private function _FontMenuItemListSkin_VerticalLayout1_c() : VerticalLayout
      {
         var _loc1_:VerticalLayout = new VerticalLayout();
         _loc1_.gap = 0;
         _loc1_.horizontalAlign = "contentJustify";
         _loc1_.requestedMinRowCount = 1;
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
      public function get hostComponent() : MenuItemList
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:MenuItemList) : void
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
