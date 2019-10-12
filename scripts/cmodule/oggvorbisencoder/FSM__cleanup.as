package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li16;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM__cleanup extends Machine
   {
      
      public static const intRegCount:int = 6;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public var i5:int;
      
      public function FSM__cleanup()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM__cleanup = null;
         _loc1_ = new FSM__cleanup();
         FSM__cleanup.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         loop4:
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 0;
               this.i0 = FSM__cleanup;
               this.i1 = 0;
               loop0:
               while(true)
               {
                  this.i2 = li32(this.i0 + 4);
                  this.i3 = li32(this.i0 + 8);
                  this.i4 = this.i2 + -1;
                  if(this.i4 <= -1)
                  {
                     addr157:
                     while(true)
                     {
                        this.i0 = li32(this.i0);
                        if(this.i0 != 0)
                        {
                           continue loop0;
                        }
                        break loop0;
                     }
                  }
                  else
                  {
                     this.i2 = this.i2 + -1;
                     addr69:
                     while(true)
                     {
                        this.i4 = li16(this.i3 + 12);
                        this.i4 = this.i4 << 16;
                        this.i4 = this.i4 >> 16;
                        this.i5 = this.i3;
                        if(this.i4 <= 0)
                        {
                           break loop4;
                        }
                        break;
                     }
                     mstate.esp = mstate.esp - 4;
                     si32(this.i5,mstate.esp);
                     state = 1;
                     mstate.esp = mstate.esp - 4;
                     FSM__cleanup.start();
                     return;
                  }
               }
               mstate.esp = mstate.ebp;
               mstate.ebp = li32(mstate.esp);
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp + 4;
               mstate.gworker = caller;
               return;
            case 1:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               this.i1 = this.i4 | this.i1;
         }
         while(true)
         {
            this.i3 = this.i3 + 88;
            this.i2 = this.i2 + -1;
            if(this.i2 <= -1)
            {
               §§goto(addr157);
            }
            §§goto(addr69);
         }
      }
   }
}
