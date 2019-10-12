package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_floor1_pack extends Machine
   {
      
      public static const intRegCount:int = 15;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i10:int;
      
      public var i11:int;
      
      public var i12:int;
      
      public var i13:int;
      
      public var i14:int;
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public var i5:int;
      
      public var i6:int;
      
      public var i7:int;
      
      public var i8:int;
      
      public var i9:int;
      
      public function FSM_floor1_pack()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_floor1_pack = null;
         _loc1_ = new FSM_floor1_pack();
         FSM_floor1_pack.gworker = _loc1_;
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
               this.i0 = 5;
               this.i1 = li32(mstate.ebp + 8);
               this.i2 = li32(this.i1 + 840);
               this.i3 = li32(this.i1);
               mstate.esp = mstate.esp - 12;
               this.i4 = li32(mstate.ebp + 12);
               si32(this.i4,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i0,mstate.esp + 8);
               state = 1;
               mstate.esp = mstate.esp - 4;
               FSM_floor1_pack.start();
               return;
            case 1:
               mstate.esp = mstate.esp + 12;
               this.i0 = -1;
               this.i3 = this.i1 + 4;
               this.i5 = 0;
               this.i6 = this.i1;
               this.i7 = this.i1;
               addr204:
               this.i8 = this.i3;
               this.i3 = this.i0;
               this.i9 = li32(this.i6);
               this.i0 = this.i8;
               if(this.i9 <= this.i5)
               {
                  this.i0 = 0;
                  this.i5 = this.i1 + 320;
                  this.i3 = this.i3 + 1;
                  this.i8 = this.i1;
                  break;
               }
               this.i9 = 4;
               this.i10 = li32(this.i0);
               mstate.esp = mstate.esp - 12;
               si32(this.i4,mstate.esp);
               si32(this.i10,mstate.esp + 4);
               si32(this.i9,mstate.esp + 8);
               state = 2;
               mstate.esp = mstate.esp - 4;
               FSM_floor1_pack.start();
               return;
            case 2:
               mstate.esp = mstate.esp + 12;
               this.i0 = li32(this.i0);
               this.i0 = this.i0 > this.i3?int(this.i0):int(this.i3);
               this.i3 = this.i8 + 4;
               this.i5 = this.i5 + 1;
               §§goto(addr204);
            case 3:
               mstate.esp = mstate.esp + 12;
               this.i8 = li32(this.i5 + 192);
               mstate.esp = mstate.esp - 12;
               this.i10 = 2;
               si32(this.i4,mstate.esp);
               si32(this.i8,mstate.esp + 4);
               si32(this.i10,mstate.esp + 8);
               state = 4;
               mstate.esp = mstate.esp - 4;
               FSM_floor1_pack.start();
               return;
            case 4:
               mstate.esp = mstate.esp + 12;
               this.i8 = li32(this.i5 + 192);
               this.i10 = this.i5 + 192;
               if(this.i8 == 0)
               {
                  this.i8 = 0;
                  this.i11 = this.i9;
                  addr530:
                  this.i12 = this.i11;
                  this.i11 = this.i8;
                  this.i13 = 1;
                  this.i14 = li32(this.i10);
                  this.i8 = this.i12;
                  this.i13 = this.i13 << this.i14;
                  if(this.i13 <= this.i11)
                  {
                     this.i8 = this.i9 + 32;
                     this.i9 = this.i5 + 4;
                     this.i0 = this.i0 + 1;
                     this.i5 = this.i8;
                     this.i8 = this.i9;
                     break;
                  }
                  this.i13 = 8;
                  this.i8 = li32(this.i8);
                  mstate.esp = mstate.esp - 12;
                  this.i8 = this.i8 + 1;
                  si32(this.i4,mstate.esp);
                  si32(this.i8,mstate.esp + 4);
                  si32(this.i13,mstate.esp + 8);
                  state = 6;
                  mstate.esp = mstate.esp - 4;
                  FSM_floor1_pack.start();
                  return;
               }
               this.i8 = 8;
               this.i11 = li32(this.i5 + 256);
               mstate.esp = mstate.esp - 12;
               si32(this.i4,mstate.esp);
               si32(this.i11,mstate.esp + 4);
               si32(this.i8,mstate.esp + 8);
               state = 5;
               mstate.esp = mstate.esp - 4;
               FSM_floor1_pack.start();
               return;
            case 5:
               mstate.esp = mstate.esp + 12;
               this.i8 = 0;
               this.i11 = this.i9;
               §§goto(addr530);
            case 6:
               mstate.esp = mstate.esp + 12;
               this.i8 = this.i12 + 4;
               this.i12 = this.i11 + 1;
               this.i11 = this.i8;
               this.i8 = this.i12;
               §§goto(addr530);
            case 7:
               mstate.esp = mstate.esp + 12;
               mstate.esp = mstate.esp - 4;
               si32(this.i2,mstate.esp);
               mstate.esp = mstate.esp - 4;
               FSM_floor1_pack.start();
            case 8:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp - 12;
               this.i3 = 4;
               si32(this.i4,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               state = 9;
               mstate.esp = mstate.esp - 4;
               FSM_floor1_pack.start();
               return;
            case 9:
               mstate.esp = mstate.esp + 12;
               mstate.esp = mstate.esp - 4;
               si32(this.i2,mstate.esp);
               mstate.esp = mstate.esp - 4;
               FSM_floor1_pack.start();
            case 10:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               this.i2 = this.i1 + 4;
               this.i3 = 0;
               this.i5 = this.i3;
               this.i8 = this.i3;
               loop0:
               while(true)
               {
                  this.i10 = this.i2;
                  this.i9 = this.i5;
                  this.i2 = this.i8;
                  this.i8 = li32(this.i6);
                  this.i5 = this.i10;
                  if(this.i8 <= this.i9)
                  {
                     break;
                  }
                  addr915:
                  this.i5 = li32(this.i5);
                  this.i5 = this.i5 << 2;
                  this.i5 = this.i7 + this.i5;
                  this.i8 = this.i2 << 2;
                  this.i5 = li32(this.i5 + 128);
                  this.i8 = this.i1 + this.i8;
                  this.i8 = this.i8 + 844;
                  this.i3 = this.i5 + this.i3;
                  this.i5 = this.i8;
                  while(true)
                  {
                     this.i8 = this.i2;
                     this.i2 = this.i5;
                     if(this.i8 >= this.i3)
                     {
                        this.i2 = this.i10 + 4;
                        this.i5 = this.i9 + 1;
                        continue loop0;
                     }
                     this.i2 = li32(this.i2);
                     mstate.esp = mstate.esp - 12;
                     si32(this.i4,mstate.esp);
                     si32(this.i2,mstate.esp + 4);
                     si32(this.i0,mstate.esp + 8);
                     state = 11;
                     mstate.esp = mstate.esp - 4;
                     FSM_floor1_pack.start();
                     return;
                  }
               }
               mstate.esp = mstate.ebp;
               mstate.ebp = li32(mstate.esp);
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp + 4;
               mstate.gworker = caller;
               return;
            case 11:
               mstate.esp = mstate.esp + 12;
               this.i2 = this.i5 + 4;
               this.i8 = this.i8 + 1;
               this.i5 = this.i2;
               this.i2 = this.i8;
               §§goto(addr915);
         }
         this.i9 = this.i5;
         this.i5 = this.i8;
         if(this.i3 <= this.i0)
         {
            this.i0 = 2;
            this.i3 = li32(this.i7 + 832);
            mstate.esp = mstate.esp - 12;
            this.i3 = this.i3 + -1;
            si32(this.i4,mstate.esp);
            si32(this.i3,mstate.esp + 4);
            si32(this.i0,mstate.esp + 8);
            state = 7;
            mstate.esp = mstate.esp - 4;
            FSM_floor1_pack.start();
            return;
         }
         this.i8 = 3;
         this.i10 = li32(this.i5 + 128);
         mstate.esp = mstate.esp - 12;
         this.i10 = this.i10 + -1;
         si32(this.i4,mstate.esp);
         si32(this.i10,mstate.esp + 4);
         si32(this.i8,mstate.esp + 8);
         state = 3;
         mstate.esp = mstate.esp - 4;
         FSM_floor1_pack.start();
      }
   }
}
