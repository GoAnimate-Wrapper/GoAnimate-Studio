package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_vorbis_bitrate_flushpacket extends Machine
   {
       
      
      public function FSM_vorbis_bitrate_flushpacket()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = 0;
         var _loc5_:* = 0;
         var _loc6_:int = 0;
         var _loc7_:* = 0;
         FSM_vorbis_bitrate_flushpacket.esp = FSM_vorbis_bitrate_flushpacket.esp - 4;
         si32(FSM_vorbis_bitrate_flushpacket.ebp,FSM_vorbis_bitrate_flushpacket.esp);
         FSM_vorbis_bitrate_flushpacket.ebp = FSM_vorbis_bitrate_flushpacket.esp;
         FSM_vorbis_bitrate_flushpacket.esp = FSM_vorbis_bitrate_flushpacket.esp - 0;
         _loc1_ = li32(FSM_vorbis_bitrate_flushpacket.ebp + 8);
         _loc1_ = li32(_loc1_ + 104);
         _loc2_ = li32(_loc1_ + 120);
         _loc3_ = li32(FSM_vorbis_bitrate_flushpacket.ebp + 12);
         if(_loc2_ != 0)
         {
            if(_loc3_ != 0)
            {
               _loc4_ = int(li32(_loc2_ + 64));
               _loc4_ = int(li32(_loc4_ + 104));
               _loc5_ = int(li32(_loc2_ + 104));
               _loc6_ = _loc4_ + 80;
               if(_loc6_ != 0)
               {
                  _loc4_ = int(li32(_loc4_ + 80));
                  if(_loc4_ != 0)
                  {
                     _loc4_ = int(li32(_loc1_ + 124));
                  }
                  addr131:
                  _loc6_ = 0;
                  _loc4_ = _loc4_ << 2;
                  _loc4_ = int(_loc5_ + _loc4_);
                  _loc5_ = int(li32(_loc4_ + 12));
                  _loc5_ = int(li32(_loc5_ + 8));
                  si32(_loc5_,_loc3_);
                  _loc4_ = int(li32(_loc4_ + 12));
                  _loc5_ = int(li32(_loc4_ + 4));
                  _loc5_ = int(_loc5_ + 7);
                  _loc7_ = _loc5_ >> 31;
                  _loc7_ = int(_loc7_ >>> 29);
                  _loc5_ = int(_loc5_ + _loc7_);
                  _loc4_ = int(li32(_loc4_));
                  _loc5_ = _loc5_ >> 3;
                  _loc4_ = int(_loc4_ + _loc5_);
                  si32(_loc4_,_loc3_ + 4);
                  si32(_loc6_,_loc3_ + 8);
                  _loc4_ = int(li32(_loc2_ + 44));
                  si32(_loc4_,_loc3_ + 12);
                  _loc4_ = int(li32(_loc2_ + 48));
                  _loc5_ = int(li32(_loc2_ + 52));
                  si32(_loc4_,_loc3_ + 16);
                  si32(_loc5_,_loc3_ + 20);
                  _loc4_ = int(li32(_loc2_ + 56));
                  _loc2_ = li32(_loc2_ + 60);
                  si32(_loc4_,_loc3_ + 24);
                  si32(_loc2_,_loc3_ + 28);
               }
               _loc4_ = 7;
               §§goto(addr131);
            }
            _loc2_ = 0;
            si32(_loc2_,_loc1_ + 120);
            _loc1_ = 1;
         }
         else
         {
            _loc1_ = 0;
         }
         FSM_vorbis_bitrate_flushpacket.eax = _loc1_;
         FSM_vorbis_bitrate_flushpacket.esp = FSM_vorbis_bitrate_flushpacket.ebp;
         FSM_vorbis_bitrate_flushpacket.ebp = li32(FSM_vorbis_bitrate_flushpacket.esp);
         FSM_vorbis_bitrate_flushpacket.esp = FSM_vorbis_bitrate_flushpacket.esp + 4;
         FSM_vorbis_bitrate_flushpacket.esp = FSM_vorbis_bitrate_flushpacket.esp + 4;
      }
   }
}
