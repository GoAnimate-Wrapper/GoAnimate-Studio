package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_render_point extends Machine
   {
       
      
      public function FSM_render_point()
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
         var _loc7_:int = 0;
         FSM_render_point.esp = FSM_render_point.esp - 4;
         si32(FSM_render_point.ebp,FSM_render_point.esp);
         FSM_render_point.ebp = FSM_render_point.esp;
         FSM_render_point.esp = FSM_render_point.esp - 0;
         _loc1_ = int(li32(FSM_render_point.ebp + 16));
         _loc2_ = int(li32(FSM_render_point.ebp + 20));
         _loc2_ = _loc2_ & 32767;
         _loc1_ = _loc1_ & 32767;
         _loc2_ = int(_loc2_ - _loc1_);
         _loc3_ = _loc2_ >> 31;
         _loc4_ = _loc2_ + _loc3_;
         _loc5_ = li32(FSM_render_point.ebp + 24);
         _loc6_ = li32(FSM_render_point.ebp + 8);
         _loc7_ = li32(FSM_render_point.ebp + 12);
         _loc3_ = _loc4_ ^ _loc3_;
         _loc4_ = _loc5_ - _loc6_;
         _loc3_ = int(_loc4_ * _loc3_);
         _loc4_ = _loc7_ - _loc6_;
         _loc3_ = int(_loc3_ / _loc4_);
         if(_loc2_ <= -1)
         {
            _loc1_ = int(_loc1_ - _loc3_);
         }
         else
         {
            _loc1_ = int(_loc1_ + _loc3_);
         }
         FSM_render_point.eax = _loc1_;
         FSM_render_point.esp = FSM_render_point.ebp;
         FSM_render_point.ebp = li32(FSM_render_point.esp);
         FSM_render_point.esp = FSM_render_point.esp + 4;
         FSM_render_point.esp = FSM_render_point.esp + 4;
      }
   }
}
