package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.lf32;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.sf32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_dradf2 extends Machine
   {
       
      
      public function FSM_dradf2()
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
         var _loc8_:* = 0;
         var _loc9_:* = 0;
         var _loc10_:* = 0;
         var _loc11_:int = 0;
         var _loc12_:* = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc24_:Number = NaN;
         var _loc25_:Number = NaN;
         var _loc26_:Number = NaN;
         FSM_dradf2.esp = FSM_dradf2.esp - 4;
         si32(FSM_dradf2.ebp,FSM_dradf2.esp);
         FSM_dradf2.ebp = FSM_dradf2.esp;
         FSM_dradf2.esp = FSM_dradf2.esp - 0;
         _loc1_ = 0;
         _loc2_ = li32(FSM_dradf2.ebp + 8);
         _loc3_ = li32(FSM_dradf2.ebp + 12);
         _loc4_ = int(_loc2_ * _loc3_);
         _loc5_ = li32(FSM_dradf2.ebp + 16);
         _loc6_ = li32(FSM_dradf2.ebp + 20);
         _loc7_ = li32(FSM_dradf2.ebp + 24);
         _loc8_ = _loc2_ << 3;
         _loc9_ = _loc2_ << 2;
         _loc4_ = _loc4_ << 2;
         _loc10_ = _loc2_ << 1;
         _loc10_ = int(_loc3_ * _loc2_);
         _loc11_ = _loc5_;
         _loc12_ = int(_loc11_);
         _loc13_ = _loc6_;
         while(true)
         {
            _loc15_ = _loc13_;
            _loc14_ = _loc1_;
            _loc1_ = int(_loc15_);
            _loc13_ = _loc12_;
            if(_loc14_ >= _loc3_)
            {
               break;
            }
            _loc16_ = _loc4_ + _loc12_;
            _loc21_ = lf32(_loc13_);
            _loc22_ = lf32(_loc16_);
            _loc21_ = _loc21_ + _loc22_;
            _loc21_ = _loc21_;
            sf32(_loc21_,_loc1_);
            _loc21_ = lf32(_loc13_);
            _loc22_ = lf32(_loc16_);
            _loc21_ = _loc21_ - _loc22_;
            _loc21_ = _loc21_;
            _loc1_ = int(_loc8_ + _loc15_);
            sf32(_loc21_,_loc1_ + -4);
            _loc12_ = int(_loc9_ + _loc12_);
            _loc14_ = _loc14_ + 1;
            _loc13_ = _loc1_;
            _loc1_ = int(_loc14_);
         }
         if(_loc2_ >= 2)
         {
            if(_loc2_ != 2)
            {
               _loc1_ = 0;
               _loc4_ = int(_loc3_ * _loc2_);
               _loc8_ = _loc2_ << 3;
               _loc9_ = _loc2_ << 2;
               _loc4_ = _loc4_ << 2;
               _loc12_ = int(_loc11_);
               _loc13_ = _loc6_;
               _loc14_ = _loc1_;
               while(true)
               {
                  _loc15_ = _loc12_;
                  _loc12_ = int(_loc14_);
                  if(_loc12_ >= _loc3_)
                  {
                     break;
                  }
                  _loc14_ = 2;
                  _loc16_ = 0;
                  _loc17_ = _loc8_ + _loc13_;
                  _loc18_ = _loc4_ + _loc15_;
                  while(_loc14_ < _loc2_)
                  {
                     _loc19_ = _loc18_ + _loc16_;
                     _loc20_ = _loc7_ + _loc16_;
                     _loc21_ = lf32(_loc20_);
                     _loc22_ = lf32(_loc19_ + 4);
                     _loc23_ = lf32(_loc20_ + 4);
                     _loc24_ = lf32(_loc19_ + 8);
                     _loc25_ = _loc21_ * _loc24_;
                     _loc26_ = _loc23_ * _loc22_;
                     _loc25_ = _loc25_;
                     _loc26_ = _loc26_;
                     _loc26_ = _loc26_;
                     _loc25_ = _loc25_;
                     _loc25_ = _loc25_ - _loc26_;
                     _loc25_ = _loc25_;
                     _loc19_ = _loc15_ + _loc16_;
                     _loc26_ = lf32(_loc19_ + 8);
                     _loc25_ = _loc25_;
                     _loc26_ = _loc26_ + _loc25_;
                     _loc26_ = _loc26_;
                     _loc20_ = _loc13_ + _loc16_;
                     sf32(_loc26_,_loc20_ + 8);
                     _loc21_ = _loc21_ * _loc22_;
                     _loc22_ = _loc23_ * _loc24_;
                     _loc23_ = lf32(_loc19_ + 8);
                     _loc21_ = _loc21_;
                     _loc22_ = _loc22_;
                     _loc23_ = _loc25_ - _loc23_;
                     _loc22_ = _loc22_;
                     _loc21_ = _loc21_;
                     _loc21_ = _loc21_ + _loc22_;
                     _loc22_ = _loc23_;
                     sf32(_loc22_,_loc17_ + -8);
                     _loc21_ = _loc21_;
                     _loc22_ = lf32(_loc19_ + 4);
                     _loc21_ = _loc21_;
                     _loc22_ = _loc22_ + _loc21_;
                     _loc22_ = _loc22_;
                     sf32(_loc22_,_loc20_ + 4);
                     _loc22_ = lf32(_loc19_ + 4);
                     _loc21_ = _loc22_ - _loc21_;
                     _loc21_ = _loc21_;
                     sf32(_loc21_,_loc17_ + -12);
                     _loc16_ = _loc16_ + 8;
                     _loc14_ = _loc14_ + 2;
                     _loc17_ = _loc17_ + -8;
                  }
                  _loc14_ = _loc9_ + _loc15_;
                  _loc13_ = _loc8_ + _loc13_;
                  _loc15_ = _loc12_ + 1;
                  _loc1_ = int(_loc1_ + _loc2_);
                  _loc12_ = int(_loc14_);
                  _loc14_ = _loc15_;
               }
               _loc1_ = int(_loc2_ >>> 31);
               _loc1_ = int(_loc2_ + _loc1_);
               _loc1_ = _loc1_ & -2;
               _loc1_ = int(_loc2_ - _loc1_);
               if(_loc1_ != 1)
               {
               }
            }
            _loc1_ = 0;
            _loc4_ = _loc2_ << 2;
            _loc7_ = _loc11_ + _loc4_;
            _loc8_ = _loc2_ << 3;
            _loc7_ = _loc7_ + -4;
            _loc6_ = _loc6_ + _loc4_;
            _loc9_ = int(_loc2_ + -1);
            while(true)
            {
               _loc9_ = int(_loc9_ + _loc10_);
               _loc11_ = _loc6_;
               _loc10_ = int(_loc7_);
               if(_loc1_ >= _loc3_)
               {
                  break;
               }
               _loc12_ = _loc9_ << 2;
               _loc12_ = int(_loc5_ + _loc12_);
               _loc21_ = lf32(_loc12_);
               _loc21_ = -_loc21_;
               _loc21_ = _loc21_;
               sf32(_loc21_,_loc11_);
               _loc21_ = lf32(_loc10_);
               sf32(_loc21_,_loc6_ + -4);
               _loc7_ = _loc4_ + _loc7_;
               _loc6_ = _loc8_ + _loc6_;
               _loc1_ = int(_loc1_ + 1);
               _loc10_ = int(_loc2_);
            }
         }
         FSM_dradf2.esp = FSM_dradf2.ebp;
         FSM_dradf2.ebp = li32(FSM_dradf2.esp);
         FSM_dradf2.esp = FSM_dradf2.esp + 4;
         FSM_dradf2.esp = FSM_dradf2.esp + 4;
      }
   }
}
