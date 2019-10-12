package com.jumpeye.flashEff2.presets
{
   import flash.display.Sprite;
   
   public class JFETP25 extends Sprite
   {
       
      
      public function JFETP25()
      {
         super();
      }
      
      public static function fep(param1:Array) : Object
      {
         var _loc2_:* = undefined;
         var _loc3_:int = 0;
         var _loc6_:uint = 0;
         var _loc13_:uint = 0;
         var _loc4_:Array = [];
         var _loc5_:uint = param1.length;
         var _loc7_:Number = Math.ceil(_loc5_ / 2);
         var _loc8_:Array = [];
         var _loc9_:Number = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < _loc5_)
         {
            _loc4_[_loc2_] = [];
            _loc8_[_loc2_] = [];
            _loc13_ = param1[_loc2_].length;
            _loc10_ = _loc10_ + _loc13_;
            _loc9_ = Math.max(_loc9_,_loc13_);
            _loc2_++;
         }
         _loc8_[_loc5_] = [];
         _loc8_[_loc5_ + 1] = [];
         var _loc12_:uint = Math.ceil(_loc9_ / 2);
         _loc2_ = 0;
         while(_loc2_ <= _loc5_ + 1)
         {
            _loc8_[_loc2_][0] = -1;
            _loc8_[_loc2_][_loc9_ + 1] = -1;
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ <= _loc9_ + 1)
         {
            _loc8_[0][_loc2_] = -1;
            _loc8_[_loc5_ + 1][_loc2_] = -1;
            _loc2_++;
         }
         _loc8_[_loc7_][_loc12_] = 0;
         jtpFill(_loc7_,_loc12_,_loc8_);
         _loc2_ = 0;
         while(_loc2_ < _loc5_)
         {
            _loc6_ = param1[_loc2_].length;
            _loc3_ = 0;
            while(_loc3_ < _loc6_)
            {
               _loc4_[_loc2_][_loc3_] = _loc8_[_loc2_ + 1][_loc3_ + 1];
               _loc11_ = Math.max(_loc11_,_loc4_[_loc2_][_loc3_]);
               _loc3_++;
            }
            _loc2_++;
         }
         return {
            "maxItems":_loc11_,
            "timeMatrix":_loc4_
         };
      }
      
      public static function jtpFill(param1:*, param2:*, param3:Array) : Array
      {
         var _loc4_:Number = param3[param1][param2];
         if(isNaN(param3[param1 - 1][param2]) || param3[param1 - 1][param2] > _loc4_ + 1)
         {
            param3[param1 - 1][param2] = _loc4_ + 1;
            jtpFill(param1 - 1,param2,param3);
         }
         if(isNaN(param3[param1 + 1][param2]) || param3[param1 + 1][param2] > _loc4_ + 1)
         {
            param3[param1 + 1][param2] = _loc4_ + 1;
            jtpFill(param1 + 1,param2,param3);
         }
         if(isNaN(param3[param1][param2 - 1]) || param3[param1][param2 - 1] > _loc4_ + 1)
         {
            param3[param1][param2 - 1] = _loc4_ + 1;
            jtpFill(param1,param2 - 1,param3);
         }
         if(isNaN(param3[param1][param2 + 1]) || param3[param1][param2 + 1] > _loc4_ + 1)
         {
            param3[param1][param2 + 1] = _loc4_ + 1;
            jtpFill(param1,param2 + 1,param3);
         }
         return param3;
      }
   }
}
