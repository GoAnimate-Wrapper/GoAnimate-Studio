package com.adobe.images
{
   import flash.display.BitmapData;
   import flash.utils.ByteArray;
   
   public class JPGEncoder
   {
       
      
      private var fdtbl_UV:Array;
      
      private var std_ac_chrominance_values:Array;
      
      private var std_dc_chrominance_nrcodes:Array;
      
      private var std_dc_chrominance_values:Array;
      
      private var ZigZag:Array;
      
      private var YDC_HT:Array;
      
      private var bytenew:int = 0;
      
      private var fdtbl_Y:Array;
      
      private var YAC_HT:Array;
      
      private var std_ac_chrominance_nrcodes:Array;
      
      private var DU:Array;
      
      private var std_ac_luminance_values:Array;
      
      private var UVTable:Array;
      
      private var UDU:Array;
      
      private var YDU:Array;
      
      private var byteout:ByteArray;
      
      private var UVAC_HT:Array;
      
      private var UVDC_HT:Array;
      
      private var bytepos:int = 7;
      
      private var VDU:Array;
      
      private var std_ac_luminance_nrcodes:Array;
      
      private var std_dc_luminance_values:Array;
      
      private var YTable:Array;
      
      private var std_dc_luminance_nrcodes:Array;
      
      private var bitcode:Array;
      
      private var category:Array;
      
      public function JPGEncoder(param1:Number = 50)
      {
         var _loc2_:int = 0;
         ZigZag = [0,1,5,6,14,15,27,28,2,4,7,13,16,26,29,42,3,8,12,17,25,30,41,43,9,11,18,24,31,40,44,53,10,19,23,32,39,45,52,54,20,22,33,38,46,51,55,60,21,34,37,47,50,56,59,61,35,36,48,49,57,58,62,63];
         YTable = new Array(64);
         UVTable = new Array(64);
         fdtbl_Y = new Array(64);
         fdtbl_UV = new Array(64);
         std_dc_luminance_nrcodes = [0,0,1,5,1,1,1,1,1,1,0,0,0,0,0,0,0];
         std_dc_luminance_values = [0,1,2,3,4,5,6,7,8,9,10,11];
         std_ac_luminance_nrcodes = [0,0,2,1,3,3,2,4,3,5,5,4,4,0,0,1,125];
         std_ac_luminance_values = [1,2,3,0,4,17,5,18,33,49,65,6,19,81,97,7,34,113,20,50,129,145,161,8,35,66,177,193,21,82,209,240,36,51,98,114,130,9,10,22,23,24,25,26,37,38,39,40,41,42,52,53,54,55,56,57,58,67,68,69,70,71,72,73,74,83,84,85,86,87,88,89,90,99,100,101,102,103,104,105,106,115,116,117,118,119,120,121,122,131,132,133,134,135,136,137,138,146,147,148,149,150,151,152,153,154,162,163,164,165,166,167,168,169,170,178,179,180,181,182,183,184,185,186,194,195,196,197,198,199,200,201,202,210,211,212,213,214,215,216,217,218,225,226,227,228,229,230,231,232,233,234,241,242,243,244,245,246,247,248,249,250];
         std_dc_chrominance_nrcodes = [0,0,3,1,1,1,1,1,1,1,1,1,0,0,0,0,0];
         std_dc_chrominance_values = [0,1,2,3,4,5,6,7,8,9,10,11];
         std_ac_chrominance_nrcodes = [0,0,2,1,2,4,4,3,4,7,5,4,4,0,1,2,119];
         std_ac_chrominance_values = [0,1,2,3,17,4,5,33,49,6,18,65,81,7,97,113,19,34,50,129,8,20,66,145,161,177,193,9,35,51,82,240,21,98,114,209,10,22,36,52,225,37,241,23,24,25,26,38,39,40,41,42,53,54,55,56,57,58,67,68,69,70,71,72,73,74,83,84,85,86,87,88,89,90,99,100,101,102,103,104,105,106,115,116,117,118,119,120,121,122,130,131,132,133,134,135,136,137,138,146,147,148,149,150,151,152,153,154,162,163,164,165,166,167,168,169,170,178,179,180,181,182,183,184,185,186,194,195,196,197,198,199,200,201,202,210,211,212,213,214,215,216,217,218,226,227,228,229,230,231,232,233,234,242,243,244,245,246,247,248,249,250];
         bitcode = new Array(65535);
         category = new Array(65535);
         bytenew = 0;
         bytepos = 7;
         DU = new Array(64);
         YDU = new Array(64);
         UDU = new Array(64);
         VDU = new Array(64);
         super();
         if(param1 <= 0)
         {
            param1 = 1;
         }
         if(param1 > 100)
         {
            param1 = 100;
         }
         _loc2_ = 0;
         if(param1 < 50)
         {
            _loc2_ = int(5000 / param1);
         }
         else
         {
            _loc2_ = int(200 - param1 * 2);
         }
         initHuffmanTbl();
         initCategoryNumber();
         initQuantTables(_loc2_);
      }
      
      private function RGB2YUV(param1:BitmapData, param2:int, param3:int) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:uint = 0;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         _loc4_ = 0;
         _loc5_ = 0;
         while(_loc5_ < 8)
         {
            _loc6_ = 0;
            while(_loc6_ < 8)
            {
               _loc7_ = param1.getPixel32(param2 + _loc6_,param3 + _loc5_);
               _loc8_ = Number(_loc7_ >> 16 & 255);
               _loc9_ = Number(_loc7_ >> 8 & 255);
               _loc10_ = Number(_loc7_ & 255);
               YDU[_loc4_] = 0.299 * _loc8_ + 0.587 * _loc9_ + 0.114 * _loc10_ - 128;
               UDU[_loc4_] = -0.16874 * _loc8_ + -0.33126 * _loc9_ + 0.5 * _loc10_;
               VDU[_loc4_] = 0.5 * _loc8_ + -0.41869 * _loc9_ + -0.08131 * _loc10_;
               _loc4_++;
               _loc6_++;
            }
            _loc5_++;
         }
      }
      
      private function writeWord(param1:int) : void
      {
         writeByte(param1 >> 8 & 255);
         writeByte(param1 & 255);
      }
      
      private function writeByte(param1:int) : void
      {
         byteout.writeByte(param1);
      }
      
      private function writeDHT() : void
      {
         var _loc1_:int = 0;
         writeWord(65476);
         writeWord(418);
         writeByte(0);
         _loc1_ = 0;
         while(_loc1_ < 16)
         {
            writeByte(std_dc_luminance_nrcodes[_loc1_ + 1]);
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ <= 11)
         {
            writeByte(std_dc_luminance_values[_loc1_]);
            _loc1_++;
         }
         writeByte(16);
         _loc1_ = 0;
         while(_loc1_ < 16)
         {
            writeByte(std_ac_luminance_nrcodes[_loc1_ + 1]);
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ <= 161)
         {
            writeByte(std_ac_luminance_values[_loc1_]);
            _loc1_++;
         }
         writeByte(1);
         _loc1_ = 0;
         while(_loc1_ < 16)
         {
            writeByte(std_dc_chrominance_nrcodes[_loc1_ + 1]);
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ <= 11)
         {
            writeByte(std_dc_chrominance_values[_loc1_]);
            _loc1_++;
         }
         writeByte(17);
         _loc1_ = 0;
         while(_loc1_ < 16)
         {
            writeByte(std_ac_chrominance_nrcodes[_loc1_ + 1]);
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ <= 161)
         {
            writeByte(std_ac_chrominance_values[_loc1_]);
            _loc1_++;
         }
      }
      
      private function writeBits(param1:BitString) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         _loc2_ = param1.val;
         _loc3_ = param1.len - 1;
         while(_loc3_ >= 0)
         {
            if(_loc2_ & uint(1 << _loc3_))
            {
               bytenew = bytenew | uint(1 << bytepos);
            }
            _loc3_--;
            bytepos--;
            if(bytepos < 0)
            {
               if(bytenew == 255)
               {
                  writeByte(255);
                  writeByte(0);
               }
               else
               {
                  writeByte(bytenew);
               }
               bytepos = 7;
               bytenew = 0;
            }
         }
      }
      
      private function initHuffmanTbl() : void
      {
         YDC_HT = computeHuffmanTbl(std_dc_luminance_nrcodes,std_dc_luminance_values);
         UVDC_HT = computeHuffmanTbl(std_dc_chrominance_nrcodes,std_dc_chrominance_values);
         YAC_HT = computeHuffmanTbl(std_ac_luminance_nrcodes,std_ac_luminance_values);
         UVAC_HT = computeHuffmanTbl(std_ac_chrominance_nrcodes,std_ac_chrominance_values);
      }
      
      public function encode(param1:BitmapData) : ByteArray
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:BitString = null;
         byteout = new ByteArray();
         bytenew = 0;
         bytepos = 7;
         writeWord(65496);
         writeAPP0();
         writeDQT();
         writeSOF0(param1.width,param1.height);
         writeDHT();
         writeSOS();
         _loc2_ = 0;
         _loc3_ = 0;
         _loc4_ = 0;
         bytenew = 0;
         bytepos = 7;
         _loc5_ = 0;
         while(_loc5_ < param1.height)
         {
            _loc6_ = 0;
            while(_loc6_ < param1.width)
            {
               RGB2YUV(param1,_loc6_,_loc5_);
               _loc2_ = processDU(YDU,fdtbl_Y,_loc2_,YDC_HT,YAC_HT);
               _loc3_ = processDU(UDU,fdtbl_UV,_loc3_,UVDC_HT,UVAC_HT);
               _loc4_ = processDU(VDU,fdtbl_UV,_loc4_,UVDC_HT,UVAC_HT);
               _loc6_ = _loc6_ + 8;
            }
            _loc5_ = _loc5_ + 8;
         }
         if(bytepos >= 0)
         {
            _loc7_ = new BitString();
            _loc7_.len = bytepos + 1;
            _loc7_.val = 1 << bytepos + 1 - 1;
            writeBits(_loc7_);
         }
         writeWord(65497);
         return byteout;
      }
      
      private function initCategoryNumber() : void
      {
         var _loc1_:* = 0;
         var _loc2_:* = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         _loc1_ = 1;
         _loc2_ = 2;
         _loc4_ = 1;
         while(_loc4_ <= 15)
         {
            _loc3_ = _loc1_;
            while(_loc3_ < _loc2_)
            {
               category[32767 + _loc3_] = _loc4_;
               bitcode[32767 + _loc3_] = new BitString();
               bitcode[32767 + _loc3_].len = _loc4_;
               bitcode[32767 + _loc3_].val = _loc3_;
               _loc3_++;
            }
            _loc3_ = -(_loc2_ - 1);
            while(_loc3_ <= -_loc1_)
            {
               category[32767 + _loc3_] = _loc4_;
               bitcode[32767 + _loc3_] = new BitString();
               bitcode[32767 + _loc3_].len = _loc4_;
               bitcode[32767 + _loc3_].val = _loc2_ - 1 + _loc3_;
               _loc3_++;
            }
            _loc1_ = _loc1_ << 1;
            _loc2_ = _loc2_ << 1;
            _loc4_++;
         }
      }
      
      private function writeDQT() : void
      {
         var _loc1_:int = 0;
         writeWord(65499);
         writeWord(132);
         writeByte(0);
         _loc1_ = 0;
         while(_loc1_ < 64)
         {
            writeByte(YTable[_loc1_]);
            _loc1_++;
         }
         writeByte(1);
         _loc1_ = 0;
         while(_loc1_ < 64)
         {
            writeByte(UVTable[_loc1_]);
            _loc1_++;
         }
      }
      
      private function writeAPP0() : void
      {
         writeWord(65504);
         writeWord(16);
         writeByte(74);
         writeByte(70);
         writeByte(73);
         writeByte(70);
         writeByte(0);
         writeByte(1);
         writeByte(1);
         writeByte(0);
         writeWord(1);
         writeWord(1);
         writeByte(0);
         writeByte(0);
      }
      
      private function writeSOS() : void
      {
         writeWord(65498);
         writeWord(12);
         writeByte(3);
         writeByte(1);
         writeByte(0);
         writeByte(2);
         writeByte(17);
         writeByte(3);
         writeByte(17);
         writeByte(0);
         writeByte(63);
         writeByte(0);
      }
      
      private function processDU(param1:Array, param2:Array, param3:Number, param4:Array, param5:Array) : Number
      {
         var _loc6_:BitString = null;
         var _loc7_:BitString = null;
         var _loc8_:int = 0;
         var _loc9_:Array = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         _loc6_ = param5[0];
         _loc7_ = param5[240];
         _loc9_ = fDCTQuant(param1,param2);
         _loc8_ = 0;
         while(_loc8_ < 64)
         {
            DU[ZigZag[_loc8_]] = _loc9_[_loc8_];
            _loc8_++;
         }
         _loc10_ = DU[0] - param3;
         param3 = DU[0];
         if(_loc10_ == 0)
         {
            writeBits(param4[0]);
         }
         else
         {
            writeBits(param4[category[32767 + _loc10_]]);
            writeBits(bitcode[32767 + _loc10_]);
         }
         _loc11_ = 63;
         while(_loc11_ > 0 && DU[_loc11_] == 0)
         {
            _loc11_--;
         }
         if(_loc11_ == 0)
         {
            writeBits(_loc6_);
            return param3;
         }
         _loc8_ = 1;
         while(_loc8_ <= _loc11_)
         {
            _loc12_ = _loc8_;
            while(DU[_loc8_] == 0 && _loc8_ <= _loc11_)
            {
               _loc8_++;
            }
            _loc13_ = _loc8_ - _loc12_;
            if(_loc13_ >= 16)
            {
               _loc14_ = 1;
               while(_loc14_ <= _loc13_ / 16)
               {
                  writeBits(_loc7_);
                  _loc14_++;
               }
               _loc13_ = int(_loc13_ & 15);
            }
            writeBits(param5[_loc13_ * 16 + category[32767 + DU[_loc8_]]]);
            writeBits(bitcode[32767 + DU[_loc8_]]);
            _loc8_++;
         }
         if(_loc11_ != 63)
         {
            writeBits(_loc6_);
         }
         return param3;
      }
      
      private function initQuantTables(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:Array = null;
         var _loc5_:Array = null;
         var _loc6_:Array = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         _loc4_ = [16,11,10,16,24,40,51,61,12,12,14,19,26,58,60,55,14,13,16,24,40,57,69,56,14,17,22,29,51,87,80,62,18,22,37,56,68,109,103,77,24,35,55,64,81,104,113,92,49,64,78,87,103,121,120,101,72,92,95,98,112,100,103,99];
         _loc2_ = 0;
         while(_loc2_ < 64)
         {
            _loc3_ = Math.floor((_loc4_[_loc2_] * param1 + 50) / 100);
            if(_loc3_ < 1)
            {
               _loc3_ = 1;
            }
            else if(_loc3_ > 255)
            {
               _loc3_ = 255;
            }
            YTable[ZigZag[_loc2_]] = _loc3_;
            _loc2_++;
         }
         _loc5_ = [17,18,24,47,99,99,99,99,18,21,26,66,99,99,99,99,24,26,56,99,99,99,99,99,47,66,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99];
         _loc2_ = 0;
         while(_loc2_ < 64)
         {
            _loc3_ = Math.floor((_loc5_[_loc2_] * param1 + 50) / 100);
            if(_loc3_ < 1)
            {
               _loc3_ = 1;
            }
            else if(_loc3_ > 255)
            {
               _loc3_ = 255;
            }
            UVTable[ZigZag[_loc2_]] = _loc3_;
            _loc2_++;
         }
         _loc6_ = [1,1.387039845,1.306562965,1.175875602,1,0.785694958,0.5411961,0.275899379];
         _loc2_ = 0;
         _loc7_ = 0;
         while(_loc7_ < 8)
         {
            _loc8_ = 0;
            while(_loc8_ < 8)
            {
               fdtbl_Y[_loc2_] = 1 / (YTable[ZigZag[_loc2_]] * _loc6_[_loc7_] * _loc6_[_loc8_] * 8);
               fdtbl_UV[_loc2_] = 1 / (UVTable[ZigZag[_loc2_]] * _loc6_[_loc7_] * _loc6_[_loc8_] * 8);
               _loc2_++;
               _loc8_++;
            }
            _loc7_++;
         }
      }
      
      private function writeSOF0(param1:int, param2:int) : void
      {
         writeWord(65472);
         writeWord(17);
         writeByte(8);
         writeWord(param2);
         writeWord(param1);
         writeByte(3);
         writeByte(1);
         writeByte(17);
         writeByte(0);
         writeByte(2);
         writeByte(17);
         writeByte(1);
         writeByte(3);
         writeByte(17);
         writeByte(1);
      }
      
      private function computeHuffmanTbl(param1:Array, param2:Array) : Array
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         _loc3_ = 0;
         _loc4_ = 0;
         _loc5_ = new Array();
         _loc6_ = 1;
         while(_loc6_ <= 16)
         {
            _loc7_ = 1;
            while(_loc7_ <= param1[_loc6_])
            {
               _loc5_[param2[_loc4_]] = new BitString();
               _loc5_[param2[_loc4_]].val = _loc3_;
               _loc5_[param2[_loc4_]].len = _loc6_;
               _loc4_++;
               _loc3_++;
               _loc7_++;
            }
            _loc3_ = _loc3_ * 2;
            _loc6_++;
         }
         return _loc5_;
      }
      
      private function fDCTQuant(param1:Array, param2:Array) : Array
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         _loc23_ = 0;
         _loc22_ = 0;
         while(_loc22_ < 8)
         {
            _loc3_ = param1[_loc23_ + 0] + param1[_loc23_ + 7];
            _loc10_ = param1[_loc23_ + 0] - param1[_loc23_ + 7];
            _loc4_ = param1[_loc23_ + 1] + param1[_loc23_ + 6];
            _loc9_ = param1[_loc23_ + 1] - param1[_loc23_ + 6];
            _loc5_ = param1[_loc23_ + 2] + param1[_loc23_ + 5];
            _loc8_ = param1[_loc23_ + 2] - param1[_loc23_ + 5];
            _loc6_ = param1[_loc23_ + 3] + param1[_loc23_ + 4];
            _loc7_ = param1[_loc23_ + 3] - param1[_loc23_ + 4];
            _loc11_ = _loc3_ + _loc6_;
            _loc14_ = _loc3_ - _loc6_;
            _loc12_ = _loc4_ + _loc5_;
            _loc13_ = _loc4_ - _loc5_;
            param1[_loc23_ + 0] = _loc11_ + _loc12_;
            param1[_loc23_ + 4] = _loc11_ - _loc12_;
            _loc15_ = (_loc13_ + _loc14_) * 0.707106781;
            param1[_loc23_ + 2] = _loc14_ + _loc15_;
            param1[_loc23_ + 6] = _loc14_ - _loc15_;
            _loc11_ = _loc7_ + _loc8_;
            _loc12_ = _loc8_ + _loc9_;
            _loc13_ = _loc9_ + _loc10_;
            _loc19_ = (_loc11_ - _loc13_) * 0.382683433;
            _loc16_ = 0.5411961 * _loc11_ + _loc19_;
            _loc18_ = 1.306562965 * _loc13_ + _loc19_;
            _loc17_ = _loc12_ * 0.707106781;
            _loc20_ = _loc10_ + _loc17_;
            _loc21_ = _loc10_ - _loc17_;
            param1[_loc23_ + 5] = _loc21_ + _loc16_;
            param1[_loc23_ + 3] = _loc21_ - _loc16_;
            param1[_loc23_ + 1] = _loc20_ + _loc18_;
            param1[_loc23_ + 7] = _loc20_ - _loc18_;
            _loc23_ = _loc23_ + 8;
            _loc22_++;
         }
         _loc23_ = 0;
         _loc22_ = 0;
         while(_loc22_ < 8)
         {
            _loc3_ = param1[_loc23_ + 0] + param1[_loc23_ + 56];
            _loc10_ = param1[_loc23_ + 0] - param1[_loc23_ + 56];
            _loc4_ = param1[_loc23_ + 8] + param1[_loc23_ + 48];
            _loc9_ = param1[_loc23_ + 8] - param1[_loc23_ + 48];
            _loc5_ = param1[_loc23_ + 16] + param1[_loc23_ + 40];
            _loc8_ = param1[_loc23_ + 16] - param1[_loc23_ + 40];
            _loc6_ = param1[_loc23_ + 24] + param1[_loc23_ + 32];
            _loc7_ = param1[_loc23_ + 24] - param1[_loc23_ + 32];
            _loc11_ = _loc3_ + _loc6_;
            _loc14_ = _loc3_ - _loc6_;
            _loc12_ = _loc4_ + _loc5_;
            _loc13_ = _loc4_ - _loc5_;
            param1[_loc23_ + 0] = _loc11_ + _loc12_;
            param1[_loc23_ + 32] = _loc11_ - _loc12_;
            _loc15_ = (_loc13_ + _loc14_) * 0.707106781;
            param1[_loc23_ + 16] = _loc14_ + _loc15_;
            param1[_loc23_ + 48] = _loc14_ - _loc15_;
            _loc11_ = _loc7_ + _loc8_;
            _loc12_ = _loc8_ + _loc9_;
            _loc13_ = _loc9_ + _loc10_;
            _loc19_ = (_loc11_ - _loc13_) * 0.382683433;
            _loc16_ = 0.5411961 * _loc11_ + _loc19_;
            _loc18_ = 1.306562965 * _loc13_ + _loc19_;
            _loc17_ = _loc12_ * 0.707106781;
            _loc20_ = _loc10_ + _loc17_;
            _loc21_ = _loc10_ - _loc17_;
            param1[_loc23_ + 40] = _loc21_ + _loc16_;
            param1[_loc23_ + 24] = _loc21_ - _loc16_;
            param1[_loc23_ + 8] = _loc20_ + _loc18_;
            param1[_loc23_ + 56] = _loc20_ - _loc18_;
            _loc23_++;
            _loc22_++;
         }
         _loc22_ = 0;
         while(_loc22_ < 64)
         {
            param1[_loc22_] = Math.round(param1[_loc22_] * param2[_loc22_]);
            _loc22_++;
         }
         return param1;
      }
   }
}
