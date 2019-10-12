package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.lf32;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.sf32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_mdct_bitreverse extends Machine
   {
       
      
      public function FSM_mdct_bitreverse()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         var _loc4_:int = 0;
         var _loc5_:* = 0;
         var _loc6_:int = 0;
         var _loc7_:* = 0;
         var _loc8_:* = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         FSM_mdct_bitreverse.esp = FSM_mdct_bitreverse.esp - 4;
         si32(FSM_mdct_bitreverse.ebp,FSM_mdct_bitreverse.esp);
         FSM_mdct_bitreverse.ebp = FSM_mdct_bitreverse.esp;
         FSM_mdct_bitreverse.esp = FSM_mdct_bitreverse.esp - 0;
         _loc1_ = li32(FSM_mdct_bitreverse.ebp + 8);
         _loc2_ = int(li32(_loc1_));
         _loc3_ = _loc2_ >> 1;
         _loc4_ = li32(FSM_mdct_bitreverse.ebp + 12);
         _loc5_ = _loc3_ << 2;
         _loc6_ = li32(_loc1_ + 12);
         _loc1_ = li32(_loc1_ + 8);
         _loc2_ = _loc2_ << 2;
         _loc1_ = _loc1_ + _loc2_;
         _loc2_ = int(_loc4_ + _loc5_);
         _loc5_ = int(_loc4_);
         while(true)
         {
            _loc11_ = 0.5;
            _loc7_ = int(li32(_loc6_));
            _loc8_ = int(li32(_loc6_ + 4));
            _loc8_ = int(_loc3_ + _loc8_);
            _loc7_ = int(_loc3_ + _loc7_);
            _loc8_ = _loc8_ << 2;
            _loc7_ = _loc7_ << 2;
            _loc9_ = _loc7_ + _loc4_;
            _loc10_ = _loc8_ + _loc4_;
            _loc8_ = int(_loc4_ + _loc8_);
            _loc7_ = int(_loc4_ + _loc7_);
            _loc12_ = lf32(_loc9_ + 4);
            _loc13_ = lf32(_loc10_ + 4);
            _loc14_ = lf32(_loc7_);
            _loc15_ = lf32(_loc8_);
            _loc16_ = _loc14_ + _loc15_;
            _loc17_ = _loc12_ - _loc13_;
            _loc16_ = _loc16_;
            _loc17_ = _loc17_;
            _loc18_ = lf32(_loc1_);
            _loc19_ = lf32(_loc1_ + 4);
            _loc16_ = _loc16_;
            _loc17_ = _loc17_;
            _loc20_ = _loc18_ * _loc16_;
            _loc21_ = _loc19_ * _loc17_;
            _loc12_ = _loc12_ + _loc13_;
            _loc13_ = _loc20_;
            _loc20_ = _loc21_;
            _loc12_ = _loc12_;
            _loc11_ = _loc11_;
            _loc16_ = _loc19_ * _loc16_;
            _loc14_ = _loc14_ - _loc15_;
            _loc15_ = _loc18_ * _loc17_;
            _loc17_ = _loc20_;
            _loc13_ = _loc13_;
            _loc11_ = _loc11_;
            _loc12_ = _loc12_;
            _loc13_ = _loc13_ + _loc17_;
            _loc16_ = _loc16_;
            _loc14_ = _loc14_;
            _loc15_ = _loc15_;
            _loc12_ = _loc12_ * _loc11_;
            _loc13_ = _loc13_;
            _loc14_ = _loc14_;
            _loc12_ = _loc12_;
            _loc15_ = _loc15_;
            _loc16_ = _loc16_;
            _loc15_ = _loc16_ - _loc15_;
            _loc14_ = _loc14_ * _loc11_;
            _loc13_ = _loc13_;
            _loc12_ = _loc12_;
            _loc16_ = _loc12_ + _loc13_;
            _loc15_ = _loc15_;
            _loc14_ = _loc14_;
            _loc12_ = _loc12_ - _loc13_;
            _loc13_ = _loc16_;
            _loc14_ = _loc14_;
            _loc15_ = _loc15_;
            _loc16_ = _loc14_ + _loc15_;
            sf32(_loc13_,_loc5_);
            _loc12_ = _loc12_;
            _loc13_ = _loc15_ - _loc14_;
            sf32(_loc12_,_loc2_ + -8);
            _loc12_ = _loc16_;
            sf32(_loc12_,_loc5_ + 4);
            _loc12_ = _loc13_;
            sf32(_loc12_,_loc2_ + -4);
            _loc7_ = int(li32(_loc6_ + 8));
            _loc8_ = int(li32(_loc6_ + 12));
            _loc8_ = int(_loc3_ + _loc8_);
            _loc7_ = int(_loc3_ + _loc7_);
            _loc8_ = _loc8_ << 2;
            _loc7_ = _loc7_ << 2;
            _loc9_ = _loc7_ + _loc4_;
            _loc10_ = _loc8_ + _loc4_;
            _loc8_ = int(_loc4_ + _loc8_);
            _loc7_ = int(_loc4_ + _loc7_);
            _loc12_ = lf32(_loc9_ + 4);
            _loc13_ = lf32(_loc10_ + 4);
            _loc14_ = lf32(_loc7_);
            _loc15_ = lf32(_loc8_);
            _loc16_ = _loc14_ + _loc15_;
            _loc17_ = _loc12_ - _loc13_;
            _loc16_ = _loc16_;
            _loc17_ = _loc17_;
            _loc18_ = lf32(_loc1_ + 8);
            _loc19_ = lf32(_loc1_ + 12);
            _loc16_ = _loc16_;
            _loc17_ = _loc17_;
            _loc20_ = _loc18_ * _loc16_;
            _loc21_ = _loc19_ * _loc17_;
            _loc12_ = _loc12_ + _loc13_;
            _loc13_ = _loc20_;
            _loc20_ = _loc21_;
            _loc12_ = _loc12_;
            _loc16_ = _loc19_ * _loc16_;
            _loc14_ = _loc14_ - _loc15_;
            _loc15_ = _loc18_ * _loc17_;
            _loc12_ = _loc12_;
            _loc17_ = _loc20_;
            _loc13_ = _loc13_;
            _loc13_ = _loc13_ + _loc17_;
            _loc16_ = _loc16_;
            _loc14_ = _loc14_;
            _loc15_ = _loc15_;
            _loc12_ = _loc12_ * _loc11_;
            _loc13_ = _loc13_;
            _loc14_ = _loc14_;
            _loc12_ = _loc12_;
            _loc15_ = _loc15_;
            _loc16_ = _loc16_;
            _loc15_ = _loc16_ - _loc15_;
            _loc11_ = _loc14_ * _loc11_;
            _loc13_ = _loc13_;
            _loc12_ = _loc12_;
            _loc14_ = _loc12_ + _loc13_;
            _loc15_ = _loc15_;
            _loc11_ = _loc11_;
            _loc12_ = _loc12_ - _loc13_;
            _loc13_ = _loc14_;
            _loc11_ = _loc11_;
            _loc14_ = _loc15_;
            _loc15_ = _loc11_ + _loc14_;
            sf32(_loc13_,_loc5_ + 8);
            _loc12_ = _loc12_;
            _loc11_ = _loc14_ - _loc11_;
            sf32(_loc12_,_loc2_ + -16);
            _loc12_ = _loc15_;
            sf32(_loc12_,_loc5_ + 12);
            _loc11_ = _loc11_;
            sf32(_loc11_,_loc2_ + -12);
            _loc5_ = int(_loc5_ + 16);
            _loc6_ = _loc6_ + 16;
            _loc1_ = _loc1_ + 16;
            _loc2_ = int(_loc2_ + -16);
            if(uint(_loc5_) < uint(_loc2_))
            {
               continue;
            }
            break;
         }
         FSM_mdct_bitreverse.esp = FSM_mdct_bitreverse.ebp;
         FSM_mdct_bitreverse.ebp = li32(FSM_mdct_bitreverse.esp);
         FSM_mdct_bitreverse.esp = FSM_mdct_bitreverse.esp + 4;
         FSM_mdct_bitreverse.esp = FSM_mdct_bitreverse.esp + 4;
      }
   }
}
