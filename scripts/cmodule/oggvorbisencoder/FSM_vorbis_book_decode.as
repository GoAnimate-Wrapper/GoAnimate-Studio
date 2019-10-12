package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_vorbis_book_decode extends Machine
   {
       
      
      public function FSM_vorbis_book_decode()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = 0;
         var _loc3_:int = 0;
         FSM_vorbis_book_decode.esp = FSM_vorbis_book_decode.esp - 4;
         si32(FSM_vorbis_book_decode.ebp,FSM_vorbis_book_decode.esp);
         FSM_vorbis_book_decode.ebp = FSM_vorbis_book_decode.esp;
         FSM_vorbis_book_decode.esp = FSM_vorbis_book_decode.esp - 0;
         _loc1_ = li32(FSM_vorbis_book_decode.ebp + 8);
         _loc2_ = int(li32(FSM_vorbis_book_decode.ebp + 12));
         _loc3_ = li32(_loc1_ + 8);
         if(_loc3_ >= 1)
         {
            FSM_vorbis_book_decode.esp = FSM_vorbis_book_decode.esp - 8;
            si32(_loc1_,FSM_vorbis_book_decode.esp);
            si32(_loc2_,FSM_vorbis_book_decode.esp + 4);
            FSM_vorbis_book_decode.esp = FSM_vorbis_book_decode.esp - 4;
            FSM_vorbis_book_decode.start();
            _loc2_ = int(FSM_vorbis_book_decode.eax);
            FSM_vorbis_book_decode.esp = FSM_vorbis_book_decode.esp + 8;
            if(_loc2_ >= 0)
            {
               _loc1_ = li32(_loc1_ + 24);
               _loc2_ = _loc2_ << 2;
               _loc1_ = _loc1_ + _loc2_;
               _loc1_ = li32(_loc1_);
            }
            addr134:
            FSM_vorbis_book_decode.eax = _loc1_;
            FSM_vorbis_book_decode.esp = FSM_vorbis_book_decode.ebp;
            FSM_vorbis_book_decode.ebp = li32(FSM_vorbis_book_decode.esp);
            FSM_vorbis_book_decode.esp = FSM_vorbis_book_decode.esp + 4;
            FSM_vorbis_book_decode.esp = FSM_vorbis_book_decode.esp + 4;
            return;
         }
         _loc1_ = -1;
         §§goto(addr134);
      }
   }
}
