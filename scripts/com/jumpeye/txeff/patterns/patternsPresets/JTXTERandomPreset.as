package com.jumpeye.txeff.patterns.patternsPresets
{
   public dynamic class JTXTERandomPreset
   {
       
      
      public function JTXTERandomPreset()
      {
         super();
      }
      
      public static function getPresetsArray(param1:uint, param2:Array, param3:uint = 1) : Object
      {
         var _loc4_:* = undefined;
         var _loc5_:int = 0;
         var _loc8_:uint = 0;
         var _loc13_:Array = null;
         var _loc14_:Number = NaN;
         var _loc15_:uint = 0;
         var _loc16_:* = undefined;
         var _loc6_:Array = [];
         var _loc7_:uint = param2.length;
         var _loc9_:uint = 0;
         var _loc10_:Number = 1;
         var _loc11_:uint = param3;
         var _loc12_:* = [];
         _loc4_ = 0;
         while(_loc4_ < _loc7_)
         {
            _loc8_ = param2[_loc4_].length;
            _loc5_ = 0;
            while(_loc5_ < _loc8_)
            {
               _loc10_++;
               _loc5_++;
            }
            _loc4_++;
         }
         _loc9_ = _loc10_;
         _loc8_ = _loc9_ / _loc7_;
         switch(param1)
         {
            default:
               _loc15_ = 0;
               _loc10_ = 0;
               _loc5_ = 0;
               while(_loc5_ < _loc8_ * _loc7_)
               {
                  if(_loc15_ == 0)
                  {
                     _loc14_ = Math.floor(_loc5_ / _loc11_);
                  }
                  _loc12_[_loc5_] = _loc14_;
                  _loc15_ = _loc15_ >= _loc11_ - 1?uint(0):uint(_loc15_ = uint(_loc15_ + 1));
                  _loc5_++;
               }
               _loc12_ = JTXTERandomPreset.randomArray(_loc12_);
               _loc4_ = 0;
               while(_loc4_ < _loc7_)
               {
                  _loc8_ = param2[_loc4_].length;
                  _loc6_[_loc4_] = new Array();
                  _loc5_ = 0;
                  while(_loc5_ < _loc8_)
                  {
                     _loc6_[_loc4_][_loc5_] = _loc12_[_loc10_];
                     _loc10_++;
                     _loc5_++;
                  }
                  _loc4_++;
               }
               break;
            case 2:
               _loc15_ = 0;
               _loc10_ = 0;
               _loc4_ = 0;
               while(_loc4_ < _loc7_)
               {
                  _loc8_ = param2[_loc4_].length;
                  _loc6_[_loc4_] = new Array();
                  _loc13_ = [];
                  _loc16_ = 0;
                  while(_loc16_ < _loc8_)
                  {
                     _loc13_[_loc16_] = _loc16_;
                     _loc16_++;
                  }
                  _loc13_ = JTXTERandomPreset.randomArray(_loc13_);
                  _loc5_ = 0;
                  while(_loc5_ < _loc8_)
                  {
                     if(_loc15_ == 0)
                     {
                        _loc14_ = Math.floor(_loc10_ / _loc11_);
                     }
                     _loc6_[_loc4_][_loc13_[_loc5_]] = _loc14_;
                     _loc15_ = _loc15_ >= _loc11_ - 1?uint(0):uint(_loc15_ = uint(_loc15_ + 1));
                     _loc10_++;
                     _loc5_++;
                  }
                  _loc4_++;
               }
         }
         return {
            "maxItems":_loc9_,
            "timeMatrix":_loc6_
         };
      }
      
      public static function randomArray(param1:*) : Array
      {
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc2_:* = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_];
            _loc4_ = Math.floor(Math.random() * param1.length);
            param1[_loc2_] = param1[_loc4_];
            param1[_loc4_] = _loc3_;
            _loc2_++;
         }
         return param1;
      }
   }
}
