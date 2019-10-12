package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_oggpack_look extends Machine
   {
       
      
      public function FSM_oggpack_look()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:* = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = 0;
         var _loc5_:* = 0;
         var _loc6_:* = 0;
         var _loc7_:* = 0;
         FSM_oggpack_look.esp = FSM_oggpack_look.esp - 4;
         si32(FSM_oggpack_look.ebp,FSM_oggpack_look.esp);
         FSM_oggpack_look.ebp = FSM_oggpack_look.esp;
         FSM_oggpack_look.esp = FSM_oggpack_look.esp - 0;
         _loc1_ = int(li32(FSM_oggpack_look.ebp + 8));
         _loc2_ = li32(FSM_oggpack_look.ebp + 12);
         if(uint(_loc2_) >= uint(33))
         {
            addr72:
            _loc1_ = -1;
         }
         else
         {
            _loc3_ = FSM_oggpack_look;
            _loc4_ = _loc2_ << 2;
            _loc3_ = _loc3_ + _loc4_;
            _loc4_ = int(li32(_loc1_ + 4));
            _loc5_ = int(li32(_loc1_ + 16));
            _loc3_ = li32(_loc3_);
            _loc6_ = int(li32(_loc1_));
            _loc2_ = _loc4_ + _loc2_;
            _loc7_ = int(_loc5_ + -4);
            if(_loc6_ >= _loc7_)
            {
               _loc7_ = int(_loc2_ + 7);
               _loc7_ = _loc7_ >> 3;
               _loc5_ = int(_loc5_ - _loc7_);
               if(_loc6_ <= _loc5_)
               {
                  if(_loc2_ == 0)
                  {
                     _loc1_ = 0;
                  }
               }
               else
               {
                  §§goto(addr72);
               }
            }
            _loc1_ = int(li32(_loc1_ + 12));
            _loc5_ = int(li8(_loc1_));
            _loc5_ = int(_loc5_ >>> _loc4_);
            if(_loc2_ <= 8)
            {
               _loc1_ = int(_loc5_);
            }
            else
            {
               _loc6_ = int(li8(_loc1_ + 1));
               _loc7_ = int(8 - _loc4_);
               _loc6_ = _loc6_ << _loc7_;
               _loc5_ = _loc6_ | _loc5_;
               if(_loc2_ <= 16)
               {
                  _loc1_ = int(_loc5_);
               }
               else
               {
                  _loc6_ = int(li8(_loc1_ + 2));
                  _loc7_ = int(16 - _loc4_);
                  _loc6_ = _loc6_ << _loc7_;
                  _loc5_ = _loc6_ | _loc5_;
                  if(_loc2_ <= 24)
                  {
                     _loc1_ = int(_loc5_);
                  }
                  else
                  {
                     _loc6_ = int(li8(_loc1_ + 3));
                     _loc7_ = int(24 - _loc4_);
                     _loc6_ = _loc6_ << _loc7_;
                     _loc5_ = _loc6_ | _loc5_;
                     if(_loc4_ != 0)
                     {
                        if(_loc2_ > 32)
                        {
                           _loc1_ = int(li8(_loc1_ + 4));
                           _loc2_ = 32 - _loc4_;
                           _loc1_ = _loc1_ << _loc2_;
                           _loc1_ = _loc1_ | _loc5_;
                        }
                     }
                     _loc1_ = int(_loc5_);
                  }
               }
            }
            _loc1_ = _loc3_ & _loc1_;
         }
         FSM_oggpack_look.eax = _loc1_;
         FSM_oggpack_look.esp = FSM_oggpack_look.ebp;
         FSM_oggpack_look.ebp = li32(FSM_oggpack_look.esp);
         FSM_oggpack_look.esp = FSM_oggpack_look.esp + 4;
         FSM_oggpack_look.esp = FSM_oggpack_look.esp + 4;
      }
   }
}
