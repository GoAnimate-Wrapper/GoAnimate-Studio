package anifire.studio.components
{
   import mx.core.IFlexModuleFactory;
   import mx.graphics.GradientEntry;
   import mx.graphics.LinearGradient;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import spark.components.Group;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   public class PopUpContentBackground extends Group
   {
       
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function PopUpContentBackground()
      {
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._PopUpContentBackground_Rect1_c(),this._PopUpContentBackground_Line1_c(),this._PopUpContentBackground_Rect2_c(),this._PopUpContentBackground_Rect3_c()];
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
      
      private function _PopUpContentBackground_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.fill = this._PopUpContentBackground_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _PopUpContentBackground_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 15923196;
         return _loc1_;
      }
      
      private function _PopUpContentBackground_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.top = 0;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.stroke = this._PopUpContentBackground_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _PopUpContentBackground_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 14738923;
         return _loc1_;
      }
      
      private function _PopUpContentBackground_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 1;
         _loc1_.height = 4;
         _loc1_.fill = this._PopUpContentBackground_LinearGradient1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _PopUpContentBackground_LinearGradient1_c() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.rotation = 90;
         _loc1_.entries = [this._PopUpContentBackground_GradientEntry1_c(),this._PopUpContentBackground_GradientEntry2_c()];
         return _loc1_;
      }
      
      private function _PopUpContentBackground_GradientEntry1_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 0;
         _loc1_.alpha = 0.05;
         return _loc1_;
      }
      
      private function _PopUpContentBackground_GradientEntry2_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 0;
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      private function _PopUpContentBackground_Rect3_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.height = 4;
         _loc1_.fill = this._PopUpContentBackground_LinearGradient2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _PopUpContentBackground_LinearGradient2_c() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.rotation = 270;
         _loc1_.entries = [this._PopUpContentBackground_GradientEntry3_c(),this._PopUpContentBackground_GradientEntry4_c()];
         return _loc1_;
      }
      
      private function _PopUpContentBackground_GradientEntry3_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 0;
         _loc1_.alpha = 0.05;
         return _loc1_;
      }
      
      private function _PopUpContentBackground_GradientEntry4_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 0;
         _loc1_.alpha = 0;
         return _loc1_;
      }
   }
}
