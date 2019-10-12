package anifire.util.Crypto
{
   public class TEA
   {
       
      
      public function TEA()
      {
         super();
      }
      
      public static function encrypt(param1:String, param2:String) : String
      {
         var _loc6_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc3_:Array = charsToLongs(strToChars(param1));
         var _loc4_:Array = charsToLongs(strToChars(param2));
         var _loc5_:Number = _loc3_.length;
         if(_loc5_ == 0)
         {
            return "";
         }
         if(_loc5_ == 1)
         {
            _loc3_[_loc5_++] = 0;
         }
         var _loc7_:Number = _loc3_[_loc5_ - 1];
         var _loc8_:Number = _loc3_[0];
         var _loc9_:Number = 2654435769;
         var _loc12_:Number = Math.floor(6 + 52 / _loc5_);
         var _loc13_:Number = 0;
         while(_loc12_-- > 0)
         {
            _loc13_ = _loc13_ + _loc9_;
            _loc11_ = _loc13_ >>> 2 & 3;
            _loc6_ = 0;
            while(_loc6_ < _loc5_ - 1)
            {
               _loc8_ = _loc3_[_loc6_ + 1];
               _loc10_ = (_loc7_ >>> 5 ^ _loc8_ << 2) + (_loc8_ >>> 3 ^ _loc7_ << 4) ^ (_loc13_ ^ _loc8_) + (_loc4_[_loc6_ & 3 ^ _loc11_] ^ _loc7_);
               _loc7_ = _loc3_[_loc6_] = _loc3_[_loc6_] + _loc10_;
               _loc6_++;
            }
            _loc8_ = _loc3_[0];
            _loc10_ = (_loc7_ >>> 5 ^ _loc8_ << 2) + (_loc8_ >>> 3 ^ _loc7_ << 4) ^ (_loc13_ ^ _loc8_) + (_loc4_[_loc6_ & 3 ^ _loc11_] ^ _loc7_);
            _loc7_ = _loc3_[_loc5_ - 1] = _loc3_[_loc5_ - 1] + _loc10_;
         }
         return charsToHex(longsToChars(_loc3_));
      }
      
      public static function decrypt(param1:String, param2:String) : String
      {
         var _loc6_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc3_:Array = charsToLongs(hexToChars(param1));
         var _loc4_:Array = charsToLongs(strToChars(param2));
         var _loc5_:Number = _loc3_.length;
         if(_loc5_ == 0)
         {
            return "";
         }
         var _loc7_:Number = _loc3_[_loc5_ - 1];
         var _loc8_:Number = _loc3_[0];
         var _loc9_:Number = 2654435769;
         var _loc12_:Number = Math.floor(6 + 52 / _loc5_);
         var _loc13_:Number = _loc12_ * _loc9_;
         while(_loc13_ != 0)
         {
            _loc11_ = _loc13_ >>> 2 & 3;
            _loc6_ = _loc5_ - 1;
            while(_loc6_ > 0)
            {
               _loc7_ = _loc3_[_loc6_ - 1];
               _loc10_ = (_loc7_ >>> 5 ^ _loc8_ << 2) + (_loc8_ >>> 3 ^ _loc7_ << 4) ^ (_loc13_ ^ _loc8_) + (_loc4_[_loc6_ & 3 ^ _loc11_] ^ _loc7_);
               _loc8_ = _loc3_[_loc6_] = _loc3_[_loc6_] - _loc10_;
               _loc6_--;
            }
            _loc7_ = _loc3_[_loc5_ - 1];
            _loc10_ = (_loc7_ >>> 5 ^ _loc8_ << 2) + (_loc8_ >>> 3 ^ _loc7_ << 4) ^ (_loc13_ ^ _loc8_) + (_loc4_[_loc6_ & 3 ^ _loc11_] ^ _loc7_);
            _loc8_ = _loc3_[0] = _loc3_[0] - _loc10_;
            _loc13_ = _loc13_ - _loc9_;
         }
         return charsToStr(longsToChars(_loc3_));
      }
      
      private static function charsToLongs(param1:Array) : Array
      {
         var _loc2_:Array = new Array(Math.ceil(param1.length / 4));
         var _loc3_:Number = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc2_[_loc3_] = param1[_loc3_ * 4] + (param1[_loc3_ * 4 + 1] << 8) + (param1[_loc3_ * 4 + 2] << 16) + (param1[_loc3_ * 4 + 3] << 24);
            _loc3_++;
         }
         return _loc2_;
      }
      
      private static function longsToChars(param1:Array) : Array
      {
         var _loc2_:Array = new Array();
         var _loc3_:Number = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_.push(param1[_loc3_] & 255,param1[_loc3_] >>> 8 & 255,param1[_loc3_] >>> 16 & 255,param1[_loc3_] >>> 24 & 255);
            _loc3_++;
         }
         return _loc2_;
      }
      
      private static function longToChars(param1:Number) : Array
      {
         var _loc2_:Array = new Array();
         _loc2_.push(param1 & 255,param1 >>> 8 & 255,param1 >>> 16 & 255,param1 >>> 24 & 255);
         return _loc2_;
      }
      
      private static function charsToHex(param1:Array) : String
      {
         var _loc2_:String = new String("");
         var _loc3_:Array = new Array("0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f");
         var _loc4_:Number = 0;
         while(_loc4_ < param1.length)
         {
            _loc2_ = _loc2_ + (_loc3_[param1[_loc4_] >> 4] + _loc3_[param1[_loc4_] & 15]);
            _loc4_++;
         }
         return _loc2_;
      }
      
      private static function hexToChars(param1:String) : Array
      {
         var _loc2_:Array = new Array();
         var _loc3_:Number = param1.substr(0,2) == "0x"?Number(2):Number(0);
         while(_loc3_ < param1.length)
         {
            _loc2_.push(parseInt(param1.substr(_loc3_,2),16));
            _loc3_ = _loc3_ + 2;
         }
         return _loc2_;
      }
      
      private static function charsToStr(param1:Array) : String
      {
         var _loc2_:String = new String("");
         var _loc3_:Number = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_ = _loc2_ + String.fromCharCode(param1[_loc3_]);
            _loc3_++;
         }
         return _loc2_;
      }
      
      private static function strToChars(param1:String) : Array
      {
         var _loc2_:Array = new Array();
         var _loc3_:Number = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_.push(param1.charCodeAt(_loc3_));
            _loc3_++;
         }
         return _loc2_;
      }
   }
}
