package com.jumpeye.utils
{
   public class JArray extends Array
   {
       
      
      public function JArray()
      {
         super();
      }
      
      public static function shift(param1:*, param2:*, param3:*) : Array
      {
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         var _loc8_:* = undefined;
         var _loc9_:* = undefined;
         var _loc10_:* = undefined;
         var _loc11_:* = undefined;
         var _loc4_:* = new Array();
         var _loc5_:* = param1.length;
         param3 = param3 || 1;
         if(param2 == "right")
         {
            _loc6_ = 1;
            while(_loc6_ <= param3)
            {
               _loc4_.push(param1[_loc5_ - _loc6_]);
               _loc6_++;
            }
            _loc7_ = _loc5_ - 1;
            while(_loc7_ >= 1)
            {
               param1[_loc7_] = param1[_loc7_ - param3];
               _loc7_--;
            }
            _loc8_ = 0;
            while(_loc8_ <= param3 - 1)
            {
               param1[_loc8_] = _loc4_[_loc4_.length - 1 - _loc8_];
               _loc8_++;
            }
         }
         if(param2 == "left")
         {
            _loc9_ = 0;
            while(_loc9_ <= param3 - 1)
            {
               _loc4_.push(param1[_loc9_]);
               _loc9_++;
            }
            _loc10_ = 0;
            while(_loc10_ <= _loc5_ - 1)
            {
               param1[_loc10_] = param1[_loc10_ + param3];
               _loc10_++;
            }
            _loc11_ = 0;
            while(_loc11_ <= param3 - 1)
            {
               param1[_loc5_ - _loc11_ - 1] = _loc4_[_loc4_.length - 1 - _loc11_];
               _loc11_++;
            }
         }
         return param1;
      }
   }
}
