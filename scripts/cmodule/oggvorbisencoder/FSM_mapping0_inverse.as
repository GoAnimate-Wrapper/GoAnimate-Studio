package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.lf32;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.sf32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_mapping0_inverse extends Machine
   {
      
      public static const intRegCount:int = 26;
      
      public static const NumberRegCount:int = 4;
       
      
      public var i21:int;
      
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
      
      public var i22:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public var i5:int;
      
      public var i6:int;
      
      public var i7:int;
      
      public var i8:int;
      
      public var i2:int;
      
      public var i23:int;
      
      public var i24:int;
      
      public var i25:int;
      
      public var i20:int;
      
      public var i9:int;
      
      public function FSM_mapping0_inverse()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_mapping0_inverse = null;
         _loc1_ = new FSM_mapping0_inverse();
         FSM_mapping0_inverse.gworker = _loc1_;
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
               this.i1 = li32(mstate.ebp + 8);
               this.i2 = li32(this.i1 + 64);
               this.i3 = li32(this.i2 + 4);
               this.i4 = li32(this.i1 + 28);
               this.i5 = li32(this.i3 + 28);
               this.i4 = this.i4 << 2;
               this.i4 = this.i5 + this.i4;
               this.i2 = li32(this.i2 + 104);
               this.i4 = li32(this.i4);
               si32(this.i4,this.i1 + 36);
               this.i6 = li32(this.i3 + 4);
               this.i7 = mstate.esp;
               this.i6 = this.i6 << 2;
               this.i6 = this.i7 - this.i6;
               mstate.esp = this.i6;
               this.i7 = li32(this.i3 + 4);
               this.i8 = mstate.esp;
               this.i7 = this.i7 << 2;
               this.i7 = this.i8 - this.i7;
               mstate.esp = this.i7;
               this.i8 = li32(this.i3 + 4);
               this.i9 = mstate.esp;
               this.i8 = this.i8 << 2;
               this.i8 = this.i9 - this.i8;
               mstate.esp = this.i8;
               this.i9 = li32(this.i3 + 4);
               this.i10 = mstate.esp;
               this.i9 = this.i9 << 2;
               this.i9 = this.i10 - this.i9;
               this.i10 = this.i4 << 1;
               mstate.esp = this.i9;
               this.i11 = li32(mstate.ebp + 12);
               this.i10 = this.i10 & 2147483646;
               this.i12 = this.i2 + 48;
               this.i3 = this.i3 + 4;
               this.i13 = this.i1 + 28;
               this.i14 = this.i1;
               this.i15 = this.i8;
               this.i16 = this.i11;
               this.i17 = this.i11;
               this.i18 = this.i0;
               addr496:
               this.i19 = li32(this.i3);
               if(this.i19 <= this.i0)
               {
                  this.i0 = 0;
                  this.i10 = li32(this.i17 + 1156);
                  this.i18 = this.i17 + 1156;
                  this.i19 = this.i16;
                  for(; this.i10 > this.i0; this.i19 = this.i19 + 4,this.i0 = this.i0 + 1)
                  {
                     this.i20 = li32(this.i19 + 1160);
                     this.i20 = this.i20 << 2;
                     this.i20 = this.i8 + this.i20;
                     this.i21 = li32(this.i20);
                     if(this.i21 == 0)
                     {
                        this.i21 = li32(this.i19 + 2184);
                        this.i21 = this.i21 << 2;
                        this.i21 = this.i8 + this.i21;
                        this.i21 = li32(this.i21);
                        if(this.i21 != 0)
                        {
                        }
                        continue;
                     }
                     this.i21 = 1;
                     si32(this.i21,this.i20);
                     this.i20 = li32(this.i19 + 2184);
                     this.i20 = this.i20 << 2;
                     this.i20 = this.i8 + this.i20;
                     si32(this.i21,this.i20);
                  }
                  this.i0 = 0;
                  this.i8 = this.i16 + 1092;
                  this.i10 = this.i2 + 52;
                  this.i19 = this.i8;
                  this.i8 = this.i0;
                  this.i20 = li32(this.i11);
                  this.i0 = this.i19;
                  if(this.i20 > this.i8)
                  {
                     this.i20 = 0;
                     this.i22 = this.i20;
                     this.i21 = this.i20;
                     while(true)
                     {
                        this.i23 = li32(this.i3);
                        if(this.i23 <= this.i21)
                        {
                           break;
                        }
                        this.i23 = this.i16 + this.i22;
                        this.i23 = li32(this.i23 + 4);
                        if(this.i23 == this.i8)
                        {
                           this.i23 = this.i15 + this.i22;
                           this.i23 = li32(this.i23);
                           this.i23 = this.i23 != 0?1:0;
                           this.i24 = this.i20 << 2;
                           this.i23 = this.i23 & 1;
                           this.i25 = this.i7 + this.i24;
                           si32(this.i23,this.i25);
                           this.i23 = li32(this.i14);
                           this.i23 = this.i23 + this.i22;
                           this.i23 = li32(this.i23);
                           this.i24 = this.i6 + this.i24;
                           si32(this.i23,this.i24);
                           this.i20 = this.i20 + 1;
                        }
                        this.i22 = this.i22 + 4;
                        this.i21 = this.i21 + 1;
                     }
                     this.i21 = FSM_mapping0_inverse;
                     this.i0 = li32(this.i0);
                     this.i0 = this.i0 << 2;
                     this.i22 = this.i5 + this.i0;
                     this.i22 = li32(this.i22 + 1312);
                     this.i22 = this.i22 << 2;
                     this.i23 = li32(this.i10);
                     this.i21 = this.i21 + this.i22;
                     this.i21 = li32(this.i21);
                     this.i0 = this.i23 + this.i0;
                     this.i21 = li32(this.i21 + 28);
                     this.i0 = li32(this.i0);
                     mstate.esp = mstate.esp - 20;
                     si32(this.i1,mstate.esp);
                     si32(this.i0,mstate.esp + 4);
                     si32(this.i6,mstate.esp + 8);
                     si32(this.i7,mstate.esp + 12);
                     si32(this.i20,mstate.esp + 16);
                     state = 2;
                     mstate.esp = mstate.esp - 4;
                     mstate.funcs[this.i21]();
                     return;
                  }
                  this.i0 = li32(this.i18);
                  this.i6 = this.i0 << 2;
                  this.i6 = this.i16 + this.i6;
                  this.i0 = this.i0 + -1;
                  while(this.i0 > -1)
                  {
                     this.i7 = 0;
                     this.i8 = li32(this.i6 + 1156);
                     this.i10 = li32(this.i6 + 2180);
                     this.i11 = li32(this.i14);
                     this.i10 = this.i10 << 2;
                     this.i8 = this.i8 << 2;
                     this.i15 = this.i4 >>> 31;
                     this.i10 = this.i11 + this.i10;
                     this.i8 = this.i11 + this.i8;
                     this.i11 = this.i4 + this.i15;
                     this.i8 = li32(this.i8);
                     this.i10 = li32(this.i10);
                     this.i11 = this.i11 >> 1;
                     this.i15 = this.i7;
                     while(this.i11 > this.i7)
                     {
                        this.f0 = 0;
                        this.i18 = this.i10 + this.i15;
                        this.i19 = this.i8 + this.i15;
                        this.f1 = lf32(this.i19);
                        this.f2 = lf32(this.i18);
                        this.f0 = this.f0;
                        this.f0 = this.f0;
                        this.f3 = this.f1;
                        if(this.f3 > this.f0)
                        {
                           this.f0 = 0;
                           this.f0 = this.f0;
                           this.f0 = this.f0;
                           this.f3 = this.f2;
                           if(this.f3 > this.f0)
                           {
                              this.f0 = this.f2;
                              this.f2 = this.f1;
                              this.f0 = this.f2 - this.f0;
                              sf32(this.f1,this.i19);
                              this.f1 = this.f0;
                              sf32(this.f1,this.i18);
                           }
                           else
                           {
                              this.f0 = this.f2;
                              this.f2 = this.f1;
                              this.f0 = this.f2 + this.f0;
                              sf32(this.f1,this.i18);
                              this.f1 = this.f0;
                              sf32(this.f1,this.i19);
                           }
                        }
                        else
                        {
                           this.f0 = 0;
                           this.f0 = this.f0;
                           this.f0 = this.f0;
                           this.f3 = this.f2;
                           if(this.f3 > this.f0)
                           {
                              this.f0 = this.f2;
                              this.f2 = this.f1;
                              this.f0 = this.f2 + this.f0;
                              sf32(this.f1,this.i19);
                              this.f1 = this.f0;
                              sf32(this.f1,this.i18);
                           }
                           else
                           {
                              this.f0 = this.f2;
                              this.f2 = this.f1;
                              this.f0 = this.f2 - this.f0;
                              sf32(this.f1,this.i18);
                              this.f0 = this.f0;
                              sf32(this.f0,this.i19);
                           }
                        }
                        this.i15 = this.i15 + 4;
                        this.i7 = this.i7 + 1;
                     }
                     this.i6 = this.i6 + -4;
                     this.i0 = this.i0 + -1;
                  }
                  this.i0 = 0;
                  this.i4 = this.i0;
                  this.i6 = li32(this.i3);
                  if(this.i6 <= this.i0)
                  {
                     this.i0 = 0;
                     this.i1 = this.i0;
                     addr3495:
                     while(true)
                     {
                        this.i4 = li32(this.i3);
                        if(this.i4 <= this.i0)
                        {
                           break;
                        }
                        this.i4 = li32(this.i13);
                        this.i4 = this.i4 << 2;
                        this.i4 = this.i2 + this.i4;
                        this.i4 = li32(this.i4 + 12);
                        this.i4 = li32(this.i4);
                        this.i5 = li32(this.i4);
                        this.i6 = li32(this.i14);
                        this.i7 = this.i5 >> 1;
                        this.i8 = this.i5 >> 2;
                        this.i6 = this.i6 + this.i1;
                        this.i9 = this.i7 + this.i8;
                        this.i6 = li32(this.i6);
                        this.i10 = this.i7 << 2;
                        this.i11 = li32(this.i4 + 8);
                        this.i10 = this.i10 + this.i6;
                        this.i5 = this.i5 & -4;
                        this.i9 = this.i9 << 2;
                        this.i10 = this.i10 + -28;
                        this.i5 = this.i11 + this.i5;
                        this.i11 = this.i4 + 8;
                        this.i9 = this.i6 + this.i9;
                        this.i12 = this.i9;
                        while(true)
                        {
                           this.f0 = lf32(this.i10 + 8);
                           this.f0 = -this.f0;
                           this.f0 = this.f0;
                           this.f1 = lf32(this.i5 + 12);
                           this.f0 = this.f0;
                           this.f2 = lf32(this.i10);
                           this.f3 = lf32(this.i5 + 8);
                           this.f0 = this.f1 * this.f0;
                           this.f1 = this.f2 * this.f3;
                           this.f0 = this.f0;
                           this.f1 = this.f1;
                           this.f1 = this.f1;
                           this.f0 = this.f0;
                           this.f0 = this.f0 - this.f1;
                           this.f0 = this.f0;
                           sf32(this.f0,this.i12 + -16);
                           this.f0 = lf32(this.i10);
                           this.f1 = lf32(this.i5 + 12);
                           this.f2 = lf32(this.i10 + 8);
                           this.f3 = lf32(this.i5 + 8);
                           this.f0 = this.f0 * this.f1;
                           this.f1 = this.f2 * this.f3;
                           this.f0 = this.f0;
                           this.f1 = this.f1;
                           this.f1 = this.f1;
                           this.f0 = this.f0;
                           this.f0 = this.f0 - this.f1;
                           this.f0 = this.f0;
                           sf32(this.f0,this.i12 + -12);
                           this.f0 = lf32(this.i10 + 24);
                           this.f0 = -this.f0;
                           this.f0 = this.f0;
                           this.f1 = lf32(this.i5 + 4);
                           this.f0 = this.f0;
                           this.f2 = lf32(this.i10 + 16);
                           this.f3 = lf32(this.i5);
                           this.f0 = this.f1 * this.f0;
                           this.f1 = this.f2 * this.f3;
                           this.f0 = this.f0;
                           this.f1 = this.f1;
                           this.f1 = this.f1;
                           this.f0 = this.f0;
                           this.f0 = this.f0 - this.f1;
                           this.f0 = this.f0;
                           sf32(this.f0,this.i12 + -8);
                           this.f0 = lf32(this.i10 + 16);
                           this.f1 = lf32(this.i5 + 4);
                           this.f2 = lf32(this.i10 + 24);
                           this.f3 = lf32(this.i5);
                           this.f0 = this.f0 * this.f1;
                           this.f1 = this.f2 * this.f3;
                           this.f0 = this.f0;
                           this.f1 = this.f1;
                           this.f1 = this.f1;
                           this.f0 = this.f0;
                           this.f0 = this.f0 - this.f1;
                           this.f0 = this.f0;
                           sf32(this.f0,this.i12 + -4);
                           this.i5 = this.i5 + 16;
                           this.i10 = this.i10 + -32;
                           this.i12 = this.i12 + -16;
                           if(uint(this.i10) >= uint(this.i6))
                           {
                              continue;
                           }
                           break;
                        }
                        this.i5 = this.i7 << 2;
                        this.i5 = this.i5 + this.i6;
                        this.i10 = li32(this.i11);
                        this.i12 = this.i8 << 2;
                        this.i5 = this.i5 + -32;
                        this.i10 = this.i10 + this.i12;
                        this.i12 = this.i9;
                        while(true)
                        {
                           this.f0 = lf32(this.i5 + 16);
                           this.f1 = lf32(this.i10 + -4);
                           this.f2 = lf32(this.i5 + 24);
                           this.f3 = lf32(this.i10 + -8);
                           this.f0 = this.f0 * this.f1;
                           this.f1 = this.f2 * this.f3;
                           this.f0 = this.f0;
                           this.f1 = this.f1;
                           this.f1 = this.f1;
                           this.f0 = this.f0;
                           this.f0 = this.f0 + this.f1;
                           this.f0 = this.f0;
                           sf32(this.f0,this.i12);
                           this.f0 = lf32(this.i5 + 16);
                           this.f1 = lf32(this.i10 + -8);
                           this.f2 = lf32(this.i5 + 24);
                           this.f3 = lf32(this.i10 + -4);
                           this.f0 = this.f0 * this.f1;
                           this.f1 = this.f2 * this.f3;
                           this.f0 = this.f0;
                           this.f1 = this.f1;
                           this.f1 = this.f1;
                           this.f0 = this.f0;
                           this.f0 = this.f0 - this.f1;
                           this.f0 = this.f0;
                           sf32(this.f0,this.i12 + 4);
                           this.f0 = lf32(this.i5);
                           this.f1 = lf32(this.i10 + -12);
                           this.f2 = lf32(this.i5 + 8);
                           this.f3 = lf32(this.i10 + -16);
                           this.f2 = this.f2 * this.f3;
                           this.f0 = this.f0 * this.f1;
                           this.f1 = this.f2;
                           this.f0 = this.f0;
                           this.f1 = this.f1;
                           this.f0 = this.f0;
                           this.f0 = this.f0 + this.f1;
                           this.f0 = this.f0;
                           sf32(this.f0,this.i12 + 8);
                           this.f0 = lf32(this.i5);
                           this.f1 = lf32(this.i10 + -16);
                           this.f2 = lf32(this.i5 + 8);
                           this.f3 = lf32(this.i10 + -12);
                           this.f0 = this.f0 * this.f1;
                           this.f1 = this.f2 * this.f3;
                           this.f0 = this.f0;
                           this.f1 = this.f1;
                           this.f1 = this.f1;
                           this.f0 = this.f0;
                           this.f0 = this.f0 - this.f1;
                           this.f0 = this.f0;
                           sf32(this.f0,this.i12 + 12);
                           this.i12 = this.i12 + 16;
                           this.i5 = this.i5 + -32;
                           this.i10 = this.i10 + -16;
                           if(uint(this.i5) >= uint(this.i6))
                           {
                              continue;
                           }
                           break;
                        }
                        this.i5 = this.i7 << 2;
                        mstate.esp = mstate.esp - 12;
                        this.i10 = this.i6 + this.i5;
                        si32(this.i4,mstate.esp);
                        si32(this.i10,mstate.esp + 4);
                        si32(this.i7,mstate.esp + 8);
                        mstate.esp = mstate.esp - 4;
                        FSM_mapping0_inverse.start();
                     }
                     this.i0 = 0;
                     mstate.eax = this.i0;
                     mstate.esp = mstate.ebp;
                     mstate.ebp = li32(mstate.esp);
                     mstate.esp = mstate.esp + 4;
                     mstate.esp = mstate.esp + 4;
                     mstate.gworker = caller;
                     return;
                  }
                  this.i6 = FSM_mapping0_inverse;
                  this.i7 = this.i16 + this.i4;
                  this.i7 = li32(this.i7 + 4);
                  this.i7 = this.i7 << 2;
                  this.i7 = this.i17 + this.i7;
                  this.i7 = li32(this.i7 + 1028);
                  this.i7 = this.i7 << 2;
                  this.i8 = this.i5 + this.i7;
                  this.i8 = li32(this.i8 + 800);
                  this.i8 = this.i8 << 2;
                  this.i10 = li32(this.i14);
                  this.i11 = li32(this.i12);
                  this.i6 = this.i6 + this.i8;
                  this.i6 = li32(this.i6);
                  this.i7 = this.i11 + this.i7;
                  this.i8 = this.i9 + this.i4;
                  this.i10 = this.i10 + this.i4;
                  this.i10 = li32(this.i10);
                  this.i6 = li32(this.i6 + 24);
                  this.i8 = li32(this.i8);
                  this.i7 = li32(this.i7);
                  mstate.esp = mstate.esp - 16;
                  si32(this.i1,mstate.esp);
                  si32(this.i7,mstate.esp + 4);
                  si32(this.i8,mstate.esp + 8);
                  si32(this.i10,mstate.esp + 12);
                  state = 3;
                  mstate.esp = mstate.esp - 4;
                  mstate.funcs[this.i6]();
                  return;
               }
               this.i19 = FSM_mapping0_inverse;
               this.i20 = this.i16 + this.i18;
               this.i20 = li32(this.i20 + 4);
               this.i20 = this.i20 << 2;
               this.i20 = this.i17 + this.i20;
               this.i20 = li32(this.i20 + 1028);
               this.i20 = this.i20 << 2;
               this.i21 = this.i5 + this.i20;
               this.i21 = li32(this.i21 + 800);
               this.i21 = this.i21 << 2;
               this.i22 = li32(this.i12);
               this.i19 = this.i19 + this.i21;
               this.i19 = li32(this.i19);
               this.i20 = this.i22 + this.i20;
               this.i19 = li32(this.i19 + 20);
               this.i20 = li32(this.i20);
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i20,mstate.esp + 4);
               state = 1;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[this.i19]();
               return;
            case 1:
               this.i19 = mstate.eax;
               this.i20 = this.i19 != 0?1:0;
               mstate.esp = mstate.esp + 8;
               this.i21 = this.i9 + this.i18;
               si32(this.i19,this.i21);
               this.i19 = this.i20 & 1;
               this.i20 = this.i15 + this.i18;
               si32(this.i19,this.i20);
               this.i19 = li32(this.i14);
               this.i19 = this.i19 + this.i18;
               this.i19 = li32(this.i19);
               this.i20 = 0;
               this.i21 = this.i10;
               memset(this.i19,this.i20,this.i21);
               this.i18 = this.i18 + 4;
               this.i0 = this.i0 + 1;
               §§goto(addr496);
            case 2:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 20;
               this.i0 = this.i19 + 4;
               this.i19 = this.i8 + 1;
               this.i8 = this.i0;
               this.i0 = this.i19;
               §§goto(addr942);
            case 3:
               this.i6 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               this.i4 = this.i4 + 4;
               this.i0 = this.i0 + 1;
               §§goto(addr1537);
            case 4:
               while(true)
               {
                  mstate.esp = mstate.esp + 12;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i4,mstate.esp);
                  si32(this.i6,mstate.esp + 4);
                  mstate.esp = mstate.esp - 4;
                  FSM_mapping0_inverse.start();
               }
            case 5:
               while(true)
               {
                  mstate.esp = mstate.esp + 8;
                  this.i4 = li32(this.i11);
                  this.i4 = this.i4 + this.i5;
                  this.i5 = this.i9;
                  this.i7 = this.i9;
                  this.i11 = this.i6;
                  while(true)
                  {
                     this.f0 = lf32(this.i11);
                     this.f1 = lf32(this.i4 + 4);
                     this.f2 = lf32(this.i11 + 4);
                     this.f3 = lf32(this.i4);
                     this.f0 = this.f0 * this.f1;
                     this.f1 = this.f2 * this.f3;
                     this.f0 = this.f0;
                     this.f1 = this.f1;
                     this.f1 = this.f1;
                     this.f0 = this.f0;
                     this.f0 = this.f0 - this.f1;
                     this.f0 = this.f0;
                     sf32(this.f0,this.i5 + -4);
                     this.f0 = lf32(this.i11);
                     this.f1 = lf32(this.i4);
                     this.f2 = lf32(this.i11 + 4);
                     this.f3 = lf32(this.i4 + 4);
                     this.f0 = this.f0 * this.f1;
                     this.f1 = this.f2 * this.f3;
                     this.f0 = this.f0;
                     this.f1 = this.f1;
                     this.f1 = this.f1;
                     this.f0 = this.f0;
                     this.f0 = this.f0 + this.f1;
                     this.f0 = this.f0;
                     this.f0 = this.f0;
                     this.f0 = -this.f0;
                     this.f0 = this.f0;
                     sf32(this.f0,this.i7);
                     this.f0 = lf32(this.i11 + 8);
                     this.f1 = lf32(this.i4 + 12);
                     this.f2 = lf32(this.i11 + 12);
                     this.f3 = lf32(this.i4 + 8);
                     this.f0 = this.f0 * this.f1;
                     this.f1 = this.f2 * this.f3;
                     this.f0 = this.f0;
                     this.f1 = this.f1;
                     this.f1 = this.f1;
                     this.f0 = this.f0;
                     this.f0 = this.f0 - this.f1;
                     this.f0 = this.f0;
                     sf32(this.f0,this.i5 + -8);
                     this.f0 = lf32(this.i11 + 8);
                     this.f1 = lf32(this.i4 + 8);
                     this.f2 = lf32(this.i11 + 12);
                     this.f3 = lf32(this.i4 + 12);
                     this.f0 = this.f0 * this.f1;
                     this.f1 = this.f2 * this.f3;
                     this.f0 = this.f0;
                     this.f1 = this.f1;
                     this.f1 = this.f1;
                     this.f0 = this.f0;
                     this.f0 = this.f0 + this.f1;
                     this.f0 = this.f0;
                     this.f0 = this.f0;
                     this.f0 = -this.f0;
                     this.f0 = this.f0;
                     sf32(this.f0,this.i7 + 4);
                     this.f0 = lf32(this.i11 + 16);
                     this.f1 = lf32(this.i4 + 20);
                     this.f2 = lf32(this.i11 + 20);
                     this.f3 = lf32(this.i4 + 16);
                     this.f0 = this.f0 * this.f1;
                     this.f1 = this.f2 * this.f3;
                     this.f0 = this.f0;
                     this.f1 = this.f1;
                     this.f1 = this.f1;
                     this.f0 = this.f0;
                     this.f0 = this.f0 - this.f1;
                     this.f0 = this.f0;
                     sf32(this.f0,this.i5 + -12);
                     this.f0 = lf32(this.i11 + 16);
                     this.f1 = lf32(this.i4 + 16);
                     this.f2 = lf32(this.i11 + 20);
                     this.f3 = lf32(this.i4 + 20);
                     this.f0 = this.f0 * this.f1;
                     this.f1 = this.f2 * this.f3;
                     this.f0 = this.f0;
                     this.f1 = this.f1;
                     this.f1 = this.f1;
                     this.f0 = this.f0;
                     this.f0 = this.f0 + this.f1;
                     this.f0 = this.f0;
                     this.f0 = this.f0;
                     this.f0 = -this.f0;
                     this.f0 = this.f0;
                     sf32(this.f0,this.i7 + 8);
                     this.f0 = lf32(this.i11 + 24);
                     this.f1 = lf32(this.i4 + 28);
                     this.f2 = lf32(this.i11 + 28);
                     this.f3 = lf32(this.i4 + 24);
                     this.f0 = this.f0 * this.f1;
                     this.f1 = this.f2 * this.f3;
                     this.f0 = this.f0;
                     this.f1 = this.f1;
                     this.f1 = this.f1;
                     this.f0 = this.f0;
                     this.f0 = this.f0 - this.f1;
                     this.f0 = this.f0;
                     sf32(this.f0,this.i5 + -16);
                     this.f0 = lf32(this.i11 + 24);
                     this.f1 = lf32(this.i4 + 24);
                     this.f2 = lf32(this.i11 + 28);
                     this.f3 = lf32(this.i4 + 28);
                     this.f0 = this.f0 * this.f1;
                     this.f1 = this.f2 * this.f3;
                     this.f0 = this.f0;
                     this.f1 = this.f1;
                     this.f1 = this.f1;
                     this.f0 = this.f0;
                     this.f0 = this.f0 + this.f1;
                     this.f0 = this.f0;
                     this.f0 = this.f0;
                     this.f0 = -this.f0;
                     this.f0 = this.f0;
                     sf32(this.f0,this.i7 + 12);
                     this.i4 = this.i4 + 32;
                     this.i11 = this.i11 + 32;
                     this.i7 = this.i7 + 16;
                     this.i5 = this.i5 + -16;
                     if(uint(this.i11) < uint(this.i5))
                     {
                        continue;
                     }
                     break;
                  }
                  this.i4 = this.i8 << 2;
                  this.i4 = this.i6 + this.i4;
                  this.i5 = this.i4;
                  this.i6 = this.i9;
                  do
                  {
                     this.f0 = lf32(this.i6 + -4);
                     this.f1 = this.f0;
                     this.f1 = -this.f1;
                     sf32(this.f0,this.i5 + -4);
                     this.f0 = this.f1;
                     sf32(this.f0,this.i4);
                     this.f0 = lf32(this.i6 + -8);
                     this.f1 = this.f0;
                     this.f1 = -this.f1;
                     sf32(this.f0,this.i5 + -8);
                     this.f0 = this.f1;
                     sf32(this.f0,this.i4 + 4);
                     this.f0 = lf32(this.i6 + -12);
                     this.f1 = this.f0;
                     this.f1 = -this.f1;
                     sf32(this.f0,this.i5 + -12);
                     this.f0 = this.f1;
                     sf32(this.f0,this.i4 + 8);
                     this.f0 = lf32(this.i6 + -16);
                     this.f1 = this.f0;
                     this.f1 = -this.f1;
                     sf32(this.f0,this.i5 + -16);
                     this.f0 = this.f1;
                     sf32(this.f0,this.i4 + 12);
                     this.i4 = this.i4 + 16;
                     this.i6 = this.i6 + -16;
                     this.i5 = this.i5 + -16;
                  }
                  while(uint(this.i4) < uint(this.i6));
                  
                  this.i4 = this.i9;
                  this.i5 = this.i9;
                  while(true)
                  {
                     this.f0 = lf32(this.i5 + 12);
                     sf32(this.f0,this.i4 + -16);
                     this.f0 = lf32(this.i5 + 8);
                     sf32(this.f0,this.i4 + -12);
                     this.f0 = lf32(this.i5 + 4);
                     sf32(this.f0,this.i4 + -8);
                     this.f0 = lf32(this.i5);
                     sf32(this.f0,this.i4 + -4);
                     this.i5 = this.i5 + 16;
                     this.i4 = this.i4 + -16;
                     if(uint(this.i4) > uint(this.i10))
                     {
                        continue;
                     }
                     break;
                  }
                  this.i1 = this.i1 + 4;
                  this.i0 = this.i0 + 1;
                  §§goto(addr3495);
               }
         }
      }
   }
}
