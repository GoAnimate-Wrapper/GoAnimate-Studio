package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_oggpack_adv extends Machine
   {
       
      
      public function FSM_oggpack_adv()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:* = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = 0;
         var _loc5_:int = 0;
         var _loc6_:* = 0;
         var _loc7_:int = 0;
         FSM_oggpack_adv.esp = FSM_oggpack_adv.esp - 4;
         si32(FSM_oggpack_adv.ebp,FSM_oggpack_adv.esp);
         FSM_oggpack_adv.ebp = FSM_oggpack_adv.esp;
         FSM_oggpack_adv.esp = FSM_oggpack_adv.esp - 0;
         _loc1_ = int(li32(FSM_oggpack_adv.ebp + 8));
         _loc2_ = li32(_loc1_ + 4);
         _loc3_ = li32(FSM_oggpack_adv.ebp + 12);
         _loc2_ = _loc2_ + _loc3_;
         _loc3_ = li32(_loc1_);
         _loc4_ = int(li32(_loc1_ + 16));
         _loc5_ = _loc1_ + 12;
         _loc6_ = int(_loc2_ + 7);
         _loc7_ = _loc1_ + 4;
         _loc6_ = _loc6_ >> 3;
         _loc6_ = int(_loc4_ - _loc6_);
         if(_loc3_ <= _loc6_)
         {
            _loc4_ = _loc2_ >> 31;
            _loc4_ = int(_loc4_ >>> 29);
            _loc4_ = int(_loc2_ + _loc4_);
            _loc6_ = int(li32(_loc5_));
            _loc4_ = _loc4_ >> 3;
            _loc6_ = int(_loc6_ + _loc4_);
            si32(_loc6_,_loc5_);
            _loc4_ = int(_loc3_ + _loc4_);
            si32(_loc4_,_loc1_);
            _loc1_ = _loc2_ & 7;
         }
         else
         {
            _loc2_ = 0;
            si32(_loc2_,_loc5_);
            si32(_loc4_,_loc1_);
            _loc1_ = 1;
         }
         si32(_loc1_,_loc7_);
         FSM_oggpack_adv.esp = FSM_oggpack_adv.ebp;
         FSM_oggpack_adv.ebp = li32(FSM_oggpack_adv.esp);
         FSM_oggpack_adv.esp = FSM_oggpack_adv.esp + 4;
         FSM_oggpack_adv.esp = FSM_oggpack_adv.esp + 4;
      }
   }
}
