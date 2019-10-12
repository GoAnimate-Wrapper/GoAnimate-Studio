package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.lf32;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.sf32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_vorbis_analysis_blockout extends Machine
   {
      
      public static const intRegCount:int = 32;
      
      public static const NumberRegCount:int = 8;
       
      
      public var i21:int;
      
      public var i30:int;
      
      public var i31:int;
      
      public var f0:Number;
      
      public var f1:Number;
      
      public var f3:Number;
      
      public var f5:Number;
      
      public var f7:Number;
      
      public var f2:Number;
      
      public var f4:Number;
      
      public var f6:Number;
      
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
      
      public function FSM_vorbis_analysis_blockout()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_vorbis_analysis_blockout = null;
         _loc1_ = new FSM_vorbis_analysis_blockout();
         FSM_vorbis_analysis_blockout.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 252;
               this.i0 = li32(mstate.ebp + 8);
               si32(this.i0,mstate.ebp + -189);
               this.i0 = li32(this.i0 + 40);
               this.i1 = li32(mstate.ebp + -189);
               this.i1 = li32(this.i1 + 4);
               si32(this.i1,mstate.ebp + -90);
               this.i1 = li32(this.i1 + 28);
               si32(this.i1,mstate.ebp + -234);
               this.i0 = this.i0 << 2;
               this.i0 = this.i1 + this.i0;
               this.i0 = li32(this.i0);
               this.i1 = this.i0 >>> 31;
               this.i0 = this.i0 + this.i1;
               this.i1 = li32(mstate.ebp + 12);
               si32(this.i1,mstate.ebp + -171);
               this.i1 = li32(mstate.ebp + -189);
               this.i1 = li32(this.i1 + 104);
               si32(this.i1,mstate.ebp + -72);
               this.i1 = li32(this.i1 + 60);
               si32(this.i1,mstate.ebp + -54);
               this.i1 = li32(mstate.ebp + -189);
               this.i1 = li32(this.i1 + 48);
               this.i0 = this.i0 >> 1;
               this.i2 = li32(mstate.ebp + -171);
               this.i2 = li32(this.i2 + 104);
               si32(this.i2,mstate.ebp + -126);
               this.i2 = li32(mstate.ebp + -189);
               this.i2 = li32(this.i2 + 28);
               this.i0 = this.i1 - this.i0;
               si32(this.i0,mstate.ebp + -180);
               this.i0 = li32(mstate.ebp + -189);
               this.i0 = this.i0 + 40;
               si32(this.i0,mstate.ebp + -117);
               this.i0 = li32(mstate.ebp + -189);
               this.i0 = this.i0 + 48;
               si32(this.i0,mstate.ebp + -99);
               this.i0 = li32(mstate.ebp + -189);
               this.i0 = this.i0 + 104;
               si32(this.i0,mstate.ebp + -18);
               this.i0 = li32(mstate.ebp + -189);
               this.i0 = this.i0 + 4;
               si32(this.i0,mstate.ebp + -45);
               this.i0 = li32(mstate.ebp + -126);
               si32(this.i0,mstate.ebp + -36);
               this.i0 = li32(mstate.ebp + -234);
               si32(this.i0,mstate.ebp + -135);
               this.i0 = li32(mstate.ebp + -234);
               si32(this.i0,mstate.ebp + -81);
               if(this.i2 != 0)
               {
                  this.i0 = li32(mstate.ebp + -189);
                  this.i0 = li32(this.i0 + 32);
                  this.i1 = li32(mstate.ebp + -189);
                  this.i1 = this.i1 + 32;
                  si32(this.i1,mstate.ebp + -108);
                  if(this.i0 != -1)
                  {
                     this.i0 = mstate.esp;
                     si32(this.i0,mstate.ebp + -27);
                     this.i0 = li32(mstate.ebp + -72);
                     this.i0 = li32(this.i0);
                     this.i1 = li32(this.i0 + 168);
                     this.i2 = li32(this.i0 + 8);
                     this.i3 = li32(mstate.ebp + -189);
                     this.i3 = li32(this.i3 + 20);
                     this.i3 = this.i3 / this.i2;
                     this.i4 = li32(this.i0 + 164);
                     this.i1 = this.i1 / this.i2;
                     this.i1 = this.i1 < 0?0:int(this.i1);
                     si32(this.i1,mstate.ebp + -243);
                     this.i1 = this.i0 + 164;
                     this.i2 = this.i3 + 2;
                     this.i3 = this.i3 + -4;
                     si32(this.i3,mstate.ebp + -153);
                     this.i3 = li32(mstate.ebp + -189);
                     this.i3 = this.i3 + 20;
                     si32(this.i3,mstate.ebp + -144);
                     this.i3 = this.i0 + 8;
                     si32(this.i3,mstate.ebp + -252);
                     this.i3 = this.i0 + 168;
                     si32(this.i3,mstate.ebp + -63);
                     this.i3 = this.i0;
                     si32(this.i3,mstate.ebp + -162);
                     if(this.i2 > this.i4)
                     {
                        si32(this.i2,this.i1);
                        this.i1 = li32(mstate.ebp + -162);
                        this.i1 = li32(this.i1 + 160);
                        mstate.esp = mstate.esp - 8;
                        this.i2 = this.i2 << 2;
                        si32(this.i1,mstate.esp);
                        si32(this.i2,mstate.esp + 4);
                        state = 1;
                        mstate.esp = mstate.esp - 4;
                        FSM_vorbis_analysis_blockout.start();
                        return;
                     }
                     addr669:
                     this.i2 = li32(mstate.ebp + -135);
                     this.i2 = this.i2 + 2928;
                     this.i3 = li32(mstate.ebp + -243);
                     this.i3 = this.i3 << 2;
                     si32(this.i3,mstate.ebp + -198);
                     this.i3 = 0;
                     this.i4 = li32(mstate.ebp + -162);
                     this.i4 = this.i4 + 160;
                     si32(this.i4,mstate.ebp + -216);
                     this.i4 = li32(mstate.ebp + -162);
                     this.i4 = this.i4 + 16;
                     this.i5 = li32(mstate.ebp + -162);
                     this.i5 = this.i5 + 36;
                     this.i6 = li32(mstate.ebp + -162);
                     this.i6 = this.i6 + 12;
                     this.i7 = li32(mstate.ebp + -162);
                     this.i7 = this.i7 + 4;
                     this.i8 = li32(mstate.ebp + -162);
                     this.i8 = this.i8 + 152;
                     this.i9 = li32(mstate.ebp + -189);
                     this.i9 = this.i9 + 8;
                     si32(this.i9,mstate.ebp + -225);
                     this.i9 = li32(mstate.ebp + -162);
                     this.i9 = this.i9 + 156;
                     this.i10 = li32(mstate.ebp + -162);
                     this.i11 = li32(mstate.ebp + -243);
                     while(true)
                     {
                        si32(this.i11,mstate.ebp + -207);
                        this.i12 = li32(mstate.ebp + -153);
                        if(this.i11 >= this.i12)
                        {
                           break;
                        }
                        addr2683:
                        this.i11 = 0;
                        this.i12 = li32(this.i9);
                        this.i12 = this.i12 + 1;
                        this.i12 = this.i12 > 24?24:int(this.i12);
                        si32(this.i12,this.i9);
                        this.i12 = this.i11;
                        this.i13 = this.i11;
                        this.i14 = this.i11;
                        this.i15 = this.i11;
                        while(true)
                        {
                           this.i16 = this.i12;
                           this.i17 = this.i13;
                           this.i13 = this.i14;
                           this.i14 = this.i15;
                           this.i12 = this.i1;
                           this.i1 = this.i11;
                           this.i11 = li32(this.i10);
                           if(this.i11 <= this.i14)
                           {
                              break;
                           }
                           this.i11 = li32(mstate.ebp + -225);
                           this.i11 = li32(this.i11);
                           this.i11 = this.i11 + this.i13;
                           this.i11 = li32(this.i11);
                           this.i15 = li32(mstate.ebp + -252);
                           this.i15 = li32(this.i15);
                           this.i18 = li32(this.i8);
                           this.i19 = mstate.esp;
                           this.i20 = li32(this.i7);
                           this.f0 = lf32(this.i6);
                           this.i21 = mstate.esp;
                           this.i22 = this.i20 << 2;
                           this.i21 = this.i21 - this.i22;
                           mstate.esp = this.i21;
                           this.i22 = li32(this.i9);
                           this.i23 = this.i21;
                           this.i24 = this.i18;
                           if(this.i22 <= 5)
                           {
                              this.i25 = 2;
                           }
                           else
                           {
                              this.i25 = this.i22 >>> 31;
                              this.i25 = this.i22 + this.i25;
                              this.i25 = this.i25 >> 1;
                           }
                           this.f1 = 0;
                           this.i26 = this.i22 >>> 31;
                           this.i22 = this.i22 + this.i26;
                           this.i22 = this.i22 >> 1;
                           this.i22 = this.i22 + -2;
                           this.f2 = Number(this.i22);
                           this.f3 = lf32(this.i2);
                           this.f2 = this.f2;
                           this.f2 = this.f3 - this.f2;
                           this.f2 = this.f2;
                           this.f1 = this.f1;
                           this.f1 = this.f1;
                           this.f2 = this.f2;
                           this.f1 = this.f2 < this.f1?Number(this.f1):Number(this.f2);
                           this.f1 = this.f1;
                           this.i22 = li32(mstate.ebp + -243);
                           this.i22 = this.i22 << 2;
                           this.f1 = this.f1;
                           this.i22 = this.i3 + this.i22;
                           this.f1 = this.f3 < this.f1?Number(this.f3):Number(this.f1);
                           this.i15 = this.i15 * this.i22;
                           this.f1 = this.f1;
                           this.i22 = 0;
                           this.i11 = this.i11 + this.i15;
                           this.i15 = this.i22;
                           while(this.i22 < this.i20)
                           {
                              this.i26 = li32(this.i5);
                              this.i26 = this.i26 + this.i15;
                              this.i27 = this.i11 + this.i15;
                              this.f2 = lf32(this.i27);
                              this.f3 = lf32(this.i26);
                              this.f2 = this.f2 * this.f3;
                              this.f2 = this.f2;
                              this.i26 = this.i23 + this.i15;
                              sf32(this.f2,this.i26);
                              this.i15 = this.i15 + 4;
                              this.i22 = this.i22 + 1;
                           }
                           mstate.esp = mstate.esp - 12;
                           si32(this.i4,mstate.esp);
                           si32(this.i21,mstate.esp + 4);
                           si32(this.i21,mstate.esp + 8);
                           mstate.esp = mstate.esp - 4;
                           FSM_vorbis_analysis_blockout.start();
                        }
                        this.i11 = 0;
                        this.i13 = li32(mstate.ebp + -216);
                        this.i13 = li32(this.i13);
                        this.i14 = li32(mstate.ebp + -198);
                        this.i14 = this.i14 + this.i3;
                        this.i13 = this.i13 + this.i14;
                        si32(this.i11,this.i13 + 8);
                        this.i11 = this.i1 & 1;
                        if(this.i11 != 0)
                        {
                           this.i11 = 1;
                           this.i13 = li32(mstate.ebp + -216);
                           this.i13 = li32(this.i13);
                           this.i14 = li32(mstate.ebp + -198);
                           this.i14 = this.i14 + this.i3;
                           this.i13 = this.i13 + this.i14;
                           si32(this.i11,this.i13);
                           this.i13 = li32(mstate.ebp + -216);
                           this.i13 = li32(this.i13);
                           this.i13 = this.i13 + this.i14;
                           si32(this.i11,this.i13 + 4);
                        }
                        this.i11 = this.i1 & 2;
                        if(this.i11 != 0)
                        {
                           this.i11 = 1;
                           this.i13 = li32(mstate.ebp + -216);
                           this.i13 = li32(this.i13);
                           this.i14 = li32(mstate.ebp + -198);
                           this.i14 = this.i14 + this.i3;
                           this.i13 = this.i13 + this.i14;
                           si32(this.i11,this.i13);
                           this.i11 = li32(mstate.ebp + -207);
                           if(this.i11 >= 1)
                           {
                              this.i11 = 1;
                              this.i13 = li32(mstate.ebp + -216);
                              this.i13 = li32(this.i13);
                              this.i14 = li32(mstate.ebp + -198);
                              this.i14 = this.i14 + this.i3;
                              this.i13 = this.i13 + this.i14;
                              si32(this.i11,this.i13 + -4);
                           }
                        }
                        this.i1 = this.i1 & 4;
                        if(this.i1 != 0)
                        {
                           this.i1 = -1;
                           si32(this.i1,this.i9);
                        }
                        this.i1 = this.i3 + 4;
                        this.i3 = li32(mstate.ebp + -207);
                        this.i11 = this.i3 + 1;
                        this.i3 = this.i1;
                        this.i1 = this.i12;
                     }
                     this.i0 = li32(mstate.ebp + -252);
                     this.i0 = li32(this.i0);
                     this.i1 = li32(mstate.ebp + -153);
                     this.i1 = this.i0 * this.i1;
                     this.i2 = li32(mstate.ebp + -63);
                     si32(this.i1,this.i2);
                     this.i2 = li32(mstate.ebp + -117);
                     this.i2 = li32(this.i2);
                     this.i2 = this.i2 << 2;
                     this.i3 = li32(mstate.ebp + -135);
                     this.i2 = this.i3 + this.i2;
                     this.i2 = li32(this.i2);
                     this.i3 = this.i2 >> 31;
                     this.i4 = li32(mstate.ebp + -135);
                     this.i4 = li32(this.i4 + 4);
                     this.i5 = li32(mstate.ebp + -81);
                     this.i5 = li32(this.i5);
                     this.i3 = this.i3 >>> 30;
                     this.i2 = this.i2 + this.i3;
                     this.i3 = this.i4 >>> 31;
                     this.i6 = this.i5 >> 31;
                     this.i3 = this.i4 + this.i3;
                     this.i4 = this.i6 >>> 30;
                     this.i6 = li32(mstate.ebp + -99);
                     this.i6 = li32(this.i6);
                     this.i2 = this.i2 >> 2;
                     this.i4 = this.i5 + this.i4;
                     this.i3 = this.i3 >> 1;
                     this.i2 = this.i2 + this.i6;
                     this.i5 = li32(mstate.ebp + -162);
                     this.i5 = li32(this.i5 + 176);
                     this.i4 = this.i4 >> 2;
                     this.i2 = this.i2 + this.i3;
                     this.i3 = li32(mstate.ebp + -162);
                     this.i3 = this.i3 + 176;
                     this.i2 = this.i2 + this.i4;
                     this.i4 = li32(mstate.ebp + -135);
                     this.i4 = this.i4 + 4;
                     this.i7 = li32(mstate.ebp + -81);
                     while(true)
                     {
                        this.i8 = this.i1 - this.i0;
                        if(this.i8 <= this.i5)
                        {
                           this.i0 = -1;
                           break;
                        }
                        if(this.i5 < this.i2)
                        {
                           this.i8 = this.i5 / this.i0;
                           si32(this.i5,this.i3);
                           this.i9 = li32(mstate.ebp + -216);
                           this.i9 = li32(this.i9);
                           this.i8 = this.i8 << 2;
                           this.i8 = this.i9 + this.i8;
                           this.i8 = li32(this.i8);
                           if(this.i5 > this.i6)
                           {
                              if(this.i8 != 0)
                              {
                                 this.i0 = li32(mstate.ebp + -162);
                                 si32(this.i5,this.i0 + 172);
                                 if(this.i5 < this.i2)
                                 {
                                    this.i0 = 0;
                                    break;
                                 }
                              }
                           }
                           this.i5 = this.i0 + this.i5;
                           continue;
                        }
                        this.i0 = 1;
                        break;
                     }
                     this.i1 = li32(mstate.ebp + -27);
                     mstate.esp = this.i1;
                     if(this.i0 == -1)
                     {
                        this.i0 = li32(mstate.ebp + -108);
                        this.i0 = li32(this.i0);
                        if(this.i0 != 0)
                        {
                           this.i0 = 0;
                           this.i7 = li32(mstate.ebp + -189);
                           si32(this.i0,this.i7 + 44);
                        }
                     }
                     else
                     {
                        this.i1 = li32(this.i7);
                        this.i2 = li32(this.i4);
                        this.i3 = li32(mstate.ebp + -189);
                        this.i3 = this.i3 + 44;
                        if(this.i1 == this.i2)
                        {
                           this.i0 = 0;
                           si32(this.i0,this.i3);
                        }
                        else
                        {
                           si32(this.i0,this.i3);
                        }
                     }
                     this.i0 = li32(mstate.ebp + -117);
                     this.i0 = li32(this.i0);
                     this.i1 = li32(mstate.ebp + -189);
                     this.i1 = li32(this.i1 + 44);
                     this.i0 = this.i0 << 2;
                     this.i1 = this.i1 << 2;
                     this.i2 = li32(mstate.ebp + -135);
                     this.i0 = this.i2 + this.i0;
                     this.i0 = li32(this.i0);
                     this.i1 = this.i2 + this.i1;
                     this.i1 = li32(this.i1);
                     this.i2 = this.i0 >> 31;
                     this.i2 = this.i2 >>> 30;
                     this.i3 = this.i1 >> 31;
                     this.i0 = this.i0 + this.i2;
                     this.i2 = this.i3 >>> 30;
                     this.i2 = this.i1 + this.i2;
                     this.i3 = li32(mstate.ebp + -99);
                     this.i3 = li32(this.i3);
                     this.i0 = this.i0 >> 2;
                     this.i5 = li32(mstate.ebp + -144);
                     this.i5 = li32(this.i5);
                     this.i6 = this.i1 >>> 31;
                     this.i2 = this.i2 >> 2;
                     this.i0 = this.i3 + this.i0;
                     this.i1 = this.i1 + this.i6;
                     this.i0 = this.i0 + this.i2;
                     this.i2 = li32(mstate.ebp + -189);
                     this.i2 = this.i2 + 44;
                     this.i1 = this.i1 >> 1;
                     this.i1 = this.i1 + this.i0;
                     if(this.i5 >= this.i1)
                     {
                        mstate.esp = mstate.esp - 4;
                        this.i1 = li32(mstate.ebp + -171);
                        si32(this.i1,mstate.esp);
                        state = 3;
                        mstate.esp = mstate.esp - 4;
                        FSM_vorbis_analysis_blockout.start();
                        return;
                     }
                  }
               }
               this.i0 = 0;
               addr367:
               mstate.eax = this.i0;
               break;
            case 1:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = li32(mstate.ebp + -162);
               si32(this.i1,this.i2 + 160);
               §§goto(addr669);
            case 2:
               while(true)
               {
                  mstate.esp = mstate.esp + 12;
                  this.f2 = lf32(this.i21);
                  this.f3 = lf32(this.i21 + 4);
                  this.f2 = this.f2 * this.f2;
                  this.f4 = lf32(this.i21 + 8);
                  this.f2 = this.f2;
                  this.f5 = this.f3 * 0.7;
                  this.f6 = this.f4 * 0.2;
                  this.f3 = this.f5 * this.f3;
                  this.f2 = this.f2;
                  this.i11 = this.i18 + this.i16;
                  this.f4 = this.f6 * this.f4;
                  this.f2 = this.f2 + this.f3;
                  this.i15 = li32(this.i11 + 140);
                  this.f2 = this.f2 + this.f4;
                  this.i11 = this.i11 + 140;
                  this.f2 = this.f2;
                  if(this.i15 == 0)
                  {
                     this.i22 = this.i18 + this.i16;
                     this.f3 = lf32(this.i22 + 136);
                     this.f4 = this.f2;
                     this.f3 = this.f3 + this.f4;
                     this.f3 = this.f3;
                     sf32(this.f3,this.i22 + 132);
                     sf32(this.f2,this.i22 + 136);
                  }
                  else
                  {
                     this.i22 = this.i18 + this.i16;
                     this.f3 = lf32(this.i22 + 132);
                     this.f4 = this.f2;
                     this.f3 = this.f3 + this.f4;
                     this.f3 = this.f3;
                     sf32(this.f3,this.i22 + 132);
                     this.f5 = lf32(this.i22 + 136);
                     this.f4 = this.f5 + this.f4;
                     this.f4 = this.f4;
                     sf32(this.f4,this.i22 + 136);
                  }
                  this.f4 = 0.0625;
                  this.f4 = this.f4;
                  this.f4 = this.f4;
                  this.f3 = this.f3;
                  this.f3 = this.f3 * this.f4;
                  this.f3 = this.f3;
                  sf32(this.f3,mstate.ebp + -4);
                  this.i22 = li32(mstate.ebp + -4);
                  this.f3 = 7.17711e-7;
                  this.i22 = this.i22 & 2147483647;
                  this.f3 = this.f3;
                  this.f4 = Number(uint(this.i22));
                  this.f3 = this.f3;
                  this.f4 = this.f4;
                  this.f3 = this.f4 * this.f3;
                  this.f4 = -764.616;
                  this.f3 = this.f3;
                  this.f4 = this.f4;
                  this.i22 = this.i15 << 2;
                  this.i26 = this.i18 + this.i16;
                  this.f4 = this.f4;
                  this.f3 = this.f3;
                  this.i22 = this.i26 + this.i22;
                  this.f3 = this.f3 + this.f4;
                  this.f4 = lf32(this.i26 + 132);
                  this.f5 = lf32(this.i22 + 72);
                  this.f4 = this.f4 - this.f5;
                  this.f3 = this.f3;
                  this.f3 = this.f3;
                  this.f4 = this.f4;
                  this.i27 = this.i20 >>> 31;
                  this.f3 = this.f3 * 0.5;
                  this.i15 = this.i15 + 1;
                  sf32(this.f4,this.i26 + 132);
                  this.f3 = this.f3 + -15;
                  this.i20 = this.i20 + this.i27;
                  sf32(this.f2,this.i22 + 72);
                  this.i15 = this.i15 > 14?0:int(this.i15);
                  si32(this.i15,this.i11);
                  this.i11 = this.i20 >> 1;
                  this.f2 = this.f3;
                  this.i15 = 0;
                  this.i20 = this.i23;
                  while(true)
                  {
                     this.i22 = this.i12;
                     this.i12 = this.i20;
                     if(this.i11 <= this.i15)
                     {
                        break;
                     }
                     this.f3 = 7.17711e-7;
                     this.f4 = lf32(this.i12);
                     this.f5 = lf32(this.i20 + 4);
                     this.f4 = this.f4 * this.f4;
                     this.f5 = this.f5 * this.f5;
                     this.f4 = this.f4;
                     this.f5 = this.f5;
                     this.f5 = this.f5;
                     this.f4 = this.f4;
                     this.f4 = this.f4 + this.f5;
                     this.f4 = this.f4;
                     sf32(this.f4,mstate.ebp + -8);
                     this.i12 = li32(mstate.ebp + -8);
                     this.i12 = this.i12 & 2147483647;
                     this.f3 = this.f3;
                     this.f4 = Number(uint(this.i12));
                     this.f3 = this.f3;
                     this.f4 = this.f4;
                     this.f3 = this.f4 * this.f3;
                     this.f4 = -764.616;
                     this.f3 = this.f3;
                     this.f4 = this.f4;
                     this.f4 = this.f4;
                     this.f3 = this.f3;
                     this.f3 = this.f3 + this.f4;
                     this.f4 = 0.5;
                     this.f3 = this.f3;
                     this.f4 = this.f4;
                     this.f4 = this.f4;
                     this.f3 = this.f3;
                     this.f3 = this.f3 * this.f4;
                     this.f3 = this.f3;
                     this.f3 = this.f3;
                     this.f2 = this.f2;
                     this.f3 = this.f3 < this.f2?Number(this.f2):Number(this.f3);
                     this.f3 = this.f3;
                     this.f4 = -8;
                     this.f4 = this.f4;
                     this.i22 = this.i15 & 2147483646;
                     this.f5 = this.f0;
                     this.f3 = this.f3;
                     this.f3 = this.f3 < this.f5?Number(this.f5):Number(this.f3);
                     this.f4 = this.f4;
                     this.i22 = this.i22 << 1;
                     this.f2 = this.f2 + this.f4;
                     this.f3 = this.f3;
                     this.i22 = this.i21 + this.i22;
                     sf32(this.f3,this.i22);
                     this.f2 = this.f2;
                     this.i20 = this.i20 + 8;
                     this.i15 = this.i15 + 2;
                  }
                  this.i11 = 0;
                  this.i12 = this.i18 + this.i16;
                  this.i15 = this.i0;
                  this.i18 = li32(mstate.ebp + -234);
                  this.i20 = this.i11;
                  while(true)
                  {
                     this.i26 = this.i12;
                     this.i23 = this.i15;
                     this.i15 = this.i18;
                     this.i12 = this.i20;
                     if(this.i12 >= 7)
                     {
                        break;
                     }
                     this.f0 = 0;
                     this.i18 = li32(this.i23 + 44);
                     this.f0 = this.f0;
                     this.i20 = 0;
                     this.i27 = this.i23 + 48;
                     this.i28 = this.i23 + 40;
                     this.i29 = this.i20;
                     while(this.i18 > this.i20)
                     {
                        this.i30 = li32(this.i28);
                        this.i30 = this.i30 + this.i20;
                        this.i31 = li32(this.i27);
                        this.i30 = this.i30 << 2;
                        this.i31 = this.i31 + this.i29;
                        this.i30 = this.i21 + this.i30;
                        this.f2 = lf32(this.i30);
                        this.f3 = lf32(this.i31);
                        this.f2 = this.f2 * this.f3;
                        this.f2 = this.f2;
                        this.f0 = this.f0;
                        this.f2 = this.f2;
                        this.f0 = this.f2 + this.f0;
                        this.f0 = this.f0;
                        this.i29 = this.i29 + 4;
                        this.i20 = this.i20 + 1;
                     }
                     this.f2 = -99999;
                     this.i18 = li32(this.i26 + 68);
                     this.i20 = this.i18 + 16;
                     this.i27 = this.i18 + -1;
                     this.i20 = this.i27 < 0?int(this.i20):int(this.i27);
                     this.f3 = lf32(this.i23 + 52);
                     this.f0 = this.f0;
                     this.f0 = this.f3 * this.f0;
                     this.i27 = this.i20 << 2;
                     this.f0 = this.f0;
                     this.i27 = this.i26 + this.i27;
                     this.f3 = lf32(this.i27);
                     this.f4 = this.f0;
                     this.f5 = this.f3 > this.f4?Number(this.f3):Number(this.f4);
                     this.f3 = this.f3 < this.f4?Number(this.f3):Number(this.f4);
                     this.f4 = 99999;
                     this.f5 = this.f5;
                     this.f3 = this.f3;
                     this.f2 = this.f2;
                     this.f4 = this.f4;
                     this.i27 = 0;
                     this.i28 = this.i26 + 68;
                     while(this.i27 < this.i25)
                     {
                        this.i29 = this.i17 + this.i12;
                        this.i30 = this.i20 + 16;
                        this.i20 = this.i20 + -1;
                        this.i20 = this.i20 < 0?int(this.i30):int(this.i20);
                        this.i29 = this.i29 * 144;
                        this.i30 = this.i20 << 2;
                        this.i29 = this.i24 + this.i29;
                        this.i29 = this.i29 + this.i30;
                        this.f6 = lf32(this.i29);
                        this.f2 = this.f2;
                        this.f4 = this.f4;
                        this.f2 = this.f6 > this.f2?Number(this.f6):Number(this.f2);
                        this.f4 = this.f6 < this.f4?Number(this.f6):Number(this.f4);
                        this.f2 = this.f2;
                        this.f4 = this.f4;
                        this.i27 = this.i27 + 1;
                     }
                     this.i20 = this.i18 << 2;
                     this.i18 = this.i18 + 1;
                     this.i20 = this.i26 + this.i20;
                     sf32(this.f0,this.i20);
                     this.i18 = this.i18 > 16?0:int(this.i18);
                     si32(this.i18,this.i28);
                     this.f0 = lf32(this.i15 + 2872);
                     this.f6 = this.f1;
                     this.f2 = this.f2;
                     this.f5 = this.f5;
                     this.f7 = lf32(this.i15 + 2900);
                     this.f2 = this.f5 - this.f2;
                     this.f0 = this.f0 + this.f6;
                     this.f4 = this.f4;
                     this.f3 = this.f3;
                     this.f3 = this.f3 - this.f4;
                     this.f2 = this.f2;
                     this.f0 = this.f0;
                     this.f4 = this.f7 - this.f6;
                     this.f3 = this.f3;
                     this.f4 = this.f4;
                     this.f2 = this.f2;
                     this.f0 = this.f0;
                     this.f3 = this.f3;
                     this.f4 = this.f4;
                     this.i18 = this.f0 < this.f2?5:0;
                     this.i20 = this.f4 > this.f3?2:0;
                     this.i11 = this.i11 | this.i18;
                     this.i18 = this.i26 + 144;
                     this.i23 = this.i23 + 16;
                     this.i26 = this.i15 + 4;
                     this.i27 = this.i12 + 1;
                     this.i11 = this.i11 | this.i20;
                     this.i12 = this.i18;
                     this.i15 = this.i23;
                     this.i18 = this.i26;
                     this.i20 = this.i27;
                  }
                  mstate.esp = this.i19;
                  this.i12 = this.i16 + 1008;
                  this.i15 = this.i17 + 7;
                  this.i16 = this.i13 + 4;
                  this.i17 = this.i14 + 1;
                  this.i11 = this.i11 | this.i1;
                  this.i13 = this.i15;
                  this.i14 = this.i16;
                  this.i15 = this.i17;
                  this.i1 = this.i22;
                  §§goto(addr2683);
               }
            case 3:
               mstate.esp = mstate.esp + 4;
               this.i1 = li32(mstate.ebp + -189);
               this.i1 = li32(this.i1 + 36);
               this.i3 = li32(mstate.ebp + -171);
               si32(this.i1,this.i3 + 24);
               this.i1 = li32(mstate.ebp + -117);
               this.i1 = li32(this.i1);
               si32(this.i1,this.i3 + 28);
               this.i1 = li32(this.i2);
               si32(this.i1,this.i3 + 32);
               this.i1 = li32(mstate.ebp + -117);
               this.i1 = li32(this.i1);
               this.i3 = li32(mstate.ebp + -189);
               this.i3 = this.i3 + 36;
               if(this.i1 != 0)
               {
                  this.i1 = li32(this.i3);
                  if(this.i1 != 0)
                  {
                     this.i1 = li32(this.i2);
                     if(this.i1 != 0)
                     {
                        this.i1 = 1;
                        this.i5 = li32(mstate.ebp + -126);
                        si32(this.i1,this.i5 + 8);
                     }
                  }
                  this.i1 = 0;
                  this.i5 = li32(mstate.ebp + -126);
                  si32(this.i1,this.i5 + 8);
               }
               else
               {
                  this.i5 = li32(mstate.ebp + -45);
                  this.i5 = li32(this.i5);
                  this.i5 = li32(this.i5 + 28);
                  this.i1 = this.i1 << 2;
                  this.i1 = this.i5 + this.i1;
                  this.i1 = li32(this.i1);
                  this.i5 = li32(this.i5);
                  this.i6 = this.i1 >> 31;
                  this.i6 = this.i6 >>> 30;
                  this.i7 = this.i5 >> 31;
                  this.i6 = this.i1 + this.i6;
                  this.i7 = this.i7 >>> 30;
                  this.i8 = li32(mstate.ebp + -18);
                  this.i8 = li32(this.i8);
                  this.i7 = this.i5 + this.i7;
                  this.i9 = li32(mstate.ebp + -99);
                  this.i9 = li32(this.i9);
                  this.i6 = this.i6 >> 2;
                  this.i8 = li32(this.i8);
                  this.i10 = li32(this.i8 + 172);
                  this.i7 = this.i7 >> 2;
                  this.i11 = this.i6 + this.i9;
                  this.i6 = this.i9 - this.i6;
                  this.i11 = this.i7 + this.i11;
                  this.i6 = this.i6 - this.i7;
                  if(this.i10 < this.i11)
                  {
                     if(this.i10 < this.i6)
                     {
                     }
                     addr5656:
                     this.i1 = 0;
                     this.i5 = li32(mstate.ebp + -126);
                     si32(this.i1,this.i5 + 8);
                  }
                  this.i6 = this.i1 >> 31;
                  this.i7 = this.i5 >> 31;
                  this.i6 = this.i6 >>> 30;
                  this.i7 = this.i7 >>> 30;
                  this.i1 = this.i1 + this.i6;
                  this.i5 = this.i5 + this.i7;
                  this.i1 = this.i1 >> 2;
                  this.i5 = this.i5 >> 2;
                  this.i1 = this.i1 + this.i5;
                  this.i5 = li32(this.i8 + 8);
                  this.i1 = this.i9 - this.i1;
                  this.i1 = this.i1 / this.i5;
                  this.i6 = this.i1 << 2;
                  this.i7 = this.i8 + 160;
                  this.i5 = this.i11 / this.i5;
                  while(true)
                  {
                     if(this.i1 >= this.i5)
                     {
                        this.i1 = 1;
                        this.i5 = li32(mstate.ebp + -126);
                        si32(this.i1,this.i5 + 8);
                        break;
                     }
                     this.i8 = li32(this.i7);
                     this.i8 = this.i8 + this.i6;
                     this.i8 = li32(this.i8);
                     if(this.i8 == 0)
                     {
                        this.i6 = this.i6 + 4;
                        this.i1 = this.i1 + 1;
                        continue;
                     }
                     §§goto(addr5656);
                  }
               }
               this.i1 = 0;
               this.i6 = li32(mstate.ebp + -171);
               this.i5 = li32(mstate.ebp + -189);
               si32(this.i5,this.i6 + 64);
               this.i5 = li32(this.i5 + 64);
               this.i6 = li32(mstate.ebp + -189);
               this.i6 = li32(this.i6 + 68);
               this.i7 = 1;
               this.i8 = li32(mstate.ebp + -171);
               si32(this.i5,this.i8 + 56);
               si32(this.i6,this.i8 + 60);
               this.i5 = __addc(this.i5,this.i7);
               this.i1 = __adde(this.i6,this.i1);
               this.i6 = li32(mstate.ebp + -189);
               si32(this.i5,this.i6 + 64);
               si32(this.i1,this.i6 + 68);
               this.i1 = li32(this.i6 + 56);
               this.i5 = li32(this.i6 + 60);
               si32(this.i1,this.i8 + 48);
               si32(this.i5,this.i8 + 52);
               this.i1 = li32(mstate.ebp + -117);
               this.i1 = li32(this.i1);
               this.i1 = this.i1 << 2;
               this.i5 = li32(mstate.ebp + -135);
               this.i1 = this.i5 + this.i1;
               this.i1 = li32(this.i1);
               si32(this.i1,this.i8 + 36);
               this.i1 = li32(mstate.ebp + -126);
               this.f0 = lf32(this.i1 + 4);
               this.i1 = li32(mstate.ebp + -54);
               this.f1 = lf32(this.i1);
               this.i1 = li32(mstate.ebp + -126);
               this.i1 = this.i1 + 4;
               this.i5 = this.i8 + 36;
               this.i6 = this.i6 + 56;
               this.i7 = li32(mstate.ebp + -54);
               this.f2 = this.f1;
               this.f3 = this.f0;
               if(this.f3 <= this.f2)
               {
                  this.f0 = this.f1;
               }
               else
               {
                  sf32(this.f0,this.i7);
               }
               this.f1 = -9999;
               this.i8 = li32(mstate.ebp + -117);
               this.i8 = li32(this.i8);
               this.i9 = li32(mstate.ebp + -45);
               this.i9 = li32(this.i9);
               this.i10 = li32(this.i9 + 28);
               this.i8 = this.i8 << 2;
               this.i8 = this.i10 + this.i8;
               this.i8 = li32(this.i8);
               this.i11 = this.i8 >>> 31;
               this.i8 = this.i8 + this.i11;
               this.i9 = li32(this.i9 + 8);
               this.i8 = this.i8 >> 1;
               this.f2 = Number(this.i9);
               this.f3 = Number(this.i8);
               this.f2 = this.f2;
               this.f3 = this.f3;
               this.f2 = this.f3 / this.f2;
               this.f2 = this.f2;
               this.f3 = lf32(this.i10 + 2936);
               this.f2 = this.f2;
               this.f2 = this.f3 * this.f2;
               this.f2 = this.f2;
               this.f0 = this.f0;
               this.f2 = this.f2;
               this.f0 = this.f2 + this.f0;
               this.f0 = this.f0;
               this.f1 = this.f1;
               this.f1 = this.f1;
               this.f0 = this.f0;
               this.f0 = this.f0 < this.f1?Number(this.f1):Number(this.f0);
               this.f0 = this.f0;
               sf32(this.f0,this.i7);
               sf32(this.f0,this.i1);
               this.i1 = li32(mstate.ebp + -90);
               this.i1 = li32(this.i1 + 4);
               mstate.esp = mstate.esp - 8;
               this.i1 = this.i1 << 2;
               this.i7 = li32(mstate.ebp + -171);
               si32(this.i7,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               state = 4;
               mstate.esp = mstate.esp - 4;
               FSM_vorbis_analysis_blockout.start();
               return;
            case 4:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               si32(this.i1,this.i7);
               this.i1 = li32(mstate.ebp + -90);
               this.i1 = li32(this.i1 + 4);
               mstate.esp = mstate.esp - 8;
               this.i1 = this.i1 << 2;
               si32(this.i7,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               state = 5;
               mstate.esp = mstate.esp - 4;
               FSM_vorbis_analysis_blockout.start();
               return;
            case 5:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i7 = li32(mstate.ebp + -36);
               si32(this.i1,this.i7);
               this.i1 = 0;
               this.i7 = li32(mstate.ebp + -90);
               this.i7 = this.i7 + 4;
               this.i8 = li32(mstate.ebp + -36);
               this.i9 = li32(mstate.ebp + -171);
               this.i10 = this.i1;
               addr5040:
               this.i11 = li32(this.i7);
               if(this.i11 <= this.i1)
               {
                  this.i1 = li32(mstate.ebp + -108);
                  this.i1 = li32(this.i1);
                  if(this.i1 != 0)
                  {
                     this.i5 = li32(mstate.ebp + -99);
                     this.i5 = li32(this.i5);
                     if(this.i5 >= this.i1)
                     {
                        this.i0 = -1;
                        this.i2 = li32(mstate.ebp + -108);
                        si32(this.i0,this.i2);
                        this.i0 = 1;
                        this.i2 = li32(mstate.ebp + -171);
                        si32(this.i0,this.i2 + 44);
                     }
                     addr366:
                     §§goto(addr367);
                  }
                  this.i1 = li32(this.i4);
                  this.i4 = this.i1 >>> 31;
                  this.i1 = this.i1 + this.i4;
                  this.i1 = this.i1 >> 1;
                  this.i0 = this.i0 - this.i1;
                  if(this.i0 <= 0)
                  {
                     this.i0 = 1;
                     §§goto(addr366);
                  }
                  else
                  {
                     this.i4 = li32(mstate.ebp + -72);
                     this.i4 = li32(this.i4);
                     this.i5 = li32(this.i4 + 168);
                     this.i8 = li32(this.i4 + 8);
                     this.i9 = li32(this.i4 + 160);
                     this.i10 = this.i0 / this.i8;
                     this.i5 = this.i5 / this.i8;
                     this.i8 = this.i10 << 2;
                     this.i5 = this.i5 + 2;
                     this.i5 = this.i5 - this.i10;
                     this.i8 = this.i9 + this.i8;
                     this.i5 = this.i5 << 2;
                     memmove(this.i9,this.i8,this.i5);
                     this.i5 = li32(this.i4 + 168);
                     this.i5 = this.i5 - this.i0;
                     si32(this.i5,this.i4 + 168);
                     this.i5 = li32(this.i4 + 172);
                     this.i8 = this.i4 + 172;
                     if(this.i5 >= 0)
                     {
                        this.i5 = this.i5 - this.i0;
                        si32(this.i5,this.i8);
                     }
                     this.i5 = 0;
                     this.i8 = li32(this.i4 + 176);
                     this.i8 = this.i8 - this.i0;
                     si32(this.i8,this.i4 + 176);
                     this.i4 = li32(mstate.ebp + -144);
                     this.i4 = li32(this.i4);
                     this.i4 = this.i4 - this.i0;
                     this.i8 = li32(mstate.ebp + -144);
                     si32(this.i4,this.i8);
                     this.i4 = this.i5;
                     while(true)
                     {
                        this.i8 = this.i4;
                        this.i4 = this.i5;
                        this.i5 = li32(this.i7);
                        if(this.i5 <= this.i4)
                        {
                           break;
                        }
                        this.i5 = li32(mstate.ebp + -225);
                        this.i5 = li32(this.i5);
                        this.i5 = this.i5 + this.i8;
                        this.i9 = li32(mstate.ebp + -144);
                        this.i9 = li32(this.i9);
                        this.i5 = li32(this.i5);
                        this.i10 = this.i0 << 2;
                        this.i10 = this.i5 + this.i10;
                        this.i9 = this.i9 << 2;
                        memmove(this.i5,this.i10,this.i9);
                        this.i5 = this.i8 + 4;
                        this.i8 = this.i4 + 1;
                        this.i4 = this.i5;
                        this.i5 = this.i8;
                     }
                     this.i4 = li32(mstate.ebp + -117);
                     this.i4 = li32(this.i4);
                     si32(this.i4,this.i3);
                     this.i2 = li32(this.i2);
                     this.i3 = li32(mstate.ebp + -117);
                     si32(this.i2,this.i3);
                     this.i2 = li32(mstate.ebp + -99);
                     si32(this.i1,this.i2);
                     this.i2 = li32(mstate.ebp + -108);
                     this.i2 = li32(this.i2);
                     if(this.i2 != 0)
                     {
                        this.i2 = this.i2 - this.i0;
                        this.i2 = this.i2 < 1?-1:int(this.i2);
                        this.i3 = li32(mstate.ebp + -108);
                        si32(this.i2,this.i3);
                        if(this.i1 >= this.i2)
                        {
                           this.i1 = this.i2 - this.i1;
                           this.i0 = this.i0 + this.i1;
                        }
                        addr5577:
                        this.i1 = 1;
                        this.i2 = li32(this.i6);
                        this.i3 = li32(this.i6 + 4);
                        this.i4 = this.i0 >> 31;
                        this.i0 = __addc(this.i2,this.i0);
                        this.i2 = __adde(this.i3,this.i4);
                        si32(this.i0,this.i6);
                        si32(this.i2,this.i6 + 4);
                        mstate.eax = this.i1;
                        break;
                     }
                     §§goto(addr5577);
                  }
               }
               else
               {
                  this.i11 = li32(this.i5);
                  this.i12 = li32(this.i8);
                  this.i13 = li32(mstate.ebp + -180);
                  this.i11 = this.i11 + this.i13;
                  mstate.esp = mstate.esp - 8;
                  this.i11 = this.i11 << 2;
                  this.i13 = li32(mstate.ebp + -171);
                  si32(this.i13,mstate.esp);
                  si32(this.i11,mstate.esp + 4);
                  state = 6;
                  mstate.esp = mstate.esp - 4;
                  FSM_vorbis_analysis_blockout.start();
                  return;
               }
            case 6:
               this.i11 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i12 = this.i12 + this.i10;
               si32(this.i11,this.i12);
               this.i11 = li32(mstate.ebp + -225);
               this.i11 = li32(this.i11);
               this.i12 = li32(this.i8);
               this.i12 = this.i12 + this.i10;
               this.i11 = this.i11 + this.i10;
               this.i13 = li32(this.i5);
               this.i11 = li32(this.i11);
               this.i12 = li32(this.i12);
               this.i14 = li32(mstate.ebp + -180);
               this.i13 = this.i13 + this.i14;
               this.i13 = this.i13 << 2;
               memcpy(this.i12,this.i11,this.i13);
               this.i11 = li32(this.i8);
               this.i11 = this.i11 + this.i10;
               this.i12 = li32(this.i9);
               this.i11 = li32(this.i11);
               this.i13 = this.i14 << 2;
               this.i12 = this.i12 + this.i10;
               this.i11 = this.i11 + this.i13;
               si32(this.i11,this.i12);
               this.i10 = this.i10 + 4;
               this.i1 = this.i1 + 1;
               §§goto(addr5040);
         }
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
