package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.lf32;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.sf32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_vorbis_book_decodevs_add extends Machine
   {
       
      
      public function FSM_vorbis_book_decodevs_add()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:* = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:* = 0;
         var _loc14_:int = 0;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         FSM_vorbis_book_decodevs_add.esp = FSM_vorbis_book_decodevs_add.esp - 4;
         si32(FSM_vorbis_book_decodevs_add.ebp,FSM_vorbis_book_decodevs_add.esp);
         FSM_vorbis_book_decodevs_add.ebp = FSM_vorbis_book_decodevs_add.esp;
         FSM_vorbis_book_decodevs_add.esp = FSM_vorbis_book_decodevs_add.esp - 0;
         _loc1_ = li32(FSM_vorbis_book_decodevs_add.ebp + 8);
         _loc2_ = li32(FSM_vorbis_book_decodevs_add.ebp + 16);
         _loc3_ = li32(FSM_vorbis_book_decodevs_add.ebp + 20);
         _loc4_ = li32(_loc1_ + 8);
         _loc5_ = li32(FSM_vorbis_book_decodevs_add.ebp + 12);
         if(_loc4_ <= 0)
         {
            addr108:
            _loc1_ = 0;
         }
         else
         {
            _loc4_ = 0;
            _loc6_ = int(li32(_loc1_));
            _loc7_ = _loc3_ / _loc6_;
            _loc8_ = FSM_vorbis_book_decodevs_add.esp;
            _loc9_ = _loc7_ << 2;
            _loc8_ = _loc8_ - _loc9_;
            FSM_vorbis_book_decodevs_add.esp = _loc8_;
            _loc9_ = int(_loc1_ + 16);
            _loc10_ = _loc1_;
            _loc11_ = _loc8_;
            while(true)
            {
               _loc12_ = _loc4_;
               _loc4_ = _loc11_;
               if(_loc12_ >= _loc7_)
               {
                  _loc1_ = 0;
                  _loc3_ = _loc3_ / _loc6_;
                  _loc6_ = _loc3_ << 2;
                  _loc3_ = _loc5_;
                  while(true)
                  {
                     _loc2_ = li32(_loc10_);
                     if(_loc2_ > _loc1_)
                     {
                        _loc5_ = 0;
                        _loc2_ = _loc5_;
                        while(_loc5_ < _loc7_)
                        {
                           _loc4_ = _loc8_ + _loc2_;
                           _loc4_ = li32(_loc4_);
                           _loc9_ = _loc1_ << 2;
                           _loc4_ = _loc4_ + _loc9_;
                           _loc9_ = int(_loc3_ + _loc2_);
                           _loc15_ = lf32(_loc9_);
                           _loc16_ = lf32(_loc4_);
                           _loc15_ = _loc15_ + _loc16_;
                           _loc15_ = _loc15_;
                           sf32(_loc15_,_loc9_);
                           _loc2_ = _loc2_ + 4;
                           _loc5_ = _loc5_ + 1;
                        }
                        _loc3_ = _loc6_ + _loc3_;
                        _loc1_ = _loc1_ + 1;
                        continue;
                     }
                     break;
                  }
                  §§goto(addr108);
               }
               else
               {
                  FSM_vorbis_book_decodevs_add.esp = FSM_vorbis_book_decodevs_add.esp - 8;
                  si32(_loc1_,FSM_vorbis_book_decodevs_add.esp);
                  si32(_loc2_,FSM_vorbis_book_decodevs_add.esp + 4);
                  FSM_vorbis_book_decodevs_add.esp = FSM_vorbis_book_decodevs_add.esp - 4;
                  FSM_vorbis_book_decodevs_add.start();
                  _loc13_ = int(FSM_vorbis_book_decodevs_add.eax);
                  FSM_vorbis_book_decodevs_add.esp = FSM_vorbis_book_decodevs_add.esp + 8;
                  if(_loc13_ == -1)
                  {
                     _loc1_ = -1;
                     break;
                  }
                  _loc14_ = li32(_loc10_);
                  _loc13_ = int(_loc13_ * _loc14_);
                  _loc14_ = li32(_loc9_);
                  _loc13_ = _loc13_ << 2;
                  _loc13_ = int(_loc14_ + _loc13_);
                  si32(_loc13_,_loc4_);
                  _loc4_ = _loc11_ + 4;
                  _loc12_ = _loc12_ + 1;
                  _loc11_ = _loc4_;
                  _loc4_ = _loc12_;
                  continue;
               }
            }
         }
         FSM_vorbis_book_decodevs_add.eax = _loc1_;
         FSM_vorbis_book_decodevs_add.esp = FSM_vorbis_book_decodevs_add.ebp;
         FSM_vorbis_book_decodevs_add.ebp = li32(FSM_vorbis_book_decodevs_add.esp);
         FSM_vorbis_book_decodevs_add.esp = FSM_vorbis_book_decodevs_add.esp + 4;
         FSM_vorbis_book_decodevs_add.esp = FSM_vorbis_book_decodevs_add.esp + 4;
      }
   }
}
