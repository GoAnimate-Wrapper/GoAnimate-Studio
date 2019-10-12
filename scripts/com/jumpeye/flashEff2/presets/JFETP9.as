package com.jumpeye.flashEff2.presets
{
   import flash.display.Sprite;
   
   public class JFETP9 extends Sprite
   {
       
      
      public function JFETP9()
      {
         super();
      }
      
      public static function fep(param1:Array) : Object
      {
         var _loc2_:* = undefined;
         var _loc3_:int = 0;
         var _loc6_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:Number = NaN;
         var _loc10_:* = undefined;
         var _loc4_:Array = [];
         var _loc5_:uint = param1.length;
         var _loc7_:Array = [];
         _loc2_ = 0;
         while(_loc2_ < _loc5_)
         {
            _loc6_ = param1[_loc2_].length;
            _loc4_[_loc2_] = [];
            _loc3_ = 0;
            while(_loc3_ < _loc6_)
            {
               _loc7_.push({
                  "i":_loc2_,
                  "j":_loc3_,
                  "id":_loc7_.length
               });
               _loc3_++;
            }
            _loc2_++;
         }
         _loc8_ = _loc7_.length;
         while(_loc7_.length != 0)
         {
            _loc9_ = _loc7_.length;
            _loc10_ = Math.floor(Math.random() * _loc9_);
            _loc4_[_loc7_[_loc10_].i][_loc7_[_loc10_].j] = _loc9_ - 1;
            _loc7_.splice(_loc10_,1);
         }
         return {
            "maxItems":_loc8_,
            "timeMatrix":_loc4_
         };
      }
   }
}
