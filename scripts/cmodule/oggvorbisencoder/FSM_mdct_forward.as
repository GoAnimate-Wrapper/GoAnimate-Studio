package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.lf32;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.sf32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_mdct_forward extends Machine
   {
       
      
      public function FSM_mdct_forward()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:* = 0;
         var _loc2_:int = 0;
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         var _loc5_:* = 0;
         var _loc6_:int = 0;
         var _loc7_:* = 0;
         var _loc8_:int = 0;
         var _loc9_:* = 0;
         var _loc10_:* = 0;
         var _loc11_:* = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:* = 0;
         var _loc15_:* = 0;
         var _loc16_:* = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:* = 0;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc24_:Number = NaN;
         var _loc25_:Number = NaN;
         FSM_mdct_forward.esp = FSM_mdct_forward.esp - 4;
         si32(FSM_mdct_forward.ebp,FSM_mdct_forward.esp);
         FSM_mdct_forward.ebp = FSM_mdct_forward.esp;
         FSM_mdct_forward.esp = FSM_mdct_forward.esp - 0;
         _loc1_ = 0;
         _loc2_ = li32(FSM_mdct_forward.ebp + 8);
         _loc3_ = int(li32(_loc2_));
         _loc4_ = _loc3_ >> 1;
         _loc5_ = _loc3_ >> 2;
         _loc6_ = FSM_mdct_forward.esp;
         _loc7_ = _loc3_ << 2;
         _loc6_ = _loc6_ - _loc7_;
         _loc7_ = int(_loc4_ + _loc5_);
         FSM_mdct_forward.esp = _loc6_;
         _loc8_ = li32(FSM_mdct_forward.ebp + 12);
         _loc7_ = _loc7_ << 2;
         _loc9_ = int(li32(_loc2_ + 8));
         _loc10_ = _loc4_ << 2;
         _loc11_ = int(_loc7_ + _loc8_);
         _loc12_ = _loc6_ + _loc10_;
         _loc13_ = li32(FSM_mdct_forward.ebp + 16);
         _loc11_ = int(_loc11_ + 4);
         _loc9_ = int(_loc9_ + _loc10_);
         _loc10_ = int(_loc2_ + 8);
         _loc7_ = int(_loc8_ + _loc7_);
         _loc14_ = _loc3_ >> 3;
         _loc15_ = int(_loc12_);
         _loc16_ = int(_loc6_);
         _loc17_ = _loc13_;
         _loc18_ = _loc1_;
         while(true)
         {
            _loc20_ = _loc15_;
            _loc19_ = int(_loc18_);
            _loc18_ = _loc1_;
            _loc15_ = int(_loc7_);
            _loc7_ = int(_loc9_);
            _loc1_ = int(_loc20_);
            if(_loc19_ >= _loc14_)
            {
               break;
            }
            _loc22_ = lf32(_loc15_ + -8);
            _loc23_ = lf32(_loc11_);
            _loc24_ = lf32(_loc15_ + -16);
            _loc25_ = lf32(_loc11_ + 8);
            _loc24_ = _loc24_ + _loc25_;
            _loc22_ = _loc22_ + _loc23_;
            _loc23_ = _loc24_;
            _loc22_ = _loc22_;
            _loc24_ = lf32(_loc7_ + -4);
            _loc25_ = lf32(_loc7_ + -8);
            _loc23_ = _loc23_;
            _loc22_ = _loc22_;
            _loc24_ = _loc24_ * _loc23_;
            _loc25_ = _loc25_ * _loc22_;
            _loc24_ = _loc24_;
            _loc25_ = _loc25_;
            _loc25_ = _loc25_;
            _loc24_ = _loc24_;
            _loc24_ = _loc24_ + _loc25_;
            _loc24_ = _loc24_;
            sf32(_loc24_,_loc1_);
            _loc24_ = lf32(_loc7_ + -8);
            _loc25_ = lf32(_loc7_ + -4);
            _loc23_ = _loc24_ * _loc23_;
            _loc22_ = _loc25_ * _loc22_;
            _loc23_ = _loc23_;
            _loc22_ = _loc22_;
            _loc22_ = _loc22_;
            _loc23_ = _loc23_;
            _loc22_ = _loc23_ - _loc22_;
            _loc22_ = _loc22_;
            sf32(_loc22_,_loc20_ + 4);
            _loc1_ = int(_loc20_ + 8);
            _loc9_ = int(_loc19_ + 2);
            _loc19_ = int(_loc18_ + 1);
            _loc11_ = int(_loc11_ + 16);
            _loc20_ = _loc7_ + -8;
            _loc7_ = int(_loc15_ + -16);
            _loc15_ = int(_loc1_);
            _loc18_ = _loc9_;
            _loc1_ = int(_loc19_);
            _loc9_ = int(_loc20_);
         }
         _loc1_ = 0;
         _loc9_ = _loc4_ << 2;
         _loc11_ = _loc18_ << 3;
         _loc9_ = int(_loc16_ + _loc9_);
         _loc19_ = _loc18_ << 1;
         _loc9_ = int(_loc11_ + _loc9_);
         _loc11_ = int(_loc4_ - _loc14_);
         _loc14_ = int(_loc8_ + 4);
         while(true)
         {
            _loc21_ = _loc9_;
            _loc20_ = _loc19_;
            _loc19_ = int(_loc1_);
            _loc9_ = int(_loc14_);
            _loc1_ = int(_loc21_);
            if(_loc11_ <= _loc20_)
            {
               break;
            }
            _loc22_ = lf32(_loc15_ + -8);
            _loc23_ = lf32(_loc9_);
            _loc24_ = lf32(_loc15_ + -16);
            _loc25_ = lf32(_loc9_ + 8);
            _loc24_ = _loc24_ - _loc25_;
            _loc22_ = _loc22_ - _loc23_;
            _loc23_ = _loc24_;
            _loc22_ = _loc22_;
            _loc24_ = lf32(_loc7_ + -4);
            _loc25_ = lf32(_loc7_ + -8);
            _loc22_ = _loc22_;
            _loc23_ = _loc23_;
            _loc25_ = _loc25_ * _loc22_;
            _loc24_ = _loc24_ * _loc23_;
            _loc25_ = _loc25_;
            _loc24_ = _loc24_;
            _loc25_ = _loc25_;
            _loc24_ = _loc24_;
            _loc24_ = _loc24_ + _loc25_;
            _loc24_ = _loc24_;
            sf32(_loc24_,_loc1_);
            _loc24_ = lf32(_loc7_ + -8);
            _loc25_ = lf32(_loc7_ + -4);
            _loc23_ = _loc24_ * _loc23_;
            _loc22_ = _loc25_ * _loc22_;
            _loc23_ = _loc23_;
            _loc22_ = _loc22_;
            _loc22_ = _loc22_;
            _loc23_ = _loc23_;
            _loc22_ = _loc23_ - _loc22_;
            _loc22_ = _loc22_;
            sf32(_loc22_,_loc21_ + 4);
            _loc1_ = int(_loc21_ + 8);
            _loc14_ = int(_loc20_ + 2);
            _loc20_ = _loc19_ + 1;
            _loc21_ = _loc9_ + 16;
            _loc15_ = int(_loc15_ + -16);
            _loc7_ = int(_loc7_ + -8);
            _loc9_ = int(_loc1_);
            _loc19_ = int(_loc14_);
            _loc1_ = int(_loc20_);
            _loc14_ = int(_loc21_);
         }
         _loc1_ = _loc4_ << 2;
         _loc11_ = _loc18_ << 3;
         _loc1_ = int(_loc16_ + _loc1_);
         _loc14_ = _loc18_ << 1;
         _loc15_ = _loc19_ << 1;
         _loc16_ = _loc19_ << 3;
         _loc1_ = int(_loc11_ + _loc1_);
         _loc3_ = _loc3_ << 2;
         _loc1_ = int(_loc16_ + _loc1_);
         _loc11_ = int(_loc15_ + _loc14_);
         _loc3_ = int(_loc8_ + _loc3_);
         _loc8_ = _loc11_;
         while(true)
         {
            _loc11_ = int(_loc1_);
            _loc1_ = int(_loc8_);
            _loc14_ = int(_loc3_);
            _loc8_ = _loc9_;
            _loc3_ = int(_loc7_);
            _loc7_ = int(_loc11_);
            if(_loc1_ >= _loc4_)
            {
               break;
            }
            _loc22_ = lf32(_loc14_ + -8);
            _loc23_ = lf32(_loc14_ + -16);
            _loc23_ = -_loc23_;
            _loc22_ = -_loc22_;
            _loc23_ = _loc23_;
            _loc22_ = _loc22_;
            _loc24_ = lf32(_loc8_);
            _loc22_ = _loc22_;
            _loc25_ = lf32(_loc8_ + 8);
            _loc23_ = _loc23_;
            _loc23_ = _loc23_ - _loc25_;
            _loc22_ = _loc22_ - _loc24_;
            _loc23_ = _loc23_;
            _loc22_ = _loc22_;
            _loc24_ = lf32(_loc3_ + -4);
            _loc25_ = lf32(_loc3_ + -8);
            _loc22_ = _loc22_;
            _loc23_ = _loc23_;
            _loc25_ = _loc25_ * _loc22_;
            _loc24_ = _loc24_ * _loc23_;
            _loc25_ = _loc25_;
            _loc24_ = _loc24_;
            _loc25_ = _loc25_;
            _loc24_ = _loc24_;
            _loc24_ = _loc24_ + _loc25_;
            _loc24_ = _loc24_;
            sf32(_loc24_,_loc7_);
            _loc24_ = lf32(_loc3_ + -8);
            _loc25_ = lf32(_loc3_ + -4);
            _loc23_ = _loc24_ * _loc23_;
            _loc22_ = _loc25_ * _loc22_;
            _loc23_ = _loc23_;
            _loc22_ = _loc22_;
            _loc22_ = _loc22_;
            _loc23_ = _loc23_;
            _loc22_ = _loc23_ - _loc22_;
            _loc22_ = _loc22_;
            sf32(_loc22_,_loc11_ + 4);
            _loc7_ = int(_loc11_ + 8);
            _loc9_ = int(_loc1_ + 2);
            _loc11_ = int(_loc8_ + 16);
            _loc14_ = int(_loc14_ + -16);
            _loc15_ = int(_loc3_ + -8);
            _loc1_ = int(_loc7_);
            _loc8_ = _loc9_;
            _loc3_ = int(_loc14_);
            _loc9_ = int(_loc11_);
            _loc7_ = int(_loc15_);
         }
         _loc1_ = 0;
         FSM_mdct_forward.esp = FSM_mdct_forward.esp - 12;
         si32(_loc2_,FSM_mdct_forward.esp);
         si32(_loc12_,FSM_mdct_forward.esp + 4);
         si32(_loc4_,FSM_mdct_forward.esp + 8);
         FSM_mdct_forward.esp = FSM_mdct_forward.esp - 4;
         FSM_mdct_forward.start();
         FSM_mdct_forward.esp = FSM_mdct_forward.esp + 12;
         FSM_mdct_forward.esp = FSM_mdct_forward.esp - 8;
         si32(_loc2_,FSM_mdct_forward.esp);
         si32(_loc6_,FSM_mdct_forward.esp + 4);
         FSM_mdct_forward.esp = FSM_mdct_forward.esp - 4;
         FSM_mdct_forward.start();
         FSM_mdct_forward.esp = FSM_mdct_forward.esp + 8;
         _loc3_ = int(li32(_loc10_));
         _loc4_ = _loc4_ << 2;
         _loc2_ = _loc2_ + 16;
         _loc7_ = int(_loc13_ + _loc4_);
         _loc3_ = int(_loc3_ + _loc4_);
         _loc4_ = int(_loc17_);
         while(true)
         {
            _loc9_ = int(_loc4_);
            _loc8_ = _loc1_;
            _loc4_ = int(_loc7_);
            _loc1_ = int(_loc9_);
            if(_loc8_ >= _loc5_)
            {
               break;
            }
            _loc22_ = lf32(_loc6_);
            _loc23_ = lf32(_loc3_);
            _loc24_ = lf32(_loc6_ + 4);
            _loc25_ = lf32(_loc3_ + 4);
            _loc22_ = _loc22_ * _loc23_;
            _loc23_ = _loc24_ * _loc25_;
            _loc22_ = _loc22_;
            _loc23_ = _loc23_;
            _loc23_ = _loc23_;
            _loc22_ = _loc22_;
            _loc22_ = _loc22_ + _loc23_;
            _loc22_ = _loc22_;
            _loc23_ = lf32(_loc2_);
            _loc22_ = _loc22_;
            _loc22_ = _loc22_ * _loc23_;
            _loc22_ = _loc22_;
            sf32(_loc22_,_loc1_);
            _loc22_ = lf32(_loc6_);
            _loc23_ = lf32(_loc3_ + 4);
            _loc24_ = lf32(_loc6_ + 4);
            _loc25_ = lf32(_loc3_);
            _loc22_ = _loc22_ * _loc23_;
            _loc23_ = _loc24_ * _loc25_;
            _loc22_ = _loc22_;
            _loc23_ = _loc23_;
            _loc23_ = _loc23_;
            _loc22_ = _loc22_;
            _loc22_ = _loc22_ - _loc23_;
            _loc22_ = _loc22_;
            _loc23_ = lf32(_loc2_);
            _loc22_ = _loc22_;
            _loc22_ = _loc22_ * _loc23_;
            _loc22_ = _loc22_;
            sf32(_loc22_,_loc4_ + -4);
            _loc1_ = int(_loc9_ + 4);
            _loc7_ = int(_loc8_ + 1);
            _loc3_ = int(_loc3_ + 8);
            _loc6_ = _loc6_ + 8;
            _loc8_ = _loc4_ + -4;
            _loc4_ = int(_loc1_);
            _loc1_ = int(_loc7_);
            _loc7_ = int(_loc8_);
         }
         FSM_mdct_forward.esp = FSM_mdct_forward.ebp;
         FSM_mdct_forward.ebp = li32(FSM_mdct_forward.esp);
         FSM_mdct_forward.esp = FSM_mdct_forward.esp + 4;
         FSM_mdct_forward.esp = FSM_mdct_forward.esp + 4;
      }
   }
}
