package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.lf32;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.sf32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_min_curve extends Machine
   {
       
      
      public function FSM_min_curve()
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
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         FSM_min_curve.esp = FSM_min_curve.esp - 4;
         si32(FSM_min_curve.ebp,FSM_min_curve.esp);
         FSM_min_curve.ebp = FSM_min_curve.esp;
         FSM_min_curve.esp = FSM_min_curve.esp - 0;
         _loc1_ = 0;
         _loc2_ = li32(FSM_min_curve.ebp + 8);
         _loc3_ = li32(FSM_min_curve.ebp + 12);
         _loc4_ = _loc1_;
         while(_loc1_ < 56)
         {
            _loc5_ = _loc2_ + _loc4_;
            _loc6_ = _loc3_ + _loc4_;
            _loc7_ = lf32(_loc6_);
            _loc8_ = lf32(_loc5_);
            _loc9_ = _loc7_;
            if(_loc9_ < _loc8_)
            {
               sf32(_loc7_,_loc5_);
            }
            _loc4_ = _loc4_ + 4;
            _loc1_ = _loc1_ + 1;
         }
         FSM_min_curve.esp = FSM_min_curve.ebp;
         FSM_min_curve.ebp = li32(FSM_min_curve.esp);
         FSM_min_curve.esp = FSM_min_curve.esp + 4;
         FSM_min_curve.esp = FSM_min_curve.esp + 4;
      }
   }
}
