package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.lf32;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_fit_line extends Machine
   {
       
      
      public function FSM_fit_line()
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
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc24_:Number = NaN;
         var _loc25_:Number = NaN;
         var _loc26_:Number = NaN;
         var _loc27_:Number = NaN;
         var _loc28_:Number = NaN;
         var _loc29_:Number = NaN;
         var _loc30_:Number = NaN;
         var _loc31_:Number = NaN;
         var _loc32_:Number = NaN;
         var _loc33_:Number = NaN;
         FSM_fit_line.esp = FSM_fit_line.esp - 4;
         si32(FSM_fit_line.ebp,FSM_fit_line.esp);
         FSM_fit_line.ebp = FSM_fit_line.esp;
         FSM_fit_line.esp = FSM_fit_line.esp - 0;
         _loc19_ = 0;
         _loc1_ = li32(FSM_fit_line.ebp + 12);
         _loc2_ = li32(FSM_fit_line.ebp + 8);
         _loc3_ = _loc1_ * 56;
         _loc3_ = _loc3_ + _loc2_;
         _loc4_ = li32(FSM_fit_line.ebp + 24);
         _loc5_ = li32(_loc2_);
         _loc3_ = li32(_loc3_ + -52);
         _loc6_ = 0;
         _loc4_ = _loc4_ + 1108;
         _loc7_ = li32(FSM_fit_line.ebp + 16);
         _loc8_ = li32(FSM_fit_line.ebp + 20);
         _loc20_ = _loc19_;
         _loc21_ = _loc19_;
         _loc22_ = _loc19_;
         _loc23_ = _loc19_;
         while(true)
         {
            _loc25_ = _loc20_;
            _loc24_ = _loc21_;
            _loc21_ = _loc22_;
            _loc20_ = _loc23_;
            if(_loc6_ >= _loc1_)
            {
               break;
            }
            _loc9_ = li32(_loc2_ + 28);
            _loc10_ = li32(_loc2_ + 52);
            _loc11_ = _loc10_ + _loc9_;
            _loc22_ = Number(_loc11_);
            _loc23_ = lf32(_loc4_);
            _loc22_ = _loc22_;
            _loc22_ = _loc22_ * _loc23_;
            _loc11_ = _loc9_ + 1;
            _loc22_ = _loc22_;
            _loc23_ = Number(_loc11_);
            _loc23_ = _loc23_;
            _loc22_ = _loc22_;
            _loc22_ = _loc22_ / _loc23_;
            _loc22_ = _loc22_;
            _loc11_ = li32(_loc2_ + 8);
            _loc12_ = li32(_loc2_ + 12);
            _loc13_ = li32(_loc2_ + 16);
            _loc14_ = li32(_loc2_ + 24);
            _loc22_ = _loc22_;
            _loc15_ = li32(_loc2_ + 32);
            _loc16_ = li32(_loc2_ + 36);
            _loc17_ = li32(_loc2_ + 40);
            _loc18_ = li32(_loc2_ + 48);
            _loc23_ = Number(_loc9_);
            _loc22_ = _loc22_ + 1;
            _loc26_ = Number(_loc14_);
            _loc27_ = Number(_loc13_);
            _loc28_ = Number(_loc12_);
            _loc29_ = Number(_loc11_);
            _loc23_ = _loc23_ * _loc22_;
            _loc30_ = Number(_loc10_);
            _loc26_ = _loc26_ * _loc22_;
            _loc31_ = Number(_loc18_);
            _loc27_ = _loc27_ * _loc22_;
            _loc32_ = Number(_loc17_);
            _loc28_ = _loc28_ * _loc22_;
            _loc33_ = Number(_loc16_);
            _loc22_ = _loc29_ * _loc22_;
            _loc29_ = Number(_loc15_);
            _loc23_ = _loc30_ + _loc23_;
            _loc26_ = _loc31_ + _loc26_;
            _loc27_ = _loc32_ + _loc27_;
            _loc28_ = _loc33_ + _loc28_;
            _loc22_ = _loc29_ + _loc22_;
            _loc2_ = _loc2_ + 56;
            _loc6_ = _loc6_ + 1;
            _loc19_ = _loc23_ + _loc19_;
            _loc23_ = _loc26_ + _loc20_;
            _loc26_ = _loc27_ + _loc21_;
            _loc21_ = _loc28_ + _loc24_;
            _loc20_ = _loc22_ + _loc25_;
            _loc22_ = _loc26_;
         }
         _loc1_ = li32(_loc7_);
         if(_loc1_ > -1)
         {
            _loc2_ = _loc1_ * _loc5_;
            _loc4_ = _loc5_ * _loc5_;
            _loc22_ = Number(_loc2_);
            _loc23_ = Number(_loc4_);
            _loc26_ = Number(_loc1_);
            _loc27_ = Number(_loc5_);
            _loc19_ = _loc19_ + 1;
            _loc20_ = _loc22_ + _loc20_;
            _loc21_ = _loc23_ + _loc21_;
            _loc24_ = _loc26_ + _loc24_;
            _loc25_ = _loc27_ + _loc25_;
         }
         _loc22_ = _loc25_;
         _loc23_ = _loc24_;
         _loc1_ = li32(_loc8_);
         if(_loc1_ > -1)
         {
            _loc2_ = _loc1_ * _loc3_;
            _loc4_ = _loc3_ * _loc3_;
            _loc24_ = Number(_loc2_);
            _loc25_ = Number(_loc4_);
            _loc26_ = Number(_loc1_);
            _loc27_ = Number(_loc3_);
            _loc19_ = _loc19_ + 1;
            _loc20_ = _loc24_ + _loc20_;
            _loc21_ = _loc25_ + _loc21_;
            _loc23_ = _loc26_ + _loc23_;
            _loc22_ = _loc27_ + _loc22_;
         }
         _loc24_ = 0;
         _loc25_ = _loc22_ * _loc22_;
         _loc26_ = _loc19_ * _loc21_;
         _loc25_ = _loc26_ - _loc25_;
         if(_loc25_ > _loc24_)
         {
            _loc24_ = _loc22_ * _loc23_;
            _loc19_ = _loc19_ * _loc20_;
            _loc19_ = _loc19_ - _loc24_;
            _loc20_ = _loc20_ * _loc22_;
            _loc21_ = _loc23_ * _loc21_;
            _loc20_ = _loc21_ - _loc20_;
            _loc21_ = Number(_loc5_);
            _loc19_ = _loc19_ / _loc25_;
            _loc21_ = _loc21_ * _loc19_;
            _loc20_ = _loc20_ / _loc25_;
            _loc21_ = _loc21_ + _loc20_;
            _loc22_ = Number(_loc3_);
            _loc21_ = _loc21_ + 0.5;
            _loc22_ = _loc22_ * _loc19_;
            _loc19_ = _loc21_;
            _loc19_ = Math.floor(_loc19_);
            _loc20_ = _loc22_ + _loc20_;
            _loc1_ = int(_loc19_);
            si32(_loc1_,_loc7_);
            _loc19_ = _loc20_ + 0.5;
            _loc19_ = Math.floor(_loc19_);
            _loc1_ = int(_loc19_);
            si32(_loc1_,_loc8_);
            _loc1_ = li32(_loc7_);
            if(_loc1_ >= 1024)
            {
               _loc1_ = 1023;
               si32(_loc1_,_loc7_);
            }
            _loc1_ = li32(_loc8_);
            if(_loc1_ >= 1024)
            {
               _loc1_ = 1023;
               si32(_loc1_,_loc8_);
            }
            _loc1_ = li32(_loc7_);
            if(_loc1_ <= -1)
            {
               _loc1_ = 0;
               si32(_loc1_,_loc7_);
            }
            _loc7_ = li32(_loc8_);
            if(_loc7_ <= -1)
            {
               _loc7_ = 0;
               si32(_loc7_,_loc8_);
               FSM_fit_line.eax = _loc7_;
            }
            else
            {
               _loc1_ = 0;
            }
            addr792:
            FSM_fit_line.esp = FSM_fit_line.ebp;
            FSM_fit_line.ebp = li32(FSM_fit_line.esp);
            FSM_fit_line.esp = FSM_fit_line.esp + 4;
            FSM_fit_line.esp = FSM_fit_line.esp + 4;
            return;
         }
         _loc1_ = 0;
         si32(_loc1_,_loc7_);
         si32(_loc1_,_loc8_);
         _loc1_ = 1;
         FSM_fit_line.eax = _loc1_;
         §§goto(addr792);
      }
   }
}
