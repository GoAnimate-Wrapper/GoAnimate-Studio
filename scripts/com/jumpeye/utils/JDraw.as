package com.jumpeye.utils
{
   import flash.display.Graphics;
   
   public class JDraw
   {
       
      
      public function JDraw()
      {
         super();
      }
      
      public static function pie(param1:Graphics, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number = 0) : void
      {
         var _loc8_:* = undefined;
         var _loc9_:* = undefined;
         var _loc10_:* = undefined;
         var _loc11_:* = undefined;
         var _loc12_:* = undefined;
         var _loc13_:* = undefined;
         var _loc14_:* = undefined;
         var _loc15_:* = undefined;
         var _loc16_:* = undefined;
         var _loc17_:* = undefined;
         var _loc18_:Number = NaN;
         var _loc19_:* = undefined;
         param1.moveTo(param2,param3);
         if(param7 == 0)
         {
            param7 = param6;
         }
         if(Math.abs(param5) > 360)
         {
            param5 = 360;
         }
         _loc12_ = Math.ceil(Math.abs(param5) / 45);
         _loc8_ = param5 / _loc12_;
         _loc9_ = -(_loc8_ / 180) * Math.PI;
         _loc10_ = -(param4 / 180) * Math.PI;
         if(_loc12_ > 0)
         {
            _loc13_ = param2 + Math.cos(param4 / 180 * Math.PI) * param6;
            _loc14_ = param3 + Math.sin(-param4 / 180 * Math.PI) * param7;
            param1.lineTo(_loc13_,_loc14_);
            _loc19_ = 0;
            while(_loc19_ < _loc12_)
            {
               _loc10_ = _loc10_ + _loc9_;
               _loc11_ = _loc10_ - _loc9_ / 2;
               _loc15_ = param2 + Math.cos(_loc10_) * param6;
               _loc16_ = param3 + Math.sin(_loc10_) * param7;
               _loc17_ = param2 + Math.cos(_loc11_) * (param6 / Math.cos(_loc9_ / 2));
               _loc18_ = param3 + Math.sin(_loc11_) * (param7 / Math.cos(_loc9_ / 2));
               param1.curveTo(_loc17_,_loc18_,_loc15_,_loc16_);
               _loc19_++;
            }
            param1.lineTo(param2,param3);
         }
      }
   }
}
