package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.sf32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_drft_init extends Machine
   {
      
      public static const intRegCount:int = 20;
      
      public static const NumberRegCount:int = 5;
       
      
      public var f0:Number;
      
      public var f1:Number;
      
      public var f2:Number;
      
      public var f3:Number;
      
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
      
      public var i2:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public var i5:int;
      
      public var i6:int;
      
      public var i7:int;
      
      public var i8:int;
      
      public var i9:int;
      
      public function FSM_drft_init()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_drft_init = null;
         _loc1_ = new FSM_drft_init();
         FSM_drft_init.gworker = _loc1_;
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
               si32(this.i0,this.i1);
               this.i2 = this.i0 * 3;
               if(uint(this.i2) >= uint(1073741824))
               {
                  this.i2 = 12;
                  si32(this.i2,FSM_drft_init);
                  this.i2 = 0;
                  break;
               }
               this.i2 = 0;
               mstate.esp = mstate.esp - 8;
               this.i3 = this.i0 * 12;
               si32(this.i2,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               state = 1;
               mstate.esp = mstate.esp - 4;
               FSM_drft_init.start();
               return;
            case 1:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i2 == 0)
               {
                  break;
               }
               this.i3 = 0;
               this.i4 = this.i2;
               this.i5 = this.i0 * 12;
               memset(this.i4,this.i3,this.i5);
               break;
            case 2:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i3 = this.i1 + 4;
               if(this.i2 != 0)
               {
                  this.i4 = 0;
                  this.i5 = this.i2;
                  this.i6 = 128;
                  memset(this.i5,this.i4,this.i6);
               }
               si32(this.i2,this.i1 + 8);
               this.i1 = li32(this.i3);
               this.i3 = this.i2;
               if(this.i0 != 1)
               {
                  this.i4 = FSM_drft_init;
                  this.i5 = 0;
                  this.i6 = this.i2 + 8;
                  this.i7 = this.i5;
                  this.i8 = this.i5;
                  this.i9 = this.i0;
                  while(true)
                  {
                     this.i10 = this.i4;
                     if(this.i7 <= 3)
                     {
                        this.i8 = li32(this.i10);
                     }
                     else
                     {
                        this.i8 = this.i8 + 2;
                     }
                     this.i10 = this.i5 << 2;
                     this.i10 = this.i3 + this.i10;
                     while(true)
                     {
                        this.i11 = this.i9 / this.i8;
                        this.i12 = this.i8 * this.i11;
                        if(this.i9 != this.i12)
                        {
                           break;
                        }
                        si32(this.i8,this.i10 + 8);
                        this.i9 = this.i5 + 1;
                        if(this.i5 != 0)
                        {
                           if(this.i8 == 2)
                           {
                              this.i12 = 1;
                              this.i13 = this.i10;
                              while(this.i12 < this.i9)
                              {
                                 this.i14 = li32(this.i13 + 4);
                                 si32(this.i14,this.i13 + 8);
                                 this.i13 = this.i13 + -4;
                                 this.i12 = this.i12 + 1;
                              }
                              this.i9 = 2;
                              si32(this.i9,this.i6);
                           }
                        }
                        this.i9 = this.i10 + 4;
                        this.i5 = this.i5 + 1;
                        if(this.i11 != 1)
                        {
                           this.i10 = this.i9;
                           this.i9 = this.i11;
                           continue;
                        }
                        this.f0 = 6.28319;
                        this.f0 = this.f0;
                        this.f1 = Number(this.i0);
                        this.f1 = this.f1;
                        this.f0 = this.f0;
                        this.f0 = this.f0 / this.f1;
                        si32(this.i0,this.i2);
                        si32(this.i5,this.i2 + 4);
                        this.f1 = this.f0;
                        this.i2 = this.i5 + -1;
                        if(this.i2 != 0)
                        {
                           this.i2 = 1;
                           this.i4 = 0;
                           this.i3 = this.i3 + 8;
                           this.i6 = this.i4;
                           while(true)
                           {
                              this.i7 = this.i4;
                              this.i4 = this.i3;
                              this.i8 = this.i5 + -1;
                              if(this.i6 >= this.i8)
                              {
                                 break;
                              }
                              this.i8 = 0;
                              this.i4 = li32(this.i4);
                              this.i9 = this.i2 * this.i4;
                              this.i10 = this.i0 / this.i9;
                              this.i11 = this.i4 * this.i2;
                              this.i12 = this.i10 << 2;
                              this.i11 = this.i0 / this.i11;
                              this.i4 = this.i4 + -1;
                              this.i13 = this.i7;
                              this.i14 = this.i2;
                              this.i15 = this.i1;
                              while(true)
                              {
                                 this.i16 = this.i13;
                                 this.i13 = this.i15;
                                 if(this.i8 >= this.i4)
                                 {
                                    break;
                                 }
                                 this.f0 = 0;
                                 this.f2 = Number(this.i14);
                                 this.f3 = this.f1;
                                 this.f2 = this.f2;
                                 this.f2 = this.f2 * this.f3;
                                 this.i15 = this.i7 + this.i0;
                                 this.f2 = this.f2;
                                 this.f0 = this.f0;
                                 this.i15 = this.i15 << 2;
                                 this.i17 = 2;
                                 this.i18 = this.i13;
                                 while(this.i17 < this.i10)
                                 {
                                    this.f3 = 1;
                                    this.f3 = this.f3;
                                    this.f3 = this.f3;
                                    this.f0 = this.f0;
                                    this.f0 = this.f0 + this.f3;
                                    this.f3 = this.f0;
                                    this.f0 = this.f2;
                                    this.f4 = this.f3;
                                    this.f0 = this.f4 * this.f0;
                                    this.f0 = this.f0;
                                    this.f4 = this.f0;
                                    this.f0 = this.f4;
                                    this.f0 = Math.cos(this.f0);
                                    this.i19 = this.i15 + this.i18;
                                    this.f0 = this.f0;
                                    sf32(this.f0,this.i19);
                                    this.f0 = this.f4;
                                    this.f0 = Math.sin(this.f0);
                                    this.f0 = this.f0;
                                    sf32(this.f0,this.i19 + 4);
                                    this.i18 = this.i18 + 8;
                                    this.i17 = this.i17 + 2;
                                    this.f0 = this.f3;
                                 }
                                 this.i15 = this.i11 + this.i16;
                                 this.i14 = this.i2 + this.i14;
                                 this.i16 = this.i12 + this.i13;
                                 this.i8 = this.i8 + 1;
                                 this.i13 = this.i15;
                                 this.i15 = this.i16;
                              }
                              this.i2 = this.i3 + 4;
                              this.i4 = this.i6 + 1;
                              this.i3 = this.i2;
                              this.i6 = this.i4;
                              this.i2 = this.i9;
                              this.i4 = this.i16;
                           }
                        }
                     }
                     this.i4 = this.i4 + 4;
                     this.i7 = this.i7 + 1;
                  }
               }
               mstate.esp = mstate.ebp;
               mstate.ebp = li32(mstate.esp);
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp + 4;
               mstate.gworker = caller;
               return;
         }
         this.i3 = 128;
         si32(this.i2,this.i1 + 4);
         mstate.esp = mstate.esp - 8;
         this.i2 = 0;
         si32(this.i2,mstate.esp);
         si32(this.i3,mstate.esp + 4);
         state = 2;
         mstate.esp = mstate.esp - 4;
         FSM_drft_init.start();
      }
   }
}
