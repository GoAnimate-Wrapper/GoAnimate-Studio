package com.jumpeye.flashEff2.presets
{
   import flash.display.Sprite;
   
   public class JFESP14 extends Sprite
   {
       
      
      public function JFESP14()
      {
         super();
      }
      
      public static function fep(param1:uint, param2:uint, param3:uint, param4:Array, param5:Object = null) : Array
      {
         var _loc6_:* = undefined;
         var _loc7_:uint = 0;
         var _loc8_:Number = 0;
         var _loc9_:Number = Math.ceil(param2 / 2);
         var _loc10_:uint = Math.min(_loc9_,param3 / 2);
         _loc6_ = 0;
         while(_loc6_ < _loc9_)
         {
            _loc7_ = _loc6_;
            while(_loc7_ < param3 - _loc6_)
            {
               param4[_loc6_][_loc7_] = _loc10_ - _loc6_;
               param4[param2 - _loc6_ - 1][_loc7_] = _loc10_ - _loc6_;
               _loc7_++;
            }
            if(_loc6_ <= uint(param3 / 2))
            {
               _loc7_ = _loc6_ + 1;
               while(_loc7_ < param2 - _loc6_ - 1)
               {
                  param4[_loc7_][_loc6_] = _loc10_ - _loc6_;
                  param4[_loc7_][param3 - _loc6_ - 1] = _loc10_ - _loc6_;
                  _loc7_++;
               }
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
