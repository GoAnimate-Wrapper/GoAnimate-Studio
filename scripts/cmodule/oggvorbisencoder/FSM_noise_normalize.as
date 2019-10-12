package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.lf32;
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.sf32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_noise_normalize extends Machine
   {
      
      public static const intRegCount:int = 22;
      
      public static const NumberRegCount:int = 4;
       
      
      public var f0:Number;
      
      public var f1:Number;
      
      public var f2:Number;
      
      public var f3:Number;
      
      public var i10:int;
      
      public var i11:int;
      
      public var i12:int;
      
      public var i13:int;
      
      public var i14:int;
      
      public var i15:int;
      
      public var i17:int;
      
      public var i19:int;
      
      public var i16:int;
      
      public var i18:int;
      
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
      
      public var i20:int;
      
      public var i21:int;
      
      public function FSM_noise_normalize()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_noise_normalize = null;
         _loc1_ = new FSM_noise_normalize();
         FSM_noise_normalize.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         loop3:
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 4;
               this.i0 = li32(mstate.ebp + 8);
               this.i1 = li32(mstate.ebp + 40);
               this.i0 = li32(this.i0 + 4);
               this.i2 = mstate.esp;
               this.i3 = this.i1 << 2;
               this.i2 = this.i2 - this.i3;
               mstate.esp = this.i2;
               this.i3 = li32(this.i0 + 500);
               this.i4 = li32(mstate.ebp + 16);
               this.i5 = li32(mstate.ebp + 20);
               this.i6 = li32(mstate.ebp + 24);
               this.i7 = li32(mstate.ebp + 28);
               this.i8 = li32(mstate.ebp + 44);
               this.i9 = li32(mstate.ebp + 12);
               this.i10 = li32(mstate.ebp + 36);
               this.i11 = this.i2;
               this.i12 = this.i7;
               this.i13 = this.i5;
               this.i14 = this.i6;
               this.i15 = this.i4;
               this.i16 = this.i8;
               if(this.i3 == 0)
               {
                  this.i3 = this.i1;
               }
               else
               {
                  this.i3 = li32(this.i0 + 504);
                  this.i3 = this.i3 - this.i10;
               }
               this.i17 = 0;
               this.i3 = this.i3 > this.i1?int(this.i1):int(this.i3);
               this.i18 = this.i17;
               for(; this.i17 < this.i3; this.i18 = this.i18 + 4,this.i17 = this.i17 + 1)
               {
                  if(this.i7 != 0)
                  {
                     this.i19 = this.i12 + this.i18;
                     this.i19 = li32(this.i19);
                     if(this.i19 == 0)
                     {
                     }
                     continue;
                  }
                  this.f1 = 0;
                  this.i19 = this.i14 + this.i18;
                  this.i20 = this.i13 + this.i18;
                  this.f0 = lf32(this.i20);
                  this.f2 = lf32(this.i19);
                  this.f0 = this.f0 / this.f2;
                  this.f0 = this.f0;
                  this.f0 = this.f0;
                  this.i19 = this.i15 + this.i18;
                  this.f2 = lf32(this.i19);
                  this.f0 = Math.sqrt(this.f0);
                  this.f0 = this.f0 + 0.5;
                  this.f0 = Math.floor(this.f0);
                  this.f1 = this.f1;
                  this.f1 = this.f1;
                  if(this.f2 < this.f1)
                  {
                     this.f0 = -this.f0;
                     this.i19 = this.i16 + this.i18;
                     this.i20 = int(this.f0);
                     si32(this.i20,this.i19);
                  }
                  else
                  {
                     this.i19 = this.i16 + this.i18;
                     this.i20 = int(this.f0);
                     si32(this.i20,this.i19);
                  }
               }
               this.f0 = 0;
               this.f0 = this.f0;
               this.i3 = this.i17 << 2;
               this.i18 = 0;
               this.i9 = this.i9 - this.i10;
               this.i10 = this.i17;
               this.i17 = this.i18;
               while(true)
               {
                  this.i18 = this.i3;
                  this.i3 = this.i10;
                  this.f1 = this.f0;
                  this.i10 = this.i17;
                  if(this.i3 >= this.i1)
                  {
                     break;
                  }
                  if(this.i7 != 0)
                  {
                     this.i17 = this.i12 + this.i18;
                     this.i17 = li32(this.i17);
                     if(this.i17 != 0)
                     {
                        this.f0 = this.f1;
                        continue;
                     }
                  }
                  this.f0 = 0.25;
                  this.i17 = this.i14 + this.i18;
                  this.i19 = this.i13 + this.i18;
                  this.f2 = lf32(this.i19);
                  this.f3 = lf32(this.i17);
                  this.f2 = this.f2 / this.f3;
                  this.f2 = this.f2;
                  this.f0 = this.f0;
                  this.f0 = this.f0;
                  this.f3 = this.f2;
                  if(this.f3 < this.f0)
                  {
                     this.i20 = this.i7 != 0?1:0;
                     if(this.i9 > this.i3)
                     {
                        this.i20 = this.i20 & 1;
                        if(this.i20 == 0)
                        {
                        }
                     }
                     this.f0 = this.f2;
                     this.f1 = this.f1;
                     this.i17 = this.i10 << 2;
                     this.f0 = this.f1 + this.f0;
                     this.i17 = this.i2 + this.i17;
                     si32(this.i19,this.i17);
                     this.f0 = this.f0;
                     this.i10 = this.i10 + 1;
                     continue;
                  }
                  this.f3 = 0;
                  this.f0 = this.f2;
                  this.f0 = Math.sqrt(this.f0);
                  this.i20 = this.i15 + this.i18;
                  this.f2 = lf32(this.i20);
                  this.f0 = this.f0 + 0.5;
                  this.f0 = Math.floor(this.f0);
                  this.f3 = this.f3;
                  this.f3 = this.f3;
                  if(this.f2 < this.f3)
                  {
                     this.f0 = -this.f0;
                     this.i20 = this.i16 + this.i18;
                     this.i21 = int(this.f0);
                     si32(this.i21,this.i20);
                  }
                  else
                  {
                     this.i20 = this.i16 + this.i18;
                     this.i21 = int(this.f0);
                     si32(this.i21,this.i20);
                  }
                  this.i20 = this.i16 + this.i18;
                  this.i20 = li32(this.i20);
                  this.i20 = this.i20 * this.i20;
                  this.f0 = Number(this.i20);
                  this.f2 = lf32(this.i17);
                  this.f0 = this.f0;
                  this.f0 = this.f0 * this.f2;
                  this.f0 = this.f0;
                  sf32(this.f0,this.i19);
                  this.f0 = this.f1;
               }
               if(this.i10 == 0)
               {
                  break;
               }
               this.i1 = FSM_noise_normalize;
               mstate.esp = mstate.esp - 12;
               si32(this.i2,mstate.esp);
               si32(this.i10,mstate.esp + 4);
               si32(this.i1,mstate.esp + 8);
               state = 1;
               mstate.esp = mstate.esp - 4;
               FSM_noise_normalize.start();
               return;
            case 1:
               mstate.esp = mstate.esp + 12;
               this.i0 = this.i0 + 512;
               this.i1 = 0;
               this.i2 = this.i11;
               while(true)
               {
                  this.i3 = this.i2;
                  this.i2 = this.i3;
                  if(this.i1 >= this.i10)
                  {
                     break loop3;
                  }
                  this.i2 = li32(this.i2);
                  this.f0 = lf64(this.i0);
                  this.i2 = this.i2 - this.i13;
                  this.i2 = this.i2 >> 2;
                  this.f2 = this.f1;
                  if(this.f2 >= this.f0)
                  {
                     this.f0 = -1;
                     this.i2 = this.i2 << 2;
                     this.i7 = this.i4 + this.i2;
                     this.i7 = li32(this.i7);
                     this.i7 = this.i7 | 1065353216;
                     this.i7 = this.i7 & -1082130432;
                     si32(this.i7,mstate.ebp + -4);
                     this.f2 = lf32(mstate.ebp + -4);
                     this.f0 = this.f0;
                     this.i7 = this.i8 + this.i2;
                     this.i9 = int(this.f2);
                     si32(this.i9,this.i7);
                     this.i7 = this.i6 + this.i2;
                     this.f0 = this.f0;
                     this.f1 = this.f1;
                     this.f0 = this.f1 + this.f0;
                     this.f1 = lf32(this.i7);
                     this.i2 = this.i5 + this.i2;
                     sf32(this.f1,this.i2);
                     this.f1 = this.f0;
                  }
                  else
                  {
                     this.i7 = 0;
                     this.i2 = this.i2 << 2;
                     this.i9 = this.i8 + this.i2;
                     si32(this.i7,this.i9);
                     this.i2 = this.i5 + this.i2;
                     si32(this.i7,this.i2);
                  }
                  this.i2 = this.i3 + 4;
                  this.i1 = this.i1 + 1;
               }
         }
         this.f0 = this.f1;
         mstate.st0 = this.f0;
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
