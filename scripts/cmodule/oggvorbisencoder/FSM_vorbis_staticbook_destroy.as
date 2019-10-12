package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_vorbis_staticbook_destroy extends Machine
   {
      
      public static const intRegCount:int = 4;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public function FSM_vorbis_staticbook_destroy()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_vorbis_staticbook_destroy = null;
         _loc1_ = new FSM_vorbis_staticbook_destroy();
         FSM_vorbis_staticbook_destroy.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 0;
               this.i0 = li32(mstate.ebp + 8);
               this.i1 = li32(this.i0 + 36);
               if(this.i1 != 0)
               {
                  this.i1 = li32(this.i0 + 32);
                  if(this.i1 != 0)
                  {
                     this.i2 = 0;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i1,mstate.esp);
                     si32(this.i2,mstate.esp + 4);
                     state = 1;
                     mstate.esp = mstate.esp - 4;
                     FSM_vorbis_staticbook_destroy.start();
                     return;
                  }
                  addr101:
                  this.i1 = li32(this.i0 + 8);
                  if(this.i1 != 0)
                  {
                     this.i2 = 0;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i1,mstate.esp);
                     si32(this.i2,mstate.esp + 4);
                     state = 2;
                     mstate.esp = mstate.esp - 4;
                     FSM_vorbis_staticbook_destroy.start();
                     return;
                  }
                  break;
               }
               addr216:
               mstate.esp = mstate.ebp;
               mstate.ebp = li32(mstate.esp);
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp + 4;
               mstate.gworker = caller;
               return;
            case 1:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr101);
            case 2:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               break;
            case 3:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr216);
         }
         this.i1 = 0;
         this.i2 = this.i0;
         this.i3 = 40;
         memset(this.i2,this.i1,this.i3);
         mstate.esp = mstate.esp - 8;
         si32(this.i0,mstate.esp);
         si32(this.i1,mstate.esp + 4);
         state = 3;
         mstate.esp = mstate.esp - 4;
         FSM_vorbis_staticbook_destroy.start();
      }
   }
}
