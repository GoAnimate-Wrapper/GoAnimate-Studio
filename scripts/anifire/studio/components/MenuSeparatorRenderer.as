package anifire.studio.components
{
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.graphics.SolidColorStroke;
   import mx.states.State;
   import spark.components.supportClasses.ItemRenderer;
   import spark.primitives.Line;
   
   public class MenuSeparatorRenderer extends ItemRenderer implements IStateClient2
   {
       
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function MenuSeparatorRenderer()
      {
         super();
         mx_internal::_document = this;
         this.autoDrawBackground = false;
         this.enabled = false;
         this.mxmlContent = [this._MenuSeparatorRenderer_Line1_c()];
         this.currentState = "normal";
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"hovered",
            "overrides":[]
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
      
      private function _MenuSeparatorRenderer_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.top = 5;
         _loc1_.bottom = 5;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.stroke = this._MenuSeparatorRenderer_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _MenuSeparatorRenderer_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 10526623;
         return _loc1_;
      }
   }
}
