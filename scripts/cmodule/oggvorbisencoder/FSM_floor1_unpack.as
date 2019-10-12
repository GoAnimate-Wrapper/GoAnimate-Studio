package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_floor1_unpack extends Machine
   {
      
      public static const intRegCount:int = 17;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i10:int;
      
      public var i11:int;
      
      public var i12:int;
      
      public var i13:int;
      
      public var i14:int;
      
      public var i15:int;
      
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
      
      public function FSM_floor1_unpack()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_floor1_unpack = null;
         _loc1_ = new FSM_floor1_unpack();
         FSM_floor1_unpack.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 272;
               this.i0 = 1120;
               this.i1 = li32(mstate.ebp + 8);
               this.i1 = li32(this.i1 + 28);
               mstate.esp = mstate.esp - 8;
               this.i2 = 0;
               si32(this.i2,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               state = 1;
               mstate.esp = mstate.esp - 4;
               FSM_floor1_unpack.start();
               return;
            case 1:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = mstate.ebp + -272;
               this.i3 = li32(mstate.ebp + 12);
               if(this.i0 != 0)
               {
                  this.i4 = 0;
                  this.i5 = this.i0;
                  this.i6 = 1120;
                  memset(this.i5,this.i4,this.i6);
               }
               this.i4 = 5;
               mstate.esp = mstate.esp - 8;
               si32(this.i3,mstate.esp);
               si32(this.i4,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_floor1_unpack.start();
            case 2:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               si32(this.i4,this.i0);
               this.i4 = -1;
               this.i5 = this.i0 + 4;
               this.i6 = 0;
               this.i7 = this.i0;
               this.i8 = this.i0;
               this.i9 = this.i0;
               addr278:
               while(true)
               {
                  this.i10 = this.i5;
                  this.i5 = this.i6;
                  this.i11 = li32(this.i7);
                  this.i6 = this.i10;
                  if(this.i11 <= this.i5)
                  {
                     this.i5 = 0;
                     this.i6 = this.i8 + 320;
                     this.i1 = this.i1 + 24;
                     this.i4 = this.i4 + 1;
                     this.i10 = this.i8;
                     addr669:
                     while(true)
                     {
                        this.i11 = this.i6;
                        this.i6 = this.i10;
                        if(this.i4 <= this.i5)
                        {
                           this.i1 = 2;
                           mstate.esp = mstate.esp - 8;
                           si32(this.i3,mstate.esp);
                           si32(this.i1,mstate.esp + 4);
                           mstate.esp = mstate.esp - 4;
                           FSM_floor1_unpack.start();
                        }
                        else
                        {
                           this.i10 = 3;
                           mstate.esp = mstate.esp - 8;
                           si32(this.i3,mstate.esp);
                           si32(this.i10,mstate.esp + 4);
                           mstate.esp = mstate.esp - 4;
                           FSM_floor1_unpack.start();
                        }
                     }
                  }
                  else
                  {
                     this.i11 = 4;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i3,mstate.esp);
                     si32(this.i11,mstate.esp + 4);
                     mstate.esp = mstate.esp - 4;
                     FSM_floor1_unpack.start();
                  }
               }
               if(this.i0 == 0)
               {
                  this.i0 = 0;
                  addr1189:
                  mstate.eax = this.i0;
                  break;
               }
               this.i1 = 0;
               this.i2 = this.i0;
               this.i3 = 1120;
               memset(this.i2,this.i1,this.i3);
               mstate.esp = mstate.esp - 8;
               si32(this.i0,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               state = 12;
               mstate.esp = mstate.esp - 4;
               FSM_floor1_unpack.start();
               return;
            case 3:
               while(true)
               {
                  this.i11 = mstate.eax;
                  mstate.esp = mstate.esp + 8;
                  si32(this.i11,this.i6);
                  if(this.i11 >= 0)
                  {
                     this.i4 = this.i11 > this.i4?int(this.i11):int(this.i4);
                     this.i6 = this.i10 + 4;
                     this.i10 = this.i5 + 1;
                     this.i5 = this.i6;
                     this.i6 = this.i10;
                     §§goto(addr278);
                  }
                  §§goto(addr1179);
               }
            case 4:
               while(true)
               {
                  this.i10 = mstate.eax;
                  mstate.esp = mstate.esp + 8;
                  this.i10 = this.i10 + 1;
                  si32(this.i10,this.i6 + 128);
                  mstate.esp = mstate.esp - 8;
                  this.i10 = 2;
                  si32(this.i3,mstate.esp);
                  si32(this.i10,mstate.esp + 4);
                  mstate.esp = mstate.esp - 4;
                  FSM_floor1_unpack.start();
               }
            case 5:
               while(true)
               {
                  this.i10 = mstate.eax;
                  mstate.esp = mstate.esp + 8;
                  si32(this.i10,this.i6 + 192);
                  this.i12 = this.i6 + 192;
                  if(this.i10 >= 0)
                  {
                     if(this.i10 != 0)
                     {
                        this.i10 = 8;
                        mstate.esp = mstate.esp - 8;
                        si32(this.i3,mstate.esp);
                        si32(this.i10,mstate.esp + 4);
                        mstate.esp = mstate.esp - 4;
                        FSM_floor1_unpack.start();
                     }
                     addr491:
                     while(true)
                     {
                        this.i10 = li32(this.i6 + 256);
                        if(this.i10 >= 0)
                        {
                           this.i13 = li32(this.i1);
                           if(this.i10 < this.i13)
                           {
                              this.i10 = 0;
                              this.i13 = this.i11;
                              addr610:
                              while(true)
                              {
                                 this.i14 = this.i13;
                                 this.i13 = this.i10;
                                 this.i15 = 1;
                                 this.i16 = li32(this.i12);
                                 this.i10 = this.i14;
                                 this.i15 = this.i15 << this.i16;
                                 if(this.i15 <= this.i13)
                                 {
                                    this.i10 = this.i11 + 32;
                                    this.i11 = this.i6 + 4;
                                    this.i5 = this.i5 + 1;
                                    this.i6 = this.i10;
                                    this.i10 = this.i11;
                                    §§goto(addr669);
                                 }
                                 else
                                 {
                                    this.i15 = 8;
                                    mstate.esp = mstate.esp - 8;
                                    si32(this.i3,mstate.esp);
                                    si32(this.i15,mstate.esp + 4);
                                    mstate.esp = mstate.esp - 4;
                                    FSM_floor1_unpack.start();
                                 }
                              }
                           }
                        }
                     }
                  }
                  §§goto(addr1179);
               }
            case 6:
               while(true)
               {
                  this.i10 = mstate.eax;
                  mstate.esp = mstate.esp + 8;
                  si32(this.i10,this.i6 + 256);
                  §§goto(addr491);
               }
            case 7:
               while(true)
               {
                  this.i15 = mstate.eax;
                  mstate.esp = mstate.esp + 8;
                  this.i15 = this.i15 + -1;
                  si32(this.i15,this.i10);
                  if(this.i15 >= -1)
                  {
                     this.i10 = li32(this.i1);
                     if(this.i15 < this.i10)
                     {
                        this.i10 = this.i14 + 4;
                        this.i14 = this.i13 + 1;
                        this.i13 = this.i10;
                        this.i10 = this.i14;
                        §§goto(addr610);
                     }
                  }
                  §§goto(addr1179);
               }
            case 8:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i1 = this.i1 + 1;
               si32(this.i1,this.i9 + 832);
               mstate.esp = mstate.esp - 8;
               this.i1 = 4;
               si32(this.i3,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_floor1_unpack.start();
            case 9:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i1 >= 0)
               {
                  this.i4 = 1;
                  this.i5 = 0;
                  this.i6 = this.i8 + 4;
                  this.i4 = this.i4 << this.i1;
                  this.i10 = this.i5;
                  this.i11 = this.i5;
                  while(true)
                  {
                     this.i12 = this.i6;
                     this.i13 = this.i10;
                     this.i10 = this.i11;
                     this.i6 = this.i5;
                     this.i11 = li32(this.i7);
                     this.i5 = this.i12;
                     if(this.i11 <= this.i13)
                     {
                        break;
                     }
                     addr932:
                     this.i5 = li32(this.i5);
                     this.i5 = this.i5 << 2;
                     this.i5 = this.i9 + this.i5;
                     this.i11 = this.i10 << 2;
                     this.i5 = li32(this.i5 + 128);
                     this.i11 = this.i8 + this.i11;
                     this.i11 = this.i11 + 844;
                     this.i5 = this.i5 + this.i6;
                     this.i6 = this.i11;
                     while(true)
                     {
                        this.i11 = this.i6;
                        this.i14 = this.i10;
                        this.i6 = this.i11;
                        if(this.i14 >= this.i5)
                        {
                           break;
                        }
                        mstate.esp = mstate.esp - 8;
                        si32(this.i3,mstate.esp);
                        si32(this.i1,mstate.esp + 4);
                        mstate.esp = mstate.esp - 4;
                        FSM_floor1_unpack.start();
                     }
                     this.i6 = this.i12 + 4;
                     this.i10 = this.i13 + 1;
                     this.i11 = this.i14;
                  }
                  this.i1 = 0;
                  si32(this.i1,this.i9 + 836);
                  si32(this.i4,this.i9 + 840);
                  this.i3 = this.i8 + 836;
                  this.i4 = this.i6 + 2;
                  this.i5 = this.i1;
                  while(this.i4 > this.i1)
                  {
                     this.i6 = this.i2 + this.i5;
                     this.i7 = this.i3 + this.i5;
                     si32(this.i7,this.i6);
                     this.i5 = this.i5 + 4;
                     this.i1 = this.i1 + 1;
                  }
                  this.i1 = FSM_floor1_unpack;
                  mstate.esp = mstate.esp - 12;
                  this.i3 = mstate.ebp + -272;
                  si32(this.i3,mstate.esp);
                  si32(this.i4,mstate.esp + 4);
                  si32(this.i1,mstate.esp + 8);
                  state = 11;
                  mstate.esp = mstate.esp - 4;
                  FSM_floor1_unpack.start();
                  return;
               }
               §§goto(addr1179);
            case 10:
               while(true)
               {
                  this.i10 = mstate.eax;
                  mstate.esp = mstate.esp + 8;
                  si32(this.i10,this.i6);
                  if(this.i4 > this.i10)
                  {
                     if(this.i10 >= 0)
                     {
                        this.i6 = this.i11 + 4;
                        this.i10 = this.i14 + 1;
                        §§goto(addr932);
                     }
                  }
                  §§goto(addr1179);
               }
            case 11:
               mstate.esp = mstate.esp + 12;
               this.i1 = 1;
               while(true)
               {
                  this.i3 = this.i2;
                  if(this.i4 <= this.i1)
                  {
                     break;
                  }
                  this.i3 = li32(this.i3);
                  this.i5 = li32(this.i2 + 4);
                  this.i3 = li32(this.i3);
                  this.i5 = li32(this.i5);
                  if(this.i3 != this.i5)
                  {
                     this.i2 = this.i2 + 4;
                     this.i1 = this.i1 + 1;
                     continue;
                  }
                  §§goto(addr1179);
               }
               §§goto(addr1189);
            case 12:
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
