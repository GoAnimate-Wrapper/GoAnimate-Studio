package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.sf32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_mdct_init extends Machine
   {
      
      public static const intRegCount:int = 14;
      
      public static const NumberRegCount:int = 6;
       
      
      public var i10:int;
      
      public var i11:int;
      
      public var i12:int;
      
      public var i13:int;
      
      public var f2:Number;
      
      public var f3:Number;
      
      public var f5:Number;
      
      public var f0:Number;
      
      public var f4:Number;
      
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
      
      public var f1:Number;
      
      public function FSM_mdct_init()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_mdct_init = null;
         _loc1_ = new FSM_mdct_init();
         FSM_mdct_init.gworker = _loc1_;
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
               this.i1 = li32(mstate.ebp + 12);
               this.i2 = this.i1 >> 31;
               this.i2 = this.i2 >>> 30;
               this.i2 = this.i1 + this.i2;
               mstate.esp = mstate.esp - 8;
               this.i3 = this.i2 & -4;
               si32(this.i0,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               this.i2 = this.i2 >> 2;
               state = 1;
               mstate.esp = mstate.esp - 4;
               FSM_mdct_init.start();
               return;
            case 1:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i4 = this.i2 + this.i1;
               mstate.esp = mstate.esp - 8;
               this.i4 = this.i4 << 2;
               si32(this.i0,mstate.esp);
               si32(this.i4,mstate.esp + 4);
               this.f1 = Number(this.i1);
               state = 2;
               mstate.esp = mstate.esp - 4;
               FSM_mdct_init.start();
               return;
            case 2:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.f0 = this.f1;
               this.f0 = Math.log(this.f0);
               this.f0 = this.f0 / 0.693147;
               this.f0 = this.f0 + 0.5;
               this.f0 = Math.floor(this.f0);
               this.i5 = li32(mstate.ebp + 8);
               this.i6 = int(this.f0);
               si32(this.i6,this.i5 + 4);
               si32(this.i1,this.i5);
               si32(this.i4,this.i5 + 8);
               this.i7 = this.i1 & 2147483646;
               this.i8 = this.i1 << 1;
               si32(this.i3,this.i5 + 12);
               this.i7 = this.i7 << 1;
               this.f2 = Number(this.i8);
               this.f3 = Number(this.i1);
               this.i8 = 1;
               this.i9 = this.i4;
               this.i10 = this.i0;
               while(true)
               {
                  this.i11 = this.i10;
                  this.i10 = this.i8;
                  this.i8 = this.i0;
                  this.i0 = this.i9;
                  if(this.i2 <= this.i8)
                  {
                     break;
                  }
                  this.f4 = Number(this.i11);
                  this.f0 = 3.14159 / this.f3;
                  this.f0 = this.f0 * this.f4;
                  this.f0 = Math.cos(this.f0);
                  this.f5 = -3.14159 / this.f3;
                  this.f0 = this.f0;
                  sf32(this.f0,this.i0);
                  this.f0 = this.f5 * this.f4;
                  this.f0 = Math.sin(this.f0);
                  this.f0 = this.f0;
                  this.f4 = Number(this.i10);
                  this.f5 = 3.14159 / this.f2;
                  sf32(this.f0,this.i9 + 4);
                  this.f4 = this.f5 * this.f4;
                  this.f0 = this.f4;
                  this.f0 = Math.cos(this.f0);
                  this.i0 = this.i7 + this.i9;
                  this.f0 = this.f0;
                  sf32(this.f0,this.i0);
                  this.f0 = this.f4;
                  this.f0 = Math.sin(this.f0);
                  this.f0 = this.f0;
                  sf32(this.f0,this.i0 + 4);
                  this.i0 = this.i9 + 8;
                  this.i11 = this.i11 + 4;
                  this.i12 = this.i10 + 2;
                  this.i13 = this.i8 + 1;
                  this.i9 = this.i0;
                  this.i10 = this.i11;
                  this.i8 = this.i12;
                  this.i0 = this.i13;
               }
               this.i0 = 0;
               this.i2 = this.i1 >> 31;
               this.i2 = this.i2 >>> 29;
               this.i2 = this.i1 + this.i2;
               this.i1 = this.i1 << 2;
               this.i2 = this.i2 >> 3;
               this.i7 = 2;
               this.i1 = this.i4 + this.i1;
               this.i4 = this.i7;
               while(true)
               {
                  this.i7 = this.i1;
                  this.i1 = this.i4;
                  this.i4 = this.i7;
                  if(this.i2 <= this.i0)
                  {
                     break;
                  }
                  this.f2 = Number(this.i1);
                  this.f0 = 3.14159 / this.f3;
                  this.f0 = this.f0 * this.f2;
                  this.f0 = Math.cos(this.f0);
                  this.f0 = this.f0 * 0.5;
                  this.f4 = -3.14159 / this.f3;
                  this.f0 = this.f0;
                  sf32(this.f0,this.i4);
                  this.f0 = this.f4 * this.f2;
                  this.f0 = Math.sin(this.f0);
                  this.f0 = this.f0 * 0.5;
                  this.f0 = this.f0;
                  sf32(this.f0,this.i7 + 4);
                  this.i4 = this.i7 + 8;
                  this.i7 = this.i1 + 4;
                  this.i0 = this.i0 + 1;
                  this.i1 = this.i4;
                  this.i4 = this.i7;
               }
               this.i0 = 1;
               this.i1 = this.i6 + -1;
               this.i4 = this.i6 + -2;
               this.i1 = this.i0 << this.i1;
               this.i6 = 0;
               this.i0 = this.i0 << this.i4;
               this.i1 = this.i1 + -1;
               this.i4 = this.i6;
               while(true)
               {
                  this.i7 = this.i3;
                  this.i9 = this.i4;
                  this.i3 = this.i7;
                  if(this.i2 > this.i9)
                  {
                     this.i4 = 0;
                     this.i6 = this.i4;
                     while(true)
                     {
                        this.i8 = this.i6;
                        this.i6 = this.i0 >> this.i8;
                        if(this.i6 == 0)
                        {
                           break;
                        }
                        this.i6 = this.i6 & this.i9;
                        if(this.i6 != 0)
                        {
                           this.i6 = 1;
                           this.i6 = this.i6 << this.i8;
                           this.i4 = this.i6 | this.i4;
                        }
                        this.i6 = this.i8 + 1;
                     }
                     this.i6 = this.i4 ^ -1;
                     this.i6 = this.i1 & this.i6;
                     this.i6 = this.i6 + -1;
                     si32(this.i6,this.i3);
                     si32(this.i4,this.i7 + 4);
                     this.i3 = this.i7 + 8;
                     this.i4 = this.i9 + 1;
                     continue;
                  }
                  break;
               }
               this.f0 = 4;
               this.f0 = this.f0;
               this.f1 = this.f1;
               this.f0 = this.f0;
               this.f0 = this.f0 / this.f1;
               this.f0 = this.f0;
               sf32(this.f0,this.i5 + 16);
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
