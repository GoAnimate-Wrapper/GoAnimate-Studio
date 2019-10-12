package nochump.util.zip
{
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import flash.utils.IDataInput;
   
   public class ZipFile
   {
       
      
      private var buf:ByteArray;
      
      private var entryList:Vector.<ZipEntry>;
      
      private var entryTable:Dictionary;
      
      private var locOffsetTable:Dictionary;
      
      public function ZipFile(param1:IDataInput)
      {
         super();
         buf = new ByteArray();
         buf.endian = "littleEndian";
         param1.readBytes(buf);
         readEntries();
      }
      
      public function get entries() : Vector.<ZipEntry>
      {
         return entryList;
      }
      
      public function get size() : int
      {
         return entryList.length;
      }
      
      public function getEntry(param1:String) : ZipEntry
      {
         return entryTable[param1];
      }
      
      public function getInput(param1:ZipEntry) : ByteArray
      {
         buf.position = locOffsetTable[param1.name] + 30 - 2;
         var _loc3_:uint = buf.readShort();
         buf.position = buf.position + (param1.name.length + _loc3_);
         var _loc2_:ByteArray = new ByteArray();
         if(param1.compressedSize > 0)
         {
            buf.readBytes(_loc2_,0,param1.compressedSize);
         }
         switch(int(param1.method))
         {
            case 0:
               return _loc2_;
            default:
            default:
            default:
            default:
            default:
            default:
            default:
               throw new ZipError("invalid compression method");
            case 8:
               _loc2_.inflate();
               return _loc2_;
         }
      }
      
      private function readEntries() : void
      {
         var _loc3_:* = null;
         var _loc4_:* = 0;
         var _loc2_:* = null;
         var _loc6_:int = 0;
         readEND();
         entryTable = new Dictionary();
         locOffsetTable = new Dictionary();
         var _loc5_:int = entryList.length;
         var _loc1_:ByteArray = new ByteArray();
         _loc1_.endian = "littleEndian";
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            buf.readBytes(_loc1_,0,46);
            if(_loc1_.readUnsignedInt() != 33639248)
            {
               throw new ZipError("invalid CEN header (bad signature)");
            }
            _loc1_.position = 28;
            _loc4_ = uint(_loc1_.readUnsignedShort());
            if(_loc4_ == 0)
            {
               throw new ZipError("missing entry name");
            }
            _loc3_ = buf.readUTFBytes(_loc4_);
            _loc2_ = new ZipEntry(_loc3_);
            _loc4_ = uint(_loc1_.readUnsignedShort());
            _loc2_.extra = new ByteArray();
            if(_loc4_ > 0)
            {
               buf.readBytes(_loc2_.extra,0,_loc4_);
            }
            buf.position = buf.position + _loc1_.readUnsignedShort();
            _loc1_.position = 6;
            _loc2_.version = _loc1_.readUnsignedShort();
            _loc2_.flag = _loc1_.readUnsignedShort();
            if(_loc2_.flag & 1)
            {
               throw new ZipError("encrypted ZIP entry not supported");
            }
            _loc2_.method = _loc1_.readUnsignedShort();
            _loc2_.dostime = _loc1_.readUnsignedInt();
            _loc2_.crc = _loc1_.readUnsignedInt();
            _loc2_.compressedSize = _loc1_.readUnsignedInt();
            _loc2_.size = _loc1_.readUnsignedInt();
            entryList[_loc6_] = _loc2_;
            entryTable[_loc3_] = _loc2_;
            _loc1_.position = 42;
            locOffsetTable[_loc3_] = _loc1_.readUnsignedInt();
            _loc1_.clear();
            _loc6_++;
         }
      }
      
      private function readEND() : void
      {
         var _loc1_:ByteArray = new ByteArray();
         _loc1_.endian = "littleEndian";
         buf.position = findEND();
         buf.readBytes(_loc1_,0,22);
         _loc1_.position = 10;
         entryList = new Vector.<ZipEntry>(_loc1_.readUnsignedShort());
         _loc1_.position = 16;
         buf.position = _loc1_.readUnsignedInt();
      }
      
      private function findEND() : uint
      {
         var _loc2_:uint = buf.length - 22;
         var _loc1_:uint = Math.max(0,_loc2_ - 65535);
         _loc2_;
         while(_loc2_ >= _loc1_)
         {
            if(buf[_loc2_] == 80)
            {
               buf.position = _loc2_;
               if(buf.readUnsignedInt() == 101010256)
               {
                  return _loc2_;
               }
            }
            _loc2_--;
         }
         throw new ZipError("invalid zip");
      }
   }
}
