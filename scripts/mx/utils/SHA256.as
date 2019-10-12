package mx.utils
{
   import flash.utils.ByteArray;
   
   public class SHA256
   {
      
      public static const TYPE_ID:String = "SHA-256";
      
      private static var k:Array = [1116352408,1899447441,3049323471,3921009573,961987163,1508970993,2453635748,2870763221,3624381080,310598401,607225278,1426881987,1925078388,2162078206,2614888103,3248222580,3835390401,4022224774,264347078,604807628,770255983,1249150122,1555081692,1996064986,2554220882,2821834349,2952996808,3210313671,3336571891,3584528711,113926993,338241895,666307205,773529912,1294757372,1396182291,1695183700,1986661051,2177026350,2456956037,2730485921,2820302411,3259730800,3345764771,3516065817,3600352804,4094571909,275423344,430227734,506948616,659060556,883997877,958139571,1322822218,1537002063,1747873779,1955562222,2024104815,2227730452,2361852424,2428436474,2756734187,3204031479,3329325298];
       
      
      public function SHA256()
      {
         super();
      }
      
      public static function computeDigest(param1:ByteArray) : String
      {
         var _loc7_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc29_:uint = 0;
         var _loc30_:int = 0;
         var _loc31_:int = 0;
         var _loc32_:uint = 0;
         var _loc33_:uint = 0;
         var _loc34_:int = 0;
         var _loc35_:int = 0;
         var _loc36_:int = 0;
         var _loc2_:uint = param1.position;
         param1.position = 0;
         var _loc3_:int = param1.length % 64;
         _loc3_ = 64 - _loc3_;
         if(_loc3_ < 1 + 8)
         {
            _loc3_ = _loc3_ + 64;
         }
         var _loc4_:Array = new Array(_loc3_);
         var _loc5_:int = (param1.length + _loc3_) / 64;
         var _loc6_:uint = param1.length * 8;
         _loc4_[0] = 128;
         _loc7_ = 1;
         while(_loc7_ < _loc3_ - 8)
         {
            _loc4_[_loc7_] = 0;
            _loc7_++;
         }
         var _loc8_:int = _loc4_.length - 1;
         _loc7_ = 0;
         while(_loc7_ < 4)
         {
            _loc4_[_loc8_ - _loc7_] = _loc6_ >> (_loc7_ << 3) & 255;
            _loc7_++;
         }
         var _loc9_:int = 1779033703;
         var _loc10_:int = 3144134277;
         var _loc11_:int = 1013904242;
         var _loc12_:int = 2773480762;
         var _loc13_:int = 1359893119;
         var _loc14_:int = 2600822924;
         var _loc15_:int = 528734635;
         var _loc16_:int = 1541459225;
         var _loc25_:ByteArray = new ByteArray();
         var _loc26_:Array = new Array(64);
         var _loc27_:uint = 0;
         var _loc28_:uint = 0;
         _loc7_ = 0;
         while(_loc7_ < _loc5_)
         {
            getMessageBlock(param1,_loc25_);
            if(_loc7_ == _loc5_ - 2 && _loc4_.length > 64)
            {
               _loc27_ = 64 - _loc4_.length % 64;
               _loc28_ = 64 - _loc27_;
               _loc29_ = 0;
               while(_loc29_ < _loc28_)
               {
                  _loc25_[_loc29_ + _loc27_] = _loc4_[_loc29_];
                  _loc29_++;
               }
            }
            else if(_loc7_ == _loc5_ - 1)
            {
               _loc36_ = _loc28_;
               if(_loc4_.length > 64)
               {
                  _loc27_ = 0;
                  _loc28_ = 64;
               }
               else
               {
                  _loc27_ = 64 - _loc4_.length;
                  _loc28_ = _loc4_.length;
               }
               _loc29_ = 0;
               while(_loc29_ < _loc28_)
               {
                  _loc25_[_loc29_ + _loc27_] = _loc4_[_loc29_ + _loc36_];
                  _loc29_++;
               }
            }
            _loc32_ = 0;
            while(_loc32_ < 64)
            {
               if(_loc32_ < 16)
               {
                  _loc33_ = _loc32_ << 2;
                  _loc26_[_loc32_] = int(_loc25_[_loc33_] << 24 | _loc25_[_loc33_ + 1] << 16 | _loc25_[_loc33_ + 2] << 8 | _loc25_[_loc33_ + 3]);
               }
               else
               {
                  _loc34_ = _loc26_[_loc32_ - 2];
                  _loc35_ = _loc26_[_loc32_ - 15];
                  _loc26_[_loc32_] = int(int((_loc34_ >>> 17 | _loc34_ << 15) ^ (_loc34_ >>> 19 | _loc34_ << 13) ^ _loc34_ >>> 10) + int(_loc26_[_loc32_ - 7]) + int((_loc35_ >>> 7 | _loc35_ << 25) ^ (_loc35_ >>> 18 | _loc35_ << 14) ^ _loc35_ >>> 3) + int(_loc26_[_loc32_ - 16]));
               }
               _loc32_++;
            }
            _loc17_ = _loc9_;
            _loc18_ = _loc10_;
            _loc19_ = _loc11_;
            _loc20_ = _loc12_;
            _loc21_ = _loc13_;
            _loc22_ = _loc14_;
            _loc23_ = _loc15_;
            _loc24_ = _loc16_;
            _loc32_ = 0;
            while(_loc32_ < 64)
            {
               _loc30_ = _loc24_ + int((_loc21_ >>> 6 | _loc21_ << 26) ^ (_loc21_ >>> 11 | _loc21_ << 21) ^ (_loc21_ >>> 25 | _loc21_ << 7)) + int(_loc21_ & _loc22_ ^ ~_loc21_ & _loc23_) + int(k[_loc32_]) + int(_loc26_[_loc32_]);
               _loc31_ = int((_loc17_ >>> 2 | _loc17_ << 30) ^ (_loc17_ >>> 13 | _loc17_ << 19) ^ (_loc17_ >>> 22 | _loc17_ << 10)) + int(_loc17_ & _loc18_ ^ _loc17_ & _loc19_ ^ _loc18_ & _loc19_);
               _loc24_ = _loc23_;
               _loc23_ = _loc22_;
               _loc22_ = _loc21_;
               _loc21_ = _loc20_ + _loc30_;
               _loc20_ = _loc19_;
               _loc19_ = _loc18_;
               _loc18_ = _loc17_;
               _loc17_ = _loc30_ + _loc31_;
               _loc32_++;
            }
            _loc9_ = _loc9_ + _loc17_;
            _loc10_ = _loc10_ + _loc18_;
            _loc11_ = _loc11_ + _loc19_;
            _loc12_ = _loc12_ + _loc20_;
            _loc13_ = _loc13_ + _loc21_;
            _loc14_ = _loc14_ + _loc22_;
            _loc15_ = _loc15_ + _loc23_;
            _loc16_ = _loc16_ + _loc24_;
            _loc7_++;
         }
         param1.position = _loc2_;
         return toHex(_loc9_) + toHex(_loc10_) + toHex(_loc11_) + toHex(_loc12_) + toHex(_loc13_) + toHex(_loc14_) + toHex(_loc15_) + toHex(_loc16_);
      }
      
      private static function getMessageBlock(param1:ByteArray, param2:ByteArray) : void
      {
         param1.readBytes(param2,0,Math.min(param1.bytesAvailable,64));
      }
      
      private static function toHex(param1:uint) : String
      {
         var _loc3_:String = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:String = param1.toString(16);
         if(_loc2_.length < 8)
         {
            _loc3_ = "0";
            _loc4_ = 8 - _loc2_.length;
            _loc5_ = 1;
            while(_loc5_ < _loc4_)
            {
               _loc3_ = _loc3_.concat("0");
               _loc5_++;
            }
            return _loc3_ + _loc2_;
         }
         return _loc2_;
      }
   }
}
