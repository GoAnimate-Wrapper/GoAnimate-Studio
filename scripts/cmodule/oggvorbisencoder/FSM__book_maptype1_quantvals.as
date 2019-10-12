package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM__book_maptype1_quantvals extends Machine
   {
       
      
      public function FSM__book_maptype1_quantvals()
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
         var _loc7_:int = 0;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         FSM__book_maptype1_quantvals.esp = FSM__book_maptype1_quantvals.esp - 4;
         si32(FSM__book_maptype1_quantvals.ebp,FSM__book_maptype1_quantvals.esp);
         FSM__book_maptype1_quantvals.ebp = FSM__book_maptype1_quantvals.esp;
         FSM__book_maptype1_quantvals.esp = FSM__book_maptype1_quantvals.esp - 0;
         _loc8_ = 1;
         _loc1_ = li32(FSM__book_maptype1_quantvals.ebp + 8);
         _loc2_ = li32(_loc1_);
         _loc8_ = _loc8_;
         _loc9_ = Number(_loc2_);
         _loc9_ = _loc9_;
         _loc8_ = _loc8_;
         _loc2_ = li32(_loc1_ + 4);
         _loc8_ = _loc8_ / _loc9_;
         _loc8_ = _loc8_;
         _loc9_ = Number(_loc2_);
         _loc9_ = _loc9_;
         _loc10_ = _loc8_;
         _loc8_ = _loc9_;
         _loc9_ = _loc10_;
         _loc8_ = Math.pow(_loc8_,_loc9_);
         _loc8_ = Math.floor(_loc8_);
         _loc2_ = li32(_loc1_);
         _loc1_ = li32(_loc1_ + 4);
         _loc3_ = int(_loc8_);
         while(true)
         {
            _loc4_ = 0;
            _loc5_ = _loc3_ + 1;
            _loc6_ = 1;
            _loc7_ = _loc6_;
            while(_loc2_ > _loc4_)
            {
               _loc4_ = _loc4_ + 1;
               _loc6_ = _loc5_ * _loc6_;
               _loc7_ = _loc7_ * _loc3_;
            }
            if(_loc1_ < _loc6_)
            {
               if(_loc1_ >= _loc7_)
               {
                  break;
               }
            }
            if(_loc1_ >= _loc7_)
            {
               _loc3_ = _loc5_;
            }
            else
            {
               _loc3_ = _loc3_ + -1;
            }
         }
         FSM__book_maptype1_quantvals.eax = _loc3_;
         FSM__book_maptype1_quantvals.esp = FSM__book_maptype1_quantvals.ebp;
         FSM__book_maptype1_quantvals.ebp = li32(FSM__book_maptype1_quantvals.esp);
         FSM__book_maptype1_quantvals.esp = FSM__book_maptype1_quantvals.esp + 4;
         FSM__book_maptype1_quantvals.esp = FSM__book_maptype1_quantvals.esp + 4;
      }
   }
}
