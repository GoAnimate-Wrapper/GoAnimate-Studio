package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_post_Y extends Machine
   {
       
      
      public function FSM_post_Y()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:* = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         FSM_post_Y.esp = FSM_post_Y.esp - 4;
         si32(FSM_post_Y.ebp,FSM_post_Y.esp);
         FSM_post_Y.ebp = FSM_post_Y.esp;
         FSM_post_Y.esp = FSM_post_Y.esp - 0;
         _loc1_ = int(li32(FSM_post_Y.ebp + 16));
         _loc2_ = li32(FSM_post_Y.ebp + 8);
         _loc1_ = _loc1_ << 2;
         _loc3_ = li32(FSM_post_Y.ebp + 12);
         _loc3_ = _loc3_ + _loc1_;
         _loc1_ = int(_loc2_ + _loc1_);
         _loc1_ = int(li32(_loc1_));
         _loc2_ = li32(_loc3_);
         if(_loc1_ <= -1)
         {
            FSM_post_Y.eax = _loc2_;
         }
         else
         {
            if(_loc2_ >= 0)
            {
               _loc1_ = int(_loc1_ + _loc2_);
               _loc1_ = _loc1_ >> 1;
            }
            FSM_post_Y.eax = _loc1_;
         }
         FSM_post_Y.esp = FSM_post_Y.ebp;
         FSM_post_Y.ebp = li32(FSM_post_Y.esp);
         FSM_post_Y.esp = FSM_post_Y.esp + 4;
         FSM_post_Y.esp = FSM_post_Y.esp + 4;
      }
   }
}
