package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.lf32;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.sf32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_accumulate_fit extends Machine
   {
       
      
      public function FSM_accumulate_fit()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = 0;
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
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:int = 0;
         var _loc26_:int = 0;
         var _loc27_:Number = NaN;
         var _loc28_:Number = NaN;
         var _loc29_:Number = NaN;
         FSM_accumulate_fit.esp = FSM_accumulate_fit.esp - 4;
         si32(FSM_accumulate_fit.ebp,FSM_accumulate_fit.esp);
         FSM_accumulate_fit.ebp = FSM_accumulate_fit.esp;
         FSM_accumulate_fit.esp = FSM_accumulate_fit.esp - 0;
         _loc1_ = 0;
         _loc2_ = li32(FSM_accumulate_fit.ebp + 24);
         _loc3_ = _loc2_;
         _loc4_ = _loc1_;
         _loc5_ = 56;
         _loc6_ = li32(FSM_accumulate_fit.ebp + 16);
         memset(_loc3_,_loc4_,_loc5_);
         _loc3_ = li32(FSM_accumulate_fit.ebp + 28);
         _loc4_ = li32(FSM_accumulate_fit.ebp + 32);
         si32(_loc6_,_loc2_);
         _loc5_ = int(li32(FSM_accumulate_fit.ebp + 20));
         _loc7_ = _loc3_ + -1;
         si32(_loc5_,_loc2_ + 4);
         _loc8_ = li32(FSM_accumulate_fit.ebp + 12);
         _loc9_ = li32(FSM_accumulate_fit.ebp + 8);
         _loc3_ = _loc5_ < _loc3_?int(_loc5_):int(_loc7_);
         _loc5_ = _loc6_ << 2;
         _loc4_ = _loc4_ + 1112;
         _loc7_ = _loc1_;
         _loc10_ = _loc1_;
         _loc11_ = _loc1_;
         _loc12_ = _loc1_;
         _loc13_ = _loc1_;
         _loc14_ = _loc1_;
         _loc15_ = _loc1_;
         _loc16_ = _loc1_;
         _loc17_ = _loc1_;
         _loc18_ = _loc1_;
         _loc19_ = _loc1_;
         while(true)
         {
            _loc22_ = _loc5_;
            _loc25_ = _loc6_;
            _loc23_ = _loc7_;
            _loc24_ = _loc10_;
            _loc20_ = _loc11_;
            _loc21_ = _loc12_;
            _loc6_ = _loc13_;
            _loc12_ = _loc14_;
            _loc11_ = _loc15_;
            _loc10_ = _loc16_;
            _loc13_ = _loc17_;
            _loc5_ = int(_loc18_);
            _loc7_ = _loc19_;
            if(_loc25_ > _loc3_)
            {
               break;
            }
            _loc14_ = _loc9_ + _loc22_;
            _loc27_ = lf32(_loc14_);
            FSM_accumulate_fit.esp = FSM_accumulate_fit.esp - 4;
            sf32(_loc27_,FSM_accumulate_fit.esp);
            FSM_accumulate_fit.esp = FSM_accumulate_fit.esp - 4;
            FSM_accumulate_fit.start();
            _loc14_ = FSM_accumulate_fit.eax;
            FSM_accumulate_fit.esp = FSM_accumulate_fit.esp + 4;
            if(_loc14_ == 0)
            {
               _loc14_ = _loc23_;
               _loc15_ = _loc24_;
               _loc16_ = _loc20_;
               _loc17_ = _loc21_;
            }
            else
            {
               _loc15_ = _loc8_ + _loc22_;
               _loc28_ = lf32(_loc15_);
               _loc29_ = lf32(_loc4_);
               _loc28_ = _loc28_ + _loc29_;
               _loc28_ = _loc28_;
               _loc27_ = _loc27_;
               _loc28_ = _loc28_;
               if(_loc28_ >= _loc27_)
               {
                  _loc15_ = _loc25_ * _loc14_;
                  _loc16_ = _loc14_ * _loc14_;
                  _loc17_ = _loc25_ * _loc25_;
                  _loc18_ = _loc21_ + _loc25_;
                  _loc12_ = _loc12_ + 1;
                  _loc6_ = _loc15_ + _loc6_;
                  _loc15_ = _loc16_ + _loc23_;
                  _loc16_ = _loc17_ + _loc24_;
                  _loc17_ = _loc20_ + _loc14_;
                  _loc14_ = _loc15_;
                  _loc15_ = _loc16_;
                  _loc16_ = _loc17_;
                  _loc17_ = _loc18_;
               }
               else
               {
                  _loc15_ = _loc25_ * _loc14_;
                  _loc16_ = _loc14_ * _loc14_;
                  _loc17_ = _loc25_ * _loc25_;
                  _loc11_ = _loc11_ + _loc25_;
                  _loc1_ = _loc1_ + 1;
                  _loc7_ = _loc15_ + _loc7_;
                  _loc5_ = int(_loc16_ + _loc5_);
                  _loc13_ = _loc17_ + _loc13_;
                  _loc10_ = _loc10_ + _loc14_;
                  _loc14_ = _loc23_;
                  _loc15_ = _loc24_;
                  _loc16_ = _loc20_;
                  _loc17_ = _loc21_;
               }
            }
            _loc18_ = _loc6_;
            _loc19_ = _loc12_;
            _loc20_ = _loc11_;
            _loc21_ = _loc10_;
            _loc23_ = _loc13_;
            _loc24_ = _loc5_;
            _loc26_ = _loc7_;
            _loc5_ = int(_loc22_ + 4);
            _loc6_ = _loc25_ + 1;
            _loc7_ = _loc14_;
            _loc10_ = _loc15_;
            _loc11_ = _loc16_;
            _loc12_ = _loc17_;
            _loc13_ = _loc18_;
            _loc14_ = _loc19_;
            _loc15_ = _loc20_;
            _loc16_ = _loc21_;
            _loc17_ = _loc23_;
            _loc18_ = _loc24_;
            _loc19_ = _loc26_;
         }
         si32(_loc21_,_loc2_ + 8);
         si32(_loc20_,_loc2_ + 12);
         si32(_loc24_,_loc2_ + 16);
         si32(_loc23_,_loc2_ + 20);
         si32(_loc6_,_loc2_ + 24);
         si32(_loc12_,_loc2_ + 28);
         si32(_loc11_,_loc2_ + 32);
         si32(_loc10_,_loc2_ + 36);
         si32(_loc13_,_loc2_ + 40);
         si32(_loc5_,_loc2_ + 44);
         si32(_loc7_,_loc2_ + 48);
         si32(_loc1_,_loc2_ + 52);
         FSM_accumulate_fit.eax = _loc12_;
         FSM_accumulate_fit.esp = FSM_accumulate_fit.ebp;
         FSM_accumulate_fit.ebp = li32(FSM_accumulate_fit.esp);
         FSM_accumulate_fit.esp = FSM_accumulate_fit.esp + 4;
         FSM_accumulate_fit.esp = FSM_accumulate_fit.esp + 4;
      }
   }
}
