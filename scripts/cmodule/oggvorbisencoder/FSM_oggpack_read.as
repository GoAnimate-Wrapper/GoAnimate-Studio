package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_oggpack_read extends Machine
   {
       
      
      public function FSM_oggpack_read()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:* = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:* = 0;
         var _loc10_:* = 0;
         var _loc11_:int = 0;
         FSM_oggpack_read.esp = FSM_oggpack_read.esp - 4;
         si32(FSM_oggpack_read.ebp,FSM_oggpack_read.esp);
         FSM_oggpack_read.ebp = FSM_oggpack_read.esp;
         FSM_oggpack_read.esp = FSM_oggpack_read.esp - 0;
         _loc1_ = int(li32(FSM_oggpack_read.ebp + 8));
         _loc2_ = li32(FSM_oggpack_read.ebp + 12);
         if(uint(_loc2_) <= uint(32))
         {
            _loc3_ = FSM_oggpack_read;
            _loc4_ = _loc2_ << 2;
            _loc3_ = _loc3_ + _loc4_;
            _loc4_ = int(li32(_loc1_ + 4));
            _loc5_ = li32(_loc1_ + 16);
            _loc3_ = li32(_loc3_);
            _loc6_ = li32(_loc1_);
            _loc2_ = _loc4_ + _loc2_;
            _loc7_ = _loc1_ + 4;
            _loc8_ = _loc1_;
            _loc9_ = int(_loc5_ + -4);
            if(_loc6_ >= _loc9_)
            {
               _loc9_ = int(_loc2_ + 7);
               _loc9_ = _loc9_ >> 3;
               _loc5_ = _loc5_ - _loc9_;
               if(_loc6_ <= _loc5_)
               {
                  if(_loc2_ == 0)
                  {
                     _loc1_ = 0;
                  }
               }
               addr361:
               FSM_oggpack_read.eax = _loc1_;
               FSM_oggpack_read.esp = FSM_oggpack_read.ebp;
               FSM_oggpack_read.ebp = li32(FSM_oggpack_read.esp);
               FSM_oggpack_read.esp = FSM_oggpack_read.esp + 4;
               FSM_oggpack_read.esp = FSM_oggpack_read.esp + 4;
               return;
            }
            _loc5_ = li32(_loc1_ + 12);
            _loc9_ = int(li8(_loc5_));
            _loc9_ = int(_loc9_ >>> _loc4_);
            _loc1_ = int(_loc1_ + 12);
            if(_loc2_ <= 8)
            {
               _loc4_ = int(_loc9_);
            }
            else
            {
               _loc10_ = int(li8(_loc5_ + 1));
               _loc11_ = 8 - _loc4_;
               _loc10_ = _loc10_ << _loc11_;
               _loc9_ = _loc10_ | _loc9_;
               if(_loc2_ <= 16)
               {
                  _loc4_ = int(_loc9_);
               }
               else
               {
                  _loc10_ = int(li8(_loc5_ + 2));
                  _loc11_ = 16 - _loc4_;
                  _loc10_ = _loc10_ << _loc11_;
                  _loc9_ = _loc10_ | _loc9_;
                  if(_loc2_ <= 24)
                  {
                     _loc4_ = int(_loc9_);
                  }
                  else
                  {
                     _loc10_ = int(li8(_loc5_ + 3));
                     _loc11_ = 24 - _loc4_;
                     _loc10_ = _loc10_ << _loc11_;
                     _loc9_ = _loc10_ | _loc9_;
                     if(_loc4_ != 0)
                     {
                        if(_loc2_ > 32)
                        {
                           _loc10_ = int(li8(_loc5_ + 4));
                           _loc4_ = int(32 - _loc4_);
                           _loc4_ = _loc10_ << _loc4_;
                           _loc4_ = _loc4_ | _loc9_;
                        }
                     }
                     _loc4_ = int(_loc9_);
                  }
               }
            }
            _loc9_ = _loc2_ >> 31;
            _loc9_ = int(_loc9_ >>> 29);
            _loc9_ = int(_loc2_ + _loc9_);
            _loc9_ = _loc9_ >> 3;
            _loc5_ = _loc5_ + _loc9_;
            si32(_loc5_,_loc1_);
            _loc1_ = int(_loc6_ + _loc9_);
            si32(_loc1_,_loc8_);
            _loc1_ = _loc2_ & 7;
            si32(_loc1_,_loc7_);
            _loc1_ = _loc4_ & _loc3_;
            §§goto(addr361);
         }
         _loc2_ = 0;
         si32(_loc2_,_loc1_ + 12);
         _loc2_ = li32(_loc1_ + 16);
         si32(_loc2_,_loc1_);
         _loc2_ = 1;
         si32(_loc2_,_loc1_ + 4);
         _loc1_ = -1;
         §§goto(addr361);
      }
   }
}
