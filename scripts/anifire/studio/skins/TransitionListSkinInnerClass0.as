package anifire.studio.skins
{
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import spark.components.Group;
   import spark.primitives.Rect;
   
   public class TransitionListSkinInnerClass0 extends Group
   {
       
      
      private var _88844982outerDocument:TransitionListSkin;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function TransitionListSkinInnerClass0()
      {
         super();
         mx_internal::_document = this;
         this.minWidth = 2;
         this.minHeight = 2;
         this.maxWidth = 2;
         this.maxHeight = 2;
         this.mxmlContent = [this._TransitionListSkinInnerClass0_Rect1_c()];
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
      
      private function _TransitionListSkinInnerClass0_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._TransitionListSkinInnerClass0_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TransitionListSkinInnerClass0_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 0;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get outerDocument() : TransitionListSkin
      {
         return this._88844982outerDocument;
      }
      
      public function set outerDocument(param1:TransitionListSkin) : void
      {
         var _loc2_:Object = this._88844982outerDocument;
         if(_loc2_ !== param1)
         {
            this._88844982outerDocument = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"outerDocument",_loc2_,param1));
            }
         }
      }
   }
}
