package com.jumpeye.flashEff2.presets
{
   import flash.display.Sprite;
   
   public class JFETP27 extends Sprite
   {
       
      
      public function JFETP27()
      {
         super();
      }
      
      public static function fep(param1:Array) : Object
      {
         var _loc2_:* = undefined;
         var _loc3_:int = 0;
         var _loc6_:uint = 0;
         var _loc4_:Array = [];
         var _loc5_:uint = param1.length;
         var _loc7_:uint = 0;
         _loc2_ = 0;
         while(_loc2_ < _loc5_)
         {
            _loc6_ = param1[_loc2_].length;
            _loc4_[_loc2_] = [];
            _loc3_ = 0;
            while(_loc3_ < _loc6_)
            {
               _loc4_[_loc2_][_loc3_] = _loc5_ - _loc2_ - 1;
               _loc3_++;
            }
            _loc7_ = _loc7_ + _loc6_;
            _loc2_++;
         }
         return {
            "maxItems":_loc7_,
            "timeMatrix":_loc4_
         };
      }
   }
}
