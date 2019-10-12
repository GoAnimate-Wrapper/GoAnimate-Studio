package nochump.util.zip
{
   import flash.utils.ByteArray;
   
   public class CRC32
   {
      
      private static var crcTable:Array = makeCrcTable();
       
      
      private var crc:uint;
      
      public function CRC32()
      {
         super();
      }
      
      private static function makeCrcTable() : Array
      {
         var _loc3_:int = 0;
         var _loc2_:* = 0;
         var _loc4_:int = 0;
         var _loc1_:Array = new Array(256);
         _loc3_ = 0;
         while(_loc3_ < 256)
         {
            _loc2_ = uint(_loc3_);
            _loc4_ = 8;
            while(true)
            {
               _loc4_--;
               if(_loc4_ < 0)
               {
                  break;
               }
               if((_loc2_ & 1) != 0)
               {
                  _loc2_ = uint(3988292384 ^ _loc2_ >>> 1);
               }
               else
               {
                  _loc2_ = uint(_loc2_ >>> 1);
               }
            }
            _loc1_[_loc3_] = _loc2_;
            _loc3_++;
         }
         return _loc1_;
      }
      
      public function getValue() : uint
      {
         return crc & 4294967295;
      }
      
      public function reset() : void
      {
         crc = 0;
      }
      
      public function update(param1:ByteArray) : void
      {
         var _loc3_:uint = 0;
         var _loc4_:uint = param1.length;
         var _loc2_:uint = ~crc;
         while(--_loc4_ >= 0)
         {
            _loc2_ = crcTable[(_loc2_ ^ param1[_loc3_++]) & 255] ^ _loc2_ >>> 8;
         }
         crc = ~_loc2_;
      }
   }
}
