package com.jumpeye.flashEff2.core.interfaces
{
   import flash.display.DisplayObject;
   
   public class IFlashEffSymbol extends IFlashEffSymbolText
   {
       
      
      protected var _target:DisplayObject;
      
      public function IFlashEffSymbol()
      {
         super();
      }
      
      public function get target() : DisplayObject
      {
         return _target;
      }
      
      public function set target(param1:DisplayObject) : void
      {
         _target = param1;
      }
   }
}
