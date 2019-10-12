package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_mdct_clear extends Machine
   {
      
      public static const intRegCount:int = 3;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public function FSM_mdct_clear()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_mdct_clear = null;
         _loc1_ = new FSM_mdct_clear();
         FSM_mdct_clear.gworker = _loc1_;
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
               if(this.i0 != 0)
               {
                  this.i1 = li32(this.i0 + 8);
                  if(this.i1 != 0)
                  {
                     this.i2 = 0;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i1,mstate.esp);
                     si32(this.i2,mstate.esp + 4);
                     state = 1;
                     mstate.esp = mstate.esp - 4;
                     FSM_mdct_clear.start();
                     return;
                  }
                  addr94:
                  this.i1 = li32(this.i0 + 12);
                  if(this.i1 != 0)
                  {
                     this.i2 = 0;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i1,mstate.esp);
                     si32(this.i2,mstate.esp + 4);
                     state = 2;
                     mstate.esp = mstate.esp - 4;
                     FSM_mdct_clear.start();
                     return;
                  }
                  addr150:
                  this.i1 = 0;
                  si32(this.i1,this.i0);
                  si32(this.i1,this.i0 + 4);
                  si32(this.i1,this.i0 + 8);
                  si32(this.i1,this.i0 + 12);
                  si32(this.i1,this.i0 + 16);
                  break;
               }
               break;
            case 1:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr94);
            case 2:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr150);
         }
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
