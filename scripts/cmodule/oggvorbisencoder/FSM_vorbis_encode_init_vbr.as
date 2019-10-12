package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.lf32;
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.sf32;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_vorbis_encode_init_vbr extends Machine
   {
      
      public static const intRegCount:int = 32;
      
      public static const NumberRegCount:int = 6;
       
      
      public var i21:int;
      
      public var i30:int;
      
      public var i31:int;
      
      public var f0:Number;
      
      public var f1:Number;
      
      public var f3:Number;
      
      public var f5:Number;
      
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
      
      public function FSM_vorbis_encode_init_vbr()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_vorbis_encode_init_vbr = null;
         _loc1_ = new FSM_vorbis_encode_init_vbr();
         FSM_vorbis_encode_init_vbr.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 12;
               this.f0 = 1;
               this.f1 = lf32(mstate.ebp + 12);
               this.f2 = 0.9999;
               this.f1 = this.f1 + 1.0e-7;
               this.f0 = this.f0;
               this.f2 = this.f2;
               this.f1 = this.f1;
               this.f2 = this.f2;
               this.f0 = this.f0;
               this.f1 = this.f1;
               this.i0 = li32(mstate.ebp + 8);
               this.f0 = this.f1 < this.f0?Number(this.f1):Number(this.f2);
               this.i1 = li32(this.i0 + 28);
               this.f0 = this.f0;
               sf32(this.f0,this.i1 + 3416);
               this.i2 = FSM_vorbis_encode_init_vbr;
               this.i3 = this.i1 + 3400;
               this.f0 = this.f0;
               this.i4 = this.i0 + 28;
               while(true)
               {
                  this.i5 = li32(this.i2);
                  if(this.i5 == 0)
                  {
                     this.i2 = 0;
                     break;
                  }
                  this.i6 = li32(this.i5 + 12);
                  if(this.i6 != -1)
                  {
                     if(this.i6 == 2)
                     {
                     }
                     continue;
                  }
                  this.i6 = li32(this.i5 + 16);
                  if(this.i6 <= 44100)
                  {
                     this.i6 = li32(this.i5 + 20);
                     if(this.i6 >= 44100)
                     {
                        this.i6 = li32(this.i5 + 8);
                        this.f1 = lf64(this.i6);
                        this.i7 = this.i6;
                        if(this.f1 <= this.f0)
                        {
                           this.i8 = li32(this.i5);
                           this.i9 = this.i8 << 3;
                           this.i9 = this.i7 + this.i9;
                           this.f1 = lf64(this.i9);
                           if(this.f1 >= this.f0)
                           {
                              this.i2 = 0;
                              while(true)
                              {
                                 this.i9 = this.i6;
                                 this.i6 = this.i2;
                                 this.i2 = this.i9;
                                 if(this.i6 < this.i8)
                                 {
                                    this.f1 = lf64(this.i2);
                                    if(this.f1 <= this.f0)
                                    {
                                       this.f1 = lf64(this.i9 + 8);
                                       if(this.f1 > this.f0)
                                       {
                                          break;
                                       }
                                    }
                                    this.i2 = this.i9 + 8;
                                    this.i9 = this.i6 + 1;
                                    this.i6 = this.i2;
                                    this.i2 = this.i9;
                                    continue;
                                 }
                                 break;
                              }
                              if(this.i6 == this.i8)
                              {
                                 this.f0 = Number(this.i6);
                                 this.f0 = this.f0 + -0.001;
                              }
                              else
                              {
                                 this.i2 = this.i6 << 3;
                                 this.i8 = this.i2 + this.i7;
                                 this.i2 = this.i7 + this.i2;
                                 this.f1 = lf64(this.i2);
                                 this.f2 = lf64(this.i8 + 8);
                                 this.f2 = this.f2;
                                 this.f1 = this.f1;
                                 this.f2 = this.f2;
                                 this.f1 = this.f1;
                                 this.f2 = this.f2 - this.f1;
                                 this.f2 = this.f2;
                                 this.f2 = this.f2;
                                 this.f0 = this.f0 - this.f1;
                                 this.f0 = this.f0 / this.f2;
                                 this.f1 = Number(this.i6);
                                 this.f0 = this.f0;
                                 this.f0 = this.f0;
                                 this.f1 = this.f1;
                                 this.f0 = this.f1 + this.f0;
                                 this.f0 = this.f0;
                                 this.f0 = this.f0;
                              }
                              sf64(this.f0,this.i3);
                              this.i2 = this.i5;
                              break;
                           }
                        }
                        continue;
                     }
                     continue;
                  }
               }
               si32(this.i2,this.i1 + 3396);
               if(this.i2 == 0)
               {
                  this.i1 = -130;
               }
               else
               {
                  this.i2 = 0;
                  this.i3 = li32(this.i4);
                  this.i5 = li32(this.i3 + 3396);
                  si32(this.i2,this.i0);
                  this.i2 = 2;
                  si32(this.i2,this.i0 + 4);
                  this.i2 = 44100;
                  si32(this.i2,this.i0 + 8);
                  this.i2 = 1;
                  si32(this.i2,this.i3 + 3456);
                  si32(this.i2,this.i3 + 3460);
                  this.f0 = lf64(this.i3 + 3400);
                  this.i2 = int(this.f0);
                  sf64(this.f0,this.i3 + 3472);
                  this.f1 = Number(this.i2);
                  this.i6 = li32(this.i3 + 3488);
                  this.f1 = this.f0 - this.f1;
                  this.i7 = this.i3;
                  if(this.i6 == 0)
                  {
                     this.i6 = li32(this.i5 + 120);
                     this.i8 = this.i2 << 3;
                     this.i9 = this.i8 + this.i6;
                     this.i6 = this.i6 + this.i8;
                     this.f2 = lf64(this.i9 + 8);
                     this.f3 = lf64(this.i6);
                     this.f4 = 1 - this.f1;
                     this.f2 = this.f2 * this.f1;
                     this.f3 = this.f3 * this.f4;
                     this.f2 = this.f3 + this.f2;
                     sf64(this.f2,this.i7 + 3480);
                  }
                  this.i6 = -1072168960;
                  this.i8 = this.i2 + 1;
                  this.i9 = li32(this.i5 + 112);
                  this.i8 = this.i8 << 2;
                  this.i2 = this.i2 << 2;
                  this.i10 = this.i9 + this.i8;
                  this.i9 = this.i9 + this.i2;
                  this.i9 = li32(this.i9);
                  this.i10 = li32(this.i10);
                  this.f2 = Number(this.i10);
                  this.f3 = 1 - this.f1;
                  this.f4 = Number(this.i9);
                  this.f2 = this.f2 * this.f1;
                  this.f4 = this.f4 * this.f3;
                  this.f2 = this.f4 + this.f2;
                  sf64(this.f2,this.i7 + 3496);
                  this.i5 = li32(this.i5 + 116);
                  this.i8 = this.i5 + this.i8;
                  this.i2 = this.i5 + this.i2;
                  this.i2 = li32(this.i2);
                  this.i5 = li32(this.i8);
                  this.f2 = Number(this.i5);
                  this.f4 = Number(this.i2);
                  this.f1 = this.f2 * this.f1;
                  this.f2 = this.f4 * this.f3;
                  this.f1 = this.f2 + this.f1;
                  sf64(this.f1,this.i7 + 3504);
                  this.i2 = 0;
                  si32(this.i2,this.i7 + 3512);
                  si32(this.i6,this.i7 + 3516);
                  sf64(this.f0,this.i7 + 3520);
                  while(this.i2 < 4)
                  {
                     sf64(this.f0,this.i3 + 3528);
                     sf64(this.f0,this.i3 + 3536);
                     sf64(this.f0,this.i3 + 3544);
                     sf64(this.f0,this.i3 + 3552);
                     this.i3 = this.i3 + 32;
                     this.i2 = this.i2 + 1;
                  }
                  this.i2 = 0;
                  si32(this.i2,this.i1 + 3420);
                  this.i3 = 1;
                  si32(this.i3,this.i1 + 3464);
                  this.i1 = this.i2;
               }
               if(this.i1 == 0)
               {
                  this.i1 = li32(this.i4);
                  this.i2 = this.i1;
                  if(this.i1 != 0)
                  {
                     this.f0 = -80;
                     this.i3 = li32(this.i1 + 3456);
                     this.f1 = lf64(this.i1 + 3496);
                     this.i5 = this.i3 == 0?1:0;
                     this.i5 = this.i5 & 1;
                     this.i6 = this.i1 + 3496;
                     if(this.f1 <= this.f0)
                     {
                        this.f0 = this.f1;
                     }
                     else
                     {
                        this.i7 = -1068236800;
                        this.i8 = 0;
                        si32(this.i8,this.i6);
                        si32(this.i7,this.i6 + 4);
                        this.f0 = -80;
                     }
                     this.f1 = -200;
                     if(this.f0 < this.f1)
                     {
                        this.i7 = -1066860544;
                        this.i8 = 0;
                        si32(this.i8,this.i6);
                        si32(this.i7,this.i6 + 4);
                     }
                     this.f0 = 0;
                     this.f1 = lf64(this.i1 + 3512);
                     this.i6 = this.i1 + 3512;
                     if(this.f1 <= this.f0)
                     {
                        this.f0 = this.f1;
                     }
                     else
                     {
                        this.i7 = 0;
                        si32(this.i7,this.i6);
                        si32(this.i7,this.i6 + 4);
                        this.f0 = 0;
                     }
                     this.f1 = -99999;
                     if(this.f0 < this.f1)
                     {
                        this.i7 = -1057461776;
                        this.i8 = 0;
                        si32(this.i8,this.i6);
                        si32(this.i7,this.i6 + 4);
                     }
                     this.i6 = li32(this.i1 + 3396);
                     if(this.i6 != 0)
                     {
                        this.i7 = 1;
                        si32(this.i7,this.i1 + 3392);
                        this.f0 = lf64(this.i1 + 3400);
                        this.i7 = int(this.f0);
                        this.i8 = li32(this.i6 + 24);
                        this.i7 = this.i7 << 2;
                        this.i9 = li32(this.i6 + 28);
                        this.i9 = this.i9 + this.i7;
                        this.i7 = this.i8 + this.i7;
                        this.i8 = li32(this.i4);
                        this.i7 = li32(this.i7);
                        this.i9 = li32(this.i9);
                        si32(this.i7,this.i8);
                        si32(this.i9,this.i8 + 4);
                        this.i2 = li32(this.i2);
                        this.i7 = li32(this.i1 + 4);
                        this.i8 = this.i1 + 3400;
                        this.i9 = 0;
                        this.i10 = this.i6 + 136;
                        this.i11 = this.i6 + 140;
                        this.i12 = this.i6 + 148;
                        this.i13 = this.i6 + 144;
                        this.i14 = this.i9;
                        addr1934:
                        this.i15 = li32(this.i13);
                        if(this.i15 <= this.i9)
                        {
                           this.i9 = 492;
                           this.f0 = lf64(this.i1 + 3520);
                           this.i10 = int(this.f0);
                           this.i11 = li32(this.i6 + 128);
                           this.i12 = this.i10 << 3;
                           this.i13 = this.i11 + this.i12;
                           this.f1 = lf64(this.i13);
                           this.i14 = li32(this.i4);
                           this.i15 = li32(this.i6 + 124);
                           this.i16 = int(this.f1);
                           this.i16 = this.i16 * 492;
                           this.i17 = this.i14 + 2868;
                           this.i16 = this.i15 + this.i16;
                           this.f1 = Number(this.i10);
                           memcpy(this.i17,this.i16,this.i9);
                           this.i9 = this.i12 + this.i11;
                           this.f0 = this.f0 - this.f1;
                           this.f1 = lf64(this.i9 + 8);
                           this.f2 = lf64(this.i13);
                           this.f3 = 1 - this.f0;
                           this.f0 = this.f1 * this.f0;
                           this.f1 = this.f2 * this.f3;
                           this.f0 = this.f1 + this.f0;
                           this.i9 = int(this.f0);
                           this.f1 = Number(this.i9);
                           this.f2 = 0;
                           this.f0 = this.f0 - this.f1;
                           this.i10 = this.f0 == this.f2?1:0;
                           this.i11 = this.i9 > 0?1:0;
                           this.i10 = this.i10 & this.i11;
                           this.i10 = this.i10 & 1;
                           this.i11 = this.i10 != 0?-1:0;
                           this.f1 = 1;
                           this.i9 = this.i11 + this.i9;
                           this.f0 = this.i10 != 0?Number(this.f1):Number(this.f0);
                           this.i9 = this.i9 * 492;
                           this.i9 = this.i15 + this.i9;
                           this.f1 = 1 - this.f0;
                           this.i10 = 0;
                           this.i11 = this.i14;
                           this.i12 = this.i10;
                           while(this.i10 < 4)
                           {
                              this.i13 = this.i9 + this.i12;
                              this.f2 = lf32(this.i13 + 4);
                              this.f3 = lf32(this.i13 + 496);
                              this.f3 = this.f3 * this.f0;
                              this.f2 = this.f2 * this.f1;
                              this.f2 = this.f2 + this.f3;
                              this.i15 = this.i14 + this.i12;
                              this.f2 = this.f2;
                              sf32(this.f2,this.i15 + 2872);
                              this.f2 = lf32(this.i13 + 32);
                              this.f3 = lf32(this.i13 + 524);
                              this.f3 = this.f3 * this.f0;
                              this.f2 = this.f2 * this.f1;
                              this.f2 = this.f2 + this.f3;
                              this.f2 = this.f2;
                              sf32(this.f2,this.i15 + 2900);
                              this.i12 = this.i12 + 4;
                              this.i10 = this.i10 + 1;
                           }
                           this.f0 = lf64(this.i11 + 3512);
                           this.f0 = this.f0;
                           sf32(this.f0,this.i11 + 2936);
                           this.f0 = lf64(this.i1 + 3472);
                           this.f0 = this.f0;
                           this.i9 = int(this.f0);
                           this.f1 = Number(this.i9);
                           this.f1 = this.f1;
                           this.f0 = this.f0;
                           this.f0 = this.f0 - this.f1;
                           this.f0 = this.f0;
                           this.i10 = li32(this.i6 + 132);
                           this.i11 = li32(this.i4);
                           this.f0 = this.f0;
                           this.i12 = this.i11;
                           this.i13 = this.i11;
                           this.i14 = this.i10;
                           if(this.i10 != 0)
                           {
                              this.i15 = 60;
                              this.i16 = this.i13 + 3120;
                              this.i17 = this.i9 * 240;
                              this.i17 = this.i14 + this.i17;
                              memcpy(this.i16,this.i17,this.i15);
                              this.i16 = this.i13 + 3180;
                              this.i17 = this.i17 + 60;
                              memcpy(this.i16,this.i17,this.i15);
                              this.i15 = li32(this.i1 + 3420);
                              if(this.i15 != 0)
                              {
                                 this.i14 = 0;
                                 this.i9 = this.i9 * 240;
                                 this.i9 = this.i10 + this.i9;
                                 this.i12 = this.i12 + 4;
                                 this.i10 = this.i0 + 8;
                                 this.f1 = 1 - this.f0;
                                 this.i15 = this.i14;
                                 while(this.i14 < 15)
                                 {
                                    this.i16 = this.i9 + this.i15;
                                    this.f2 = lf32(this.i16 + 120);
                                    this.f3 = lf32(this.i16 + 360);
                                    this.f3 = this.f3 * this.f0;
                                    this.f2 = this.f2 * this.f1;
                                    this.f2 = this.f2 + this.f3;
                                    this.f2 = this.f2;
                                    this.i17 = li32(this.i10);
                                    this.f3 = this.f2;
                                    this.i18 = li32(this.i13);
                                    this.f4 = Number(this.i17);
                                    this.f3 = this.f3 * 1000;
                                    this.f5 = Number(this.i18);
                                    this.f4 = this.f3 / this.f4;
                                    this.f4 = this.f4 * this.f5;
                                    this.i17 = this.i11 + this.i15;
                                    this.i18 = int(this.f4);
                                    si32(this.i18,this.i17 + 3000);
                                    this.i18 = li32(this.i10);
                                    this.i19 = li32(this.i12);
                                    this.f4 = Number(this.i18);
                                    this.f5 = Number(this.i19);
                                    this.f3 = this.f3 / this.f4;
                                    this.f3 = this.f3 * this.f5;
                                    this.i18 = int(this.f3);
                                    si32(this.i18,this.i17 + 3060);
                                    this.i18 = int(this.f2);
                                    si32(this.i18,this.i17 + 2940);
                                    this.f2 = lf32(this.i16 + 180);
                                    this.f3 = lf32(this.i16 + 420);
                                    this.f3 = this.f3 * this.f0;
                                    this.f2 = this.f2 * this.f1;
                                    this.f2 = this.f2 + this.f3;
                                    this.f2 = this.f2;
                                    this.i16 = li32(this.i10);
                                    this.f2 = this.f2;
                                    this.i18 = li32(this.i13);
                                    this.f3 = Number(this.i16);
                                    this.f2 = this.f2 * 1000;
                                    this.f4 = Number(this.i18);
                                    this.f3 = this.f2 / this.f3;
                                    this.f3 = this.f3 * this.f4;
                                    this.i16 = int(this.f3);
                                    si32(this.i16,this.i17 + 3240);
                                    this.i16 = li32(this.i10);
                                    this.i18 = li32(this.i12);
                                    this.f3 = Number(this.i16);
                                    this.f4 = Number(this.i18);
                                    this.f2 = this.f2 / this.f3;
                                    this.f2 = this.f2 * this.f4;
                                    this.i16 = int(this.f2);
                                    si32(this.i16,this.i17 + 3300);
                                    this.i15 = this.i15 + 4;
                                    this.i14 = this.i14 + 1;
                                 }
                              }
                              else
                              {
                                 this.i10 = 0;
                                 this.i15 = this.i9 + 1;
                                 this.i16 = this.i15 * 240;
                                 this.i17 = this.i9 * 240;
                                 this.i16 = this.i14 + this.i16;
                                 this.i17 = this.i14 + this.i17;
                                 this.f1 = lf32(this.i16 + 148);
                                 this.f2 = lf32(this.i17 + 148);
                                 this.f3 = 1 - this.f0;
                                 this.f1 = this.f1 * this.f0;
                                 this.f2 = this.f2 * this.f3;
                                 this.f1 = this.f2 + this.f1;
                                 this.f1 = this.f1;
                                 this.f2 = this.f1;
                                 this.i16 = int(this.f1);
                                 this.i12 = this.i12 + 4;
                                 this.i17 = this.i0 + 8;
                                 this.f1 = this.f2 * 1000;
                                 this.i18 = this.i11;
                                 while(this.i10 < 15)
                                 {
                                    this.i19 = li32(this.i17);
                                    this.i20 = li32(this.i13);
                                    this.f2 = Number(this.i19);
                                    this.f4 = Number(this.i20);
                                    this.f2 = this.f1 / this.f2;
                                    this.f2 = this.f2 * this.f4;
                                    this.i19 = int(this.f2);
                                    si32(this.i19,this.i18 + 3000);
                                    this.i19 = li32(this.i17);
                                    this.i20 = li32(this.i12);
                                    this.f2 = Number(this.i19);
                                    this.f4 = Number(this.i20);
                                    this.f2 = this.f1 / this.f2;
                                    this.f2 = this.f2 * this.f4;
                                    this.i19 = int(this.f2);
                                    si32(this.i19,this.i18 + 3060);
                                    si32(this.i16,this.i18 + 2940);
                                    this.i18 = this.i18 + 4;
                                    this.i10 = this.i10 + 1;
                                 }
                                 this.i10 = 0;
                                 this.i15 = this.i15 * 240;
                                 this.i9 = this.i9 * 240;
                                 this.i15 = this.i14 + this.i15;
                                 this.i9 = this.i14 + this.i9;
                                 this.f1 = lf32(this.i9 + 208);
                                 this.f2 = lf32(this.i15 + 208);
                                 this.f0 = this.f2 * this.f0;
                                 this.f1 = this.f1 * this.f3;
                                 this.f0 = this.f1 + this.f0;
                                 this.f0 = this.f0;
                                 this.f0 = this.f0;
                                 this.f0 = this.f0 * 1000;
                                 this.i9 = this.i10;
                                 while(true)
                                 {
                                    this.i10 = this.i11;
                                    this.i11 = this.i9;
                                    if(this.i11 >= 15)
                                    {
                                       break;
                                    }
                                    this.i9 = li32(this.i17);
                                    this.i14 = li32(this.i13);
                                    this.f1 = Number(this.i9);
                                    this.f2 = Number(this.i14);
                                    this.f1 = this.f0 / this.f1;
                                    this.f1 = this.f1 * this.f2;
                                    this.i9 = int(this.f1);
                                    si32(this.i9,this.i10 + 3240);
                                    this.i9 = li32(this.i17);
                                    this.i14 = li32(this.i12);
                                    this.f1 = Number(this.i9);
                                    this.f2 = Number(this.i14);
                                    this.f1 = this.f0 / this.f1;
                                    this.f1 = this.f1 * this.f2;
                                    this.i9 = int(this.f1);
                                    si32(this.i9,this.i10 + 3300);
                                    this.i9 = this.i10 + 4;
                                    this.i10 = this.i11 + 1;
                                    this.i11 = this.i9;
                                    this.i9 = this.i10;
                                 }
                              }
                           }
                           else
                           {
                              this.i9 = 0;
                              this.i10 = this.i12 + 4;
                              this.i12 = this.i13;
                              while(this.i9 < 15)
                              {
                                 this.i13 = li32(this.i12);
                                 si32(this.i13,this.i11 + 3240);
                                 this.i13 = li32(this.i10);
                                 si32(this.i13,this.i11 + 3300);
                                 this.i11 = this.i11 + 4;
                                 this.i9 = this.i9 + 1;
                              }
                           }
                           this.i9 = 0;
                           this.i10 = li32(this.i6 + 108);
                           this.i11 = li32(this.i6 + 100);
                           this.i12 = li32(this.i6 + 92);
                           this.f0 = lf64(this.i8);
                           mstate.esp = mstate.esp - 28;
                           si32(this.i0,mstate.esp);
                           sf64(this.f0,mstate.esp + 4);
                           si32(this.i12,mstate.esp + 12);
                           si32(this.i11,mstate.esp + 16);
                           si32(this.i10,mstate.esp + 20);
                           si32(this.i9,mstate.esp + 24);
                           state = 3;
                           mstate.esp = mstate.esp - 4;
                           FSM_vorbis_encode_init_vbr.start();
                           return;
                        }
                        this.i15 = 1120;
                        this.i16 = li32(this.i12);
                        this.i16 = this.i16 + this.i14;
                        this.f0 = lf64(this.i8);
                        this.i16 = li32(this.i16);
                        this.i17 = li32(this.i11);
                        this.i18 = li32(this.i10);
                        mstate.esp = mstate.esp - 8;
                        this.i19 = 0;
                        si32(this.i19,mstate.esp);
                        si32(this.i15,mstate.esp + 4);
                        state = 2;
                        mstate.esp = mstate.esp - 4;
                        FSM_vorbis_encode_init_vbr.start();
                        return;
                     }
                  }
                  this.i1 = -131;
                  addr8076:
                  if(this.i1 == 0)
                  {
                     break;
                  }
               }
               mstate.esp = mstate.esp - 4;
               si32(this.i0,mstate.esp);
               state = 1;
               mstate.esp = mstate.esp - 4;
               FSM_vorbis_encode_init_vbr.start();
               return;
            case 1:
               mstate.esp = mstate.esp + 4;
               break;
            case 2:
               this.i15 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i19 = int(this.f0);
               if(this.i15 != 0)
               {
                  this.i20 = 0;
                  this.i21 = this.i15;
                  this.i22 = 1120;
                  memset(this.i21,this.i20,this.i22);
               }
               this.i20 = 1120;
               this.i19 = this.i19 << 2;
               this.i16 = this.i16 + this.i19;
               this.i19 = li32(this.i16);
               this.i21 = li32(this.i4);
               this.i19 = this.i19 * 1120;
               this.i22 = this.i15;
               this.i17 = this.i17 + this.i19;
               memcpy(this.i22,this.i17,this.i20);
               this.i17 = li32(this.i15);
               this.i19 = -1;
               this.i20 = 0;
               this.i22 = this.i15 + 4;
               this.i23 = this.i15;
               while(true)
               {
                  this.i24 = this.i22;
                  this.i22 = this.i20;
                  this.i20 = this.i19;
                  this.i19 = this.i24;
                  if(this.i22 >= this.i17)
                  {
                     break;
                  }
                  this.i19 = li32(this.i19);
                  this.i19 = this.i19 > this.i20?int(this.i19):int(this.i20);
                  this.i20 = this.i24 + 4;
                  this.i24 = this.i22 + 1;
                  this.i22 = this.i20;
                  this.i20 = this.i24;
               }
               this.i17 = -1;
               this.i19 = 0;
               this.i22 = this.i23 + 320;
               this.i24 = this.i21 + 24;
               while(true)
               {
                  this.i25 = this.i22;
                  this.i22 = this.i23;
                  if(this.i19 > this.i20)
                  {
                     break;
                  }
                  this.i23 = 0;
                  this.i26 = li32(this.i22 + 256);
                  this.i27 = li32(this.i24);
                  this.i27 = this.i26 + this.i27;
                  si32(this.i27,this.i22 + 256);
                  this.i17 = this.i26 > this.i17?int(this.i26):int(this.i17);
                  this.i26 = this.i22 + 192;
                  this.i27 = this.i25;
                  while(true)
                  {
                     this.i28 = this.i27;
                     this.i27 = this.i17;
                     this.i29 = 1;
                     this.i30 = li32(this.i26);
                     this.i17 = this.i28;
                     this.i29 = this.i29 << this.i30;
                     if(this.i29 <= this.i23)
                     {
                        break;
                     }
                     this.i29 = li32(this.i17);
                     this.i30 = this.i29 > this.i27?int(this.i29):int(this.i27);
                     if(this.i29 >= 0)
                     {
                        this.i27 = li32(this.i24);
                        this.i27 = this.i29 + this.i27;
                        si32(this.i27,this.i17);
                     }
                     this.i17 = this.i28 + 4;
                     this.i23 = this.i23 + 1;
                     this.i27 = this.i17;
                     this.i17 = this.i30;
                  }
                  this.i17 = this.i25 + 32;
                  this.i23 = this.i22 + 4;
                  this.i19 = this.i19 + 1;
                  this.i22 = this.i17;
                  this.i17 = this.i27;
               }
               this.i19 = 0;
               this.i20 = this.i19;
               while(this.i19 <= this.i17)
               {
                  this.i22 = li32(this.i16);
                  this.i22 = this.i22 << 2;
                  this.i22 = this.i18 + this.i22;
                  this.i22 = li32(this.i22);
                  this.i23 = li32(this.i24);
                  this.i22 = this.i22 + this.i20;
                  this.i22 = li32(this.i22);
                  this.i25 = this.i23 << 2;
                  this.i25 = this.i21 + this.i25;
                  si32(this.i22,this.i25 + 1824);
                  this.i22 = this.i23 + 1;
                  si32(this.i22,this.i24);
                  this.i20 = this.i20 + 4;
                  this.i19 = this.i19 + 1;
               }
               this.i16 = 1;
               this.i17 = li32(this.i21 + 16);
               this.i18 = this.i17 << 2;
               this.i18 = this.i21 + this.i18;
               si32(this.i16,this.i18 + 800);
               si32(this.i15,this.i18 + 1056);
               this.i15 = this.i17 + 1;
               si32(this.i15,this.i21 + 16);
               this.i14 = this.i14 + 4;
               this.i9 = this.i9 + 1;
               §§goto(addr1934);
            case 3:
               mstate.esp = mstate.esp + 28;
               this.i9 = li32(this.i6 + 108);
               this.i10 = li32(this.i6 + 100);
               this.i11 = li32(this.i6 + 92);
               this.f0 = lf64(this.i8);
               mstate.esp = mstate.esp - 28;
               this.i12 = 1;
               si32(this.i0,mstate.esp);
               sf64(this.f0,mstate.esp + 4);
               si32(this.i11,mstate.esp + 12);
               si32(this.i10,mstate.esp + 16);
               si32(this.i9,mstate.esp + 20);
               si32(this.i12,mstate.esp + 24);
               state = 4;
               mstate.esp = mstate.esp - 4;
               FSM_vorbis_encode_init_vbr.start();
               return;
            case 4:
               mstate.esp = mstate.esp + 28;
               this.i9 = this.i6 + 108;
               if(this.i2 != this.i7)
               {
                  this.i10 = 2;
                  this.i11 = li32(this.i9);
                  this.i12 = li32(this.i6 + 104);
                  this.i13 = li32(this.i6 + 96);
                  this.f0 = lf64(this.i8);
                  mstate.esp = mstate.esp - 28;
                  si32(this.i0,mstate.esp);
                  sf64(this.f0,mstate.esp + 4);
                  si32(this.i13,mstate.esp + 12);
                  si32(this.i12,mstate.esp + 16);
                  si32(this.i11,mstate.esp + 20);
                  si32(this.i10,mstate.esp + 24);
                  state = 5;
                  mstate.esp = mstate.esp - 4;
                  FSM_vorbis_encode_init_vbr.start();
                  return;
               }
               addr3757:
               this.i9 = 0;
               this.i10 = this.i5 << 5;
               this.i10 = this.i1 + this.i10;
               this.i11 = li32(this.i6 + 44);
               this.i12 = li32(this.i6 + 36);
               this.i13 = li32(this.i6 + 32);
               this.f0 = lf64(this.i10 + 3528);
               mstate.esp = mstate.esp - 28;
               si32(this.i0,mstate.esp);
               sf64(this.f0,mstate.esp + 4);
               si32(this.i9,mstate.esp + 12);
               si32(this.i13,mstate.esp + 16);
               si32(this.i12,mstate.esp + 20);
               si32(this.i11,mstate.esp + 24);
               mstate.esp = mstate.esp - 4;
               FSM_vorbis_encode_init_vbr.start();
            case 5:
               mstate.esp = mstate.esp + 28;
               this.i9 = li32(this.i9);
               this.i10 = li32(this.i6 + 104);
               this.i11 = li32(this.i6 + 96);
               this.f0 = lf64(this.i8);
               mstate.esp = mstate.esp - 28;
               this.i12 = 3;
               si32(this.i0,mstate.esp);
               sf64(this.f0,mstate.esp + 4);
               si32(this.i11,mstate.esp + 12);
               si32(this.i10,mstate.esp + 16);
               si32(this.i9,mstate.esp + 20);
               si32(this.i12,mstate.esp + 24);
               state = 6;
               mstate.esp = mstate.esp - 4;
               FSM_vorbis_encode_init_vbr.start();
               return;
            case 6:
               mstate.esp = mstate.esp + 28;
               §§goto(addr3757);
            case 7:
               mstate.esp = mstate.esp + 28;
               this.i9 = li32(this.i6 + 52);
               this.i10 = li32(this.i6 + 36);
               this.i11 = li32(this.i6 + 32);
               this.f0 = lf64(this.i1 + 3560);
               mstate.esp = mstate.esp - 28;
               this.i12 = 1;
               si32(this.i0,mstate.esp);
               sf64(this.f0,mstate.esp + 4);
               si32(this.i12,mstate.esp + 12);
               si32(this.i11,mstate.esp + 16);
               si32(this.i10,mstate.esp + 20);
               si32(this.i9,mstate.esp + 24);
               mstate.esp = mstate.esp - 4;
               FSM_vorbis_encode_init_vbr.start();
            case 8:
               mstate.esp = mstate.esp + 28;
               this.i9 = this.i6 + 52;
               this.i10 = this.i6 + 32;
               this.i11 = this.i6 + 36;
               if(this.i2 != this.i7)
               {
                  this.i12 = 2;
                  this.i9 = li32(this.i9);
                  this.i13 = li32(this.i11);
                  this.i14 = li32(this.i10);
                  this.f0 = lf64(this.i1 + 3592);
                  mstate.esp = mstate.esp - 28;
                  si32(this.i0,mstate.esp);
                  sf64(this.f0,mstate.esp + 4);
                  si32(this.i12,mstate.esp + 12);
                  si32(this.i14,mstate.esp + 16);
                  si32(this.i13,mstate.esp + 20);
                  si32(this.i9,mstate.esp + 24);
                  mstate.esp = mstate.esp - 4;
                  FSM_vorbis_encode_init_vbr.start();
               }
               addr4152:
               this.i9 = 0;
               this.i10 = this.i5 << 5;
               this.i10 = this.i1 + this.i10;
               this.i11 = li32(this.i6 + 84);
               this.i12 = li32(this.i6 + 80);
               this.f0 = lf64(this.i10 + 3552);
               mstate.esp = mstate.esp - 24;
               si32(this.i0,mstate.esp);
               sf64(this.f0,mstate.esp + 4);
               si32(this.i9,mstate.esp + 12);
               si32(this.i12,mstate.esp + 16);
               si32(this.i11,mstate.esp + 20);
               mstate.esp = mstate.esp - 4;
               FSM_vorbis_encode_init_vbr.start();
            case 9:
               mstate.esp = mstate.esp + 28;
               this.i9 = li32(this.i6 + 48);
               this.i11 = li32(this.i11);
               this.i10 = li32(this.i10);
               this.f0 = lf64(this.i1 + 3624);
               mstate.esp = mstate.esp - 28;
               this.i12 = 3;
               si32(this.i0,mstate.esp);
               sf64(this.f0,mstate.esp + 4);
               si32(this.i12,mstate.esp + 12);
               si32(this.i10,mstate.esp + 16);
               si32(this.i11,mstate.esp + 20);
               si32(this.i9,mstate.esp + 24);
               mstate.esp = mstate.esp - 4;
               FSM_vorbis_encode_init_vbr.start();
            case 10:
               mstate.esp = mstate.esp + 28;
               §§goto(addr4152);
            case 11:
               mstate.esp = mstate.esp + 24;
               this.i9 = li32(this.i6 + 84);
               this.i10 = li32(this.i6 + 80);
               this.f0 = lf64(this.i1 + 3584);
               mstate.esp = mstate.esp - 24;
               this.i11 = 1;
               si32(this.i0,mstate.esp);
               sf64(this.f0,mstate.esp + 4);
               si32(this.i11,mstate.esp + 12);
               si32(this.i10,mstate.esp + 16);
               si32(this.i9,mstate.esp + 20);
               mstate.esp = mstate.esp - 4;
               FSM_vorbis_encode_init_vbr.start();
            case 12:
               mstate.esp = mstate.esp + 24;
               this.i9 = this.i6 + 80;
               if(this.i2 != this.i7)
               {
                  this.i10 = 2;
                  this.i11 = li32(this.i6 + 88);
                  this.i12 = li32(this.i9);
                  this.f0 = lf64(this.i1 + 3616);
                  mstate.esp = mstate.esp - 24;
                  si32(this.i0,mstate.esp);
                  sf64(this.f0,mstate.esp + 4);
                  si32(this.i10,mstate.esp + 12);
                  si32(this.i12,mstate.esp + 16);
                  si32(this.i11,mstate.esp + 20);
                  mstate.esp = mstate.esp - 4;
                  FSM_vorbis_encode_init_vbr.start();
               }
               addr4485:
               this.i9 = 0;
               this.i10 = this.i5 << 5;
               this.i10 = this.i1 + this.i10;
               this.i11 = li32(this.i6 + 40);
               this.f0 = lf64(this.i10 + 3536);
               mstate.esp = mstate.esp - 20;
               si32(this.i0,mstate.esp);
               sf64(this.f0,mstate.esp + 4);
               si32(this.i9,mstate.esp + 12);
               si32(this.i11,mstate.esp + 16);
               mstate.esp = mstate.esp - 4;
               FSM_vorbis_encode_init_vbr.start();
            case 13:
               mstate.esp = mstate.esp + 24;
               this.i10 = li32(this.i6 + 88);
               this.i9 = li32(this.i9);
               this.f0 = lf64(this.i1 + 3648);
               mstate.esp = mstate.esp - 24;
               this.i11 = 3;
               si32(this.i0,mstate.esp);
               sf64(this.f0,mstate.esp + 4);
               si32(this.i11,mstate.esp + 12);
               si32(this.i9,mstate.esp + 16);
               si32(this.i10,mstate.esp + 20);
               mstate.esp = mstate.esp - 4;
               FSM_vorbis_encode_init_vbr.start();
            case 14:
               mstate.esp = mstate.esp + 24;
               §§goto(addr4485);
            case 15:
               mstate.esp = mstate.esp + 20;
               this.i9 = li32(this.i6 + 40);
               this.f0 = lf64(this.i1 + 3568);
               mstate.esp = mstate.esp - 20;
               this.i10 = 1;
               si32(this.i0,mstate.esp);
               sf64(this.f0,mstate.esp + 4);
               si32(this.i10,mstate.esp + 12);
               si32(this.i9,mstate.esp + 16);
               mstate.esp = mstate.esp - 4;
               FSM_vorbis_encode_init_vbr.start();
            case 16:
               mstate.esp = mstate.esp + 20;
               this.i9 = this.i6 + 40;
               if(this.i2 != this.i7)
               {
                  this.i10 = 2;
                  this.i11 = li32(this.i9);
                  this.f0 = lf64(this.i1 + 3600);
                  mstate.esp = mstate.esp - 20;
                  si32(this.i0,mstate.esp);
                  sf64(this.f0,mstate.esp + 4);
                  si32(this.i10,mstate.esp + 12);
                  si32(this.i11,mstate.esp + 16);
                  mstate.esp = mstate.esp - 4;
                  FSM_vorbis_encode_init_vbr.start();
               }
               addr4762:
               if(this.i3 == 0)
               {
                  this.f0 = 0;
               }
               else
               {
                  this.f0 = lf64(this.i1 + 3408);
               }
               this.i3 = 0;
               this.i5 = this.i5 << 5;
               this.i5 = this.i1 + this.i5;
               this.i9 = li32(this.i6 + 56);
               this.i10 = li32(this.i6 + 60);
               this.i11 = li32(this.i6 + 76);
               this.f1 = lf64(this.i5 + 3544);
               mstate.esp = mstate.esp - 36;
               si32(this.i0,mstate.esp);
               sf64(this.f1,mstate.esp + 4);
               si32(this.i3,mstate.esp + 12);
               si32(this.i11,mstate.esp + 16);
               si32(this.i10,mstate.esp + 20);
               si32(this.i9,mstate.esp + 24);
               sf64(this.f0,mstate.esp + 28);
               mstate.esp = mstate.esp - 4;
               FSM_vorbis_encode_init_vbr.start();
            case 17:
               mstate.esp = mstate.esp + 20;
               this.i9 = li32(this.i9);
               this.f0 = lf64(this.i1 + 3632);
               mstate.esp = mstate.esp - 20;
               this.i10 = 3;
               si32(this.i0,mstate.esp);
               sf64(this.f0,mstate.esp + 4);
               si32(this.i10,mstate.esp + 12);
               si32(this.i9,mstate.esp + 16);
               mstate.esp = mstate.esp - 4;
               FSM_vorbis_encode_init_vbr.start();
            case 18:
               mstate.esp = mstate.esp + 20;
               §§goto(addr4762);
            case 19:
               mstate.esp = mstate.esp + 36;
               this.i5 = li32(this.i6 + 56);
               this.i9 = li32(this.i6 + 64);
               this.i10 = li32(this.i6 + 76);
               this.f0 = lf64(this.i1 + 3576);
               mstate.esp = mstate.esp - 36;
               this.i11 = 1;
               si32(this.i0,mstate.esp);
               sf64(this.f0,mstate.esp + 4);
               si32(this.i11,mstate.esp + 12);
               si32(this.i10,mstate.esp + 16);
               si32(this.i9,mstate.esp + 20);
               si32(this.i5,mstate.esp + 24);
               si32(this.i3,mstate.esp + 28);
               si32(this.i3,mstate.esp + 32);
               mstate.esp = mstate.esp - 4;
               FSM_vorbis_encode_init_vbr.start();
            case 20:
               mstate.esp = mstate.esp + 36;
               this.i3 = this.i6 + 76;
               this.i5 = this.i6 + 56;
               if(this.i2 != this.i7)
               {
                  this.i9 = 0;
                  this.i10 = li32(this.i5);
                  this.i11 = li32(this.i6 + 68);
                  this.i12 = li32(this.i3);
                  this.f0 = lf64(this.i1 + 3608);
                  mstate.esp = mstate.esp - 36;
                  this.i13 = 2;
                  si32(this.i0,mstate.esp);
                  sf64(this.f0,mstate.esp + 4);
                  si32(this.i13,mstate.esp + 12);
                  si32(this.i12,mstate.esp + 16);
                  si32(this.i11,mstate.esp + 20);
                  si32(this.i10,mstate.esp + 24);
                  si32(this.i9,mstate.esp + 28);
                  si32(this.i9,mstate.esp + 32);
                  mstate.esp = mstate.esp - 4;
                  FSM_vorbis_encode_init_vbr.start();
               }
               addr5222:
               this.i3 = li32(this.i4);
               this.f0 = lf64(this.i3 + 3496);
               this.i5 = li32(this.i3 + 2852);
               this.f0 = this.f0;
               sf32(this.f0,this.i5 + 4);
               this.f0 = lf64(this.i3 + 3504);
               this.f0 = this.f0;
               sf32(this.f0,this.i5 + 8);
               this.i3 = li32(this.i4);
               this.f0 = lf64(this.i3 + 3496);
               this.i5 = li32(this.i3 + 2856);
               this.f0 = this.f0;
               sf32(this.f0,this.i5 + 4);
               this.f0 = lf64(this.i3 + 3504);
               this.f0 = this.f0;
               sf32(this.f0,this.i5 + 8);
               if(this.i2 != this.i7)
               {
                  this.i2 = li32(this.i4);
                  this.f0 = lf64(this.i2 + 3496);
                  this.i3 = li32(this.i2 + 2860);
                  this.f0 = this.f0;
                  sf32(this.f0,this.i3 + 4);
                  this.f0 = lf64(this.i2 + 3504);
                  this.f0 = this.f0;
                  sf32(this.f0,this.i3 + 8);
                  this.i2 = li32(this.i4);
                  this.f0 = lf64(this.i2 + 3496);
                  this.i3 = li32(this.i2 + 2864);
                  this.f0 = this.f0;
                  sf32(this.f0,this.i3 + 4);
                  this.f0 = lf64(this.i2 + 3504);
                  this.f0 = this.f0;
                  sf32(this.f0,this.i3 + 8);
               }
               this.i2 = FSM_vorbis_encode_init_vbr;
               this.f0 = lf64(this.i8);
               this.i3 = int(this.f0);
               this.i5 = li32(this.i6 + 152);
               this.i3 = this.i3 << 3;
               this.i6 = li32(this.i4);
               this.i3 = this.i5 + this.i3;
               this.i5 = li32(this.i3);
               this.i3 = li32(this.i3 + 4);
               this.i7 = li32(this.i6);
               this.i8 = li32(this.i6 + 4);
               this.i7 = this.i7 == this.i8?1:2;
               si32(this.i7,mstate.ebp + -9);
               this.i7 = 0;
               this.i8 = this.i0 + 4;
               this.i9 = this.i0 + 8;
               this.i10 = this.i6 + 12;
               addr7678:
               this.i11 = this.i6 + 8;
               this.i13 = this.i2;
               this.i12 = this.i5;
               this.i14 = this.i5;
               this.i15 = li32(mstate.ebp + -9);
               if(this.i7 >= this.i15)
               {
                  this.i2 = li32(this.i1 + 3428);
                  this.i3 = this.i1 + 3428;
                  if(this.i2 >= 1)
                  {
                     si32(this.i2,this.i0 + 16);
                  }
                  else
                  {
                     this.i2 = li32(this.i4);
                     this.f0 = lf64(this.i2 + 3400);
                     this.i4 = int(this.f0);
                     this.i2 = li32(this.i2 + 3396);
                     this.i2 = li32(this.i2 + 4);
                     this.f1 = Number(this.i4);
                     this.f0 = this.f0 - this.f1;
                     if(this.i2 == 0)
                     {
                        this.i2 = -1;
                     }
                     else
                     {
                        this.i4 = this.i4 << 3;
                        this.i5 = this.i4 + this.i2;
                        this.i2 = this.i2 + this.i4;
                        this.f1 = lf64(this.i5 + 8);
                        this.f2 = lf64(this.i2);
                        this.f3 = 1 - this.f0;
                        this.i2 = li32(this.i8);
                        this.f0 = this.f1 * this.f0;
                        this.f1 = this.f2 * this.f3;
                        this.f2 = Number(this.i2);
                        this.f0 = this.f1 + this.f0;
                        this.f0 = this.f0 * this.f2;
                        this.i2 = int(this.f0);
                     }
                     si32(this.i2,this.i0 + 16);
                  }
                  this.i2 = li32(this.i1 + 3424);
                  si32(this.i2,this.i0 + 20);
                  this.i2 = li32(this.i1 + 3440);
                  si32(this.i2,this.i0 + 12);
                  this.i2 = li32(this.i3);
                  this.i4 = this.i1 + 3424;
                  this.i5 = this.i1 + 3440;
                  if(this.i2 != 0)
                  {
                     this.i6 = li32(this.i1 + 3444);
                     this.f0 = Number(this.i2);
                     this.f1 = Number(this.i6);
                     this.f0 = this.f1 / this.f0;
                     this.i2 = int(this.f0);
                     si32(this.i2,this.i0 + 24);
                  }
                  else
                  {
                     this.i2 = 0;
                     si32(this.i2,this.i0 + 24);
                  }
                  this.i2 = li32(this.i1 + 3420);
                  if(this.i2 == 0)
                  {
                     this.i1 = 0;
                  }
                  else
                  {
                     this.i2 = 0;
                     this.i3 = li32(this.i3);
                     si32(this.i3,this.i1 + 3360);
                     this.i3 = li32(this.i4);
                     si32(this.i3,this.i1 + 3364);
                     this.i3 = li32(this.i5);
                     si32(this.i3,this.i1 + 3368);
                     this.i3 = li32(this.i1 + 3444);
                     si32(this.i3,this.i1 + 3372);
                     this.f0 = lf64(this.i1 + 3448);
                     sf64(this.f0,this.i1 + 3376);
                     this.f0 = lf64(this.i1 + 3432);
                     sf64(this.f0,this.i1 + 3384);
                     this.i1 = this.i2;
                  }
                  §§goto(addr8076);
               }
               else
               {
                  this.i15 = 3208;
                  mstate.esp = mstate.esp - 8;
                  this.i16 = 0;
                  si32(this.i16,mstate.esp);
                  si32(this.i15,mstate.esp + 4);
                  state = 23;
                  mstate.esp = mstate.esp - 4;
                  FSM_vorbis_encode_init_vbr.start();
                  return;
               }
            case 21:
               mstate.esp = mstate.esp + 36;
               this.i5 = li32(this.i5);
               this.i10 = li32(this.i6 + 72);
               this.i3 = li32(this.i3);
               this.f0 = lf64(this.i1 + 3640);
               mstate.esp = mstate.esp - 36;
               this.i11 = 3;
               si32(this.i0,mstate.esp);
               sf64(this.f0,mstate.esp + 4);
               si32(this.i11,mstate.esp + 12);
               si32(this.i3,mstate.esp + 16);
               si32(this.i10,mstate.esp + 20);
               si32(this.i5,mstate.esp + 24);
               si32(this.i9,mstate.esp + 28);
               si32(this.i9,mstate.esp + 32);
               mstate.esp = mstate.esp - 4;
               FSM_vorbis_encode_init_vbr.start();
            case 22:
               mstate.esp = mstate.esp + 36;
               §§goto(addr5222);
            case 23:
               this.i15 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i15 != 0)
               {
                  this.i16 = 0;
                  this.i17 = this.i15;
                  this.i18 = 3208;
                  memset(this.i17,this.i16,this.i18);
               }
               this.i16 = 16;
               si32(this.i15,this.i6 + 544);
               mstate.esp = mstate.esp - 8;
               this.i15 = 0;
               si32(this.i15,mstate.esp);
               si32(this.i16,mstate.esp + 4);
               state = 24;
               mstate.esp = mstate.esp - 4;
               FSM_vorbis_encode_init_vbr.start();
               return;
            case 24:
               this.i15 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i16 = this.i6 + 544;
               if(this.i15 != 0)
               {
                  this.i17 = 0;
                  si32(this.i17,this.i15);
                  si32(this.i17,this.i15 + 4);
                  si32(this.i17,this.i15 + 8);
                  si32(this.i17,this.i15 + 12);
               }
               si32(this.i15,this.i6 + 32);
               this.i17 = li32(this.i13);
               this.i18 = li32(this.i13 + 4);
               this.i19 = li32(this.i13 + 8);
               this.i13 = li32(this.i13 + 12);
               si32(this.i17,this.i15);
               si32(this.i18,this.i15 + 4);
               si32(this.i19,this.i15 + 8);
               si32(this.i13,this.i15 + 12);
               this.i13 = li32(this.i11);
               if(this.i13 <= this.i7)
               {
                  this.i13 = this.i7 + 1;
                  si32(this.i13,this.i11);
               }
               this.i13 = 0;
               si32(this.i13,this.i6 + 288);
               this.i13 = li32(this.i16);
               this.i15 = 3208;
               memcpy(this.i13,this.i14,this.i15);
               this.i13 = li32(this.i10);
               if(this.i13 <= this.i7)
               {
                  this.i13 = this.i7 + 1;
                  si32(this.i13,this.i10);
               }
               this.i13 = 0;
               this.i14 = this.i5 + 1092;
               addr7631:
               this.i15 = this.i14;
               this.i14 = this.i13;
               this.i16 = li32(this.i12);
               this.i13 = this.i15;
               if(this.i16 <= this.i14)
               {
                  this.i5 = this.i5 + 3208;
                  this.i2 = this.i2 + 16;
                  this.i6 = this.i6 + 4;
                  this.i7 = this.i7 + 1;
                  §§goto(addr7678);
               }
               else
               {
                  this.i16 = 2840;
                  this.i13 = li32(this.i13);
                  this.i17 = li32(this.i4);
                  mstate.esp = mstate.esp - 8;
                  this.i18 = 0;
                  si32(this.i18,mstate.esp);
                  si32(this.i16,mstate.esp + 4);
                  this.i18 = this.i13 << 2;
                  state = 25;
                  mstate.esp = mstate.esp - 4;
                  FSM_vorbis_encode_init_vbr.start();
                  return;
               }
            case 25:
               this.i19 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i18 = this.i17 + this.i18;
               this.i20 = this.i13 << 5;
               si32(this.i19,this.i18 + 1568);
               this.i18 = this.i3 + this.i20;
               this.i18 = li32(this.i18 + 12);
               memcpy(this.i19,this.i18,this.i16);
               this.i16 = li32(this.i17 + 20);
               this.i18 = this.i17 + 20;
               this.i20 = this.i19;
               this.i21 = this.i17;
               if(this.i16 <= this.i13)
               {
                  this.i16 = this.i13 + 1;
                  si32(this.i16,this.i18);
               }
               this.i16 = this.i13 << 5;
               this.i16 = this.i3 + this.i16;
               this.i18 = li32(this.i16 + 8);
               si32(this.i18,this.i19 + 8);
               this.i18 = this.i13 << 2;
               this.i18 = this.i21 + this.i18;
               this.i16 = li32(this.i16);
               si32(this.i16,this.i18 + 1312);
               this.i16 = li32(this.i21 + 3420);
               this.i18 = this.i18 + 1312;
               this.i22 = this.i21 + 3420;
               this.i23 = this.i19 + 12;
               this.i24 = this.i19 + 8;
               if(this.i16 != 0)
               {
                  this.i16 = 0;
                  this.i25 = this.i13 << 5;
                  this.i25 = this.i3 + this.i25;
                  this.i20 = this.i20 + 24;
                  this.i25 = this.i25 + 28;
                  this.i26 = this.i16;
                  while(true)
                  {
                     this.i28 = this.i20;
                     this.i20 = li32(this.i23);
                     this.i27 = this.i28;
                     if(this.i20 > this.i16)
                     {
                        this.i20 = 0;
                        this.i29 = this.i26;
                        while(this.i20 < 4)
                        {
                           this.i30 = li32(this.i25);
                           this.i30 = this.i30 + this.i29;
                           this.i30 = li32(this.i30);
                           if(this.i30 != 0)
                           {
                              this.i30 = 1;
                              this.i31 = li32(this.i27);
                              this.i30 = this.i30 << this.i20;
                              this.i30 = this.i31 | this.i30;
                              si32(this.i30,this.i27);
                           }
                           this.i29 = this.i29 + 4;
                           this.i20 = this.i20 + 1;
                        }
                        this.i20 = this.i26 + 16;
                        this.i27 = this.i28 + 4;
                        this.i16 = this.i16 + 1;
                        this.i26 = this.i20;
                        this.i20 = this.i27;
                        continue;
                     }
                     break;
                  }
                  this.i20 = 0;
                  this.i16 = this.i13 << 5;
                  this.i16 = this.i3 + this.i16;
                  this.i26 = li32(this.i16 + 20);
                  mstate.esp = mstate.esp - 8;
                  si32(this.i21,mstate.esp);
                  si32(this.i26,mstate.esp + 4);
                  mstate.esp = mstate.esp - 4;
                  FSM_vorbis_encode_init_vbr.start();
               }
               else
               {
                  this.i16 = 0;
                  this.i25 = this.i13 << 5;
                  this.i25 = this.i3 + this.i25;
                  this.i20 = this.i20 + 24;
                  this.i25 = this.i25 + 24;
                  this.i26 = this.i16;
                  while(true)
                  {
                     this.i28 = this.i26;
                     this.i27 = this.i20;
                     this.i26 = this.i16;
                     this.i16 = li32(this.i23);
                     this.i20 = this.i27;
                     if(this.i16 > this.i26)
                     {
                        this.i29 = 0;
                        this.i16 = this.i28;
                        while(this.i29 < 4)
                        {
                           this.i30 = li32(this.i25);
                           this.i30 = this.i30 + this.i16;
                           this.i30 = li32(this.i30);
                           if(this.i30 != 0)
                           {
                              this.i30 = 1;
                              this.i31 = li32(this.i20);
                              this.i30 = this.i30 << this.i29;
                              this.i30 = this.i31 | this.i30;
                              si32(this.i30,this.i20);
                           }
                           this.i16 = this.i16 + 4;
                           this.i29 = this.i29 + 1;
                        }
                        this.i16 = this.i28 + 16;
                        this.i20 = this.i27 + 4;
                        this.i27 = this.i26 + 1;
                        this.i26 = this.i16;
                        this.i16 = this.i27;
                        continue;
                     }
                     break;
                  }
                  this.i16 = 0;
                  this.i20 = this.i13 << 5;
                  this.i20 = this.i3 + this.i20;
                  this.i26 = li32(this.i20 + 16);
                  mstate.esp = mstate.esp - 8;
                  si32(this.i21,mstate.esp);
                  si32(this.i26,mstate.esp + 4);
                  mstate.esp = mstate.esp - 4;
                  FSM_vorbis_encode_init_vbr.start();
               }
               addr6975:
               this.i16 = li32(this.i9);
               this.i20 = this.i7 << 2;
               this.f0 = lf64(this.i21 + 3480);
               this.f1 = Number(this.i16);
               this.i16 = this.i21 + this.i20;
               this.i20 = li32(this.i16);
               this.f1 = this.f1 / 2;
               this.f0 = this.f0 * 1000;
               this.f0 = this.f0 > this.f1?Number(this.f1):Number(this.f0);
               this.i20 = this.i20 >> 1;
               this.f2 = Number(this.i20);
               this.f3 = this.f0 / this.f1;
               this.i16 = li32(this.i16 + 1056);
               this.f3 = this.f3 * this.f2;
               this.i23 = this.i13 << 5;
               this.i25 = int(this.f3);
               si32(this.i25,this.i16 + 1116);
               this.i16 = this.i3 + this.i23;
               this.i16 = li32(this.i16 + 4);
               if(this.i16 != 1)
               {
                  if(this.i16 == 2)
                  {
                     this.f0 = 250;
                  }
               }
               else
               {
                  this.i16 = li32(this.i22);
                  if(this.i16 != 0)
                  {
                     this.i16 = this.i21 + 2996;
                  }
                  else
                  {
                     this.i16 = this.i21 + 2968;
                  }
                  this.i16 = li32(this.i16);
                  this.f0 = Number(this.i16);
                  this.f0 = this.f0 * 1000;
                  if(this.f0 > this.f1)
                  {
                     this.f0 = this.f1;
                  }
               }
               this.i16 = li32(this.i18);
               if(this.i16 == 2)
               {
                  this.i16 = 0;
                  this.i18 = li32(this.i21 + 12);
                  this.i17 = this.i17 + 544;
                  this.i21 = this.i16;
                  while(true)
                  {
                     this.i22 = this.i17;
                     this.i17 = this.i22;
                     if(this.i18 > this.i21)
                     {
                        if(this.i16 != 0)
                        {
                           break;
                        }
                        this.i23 = 0;
                        this.i17 = li32(this.i17);
                        this.i25 = li32(this.i17);
                        this.i26 = this.i17 + 1092;
                        while(true)
                        {
                           this.i27 = this.i23;
                           this.i23 = this.i26;
                           if(this.i25 > this.i27)
                           {
                              if(this.i16 != 0)
                              {
                                 break;
                              }
                              this.i23 = li32(this.i23);
                              if(this.i23 == this.i13)
                              {
                                 this.i23 = 0;
                                 this.i28 = li32(this.i8);
                                 this.i29 = this.i17 + 4;
                                 while(true)
                                 {
                                    this.i30 = this.i23;
                                    this.i23 = this.i16;
                                    this.i16 = this.i29;
                                    if(this.i28 <= this.i30)
                                    {
                                       break;
                                    }
                                    this.i16 = li32(this.i16);
                                    this.i16 = this.i16 == this.i27?1:0;
                                    this.i16 = this.i16 & 1;
                                    this.i29 = this.i29 + 4;
                                    this.i30 = this.i30 + 1;
                                    this.i16 = this.i23 + this.i16;
                                    this.i23 = this.i30;
                                 }
                                 this.i16 = this.i23;
                              }
                              this.i23 = this.i26 + 4;
                              this.i27 = this.i27 + 1;
                              this.i26 = this.i23;
                              this.i23 = this.i27;
                              continue;
                           }
                           break;
                        }
                        this.i17 = this.i22 + 4;
                        this.i21 = this.i21 + 1;
                        continue;
                     }
                     break;
                  }
                  this.f0 = this.f0 / this.f1;
                  this.i13 = li32(this.i24);
                  this.f1 = Number(this.i16);
                  this.f0 = this.f0 * this.f2;
                  this.f2 = Number(this.i13);
                  this.f0 = this.f0 * this.f1;
                  this.f0 = this.f0 / this.f2;
                  this.f0 = this.f0 + 0.9;
                  this.i24 = int(this.f0);
                  this.i20 = this.i20 * this.i16;
                  this.i16 = this.i19 + 4;
                  this.i24 = this.i24 * this.i13;
                  if(this.i24 <= this.i20)
                  {
                     this.i20 = this.i24;
                  }
                  else
                  {
                     this.i20 = this.i20 / this.i13;
                     this.i20 = this.i20 * this.i13;
                  }
                  si32(this.i20,this.i16);
               }
               else
               {
                  this.i13 = li32(this.i24);
                  this.f0 = this.f0 / this.f1;
                  this.f1 = Number(this.i13);
                  this.f0 = this.f0 * this.f2;
                  this.f0 = this.f0 / this.f1;
                  this.f0 = this.f0 + 0.9;
                  this.i16 = int(this.f0);
                  this.i17 = this.i19 + 4;
                  this.i16 = this.i16 * this.i13;
                  if(this.i16 <= this.i20)
                  {
                     this.i20 = this.i16;
                  }
                  else
                  {
                     this.i20 = this.i20 / this.i13;
                     this.i20 = this.i20 * this.i13;
                  }
                  this.i16 = this.i20;
                  si32(this.i16,this.i17);
               }
               this.i16 = li32(this.i19 + 4);
               this.i17 = this.i19 + 4;
               if(this.i16 == 0)
               {
                  si32(this.i13,this.i17);
               }
               this.i13 = this.i15 + 4;
               this.i15 = this.i14 + 1;
               this.i14 = this.i13;
               this.i13 = this.i15;
               §§goto(addr7631);
            case 26:
               this.i26 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               si32(this.i26,this.i19 + 20);
               this.i26 = this.i26 << 2;
               this.i16 = li32(this.i16 + 20);
               this.i26 = this.i21 + this.i26;
               si32(this.i16,this.i26 + 1824);
               this.i16 = this.i20;
               this.i26 = this.i20;
               while(true)
               {
                  this.i28 = this.i26;
                  this.i27 = this.i20;
                  this.i20 = li32(this.i23);
                  if(this.i20 > this.i28)
                  {
                     this.i26 = 0;
                     this.i20 = this.i16;
                     loop20:
                     while(this.i26 < 4)
                     {
                        this.i29 = li32(this.i25);
                        this.i29 = this.i29 + this.i20;
                        this.i29 = li32(this.i29);
                        if(this.i29 != 0)
                        {
                           mstate.esp = mstate.esp - 8;
                           si32(this.i21,mstate.esp);
                           si32(this.i29,mstate.esp + 4);
                           mstate.esp = mstate.esp - 4;
                           FSM_vorbis_encode_init_vbr.start();
                        }
                        while(true)
                        {
                           this.i20 = this.i20 + 4;
                           this.i26 = this.i26 + 1;
                           continue loop20;
                        }
                     }
                     this.i20 = this.i16 + 16;
                     this.i26 = this.i28 + 1;
                     this.i16 = this.i20;
                     this.i20 = this.i27;
                     continue;
                  }
                  break;
               }
               §§goto(addr6975);
            case 27:
               while(true)
               {
                  this.i29 = mstate.eax;
                  this.i30 = this.i27 << 2;
                  mstate.esp = mstate.esp + 8;
                  this.i30 = this.i19 + this.i30;
                  si32(this.i29,this.i30 + 280);
                  this.i30 = li32(this.i25);
                  this.i30 = this.i30 + this.i20;
                  this.i30 = li32(this.i30);
                  this.i29 = this.i29 << 2;
                  this.i29 = this.i21 + this.i29;
                  si32(this.i30,this.i29 + 1824);
                  this.i27 = this.i27 + 1;
                  §§goto(addr6448);
               }
            case 28:
               this.i26 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               si32(this.i26,this.i19 + 20);
               this.i26 = this.i26 << 2;
               this.i20 = li32(this.i20 + 16);
               this.i26 = this.i21 + this.i26;
               si32(this.i20,this.i26 + 1824);
               this.i20 = this.i16;
               this.i26 = this.i16;
               while(true)
               {
                  this.i28 = this.i20;
                  this.i20 = this.i26;
                  this.i27 = this.i16;
                  this.i16 = li32(this.i23);
                  if(this.i16 > this.i20)
                  {
                     this.i26 = 0;
                     this.i16 = this.i28;
                     loop24:
                     while(this.i26 < 4)
                     {
                        this.i29 = li32(this.i25);
                        this.i29 = this.i29 + this.i16;
                        this.i29 = li32(this.i29);
                        if(this.i29 != 0)
                        {
                           mstate.esp = mstate.esp - 8;
                           si32(this.i21,mstate.esp);
                           si32(this.i29,mstate.esp + 4);
                           mstate.esp = mstate.esp - 4;
                           FSM_vorbis_encode_init_vbr.start();
                        }
                        while(true)
                        {
                           this.i16 = this.i16 + 4;
                           this.i26 = this.i26 + 1;
                           continue loop24;
                        }
                     }
                     this.i16 = this.i28 + 16;
                     this.i26 = this.i20 + 1;
                     this.i20 = this.i16;
                     this.i16 = this.i27;
                     continue;
                  }
                  §§goto(addr6975);
               }
            case 29:
               while(true)
               {
                  this.i29 = mstate.eax;
                  this.i30 = this.i27 << 2;
                  mstate.esp = mstate.esp + 8;
                  this.i30 = this.i19 + this.i30;
                  si32(this.i29,this.i30 + 280);
                  this.i30 = li32(this.i25);
                  this.i30 = this.i30 + this.i16;
                  this.i30 = li32(this.i30);
                  this.i29 = this.i29 << 2;
                  this.i29 = this.i21 + this.i29;
                  si32(this.i30,this.i29 + 1824);
                  this.i27 = this.i27 + 1;
                  §§goto(addr6905);
               }
         }
         mstate.eax = this.i1;
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
