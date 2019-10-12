package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.lf32;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.sf32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_res2_inverse extends Machine
   {
      
      public static const intRegCount:int = 32;
      
      public static const NumberRegCount:int = 2;
       
      
      public var i21:int;
      
      public var i30:int;
      
      public var i31:int;
      
      public var f0:Number;
      
      public var f1:Number;
      
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
      
      public function FSM_res2_inverse()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_res2_inverse = null;
         _loc1_ = new FSM_res2_inverse();
         FSM_res2_inverse.gworker = _loc1_;
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
               mstate.esp = mstate.esp - 28;
               this.i0 = li32(mstate.ebp + 8);
               this.i1 = li32(mstate.ebp + 12);
               this.i2 = li32(mstate.ebp + 24);
               this.i3 = li32(this.i0 + 36);
               this.i3 = this.i3 * this.i2;
               this.i4 = li32(this.i1);
               this.i5 = li32(this.i1 + 16);
               this.i6 = li32(this.i4 + 4);
               this.i3 = this.i3 >> 1;
               this.i7 = li32(this.i4 + 8);
               this.i5 = li32(this.i5);
               this.i8 = li32(this.i4);
               this.i3 = this.i6 <= this.i3?int(this.i6):int(this.i3);
               this.i6 = li32(mstate.ebp + 20);
               this.i3 = this.i3 - this.i8;
               this.i8 = this.i1 + 16;
               si32(this.i8,mstate.ebp + -27);
               this.i8 = li32(mstate.ebp + 16);
               this.i9 = this.i4;
               if(this.i3 >= 1)
               {
                  this.i10 = 0;
                  this.i3 = this.i3 / this.i7;
                  this.i11 = this.i3 + this.i5;
                  this.i11 = this.i11 + -1;
                  this.i11 = this.i11 / this.i5;
                  mstate.esp = mstate.esp - 8;
                  this.i11 = this.i11 << 2;
                  si32(this.i0,mstate.esp);
                  si32(this.i11,mstate.esp + 4);
                  state = 1;
                  mstate.esp = mstate.esp - 4;
                  FSM_res2_inverse.start();
                  return;
               }
               break;
            case 1:
               this.i11 = mstate.eax;
               si32(this.i11,mstate.ebp + -9);
               mstate.esp = mstate.esp + 8;
               while(true)
               {
                  this.i11 = this.i6;
                  this.i6 = this.i11;
                  if(this.i10 < this.i2)
                  {
                     this.i6 = li32(this.i6);
                     if(this.i6 == 0)
                     {
                        this.i6 = this.i11 + 4;
                        this.i10 = this.i10 + 1;
                        continue;
                     }
                     break;
                  }
                  break;
               }
               if(this.i10 != this.i2)
               {
                  this.i6 = 0;
                  this.i10 = this.i1 + 20;
                  this.i11 = this.i1 + 28;
                  this.i12 = this.i9 + 16;
                  this.i0 = this.i0 + 4;
                  this.i1 = this.i1 + 8;
                  si32(this.i1,mstate.ebp + -18);
                  this.i1 = this.i6;
                  while(true)
                  {
                     this.i6 = li32(mstate.ebp + -18);
                     this.i6 = li32(this.i6);
                     if(this.i6 > this.i1)
                     {
                        this.i6 = 1;
                        this.i13 = 0;
                        this.i6 = this.i6 << this.i1;
                        this.i14 = li32(mstate.ebp + -9);
                        loop2:
                        while(true)
                        {
                           this.i15 = this.i13;
                           this.i13 = this.i14;
                           if(this.i15 >= this.i3)
                           {
                              break;
                           }
                           addr461:
                           if(this.i1 == 0)
                           {
                              this.i16 = li32(mstate.ebp + -27);
                              this.i16 = li32(this.i16);
                              mstate.esp = mstate.esp - 8;
                              si32(this.i16,mstate.esp);
                              si32(this.i0,mstate.esp + 4);
                              mstate.esp = mstate.esp - 4;
                              FSM_res2_inverse.start();
                           }
                           while(true)
                           {
                              this.i16 = 0;
                              this.i17 = this.i15 + 1;
                              this.i17 = this.i7 * this.i17;
                              this.i18 = this.i15 * this.i7;
                              this.i19 = this.i16;
                              this.i20 = this.i16;
                              while(true)
                              {
                                 this.i21 = this.i15 + this.i16;
                                 if(this.i16 < this.i5)
                                 {
                                    if(this.i21 >= this.i3)
                                    {
                                       break;
                                    }
                                    this.i21 = li32(this.i13);
                                    this.i21 = this.i21 + this.i20;
                                    this.i21 = li32(this.i21);
                                    this.i22 = this.i21 << 2;
                                    this.i22 = this.i9 + this.i22;
                                    this.i22 = li32(this.i22 + 24);
                                    this.i22 = this.i22 & this.i6;
                                    if(this.i22 != 0)
                                    {
                                       this.i22 = li32(this.i10);
                                       this.i21 = this.i21 << 2;
                                       this.i21 = this.i22 + this.i21;
                                       this.i21 = li32(this.i21);
                                       this.i22 = this.i1 << 2;
                                       this.i21 = this.i21 + this.i22;
                                       this.i21 = li32(this.i21);
                                       if(this.i21 != 0)
                                       {
                                          this.i22 = li32(this.i4);
                                          this.i23 = li32(this.i21 + 8);
                                          this.i24 = this.i18 + this.i19;
                                          this.i24 = this.i22 + this.i24;
                                          if(this.i23 >= 1)
                                          {
                                             this.i23 = 0;
                                             this.i25 = this.i17 + this.i19;
                                             this.i22 = this.i22 + this.i25;
                                             this.i25 = this.i21 + 16;
                                             this.i22 = this.i22 / this.i2;
                                             this.i24 = this.i24 / this.i2;
                                             this.i26 = this.i21;
                                             addr903:
                                             while(this.i22 > this.i24)
                                             {
                                                mstate.esp = mstate.esp - 8;
                                                si32(this.i21,mstate.esp);
                                                si32(this.i0,mstate.esp + 4);
                                                mstate.esp = mstate.esp - 4;
                                                FSM_res2_inverse.start();
                                             }
                                          }
                                       }
                                    }
                                    this.i19 = this.i7 + this.i19;
                                    this.i20 = this.i20 + 4;
                                    this.i16 = this.i16 + 1;
                                    continue;
                                 }
                                 break;
                              }
                              this.i13 = this.i14 + 4;
                              this.i15 = this.i15 + this.i16;
                              this.i14 = this.i13;
                              this.i13 = this.i15;
                              continue loop2;
                           }
                        }
                        this.i1 = this.i1 + 1;
                        continue;
                     }
                     break loop9;
                  }
                  break;
               }
               break;
            case 2:
               while(true)
               {
                  this.i16 = mstate.eax;
                  mstate.esp = mstate.esp + 8;
                  if(this.i16 != -1)
                  {
                     this.i17 = li32(this.i12);
                     if(this.i17 > this.i16)
                     {
                        this.i17 = li32(this.i11);
                        this.i16 = this.i16 << 2;
                        this.i16 = this.i17 + this.i16;
                        this.i16 = li32(this.i16);
                        si32(this.i16,this.i13);
                        if(this.i16 != 0)
                        {
                           §§goto(addr461);
                        }
                        break loop9;
                     }
                     break loop9;
                  }
                  break loop9;
               }
            case 3:
               while(true)
               {
                  this.i27 = mstate.eax;
                  mstate.esp = mstate.esp + 8;
                  if(this.i27 != -1)
                  {
                     this.i28 = 0;
                     this.i29 = li32(this.i26);
                     this.i27 = this.i27 * this.i29;
                     this.i29 = li32(this.i25);
                     this.i27 = this.i27 << 2;
                     this.i27 = this.i29 + this.i27;
                     while(true)
                     {
                        this.i29 = this.i28;
                        this.i28 = this.i23;
                        this.i30 = li32(this.i26);
                        this.i23 = this.i27;
                        if(this.i30 <= this.i29)
                        {
                           break;
                        }
                        this.i30 = this.i28 << 2;
                        this.i30 = this.i8 + this.i30;
                        this.i30 = li32(this.i30);
                        this.i31 = this.i24 << 2;
                        this.i30 = this.i30 + this.i31;
                        this.f0 = lf32(this.i30);
                        this.f1 = lf32(this.i23);
                        this.i23 = this.i28 + 1;
                        this.f0 = this.f0 + this.f1;
                        this.i28 = this.i23 == this.i2?1:0;
                        this.i28 = this.i28 & 1;
                        this.f0 = this.f0;
                        sf32(this.f0,this.i30);
                        this.i23 = this.i23 == this.i2?0:int(this.i23);
                        this.i27 = this.i27 + 4;
                        this.i29 = this.i29 + 1;
                        this.i24 = this.i24 + this.i28;
                        this.i28 = this.i29;
                     }
                     this.i23 = this.i28;
                     §§goto(addr903);
                  }
                  else
                  {
                     this.i1 = 0;
                     mstate.eax = this.i1;
                     break;
                  }
               }
               mstate.esp = mstate.ebp;
               mstate.ebp = li32(mstate.esp);
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp + 4;
               mstate.gworker = caller;
               return;
         }
         this.i0 = 0;
         mstate.eax = this.i0;
         §§goto(addr939);
      }
   }
}
