package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.lf32;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.sf32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_floor1_inverse2 extends Machine
   {
       
      
      public function FSM_floor1_inverse2()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:* = 0;
         var _loc2_:int = 0;
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:* = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:* = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:* = 0;
         var _loc16_:int = 0;
         var _loc17_:* = 0;
         var _loc18_:* = 0;
         var _loc19_:* = 0;
         var _loc20_:* = 0;
         var _loc21_:* = 0;
         var _loc22_:int = 0;
         var _loc23_:* = 0;
         var _loc24_:Number = NaN;
         var _loc25_:Number = NaN;
         FSM_floor1_inverse2.esp = FSM_floor1_inverse2.esp - 4;
         si32(FSM_floor1_inverse2.ebp,FSM_floor1_inverse2.esp);
         FSM_floor1_inverse2.ebp = FSM_floor1_inverse2.esp;
         FSM_floor1_inverse2.esp = FSM_floor1_inverse2.esp - 0;
         _loc1_ = int(li32(FSM_floor1_inverse2.ebp + 8));
         _loc2_ = li32(_loc1_ + 64);
         _loc1_ = int(li32(_loc1_ + 28));
         _loc2_ = li32(_loc2_ + 4);
         _loc2_ = li32(_loc2_ + 28);
         _loc1_ = _loc1_ << 2;
         _loc1_ = int(_loc2_ + _loc1_);
         _loc1_ = int(li32(_loc1_));
         _loc2_ = _loc1_ >>> 31;
         _loc3_ = int(li32(FSM_floor1_inverse2.ebp + 12));
         _loc4_ = int(li32(_loc3_ + 1296));
         _loc1_ = int(_loc1_ + _loc2_);
         _loc2_ = li32(FSM_floor1_inverse2.ebp + 20);
         _loc1_ = _loc1_ >> 1;
         _loc5_ = li32(FSM_floor1_inverse2.ebp + 16);
         _loc6_ = _loc3_;
         _loc7_ = _loc2_;
         if(_loc5_ != 0)
         {
            _loc8_ = int(li32(_loc5_));
            _loc9_ = li32(_loc4_ + 832);
            _loc8_ = int(_loc8_ * _loc9_);
            _loc9_ = _loc4_ + 832;
            if(_loc8_ <= -1)
            {
               _loc8_ = 0;
            }
            else
            {
               _loc8_ = int(_loc8_ < 256?int(_loc8_):255);
            }
            _loc10_ = 0;
            _loc11_ = 1;
            _loc3_ = int(_loc3_ + 264);
            _loc6_ = _loc6_ + 1284;
            _loc12_ = int(_loc10_);
            while(true)
            {
               _loc13_ = _loc3_;
               _loc14_ = _loc11_;
               _loc11_ = _loc12_;
               _loc3_ = int(_loc8_);
               _loc12_ = int(li32(_loc6_));
               _loc8_ = int(_loc13_);
               if(_loc12_ <= _loc14_)
               {
                  break;
               }
               _loc8_ = int(li32(_loc8_));
               _loc12_ = _loc8_ << 2;
               _loc12_ = int(_loc5_ + _loc12_);
               _loc12_ = int(li32(_loc12_));
               _loc15_ = _loc12_ & 32767;
               if(_loc12_ != _loc15_)
               {
                  _loc8_ = int(_loc11_);
               }
               else
               {
                  _loc8_ = _loc8_ << 2;
                  _loc8_ = int(_loc4_ + _loc8_);
                  _loc11_ = li32(_loc8_ + 836);
                  _loc8_ = int(li32(_loc9_));
                  _loc8_ = int(_loc8_ * _loc15_);
                  if(_loc8_ <= -1)
                  {
                     _loc8_ = 0;
                  }
                  else
                  {
                     _loc8_ = int(_loc8_ < 256?int(_loc8_):255);
                  }
                  _loc12_ = int(_loc8_);
                  _loc8_ = int(_loc12_ - _loc3_);
                  _loc15_ = int(_loc11_ - _loc10_);
                  _loc16_ = _loc8_ / _loc15_;
                  _loc17_ = int(_loc16_ * _loc15_);
                  _loc18_ = _loc8_ >> 31;
                  _loc19_ = _loc17_ >> 31;
                  _loc20_ = int(_loc8_ + _loc18_);
                  _loc17_ = int(_loc17_ + _loc19_);
                  _loc18_ = _loc20_ ^ _loc18_;
                  _loc17_ = _loc17_ ^ _loc19_;
                  _loc8_ = int(_loc8_ < 0?-1:1);
                  _loc19_ = int(_loc1_ > _loc11_?int(_loc11_):int(_loc1_));
                  _loc17_ = int(_loc18_ - _loc17_);
                  if(_loc10_ < _loc19_)
                  {
                     _loc18_ = int(FSM_floor1_inverse2);
                     _loc20_ = _loc3_ << 2;
                     _loc21_ = _loc10_ << 2;
                     _loc18_ = int(_loc18_ + _loc20_);
                     _loc20_ = int(_loc2_ + _loc21_);
                     _loc24_ = lf32(_loc20_);
                     _loc25_ = lf32(_loc18_);
                     _loc24_ = _loc24_ * _loc25_;
                     _loc24_ = _loc24_;
                     sf32(_loc24_,_loc20_);
                  }
                  _loc18_ = 0;
                  _loc20_ = _loc10_ << 2;
                  _loc20_ = int(_loc7_ + _loc20_);
                  _loc20_ = int(_loc20_ + 4);
                  _loc10_ = _loc10_ + 1;
                  while(true)
                  {
                     _loc21_ = int(_loc3_);
                     _loc3_ = int(_loc20_);
                     if(_loc10_ >= _loc19_)
                     {
                        break;
                     }
                     _loc22_ = FSM_floor1_inverse2;
                     _loc23_ = int(_loc16_ + _loc8_);
                     _loc18_ = int(_loc18_ + _loc17_);
                     _loc23_ = int(_loc18_ < _loc15_?int(_loc16_):int(_loc23_));
                     _loc21_ = int(_loc21_ + _loc23_);
                     _loc23_ = _loc21_ << 2;
                     _loc22_ = _loc22_ + _loc23_;
                     _loc24_ = lf32(_loc3_);
                     _loc25_ = lf32(_loc22_);
                     _loc24_ = _loc24_ * _loc25_;
                     _loc22_ = _loc18_ - _loc15_;
                     _loc24_ = _loc24_;
                     sf32(_loc24_,_loc3_);
                     _loc18_ = int(_loc18_ < _loc15_?int(_loc18_):int(_loc22_));
                     _loc3_ = int(_loc20_ + 4);
                     _loc10_ = _loc10_ + 1;
                     _loc20_ = int(_loc3_);
                     _loc3_ = int(_loc21_);
                  }
                  _loc8_ = int(_loc11_);
                  _loc10_ = _loc11_;
                  _loc3_ = int(_loc12_);
               }
               _loc15_ = int(_loc3_);
               _loc3_ = int(_loc13_ + 4);
               _loc11_ = _loc14_ + 1;
               _loc12_ = int(_loc8_);
               _loc8_ = int(_loc15_);
            }
            _loc2_ = FSM_floor1_inverse2;
            _loc3_ = _loc3_ << 2;
            _loc4_ = _loc11_ << 2;
            _loc4_ = int(_loc7_ + _loc4_);
            _loc2_ = _loc2_ + _loc3_;
            _loc3_ = int(_loc4_);
            _loc4_ = int(_loc11_);
            while(true)
            {
               _loc5_ = _loc3_;
               _loc3_ = int(_loc5_);
               if(_loc4_ >= _loc1_)
               {
                  break;
               }
               _loc24_ = lf32(_loc3_);
               _loc25_ = lf32(_loc2_);
               _loc24_ = _loc24_ * _loc25_;
               _loc24_ = _loc24_;
               sf32(_loc24_,_loc3_);
               _loc3_ = int(_loc5_ + 4);
               _loc4_ = int(_loc4_ + 1);
            }
            _loc1_ = 1;
            FSM_floor1_inverse2.eax = _loc1_;
         }
         else
         {
            _loc3_ = 0;
            _loc1_ = _loc1_ << 2;
            memset(_loc2_,_loc3_,_loc1_);
            FSM_floor1_inverse2.eax = _loc3_;
         }
         FSM_floor1_inverse2.esp = FSM_floor1_inverse2.ebp;
         FSM_floor1_inverse2.ebp = li32(FSM_floor1_inverse2.esp);
         FSM_floor1_inverse2.esp = FSM_floor1_inverse2.esp + 4;
         FSM_floor1_inverse2.esp = FSM_floor1_inverse2.esp + 4;
      }
   }
}
