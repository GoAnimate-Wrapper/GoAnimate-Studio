package com.jumpeye.flashEff2.presets
{
   import flash.display.Sprite;
   
   public class JFETP15 extends Sprite
   {
       
      
      public function JFETP15()
      {
         super();
      }
      
      public static function fep(param1:Array) : Object
      {
         var _loc2_:* = undefined;
         var _loc3_:int = 0;
         var _loc6_:uint = 0;
         var _loc8_:uint = 0;
         var _loc4_:Array = [];
         var _loc5_:uint = param1.length;
         var _loc7_:uint = 0;
         _loc2_ = _loc5_ - 1;
         while(_loc2_ >= 0)
         {
            _loc6_ = param1[_loc2_].length;
            _loc4_[_loc2_] = [];
            _loc8_ = Math.ceil(_loc6_ / 2);
            _loc3_ = _loc8_ - 1;
            while(_loc3_ >= 0)
            {
               _loc4_[_loc2_][_loc3_] = _loc7_;
               _loc4_[_loc2_][_loc6_ - _loc3_ - 1] = _loc7_++;
               _loc3_--;
            }
            _loc2_--;
         }
         return {
            "maxItems":_loc7_,
            "timeMatrix":_loc4_
         };
      }
   }
}
