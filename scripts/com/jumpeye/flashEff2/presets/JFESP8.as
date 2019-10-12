package com.jumpeye.flashEff2.presets
{
   import flash.display.Sprite;
   
   public class JFESP8 extends Sprite
   {
       
      
      public function JFESP8()
      {
         super();
      }
      
      public static function fep(param1:uint, param2:uint, param3:uint, param4:Array, param5:Object = null) : Array
      {
         var _loc6_:* = undefined;
         var _loc7_:uint = 0;
         var _loc8_:Number = 0;
         var _loc9_:Number = Math.ceil(param2 / 2) - 1;
         _loc6_ = 0;
         while(_loc6_ <= _loc9_)
         {
            _loc7_ = 0;
            while(_loc7_ < param3)
            {
               param4[_loc6_][_loc7_] = _loc9_ - _loc6_;
               param4[param2 - _loc6_ - 1][_loc7_] = _loc9_ - _loc6_;
               _loc7_++;
            }
            _loc6_++;
         }
         _loc8_ = _loc9_ + 1;
         if(param5 != null)
         {
            param5.MAX = _loc8_;
         }
         return param4;
      }
   }
}
