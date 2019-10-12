package com.jumpeye.flashEff2.presets
{
   import flash.display.Sprite;
   
   public class JFESPM8 extends Sprite
   {
       
      
      public function JFESPM8()
      {
         super();
      }
      
      public static function fep(param1:uint, param2:uint, param3:uint, param4:Array, param5:Object = null) : Array
      {
         var _loc6_:* = undefined;
         var _loc7_:uint = 0;
         var _loc10_:Number = NaN;
         var _loc8_:Number = 0;
         var _loc9_:Number = Math.ceil(param2 / 2);
         _loc6_ = 0;
         while(_loc6_ < _loc9_)
         {
            _loc7_ = 0;
            while(_loc7_ < param3)
            {
               _loc10_ = Math.ceil(_loc7_ * _loc9_) + (_loc9_ - _loc6_) - 1;
               param4[_loc6_][_loc7_] = _loc10_;
               param4[param2 - _loc6_ - 1][_loc7_] = _loc10_;
               _loc8_ = Math.max(_loc10_,_loc8_);
               _loc7_++;
            }
            _loc6_++;
         }
         if(param5 != null)
         {
            param5.MAX = _loc8_;
         }
         return param4;
      }
   }
}
