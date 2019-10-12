package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.lf32;
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.sf32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_vorbis_encode_noisebias_setup extends Machine
   {
       
      
      public function FSM_vorbis_encode_noisebias_setup()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = 0;
         var _loc5_:int = 0;
         var _loc6_:* = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         FSM_vorbis_encode_noisebias_setup.esp = FSM_vorbis_encode_noisebias_setup.esp - 4;
         si32(FSM_vorbis_encode_noisebias_setup.ebp,FSM_vorbis_encode_noisebias_setup.esp);
         FSM_vorbis_encode_noisebias_setup.ebp = FSM_vorbis_encode_noisebias_setup.esp;
         FSM_vorbis_encode_noisebias_setup.esp = FSM_vorbis_encode_noisebias_setup.esp - 0;
         _loc1_ = 0;
         _loc11_ = lf64(FSM_vorbis_encode_noisebias_setup.ebp + 12);
         _loc2_ = int(_loc11_);
         _loc3_ = li32(FSM_vorbis_encode_noisebias_setup.ebp + 24);
         _loc4_ = _loc2_ << 2;
         _loc12_ = Number(_loc2_);
         _loc5_ = _loc4_ + _loc3_;
         _loc3_ = _loc3_ + _loc4_;
         _loc4_ = int(li32(FSM_vorbis_encode_noisebias_setup.ebp + 20));
         _loc3_ = li32(_loc3_);
         _loc5_ = li32(_loc5_ + 4);
         _loc11_ = _loc11_ - _loc12_;
         _loc6_ = int(li32(FSM_vorbis_encode_noisebias_setup.ebp + 8));
         _loc12_ = Number(_loc5_);
         _loc5_ = li32(_loc6_ + 28);
         _loc6_ = _loc4_ << 2;
         _loc13_ = 1 - _loc11_;
         _loc14_ = Number(_loc3_);
         _loc3_ = _loc5_ + _loc6_;
         _loc12_ = _loc12_ * _loc11_;
         _loc14_ = _loc14_ * _loc13_;
         _loc3_ = li32(_loc3_ + 2852);
         _loc12_ = _loc14_ + _loc12_;
         _loc5_ = li32(FSM_vorbis_encode_noisebias_setup.ebp + 32);
         _loc4_ = int(_loc4_ * 12);
         _loc12_ = _loc12_;
         sf32(_loc12_,_loc3_ + 108);
         _loc4_ = int(_loc5_ + _loc4_);
         _loc5_ = li32(_loc4_);
         si32(_loc5_,_loc3_ + 120);
         _loc5_ = li32(_loc4_ + 4);
         si32(_loc5_,_loc3_ + 124);
         _loc4_ = int(li32(_loc4_ + 8));
         si32(_loc4_,_loc3_ + 128);
         _loc4_ = int(li32(FSM_vorbis_encode_noisebias_setup.ebp + 28));
         _loc12_ = lf64(FSM_vorbis_encode_noisebias_setup.ebp + 36);
         _loc5_ = _loc1_;
         while(true)
         {
            _loc6_ = int(_loc5_);
            _loc5_ = _loc1_;
            if(_loc5_ <= 2)
            {
               _loc8_ = 0;
               _loc1_ = _loc2_ * 204;
               _loc1_ = _loc4_ + _loc1_;
               _loc7_ = _loc6_;
               while(_loc8_ < 17)
               {
                  _loc9_ = _loc1_ + _loc7_;
                  _loc10_ = li32(_loc9_);
                  _loc9_ = li32(_loc9_ + 204);
                  _loc14_ = Number(_loc9_);
                  _loc15_ = Number(_loc10_);
                  _loc14_ = _loc14_ * _loc11_;
                  _loc15_ = _loc15_ * _loc13_;
                  _loc14_ = _loc15_ + _loc14_;
                  _loc9_ = _loc3_ + _loc7_;
                  _loc14_ = _loc14_;
                  sf32(_loc14_,_loc9_ + 132);
                  _loc7_ = _loc7_ + 4;
                  _loc8_ = _loc8_ + 1;
               }
               _loc1_ = _loc6_ + 68;
               _loc6_ = int(_loc5_ + 1);
               _loc5_ = _loc1_;
               _loc1_ = _loc6_;
               continue;
            }
            break;
         }
         _loc1_ = 0;
         _loc3_ = _loc3_ + 132;
         while(true)
         {
            _loc2_ = _loc3_;
            _loc3_ = _loc2_;
            if(_loc1_ >= 3)
            {
               break;
            }
            _loc11_ = 6;
            _loc11_ = _loc11_;
            _loc13_ = lf32(_loc3_);
            _loc11_ = _loc11_;
            _loc11_ = _loc13_ + _loc11_;
            _loc11_ = _loc11_;
            _loc3_ = 0;
            _loc4_ = int(_loc2_);
            while(true)
            {
               _loc5_ = _loc4_;
               _loc4_ = int(_loc3_);
               _loc3_ = _loc5_;
               if(_loc4_ >= 17)
               {
                  break;
               }
               _loc13_ = lf32(_loc3_);
               _loc13_ = _loc13_ + _loc12_;
               _loc13_ = _loc13_;
               _loc14_ = _loc11_;
               _loc13_ = _loc13_;
               _loc13_ = _loc13_ < _loc14_?Number(_loc14_):Number(_loc13_);
               _loc13_ = _loc13_;
               sf32(_loc13_,_loc3_);
               _loc3_ = _loc5_ + 4;
               _loc5_ = _loc4_ + 1;
               _loc4_ = int(_loc3_);
               _loc3_ = _loc5_;
            }
            _loc3_ = _loc2_ + 68;
            _loc1_ = _loc1_ + 1;
         }
         FSM_vorbis_encode_noisebias_setup.esp = FSM_vorbis_encode_noisebias_setup.ebp;
         FSM_vorbis_encode_noisebias_setup.ebp = li32(FSM_vorbis_encode_noisebias_setup.esp);
         FSM_vorbis_encode_noisebias_setup.esp = FSM_vorbis_encode_noisebias_setup.esp + 4;
         FSM_vorbis_encode_noisebias_setup.esp = FSM_vorbis_encode_noisebias_setup.esp + 4;
      }
   }
}
