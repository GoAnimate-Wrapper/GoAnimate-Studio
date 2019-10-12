package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM__01inverse extends Machine
   {
      
      public static const intRegCount:int = 26;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i21:int;
      
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
      
      public function FSM__01inverse()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM__01inverse = null;
         _loc1_ = new FSM__01inverse();
         FSM__01inverse.gworker = _loc1_;
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
               this.i0 = li32(mstate.ebp + 12);
               this.i1 = li32(mstate.ebp + 8);
               this.i2 = li32(this.i1 + 36);
               this.i3 = li32(this.i0);
               this.i4 = li32(this.i0 + 16);
               this.i5 = li32(this.i3 + 4);
               this.i2 = this.i2 >> 1;
               this.i6 = li32(this.i3 + 8);
               this.i4 = li32(this.i4);
               this.i7 = li32(this.i3);
               this.i2 = this.i5 <= this.i2?int(this.i5):int(this.i2);
               this.i5 = li32(mstate.ebp + 16);
               this.i2 = this.i2 - this.i7;
               this.i7 = this.i0 + 16;
               this.i8 = li32(mstate.ebp + 20);
               this.i9 = li32(mstate.ebp + 24);
               this.i10 = this.i3;
               if(this.i2 >= 1)
               {
                  this.i11 = 0;
                  this.i2 = this.i2 / this.i6;
                  this.i12 = this.i2 + this.i4;
                  this.i12 = this.i12 + -1;
                  this.i13 = mstate.esp;
                  this.i14 = this.i8 << 2;
                  this.i13 = this.i13 - this.i14;
                  this.i12 = this.i12 / this.i4;
                  mstate.esp = this.i13;
                  this.i12 = this.i12 << 2;
                  this.i14 = this.i13;
                  addr275:
                  this.i15 = this.i14;
                  this.i14 = this.i11;
                  this.i11 = this.i15;
                  if(this.i14 >= this.i8)
                  {
                     this.i11 = 0;
                     this.i12 = this.i0 + 20;
                     this.i14 = this.i0 + 28;
                     this.i15 = this.i10 + 16;
                     this.i1 = this.i1 + 4;
                     this.i0 = this.i0 + 8;
                     while(true)
                     {
                        this.i16 = li32(this.i0);
                        if(this.i16 > this.i11)
                        {
                           this.i16 = 1;
                           this.i17 = 0;
                           this.i16 = this.i16 << this.i11;
                           this.i18 = this.i17;
                           while(this.i17 < this.i2)
                           {
                              if(this.i11 == 0)
                              {
                                 this.i19 = 0;
                                 this.i20 = this.i13;
                                 addr508:
                                 while(true)
                                 {
                                    this.i21 = this.i20;
                                    this.i20 = this.i19;
                                    this.i19 = this.i21;
                                    if(this.i20 >= this.i8)
                                    {
                                       break;
                                    }
                                    this.i22 = li32(this.i7);
                                    mstate.esp = mstate.esp - 8;
                                    si32(this.i22,mstate.esp);
                                    si32(this.i1,mstate.esp + 4);
                                    mstate.esp = mstate.esp - 4;
                                    FSM__01inverse.start();
                                 }
                              }
                              this.i19 = 0;
                              this.i20 = this.i17 * this.i6;
                              while(true)
                              {
                                 this.i21 = this.i20;
                                 this.i20 = this.i19;
                                 this.i19 = this.i17 + this.i20;
                                 if(this.i20 < this.i4)
                                 {
                                    if(this.i19 < this.i2)
                                    {
                                       this.i19 = 0;
                                       this.i22 = this.i19;
                                       loop4:
                                       while(this.i19 < this.i8)
                                       {
                                          this.i23 = this.i13 + this.i22;
                                          this.i23 = li32(this.i23);
                                          this.i24 = this.i18 << 2;
                                          this.i23 = this.i23 + this.i24;
                                          this.i23 = li32(this.i23);
                                          this.i24 = this.i20 << 2;
                                          this.i23 = this.i23 + this.i24;
                                          this.i23 = li32(this.i23);
                                          this.i24 = this.i23 << 2;
                                          this.i24 = this.i10 + this.i24;
                                          this.i25 = li32(this.i3);
                                          this.i24 = li32(this.i24 + 24);
                                          this.i25 = this.i25 + this.i21;
                                          this.i24 = this.i24 & this.i16;
                                          if(this.i24 != 0)
                                          {
                                             this.i24 = li32(this.i12);
                                             this.i23 = this.i23 << 2;
                                             this.i23 = this.i24 + this.i23;
                                             this.i23 = li32(this.i23);
                                             this.i24 = this.i11 << 2;
                                             this.i23 = this.i23 + this.i24;
                                             this.i23 = li32(this.i23);
                                             if(this.i23 != 0)
                                             {
                                                this.i24 = this.i5 + this.i22;
                                                this.i24 = li32(this.i24);
                                                this.i25 = this.i25 << 2;
                                                mstate.esp = mstate.esp - 16;
                                                this.i24 = this.i24 + this.i25;
                                                si32(this.i23,mstate.esp);
                                                si32(this.i24,mstate.esp + 4);
                                                si32(this.i1,mstate.esp + 8);
                                                si32(this.i6,mstate.esp + 12);
                                                state = 3;
                                                mstate.esp = mstate.esp - 4;
                                                mstate.funcs[this.i9]();
                                                return;
                                             }
                                          }
                                          while(true)
                                          {
                                             this.i22 = this.i22 + 4;
                                             this.i19 = this.i19 + 1;
                                             continue loop4;
                                          }
                                       }
                                       this.i19 = this.i6 + this.i21;
                                       this.i21 = this.i20 + 1;
                                       this.i20 = this.i19;
                                       this.i19 = this.i21;
                                       continue;
                                    }
                                    break;
                                 }
                                 break;
                              }
                              this.i18 = this.i18 + 1;
                              this.i17 = this.i17 + this.i20;
                           }
                           this.i11 = this.i11 + 1;
                           continue;
                        }
                        break;
                     }
                  }
                  else
                  {
                     mstate.esp = mstate.esp - 8;
                     si32(this.i1,mstate.esp);
                     si32(this.i12,mstate.esp + 4);
                     state = 1;
                     mstate.esp = mstate.esp - 4;
                     FSM__01inverse.start();
                     return;
                  }
               }
               addr878:
               this.i0 = 0;
               mstate.eax = this.i0;
               mstate.esp = mstate.ebp;
               mstate.ebp = li32(mstate.esp);
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp + 4;
               mstate.gworker = caller;
               return;
            case 1:
               this.i16 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               si32(this.i16,this.i11);
               this.i11 = this.i15 + 4;
               this.i15 = this.i14 + 1;
               this.i14 = this.i11;
               this.i11 = this.i15;
               §§goto(addr275);
            case 2:
               while(true)
               {
                  this.i22 = mstate.eax;
                  mstate.esp = mstate.esp + 8;
                  if(this.i22 != -1)
                  {
                     this.i23 = li32(this.i15);
                     if(this.i23 > this.i22)
                     {
                        this.i23 = li32(this.i14);
                        this.i22 = this.i22 << 2;
                        this.i22 = this.i23 + this.i22;
                        this.i23 = li32(this.i19);
                        this.i22 = li32(this.i22);
                        this.i24 = this.i18 << 2;
                        this.i23 = this.i23 + this.i24;
                        si32(this.i22,this.i23);
                        this.i19 = li32(this.i19);
                        this.i19 = this.i19 + this.i24;
                        this.i19 = li32(this.i19);
                        if(this.i19 != 0)
                        {
                           this.i19 = this.i21 + 4;
                           this.i21 = this.i20 + 1;
                           this.i20 = this.i19;
                           this.i19 = this.i21;
                           §§goto(addr508);
                        }
                     }
                  }
                  §§goto(addr878);
               }
            case 3:
               this.i23 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               if(this.i23 != -1)
               {
                  §§goto(addr766);
               }
               §§goto(addr878);
         }
      }
   }
}
