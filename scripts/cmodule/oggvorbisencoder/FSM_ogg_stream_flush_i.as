package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   import avm2.intrinsics.memory.si8;
   
   public final class FSM_ogg_stream_flush_i extends Machine
   {
       
      
      public function FSM_ogg_stream_flush_i()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = 0;
         var _loc3_:int = 0;
         var _loc4_:* = 0;
         var _loc5_:* = 0;
         var _loc6_:* = 0;
         var _loc7_:* = 0;
         var _loc8_:* = 0;
         var _loc9_:* = 0;
         var _loc10_:* = 0;
         var _loc11_:* = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         FSM_ogg_stream_flush_i.esp = FSM_ogg_stream_flush_i.esp - 4;
         si32(FSM_ogg_stream_flush_i.ebp,FSM_ogg_stream_flush_i.esp);
         FSM_ogg_stream_flush_i.ebp = FSM_ogg_stream_flush_i.esp;
         FSM_ogg_stream_flush_i.esp = FSM_ogg_stream_flush_i.esp - 0;
         _loc1_ = li32(FSM_ogg_stream_flush_i.ebp + 8);
         _loc2_ = int(li32(_loc1_ + 28));
         _loc2_ = int(_loc2_ < 256?int(_loc2_):255);
         _loc3_ = _loc1_ + 28;
         _loc4_ = int(li32(FSM_ogg_stream_flush_i.ebp + 12));
         _loc5_ = int(li32(FSM_ogg_stream_flush_i.ebp + 16));
         _loc6_ = int(_loc1_);
         if(_loc1_ != 0)
         {
            _loc7_ = int(li32(_loc1_));
            if(_loc7_ != 0)
            {
               if(_loc2_ != 0)
               {
                  _loc7_ = int(li32(_loc1_ + 332));
                  _loc8_ = int(_loc1_ + 16);
                  _loc9_ = int(_loc1_ + 332);
                  if(_loc7_ == 0)
                  {
                     _loc7_ = 0;
                     _loc10_ = int(_loc7_);
                     while(true)
                     {
                        if(_loc7_ >= _loc2_)
                        {
                           _loc2_ = 0;
                           _loc8_ = int(_loc2_);
                           _loc10_ = int(_loc2_);
                           _loc2_ = int(_loc8_);
                           break;
                        }
                        _loc11_ = int(li32(_loc8_));
                        _loc11_ = int(_loc11_ + _loc10_);
                        _loc11_ = int(li8(_loc11_));
                        _loc10_ = int(_loc10_ + 4);
                        _loc7_ = int(_loc7_ + 1);
                        if(_loc11_ >= 255)
                        {
                           continue;
                        }
                        _loc10_ = 0;
                        _loc2_ = int(_loc10_);
                        break;
                     }
                  }
                  else
                  {
                     _loc7_ = -1;
                     _loc10_ = 0;
                     _loc11_ = int(_loc1_ + 20);
                     _loc12_ = _loc7_;
                     _loc13_ = _loc10_;
                     _loc14_ = _loc10_;
                     _loc15_ = _loc10_;
                     _loc16_ = _loc10_;
                     _loc17_ = _loc10_;
                     while(true)
                     {
                        _loc19_ = _loc13_;
                        _loc18_ = _loc14_;
                        _loc14_ = _loc16_;
                        _loc13_ = _loc7_;
                        _loc7_ = int(_loc17_);
                        if(_loc15_ >= _loc2_)
                        {
                           _loc7_ = int(_loc5_);
                           break;
                        }
                        if(_loc14_ >= 4097)
                        {
                           if(_loc10_ >= 4)
                           {
                              _loc7_ = 1;
                              break;
                           }
                        }
                        _loc10_ = int(li32(_loc8_));
                        _loc10_ = int(_loc10_ + _loc18_);
                        _loc10_ = int(li8(_loc10_));
                        _loc16_ = _loc10_ + _loc14_;
                        if(_loc10_ >= 255)
                        {
                           _loc10_ = 0;
                        }
                        else
                        {
                           _loc10_ = int(li32(_loc11_));
                           _loc10_ = int(_loc10_ + _loc19_);
                           _loc12_ = li32(_loc10_);
                           _loc10_ = int(li32(_loc10_ + 4));
                           _loc14_ = _loc7_ + 1;
                           _loc13_ = _loc12_;
                           _loc12_ = _loc10_;
                           _loc7_ = int(_loc14_);
                           _loc10_ = int(_loc14_);
                        }
                        _loc17_ = _loc13_;
                        _loc20_ = _loc7_;
                        _loc7_ = int(_loc19_ + 8);
                        _loc14_ = _loc18_ + 4;
                        _loc15_ = _loc15_ + 1;
                        _loc13_ = _loc7_;
                        _loc7_ = int(_loc17_);
                        _loc17_ = _loc20_;
                     }
                     _loc5_ = int(_loc7_);
                     if(_loc15_ != 255)
                     {
                        _loc7_ = int(_loc15_);
                        _loc10_ = int(_loc13_);
                        _loc2_ = int(_loc12_);
                     }
                     else
                     {
                        _loc5_ = 1;
                        _loc7_ = int(_loc15_);
                        _loc10_ = int(_loc13_);
                        _loc2_ = int(_loc12_);
                     }
                  }
                  _loc8_ = int(_loc10_);
                  if(_loc5_ != 0)
                  {
                     _loc5_ = 79;
                     _loc10_ = 103;
                     _loc11_ = 83;
                     si8(_loc5_,_loc1_ + 40);
                     si8(_loc10_,_loc1_ + 41);
                     si8(_loc10_,_loc1_ + 42);
                     si8(_loc11_,_loc1_ + 43);
                     _loc5_ = 0;
                     si8(_loc5_,_loc1_ + 44);
                     si8(_loc5_,_loc1_ + 45);
                     _loc5_ = int(li32(_loc1_ + 16));
                     _loc10_ = int(li32(_loc5_));
                     _loc11_ = int(_loc1_ + 45);
                     _loc12_ = _loc1_ + 16;
                     _loc13_ = _loc1_ + 40;
                     _loc10_ = _loc10_ & 256;
                     if(_loc10_ != 0)
                     {
                        _loc10_ = 0;
                     }
                     else
                     {
                        _loc10_ = 1;
                        si8(_loc10_,_loc11_);
                     }
                     _loc14_ = li32(_loc9_);
                     if(_loc14_ == 0)
                     {
                        _loc10_ = _loc10_ | 2;
                        si8(_loc10_,_loc11_);
                     }
                     _loc14_ = li32(_loc1_ + 328);
                     if(_loc14_ != 0)
                     {
                        _loc14_ = li32(_loc3_);
                        if(_loc14_ == _loc7_)
                        {
                           _loc10_ = _loc10_ | 4;
                           si8(_loc10_,_loc11_);
                        }
                     }
                     _loc10_ = 1;
                     si32(_loc10_,_loc9_);
                     _loc9_ = 0;
                     while(true)
                     {
                        _loc10_ = int(_loc9_ + 6);
                        if(_loc10_ >= 14)
                        {
                           break;
                        }
                        _loc10_ = int(_loc8_ >>> 8);
                        _loc11_ = _loc2_ << 24;
                        _loc14_ = _loc6_ + _loc9_;
                        si8(_loc8_,_loc14_ + 46);
                        _loc2_ = _loc2_ >> 8;
                        _loc8_ = _loc10_ | _loc11_;
                        _loc9_ = int(_loc9_ + 1);
                     }
                     _loc2_ = 0;
                     _loc8_ = int(li32(_loc1_ + 336));
                     while(true)
                     {
                        _loc9_ = int(_loc2_);
                        _loc2_ = int(_loc8_);
                        _loc8_ = int(_loc9_ + 14);
                        if(_loc8_ >= 18)
                        {
                           break;
                        }
                        _loc8_ = int(_loc6_ + _loc9_);
                        si8(_loc2_,_loc8_ + 54);
                        _loc8_ = int(_loc9_ + 1);
                        _loc9_ = _loc2_ >> 8;
                        _loc2_ = int(_loc8_);
                        _loc8_ = int(_loc9_);
                     }
                     _loc2_ = int(li32(_loc1_ + 340));
                     _loc8_ = int(_loc1_ + 340);
                     if(_loc2_ == -1)
                     {
                        _loc2_ = 0;
                        si32(_loc2_,_loc8_);
                     }
                     _loc9_ = 0;
                     _loc10_ = int(_loc2_ + 1);
                     si32(_loc10_,_loc8_);
                     _loc8_ = int(_loc9_);
                     while(true)
                     {
                        _loc9_ = int(_loc8_ + 18);
                        if(_loc9_ >= 22)
                        {
                           break;
                        }
                        _loc9_ = int(_loc6_ + _loc8_);
                        si8(_loc2_,_loc9_ + 58);
                        _loc8_ = int(_loc8_ + 1);
                        _loc2_ = _loc2_ >> 8;
                     }
                     _loc2_ = 0;
                     si8(_loc2_,_loc1_ + 62);
                     si8(_loc2_,_loc1_ + 63);
                     si8(_loc2_,_loc1_ + 64);
                     si8(_loc2_,_loc1_ + 65);
                     si8(_loc7_,_loc1_ + 66);
                     _loc8_ = int(_loc2_);
                     while(true)
                     {
                        _loc9_ = int(_loc2_);
                        _loc2_ = int(_loc5_);
                        if(_loc8_ >= _loc7_)
                        {
                           break;
                        }
                        _loc2_ = int(li32(_loc2_));
                        _loc10_ = int(_loc6_ + _loc8_);
                        _loc11_ = _loc2_ & 255;
                        si8(_loc2_,_loc10_ + 67);
                        _loc2_ = int(_loc5_ + 4);
                        _loc8_ = int(_loc8_ + 1);
                        _loc9_ = int(_loc11_ + _loc9_);
                        _loc5_ = int(_loc2_);
                        _loc2_ = int(_loc9_);
                     }
                     si32(_loc13_,_loc4_);
                     _loc2_ = int(_loc7_ + 27);
                     si32(_loc2_,_loc1_ + 324);
                     si32(_loc2_,_loc4_ + 4);
                     _loc2_ = int(li32(_loc1_));
                     _loc5_ = int(li32(_loc1_ + 12));
                     _loc2_ = int(_loc2_ + _loc5_);
                     si32(_loc2_,_loc4_ + 8);
                     si32(_loc9_,_loc4_ + 12);
                     _loc2_ = int(li32(_loc3_));
                     _loc2_ = int(_loc2_ - _loc7_);
                     si32(_loc2_,_loc3_);
                     _loc5_ = int(li32(_loc12_));
                     _loc6_ = _loc7_ << 2;
                     _loc6_ = int(_loc5_ + _loc6_);
                     _loc2_ = _loc2_ << 2;
                     memmove(_loc5_,_loc6_,_loc2_);
                     _loc2_ = int(li32(_loc3_));
                     _loc3_ = li32(_loc1_ + 20);
                     _loc5_ = _loc7_ << 3;
                     _loc5_ = int(_loc3_ + _loc5_);
                     _loc2_ = _loc2_ << 3;
                     memmove(_loc3_,_loc5_,_loc2_);
                     _loc2_ = int(li32(_loc1_ + 12));
                     _loc2_ = int(_loc2_ + _loc9_);
                     si32(_loc2_,_loc1_ + 12);
                     _loc1_ = _loc4_ + 12;
                     _loc2_ = int(_loc4_ + 8);
                     _loc3_ = _loc4_ + 4;
                     _loc5_ = int(_loc4_);
                     if(_loc4_ == 0)
                     {
                        _loc1_ = 1;
                     }
                     else
                     {
                        _loc4_ = 0;
                        _loc6_ = int(li32(_loc5_));
                        si8(_loc4_,_loc6_ + 22);
                        _loc6_ = int(li32(_loc5_));
                        si8(_loc4_,_loc6_ + 23);
                        _loc6_ = int(li32(_loc5_));
                        si8(_loc4_,_loc6_ + 24);
                        _loc6_ = int(li32(_loc5_));
                        si8(_loc4_,_loc6_ + 25);
                        _loc3_ = li32(_loc3_);
                        _loc6_ = int(_loc4_);
                        while(_loc3_ > _loc6_)
                        {
                           _loc7_ = int(FSM_ogg_stream_flush_i);
                           _loc8_ = int(li32(_loc5_));
                           _loc8_ = int(_loc8_ + _loc6_);
                           _loc8_ = int(li8(_loc8_));
                           _loc9_ = int(_loc4_ >>> 24);
                           _loc8_ = _loc9_ ^ _loc8_;
                           _loc8_ = _loc8_ << 2;
                           _loc7_ = int(_loc7_ + _loc8_);
                           _loc7_ = int(li32(_loc7_));
                           _loc4_ = _loc4_ << 8;
                           _loc6_ = int(_loc6_ + 1);
                           _loc4_ = _loc4_ ^ _loc7_;
                        }
                        _loc3_ = 0;
                        _loc1_ = li32(_loc1_);
                        while(_loc1_ > _loc3_)
                        {
                           _loc6_ = int(FSM_ogg_stream_flush_i);
                           _loc7_ = int(li32(_loc2_));
                           _loc7_ = int(_loc7_ + _loc3_);
                           _loc7_ = int(li8(_loc7_));
                           _loc8_ = int(_loc4_ >>> 24);
                           _loc7_ = _loc8_ ^ _loc7_;
                           _loc7_ = _loc7_ << 2;
                           _loc6_ = int(_loc6_ + _loc7_);
                           _loc6_ = int(li32(_loc6_));
                           _loc4_ = _loc4_ << 8;
                           _loc3_ = _loc3_ + 1;
                           _loc4_ = _loc4_ ^ _loc6_;
                        }
                        _loc1_ = 1;
                        _loc2_ = int(li32(_loc5_));
                        si8(_loc4_,_loc2_ + 22);
                        _loc2_ = int(li32(_loc5_));
                        _loc3_ = _loc4_ >>> 8;
                        si8(_loc3_,_loc2_ + 23);
                        _loc2_ = int(li32(_loc5_));
                        _loc3_ = _loc4_ >>> 16;
                        si8(_loc3_,_loc2_ + 24);
                        _loc2_ = int(li32(_loc5_));
                        _loc3_ = _loc4_ >>> 24;
                        si8(_loc3_,_loc2_ + 25);
                     }
                  }
                  addr1136:
                  FSM_ogg_stream_flush_i.eax = _loc1_;
                  FSM_ogg_stream_flush_i.esp = FSM_ogg_stream_flush_i.ebp;
                  FSM_ogg_stream_flush_i.ebp = li32(FSM_ogg_stream_flush_i.esp);
                  FSM_ogg_stream_flush_i.esp = FSM_ogg_stream_flush_i.esp + 4;
                  FSM_ogg_stream_flush_i.esp = FSM_ogg_stream_flush_i.esp + 4;
                  return;
               }
            }
         }
         _loc1_ = 0;
         §§goto(addr1136);
      }
   }
}
