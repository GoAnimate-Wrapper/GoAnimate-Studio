package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   import avm2.intrinsics.memory.sxi8;
   
   public final class FSM_decode_packed_entry_number extends Machine
   {
       
      
      public function FSM_decode_packed_entry_number()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:* = 0;
         var _loc4_:int = 0;
         var _loc5_:* = 0;
         var _loc6_:* = 0;
         var _loc7_:* = 0;
         var _loc8_:int = 0;
         var _loc9_:* = 0;
         var _loc10_:int = 0;
         FSM_decode_packed_entry_number.esp = FSM_decode_packed_entry_number.esp - 4;
         si32(FSM_decode_packed_entry_number.ebp,FSM_decode_packed_entry_number.esp);
         FSM_decode_packed_entry_number.ebp = FSM_decode_packed_entry_number.esp;
         FSM_decode_packed_entry_number.esp = FSM_decode_packed_entry_number.esp - 0;
         _loc1_ = li32(FSM_decode_packed_entry_number.ebp + 8);
         _loc2_ = li32(_loc1_ + 40);
         _loc3_ = int(li32(_loc1_ + 36));
         FSM_decode_packed_entry_number.esp = FSM_decode_packed_entry_number.esp - 8;
         _loc4_ = li32(FSM_decode_packed_entry_number.ebp + 12);
         si32(_loc4_,FSM_decode_packed_entry_number.esp);
         si32(_loc3_,FSM_decode_packed_entry_number.esp + 4);
         FSM_decode_packed_entry_number.esp = FSM_decode_packed_entry_number.esp - 4;
         FSM_decode_packed_entry_number.start();
         _loc3_ = int(FSM_decode_packed_entry_number.eax);
         FSM_decode_packed_entry_number.esp = FSM_decode_packed_entry_number.esp + 8;
         if(_loc3_ >= 0)
         {
            _loc5_ = int(li32(_loc1_ + 32));
            _loc3_ = _loc3_ << 2;
            _loc3_ = int(_loc5_ + _loc3_);
            _loc3_ = int(li32(_loc3_));
            if(_loc3_ <= -1)
            {
               _loc5_ = int(_loc3_ >>> 15);
               _loc6_ = int(li32(_loc1_ + 8));
               _loc3_ = _loc3_ & 32767;
               _loc3_ = int(_loc6_ - _loc3_);
               _loc5_ = _loc5_ & 32767;
            }
            else
            {
               _loc1_ = li32(_loc1_ + 28);
               _loc2_ = _loc3_ + -1;
               _loc1_ = _loc1_ + _loc2_;
               _loc1_ = si8(li8(_loc1_));
               FSM_decode_packed_entry_number.esp = FSM_decode_packed_entry_number.esp - 8;
               si32(_loc4_,FSM_decode_packed_entry_number.esp);
               si32(_loc1_,FSM_decode_packed_entry_number.esp + 4);
               FSM_decode_packed_entry_number.esp = FSM_decode_packed_entry_number.esp - 4;
               FSM_decode_packed_entry_number.start();
               FSM_decode_packed_entry_number.esp = FSM_decode_packed_entry_number.esp + 8;
               FSM_decode_packed_entry_number.eax = _loc2_;
            }
            addr660:
            FSM_decode_packed_entry_number.esp = FSM_decode_packed_entry_number.ebp;
            FSM_decode_packed_entry_number.ebp = li32(FSM_decode_packed_entry_number.esp);
            FSM_decode_packed_entry_number.esp = FSM_decode_packed_entry_number.esp + 4;
            FSM_decode_packed_entry_number.esp = FSM_decode_packed_entry_number.esp + 4;
            return;
         }
         _loc3_ = 0;
         _loc6_ = int(li32(_loc1_ + 8));
         _loc5_ = int(_loc3_);
         _loc3_ = int(_loc6_);
         FSM_decode_packed_entry_number.esp = FSM_decode_packed_entry_number.esp - 8;
         si32(_loc4_,FSM_decode_packed_entry_number.esp);
         si32(_loc2_,FSM_decode_packed_entry_number.esp + 4);
         FSM_decode_packed_entry_number.esp = FSM_decode_packed_entry_number.esp - 4;
         FSM_decode_packed_entry_number.start();
         _loc6_ = int(FSM_decode_packed_entry_number.eax);
         FSM_decode_packed_entry_number.esp = FSM_decode_packed_entry_number.esp + 8;
         while(_loc2_ >= 2)
         {
            if(_loc6_ >= 0)
            {
               break;
            }
            FSM_decode_packed_entry_number.esp = FSM_decode_packed_entry_number.esp - 8;
            _loc2_ = _loc2_ + -1;
            si32(_loc4_,FSM_decode_packed_entry_number.esp);
            si32(_loc2_,FSM_decode_packed_entry_number.esp + 4);
            FSM_decode_packed_entry_number.esp = FSM_decode_packed_entry_number.esp - 4;
            FSM_decode_packed_entry_number.start();
            _loc6_ = int(FSM_decode_packed_entry_number.eax);
            FSM_decode_packed_entry_number.esp = FSM_decode_packed_entry_number.esp + 8;
         }
         if(_loc6_ >= 0)
         {
            _loc7_ = _loc6_ << 16;
            _loc6_ = int(_loc6_ >>> 16);
            _loc6_ = _loc6_ | _loc7_;
            _loc7_ = _loc6_ << 8;
            _loc6_ = int(_loc6_ >>> 8);
            _loc7_ = _loc7_ & -16711936;
            _loc6_ = _loc6_ & 16711935;
            _loc6_ = _loc6_ | _loc7_;
            _loc7_ = _loc6_ << 4;
            _loc6_ = int(_loc6_ >>> 4);
            _loc7_ = _loc7_ & -252645136;
            _loc6_ = _loc6_ & 252645135;
            _loc6_ = _loc6_ | _loc7_;
            _loc7_ = _loc6_ << 2;
            _loc6_ = int(_loc6_ >>> 2);
            _loc7_ = _loc7_ & -858993460;
            _loc6_ = _loc6_ & 858993459;
            _loc6_ = _loc6_ | _loc7_;
            _loc7_ = _loc6_ << 1;
            _loc6_ = int(_loc6_ >>> 1);
            _loc7_ = _loc7_ & -1431655766;
            _loc6_ = _loc6_ & 1431655765;
            _loc8_ = _loc1_ + 20;
            _loc6_ = _loc6_ | _loc7_;
            while(true)
            {
               _loc7_ = int(_loc5_);
               _loc5_ = int(_loc3_ - _loc7_);
               if(_loc5_ <= 1)
               {
                  break;
               }
               _loc5_ = _loc5_ >> 1;
               _loc9_ = int(_loc7_ + _loc5_);
               _loc10_ = li32(_loc8_);
               _loc9_ = _loc9_ << 2;
               _loc9_ = int(_loc10_ + _loc9_);
               _loc9_ = int(li32(_loc9_));
               _loc9_ = int(uint(_loc9_) > uint(_loc6_)?1:0);
               _loc9_ = _loc9_ & 1;
               _loc10_ = 0 - _loc9_;
               _loc9_ = int(_loc9_ + -1);
               _loc9_ = _loc9_ & _loc5_;
               _loc5_ = _loc5_ & _loc10_;
               _loc3_ = int(_loc3_ - _loc5_);
               _loc5_ = int(_loc9_ + _loc7_);
            }
            _loc1_ = li32(_loc1_ + 28);
            _loc1_ = _loc1_ + _loc7_;
            _loc1_ = si8(li8(_loc1_));
            if(_loc1_ <= _loc2_)
            {
               FSM_decode_packed_entry_number.esp = FSM_decode_packed_entry_number.esp - 8;
               si32(_loc4_,FSM_decode_packed_entry_number.esp);
               si32(_loc1_,FSM_decode_packed_entry_number.esp + 4);
               FSM_decode_packed_entry_number.esp = FSM_decode_packed_entry_number.esp - 4;
               FSM_decode_packed_entry_number.start();
               FSM_decode_packed_entry_number.esp = FSM_decode_packed_entry_number.esp + 8;
               FSM_decode_packed_entry_number.eax = _loc7_;
            }
            else
            {
               _loc1_ = -1;
               FSM_decode_packed_entry_number.esp = FSM_decode_packed_entry_number.esp - 8;
               si32(_loc4_,FSM_decode_packed_entry_number.esp);
               si32(_loc2_,FSM_decode_packed_entry_number.esp + 4);
               FSM_decode_packed_entry_number.esp = FSM_decode_packed_entry_number.esp - 4;
               FSM_decode_packed_entry_number.start();
               FSM_decode_packed_entry_number.esp = FSM_decode_packed_entry_number.esp + 8;
            }
            §§goto(addr660);
         }
         else
         {
            _loc1_ = -1;
         }
         FSM_decode_packed_entry_number.eax = _loc1_;
         §§goto(addr660);
      }
   }
}
