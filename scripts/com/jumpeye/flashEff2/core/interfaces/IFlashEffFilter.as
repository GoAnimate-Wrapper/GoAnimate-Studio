package com.jumpeye.flashEff2.core.interfaces
{
   import flash.display.Sprite;
   
   public class IFlashEffFilter extends IFlashEffPattern
   {
       
      
      protected var _target:Sprite;
      
      public function IFlashEffFilter()
      {
         super();
      }
      
      public function apply() : void
      {
      }
      
      public function remove() : void
      {
      }
      
      public function set target(param1:Sprite) : void
      {
         this._target = param1;
      }
      
      public function get target() : Sprite
      {
         return this._target;
      }
   }
}
