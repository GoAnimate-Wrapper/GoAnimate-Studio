package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.lf32;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.sf32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_mdct_butterfly_8 extends Machine
   {
       
      
      public function FSM_mdct_butterfly_8()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         FSM_mdct_butterfly_8.esp = FSM_mdct_butterfly_8.esp - 4;
         si32(FSM_mdct_butterfly_8.ebp,FSM_mdct_butterfly_8.esp);
         FSM_mdct_butterfly_8.ebp = FSM_mdct_butterfly_8.esp;
         FSM_mdct_butterfly_8.esp = FSM_mdct_butterfly_8.esp - 0;
         _loc1_ = li32(FSM_mdct_butterfly_8.ebp + 8);
         _loc2_ = lf32(_loc1_ + 24);
         _loc3_ = lf32(_loc1_ + 8);
         _loc4_ = lf32(_loc1_ + 16);
         _loc5_ = lf32(_loc1_);
         _loc6_ = _loc2_ + _loc3_;
         _loc7_ = _loc4_ + _loc5_;
         _loc6_ = _loc6_;
         _loc7_ = _loc7_;
         _loc7_ = _loc7_;
         _loc6_ = _loc6_;
         _loc8_ = _loc6_ + _loc7_;
         _loc6_ = _loc6_ - _loc7_;
         _loc7_ = _loc8_;
         sf32(_loc7_,_loc1_ + 24);
         _loc6_ = _loc6_;
         sf32(_loc6_,_loc1_ + 16);
         _loc6_ = lf32(_loc1_ + 20);
         _loc7_ = lf32(_loc1_ + 4);
         _loc8_ = _loc6_ - _loc7_;
         _loc2_ = _loc2_ - _loc3_;
         _loc3_ = _loc8_;
         _loc2_ = _loc2_;
         _loc8_ = lf32(_loc1_ + 28);
         _loc9_ = lf32(_loc1_ + 12);
         _loc10_ = _loc8_ - _loc9_;
         _loc4_ = _loc4_ - _loc5_;
         _loc3_ = _loc3_;
         _loc2_ = _loc2_;
         _loc5_ = _loc2_ + _loc3_;
         _loc10_ = _loc10_;
         _loc4_ = _loc4_;
         _loc2_ = _loc2_ - _loc3_;
         _loc3_ = _loc6_ + _loc7_;
         _loc6_ = _loc8_ + _loc9_;
         _loc5_ = _loc5_;
         _loc4_ = _loc4_;
         _loc7_ = _loc10_;
         _loc3_ = _loc3_;
         _loc8_ = _loc7_ + _loc4_;
         _loc6_ = _loc6_;
         sf32(_loc5_,_loc1_);
         _loc2_ = _loc2_;
         _loc4_ = _loc7_ - _loc4_;
         sf32(_loc2_,_loc1_ + 8);
         _loc2_ = _loc8_;
         _loc3_ = _loc3_;
         _loc5_ = _loc6_;
         _loc6_ = _loc5_ + _loc3_;
         sf32(_loc2_,_loc1_ + 12);
         _loc2_ = _loc4_;
         _loc3_ = _loc5_ - _loc3_;
         sf32(_loc2_,_loc1_ + 4);
         _loc2_ = _loc6_;
         sf32(_loc2_,_loc1_ + 28);
         _loc2_ = _loc3_;
         sf32(_loc2_,_loc1_ + 20);
         FSM_mdct_butterfly_8.esp = FSM_mdct_butterfly_8.ebp;
         FSM_mdct_butterfly_8.ebp = li32(FSM_mdct_butterfly_8.esp);
         FSM_mdct_butterfly_8.esp = FSM_mdct_butterfly_8.esp + 4;
         FSM_mdct_butterfly_8.esp = FSM_mdct_butterfly_8.esp + 4;
      }
   }
}
