package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_res0_unpack extends Machine
   {
      
      public static const intRegCount:int = 14;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i10:int;
      
      public var i11:int;
      
      public var i12:int;
      
      public var i13:int;
      
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
      
      public function FSM_res0_unpack()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_res0_unpack = null;
         _loc1_ = new FSM_res0_unpack();
         FSM_res0_unpack.gworker = _loc1_;
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
               this.i0 = 2840;
               mstate.esp = mstate.esp - 8;
               this.i1 = 0;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               state = 1;
               mstate.esp = mstate.esp - 4;
               FSM_res0_unpack.start();
               return;
            case 1:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i1 = li32(mstate.ebp + 8);
               this.i2 = li32(mstate.ebp + 12);
               if(this.i0 != 0)
               {
                  this.i3 = 0;
                  this.i4 = this.i0;
                  this.i5 = 2840;
                  memset(this.i4,this.i3,this.i5);
               }
               this.i3 = 24;
               this.i1 = li32(this.i1 + 28);
               mstate.esp = mstate.esp - 8;
               si32(this.i2,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_res0_unpack.start();
            case 2:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               si32(this.i4,this.i0);
               mstate.esp = mstate.esp - 8;
               si32(this.i2,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_res0_unpack.start();
            case 3:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               si32(this.i4,this.i0 + 4);
               mstate.esp = mstate.esp - 8;
               si32(this.i2,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_res0_unpack.start();
            case 4:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i3 = this.i3 + 1;
               si32(this.i3,this.i0 + 8);
               mstate.esp = mstate.esp - 8;
               this.i3 = 6;
               si32(this.i2,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_res0_unpack.start();
            case 5:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i3 = this.i3 + 1;
               si32(this.i3,this.i0 + 12);
               mstate.esp = mstate.esp - 8;
               this.i3 = 8;
               si32(this.i2,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_res0_unpack.start();
            case 6:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               si32(this.i3,this.i0 + 20);
               this.i4 = this.i0 + 20;
               this.i5 = this.i0 + 12;
               this.i6 = this.i0;
               this.i7 = this.i0;
               if(this.i3 >= 0)
               {
                  this.i3 = 0;
                  this.i8 = this.i6 + 24;
                  this.i9 = this.i3;
                  addr628:
                  loop0:
                  while(true)
                  {
                     this.i10 = this.i8;
                     this.i8 = this.i9;
                     this.i9 = this.i3;
                     this.i11 = li32(this.i5);
                     this.i3 = this.i10;
                     if(this.i11 <= this.i8)
                     {
                        this.i3 = 0;
                        this.i8 = this.i6 + 280;
                        addr730:
                        while(true)
                        {
                           this.i10 = this.i8;
                           if(this.i3 >= this.i9)
                           {
                              this.i2 = li32(this.i4);
                              this.i3 = li32(this.i1 + 24);
                              if(this.i2 < this.i3)
                              {
                                 this.i4 = 0;
                                 this.i6 = this.i6 + 280;
                                 while(true)
                                 {
                                    this.i8 = this.i6;
                                    this.i6 = this.i4;
                                    this.i4 = this.i8;
                                    if(this.i6 >= this.i9)
                                    {
                                       this.i2 = this.i2 << 2;
                                       this.i1 = this.i1 + this.i2;
                                       this.i1 = li32(this.i1 + 1824);
                                       this.i2 = li32(this.i1 + 4);
                                       this.i1 = li32(this.i1);
                                       if(this.i1 >= 1)
                                       {
                                          this.i3 = 1;
                                          while(true)
                                          {
                                             this.i4 = this.i1;
                                             this.i1 = this.i3;
                                             if(this.i4 <= 0)
                                             {
                                                si32(this.i1,this.i7 + 16);
                                                break;
                                             }
                                             this.i3 = li32(this.i5);
                                             this.i3 = this.i3 * this.i1;
                                             if(this.i3 <= this.i2)
                                             {
                                                this.i1 = this.i4 + -1;
                                                continue;
                                             }
                                             break loop0;
                                          }
                                          mstate.eax = this.i0;
                                          break loop10;
                                       }
                                       break loop0;
                                    }
                                    this.i4 = li32(this.i4);
                                    if(this.i4 < this.i3)
                                    {
                                       this.i4 = this.i4 << 2;
                                       this.i4 = this.i1 + this.i4;
                                       this.i4 = li32(this.i4 + 1824);
                                       this.i4 = li32(this.i4 + 12);
                                       if(this.i4 != 0)
                                       {
                                          this.i4 = this.i8 + 4;
                                          this.i8 = this.i6 + 1;
                                          this.i6 = this.i4;
                                          this.i4 = this.i8;
                                          continue;
                                       }
                                       break loop0;
                                    }
                                    break loop0;
                                 }
                              }
                              break loop0;
                           }
                           this.i11 = 8;
                           mstate.esp = mstate.esp - 8;
                           si32(this.i2,mstate.esp);
                           si32(this.i11,mstate.esp + 4);
                           mstate.esp = mstate.esp - 4;
                           FSM_res0_unpack.start();
                        }
                     }
                     else
                     {
                        this.i11 = 3;
                        mstate.esp = mstate.esp - 8;
                        si32(this.i2,mstate.esp);
                        si32(this.i11,mstate.esp + 4);
                        mstate.esp = mstate.esp - 4;
                        FSM_res0_unpack.start();
                     }
                  }
               }
               addr969:
               if(this.i0 != 0)
               {
                  this.i1 = 0;
                  this.i2 = this.i0;
                  this.i3 = 2840;
                  memset(this.i2,this.i1,this.i3);
                  mstate.esp = mstate.esp - 8;
                  si32(this.i0,mstate.esp);
                  si32(this.i1,mstate.esp + 4);
                  state = 11;
                  mstate.esp = mstate.esp - 4;
                  FSM_res0_unpack.start();
                  return;
               }
               this.i0 = 0;
               §§goto(addr938);
            case 7:
               while(true)
               {
                  this.i11 = mstate.eax;
                  mstate.esp = mstate.esp + 8;
                  mstate.esp = mstate.esp - 8;
                  this.i12 = 1;
                  si32(this.i2,mstate.esp);
                  si32(this.i12,mstate.esp + 4);
                  mstate.esp = mstate.esp - 4;
                  FSM_res0_unpack.start();
               }
            case 8:
               while(true)
               {
                  this.i12 = mstate.eax;
                  mstate.esp = mstate.esp + 8;
                  if(this.i12 >= 0)
                  {
                     if(this.i12 == 0)
                     {
                        addr546:
                        while(true)
                        {
                           this.i12 = 0;
                           si32(this.i11,this.i3);
                           this.i3 = this.i12;
                           while(true)
                           {
                              this.i12 = this.i3;
                              this.i3 = this.i11;
                              if(this.i3 == 0)
                              {
                                 break;
                              }
                              this.i11 = this.i3 & 1;
                              this.i13 = this.i3 >>> 1;
                              this.i3 = this.i11 + this.i12;
                              this.i11 = this.i13;
                           }
                           this.i3 = this.i10 + 4;
                           this.i10 = this.i8 + 1;
                           this.i11 = this.i12 + this.i9;
                           this.i8 = this.i3;
                           this.i9 = this.i10;
                           this.i3 = this.i11;
                           §§goto(addr628);
                        }
                     }
                     else
                     {
                        this.i12 = 5;
                        mstate.esp = mstate.esp - 8;
                        si32(this.i2,mstate.esp);
                        si32(this.i12,mstate.esp + 4);
                        mstate.esp = mstate.esp - 4;
                        FSM_res0_unpack.start();
                     }
                  }
                  §§goto(addr969);
               }
            case 9:
               while(true)
               {
                  this.i12 = mstate.eax;
                  mstate.esp = mstate.esp + 8;
                  if(this.i12 >= 0)
                  {
                     this.i12 = this.i12 << 3;
                     this.i11 = this.i12 | this.i11;
                     §§goto(addr546);
                  }
                  §§goto(addr969);
               }
            case 10:
               while(true)
               {
                  this.i11 = mstate.eax;
                  mstate.esp = mstate.esp + 8;
                  if(this.i11 >= 0)
                  {
                     si32(this.i11,this.i10);
                     this.i8 = this.i8 + 4;
                     this.i3 = this.i3 + 1;
                     §§goto(addr730);
                  }
                  §§goto(addr969);
               }
            case 11:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               mstate.eax = this.i1;
         }
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
