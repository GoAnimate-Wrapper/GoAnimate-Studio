package com.jumpeye.flashEff2.text.patternsPresets
{
   public dynamic class JFERandomPreset
   {
       
      
      public function JFERandomPreset()
      {
         super();
      }
      
      public static function getPresetsArray(param1:uint, param2:Array, param3:uint = 1, param4:Number = 1) : Object
      {
         var _loc5_:* = undefined;
         var _loc6_:int = 0;
         var _loc9_:uint = 0;
         var _loc14_:Array = null;
         var _loc15_:Number = NaN;
         var _loc16_:uint = 0;
         var _loc17_:* = undefined;
         var _loc7_:Array = [];
         var _loc8_:uint = param2.length;
         var _loc10_:uint = 0;
         var _loc11_:Number = 0;
         var _loc12_:uint = param3;
         var _loc13_:* = [];
         _loc5_ = 0;
         while(_loc5_ < _loc8_)
         {
            _loc9_ = param2[_loc5_].length;
            _loc6_ = 0;
            while(_loc6_ < _loc9_)
            {
               _loc11_++;
               _loc6_++;
            }
            _loc5_++;
         }
         _loc10_ = _loc11_;
         _loc9_ = _loc10_ / _loc8_;
         switch(param1)
         {
            default:
               _loc16_ = 0;
               _loc11_ = 0;
               _loc6_ = 0;
               while(_loc6_ < _loc10_)
               {
                  if(_loc16_ == 0)
                  {
                     _loc15_ = Math.floor(_loc6_ / _loc12_);
                  }
                  _loc13_[_loc6_] = _loc15_;
                  _loc16_ = _loc16_ >= _loc12_ - 1?uint(0):uint(_loc16_ = uint(_loc16_ + 1));
                  _loc6_++;
               }
               _loc13_ = JFERandomPreset.randomArray(_loc13_);
               _loc5_ = 0;
               while(_loc5_ < _loc8_)
               {
                  _loc9_ = param2[_loc5_].length;
                  _loc7_[_loc5_] = new Array();
                  _loc6_ = 0;
                  while(_loc6_ < _loc9_)
                  {
                     _loc7_[_loc5_][_loc6_] = _loc13_[_loc11_];
                     _loc11_++;
                     _loc6_++;
                  }
                  _loc5_++;
               }
               break;
            case 2:
               _loc16_ = 0;
               _loc11_ = 0;
               _loc5_ = 0;
               while(_loc5_ < _loc8_)
               {
                  _loc9_ = param2[_loc5_].length;
                  _loc7_[_loc5_] = new Array();
                  _loc14_ = [];
                  _loc17_ = 0;
                  while(_loc17_ < _loc9_)
                  {
                     _loc14_[_loc17_] = _loc17_;
                     _loc17_++;
                  }
                  _loc14_ = JFERandomPreset.randomArray(_loc14_);
                  _loc6_ = 0;
                  while(_loc6_ < _loc9_)
                  {
                     if(_loc16_ == 0)
                     {
                        _loc15_ = Math.floor(_loc11_ / _loc12_);
                     }
                     _loc7_[_loc5_][_loc14_[_loc6_]] = _loc15_;
                     _loc16_ = _loc16_ >= _loc12_ - 1?uint(0):uint(_loc16_ = uint(_loc16_ + 1));
                     _loc11_++;
                     _loc6_++;
                  }
                  _loc5_++;
               }
         }
         return {
            "maxItems":_loc10_,
            "timeMatrix":_loc7_
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
