package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.lf32;
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.sf32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_vorbis_encode_tonemask_setup extends Machine
   {
       
      
      public function FSM_vorbis_encode_tonemask_setup()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:* = 0;
         var _loc4_:int = 0;
         var _loc5_:* = 0;
         var _loc6_:* = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         FSM_vorbis_encode_tonemask_setup.esp = FSM_vorbis_encode_tonemask_setup.esp - 4;
         si32(FSM_vorbis_encode_tonemask_setup.ebp,FSM_vorbis_encode_tonemask_setup.esp);
         FSM_vorbis_encode_tonemask_setup.ebp = FSM_vorbis_encode_tonemask_setup.esp;
         FSM_vorbis_encode_tonemask_setup.esp = FSM_vorbis_encode_tonemask_setup.esp - 0;
         _loc1_ = 0;
         _loc10_ = lf64(FSM_vorbis_encode_tonemask_setup.ebp + 12);
         _loc2_ = int(_loc10_);
         _loc3_ = int(_loc2_ + 1);
         _loc4_ = li32(FSM_vorbis_encode_tonemask_setup.ebp + 24);
         _loc5_ = int(_loc3_ * 20);
         _loc6_ = int(_loc2_ * 20);
         _loc11_ = Number(_loc2_);
         _loc5_ = int(_loc4_ + _loc5_);
         _loc4_ = _loc4_ + _loc6_;
         _loc6_ = int(li32(FSM_vorbis_encode_tonemask_setup.ebp + 20));
         _loc7_ = li32(_loc4_);
         _loc8_ = li32(_loc5_);
         _loc10_ = _loc10_ - _loc11_;
         _loc9_ = li32(FSM_vorbis_encode_tonemask_setup.ebp + 8);
         _loc11_ = Number(_loc8_);
         _loc8_ = li32(_loc9_ + 28);
         _loc6_ = _loc6_ << 2;
         _loc12_ = 1 - _loc10_;
         _loc13_ = Number(_loc7_);
         _loc6_ = int(_loc8_ + _loc6_);
         _loc11_ = _loc11_ * _loc10_;
         _loc13_ = _loc13_ * _loc12_;
         _loc6_ = int(li32(_loc6_ + 2852));
         _loc11_ = _loc13_ + _loc11_;
         _loc11_ = _loc11_;
         sf32(_loc11_,_loc6_ + 12);
         _loc7_ = li32(_loc4_ + 4);
         _loc8_ = li32(_loc5_ + 4);
         _loc11_ = Number(_loc8_);
         _loc13_ = Number(_loc7_);
         _loc11_ = _loc11_ * _loc10_;
         _loc13_ = _loc13_ * _loc12_;
         _loc11_ = _loc13_ + _loc11_;
         _loc11_ = _loc11_;
         sf32(_loc11_,_loc6_ + 16);
         _loc7_ = li32(_loc4_ + 8);
         _loc8_ = li32(_loc5_ + 8);
         _loc11_ = Number(_loc8_);
         _loc13_ = Number(_loc7_);
         _loc11_ = _loc11_ * _loc10_;
         _loc13_ = _loc13_ * _loc12_;
         _loc11_ = _loc13_ + _loc11_;
         _loc11_ = _loc11_;
         sf32(_loc11_,_loc6_ + 20);
         _loc11_ = lf32(_loc4_ + 12);
         _loc13_ = lf32(_loc5_ + 12);
         _loc13_ = _loc13_ * _loc10_;
         _loc11_ = _loc11_ * _loc12_;
         _loc11_ = _loc11_ + _loc13_;
         _loc11_ = _loc11_;
         sf32(_loc11_,_loc6_ + 24);
         _loc11_ = lf32(_loc4_ + 16);
         _loc13_ = lf32(_loc5_ + 16);
         _loc13_ = _loc13_ * _loc10_;
         _loc11_ = _loc11_ * _loc12_;
         _loc11_ = _loc11_ + _loc13_;
         _loc4_ = li32(FSM_vorbis_encode_tonemask_setup.ebp + 28);
         _loc3_ = _loc3_ << 2;
         _loc5_ = _loc2_ << 2;
         _loc11_ = _loc11_;
         sf32(_loc11_,_loc6_ + 28);
         _loc3_ = int(_loc4_ + _loc3_);
         _loc4_ = _loc4_ + _loc5_;
         _loc4_ = li32(_loc4_);
         _loc3_ = int(li32(_loc3_));
         _loc11_ = Number(_loc3_);
         _loc13_ = Number(_loc4_);
         _loc11_ = _loc11_ * _loc10_;
         _loc13_ = _loc13_ * _loc12_;
         _loc11_ = _loc13_ + _loc11_;
         _loc3_ = int(li32(FSM_vorbis_encode_tonemask_setup.ebp + 32));
         _loc2_ = _loc2_ * 68;
         _loc11_ = _loc11_;
         sf32(_loc11_,_loc6_ + 496);
         _loc2_ = _loc3_ + _loc2_;
         _loc3_ = int(_loc1_);
         while(_loc1_ < 17)
         {
            _loc4_ = _loc2_ + _loc3_;
            _loc5_ = int(li32(_loc4_));
            _loc4_ = li32(_loc4_ + 68);
            _loc11_ = Number(_loc4_);
            _loc13_ = Number(_loc5_);
            _loc11_ = _loc11_ * _loc10_;
            _loc13_ = _loc13_ * _loc12_;
            _loc11_ = _loc13_ + _loc11_;
            _loc4_ = _loc6_ + _loc3_;
            _loc11_ = _loc11_;
            sf32(_loc11_,_loc4_ + 36);
            _loc3_ = int(_loc3_ + 4);
            _loc1_ = _loc1_ + 1;
         }
         FSM_vorbis_encode_tonemask_setup.esp = FSM_vorbis_encode_tonemask_setup.ebp;
         FSM_vorbis_encode_tonemask_setup.ebp = li32(FSM_vorbis_encode_tonemask_setup.esp);
         FSM_vorbis_encode_tonemask_setup.esp = FSM_vorbis_encode_tonemask_setup.esp + 4;
         FSM_vorbis_encode_tonemask_setup.esp = FSM_vorbis_encode_tonemask_setup.esp + 4;
      }
   }
}
