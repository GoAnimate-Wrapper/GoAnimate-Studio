package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.lf32;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_apsort extends Machine
   {
       
      
      public function FSM_apsort()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:* = 0;
         var _loc2_:* = 0;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         FSM_apsort.esp = FSM_apsort.esp - 4;
         si32(FSM_apsort.ebp,FSM_apsort.esp);
         FSM_apsort.ebp = FSM_apsort.esp;
         FSM_apsort.esp = FSM_apsort.esp - 0;
         _loc1_ = int(li32(FSM_apsort.ebp + 8));
         _loc2_ = int(li32(FSM_apsort.ebp + 12));
         _loc1_ = int(li32(_loc1_));
         _loc2_ = int(li32(_loc2_));
         _loc3_ = lf32(_loc1_);
         _loc4_ = lf32(_loc2_);
         _loc1_ = int(_loc3_ < _loc4_?1:0);
         _loc2_ = int(_loc3_ > _loc4_?1:0);
         _loc1_ = _loc1_ & 1;
         _loc2_ = _loc2_ & 1;
         _loc1_ = int(_loc1_ - _loc2_);
         FSM_apsort.eax = _loc1_;
         FSM_apsort.esp = FSM_apsort.ebp;
         FSM_apsort.ebp = li32(FSM_apsort.esp);
         FSM_apsort.esp = FSM_apsort.esp + 4;
         FSM_apsort.esp = FSM_apsort.esp + 4;
      }
   }
}
