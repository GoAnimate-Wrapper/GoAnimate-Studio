package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_fwrite extends Machine
   {
      
      public static const intRegCount:int = 7;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public var i5:int;
      
      public var i6:int;
      
      public function FSM_fwrite()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_fwrite = null;
         _loc1_ = new FSM_fwrite();
         FSM_fwrite.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 24;
               this.i0 = mstate.ebp + -24;
               this.i1 = li32(mstate.ebp + 12);
               this.i2 = li32(mstate.ebp + 16);
               this.i3 = li32(mstate.ebp + 8);
               si32(this.i3,mstate.ebp + -24);
               this.i3 = this.i2 * this.i1;
               si32(this.i3,mstate.ebp + -20);
               si32(this.i3,mstate.ebp + -8);
               si32(this.i0,mstate.ebp + -16);
               this.i0 = 1;
               this.i4 = li32(mstate.ebp + 20);
               si32(this.i0,mstate.ebp + -12);
               this.i0 = li32(this.i4 + 56);
               this.i5 = li32(this.i0 + 16);
               this.i6 = mstate.ebp + -16;
               this.i0 = this.i0 + 16;
               this.i6 = this.i6 + 8;
               if(this.i5 == 0)
               {
                  this.i5 = -1;
                  si32(this.i5,this.i0);
               }
               this.i0 = mstate.ebp + -16;
               mstate.esp = mstate.esp - 8;
               si32(this.i4,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               state = 1;
               mstate.esp = mstate.esp - 4;
               FSM_fwrite.start();
               return;
            case 1:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i0 != 0)
               {
                  this.i2 = li32(this.i6);
                  this.i2 = this.i3 - this.i2;
                  this.i2 = uint(this.i2) / uint(this.i1);
               }
               mstate.eax = this.i2;
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
