package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.lf32;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.sf32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_floor0_inverse2 extends Machine
   {
      
      public static const intRegCount:int = 18;
      
      public static const NumberRegCount:int = 9;
       
      
      public var f0:Number;
      
      public var f1:Number;
      
      public var f2:Number;
      
      public var f3:Number;
      
      public var f4:Number;
      
      public var f5:Number;
      
      public var f7:Number;
      
      public var f6:Number;
      
      public var f8:Number;
      
      public var i10:int;
      
      public var i11:int;
      
      public var i12:int;
      
      public var i13:int;
      
      public var i14:int;
      
      public var i15:int;
      
      public var i17:int;
      
      public var i16:int;
      
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
      
      public function FSM_floor0_inverse2()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_floor0_inverse2 = null;
         _loc1_ = new FSM_floor0_inverse2();
         FSM_floor0_inverse2.gworker = _loc1_;
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
               this.i1 = li32(mstate.ebp + 12);
               this.i2 = li32(this.i0 + 28);
               this.i3 = li32(this.i1 + 8);
               this.i4 = this.i2 << 2;
               this.i3 = this.i3 + this.i4;
               this.i4 = li32(this.i1 + 20);
               this.i3 = li32(this.i3);
               this.i5 = li32(mstate.ebp + 20);
               this.i6 = this.i0 + 28;
               this.i7 = this.i1 + 8;
               this.i8 = li32(mstate.ebp + 16);
               this.i9 = this.i1;
               this.i10 = this.i5;
               if(this.i3 == 0)
               {
                  this.f0 = 2;
                  this.i3 = li32(this.i4 + 4);
                  this.f0 = this.f0;
                  this.f1 = Number(this.i3);
                  this.f2 = this.f0;
                  this.f0 = this.f1;
                  this.f0 = this.f0 / this.f2;
                  this.f1 = 0.00074;
                  this.i0 = li32(this.i0 + 64);
                  this.f0 = this.f0;
                  this.f1 = this.f1;
                  this.i0 = li32(this.i0 + 4);
                  this.i0 = li32(this.i0 + 28);
                  this.i3 = this.i2 << 2;
                  this.f1 = this.f1;
                  this.f0 = this.f0;
                  this.f0 = this.f0 * this.f1;
                  this.i0 = this.i0 + this.i3;
                  this.i0 = li32(this.i0);
                  this.i11 = li32(this.i1);
                  this.f0 = this.f0;
                  this.f0 = this.f0;
                  this.f0 = Math.atan(this.f0);
                  this.f1 = this.f0;
                  this.i12 = li32(this.i4 + 4);
                  this.f0 = Number(this.i12);
                  this.f0 = this.f0;
                  this.f0 = this.f0 / this.f2;
                  this.f0 = this.f0;
                  this.f0 = this.f0;
                  this.f0 = this.f0 * this.f0;
                  this.f3 = 1.85e-8;
                  this.f0 = this.f0;
                  this.f3 = this.f3;
                  this.f3 = this.f3;
                  this.f0 = this.f0;
                  this.f0 = this.f0 * this.f3;
                  this.f0 = this.f0;
                  this.f0 = this.f0;
                  this.f0 = Math.atan(this.f0);
                  this.i12 = li32(this.i4 + 4);
                  this.f3 = Number(this.i12);
                  this.f3 = this.f3;
                  this.f2 = this.f3 / this.f2;
                  this.f3 = 0.0001;
                  this.i12 = this.i0 >>> 31;
                  this.f2 = this.f2;
                  this.f3 = this.f3;
                  this.i0 = this.i0 + this.i12;
                  this.i12 = li32(this.i7);
                  this.i0 = this.i0 >> 1;
                  this.f3 = this.f3;
                  this.f2 = this.f2;
                  this.f2 = this.f2 * this.f3;
                  this.i13 = this.i0 << 2;
                  this.f2 = this.f2;
                  mstate.esp = mstate.esp - 8;
                  this.i14 = 0;
                  this.i13 = this.i13 + 4;
                  this.f0 = this.f0 * 2.24;
                  this.f1 = this.f1 * 13.1;
                  si32(this.i14,mstate.esp);
                  si32(this.i13,mstate.esp + 4);
                  this.f2 = this.f2;
                  this.f0 = this.f1 + this.f0;
                  this.f0 = this.f0 + this.f2;
                  this.f1 = Number(this.i11);
                  state = 1;
                  mstate.esp = mstate.esp - 4;
                  FSM_floor0_inverse2.start();
                  return;
               }
               break;
            case 1:
               this.i11 = mstate.eax;
               this.f0 = this.f1 / this.f0;
               this.f0 = this.f0;
               mstate.esp = mstate.esp + 8;
               this.i3 = this.i12 + this.i3;
               si32(this.i11,this.i3);
               this.f1 = this.f0;
               this.f2 = Number(this.i0);
               this.i3 = this.i4 + 4;
               this.i11 = this.i1;
               this.i12 = this.i14;
               this.i13 = this.i14;
               while(true)
               {
                  this.i14 = this.i12;
                  this.i12 = this.i13;
                  if(this.i12 >= this.i0)
                  {
                     break;
                  }
                  this.f0 = 2;
                  this.i13 = li32(this.i3);
                  this.f0 = this.f0;
                  this.f3 = Number(this.i13);
                  this.f4 = this.f0;
                  this.f0 = this.f3;
                  this.f0 = this.f0 / this.f4;
                  this.f0 = this.f0;
                  this.f3 = this.f2;
                  this.f0 = this.f0;
                  this.f0 = this.f0 / this.f3;
                  this.f0 = this.f0;
                  this.f5 = Number(this.i12);
                  this.f5 = this.f5;
                  this.f0 = this.f0;
                  this.f0 = this.f0 * this.f5;
                  this.f6 = 0.00074;
                  this.f0 = this.f0;
                  this.f6 = this.f6;
                  this.f6 = this.f6;
                  this.f0 = this.f0;
                  this.f0 = this.f0 * this.f6;
                  this.f0 = this.f0;
                  this.f0 = this.f0;
                  this.f0 = Math.atan(this.f0);
                  this.f6 = this.f0;
                  this.i13 = li32(this.i3);
                  this.f0 = Number(this.i13);
                  this.f0 = this.f0;
                  this.f0 = this.f0 / this.f4;
                  this.f0 = this.f0;
                  this.f0 = this.f0;
                  this.f0 = this.f0 / this.f3;
                  this.f0 = this.f0;
                  this.f0 = this.f0;
                  this.f0 = this.f0 * this.f5;
                  this.f0 = this.f0;
                  this.f0 = this.f0;
                  this.f0 = this.f0 * this.f0;
                  this.f7 = 1.85e-8;
                  this.f0 = this.f0;
                  this.f7 = this.f7;
                  this.f7 = this.f7;
                  this.f0 = this.f0;
                  this.f0 = this.f0 * this.f7;
                  this.f0 = this.f0;
                  this.f0 = this.f0;
                  this.f0 = Math.atan(this.f0);
                  this.i13 = li32(this.i3);
                  this.f7 = Number(this.i13);
                  this.f7 = this.f7;
                  this.f4 = this.f7 / this.f4;
                  this.f4 = this.f4;
                  this.f4 = this.f4;
                  this.f3 = this.f4 / this.f3;
                  this.f3 = this.f3;
                  this.f3 = this.f3;
                  this.f3 = this.f3 * this.f5;
                  this.f4 = 0.0001;
                  this.f3 = this.f3;
                  this.f4 = this.f4;
                  this.f4 = this.f4;
                  this.f3 = this.f3;
                  this.f3 = this.f3 * this.f4;
                  this.f3 = this.f3;
                  this.f0 = this.f0 * 2.24;
                  this.f4 = this.f6 * 13.1;
                  this.f3 = this.f3;
                  this.f0 = this.f4 + this.f0;
                  this.f0 = this.f0 + this.f3;
                  this.f0 = this.f0 * this.f1;
                  this.f0 = Math.floor(this.f0);
                  this.i13 = li32(this.i7);
                  this.i15 = this.i2 << 2;
                  this.i16 = li32(this.i11);
                  this.i13 = this.i13 + this.i15;
                  this.i13 = li32(this.i13);
                  this.i15 = this.i16 + -1;
                  this.i17 = int(this.f0);
                  this.i15 = this.i16 > this.i17?int(this.i17):int(this.i15);
                  this.i13 = this.i13 + this.i14;
                  si32(this.i15,this.i13);
                  this.i13 = this.i14 + 4;
                  this.i14 = this.i12 + 1;
                  this.i12 = this.i13;
                  this.i13 = this.i14;
               }
               this.i3 = -1;
               this.i11 = li32(this.i7);
               this.i2 = this.i2 << 2;
               this.i11 = this.i11 + this.i2;
               this.i11 = li32(this.i11);
               this.i12 = this.i12 << 2;
               this.i11 = this.i11 + this.i12;
               si32(this.i3,this.i11);
               this.i2 = this.i9 + this.i2;
               si32(this.i0,this.i2 + 12);
         }
         if(this.i8 != 0)
         {
            this.i0 = 0;
            this.i2 = li32(this.i9 + 4);
            this.i6 = li32(this.i6);
            this.i1 = li32(this.i1);
            this.i6 = this.i6 << 2;
            this.i3 = li32(this.i7);
            this.i7 = this.i2 << 2;
            this.f0 = Number(this.i1);
            this.i9 = this.i9 + this.i6;
            this.i6 = this.i3 + this.i6;
            this.i1 = this.i8 + this.i7;
            this.i3 = li32(this.i4 + 16);
            this.f0 = 3.14159 / this.f0;
            this.f1 = lf32(this.i1);
            this.i9 = li32(this.i9 + 12);
            this.i6 = li32(this.i6);
            this.f2 = this.f0;
            this.f3 = Number(this.i3);
            this.i1 = this.i6;
            this.i3 = this.i8;
            this.i4 = this.i8;
            this.i7 = this.i3;
            while(true)
            {
               this.i8 = this.i0;
               this.i0 = this.i7;
               if(this.i8 >= this.i2)
               {
                  break;
               }
               this.f0 = lf32(this.i0);
               this.f0 = Math.cos(this.f0);
               this.f0 = this.f0 + this.f0;
               this.f0 = this.f0;
               sf32(this.f0,this.i0);
               this.i0 = this.i7 + 4;
               this.i8 = this.i8 + 1;
               this.i7 = this.i0;
               this.i0 = this.i8;
            }
            this.i0 = 0;
            this.f3 = this.f3;
            this.f1 = this.f1;
            while(this.i0 < this.i9)
            {
               this.f4 = 0.5;
               this.i7 = this.i0 << 2;
               this.i7 = this.i1 + this.i7;
               this.i7 = li32(this.i7);
               this.f0 = Number(this.i7);
               this.f5 = this.f2;
               this.f0 = this.f0;
               this.f0 = this.f0 * this.f5;
               this.f0 = this.f0;
               this.f0 = this.f0;
               this.f0 = Math.cos(this.f0);
               this.f0 = this.f0 + this.f0;
               this.f4 = this.f4;
               this.i8 = 1;
               this.f0 = this.f0;
               this.i11 = this.i3;
               this.f5 = this.f4;
               while(true)
               {
                  this.i12 = this.i11;
                  this.i11 = this.i8;
                  this.i8 = this.i12;
                  if(this.i11 >= this.i2)
                  {
                     break;
                  }
                  this.f6 = lf32(this.i8);
                  this.f7 = lf32(this.i12 + 4);
                  this.f8 = this.f0;
                  this.f6 = this.f8 - this.f6;
                  this.f7 = this.f8 - this.f7;
                  this.f6 = this.f6;
                  this.f7 = this.f7;
                  this.f4 = this.f4;
                  this.f6 = this.f6;
                  this.f5 = this.f5;
                  this.f7 = this.f7;
                  this.f4 = this.f6 * this.f4;
                  this.f5 = this.f7 * this.f5;
                  this.f4 = this.f4;
                  this.f5 = this.f5;
                  this.i8 = this.i12 + 8;
                  this.i12 = this.i11 + 2;
                  this.i11 = this.i8;
                  this.i8 = this.i12;
               }
               if(this.i11 == this.i2)
               {
                  this.f6 = 4;
                  this.i8 = this.i11 << 2;
                  this.i8 = this.i8 + this.i4;
                  this.f0 = this.f0;
                  this.f7 = lf32(this.i8 + -4);
                  this.f7 = this.f0 - this.f7;
                  this.f7 = this.f7;
                  this.f4 = this.f4;
                  this.f7 = this.f7;
                  this.f4 = this.f7 * this.f4;
                  this.f0 = this.f0 * this.f0;
                  this.f4 = this.f4;
                  this.f0 = this.f0;
                  this.f6 = this.f6;
                  this.f7 = this.f4;
               }
               else
               {
                  this.f6 = 2;
                  this.f6 = this.f6;
                  this.f7 = this.f6;
                  this.f8 = this.f0;
                  this.f7 = this.f8 + this.f7;
                  this.f7 = this.f7;
                  this.f8 = this.f4;
                  this.f7 = this.f7;
                  this.f7 = this.f7 * this.f8;
                  this.f7 = this.f7;
               }
               this.f0 = this.f0;
               this.f6 = this.f6;
               this.f0 = this.f6 - this.f0;
               this.f0 = this.f0;
               this.f5 = this.f5;
               this.f0 = this.f0;
               this.f0 = this.f0 * this.f5;
               this.f0 = this.f0;
               this.f0 = this.f0;
               this.f4 = this.f4;
               this.f6 = this.f7;
               this.f0 = this.f0 * this.f5;
               this.f4 = this.f6 * this.f4;
               this.f0 = this.f0;
               this.f4 = this.f4;
               this.f4 = this.f4;
               this.f0 = this.f0;
               this.f0 = this.f0 + this.f4;
               this.f0 = this.f0;
               this.f0 = this.f0;
               this.f0 = Math.sqrt(this.f0);
               this.f0 = this.f1 / this.f0;
               this.f0 = this.f0 - this.f3;
               this.f0 = this.f0 * 0.115129;
               this.i8 = this.i0 << 2;
               this.f0 = Math.exp(this.f0);
               this.i11 = this.i5 + this.i8;
               this.f0 = this.f0;
               this.f4 = lf32(this.i11);
               this.f5 = this.f0;
               this.f4 = this.f4 * this.f5;
               this.f4 = this.f4;
               sf32(this.f4,this.i11);
               this.i8 = this.i8 + 4;
               this.i0 = this.i0 + 1;
               while(true)
               {
                  this.i11 = this.i6 + this.i8;
                  this.i11 = li32(this.i11);
                  if(this.i11 != this.i7)
                  {
                     break;
                  }
                  this.i11 = this.i10 + this.i8;
                  this.f4 = lf32(this.i11);
                  this.f5 = this.f0;
                  this.f4 = this.f4 * this.f5;
                  this.f4 = this.f4;
                  sf32(this.f4,this.i11);
                  this.i8 = this.i8 + 4;
                  this.i0 = this.i0 + 1;
               }
            }
            this.i0 = 1;
         }
         else
         {
            this.i0 = 0;
            this.i1 = li32(this.i6);
            this.i1 = this.i1 << 2;
            this.i1 = this.i9 + this.i1;
            this.i1 = li32(this.i1 + 12);
            this.i2 = this.i5;
            this.i1 = this.i1 << 2;
            memset(this.i2,this.i0,this.i1);
         }
         mstate.eax = this.i0;
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
