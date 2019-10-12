package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_mapping0_unpack extends Machine
   {
      
      public static const intRegCount:int = 12;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i10:int;
      
      public var i11:int;
      
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
      
      public function FSM_mapping0_unpack()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_mapping0_unpack = null;
         _loc1_ = new FSM_mapping0_unpack();
         FSM_mapping0_unpack.gworker = _loc1_;
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
               this.i0 = 3208;
               mstate.esp = mstate.esp - 8;
               this.i1 = 0;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               state = 1;
               mstate.esp = mstate.esp - 4;
               FSM_mapping0_unpack.start();
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
                  this.i5 = 3208;
                  memset(this.i4,this.i3,this.i5);
               }
               this.i3 = 0;
               this.i4 = li32(this.i1 + 28);
               this.i5 = this.i0;
               this.i6 = 3208;
               memset(this.i5,this.i3,this.i6);
               mstate.esp = mstate.esp - 8;
               this.i3 = 1;
               si32(this.i2,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_mapping0_unpack.start();
            case 2:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i5 = this.i0;
               this.i6 = this.i0;
               if(this.i3 >= 0)
               {
                  if(this.i3 != 0)
                  {
                     this.i3 = 4;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i2,mstate.esp);
                     si32(this.i3,mstate.esp + 4);
                     mstate.esp = mstate.esp - 4;
                     FSM_mapping0_unpack.start();
                  }
                  else
                  {
                     this.i3 = 1;
                     si32(this.i3,this.i0);
                  }
                  addr271:
                  this.i3 = 1;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i2,mstate.esp);
                  si32(this.i3,mstate.esp + 4);
                  mstate.esp = mstate.esp - 4;
                  FSM_mapping0_unpack.start();
               }
               addr252:
               if(this.i0 == 0)
               {
                  this.i0 = 0;
                  addr999:
                  mstate.eax = this.i0;
                  break;
               }
               this.i1 = 0;
               this.i2 = this.i0;
               this.i3 = 3208;
               memset(this.i2,this.i1,this.i3);
               mstate.esp = mstate.esp - 8;
               si32(this.i0,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               state = 15;
               mstate.esp = mstate.esp - 4;
               FSM_mapping0_unpack.start();
               return;
            case 3:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i3 = this.i3 + 1;
               si32(this.i3,this.i0);
               if(this.i3 >= 1)
               {
                  §§goto(addr271);
               }
               §§goto(addr252);
            case 4:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i3 >= 0)
               {
                  if(this.i3 != 0)
                  {
                     this.i3 = 8;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i2,mstate.esp);
                     si32(this.i3,mstate.esp + 4);
                     mstate.esp = mstate.esp - 4;
                     FSM_mapping0_unpack.start();
                  }
                  addr614:
                  this.i3 = 2;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i2,mstate.esp);
                  si32(this.i3,mstate.esp + 4);
                  mstate.esp = mstate.esp - 4;
                  FSM_mapping0_unpack.start();
               }
               addr251:
               §§goto(addr252);
            case 5:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i3 = this.i3 + 1;
               si32(this.i3,this.i6 + 1156);
               this.i6 = this.i6 + 1156;
               if(this.i3 >= 1)
               {
                  this.i3 = 0;
                  this.i7 = this.i1 + 4;
                  this.i8 = this.i5;
                  addr603:
                  while(true)
                  {
                     this.i9 = li32(this.i6);
                     if(this.i9 <= this.i3)
                     {
                        §§goto(addr614);
                     }
                     else
                     {
                        this.i9 = li32(this.i7);
                        mstate.esp = mstate.esp - 4;
                        si32(this.i9,mstate.esp);
                        mstate.esp = mstate.esp - 4;
                        FSM_mapping0_unpack.start();
                     }
                  }
               }
               §§goto(addr251);
            case 6:
               while(true)
               {
                  this.i9 = mstate.eax;
                  mstate.esp = mstate.esp + 4;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i2,mstate.esp);
                  si32(this.i9,mstate.esp + 4);
                  mstate.esp = mstate.esp - 4;
                  FSM_mapping0_unpack.start();
               }
            case 7:
               while(true)
               {
                  this.i9 = mstate.eax;
                  mstate.esp = mstate.esp + 8;
                  si32(this.i9,this.i8 + 1160);
                  this.i10 = li32(this.i7);
                  mstate.esp = mstate.esp - 4;
                  si32(this.i10,mstate.esp);
                  mstate.esp = mstate.esp - 4;
                  FSM_mapping0_unpack.start();
               }
            case 8:
               while(true)
               {
                  this.i10 = mstate.eax;
                  mstate.esp = mstate.esp + 4;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i2,mstate.esp);
                  si32(this.i10,mstate.esp + 4);
                  mstate.esp = mstate.esp - 4;
                  FSM_mapping0_unpack.start();
               }
            case 9:
               while(true)
               {
                  this.i10 = mstate.eax;
                  mstate.esp = mstate.esp + 8;
                  si32(this.i10,this.i8 + 2184);
                  if(this.i9 >= 0)
                  {
                     if(this.i10 >= 0)
                     {
                        if(this.i9 != this.i10)
                        {
                           this.i11 = li32(this.i7);
                           if(this.i11 > this.i9)
                           {
                              if(this.i11 > this.i10)
                              {
                                 this.i8 = this.i8 + 4;
                                 this.i3 = this.i3 + 1;
                                 §§goto(addr603);
                              }
                           }
                        }
                     }
                  }
                  §§goto(addr251);
               }
            case 10:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i3 == 0)
               {
                  this.i3 = li32(this.i0);
                  this.i6 = this.i0;
                  if(this.i3 >= 2)
                  {
                     this.i3 = 0;
                     this.i7 = this.i5 + 4;
                     this.i1 = this.i1 + 4;
                     addr772:
                     while(true)
                     {
                        this.i8 = this.i7;
                        this.i7 = this.i3;
                        this.i9 = li32(this.i1);
                        this.i3 = this.i8;
                        if(this.i9 > this.i7)
                        {
                           this.i9 = 4;
                           mstate.esp = mstate.esp - 8;
                           si32(this.i2,mstate.esp);
                           si32(this.i9,mstate.esp + 4);
                           mstate.esp = mstate.esp - 4;
                           FSM_mapping0_unpack.start();
                        }
                     }
                  }
                  this.i1 = 0;
                  this.i3 = this.i4 + 20;
                  this.i4 = this.i4 + 16;
                  addr987:
                  while(true)
                  {
                     this.i7 = li32(this.i6);
                     if(this.i7 <= this.i1)
                     {
                        break;
                     }
                     this.i7 = 8;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i2,mstate.esp);
                     si32(this.i7,mstate.esp + 4);
                     mstate.esp = mstate.esp - 4;
                     FSM_mapping0_unpack.start();
                  }
                  §§goto(addr999);
               }
               §§goto(addr251);
            case 11:
               while(true)
               {
                  this.i9 = mstate.eax;
                  mstate.esp = mstate.esp + 8;
                  si32(this.i9,this.i3);
                  this.i3 = li32(this.i6);
                  if(this.i9 >= 0)
                  {
                     if(this.i9 < this.i3)
                     {
                        this.i3 = this.i8 + 4;
                        this.i8 = this.i7 + 1;
                        this.i7 = this.i3;
                        this.i3 = this.i8;
                        §§goto(addr772);
                     }
                  }
                  §§goto(addr251);
               }
            case 12:
               while(true)
               {
                  this.i8 = mstate.eax;
                  mstate.esp = mstate.esp + 8;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i2,mstate.esp);
                  si32(this.i7,mstate.esp + 4);
                  mstate.esp = mstate.esp - 4;
                  FSM_mapping0_unpack.start();
               }
            case 13:
               while(true)
               {
                  this.i7 = mstate.eax;
                  mstate.esp = mstate.esp + 8;
                  si32(this.i7,this.i5 + 1028);
                  this.i8 = li32(this.i4);
                  if(this.i7 >= 0)
                  {
                     if(this.i7 < this.i8)
                     {
                        this.i7 = 8;
                        mstate.esp = mstate.esp - 8;
                        si32(this.i2,mstate.esp);
                        si32(this.i7,mstate.esp + 4);
                        mstate.esp = mstate.esp - 4;
                        FSM_mapping0_unpack.start();
                     }
                  }
                  §§goto(addr251);
               }
            case 14:
               while(true)
               {
                  this.i7 = mstate.eax;
                  mstate.esp = mstate.esp + 8;
                  si32(this.i7,this.i5 + 1092);
                  this.i8 = li32(this.i3);
                  if(this.i7 >= 0)
                  {
                     if(this.i7 < this.i8)
                     {
                        this.i5 = this.i5 + 4;
                        this.i1 = this.i1 + 1;
                        §§goto(addr987);
                     }
                  }
                  §§goto(addr251);
               }
            case 15:
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
