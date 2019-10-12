package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.sf32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_vorbis_encode_compand_setup extends Machine
   {
       
      
      public function FSM_vorbis_encode_compand_setup()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:* = 0;
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         FSM_vorbis_encode_compand_setup.esp = FSM_vorbis_encode_compand_setup.esp - 4;
         si32(FSM_vorbis_encode_compand_setup.ebp,FSM_vorbis_encode_compand_setup.esp);
         FSM_vorbis_encode_compand_setup.ebp = FSM_vorbis_encode_compand_setup.esp;
         FSM_vorbis_encode_compand_setup.esp = FSM_vorbis_encode_compand_setup.esp - 0;
         _loc7_ = 0;
         _loc8_ = lf64(FSM_vorbis_encode_compand_setup.ebp + 12);
         _loc1_ = int(int(_loc8_));
         _loc9_ = Number(_loc1_);
         _loc2_ = int(li32(FSM_vorbis_encode_compand_setup.ebp + 28));
         _loc1_ = _loc1_ << 3;
         _loc8_ = _loc8_ - _loc9_;
         _loc3_ = int(_loc1_ + _loc2_);
         _loc1_ = int(_loc2_ + _loc1_);
         _loc9_ = lf64(_loc3_ + 8);
         _loc10_ = lf64(_loc1_);
         _loc11_ = 1 - _loc8_;
         _loc8_ = _loc9_ * _loc8_;
         _loc9_ = _loc10_ * _loc11_;
         _loc8_ = _loc9_ + _loc8_;
         _loc1_ = int(int(_loc8_));
         _loc9_ = Number(_loc1_);
         _loc8_ = _loc8_ - _loc9_;
         _loc2_ = int(_loc8_ == _loc7_?1:0);
         _loc3_ = int(_loc1_ > 0?1:0);
         _loc2_ = _loc2_ & _loc3_;
         _loc3_ = int(li32(FSM_vorbis_encode_compand_setup.ebp + 20));
         _loc2_ = _loc2_ & 1;
         _loc4_ = li32(FSM_vorbis_encode_compand_setup.ebp + 8);
         _loc5_ = _loc2_ != 0?-1:0;
         _loc4_ = li32(_loc4_ + 28);
         _loc3_ = _loc3_ << 2;
         _loc7_ = 1;
         _loc1_ = int(_loc5_ + _loc1_);
         _loc3_ = int(_loc4_ + _loc3_);
         _loc3_ = int(li32(_loc3_ + 2852));
         _loc7_ = _loc2_ != 0?Number(_loc7_):Number(_loc8_);
         _loc2_ = int(li32(FSM_vorbis_encode_compand_setup.ebp + 24));
         _loc1_ = int(_loc1_ * 160);
         _loc1_ = int(_loc2_ + _loc1_);
         _loc8_ = 1 - _loc7_;
         _loc2_ = 0;
         _loc4_ = _loc2_;
         while(_loc2_ < 40)
         {
            _loc5_ = _loc1_ + _loc4_;
            _loc6_ = li32(_loc5_);
            _loc5_ = li32(_loc5_ + 160);
            _loc9_ = Number(_loc5_);
            _loc10_ = Number(_loc6_);
            _loc9_ = _loc9_ * _loc7_;
            _loc10_ = _loc10_ * _loc8_;
            _loc9_ = _loc10_ + _loc9_;
            _loc5_ = _loc3_ + _loc4_;
            _loc9_ = _loc9_;
            sf32(_loc9_,_loc5_ + 336);
            _loc4_ = _loc4_ + 4;
            _loc2_ = int(_loc2_ + 1);
         }
         FSM_vorbis_encode_compand_setup.esp = FSM_vorbis_encode_compand_setup.ebp;
         FSM_vorbis_encode_compand_setup.ebp = li32(FSM_vorbis_encode_compand_setup.esp);
         FSM_vorbis_encode_compand_setup.esp = FSM_vorbis_encode_compand_setup.esp + 4;
         FSM_vorbis_encode_compand_setup.esp = FSM_vorbis_encode_compand_setup.esp + 4;
      }
   }
}
