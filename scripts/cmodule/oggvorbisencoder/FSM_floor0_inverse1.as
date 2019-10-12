package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.lf32;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.sf32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_floor0_inverse1 extends Machine
   {
      
      public static const intRegCount:int = 17;
      
      public static const NumberRegCount:int = 4;
       
      
      public var f3:Number;
      
      public var i10:int;
      
      public var i11:int;
      
      public var i12:int;
      
      public var i13:int;
      
      public var i14:int;
      
      public var i15:int;
      
      public var f0:Number;
      
      public var f2:Number;
      
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
      
      public var f1:Number;
      
      public function FSM_floor0_inverse1()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_floor0_inverse1 = null;
         _loc1_ = new FSM_floor0_inverse1();
         FSM_floor0_inverse1.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         loop9:
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 0;
               this.i0 = li32(mstate.ebp + 12);
               this.i1 = li32(this.i0 + 20);
               this.i2 = li32(this.i1 + 12);
               this.i3 = li32(mstate.ebp + 8);
               mstate.esp = mstate.esp - 8;
               this.i4 = this.i3 + 4;
               si32(this.i4,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_floor0_inverse1.start();
            case 1:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i5 = this.i1 + 12;
               if(this.i2 >= 1)
               {
                  this.i6 = 1;
                  this.i5 = li32(this.i5);
                  this.i5 = this.i6 << this.i5;
                  this.i5 = this.i5 + -1;
                  this.f0 = Number(this.i5);
                  this.f1 = Number(this.i2);
                  this.f0 = this.f0;
                  this.f1 = this.f1;
                  this.i2 = li32(this.i1 + 16);
                  this.f0 = this.f1 / this.f0;
                  this.f0 = this.f0;
                  this.f1 = Number(this.i2);
                  this.f1 = this.f1;
                  this.f0 = this.f0;
                  this.i2 = li32(this.i1 + 20);
                  this.f0 = this.f0 * this.f1;
                  this.f0 = this.f0;
                  this.i5 = 0;
                  this.i6 = this.i1 + 20;
                  while(this.i2 != 0)
                  {
                     this.i5 = this.i5 + 1;
                     this.i2 = this.i2 >>> 1;
                  }
                  mstate.esp = mstate.esp - 8;
                  si32(this.i4,mstate.esp);
                  si32(this.i5,mstate.esp + 4);
                  mstate.esp = mstate.esp - 4;
                  FSM_floor0_inverse1.start();
               }
               addr902:
               this.i0 = 0;
               mstate.eax = this.i0;
               break;
            case 2:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i2 != -1)
               {
                  this.i5 = li32(this.i6);
                  if(this.i5 > this.i2)
                  {
                     this.i5 = 0;
                     this.i6 = li32(this.i3 + 64);
                     this.i2 = this.i2 << 2;
                     this.i6 = li32(this.i6 + 4);
                     this.i1 = this.i1 + this.i2;
                     this.i1 = li32(this.i1 + 24);
                     this.i2 = li32(this.i6 + 28);
                     this.i2 = li32(this.i2 + 2848);
                     this.i1 = this.i1 * 56;
                     this.i1 = this.i2 + this.i1;
                     this.i2 = li32(this.i0 + 4);
                     this.i6 = li32(this.i1);
                     this.i2 = this.i2 + this.i6;
                     this.i2 = this.i2 << 2;
                     mstate.esp = mstate.esp - 8;
                     this.i2 = this.i2 + 4;
                     si32(this.i3,mstate.esp);
                     si32(this.i2,mstate.esp + 4);
                     state = 3;
                     mstate.esp = mstate.esp - 4;
                     FSM_floor0_inverse1.start();
                     return;
                  }
               }
               §§goto(addr902);
            case 3:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i3 = this.i1 + 16;
               this.i6 = this.i1 + 8;
               this.i0 = this.i0 + 4;
               this.i7 = this.i2;
               this.i8 = this.i2;
               this.i9 = this.i1;
               while(true)
               {
                  this.i10 = li32(this.i0);
                  if(this.i10 <= this.i5)
                  {
                     this.f1 = 0;
                     this.f1 = this.f1;
                     this.i3 = 0;
                     while(true)
                     {
                        this.i5 = this.i3;
                        this.i3 = li32(this.i0);
                        if(this.i3 > this.i5)
                        {
                           this.i3 = 0;
                           this.i4 = this.i5 << 2;
                           this.i4 = this.i7 + this.i4;
                           while(true)
                           {
                              this.i9 = li32(this.i1);
                              this.i10 = this.i5 + this.i3;
                              this.i6 = this.i4;
                              if(this.i9 <= this.i3)
                              {
                                 break;
                              }
                              this.f2 = lf32(this.i6);
                              this.f3 = this.f1;
                              this.f2 = this.f2 + this.f3;
                              this.f2 = this.f2;
                              sf32(this.f2,this.i6);
                              this.i4 = this.i4 + 4;
                              this.i3 = this.i3 + 1;
                           }
                           this.i4 = this.i10 << 2;
                           this.i4 = this.i4 + this.i8;
                           this.f1 = lf32(this.i4 + -4);
                           this.i3 = this.i5 + this.i3;
                           continue;
                        }
                        break;
                     }
                     this.i0 = this.i3 << 2;
                     this.i0 = this.i8 + this.i0;
                     sf32(this.f0,this.i0);
                     mstate.eax = this.i2;
                     break loop9;
                  }
                  this.i10 = li32(this.i1);
                  this.i11 = li32(this.i6);
                  if(this.i11 <= 0)
                  {
                     this.i11 = 0;
                     while(true)
                     {
                        this.i12 = this.i11;
                        if(this.i12 < this.i10)
                        {
                           this.i11 = this.i12 + this.i5;
                           this.i11 = this.i11 << 2;
                           this.i11 = this.i7 + this.i11;
                           while(true)
                           {
                              this.i13 = this.i11;
                              this.i14 = li32(this.i1);
                              this.i11 = this.i13;
                              if(this.i14 <= 0)
                              {
                                 break;
                              }
                              this.i14 = 0;
                              si32(this.i14,this.i11);
                              this.i11 = this.i13 + 4;
                              this.i12 = this.i12 + 1;
                           }
                           this.i11 = this.i12;
                           continue;
                        }
                        break;
                     }
                  }
                  else
                  {
                     this.i11 = 0;
                     addr641:
                     while(this.i11 < this.i10)
                     {
                        mstate.esp = mstate.esp - 8;
                        si32(this.i9,mstate.esp);
                        si32(this.i4,mstate.esp + 4);
                        mstate.esp = mstate.esp - 4;
                        FSM_floor0_inverse1.start();
                     }
                  }
                  this.i10 = li32(this.i1);
                  this.i5 = this.i10 + this.i5;
               }
               break;
            case 4:
               while(true)
               {
                  this.i12 = mstate.eax;
                  mstate.esp = mstate.esp + 8;
                  if(this.i12 != -1)
                  {
                     this.i13 = 0;
                     this.i14 = li32(this.i1);
                     this.i15 = this.i11 + this.i5;
                     this.i12 = this.i12 * this.i14;
                     this.i14 = li32(this.i3);
                     this.i12 = this.i12 << 2;
                     this.i15 = this.i15 << 2;
                     this.i15 = this.i7 + this.i15;
                     this.i12 = this.i14 + this.i12;
                     this.i14 = this.i13;
                     while(true)
                     {
                        this.i16 = li32(this.i1);
                        if(this.i16 <= this.i13)
                        {
                           break;
                        }
                        this.i16 = this.i12 + this.i14;
                        this.f1 = lf32(this.i16);
                        this.i16 = this.i15 + this.i14;
                        sf32(this.f1,this.i16);
                        this.i14 = this.i14 + 4;
                        this.i13 = this.i13 + 1;
                     }
                     this.i11 = this.i11 + this.i13;
                     §§goto(addr641);
                  }
                  else
                  {
                     this.i5 = 0;
                     mstate.eax = this.i5;
                     break loop9;
                  }
               }
         }
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
