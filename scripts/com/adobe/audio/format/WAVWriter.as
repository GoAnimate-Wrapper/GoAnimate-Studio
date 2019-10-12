package com.adobe.audio.format
{
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   import flash.utils.IDataOutput;
   
   public class WAVWriter
   {
       
      
      private var tempValueSum:Number = 0;
      
      private var tempValueCount:int = 0;
      
      public var samplingRate:Number = 44100;
      
      public var sampleBitRate:int = 16;
      
      public var numOfChannels:int = 2;
      
      private var compressionCode:int = 1;
      
      public function WAVWriter()
      {
         super();
      }
      
      private function header(param1:IDataOutput, param2:Number) : void
      {
         param1.writeUTFBytes("RIFF");
         param1.writeUnsignedInt(param2);
         param1.writeUTFBytes("WAVE");
         param1.writeUTFBytes("fmt ");
         param1.writeUnsignedInt(16);
         param1.writeShort(this.compressionCode);
         param1.writeShort(this.numOfChannels);
         param1.writeUnsignedInt(this.samplingRate);
         param1.writeUnsignedInt(this.samplingRate * this.numOfChannels * this.sampleBitRate / 8);
         param1.writeShort(this.numOfChannels * this.sampleBitRate / 8);
         param1.writeShort(this.sampleBitRate);
      }
      
      public function processSamples(param1:IDataOutput, param2:ByteArray, param3:int, param4:int = 1) : void
      {
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:Number = NaN;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         if(!param2 || param2.bytesAvailable <= 0)
         {
            throw new Error("No audio data");
         }
         var _loc5_:Number = Math.pow(2,this.sampleBitRate) / 2 - 1;
         var _loc6_:Number = this.samplingRate / param3;
         var _loc7_:int = param2.length / 4 * _loc6_ * this.sampleBitRate / 8;
         var _loc8_:int = 32 + 8 + _loc7_;
         param1.endian = Endian.LITTLE_ENDIAN;
         this.header(param1,_loc8_);
         param1.writeUTFBytes("data");
         param1.writeUnsignedInt(_loc7_);
         param2.position = 0;
         var _loc9_:ByteArray = new ByteArray();
         _loc9_.endian = Endian.LITTLE_ENDIAN;
         while(param2.bytesAvailable > 0)
         {
            _loc9_.clear();
            _loc10_ = Math.min(param2.bytesAvailable / 4,8192);
            _loc11_ = _loc10_;
            _loc12_ = 100;
            _loc13_ = (_loc6_ - Math.floor(_loc6_)) * _loc12_;
            _loc14_ = Math.ceil(_loc6_);
            _loc15_ = Math.floor(_loc6_);
            _loc16_ = 0;
            _loc17_ = this.numOfChannels - param4;
            _loc18_ = 0;
            _loc19_ = 0;
            while(_loc19_ < _loc11_)
            {
               _loc18_ = param2.readFloat();
               if(_loc18_ > 1 || _loc18_ < -1)
               {
                  throw new Error("Audio samples not in float format");
               }
               if(this.sampleBitRate == 8)
               {
                  _loc18_ = _loc5_ * _loc18_ + _loc5_;
               }
               else
               {
                  _loc18_ = _loc5_ * _loc18_;
               }
               _loc16_ = _loc13_ > 0 && _loc19_ % _loc12_ < _loc13_?int(_loc14_):int(_loc15_);
               _loc20_ = 0;
               while(_loc20_ < _loc16_)
               {
                  this.writeCorrectBits(_loc9_,_loc18_,_loc17_);
                  _loc20_++;
               }
               _loc19_ = _loc19_ + 4;
            }
            param1.writeBytes(_loc9_);
         }
      }
      
      private function writeCorrectBits(param1:ByteArray, param2:Number, param3:int) : void
      {
         if(param3 < 0)
         {
            if(this.tempValueCount + param3 == 1)
            {
               param2 = int(this.tempValueSum / this.tempValueCount);
               this.tempValueSum = 0;
               this.tempValueCount = 0;
               param3 = 1;
            }
            else
            {
               this.tempValueSum = this.tempValueSum + param2;
               this.tempValueCount++;
               return;
            }
         }
         else
         {
            param3++;
         }
         var _loc4_:int = 0;
         while(_loc4_ < param3)
         {
            if(this.sampleBitRate == 8)
            {
               param1.writeByte(param2);
            }
            else if(this.sampleBitRate == 16)
            {
               param1.writeShort(param2);
            }
            else if(this.sampleBitRate == 24)
            {
               param1.writeByte(param2 & 255);
               param1.writeByte(param2 >>> 8 & 255);
               param1.writeByte(param2 >>> 16 & 255);
            }
            else if(this.sampleBitRate == 32)
            {
               param1.writeInt(param2);
            }
            else
            {
               throw new Error("Sample bit rate not supported");
            }
            _loc4_++;
         }
      }
   }
}
