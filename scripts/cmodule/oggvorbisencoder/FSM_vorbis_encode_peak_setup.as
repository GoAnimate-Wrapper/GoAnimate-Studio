package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.sf32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_vorbis_encode_peak_setup extends Machine
   {
       
      
      public function FSM_vorbis_encode_peak_setup()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:* = 0;
         var _loc4_:int = 0;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         FSM_vorbis_encode_peak_setup.esp = FSM_vorbis_encode_peak_setup.esp - 4;
         si32(FSM_vorbis_encode_peak_setup.ebp,FSM_vorbis_encode_peak_setup.esp);
         FSM_vorbis_encode_peak_setup.ebp = FSM_vorbis_encode_peak_setup.esp;
         FSM_vorbis_encode_peak_setup.esp = FSM_vorbis_encode_peak_setup.esp - 0;
         _loc5_ = lf64(FSM_vorbis_encode_peak_setup.ebp + 12);
         _loc1_ = int(_loc5_);
         _loc2_ = li32(FSM_vorbis_encode_peak_setup.ebp + 24);
         _loc3_ = _loc1_ << 2;
         _loc6_ = Number(_loc1_);
         _loc1_ = _loc3_ + _loc2_;
         _loc2_ = _loc2_ + _loc3_;
         _loc3_ = int(li32(FSM_vorbis_encode_peak_setup.ebp + 20));
         _loc2_ = li32(_loc2_);
         _loc1_ = li32(_loc1_ + 4);
         _loc5_ = _loc5_ - _loc6_;
         _loc4_ = li32(FSM_vorbis_encode_peak_setup.ebp + 8);
         _loc6_ = Number(_loc1_);
         _loc1_ = li32(_loc4_ + 28);
         _loc3_ = _loc3_ << 2;
         _loc7_ = 1 - _loc5_;
         _loc8_ = Number(_loc2_);
         _loc1_ = _loc1_ + _loc3_;
         _loc5_ = _loc6_ * _loc5_;
         _loc6_ = _loc8_ * _loc7_;
         _loc1_ = li32(_loc1_ + 2852);
         _loc5_ = _loc6_ + _loc5_;
         _loc5_ = _loc5_;
         sf32(_loc5_,_loc1_ + 32);
         FSM_vorbis_encode_peak_setup.esp = FSM_vorbis_encode_peak_setup.ebp;
         FSM_vorbis_encode_peak_setup.ebp = li32(FSM_vorbis_encode_peak_setup.esp);
         FSM_vorbis_encode_peak_setup.esp = FSM_vorbis_encode_peak_setup.esp + 4;
         FSM_vorbis_encode_peak_setup.esp = FSM_vorbis_encode_peak_setup.esp + 4;
      }
   }
}
