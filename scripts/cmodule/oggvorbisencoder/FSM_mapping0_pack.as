package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_mapping0_pack extends Machine
   {
      
      public static const intRegCount:int = 10;
      
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
      
      public var i9:int;
      
      public function FSM_mapping0_pack()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_mapping0_pack = null;
         _loc1_ = new FSM_mapping0_pack();
         FSM_mapping0_pack.gworker = _loc1_;
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
               this.i0 = li32(mstate.ebp + 12);
               this.i1 = li32(this.i0);
               this.i2 = li32(mstate.ebp + 8);
               this.i3 = li32(mstate.ebp + 16);
               this.i4 = this.i0;
               this.i5 = this.i0;
               if(this.i1 >= 2)
               {
                  this.i1 = 1;
                  mstate.esp = mstate.esp - 12;
                  si32(this.i3,mstate.esp);
                  si32(this.i1,mstate.esp + 4);
                  si32(this.i1,mstate.esp + 8);
                  state = 1;
                  mstate.esp = mstate.esp - 4;
                  FSM_mapping0_pack.start();
                  return;
               }
               this.i1 = 1;
               mstate.esp = mstate.esp - 12;
               this.i6 = 0;
               si32(this.i3,mstate.esp);
               si32(this.i6,mstate.esp + 4);
               si32(this.i1,mstate.esp + 8);
               state = 3;
               mstate.esp = mstate.esp - 4;
               FSM_mapping0_pack.start();
               return;
            case 1:
               mstate.esp = mstate.esp + 12;
               this.i1 = li32(this.i0);
               mstate.esp = mstate.esp - 12;
               this.i1 = this.i1 + -1;
               this.i6 = 4;
               si32(this.i3,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               si32(this.i6,mstate.esp + 8);
               state = 2;
               mstate.esp = mstate.esp - 4;
               FSM_mapping0_pack.start();
               return;
            case 2:
               mstate.esp = mstate.esp + 12;
               addr221:
               this.i1 = li32(this.i5 + 1156);
               this.i5 = this.i5 + 1156;
               if(this.i1 >= 1)
               {
                  this.i1 = 1;
                  mstate.esp = mstate.esp - 12;
                  si32(this.i3,mstate.esp);
                  si32(this.i1,mstate.esp + 4);
                  si32(this.i1,mstate.esp + 8);
                  state = 4;
                  mstate.esp = mstate.esp - 4;
                  FSM_mapping0_pack.start();
                  return;
               }
               this.i1 = 1;
               mstate.esp = mstate.esp - 12;
               this.i5 = 0;
               si32(this.i3,mstate.esp);
               si32(this.i5,mstate.esp + 4);
               si32(this.i1,mstate.esp + 8);
               state = 10;
               mstate.esp = mstate.esp - 4;
               FSM_mapping0_pack.start();
               return;
            case 3:
               mstate.esp = mstate.esp + 12;
               §§goto(addr221);
            case 4:
               mstate.esp = mstate.esp + 12;
               this.i1 = li32(this.i5);
               mstate.esp = mstate.esp - 12;
               this.i1 = this.i1 + -1;
               this.i6 = 8;
               si32(this.i3,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               si32(this.i6,mstate.esp + 8);
               state = 5;
               mstate.esp = mstate.esp - 4;
               FSM_mapping0_pack.start();
               return;
            case 5:
               mstate.esp = mstate.esp + 12;
               this.i1 = this.i2 + 4;
               this.i6 = 0;
               this.i7 = this.i4;
               addr543:
               this.i8 = li32(this.i5);
               if(this.i8 <= this.i6)
               {
                  addr605:
                  this.i1 = 2;
                  mstate.esp = mstate.esp - 12;
                  this.i5 = 0;
                  si32(this.i3,mstate.esp);
                  si32(this.i5,mstate.esp + 4);
                  si32(this.i1,mstate.esp + 8);
                  state = 11;
                  mstate.esp = mstate.esp - 4;
                  FSM_mapping0_pack.start();
                  return;
               }
               this.i8 = li32(this.i1);
               mstate.esp = mstate.esp - 4;
               si32(this.i8,mstate.esp);
               mstate.esp = mstate.esp - 4;
               FSM_mapping0_pack.start();
            case 6:
               this.i8 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               this.i9 = li32(this.i7 + 1160);
               mstate.esp = mstate.esp - 12;
               si32(this.i3,mstate.esp);
               si32(this.i9,mstate.esp + 4);
               si32(this.i8,mstate.esp + 8);
               state = 7;
               mstate.esp = mstate.esp - 4;
               FSM_mapping0_pack.start();
               return;
            case 7:
               mstate.esp = mstate.esp + 12;
               this.i8 = li32(this.i1);
               mstate.esp = mstate.esp - 4;
               si32(this.i8,mstate.esp);
               mstate.esp = mstate.esp - 4;
               FSM_mapping0_pack.start();
            case 8:
               this.i8 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               this.i9 = li32(this.i7 + 2184);
               mstate.esp = mstate.esp - 12;
               si32(this.i3,mstate.esp);
               si32(this.i9,mstate.esp + 4);
               si32(this.i8,mstate.esp + 8);
               state = 9;
               mstate.esp = mstate.esp - 4;
               FSM_mapping0_pack.start();
               return;
            case 9:
               mstate.esp = mstate.esp + 12;
               this.i7 = this.i7 + 4;
               this.i6 = this.i6 + 1;
               §§goto(addr543);
            case 10:
               mstate.esp = mstate.esp + 12;
               §§goto(addr605);
            case 11:
               mstate.esp = mstate.esp + 12;
               this.i1 = li32(this.i0);
               if(this.i1 > 1)
               {
                  this.i1 = 0;
                  this.i5 = this.i4 + 4;
                  this.i2 = this.i2 + 4;
                  addr760:
                  this.i6 = this.i1;
                  this.i7 = li32(this.i2);
                  this.i1 = this.i5;
                  if(this.i7 > this.i6)
                  {
                     this.i7 = 4;
                     this.i1 = li32(this.i1);
                     mstate.esp = mstate.esp - 12;
                     si32(this.i3,mstate.esp);
                     si32(this.i1,mstate.esp + 4);
                     si32(this.i7,mstate.esp + 8);
                     state = 12;
                     mstate.esp = mstate.esp - 4;
                     FSM_mapping0_pack.start();
                     return;
                  }
               }
               this.i2 = 0;
               break;
            case 12:
               mstate.esp = mstate.esp + 12;
               this.i1 = this.i5 + 4;
               this.i6 = this.i6 + 1;
               this.i5 = this.i1;
               this.i1 = this.i6;
               §§goto(addr760);
            case 13:
               mstate.esp = mstate.esp + 12;
               this.i5 = li32(this.i4 + 1028);
               mstate.esp = mstate.esp - 12;
               si32(this.i3,mstate.esp);
               si32(this.i5,mstate.esp + 4);
               si32(this.i1,mstate.esp + 8);
               state = 14;
               mstate.esp = mstate.esp - 4;
               FSM_mapping0_pack.start();
               return;
            case 14:
               mstate.esp = mstate.esp + 12;
               this.i5 = li32(this.i4 + 1092);
               mstate.esp = mstate.esp - 12;
               si32(this.i3,mstate.esp);
               si32(this.i5,mstate.esp + 4);
               si32(this.i1,mstate.esp + 8);
               state = 15;
               mstate.esp = mstate.esp - 4;
               FSM_mapping0_pack.start();
               return;
            case 15:
               mstate.esp = mstate.esp + 12;
               this.i4 = this.i4 + 4;
               this.i2 = this.i2 + 1;
         }
         this.i1 = li32(this.i0);
         if(this.i1 <= this.i2)
         {
            mstate.esp = mstate.ebp;
            mstate.ebp = li32(mstate.esp);
            mstate.esp = mstate.esp + 4;
            mstate.esp = mstate.esp + 4;
            mstate.gworker = caller;
            return;
         }
         this.i1 = 8;
         mstate.esp = mstate.esp - 12;
         this.i5 = 0;
         si32(this.i3,mstate.esp);
         si32(this.i5,mstate.esp + 4);
         si32(this.i1,mstate.esp + 8);
         state = 13;
         mstate.esp = mstate.esp - 4;
         FSM_mapping0_pack.start();
      }
   }
}
