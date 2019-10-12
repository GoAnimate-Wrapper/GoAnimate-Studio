package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_closeba extends Machine
   {
      
      public static const intRegCount:int = 4;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public function FSM_closeba()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_closeba = null;
         _loc1_ = new FSM_closeba();
         FSM_closeba.gworker = _loc1_;
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
               this.i0 = 0;
               mstate.esp = mstate.esp - 4;
               si32(this.i0,mstate.esp);
               state = 1;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_closeba]();
               return;
            case 1:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp - 12;
               this.i2 = li32(mstate.ebp + 8);
               this.i3 = FSM_closeba;
               si32(this.i2,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i1,mstate.esp + 8);
               state = 2;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_closeba]();
               return;
            case 2:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               mstate.esp = mstate.esp - 4;
               si32(this.i1,mstate.esp);
               state = 3;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_closeba]();
               return;
            case 3:
               mstate.esp = mstate.esp + 4;
               mstate.eax = this.i0;
               mstate.esp = mstate.ebp;
               mstate.ebp = li32(mstate.esp);
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp + 4;
               mstate.gworker = caller;
               return;
         }
      }
   }
}
