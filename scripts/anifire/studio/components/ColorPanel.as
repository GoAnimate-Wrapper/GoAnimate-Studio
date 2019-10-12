package anifire.studio.components
{
   import mx.binding.BindingManager;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.VGroup;
   
   public class ColorPanel extends spark.components.NavigatorContent
   {
       
      
      private var _2120592602colorComponent:ColorComponent;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function ColorPanel()
      {
         super();
         mx_internal::_document = this;
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._ColorPanel_Array1_c);
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
      
      public function set target(param1:Object) : void
      {
         this.colorComponent.target = param1;
      }
      
      private function _ColorPanel_Array1_c() : Array
      {
         var _loc1_:Array = [this._ColorPanel_VGroup1_c()];
         return _loc1_;
      }
      
      private function _ColorPanel_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.paddingTop = 10;
         _loc1_.mxmlContent = [this._ColorPanel_ColorComponent1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ColorPanel_ColorComponent1_i() : ColorComponent
      {
         var _loc1_:ColorComponent = new ColorComponent();
         _loc1_.id = "colorComponent";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.colorComponent = _loc1_;
         BindingManager.executeBindings(this,"colorComponent",this.colorComponent);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get colorComponent() : ColorComponent
      {
         return this._2120592602colorComponent;
      }
      
      public function set colorComponent(param1:ColorComponent) : void
      {
         var _loc2_:Object = this._2120592602colorComponent;
         if(_loc2_ !== param1)
         {
            this._2120592602colorComponent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"colorComponent",_loc2_,param1));
            }
         }
      }
   }
}
