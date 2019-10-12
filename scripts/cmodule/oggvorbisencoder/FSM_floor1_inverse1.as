package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_floor1_inverse1 extends Machine
   {
      
      public static const intRegCount:int = 24;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i22:int;
      
      public var i10:int;
      
      public var i11:int;
      
      public var i12:int;
      
      public var i13:int;
      
      public var i14:int;
      
      public var i15:int;
      
      public var i17:int;
      
      public var i19:int;
      
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
      
      public var i23:int;
      
      public var i18:int;
      
      public var i20:int;
      
      public var i21:int;
      
      public function FSM_floor1_inverse1()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_floor1_inverse1 = null;
         _loc1_ = new FSM_floor1_inverse1();
         FSM_floor1_inverse1.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         loop10:
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 0;
               this.i0 = 1;
               this.i1 = li32(mstate.ebp + 8);
               this.i2 = li32(this.i1 + 64);
               this.i2 = li32(this.i2 + 4);
               this.i3 = li32(mstate.ebp + 12);
               this.i2 = li32(this.i2 + 28);
               this.i4 = li32(this.i3 + 1296);
               this.i2 = li32(this.i2 + 2848);
               mstate.esp = mstate.esp - 8;
               this.i5 = this.i1 + 4;
               si32(this.i5,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_floor1_inverse1.start();
            case 1:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i6 = this.i4;
               this.i7 = this.i3;
               if(this.i0 != 1)
               {
                  addr136:
                  this.i1 = 0;
                  break;
               }
               this.i0 = 0;
               this.i8 = li32(this.i7 + 1284);
               mstate.esp = mstate.esp - 8;
               this.i8 = this.i8 << 2;
               si32(this.i1,mstate.esp);
               si32(this.i8,mstate.esp + 4);
               state = 2;
               mstate.esp = mstate.esp - 4;
               FSM_floor1_inverse1.start();
               return;
            case 2:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i8 = li32(this.i7 + 1292);
               this.i8 = this.i8 + -1;
               this.i9 = this.i7 + 1292;
               this.i7 = this.i7 + 1284;
               this.i10 = this.i1;
               this.i11 = this.i1;
               while(true)
               {
                  this.i12 = this.i0;
                  this.i0 = this.i8;
                  if(this.i0 == 0)
                  {
                     break;
                  }
                  this.i8 = this.i12 + 1;
                  this.i12 = this.i0 >>> 1;
                  this.i0 = this.i8;
                  this.i8 = this.i12;
               }
               this.i0 = 0;
               mstate.esp = mstate.esp - 8;
               si32(this.i5,mstate.esp);
               si32(this.i12,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_floor1_inverse1.start();
            case 3:
               this.i8 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               si32(this.i8,this.i11);
               this.i8 = li32(this.i9);
               this.i8 = this.i8 + -1;
               while(true)
               {
                  this.i12 = this.i0;
                  this.i0 = this.i8;
                  if(this.i0 == 0)
                  {
                     break;
                  }
                  this.i8 = this.i12 + 1;
                  this.i12 = this.i0 >>> 1;
                  this.i0 = this.i8;
                  this.i8 = this.i12;
               }
               this.i0 = 2;
               mstate.esp = mstate.esp - 8;
               si32(this.i5,mstate.esp);
               si32(this.i12,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_floor1_inverse1.start();
            case 4:
               this.i8 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               si32(this.i8,this.i11 + 4);
               this.i8 = this.i4 + 4;
               this.i12 = 0;
               this.i13 = this.i6;
               loop2:
               while(true)
               {
                  this.i14 = this.i8;
                  this.i8 = this.i0;
                  this.i15 = li32(this.i13);
                  this.i0 = this.i14;
                  if(this.i15 <= this.i12)
                  {
                     this.i0 = 2;
                     this.i2 = 0;
                     addr1209:
                     while(true)
                     {
                        this.i5 = li32(this.i7);
                        if(this.i5 <= this.i0)
                        {
                           break loop10;
                        }
                        this.i5 = this.i3 + this.i2;
                        this.i8 = li32(this.i5 + 780);
                        this.i12 = li32(this.i5 + 1032);
                        this.i13 = this.i6 + 836;
                        this.i12 = this.i12 << 2;
                        this.i8 = this.i8 << 2;
                        this.i14 = this.i13 + this.i12;
                        this.i13 = this.i13 + this.i8;
                        this.i12 = this.i11 + this.i12;
                        this.i8 = this.i11 + this.i8;
                        this.i15 = this.i4 + this.i2;
                        this.i15 = li32(this.i15 + 844);
                        this.i8 = li32(this.i8);
                        this.i12 = li32(this.i12);
                        this.i13 = li32(this.i13);
                        this.i14 = li32(this.i14);
                        mstate.esp = mstate.esp - 20;
                        si32(this.i14,mstate.esp);
                        si32(this.i13,mstate.esp + 4);
                        si32(this.i12,mstate.esp + 8);
                        si32(this.i8,mstate.esp + 12);
                        si32(this.i15,mstate.esp + 16);
                        mstate.esp = mstate.esp - 4;
                        FSM_floor1_inverse1.start();
                     }
                  }
                  else
                  {
                     this.i15 = 1;
                     this.i0 = li32(this.i0);
                     this.i16 = this.i0 << 2;
                     this.i16 = this.i6 + this.i16;
                     this.i17 = li32(this.i16 + 192);
                     this.i16 = li32(this.i16 + 128);
                     this.i15 = this.i15 << this.i17;
                     if(this.i17 == 0)
                     {
                        this.i18 = 0;
                     }
                     else
                     {
                        this.i18 = this.i0 << 2;
                        this.i18 = this.i6 + this.i18;
                        this.i18 = li32(this.i18 + 256);
                        this.i18 = this.i18 * 56;
                        mstate.esp = mstate.esp - 8;
                        this.i18 = this.i2 + this.i18;
                        si32(this.i18,mstate.esp);
                        si32(this.i5,mstate.esp + 4);
                        mstate.esp = mstate.esp - 4;
                        FSM_floor1_inverse1.start();
                     }
                     addr547:
                     while(true)
                     {
                        this.i19 = 0;
                        this.i20 = this.i8 << 2;
                        this.i20 = this.i10 + this.i20;
                        this.i15 = this.i15 + -1;
                        loop3:
                        while(true)
                        {
                           this.i21 = this.i19;
                           this.i19 = this.i20;
                           if(this.i21 >= this.i16)
                           {
                              break;
                           }
                           addr692:
                           this.i22 = this.i15 & this.i18;
                           this.i23 = this.i0 << 5;
                           this.i23 = this.i6 + this.i23;
                           this.i22 = this.i22 << 2;
                           this.i22 = this.i23 + this.i22;
                           this.i22 = li32(this.i22 + 320);
                           this.i18 = this.i18 >> this.i17;
                           if(this.i22 >= 0)
                           {
                              this.i22 = this.i22 * 56;
                              mstate.esp = mstate.esp - 8;
                              this.i22 = this.i2 + this.i22;
                              si32(this.i22,mstate.esp);
                              si32(this.i5,mstate.esp + 4);
                              mstate.esp = mstate.esp - 4;
                              FSM_floor1_inverse1.start();
                           }
                           else
                           {
                              this.i22 = 0;
                              si32(this.i22,this.i19);
                           }
                           while(true)
                           {
                              this.i19 = this.i20 + 4;
                              this.i21 = this.i21 + 1;
                              this.i20 = this.i19;
                              this.i19 = this.i21;
                              continue loop3;
                           }
                        }
                        this.i0 = this.i14 + 4;
                        this.i12 = this.i12 + 1;
                        this.i14 = this.i8 + this.i16;
                        this.i8 = this.i0;
                        this.i0 = this.i14;
                        continue loop2;
                     }
                  }
               }
               break;
            case 5:
               while(true)
               {
                  this.i18 = mstate.eax;
                  mstate.esp = mstate.esp + 8;
                  if(this.i18 != -1)
                  {
                     §§goto(addr547);
                  }
                  break;
               }
               §§goto(addr136);
            case 6:
               while(true)
               {
                  this.i22 = mstate.eax;
                  mstate.esp = mstate.esp + 8;
                  si32(this.i22,this.i19);
                  if(this.i22 != -1)
                  {
                     §§goto(addr692);
                  }
                  §§goto(addr135);
               }
            case 7:
               while(true)
               {
                  this.i8 = mstate.eax;
                  this.i12 = this.i10 + this.i2;
                  mstate.esp = mstate.esp + 20;
                  this.i13 = li32(this.i9);
                  this.i14 = li32(this.i12 + 8);
                  this.i12 = this.i12 + 8;
                  this.i13 = this.i13 - this.i8;
                  this.i15 = this.i5 + 1032;
                  this.i5 = this.i5 + 780;
                  if(this.i14 != 0)
                  {
                     this.i16 = this.i8 <= this.i13?int(this.i8):int(this.i13);
                     this.i16 = this.i16 << 1;
                     if(this.i14 >= this.i16)
                     {
                        this.i16 = this.i14 - this.i13;
                        this.i14 = this.i13 > this.i8?int(this.i14):-1;
                        this.i13 = this.i13 > this.i8?int(this.i8):int(this.i16);
                        this.i14 = this.i14 - this.i13;
                     }
                     else
                     {
                        this.i13 = this.i14 & 1;
                        if(this.i13 != 0)
                        {
                           this.i14 = this.i14 + 1;
                           this.i14 = this.i14 >> 1;
                           this.i14 = 0 - this.i14;
                        }
                        else
                        {
                           this.i14 = this.i14 >> 1;
                        }
                     }
                     this.i13 = this.i14;
                     this.i8 = this.i13 + this.i8;
                     this.i8 = this.i8 & 32767;
                     si32(this.i8,this.i12);
                     this.i8 = li32(this.i15);
                     this.i8 = this.i8 << 2;
                     this.i8 = this.i11 + this.i8;
                     this.i12 = li32(this.i8);
                     this.i12 = this.i12 & 32767;
                     si32(this.i12,this.i8);
                     this.i8 = li32(this.i5);
                     this.i8 = this.i8 << 2;
                     this.i8 = this.i11 + this.i8;
                     this.i12 = li32(this.i8);
                     this.i12 = this.i12 & 32767;
                     si32(this.i12,this.i8);
                  }
                  else
                  {
                     this.i5 = this.i8 | 32768;
                     si32(this.i5,this.i12);
                  }
                  this.i2 = this.i2 + 4;
                  this.i0 = this.i0 + 1;
                  §§goto(addr1209);
               }
         }
         this.i0 = this.i1;
         mstate.eax = this.i0;
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
