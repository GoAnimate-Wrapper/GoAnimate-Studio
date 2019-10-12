package anifire.studio.components
{
   import anifire.studio.models.MenuItemModel;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Label;
   import spark.components.supportClasses.ItemRenderer;
   import spark.primitives.Rect;
   
   public class SwapAssetDropDownListItemRenderer extends ItemRenderer implements IStateClient2
   {
       
      
      private var _1207991805_SwapAssetDropDownListItemRenderer_SolidColor1:SolidColor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _104069929model:MenuItemModel;
      
      public function SwapAssetDropDownListItemRenderer()
      {
         super();
         mx_internal::_document = this;
         this.autoDrawBackground = false;
         this.mxmlContent = [this._SwapAssetDropDownListItemRenderer_Rect1_c(),this._SwapAssetDropDownListItemRenderer_Label1_i()];
         this.currentState = "normal";
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"hovered",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_SwapAssetDropDownListItemRenderer_SolidColor1",
               "name":"color",
               "value":6142119
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
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         this.model = data as MenuItemModel;
         if(this.model)
         {
            labelDisplay.text = this.model.label;
         }
      }
      
      private function _SwapAssetDropDownListItemRenderer_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._SwapAssetDropDownListItemRenderer_SolidColor1_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SwapAssetDropDownListItemRenderer_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 3619402;
         this._SwapAssetDropDownListItemRenderer_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_SwapAssetDropDownListItemRenderer_SolidColor1",this._SwapAssetDropDownListItemRenderer_SolidColor1);
         return _loc1_;
      }
      
      private function _SwapAssetDropDownListItemRenderer_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.maxDisplayedLines = 1;
         _loc1_.setStyle("paddingLeft",12);
         _loc1_.setStyle("paddingRight",12);
         _loc1_.setStyle("paddingTop",6);
         _loc1_.setStyle("paddingBottom",6);
         _loc1_.setStyle("textAlign","left");
         _loc1_.setStyle("color",16777215);
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",labelDisplay);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _SwapAssetDropDownListItemRenderer_SolidColor1() : SolidColor
      {
         return this._1207991805_SwapAssetDropDownListItemRenderer_SolidColor1;
      }
      
      public function set _SwapAssetDropDownListItemRenderer_SolidColor1(param1:SolidColor) : void
      {
         var _loc2_:Object = this._1207991805_SwapAssetDropDownListItemRenderer_SolidColor1;
         if(_loc2_ !== param1)
         {
            this._1207991805_SwapAssetDropDownListItemRenderer_SolidColor1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SwapAssetDropDownListItemRenderer_SolidColor1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get model() : MenuItemModel
      {
         return this._104069929model;
      }
      
      protected function set model(param1:MenuItemModel) : void
      {
         var _loc2_:Object = this._104069929model;
         if(_loc2_ !== param1)
         {
            this._104069929model = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"model",_loc2_,param1));
            }
         }
      }
   }
}
