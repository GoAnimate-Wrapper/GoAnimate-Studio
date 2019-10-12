package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.lf32;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.sf32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_floor1_fit extends Machine
   {
      
      public static const intRegCount:int = 32;
      
      public static const NumberRegCount:int = 5;
       
      
      public var i21:int;
      
      public var i30:int;
      
      public var i31:int;
      
      public var f0:Number;
      
      public var f1:Number;
      
      public var f3:Number;
      
      public var f2:Number;
      
      public var f4:Number;
      
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
      
      public var i26:int;
      
      public var i27:int;
      
      public var i20:int;
      
      public var i9:int;
      
      public var i28:int;
      
      public var i29:int;
      
      public function FSM_floor1_fit()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_floor1_fit = null;
         _loc1_ = new FSM_floor1_fit();
         FSM_floor1_fit.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 5068;
               this.i0 = 0;
               this.i1 = li32(mstate.ebp + 12);
               si32(this.i1,mstate.ebp + -5013);
               this.i1 = li32(this.i1 + 1296);
               si32(this.i1,mstate.ebp + -4986);
               this.i1 = li32(mstate.ebp + -5013);
               this.i1 = li32(this.i1 + 1288);
               this.i2 = li32(mstate.ebp + -5013);
               this.i2 = li32(this.i2 + 1284);
               this.i3 = li32(mstate.ebp + 16);
               si32(this.i3,mstate.ebp + -5049);
               this.i3 = li32(mstate.ebp + 20);
               si32(this.i3,mstate.ebp + -5058);
               this.i3 = mstate.ebp + -4944;
               this.i4 = mstate.ebp + -4672;
               si32(this.i4,mstate.ebp + -4995);
               this.i4 = mstate.ebp + -4400;
               si32(this.i4,mstate.ebp + -5004);
               this.i4 = mstate.ebp + -4128;
               si32(this.i4,mstate.ebp + -5067);
               this.i4 = mstate.ebp + -3856;
               this.i5 = mstate.ebp + -3584;
               this.i6 = li32(mstate.ebp + 8);
               si32(this.i6,mstate.ebp + -4977);
               this.i6 = li32(mstate.ebp + -4986);
               this.i7 = li32(mstate.ebp + -5058);
               this.i8 = li32(mstate.ebp + -5049);
               this.i9 = li32(mstate.ebp + -5013);
               si32(this.i9,mstate.ebp + -5040);
               this.i9 = this.i4;
               while(true)
               {
                  this.i10 = this.i9;
                  if(this.i0 >= this.i2)
                  {
                     break;
                  }
                  this.i11 = -200;
                  si32(this.i11,this.i10);
                  this.i9 = this.i9 + 4;
                  this.i0 = this.i0 + 1;
               }
               this.i0 = 0;
               this.i9 = li32(mstate.ebp + -5067);
               while(true)
               {
                  this.i10 = this.i9;
                  if(this.i0 >= this.i2)
                  {
                     break;
                  }
                  this.i11 = -200;
                  si32(this.i11,this.i10);
                  this.i9 = this.i9 + 4;
                  this.i0 = this.i0 + 1;
               }
               this.i0 = 0;
               this.i9 = li32(mstate.ebp + -5004);
               while(true)
               {
                  this.i10 = this.i0;
                  this.i0 = this.i9;
                  if(this.i10 >= this.i2)
                  {
                     break;
                  }
                  this.i11 = 0;
                  si32(this.i11,this.i0);
                  this.i0 = this.i9 + 4;
                  this.i10 = this.i10 + 1;
                  this.i9 = this.i0;
                  this.i0 = this.i10;
               }
               this.i0 = 0;
               this.i9 = li32(mstate.ebp + -4995);
               while(true)
               {
                  this.i10 = this.i9;
                  if(this.i0 >= this.i2)
                  {
                     break;
                  }
                  this.i11 = 1;
                  si32(this.i11,this.i10);
                  this.i9 = this.i9 + 4;
                  this.i0 = this.i0 + 1;
               }
               this.i0 = 0;
               while(true)
               {
                  this.i9 = this.i3;
                  if(this.i0 >= this.i2)
                  {
                     break;
                  }
                  this.i10 = -1;
                  si32(this.i10,this.i9);
                  this.i3 = this.i3 + 4;
                  this.i0 = this.i0 + 1;
               }
               if(this.i2 == 0)
               {
                  this.i5 = 0;
                  mstate.esp = mstate.esp - 28;
                  this.i0 = mstate.ebp + -3584;
                  this.i3 = li32(mstate.ebp + -5058);
                  si32(this.i3,mstate.esp);
                  this.i3 = li32(mstate.ebp + -5049);
                  si32(this.i3,mstate.esp + 4);
                  si32(this.i5,mstate.esp + 8);
                  si32(this.i1,mstate.esp + 12);
                  si32(this.i0,mstate.esp + 16);
                  si32(this.i1,mstate.esp + 20);
                  si32(this.i6,mstate.esp + 24);
                  mstate.esp = mstate.esp - 4;
                  FSM_floor1_fit.start();
               }
               else
               {
                  this.i0 = 0;
                  this.i3 = this.i2 + -1;
                  this.i9 = li32(mstate.ebp + -5040);
                  this.i10 = this.i0;
                  addr675:
                  while(true)
                  {
                     this.i12 = this.i0;
                     this.i11 = this.i9;
                     this.i0 = this.i5;
                     if(this.i3 <= this.i10)
                     {
                        break;
                     }
                     this.i13 = li32(this.i9 + 4);
                     this.i11 = li32(this.i11);
                     mstate.esp = mstate.esp - 28;
                     this.i14 = li32(mstate.ebp + -5058);
                     si32(this.i14,mstate.esp);
                     this.i14 = li32(mstate.ebp + -5049);
                     si32(this.i14,mstate.esp + 4);
                     si32(this.i11,mstate.esp + 8);
                     si32(this.i13,mstate.esp + 12);
                     si32(this.i0,mstate.esp + 16);
                     si32(this.i1,mstate.esp + 20);
                     si32(this.i6,mstate.esp + 24);
                     mstate.esp = mstate.esp - 4;
                     FSM_floor1_fit.start();
                  }
                  this.i1 = this.i12;
               }
               this.i0 = this.i1;
               if(this.i0 == 0)
               {
                  this.i2 = 0;
                  addr3139:
                  this.i0 = this.i2;
                  mstate.eax = this.i0;
                  mstate.esp = mstate.ebp;
                  mstate.ebp = li32(mstate.esp);
                  mstate.esp = mstate.esp + 4;
                  mstate.esp = mstate.esp + 4;
                  mstate.gworker = caller;
                  return;
               }
               this.i0 = -200;
               si32(this.i0,mstate.ebp + -4948);
               si32(this.i0,mstate.ebp + -4952);
               mstate.esp = mstate.esp - 20;
               this.i0 = mstate.ebp + -3584;
               this.i1 = this.i2 + -1;
               this.i3 = mstate.ebp + -4952;
               this.i5 = mstate.ebp + -4948;
               si32(this.i0,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               si32(this.i5,mstate.esp + 8);
               si32(this.i3,mstate.esp + 12);
               si32(this.i6,mstate.esp + 16);
               mstate.esp = mstate.esp - 4;
               FSM_floor1_fit.start();
            case 1:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 28;
               §§goto(addr697);
            case 2:
               while(true)
               {
                  this.i0 = mstate.eax;
                  mstate.esp = mstate.esp + 28;
                  this.i5 = this.i5 + 56;
                  this.i10 = this.i10 + 1;
                  this.i0 = this.i0 + this.i12;
                  this.i9 = this.i9 + 4;
                  §§goto(addr675);
               }
            case 3:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 20;
               this.i0 = li32(mstate.ebp + -4948);
               si32(this.i0,mstate.ebp + -3856);
               si32(this.i0,mstate.ebp + -4128);
               this.i0 = li32(mstate.ebp + -4952);
               si32(this.i0,mstate.ebp + -4124);
               si32(this.i0,mstate.ebp + -3852);
               this.i0 = 2;
               this.i1 = this.i6 + 1104;
               si32(this.i1,mstate.ebp + -5022);
               this.i1 = this.i6 + 1100;
               this.i3 = this.i6 + 1096;
               this.i5 = this.i6 + 1112;
               si32(this.i5,mstate.ebp + -5031);
               this.i5 = mstate.ebp + -4128;
               this.i9 = mstate.ebp + -3856;
               this.i10 = 0;
               loop7:
               while(this.i0 < this.i2)
               {
                  this.i11 = mstate.ebp + -4400;
                  this.i12 = li32(mstate.ebp + -5040);
                  this.i12 = this.i12 + this.i10;
                  this.i12 = li32(this.i12 + 528);
                  this.i13 = this.i12 << 2;
                  this.i11 = this.i11 + this.i13;
                  this.i11 = li32(this.i11);
                  this.i14 = mstate.ebp + -4672;
                  this.i15 = this.i11 << 2;
                  this.i16 = mstate.ebp + -4944;
                  this.i15 = this.i16 + this.i15;
                  this.i13 = this.i14 + this.i13;
                  this.i13 = li32(this.i13);
                  this.i14 = li32(this.i15);
                  if(this.i14 != this.i13)
                  {
                     this.i14 = this.i13 << 2;
                     this.i16 = li32(mstate.ebp + -5013);
                     this.i16 = this.i16 + 520;
                     this.i17 = this.i11 << 2;
                     this.i18 = this.i16 + this.i14;
                     this.i16 = this.i16 + this.i17;
                     this.i16 = li32(this.i16);
                     this.i18 = li32(this.i18);
                     this.i19 = this.i6 + 836;
                     si32(this.i13,this.i15);
                     this.i14 = this.i19 + this.i14;
                     this.i15 = this.i19 + this.i17;
                     this.i15 = li32(this.i15);
                     this.i14 = li32(this.i14);
                     mstate.esp = mstate.esp - 12;
                     si32(this.i9,mstate.esp);
                     si32(this.i5,mstate.esp + 4);
                     si32(this.i11,mstate.esp + 8);
                     mstate.esp = mstate.esp - 4;
                     FSM_floor1_fit.start();
                  }
                  while(true)
                  {
                     this.i10 = this.i10 + 4;
                     this.i0 = this.i0 + 1;
                     continue loop7;
                  }
               }
               this.i0 = 0;
               mstate.esp = mstate.esp - 8;
               this.i1 = this.i2 << 2;
               this.i3 = li32(mstate.ebp + -4977);
               si32(this.i3,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               state = 11;
               mstate.esp = mstate.esp - 4;
               FSM_floor1_fit.start();
               return;
            case 4:
               while(true)
               {
                  this.i17 = mstate.eax;
                  mstate.esp = mstate.esp + 12;
                  mstate.esp = mstate.esp - 12;
                  si32(this.i9,mstate.esp);
                  si32(this.i5,mstate.esp + 4);
                  si32(this.i13,mstate.esp + 8);
                  mstate.esp = mstate.esp - 4;
                  FSM_floor1_fit.start();
               }
            case 5:
               while(true)
               {
                  this.i19 = mstate.eax;
                  mstate.esp = mstate.esp + 12;
                  if(this.i17 != -1)
                  {
                     if(this.i19 == -1)
                     {
                        break;
                     }
                     addr1219:
                     while(true)
                     {
                        this.i20 = this.i15 << 2;
                        this.i21 = li32(mstate.ebp + -5058);
                        this.i21 = this.i21 + this.i20;
                        this.f0 = lf32(this.i21);
                        this.i21 = this.i19 - this.i17;
                        mstate.esp = mstate.esp - 4;
                        this.i22 = this.i14 - this.i15;
                        sf32(this.f0,mstate.esp);
                        this.i23 = this.i21 / this.i22;
                        mstate.esp = mstate.esp - 4;
                        FSM_floor1_fit.start();
                     }
                  }
                  break;
               }
               this.i0 = 1;
               mstate.esp = mstate.esp - 4;
               si32(this.i0,mstate.esp);
               state = 6;
               mstate.esp = mstate.esp - 4;
               FSM_floor1_fit.start();
               return;
            case 6:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1219);
            case 7:
               while(true)
               {
                  this.i24 = mstate.eax;
                  this.i25 = this.i23 * this.i22;
                  this.i26 = this.i21 >> 31;
                  this.i27 = this.i25 >> 31;
                  mstate.esp = mstate.esp + 4;
                  this.i28 = li32(mstate.ebp + -5031);
                  this.f1 = lf32(this.i28);
                  this.i28 = this.i21 + this.i26;
                  this.i25 = this.i25 + this.i27;
                  this.i29 = li32(mstate.ebp + -5049);
                  this.i20 = this.i29 + this.i20;
                  this.f2 = lf32(this.i20);
                  this.f3 = this.f1;
                  this.i20 = this.i17 - this.i24;
                  this.i26 = this.i28 ^ this.i26;
                  this.i25 = this.i25 ^ this.i27;
                  this.i21 = this.i21 < 0?-1:1;
                  this.f2 = this.f2 + this.f3;
                  this.i20 = this.i20 * this.i20;
                  this.i25 = this.i26 - this.i25;
                  this.f2 = this.f2;
                  this.f0 = this.f0;
                  this.f2 = this.f2;
                  if(this.f2 >= this.f0)
                  {
                     this.f0 = Number(this.i17);
                     this.f2 = lf32(this.i3);
                     this.f3 = this.f0;
                     this.f4 = Number(this.i24);
                     this.f2 = this.f3 + this.f2;
                     this.f2 = this.f2;
                     this.f3 = this.f4;
                     this.f2 = this.f2;
                     if(this.f2 >= this.f3)
                     {
                        this.f2 = lf32(this.i1);
                        this.f0 = this.f0;
                        this.f0 = this.f0 - this.f2;
                        this.f0 = this.f0;
                        this.f2 = this.f4;
                        this.f0 = this.f0;
                        if(this.f0 <= this.f2)
                        {
                        }
                     }
                     addr1964:
                     while(true)
                     {
                        this.i14 = -200;
                        si32(this.i14,mstate.ebp + -4956);
                        si32(this.i14,mstate.ebp + -4960);
                        si32(this.i14,mstate.ebp + -4964);
                        si32(this.i14,mstate.ebp + -4968);
                        this.i14 = this.i16 * 56;
                        this.i15 = mstate.ebp + -3584;
                        mstate.esp = mstate.esp - 20;
                        this.i14 = this.i15 + this.i14;
                        this.i16 = this.i12 - this.i16;
                        this.i20 = mstate.ebp + -4960;
                        this.i21 = mstate.ebp + -4956;
                        si32(this.i14,mstate.esp);
                        si32(this.i16,mstate.esp + 4);
                        si32(this.i21,mstate.esp + 8);
                        si32(this.i20,mstate.esp + 12);
                        si32(this.i6,mstate.esp + 16);
                        mstate.esp = mstate.esp - 4;
                        FSM_floor1_fit.start();
                     }
                  }
                  this.i24 = 0;
                  this.i26 = this.i15 << 2;
                  this.i27 = 1;
                  this.i26 = this.i26 + 4;
                  this.i28 = this.i17;
                  while(true)
                  {
                     this.i29 = this.i26;
                     this.i26 = this.i28;
                     this.i28 = this.i15 + this.i27;
                     if(this.i28 >= this.i14)
                     {
                        this.f0 = lf32(this.i3);
                        this.f0 = this.f0 * this.f0;
                        this.f0 = this.f0;
                        this.f1 = Number(this.i27);
                        this.i14 = li32(mstate.ebp + -5022);
                        this.f2 = lf32(this.i14);
                        this.f3 = this.f1;
                        this.f0 = this.f0;
                        this.f0 = this.f0 / this.f3;
                        this.f0 = this.f0;
                        this.f3 = this.f2;
                        this.f0 = this.f0;
                        if(this.f0 <= this.f3)
                        {
                           this.f0 = lf32(this.i1);
                           this.f0 = this.f0 * this.f0;
                           this.f0 = this.f0;
                           this.f1 = this.f1;
                           this.f0 = this.f0;
                           this.f0 = this.f0 / this.f1;
                           this.f0 = this.f0;
                           this.f1 = this.f2;
                           this.f0 = this.f0;
                           if(this.f0 <= this.f1)
                           {
                              this.i14 = this.i20 / this.i27;
                              this.f0 = Number(this.i14);
                              this.f1 = this.f2;
                              this.f0 = this.f0;
                              if(this.f0 > this.f1)
                              {
                                 break;
                              }
                           }
                        }
                        this.i11 = -200;
                        this.i12 = this.i4 + this.i10;
                        si32(this.i11,this.i12 + 8);
                        this.i12 = li32(mstate.ebp + -5067);
                        this.i12 = this.i12 + this.i10;
                        si32(this.i11,this.i12 + 8);
                        §§goto(addr2663);
                     }
                     else
                     {
                        this.i28 = this.i7 + this.i29;
                        this.f0 = lf32(this.i28);
                        mstate.esp = mstate.esp - 4;
                        this.i28 = this.i23 + this.i21;
                        this.i24 = this.i24 + this.i25;
                        sf32(this.f0,mstate.esp);
                        this.i28 = this.i24 < this.i22?int(this.i23):int(this.i28);
                        mstate.esp = mstate.esp - 4;
                        FSM_floor1_fit.start();
                     }
                     this.i26 = this.i29 + 4;
                     this.i27 = this.i27 + 1;
                  }
                  §§goto(addr1964);
               }
            case 8:
               while(true)
               {
                  this.i30 = mstate.eax;
                  this.i28 = this.i26 + this.i28;
                  this.i26 = this.i28 - this.i30;
                  mstate.esp = mstate.esp + 4;
                  this.i31 = this.i8 + this.i29;
                  this.f2 = lf32(this.i31);
                  this.f3 = this.f1;
                  this.i31 = this.i24 - this.i22;
                  this.i26 = this.i26 * this.i26;
                  this.i24 = this.i24 < this.i22?int(this.i24):int(this.i31);
                  this.f2 = this.f2 + this.f3;
                  this.i20 = this.i26 + this.i20;
                  this.f2 = this.f2;
                  this.f0 = this.f0;
                  this.f2 = this.f2;
                  if(this.f2 >= this.f0)
                  {
                     if(this.i30 != 0)
                     {
                        this.f0 = Number(this.i28);
                        this.f2 = lf32(this.i3);
                        this.f3 = this.f0;
                        this.f4 = Number(this.i30);
                        this.f2 = this.f3 + this.f2;
                        this.f2 = this.f2;
                        this.f3 = this.f4;
                        this.f2 = this.f2;
                        if(this.f2 >= this.f3)
                        {
                           this.f2 = lf32(this.i1);
                           this.f0 = this.f0;
                           this.f0 = this.f0 - this.f2;
                           this.f0 = this.f0;
                           this.f2 = this.f4;
                           this.f0 = this.f0;
                           if(this.f0 <= this.f2)
                           {
                           }
                        }
                     }
                     §§goto(addr1964);
                  }
                  §§goto(addr1727);
               }
            case 9:
               while(true)
               {
                  this.i14 = mstate.eax;
                  mstate.esp = mstate.esp + 20;
                  this.i16 = this.i12 * 56;
                  mstate.esp = mstate.esp - 20;
                  this.i15 = this.i15 + this.i16;
                  this.i16 = this.i18 - this.i12;
                  this.i18 = mstate.ebp + -4968;
                  this.i20 = mstate.ebp + -4964;
                  si32(this.i15,mstate.esp);
                  si32(this.i16,mstate.esp + 4);
                  si32(this.i20,mstate.esp + 8);
                  si32(this.i18,mstate.esp + 12);
                  si32(this.i6,mstate.esp + 16);
                  mstate.esp = mstate.esp - 4;
                  FSM_floor1_fit.start();
               }
            case 10:
               while(true)
               {
                  this.i15 = mstate.eax;
                  mstate.esp = mstate.esp + 20;
                  if(this.i14 != 0)
                  {
                     si32(this.i17,mstate.ebp + -4956);
                     this.i16 = li32(mstate.ebp + -4964);
                     si32(this.i16,mstate.ebp + -4960);
                  }
                  if(this.i15 != 0)
                  {
                     this.i16 = li32(mstate.ebp + -4960);
                     si32(this.i16,mstate.ebp + -4964);
                     si32(this.i19,mstate.ebp + -4968);
                  }
                  if(this.i14 != 0)
                  {
                     if(this.i15 != 0)
                     {
                        this.i11 = -200;
                        this.i12 = this.i4 + this.i10;
                        si32(this.i11,this.i12 + 8);
                        this.i12 = li32(mstate.ebp + -5067);
                        this.i12 = this.i12 + this.i10;
                        si32(this.i11,this.i12 + 8);
                     }
                     §§goto(addr2663);
                  }
                  this.i14 = mstate.ebp + -4128;
                  this.i15 = this.i11 << 2;
                  this.i16 = li32(mstate.ebp + -4956);
                  this.i14 = this.i14 + this.i15;
                  si32(this.i16,this.i14);
                  if(this.i11 == 0)
                  {
                     this.i14 = mstate.ebp + -3856;
                     this.i15 = this.i11 << 2;
                     this.i14 = this.i14 + this.i15;
                     si32(this.i16,this.i14);
                  }
                  this.i14 = mstate.ebp + -3856;
                  this.i15 = li32(mstate.ebp + -4960);
                  this.i16 = this.i4 + this.i10;
                  si32(this.i15,this.i16 + 8);
                  this.i16 = li32(mstate.ebp + -4964);
                  this.i17 = li32(mstate.ebp + -5067);
                  this.i17 = this.i17 + this.i10;
                  si32(this.i16,this.i17 + 8);
                  this.i17 = this.i13 << 2;
                  this.i18 = li32(mstate.ebp + -4968);
                  this.i14 = this.i14 + this.i17;
                  si32(this.i18,this.i14);
                  if(this.i13 == 1)
                  {
                     this.i14 = mstate.ebp + -4128;
                     this.i17 = this.i13 << 2;
                     this.i14 = this.i14 + this.i17;
                     si32(this.i18,this.i14);
                  }
                  if(this.i15 <= -1)
                  {
                     if(this.i16 >= 0)
                     {
                     }
                     §§goto(addr2663);
                  }
                  this.i14 = this.i12 << 2;
                  this.i15 = li32(mstate.ebp + -4995);
                  this.i14 = this.i15 + this.i14;
                  this.i14 = this.i14 + -4;
                  this.i15 = this.i12 + -1;
                  while(true)
                  {
                     this.i16 = this.i14;
                     this.i14 = this.i15;
                     this.i15 = this.i16;
                     if(this.i14 > -1)
                     {
                        this.i17 = li32(this.i15);
                        if(this.i17 == this.i13)
                        {
                           si32(this.i0,this.i15);
                           this.i15 = this.i16 + -4;
                           this.i16 = this.i14 + -1;
                           this.i14 = this.i15;
                           this.i15 = this.i16;
                           continue;
                        }
                        break;
                     }
                     break;
                  }
                  this.i13 = this.i12 << 2;
                  this.i14 = li32(mstate.ebp + -5004);
                  this.i13 = this.i14 + this.i13;
                  this.i13 = this.i13 + 4;
                  this.i12 = this.i12 + 1;
                  while(true)
                  {
                     this.i14 = this.i13;
                     if(this.i12 >= this.i2)
                     {
                        break;
                     }
                     this.i15 = li32(this.i14);
                     if(this.i15 == this.i11)
                     {
                        si32(this.i0,this.i14);
                        this.i13 = this.i13 + 4;
                        this.i12 = this.i12 + 1;
                        continue;
                     }
                     break;
                  }
                  §§goto(addr2663);
               }
            case 11:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 12;
               si32(this.i9,mstate.esp);
               si32(this.i5,mstate.esp + 4);
               si32(this.i0,mstate.esp + 8);
               mstate.esp = mstate.esp - 4;
               FSM_floor1_fit.start();
            case 12:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i3,this.i1);
               mstate.esp = mstate.esp - 12;
               this.i3 = 1;
               si32(this.i9,mstate.esp);
               si32(this.i5,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               mstate.esp = mstate.esp - 4;
               FSM_floor1_fit.start();
            case 13:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i3,this.i1 + 4);
               this.i3 = 2;
               this.i4 = this.i1;
               while(true)
               {
                  this.i7 = this.i0;
                  if(this.i3 >= this.i2)
                  {
                     break;
                  }
                  this.i0 = li32(mstate.ebp + -5040);
                  this.i0 = this.i0 + this.i7;
                  this.i8 = li32(this.i0 + 1032);
                  this.i0 = li32(this.i0 + 780);
                  this.i0 = this.i0 << 2;
                  this.i8 = this.i8 << 2;
                  this.i10 = this.i6 + 836;
                  this.i11 = li32(mstate.ebp + -4986);
                  this.i11 = this.i11 + this.i7;
                  this.i12 = this.i1 + this.i0;
                  this.i13 = this.i1 + this.i8;
                  this.i0 = this.i10 + this.i0;
                  this.i8 = this.i10 + this.i8;
                  this.i8 = li32(this.i8);
                  this.i0 = li32(this.i0);
                  this.i10 = li32(this.i13);
                  this.i12 = li32(this.i12);
                  this.i11 = li32(this.i11 + 844);
                  mstate.esp = mstate.esp - 20;
                  si32(this.i8,mstate.esp);
                  si32(this.i0,mstate.esp + 4);
                  si32(this.i10,mstate.esp + 8);
                  si32(this.i12,mstate.esp + 12);
                  si32(this.i11,mstate.esp + 16);
                  mstate.esp = mstate.esp - 4;
                  FSM_floor1_fit.start();
                  this.i0 = this.i7 + 4;
                  this.i3 = this.i3 + 1;
               }
               this.i2 = this.i1;
               §§goto(addr3139);
            case 14:
               while(true)
               {
                  this.i0 = mstate.eax;
                  mstate.esp = mstate.esp + 20;
                  mstate.esp = mstate.esp - 12;
                  si32(this.i9,mstate.esp);
                  si32(this.i5,mstate.esp + 4);
                  si32(this.i3,mstate.esp + 8);
                  mstate.esp = mstate.esp - 4;
                  FSM_floor1_fit.start();
               }
            case 15:
               while(true)
               {
                  this.i8 = mstate.eax;
                  mstate.esp = mstate.esp + 12;
                  if(this.i8 >= 0)
                  {
                     if(this.i0 != this.i8)
                     {
                        this.i0 = this.i4 + this.i7;
                        si32(this.i8,this.i0 + 8);
                     }
                     §§goto(addr3113);
                  }
                  this.i8 = this.i4 + this.i7;
                  this.i0 = this.i0 | 32768;
                  si32(this.i0,this.i8 + 8);
                  §§goto(addr3113);
               }
         }
      }
   }
}
