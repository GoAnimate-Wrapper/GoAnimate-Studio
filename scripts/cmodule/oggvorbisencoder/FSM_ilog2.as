package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_ilog2 extends Machine
   {
       
      
      public function FSM_ilog2()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         FSM_ilog2.esp = FSM_ilog2.esp - 4;
         si32(FSM_ilog2.ebp,FSM_ilog2.esp);
         FSM_ilog2.ebp = FSM_ilog2.esp;
         FSM_ilog2.esp = FSM_ilog2.esp - 0;
         _loc1_ = li32(FSM_ilog2.ebp + 8);
         if(_loc1_ == 0)
         {
            _loc2_ = 0;
         }
         else
         {
            _loc2_ = 0;
            _loc1_ = _loc1_ + -1;
         }
         while(_loc1_ != 0)
         {
            _loc2_ = _loc2_ + 1;
            _loc1_ = _loc1_ >>> 1;
         }
         FSM_ilog2.eax = _loc2_;
         FSM_ilog2.esp = FSM_ilog2.ebp;
         FSM_ilog2.ebp = li32(FSM_ilog2.esp);
         FSM_ilog2.esp = FSM_ilog2.esp + 4;
         FSM_ilog2.esp = FSM_ilog2.esp + 4;
      }
   }
}
