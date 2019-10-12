package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li16;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si16;
   import avm2.intrinsics.memory.si32;
   import avm2.intrinsics.memory.si8;
   
   public final class FSM___srefill extends Machine
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
      
      public function FSM___srefill()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM___srefill = null;
         _loc1_ = new FSM___srefill();
         FSM___srefill.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         loop6:
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 0;
               this.i0 = li32(mstate.ebp + 8);
               this.i1 = li8(FSM___srefill);
               if(this.i1 == 0)
               {
                  this.i1 = FSM___srefill;
                  this.i2 = FSM___srefill;
                  this.i3 = 0;
                  this.i1 = this.i1 + 56;
                  while(true)
                  {
                     si32(this.i2,this.i1);
                     this.i2 = this.i2 + 152;
                     this.i1 = this.i1 + 88;
                     this.i3 = this.i3 + 1;
                     if(this.i3 != 17)
                     {
                        continue;
                     }
                     break;
                  }
                  this.i1 = 1;
                  si8(this.i1,FSM___srefill);
                  si8(this.i1,FSM___srefill);
               }
               this.i1 = li32(this.i0 + 56);
               this.i2 = li32(this.i1 + 16);
               this.i1 = this.i1 + 16;
               this.i3 = this.i0 + 56;
               if(this.i2 == 0)
               {
                  this.i2 = -1;
                  si32(this.i2,this.i1);
               }
               this.i1 = 0;
               si32(this.i1,this.i0 + 4);
               this.i1 = li16(this.i0 + 12);
               this.i2 = this.i0 + 12;
               this.i4 = this.i0 + 4;
               this.i5 = this.i1;
               this.i6 = this.i1 & 32;
               if(this.i6 != 0)
               {
                  addr191:
                  addr1126:
                  this.i0 = -1;
                  addr1126:
                  mstate.eax = this.i0;
               }
               else
               {
                  this.i6 = this.i5 & 4;
                  if(this.i6 == 0)
                  {
                     this.i3 = this.i5 & 16;
                     if(this.i3 == 0)
                     {
                        this.i0 = 9;
                        si32(this.i0,FSM___srefill);
                        this.i0 = li16(this.i2);
                        addr1112:
                        this.i0 = this.i0 | 64;
                        si16(this.i0,this.i2);
                        this.i0 = -1;
                        §§goto(addr1126);
                     }
                     else
                     {
                        this.i3 = this.i5 & 8;
                        if(this.i3 != 0)
                        {
                           mstate.esp = mstate.esp - 4;
                           si32(this.i0,mstate.esp);
                           state = 1;
                           mstate.esp = mstate.esp - 4;
                           FSM___srefill.start();
                           return;
                        }
                        this.i3 = this.i1 | 4;
                        si16(this.i3,this.i2);
                        this.i3 = li32(this.i0 + 16);
                        if(this.i3 == 0)
                        {
                           addr495:
                           mstate.esp = mstate.esp - 4;
                           si32(this.i0,mstate.esp);
                           state = 3;
                           mstate.esp = mstate.esp - 4;
                           FSM___srefill.start();
                           return;
                        }
                     }
                  }
                  else
                  {
                     this.i1 = li32(this.i0 + 48);
                     this.i5 = this.i0 + 48;
                     if(this.i1 != 0)
                     {
                        this.i6 = this.i0 + 64;
                        if(this.i1 != this.i6)
                        {
                           this.i6 = 0;
                           mstate.esp = mstate.esp - 8;
                           si32(this.i1,mstate.esp);
                           si32(this.i6,mstate.esp + 4);
                           state = 2;
                           mstate.esp = mstate.esp - 4;
                           FSM___srefill.start();
                           return;
                        }
                        addr434:
                        this.i1 = 0;
                        si32(this.i1,this.i5);
                        this.i1 = li32(this.i0 + 60);
                        si32(this.i1,this.i4);
                        if(this.i1 != 0)
                        {
                           this.i2 = 0;
                           this.i4 = li32(this.i3);
                           this.i4 = li32(this.i4);
                           si32(this.i4,this.i0);
                           mstate.eax = this.i2;
                        }
                     }
                     this.i1 = li32(this.i0 + 16);
                     if(this.i1 == 0)
                     {
                        §§goto(addr495);
                     }
                  }
                  addr525:
                  this.i1 = li16(this.i2);
                  this.i3 = this.i1 & 3;
                  if(this.i3 != 0)
                  {
                     this.i3 = FSM___srefill;
                     this.i1 = this.i1 | -32768;
                     si16(this.i1,this.i2);
                     this.i1 = 0;
                     loop1:
                     while(true)
                     {
                        this.i5 = li32(this.i3 + 4);
                        this.i6 = li32(this.i3 + 8);
                        this.i7 = this.i5 + -1;
                        if(this.i7 > -1)
                        {
                           this.i5 = this.i5 + -1;
                           loop2:
                           while(true)
                           {
                              this.i7 = li16(this.i6 + 12);
                              this.i8 = this.i7 << 16;
                              this.i9 = this.i6;
                              this.i8 = this.i8 >> 16;
                              if(this.i8 > 0)
                              {
                                 this.i7 = this.i7 & 9;
                                 if(this.i7 != 9)
                                 {
                                    this.i9 = 0;
                                    addr673:
                                    while(true)
                                    {
                                       this.i7 = this.i9;
                                       this.i1 = this.i7 | this.i1;
                                    }
                                 }
                                 else
                                 {
                                    break;
                                 }
                              }
                              while(true)
                              {
                                 this.i6 = this.i6 + 88;
                                 this.i5 = this.i5 + -1;
                                 if(this.i5 > -1)
                                 {
                                    continue loop2;
                                 }
                              }
                           }
                           mstate.esp = mstate.esp - 4;
                           si32(this.i9,mstate.esp);
                           state = 4;
                           mstate.esp = mstate.esp - 4;
                           FSM___srefill.start();
                           return;
                        }
                        while(true)
                        {
                           this.i3 = li32(this.i3);
                           if(this.i3 != 0)
                           {
                              continue loop1;
                           }
                           break loop1;
                        }
                        break loop6;
                     }
                     this.i1 = li16(this.i2);
                     this.i3 = this.i1 & 32767;
                     si16(this.i3,this.i2);
                     this.i1 = this.i1 & 9;
                     if(this.i1 == 9)
                     {
                        mstate.esp = mstate.esp - 4;
                        si32(this.i0,mstate.esp);
                        state = 5;
                        mstate.esp = mstate.esp - 4;
                        FSM___srefill.start();
                        return;
                     }
                     break;
                  }
                  break;
               }
               addr1130:
               mstate.esp = mstate.ebp;
               mstate.ebp = li32(mstate.esp);
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp + 4;
               mstate.gworker = caller;
               return;
            case 1:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               if(this.i1 == 0)
               {
                  this.i1 = 0;
                  this.i3 = li16(this.i2);
                  si32(this.i1,this.i0 + 8);
                  this.i3 = this.i3 | 4;
                  si32(this.i1,this.i0 + 24);
                  this.i1 = this.i3 & -9;
                  si16(this.i1,this.i2);
                  this.i1 = li32(this.i0 + 16);
                  if(this.i1 != 0)
                  {
                     §§goto(addr525);
                  }
                  else
                  {
                     §§goto(addr495);
                  }
               }
               else
               {
                  §§goto(addr191);
               }
            case 2:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr434);
            case 3:
               mstate.esp = mstate.esp + 4;
               §§goto(addr525);
            case 4:
               this.i9 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               §§goto(addr673);
            case 5:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               break;
            case 6:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               if(this.i1 >= 1)
               {
                  this.i3 = li16(this.i2);
                  this.i5 = this.i3 & 4096;
                  if(this.i5 != 0)
                  {
                     this.i5 = 2147483647;
                     this.i6 = li32(this.i0 + 80);
                     this.i7 = li32(this.i0 + 84);
                     this.i8 = this.i1 >> 31;
                     this.i9 = -1;
                     this.i9 = __subc(this.i9,this.i1);
                     this.i5 = __sube(this.i5,this.i8);
                     this.i0 = this.i0 + 80;
                     this.i10 = this.i7 > this.i5?1:0;
                     this.i9 = uint(this.i6) > uint(this.i9)?1:0;
                     this.i5 = this.i7 == this.i5?1:0;
                     this.i11 = this.i1;
                     this.i5 = this.i5 != 0?int(this.i9):int(this.i10);
                     if(this.i5 == 0)
                     {
                        this.i3 = __addc(this.i6,this.i11);
                        this.i5 = __adde(this.i7,this.i8);
                        si32(this.i3,this.i0);
                        si32(this.i5,this.i0 + 4);
                     }
                     else
                     {
                        this.i0 = this.i3 & -4097;
                        si16(this.i0,this.i2);
                     }
                  }
               }
               else if(this.i1 <= -1)
               {
                  this.i0 = li16(this.i2);
                  this.i0 = this.i0 & -4097;
                  si16(this.i0,this.i2);
               }
               si32(this.i1,this.i4);
               this.i0 = li16(this.i2);
               this.i0 = this.i0 & -8193;
               si16(this.i0,this.i2);
               if(this.i1 >= 1)
               {
                  this.i0 = 0;
               }
               else
               {
                  if(this.i1 == 0)
                  {
                     this.i4 = -1;
                     this.i0 = this.i0 | 32;
                     si16(this.i0,this.i2);
                     mstate.eax = this.i4;
                  }
                  else
                  {
                     this.i1 = 0;
                     si32(this.i1,this.i4);
                     §§goto(addr1112);
                  }
                  §§goto(addr1130);
               }
               §§goto(addr1126);
         }
         this.i1 = li32(this.i0 + 16);
         si32(this.i1,this.i0);
         this.i3 = li32(this.i0 + 20);
         this.i5 = li32(this.i0 + 36);
         this.i6 = li32(this.i0 + 28);
         mstate.esp = mstate.esp - 12;
         si32(this.i6,mstate.esp);
         si32(this.i1,mstate.esp + 4);
         si32(this.i3,mstate.esp + 8);
         state = 6;
         mstate.esp = mstate.esp - 4;
         mstate.funcs[this.i5]();
      }
   }
}
