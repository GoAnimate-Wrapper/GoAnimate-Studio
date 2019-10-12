package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_icomp extends Machine
   {
       
      
      public function FSM_icomp()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         FSM_icomp.esp = FSM_icomp.esp - 4;
         si32(FSM_icomp.ebp,FSM_icomp.esp);
         FSM_icomp.ebp = FSM_icomp.esp;
         FSM_icomp.esp = FSM_icomp.esp - 0;
         _loc1_ = li32(FSM_icomp.ebp + 8);
         _loc2_ = li32(FSM_icomp.ebp + 12);
         _loc1_ = li32(_loc1_);
         _loc2_ = li32(_loc2_);
         _loc1_ = li32(_loc1_);
         _loc2_ = li32(_loc2_);
         _loc1_ = _loc1_ - _loc2_;
         FSM_icomp.eax = _loc1_;
         FSM_icomp.esp = FSM_icomp.ebp;
         FSM_icomp.ebp = li32(FSM_icomp.esp);
         FSM_icomp.esp = FSM_icomp.esp + 4;
         FSM_icomp.esp = FSM_icomp.esp + 4;
      }
   }
}
