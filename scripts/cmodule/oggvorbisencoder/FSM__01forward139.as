package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM__01forward139 extends Machine
   {
      
      public static const intRegCount:int = 29;
      
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
      
      public var i26:int;
      
      public var i27:int;
      
      public var i20:int;
      
      public var i9:int;
      
      public var i28:int;
      
      public function FSM__01forward139()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM__01forward139 = null;
         _loc1_ = new FSM__01forward139();
         FSM__01forward139.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         loop8:
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 1024;
               this.i0 = mstate.ebp + -512;
               this.i1 = li32(mstate.ebp + 12);
               this.i2 = li32(this.i1);
               this.i3 = li32(this.i1 + 16);
               this.i4 = li32(this.i2 + 8);
               this.i5 = li32(this.i2 + 12);
               this.i3 = li32(this.i3);
               this.i6 = li32(this.i2 + 4);
               this.i7 = li32(this.i2);
               this.i8 = 0;
               this.i9 = this.i8;
               this.i10 = 512;
               memset(this.i0,this.i9,this.i10);
               this.i0 = mstate.ebp + -1024;
               this.i9 = this.i8;
               this.i6 = this.i6 - this.i7;
               memset(this.i0,this.i9,this.i10);
               this.i0 = li32(mstate.ebp + 16);
               this.i7 = li32(mstate.ebp + 24);
               this.i9 = this.i1 + 32;
               this.i10 = this.i1 + 20;
               this.i11 = this.i1 + 36;
               this.i12 = this.i1 + 8;
               this.i6 = this.i6 / this.i4;
               this.i1 = this.i1 + 16;
               this.i13 = li32(mstate.ebp + 8);
               this.i14 = li32(mstate.ebp + 20);
               this.i15 = this.i2;
               while(true)
               {
                  this.i16 = li32(this.i12);
                  if(this.i16 <= this.i8)
                  {
                     break;
                  }
                  this.i16 = 1;
                  this.i17 = 0;
                  this.i16 = this.i16 << this.i8;
                  while(this.i17 < this.i6)
                  {
                     if(this.i8 == 0)
                     {
                        this.i18 = 0;
                        this.i19 = this.i7;
                        loop2:
                        while(true)
                        {
                           this.i20 = this.i18;
                           this.i18 = this.i19;
                           if(this.i20 >= this.i14)
                           {
                              break;
                           }
                           this.i21 = 1;
                           this.i18 = li32(this.i18);
                           this.i22 = this.i17 << 2;
                           this.i18 = this.i18 + this.i22;
                           this.i22 = li32(this.i18);
                           this.i18 = this.i18 + 4;
                           while(true)
                           {
                              this.i24 = this.i18;
                              this.i23 = this.i21;
                              this.i21 = this.i22;
                              this.i18 = this.i24;
                              if(this.i23 >= this.i3)
                              {
                                 break;
                              }
                              this.i21 = this.i21 * this.i5;
                              this.i22 = this.i17 + this.i23;
                              if(this.i22 >= this.i6)
                              {
                                 this.i18 = this.i21;
                              }
                              else
                              {
                                 this.i18 = li32(this.i18);
                                 this.i18 = this.i18 + this.i21;
                              }
                              this.i22 = this.i18;
                              this.i18 = this.i24 + 4;
                              this.i21 = this.i23 + 1;
                           }
                           this.i18 = li32(this.i1);
                           this.i22 = li32(this.i18 + 4);
                           if(this.i22 > this.i21)
                           {
                              this.i22 = li32(this.i11);
                              mstate.esp = mstate.esp - 12;
                              si32(this.i18,mstate.esp);
                              si32(this.i21,mstate.esp + 4);
                              si32(this.i13,mstate.esp + 8);
                              state = 1;
                              mstate.esp = mstate.esp - 4;
                              FSM__01forward139.start();
                              return;
                           }
                           addr418:
                           while(true)
                           {
                              this.i18 = this.i19 + 4;
                              this.i20 = this.i20 + 1;
                              this.i19 = this.i18;
                              this.i18 = this.i20;
                              continue loop2;
                           }
                        }
                     }
                     this.i18 = 0;
                     this.i19 = this.i17 * this.i4;
                     while(true)
                     {
                        this.i20 = this.i19;
                        this.i19 = this.i18;
                        this.i18 = this.i17 + this.i19;
                        if(this.i19 < this.i3)
                        {
                           if(this.i18 >= this.i6)
                           {
                              break;
                           }
                           addr843:
                           this.i21 = 0;
                           this.i22 = li32(this.i2);
                           this.i22 = this.i22 + this.i20;
                           this.i23 = this.i21;
                           while(this.i21 < this.i14)
                           {
                              if(this.i8 == 0)
                              {
                                 this.i24 = mstate.ebp + -1024;
                                 this.i25 = this.i7 + this.i23;
                                 this.i25 = li32(this.i25);
                                 this.i26 = this.i18 << 2;
                                 this.i25 = this.i25 + this.i26;
                                 this.i25 = li32(this.i25);
                                 this.i25 = this.i25 << 2;
                                 this.i24 = this.i24 + this.i25;
                                 this.i25 = li32(this.i24);
                                 this.i25 = this.i25 + this.i4;
                                 si32(this.i25,this.i24);
                              }
                              this.i24 = this.i7 + this.i23;
                              this.i25 = li32(this.i24);
                              this.i26 = this.i18 << 2;
                              this.i25 = this.i25 + this.i26;
                              this.i25 = li32(this.i25);
                              this.i26 = this.i25 << 2;
                              this.i26 = this.i15 + this.i26;
                              this.i26 = li32(this.i26 + 24);
                              this.i26 = this.i26 & this.i16;
                              if(this.i26 != 0)
                              {
                                 this.i26 = li32(this.i10);
                                 this.i25 = this.i25 << 2;
                                 this.i25 = this.i26 + this.i25;
                                 this.i25 = li32(this.i25);
                                 this.i26 = this.i8 << 2;
                                 this.i25 = this.i25 + this.i26;
                                 this.i25 = li32(this.i25);
                                 if(this.i25 != 0)
                                 {
                                    this.i26 = 0;
                                    this.i27 = this.i0 + this.i23;
                                    this.i27 = li32(this.i27);
                                    this.i28 = this.i22 << 2;
                                    mstate.esp = mstate.esp - 20;
                                    this.i27 = this.i27 + this.i28;
                                    si32(this.i13,mstate.esp);
                                    si32(this.i27,mstate.esp + 4);
                                    si32(this.i4,mstate.esp + 8);
                                    si32(this.i25,mstate.esp + 12);
                                    si32(this.i26,mstate.esp + 16);
                                    state = 2;
                                    mstate.esp = mstate.esp - 4;
                                    FSM__01forward139.start();
                                    return;
                                 }
                                 break loop8;
                              }
                              break loop8;
                           }
                           this.i18 = this.i4 + this.i20;
                           this.i20 = this.i19 + 1;
                           this.i19 = this.i18;
                           this.i18 = this.i20;
                           continue;
                        }
                        break;
                     }
                     this.i17 = this.i17 + this.i19;
                  }
                  this.i8 = this.i8 + 1;
               }
               this.i0 = 0;
               mstate.eax = this.i0;
               mstate.esp = mstate.ebp;
               mstate.ebp = li32(mstate.esp);
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp + 4;
               mstate.gworker = caller;
               return;
            case 1:
               this.i18 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               this.i18 = this.i22 + this.i18;
               si32(this.i18,this.i11);
               §§goto(addr418);
            case 2:
               this.i25 = mstate.eax;
               mstate.esp = mstate.esp + 20;
               this.i26 = li32(this.i9);
               this.i26 = this.i26 + this.i25;
               si32(this.i26,this.i9);
               this.i24 = li32(this.i24);
               this.i26 = this.i18 << 2;
               this.i24 = this.i24 + this.i26;
               this.i24 = li32(this.i24);
               this.i24 = this.i24 << 2;
               this.i26 = mstate.ebp + -512;
               this.i24 = this.i26 + this.i24;
               this.i26 = li32(this.i24);
               this.i25 = this.i26 + this.i25;
               si32(this.i25,this.i24);
         }
         while(true)
         {
            this.i23 = this.i23 + 4;
            this.i21 = this.i21 + 1;
            §§goto(addr843);
         }
      }
   }
}
