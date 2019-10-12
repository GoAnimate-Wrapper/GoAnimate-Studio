package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_res0_free_look extends Machine
   {
      
      public static const intRegCount:int = 9;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public var i5:int;
      
      public var i6:int;
      
      public var i8:int;
      
      public var i7:int;
      
      public function FSM_res0_free_look()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_res0_free_look = null;
         _loc1_ = new FSM_res0_free_look();
         FSM_res0_free_look.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         loop2:
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
                  this.i1 = 0;
                  this.i2 = this.i0 + 20;
                  this.i3 = this.i0 + 4;
                  this.i4 = this.i0;
                  this.i5 = this.i1;
                  addr144:
                  while(true)
                  {
                     this.i6 = this.i5;
                     this.i5 = this.i1;
                     this.i7 = li32(this.i3);
                     this.i1 = li32(this.i2);
                     this.i8 = this.i1;
                     if(this.i7 <= this.i5)
                     {
                        break;
                     }
                     this.i1 = this.i1 + this.i6;
                     this.i1 = li32(this.i1);
                     if(this.i1 != 0)
                     {
                        this.i7 = 0;
                        mstate.esp = mstate.esp - 8;
                        si32(this.i1,mstate.esp);
                        si32(this.i7,mstate.esp + 4);
                        state = 1;
                        mstate.esp = mstate.esp - 4;
                        FSM_res0_free_look.start();
                        return;
                     }
                     break loop2;
                  }
                  this.i1 = 0;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i8,mstate.esp);
                  si32(this.i1,mstate.esp + 4);
                  state = 2;
                  mstate.esp = mstate.esp - 4;
                  FSM_res0_free_look.start();
                  return;
               }
               addr438:
               mstate.esp = mstate.ebp;
               mstate.ebp = li32(mstate.esp);
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp + 4;
               mstate.gworker = caller;
               return;
            case 1:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               break;
            case 2:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = this.i4 + 28;
               this.i3 = this.i4 + 24;
               this.i4 = this.i1;
               addr310:
               this.i5 = this.i4;
               this.i4 = this.i1;
               this.i6 = li32(this.i3);
               this.i1 = li32(this.i2);
               this.i7 = this.i1;
               if(this.i6 <= this.i4)
               {
                  this.i1 = 0;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i7,mstate.esp);
                  si32(this.i1,mstate.esp + 4);
                  state = 4;
                  mstate.esp = mstate.esp - 4;
                  FSM_res0_free_look.start();
                  return;
               }
               this.i6 = 0;
               this.i1 = this.i1 + this.i5;
               this.i1 = li32(this.i1);
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i6,mstate.esp + 4);
               state = 3;
               mstate.esp = mstate.esp - 4;
               FSM_res0_free_look.start();
               return;
            case 3:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i1 = this.i5 + 4;
               this.i5 = this.i4 + 1;
               this.i4 = this.i1;
               this.i1 = this.i5;
               §§goto(addr310);
            case 4:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = this.i0;
               this.i3 = 44;
               memset(this.i2,this.i1,this.i3);
               mstate.esp = mstate.esp - 8;
               si32(this.i0,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               state = 5;
               mstate.esp = mstate.esp - 4;
               FSM_res0_free_look.start();
               return;
            case 5:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr438);
         }
         while(true)
         {
            this.i1 = this.i6 + 4;
            this.i6 = this.i5 + 1;
            this.i5 = this.i1;
            this.i1 = this.i6;
            §§goto(addr144);
         }
      }
   }
}
