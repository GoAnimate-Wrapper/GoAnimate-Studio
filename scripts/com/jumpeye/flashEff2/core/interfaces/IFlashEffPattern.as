package com.jumpeye.flashEff2.core.interfaces
{
   import com.jumpeye.core.JUIComponent;
   import flash.display.Sprite;
   
   public class IFlashEffPattern extends Sprite
   {
       
      
      protected var _component:JUIComponent;
      
      public function IFlashEffPattern()
      {
         super();
         if(this.numChildren > 0)
         {
            this.removeChildAt(0);
         }
         scaleX = scaleY = 0;
         visible = false;
      }
      
      public function set component(param1:JUIComponent) : void
      {
         this._component = param1;
      }
      
      public function get component() : JUIComponent
      {
         return this._component;
      }
   }
}
