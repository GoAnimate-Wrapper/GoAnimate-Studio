package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_res0_pack extends Machine
   {
      
      public static const intRegCount:int = 11;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i10:int;
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public var i5:int;
      
      public var i6:int;
      
      public var i8:int;
      
      public var i7:int;
      
      public var i9:int;
      
      public function FSM_res0_pack()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_res0_pack = null;
         _loc1_ = new FSM_res0_pack();
         FSM_res0_pack.gworker = _loc1_;
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
               this.i0 = 24;
               this.i1 = li32(mstate.ebp + 8);
               this.i2 = li32(this.i1);
               mstate.esp = mstate.esp - 12;
               this.i3 = li32(mstate.ebp + 12);
               si32(this.i3,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i0,mstate.esp + 8);
               state = 1;
               mstate.esp = mstate.esp - 4;
               FSM_res0_pack.start();
               return;
            case 1:
               mstate.esp = mstate.esp + 12;
               this.i2 = li32(this.i1 + 4);
               mstate.esp = mstate.esp - 12;
               si32(this.i3,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i0,mstate.esp + 8);
               state = 2;
               mstate.esp = mstate.esp - 4;
               FSM_res0_pack.start();
               return;
            case 2:
               mstate.esp = mstate.esp + 12;
               this.i2 = li32(this.i1 + 8);
               mstate.esp = mstate.esp - 12;
               this.i2 = this.i2 + -1;
               si32(this.i3,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i0,mstate.esp + 8);
               state = 3;
               mstate.esp = mstate.esp - 4;
               FSM_res0_pack.start();
               return;
            case 3:
               mstate.esp = mstate.esp + 12;
               this.i0 = li32(this.i1 + 12);
               mstate.esp = mstate.esp - 12;
               this.i2 = 6;
               this.i0 = this.i0 + -1;
               si32(this.i3,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 4;
               mstate.esp = mstate.esp - 4;
               FSM_res0_pack.start();
               return;
            case 4:
               mstate.esp = mstate.esp + 12;
               this.i0 = li32(this.i1 + 20);
               mstate.esp = mstate.esp - 12;
               this.i2 = 8;
               si32(this.i3,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 5;
               mstate.esp = mstate.esp - 4;
               FSM_res0_pack.start();
               return;
            case 5:
               mstate.esp = mstate.esp + 12;
               this.i0 = this.i1 + 24;
               this.i2 = this.i1 + 12;
               this.i4 = 0;
               this.i5 = this.i4;
               addr638:
               this.i6 = this.i0;
               this.i0 = this.i4;
               this.i7 = li32(this.i2);
               this.i4 = this.i6;
               if(this.i7 <= this.i5)
               {
                  this.i2 = 0;
                  this.i1 = this.i1 + 280;
                  break;
               }
               this.i7 = 0;
               this.i8 = li32(this.i4);
               this.i9 = this.i8;
               while(true)
               {
                  this.i10 = this.i7;
                  this.i7 = this.i9;
                  if(this.i7 == 0)
                  {
                     break;
                  }
                  this.i9 = this.i10 + 1;
                  this.i10 = this.i7 >>> 1;
                  this.i7 = this.i9;
                  this.i9 = this.i10;
               }
               if(this.i10 >= 4)
               {
                  this.i7 = 3;
                  mstate.esp = mstate.esp - 12;
                  si32(this.i3,mstate.esp);
                  si32(this.i8,mstate.esp + 4);
                  si32(this.i7,mstate.esp + 8);
                  state = 6;
                  mstate.esp = mstate.esp - 4;
                  FSM_res0_pack.start();
                  return;
               }
               this.i7 = 4;
               mstate.esp = mstate.esp - 12;
               si32(this.i3,mstate.esp);
               si32(this.i8,mstate.esp + 4);
               si32(this.i7,mstate.esp + 8);
               state = 9;
               mstate.esp = mstate.esp - 4;
               FSM_res0_pack.start();
               return;
            case 6:
               mstate.esp = mstate.esp + 12;
               mstate.esp = mstate.esp - 12;
               this.i8 = 1;
               si32(this.i3,mstate.esp);
               si32(this.i8,mstate.esp + 4);
               si32(this.i8,mstate.esp + 8);
               state = 7;
               mstate.esp = mstate.esp - 4;
               FSM_res0_pack.start();
               return;
            case 7:
               mstate.esp = mstate.esp + 12;
               this.i8 = li32(this.i4);
               mstate.esp = mstate.esp - 12;
               this.i7 = 5;
               this.i8 = this.i8 >> 3;
               si32(this.i3,mstate.esp);
               si32(this.i8,mstate.esp + 4);
               si32(this.i7,mstate.esp + 8);
               state = 8;
               mstate.esp = mstate.esp - 4;
               FSM_res0_pack.start();
               return;
            case 8:
               mstate.esp = mstate.esp + 12;
               addr576:
               this.i7 = 0;
               this.i4 = li32(this.i4);
               while(this.i4 != 0)
               {
                  this.i8 = this.i4 & 1;
                  this.i4 = this.i4 >>> 1;
                  this.i7 = this.i8 + this.i7;
               }
               this.i4 = this.i6 + 4;
               this.i5 = this.i5 + 1;
               this.i6 = this.i7 + this.i0;
               this.i0 = this.i4;
               this.i4 = this.i6;
               §§goto(addr638);
            case 9:
               mstate.esp = mstate.esp + 12;
               §§goto(addr576);
            case 10:
               mstate.esp = mstate.esp + 12;
               this.i1 = this.i4 + 4;
               this.i2 = this.i2 + 1;
         }
         this.i4 = this.i1;
         this.i1 = this.i4;
         if(this.i2 >= this.i0)
         {
            mstate.esp = mstate.ebp;
            mstate.ebp = li32(mstate.esp);
            mstate.esp = mstate.esp + 4;
            mstate.esp = mstate.esp + 4;
            mstate.gworker = caller;
            return;
         }
         this.i5 = 8;
         this.i1 = li32(this.i1);
         mstate.esp = mstate.esp - 12;
         si32(this.i3,mstate.esp);
         si32(this.i1,mstate.esp + 4);
         si32(this.i5,mstate.esp + 8);
         state = 10;
         mstate.esp = mstate.esp - 4;
         FSM_res0_pack.start();
      }
   }
}
