package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.lf32;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.sf32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM__vp_offset_and_mix extends Machine
   {
       
      
      public function FSM__vp_offset_and_mix()
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
         var _loc13_:* = 0;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         FSM__vp_offset_and_mix.esp = FSM__vp_offset_and_mix.esp - 4;
         si32(FSM__vp_offset_and_mix.ebp,FSM__vp_offset_and_mix.esp);
         FSM__vp_offset_and_mix.ebp = FSM__vp_offset_and_mix.esp;
         FSM__vp_offset_and_mix.esp = FSM__vp_offset_and_mix.esp - 0;
         _loc1_ = 0;
         _loc2_ = li32(FSM__vp_offset_and_mix.ebp + 8);
         _loc3_ = li32(FSM__vp_offset_and_mix.ebp + 20);
         _loc4_ = li32(_loc2_ + 4);
         _loc5_ = _loc3_ << 2;
         _loc4_ = _loc4_ + _loc5_;
         _loc5_ = int(li32(_loc2_));
         _loc14_ = lf32(_loc4_ + 12);
         _loc15_ = lf32(_loc2_ + 48);
         _loc4_ = li32(FSM__vp_offset_and_mix.ebp + 28);
         _loc6_ = li32(FSM__vp_offset_and_mix.ebp + 32);
         _loc7_ = li32(FSM__vp_offset_and_mix.ebp + 24);
         _loc8_ = li32(FSM__vp_offset_and_mix.ebp + 16);
         _loc9_ = li32(FSM__vp_offset_and_mix.ebp + 12);
         _loc10_ = _loc2_ + 12;
         _loc2_ = _loc2_ + 4;
         _loc11_ = _loc1_;
         while(_loc1_ < _loc5_)
         {
            _loc12_ = li32(_loc10_);
            _loc13_ = _loc3_ << 2;
            _loc12_ = _loc12_ + _loc13_;
            _loc12_ = li32(_loc12_);
            _loc12_ = _loc12_ + _loc11_;
            _loc13_ = int(_loc9_ + _loc11_);
            _loc16_ = lf32(_loc13_);
            _loc17_ = lf32(_loc12_);
            _loc16_ = _loc16_ + _loc17_;
            _loc16_ = _loc16_;
            _loc12_ = li32(_loc2_);
            _loc13_ = int(_loc8_ + _loc11_);
            _loc17_ = lf32(_loc12_ + 108);
            _loc18_ = lf32(_loc13_);
            _loc16_ = _loc16_;
            _loc19_ = _loc14_;
            _loc16_ = _loc17_ < _loc16_?Number(_loc17_):Number(_loc16_);
            _loc17_ = _loc18_ + _loc19_;
            _loc16_ = _loc16_;
            _loc17_ = _loc17_;
            _loc18_ = _loc16_;
            _loc17_ = _loc17_;
            _loc17_ = _loc17_ > _loc18_?Number(_loc17_):Number(_loc18_);
            _loc17_ = _loc17_;
            _loc12_ = _loc7_ + _loc11_;
            sf32(_loc17_,_loc12_);
            if(_loc3_ == 1)
            {
               _loc17_ = -17.2;
               _loc12_ = _loc6_ + _loc11_;
               _loc18_ = lf32(_loc12_);
               _loc16_ = _loc16_;
               _loc16_ = _loc16_ - _loc18_;
               _loc16_ = _loc16_;
               _loc17_ = _loc17_;
               _loc17_ = _loc17_;
               _loc16_ = _loc16_;
               _loc18_ = _loc16_ - _loc17_;
               _loc18_ = _loc18_;
               _loc18_ = _loc18_;
               if(_loc16_ > _loc17_)
               {
                  _loc16_ = 0;
                  _loc18_ = _loc18_ * -0.005;
                  _loc18_ = _loc18_ * _loc15_;
                  _loc18_ = _loc18_ + 1;
                  _loc16_ = _loc16_;
                  _loc17_ = _loc18_;
                  _loc18_ = _loc16_;
                  _loc16_ = _loc17_;
                  if(_loc16_ >= _loc18_)
                  {
                     _loc16_ = _loc17_;
                  }
                  else
                  {
                     _loc18_ = 0.0001;
                     _loc16_ = _loc18_;
                  }
               }
               else
               {
                  _loc16_ = _loc18_ * -0.0003;
                  _loc16_ = _loc16_ * _loc15_;
                  _loc16_ = _loc16_ + 1;
                  _loc16_ = _loc16_;
               }
               _loc12_ = _loc4_ + _loc11_;
               _loc17_ = lf32(_loc12_);
               _loc16_ = _loc16_;
               _loc16_ = _loc17_ * _loc16_;
               _loc16_ = _loc16_;
               sf32(_loc16_,_loc12_);
            }
            _loc11_ = _loc11_ + 4;
            _loc1_ = _loc1_ + 1;
         }
         FSM__vp_offset_and_mix.esp = FSM__vp_offset_and_mix.ebp;
         FSM__vp_offset_and_mix.ebp = li32(FSM__vp_offset_and_mix.esp);
         FSM__vp_offset_and_mix.esp = FSM__vp_offset_and_mix.esp + 4;
         FSM__vp_offset_and_mix.esp = FSM__vp_offset_and_mix.esp + 4;
      }
   }
}
