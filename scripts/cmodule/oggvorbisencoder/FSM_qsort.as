package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   import avm2.intrinsics.memory.si8;
   
   public final class FSM_qsort extends Machine
   {
      
      public static const intRegCount:int = 20;
      
      public static const NumberRegCount:int = 0;
       
      
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
      
      public var i18:int;
      
      public function FSM_qsort()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_qsort = null;
         _loc1_ = new FSM_qsort();
         FSM_qsort.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         loop29:
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 0;
               this.i0 = li32(mstate.ebp + 8);
               this.i1 = li32(mstate.ebp + 12);
               this.i2 = li32(mstate.ebp + 16);
               this.i3 = this.i0 & 3;
               if(this.i3 != 0)
               {
                  loop0:
                  while(true)
                  {
                     if(uint(this.i1) >= uint(7))
                     {
                        this.i3 = 2;
                        addr90:
                        while(true)
                        {
                           this.i4 = this.i1 << 1;
                           this.i4 = this.i4 & -4;
                           this.i5 = this.i0 + this.i4;
                           this.i6 = this.i0;
                           if(uint(this.i1) <= uint(7))
                           {
                              this.i4 = this.i5;
                              addr1735:
                              while(true)
                              {
                                 if(this.i3 != 0)
                                 {
                                    addr1741:
                                    while(true)
                                    {
                                       this.i5 = this.i4;
                                       if(this.i3 >= 2)
                                       {
                                          this.i4 = 0;
                                          this.i7 = 4;
                                          while(true)
                                          {
                                             this.i8 = this.i6 + this.i4;
                                             this.i9 = this.i5 + this.i4;
                                             this.i10 = li8(this.i8);
                                             this.i11 = li8(this.i9);
                                             si8(this.i11,this.i8);
                                             si8(this.i10,this.i9);
                                             this.i7 = this.i7 + -1;
                                             this.i4 = this.i4 + 1;
                                             if(this.i7 >= 1)
                                             {
                                                continue;
                                             }
                                             break;
                                          }
                                       }
                                       else
                                       {
                                          this.i5 = li32(this.i0);
                                          this.i7 = li32(this.i4);
                                          si32(this.i7,this.i0);
                                          si32(this.i5,this.i4);
                                       }
                                       this.i4 = 0;
                                       this.i5 = this.i1 << 2;
                                       this.i5 = this.i5 + this.i0;
                                       this.i5 = this.i5 + -4;
                                       this.i7 = this.i0 + 4;
                                       this.i8 = this.i5;
                                       this.i9 = this.i7;
                                       addr2058:
                                       while(true)
                                       {
                                          this.i10 = this.i8;
                                          this.i11 = this.i5;
                                          this.i5 = this.i9;
                                          this.i12 = this.i7;
                                          if(uint(this.i5) <= uint(this.i11))
                                          {
                                             break;
                                          }
                                          this.i8 = this.i5;
                                          this.i5 = this.i12;
                                          this.i7 = this.i4;
                                          this.i9 = this.i10;
                                          this.i4 = this.i11;
                                       }
                                       this.i7 = this.i4;
                                       this.i8 = this.i10;
                                       this.i4 = this.i11;
                                       this.i9 = this.i5;
                                       this.i5 = this.i12;
                                       this.i11 = this.i7;
                                       this.i10 = this.i8;
                                       this.i12 = this.i4;
                                       this.i8 = this.i9;
                                       this.i9 = this.i5;
                                       mstate.esp = mstate.esp - 8;
                                       si32(this.i8,mstate.esp);
                                       si32(this.i0,mstate.esp + 4);
                                       state = 21;
                                       mstate.esp = mstate.esp - 4;
                                       mstate.funcs[this.i2]();
                                       return;
                                    }
                                 }
                                 else
                                 {
                                    addr1616:
                                    while(true)
                                    {
                                       this.i5 = li32(this.i0);
                                       this.i7 = li32(this.i4);
                                       this.i8 = this.i1 << 2;
                                       si32(this.i7,this.i0);
                                       this.i7 = this.i8 + -4;
                                       si32(this.i5,this.i4);
                                       this.i4 = this.i0 + this.i7;
                                       this.i5 = this.i0 + 4;
                                       if(this.i7 >= 4)
                                       {
                                          this.i7 = 0;
                                          this.i8 = this.i4;
                                          this.i9 = this.i5;
                                       }
                                       else
                                       {
                                          this.i7 = 0;
                                          this.i8 = this.i5;
                                          this.i9 = this.i4;
                                       }
                                       §§goto(addr2105);
                                    }
                                 }
                                 loop4:
                                 while(true)
                                 {
                                    addr2202:
                                    while(true)
                                    {
                                       this.i10 = this.i5;
                                       this.i5 = this.i7;
                                       this.i7 = this.i9;
                                       this.i9 = this.i8;
                                       addr2424:
                                       while(true)
                                       {
                                          this.i12 = this.i5;
                                          this.i11 = this.i7;
                                          this.i7 = this.i4;
                                          this.i4 = this.i7;
                                          this.i5 = this.i11;
                                          if(uint(this.i8) > uint(this.i7))
                                          {
                                             addr2454:
                                             while(true)
                                             {
                                                this.i4 = this.i12;
                                                this.i5 = this.i11;
                                                addr2664:
                                                while(true)
                                                {
                                                   this.i11 = this.i7;
                                                   if(uint(this.i8) <= uint(this.i7))
                                                   {
                                                      if(this.i3 == 0)
                                                      {
                                                         this.i4 = li32(this.i8);
                                                         this.i9 = li32(this.i7);
                                                         si32(this.i9,this.i8);
                                                         si32(this.i4,this.i7);
                                                      }
                                                      else if(this.i3 >= 2)
                                                      {
                                                         this.i4 = 0;
                                                         this.i12 = 4;
                                                         while(true)
                                                         {
                                                            this.i13 = this.i9 + this.i4;
                                                            this.i14 = this.i11 + this.i4;
                                                            this.i15 = li8(this.i13);
                                                            this.i16 = li8(this.i14);
                                                            si8(this.i16,this.i13);
                                                            si8(this.i15,this.i14);
                                                            this.i12 = this.i12 + -1;
                                                            this.i4 = this.i4 + 1;
                                                            if(this.i12 >= 1)
                                                            {
                                                               continue;
                                                            }
                                                            break;
                                                         }
                                                      }
                                                      else
                                                      {
                                                         this.i4 = li32(this.i8);
                                                         this.i9 = li32(this.i7);
                                                         si32(this.i9,this.i8);
                                                         si32(this.i4,this.i7);
                                                      }
                                                      this.i4 = 1;
                                                      this.i9 = this.i7 + -4;
                                                      this.i7 = this.i8 + 4;
                                                      this.i8 = this.i5;
                                                      this.i5 = this.i9;
                                                      this.i9 = this.i7;
                                                      this.i7 = this.i10;
                                                      §§goto(addr2058);
                                                   }
                                                   else
                                                   {
                                                      this.i7 = this.i1 << 2;
                                                      if(this.i4 == 0)
                                                      {
                                                         if(this.i7 >= 5)
                                                         {
                                                            this.i1 = 4;
                                                            loop20:
                                                            while(true)
                                                            {
                                                               this.i8 = this.i6 + this.i1;
                                                               addr2931:
                                                               while(true)
                                                               {
                                                                  this.i9 = this.i8;
                                                                  this.i8 = this.i9;
                                                                  if(uint(this.i9) > uint(this.i0))
                                                                  {
                                                                     break loop20;
                                                                  }
                                                                  addr3138:
                                                                  while(true)
                                                                  {
                                                                     this.i1 = this.i1 + 4;
                                                                     if(this.i7 > this.i1)
                                                                     {
                                                                        continue loop20;
                                                                     }
                                                                     break loop29;
                                                                  }
                                                               }
                                                            }
                                                            if(this.i3 == 0)
                                                            {
                                                               this.i5 = 0;
                                                               addr2960:
                                                               this.i10 = this.i5 << 2;
                                                               mstate.esp = mstate.esp - 8;
                                                               this.i10 = this.i9 - this.i10;
                                                               this.i11 = this.i8 + -4;
                                                               si32(this.i11,mstate.esp);
                                                               si32(this.i10,mstate.esp + 4);
                                                               state = 24;
                                                               mstate.esp = mstate.esp - 4;
                                                               mstate.funcs[this.i2]();
                                                               return;
                                                            }
                                                            mstate.esp = mstate.esp - 8;
                                                            this.i5 = this.i9 + -4;
                                                            si32(this.i5,mstate.esp);
                                                            si32(this.i9,mstate.esp + 4);
                                                            state = 25;
                                                            mstate.esp = mstate.esp - 4;
                                                            mstate.funcs[this.i2]();
                                                            return;
                                                         }
                                                         break loop29;
                                                      }
                                                      this.i4 = this.i10 - this.i6;
                                                      this.i10 = this.i9 - this.i10;
                                                      this.i4 = this.i10 <= this.i4?int(this.i10):int(this.i4);
                                                      this.i12 = this.i0 + this.i7;
                                                      if(this.i4 >= 1)
                                                      {
                                                         if(this.i3 >= 2)
                                                         {
                                                            this.i13 = 0;
                                                            this.i14 = this.i9 - this.i4;
                                                            while(true)
                                                            {
                                                               this.i15 = this.i6 + this.i13;
                                                               this.i16 = this.i14 + this.i13;
                                                               this.i17 = li8(this.i15);
                                                               this.i18 = li8(this.i16);
                                                               si8(this.i18,this.i15);
                                                               si8(this.i17,this.i16);
                                                               this.i4 = this.i4 + -1;
                                                               this.i13 = this.i13 + 1;
                                                               if(this.i4 >= 1)
                                                               {
                                                                  continue;
                                                               }
                                                            }
                                                         }
                                                         else
                                                         {
                                                            this.i13 = 0;
                                                            this.i14 = this.i8 - this.i4;
                                                            this.i4 = this.i4 >>> 2;
                                                            this.i15 = this.i0;
                                                            while(true)
                                                            {
                                                               this.i16 = this.i15 + this.i13;
                                                               this.i17 = this.i14 + this.i13;
                                                               this.i18 = li32(this.i16);
                                                               this.i19 = li32(this.i17);
                                                               si32(this.i19,this.i16);
                                                               si32(this.i18,this.i17);
                                                               this.i13 = this.i13 + 4;
                                                               this.i4 = this.i4 + -1;
                                                               if(this.i4 >= 1)
                                                               {
                                                                  continue;
                                                               }
                                                               break;
                                                            }
                                                         }
                                                      }
                                                      this.i4 = this.i12 - this.i5;
                                                      this.i5 = this.i5 - this.i11;
                                                      this.i4 = this.i4 + -4;
                                                      this.i4 = uint(this.i4) <= uint(this.i5)?int(this.i4):int(this.i5);
                                                      if(this.i4 >= 1)
                                                      {
                                                         this.i11 = this.i7 - this.i4;
                                                         if(this.i3 >= 2)
                                                         {
                                                            this.i8 = 0;
                                                            this.i11 = this.i6 - this.i4;
                                                            this.i1 = this.i1 << 2;
                                                            this.i1 = this.i11 + this.i1;
                                                            while(true)
                                                            {
                                                               this.i3 = this.i9 + this.i8;
                                                               this.i6 = this.i1 + this.i8;
                                                               this.i11 = li8(this.i3);
                                                               this.i12 = li8(this.i6);
                                                               si8(this.i12,this.i3);
                                                               si8(this.i11,this.i6);
                                                               this.i4 = this.i4 + -1;
                                                               this.i8 = this.i8 + 1;
                                                               if(this.i4 >= 1)
                                                               {
                                                                  continue;
                                                               }
                                                            }
                                                         }
                                                         else
                                                         {
                                                            this.i1 = 0;
                                                            this.i4 = this.i4 >>> 2;
                                                            this.i9 = this.i0 + this.i11;
                                                            while(true)
                                                            {
                                                               this.i3 = this.i8 + this.i1;
                                                               this.i6 = this.i9 + this.i1;
                                                               this.i11 = li32(this.i3);
                                                               this.i12 = li32(this.i6);
                                                               si32(this.i12,this.i3);
                                                               si32(this.i11,this.i6);
                                                               this.i1 = this.i1 + 4;
                                                               this.i4 = this.i4 + -1;
                                                               if(this.i4 >= 1)
                                                               {
                                                                  continue;
                                                               }
                                                               break;
                                                            }
                                                         }
                                                      }
                                                      if(uint(this.i10) >= uint(5))
                                                      {
                                                         mstate.esp = mstate.esp - 12;
                                                         this.i1 = this.i10 >>> 2;
                                                         si32(this.i0,mstate.esp);
                                                         si32(this.i1,mstate.esp + 4);
                                                         si32(this.i2,mstate.esp + 8);
                                                         state = 26;
                                                         mstate.esp = mstate.esp - 4;
                                                         FSM_qsort.start();
                                                         return;
                                                      }
                                                      addr3606:
                                                      while(uint(this.i5) >= uint(5))
                                                      {
                                                         this.i1 = this.i7 - this.i5;
                                                         this.i0 = this.i0 + this.i1;
                                                         this.i1 = this.i5 >>> 2;
                                                         this.i3 = this.i0 & 3;
                                                         if(this.i3 != 0)
                                                         {
                                                            continue loop0;
                                                         }
                                                      }
                                                      break loop29;
                                                   }
                                                }
                                             }
                                          }
                                          else
                                          {
                                             break loop4;
                                          }
                                          this.i4 = this.i4 + -4;
                                       }
                                    }
                                    mstate.esp = mstate.esp - 8;
                                    si32(this.i7,mstate.esp);
                                    si32(this.i0,mstate.esp + 4);
                                    state = 22;
                                    mstate.esp = mstate.esp - 4;
                                    mstate.funcs[this.i2]();
                                    return;
                                 }
                                 if(this.i3 == 0)
                                 {
                                    this.i7 = 0;
                                    addr2474:
                                    this.i11 = this.i7;
                                    this.i7 = this.i12;
                                    mstate.esp = mstate.esp - 8;
                                    this.i12 = this.i4 + this.i11;
                                    si32(this.i12,mstate.esp);
                                    si32(this.i0,mstate.esp + 4);
                                    state = 23;
                                    mstate.esp = mstate.esp - 4;
                                    mstate.funcs[this.i2]();
                                    return;
                                 }
                                 §§goto(addr2219);
                              }
                           }
                           else
                           {
                              this.i7 = this.i1 << 2;
                              this.i7 = this.i7 + -4;
                              this.i8 = this.i0 + this.i7;
                              if(uint(this.i1) <= uint(40))
                              {
                                 this.i4 = this.i8;
                                 this.i7 = this.i0;
                                 addr1431:
                                 mstate.esp = mstate.esp - 8;
                                 si32(this.i7,mstate.esp);
                                 si32(this.i5,mstate.esp + 4);
                                 state = 17;
                                 mstate.esp = mstate.esp - 4;
                                 mstate.funcs[this.i2]();
                                 return;
                              }
                              this.i9 = this.i1 >>> 1;
                              this.i9 = this.i9 & 2147483644;
                              mstate.esp = mstate.esp - 8;
                              this.i10 = this.i0 + this.i9;
                              si32(this.i0,mstate.esp);
                              si32(this.i10,mstate.esp + 4);
                              state = 3;
                              mstate.esp = mstate.esp - 4;
                              mstate.funcs[this.i2]();
                              return;
                           }
                        }
                        break loop29;
                     }
                     this.i3 = 2;
                     this.i4 = this.i0;
                     break;
                  }
                  this.i1 = this.i1 << 2;
                  this.i1 = this.i4 + this.i1;
                  this.i5 = this.i0;
                  this.i0 = this.i0 + 4;
                  if(uint(this.i1) <= uint(this.i0))
                  {
                     break;
                  }
                  this.i0 = this.i5 + 4;
                  loop10:
                  while(true)
                  {
                     this.i5 = this.i0;
                     addr262:
                     while(true)
                     {
                        this.i7 = this.i5;
                        this.i6 = this.i7;
                        if(uint(this.i7) > uint(this.i4))
                        {
                           break loop10;
                        }
                        addr469:
                        while(true)
                        {
                           this.i0 = this.i0 + 4;
                           if(uint(this.i1) > uint(this.i0))
                           {
                              continue loop10;
                           }
                           break loop29;
                        }
                     }
                  }
                  if(this.i3 == 0)
                  {
                     this.i5 = 0;
                     addr291:
                     this.i8 = this.i5 << 2;
                     mstate.esp = mstate.esp - 8;
                     this.i8 = this.i7 - this.i8;
                     this.i9 = this.i6 + -4;
                     si32(this.i9,mstate.esp);
                     si32(this.i8,mstate.esp + 4);
                     state = 1;
                     mstate.esp = mstate.esp - 4;
                     mstate.funcs[this.i2]();
                     return;
                  }
                  mstate.esp = mstate.esp - 8;
                  this.i5 = this.i7 + -4;
                  si32(this.i5,mstate.esp);
                  si32(this.i7,mstate.esp + 4);
                  state = 2;
                  mstate.esp = mstate.esp - 4;
                  mstate.funcs[this.i2]();
                  return;
               }
               while(true)
               {
                  if(uint(this.i1) >= uint(7))
                  {
                     this.i3 = 0;
                     §§goto(addr90);
                  }
                  else
                  {
                     this.i3 = 0;
                     this.i4 = this.i0;
                  }
                  §§goto(addr143);
               }
            case 1:
               this.i8 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i9 = this.i6;
               if(this.i8 >= 1)
               {
                  this.i8 = li32(this.i9);
                  this.i10 = li32(this.i6 + -4);
                  si32(this.i10,this.i9);
                  si32(this.i8,this.i6 + -4);
                  this.i5 = this.i5 + 1;
                  this.i6 = this.i6 + -4;
                  if(uint(this.i6) > uint(this.i4))
                  {
                  }
                  §§goto(addr291);
               }
               §§goto(addr469);
            case 2:
               this.i8 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i8 > 0)
               {
                  if(this.i3 >= 2)
                  {
                     this.i7 = 4;
                     do
                     {
                        this.i8 = li8(this.i6);
                        this.i9 = li8(this.i6 + -4);
                        si8(this.i9,this.i6);
                        si8(this.i8,this.i6 + -4);
                        this.i7 = this.i7 + -1;
                        this.i6 = this.i6 + 1;
                     }
                     while(this.i7 > 0);
                     
                  }
                  else
                  {
                     this.i6 = li32(this.i7);
                     this.i8 = li32(this.i5);
                     si32(this.i8,this.i7);
                     si32(this.i6,this.i5);
                  }
                  §§goto(addr262);
               }
               §§goto(addr469);
            case 3:
               this.i11 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i12 = this.i1 & -8;
               mstate.esp = mstate.esp - 8;
               this.i12 = this.i0 + this.i12;
               si32(this.i10,mstate.esp);
               si32(this.i12,mstate.esp + 4);
               state = 4;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[this.i2]();
               return;
            case 4:
               this.i13 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i14 = this.i1 >>> 3;
               if(this.i11 <= -1)
               {
                  if(this.i13 > -1)
                  {
                     mstate.esp = mstate.esp - 8;
                     si32(this.i0,mstate.esp);
                     si32(this.i12,mstate.esp + 4);
                     state = 5;
                     mstate.esp = mstate.esp - 4;
                     mstate.funcs[this.i2]();
                     return;
                  }
               }
               else if(this.i13 <= 0)
               {
                  mstate.esp = mstate.esp - 8;
                  si32(this.i0,mstate.esp);
                  si32(this.i12,mstate.esp + 4);
                  state = 6;
                  mstate.esp = mstate.esp - 4;
                  mstate.funcs[this.i2]();
                  return;
               }
               addr789:
               this.i11 = this.i4 - this.i9;
               mstate.esp = mstate.esp - 8;
               this.i11 = this.i0 + this.i11;
               si32(this.i11,mstate.esp);
               si32(this.i5,mstate.esp + 4);
               state = 7;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[this.i2]();
               return;
            case 5:
               this.i10 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i10 >= 0)
               {
                  addr724:
                  this.i10 = this.i0;
               }
               else
               {
                  addr785:
                  this.i10 = this.i12;
               }
               §§goto(addr789);
            case 6:
               this.i10 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i10 >= 0)
               {
                  §§goto(addr785);
               }
               else
               {
                  §§goto(addr724);
               }
               §§goto(addr789);
            case 7:
               this.i12 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i4 = this.i4 + this.i9;
               mstate.esp = mstate.esp - 8;
               this.i4 = this.i0 + this.i4;
               si32(this.i5,mstate.esp);
               si32(this.i4,mstate.esp + 4);
               state = 8;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[this.i2]();
               return;
            case 8:
               this.i13 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i12 <= -1)
               {
                  if(this.i13 > -1)
                  {
                     mstate.esp = mstate.esp - 8;
                     si32(this.i11,mstate.esp);
                     si32(this.i4,mstate.esp + 4);
                     state = 9;
                     mstate.esp = mstate.esp - 4;
                     mstate.funcs[this.i2]();
                     return;
                  }
               }
               else if(this.i13 <= 0)
               {
                  mstate.esp = mstate.esp - 8;
                  si32(this.i11,mstate.esp);
                  si32(this.i4,mstate.esp + 4);
                  state = 10;
                  mstate.esp = mstate.esp - 4;
                  mstate.funcs[this.i2]();
                  return;
               }
               this.i4 = this.i5;
               addr1040:
               this.i5 = this.i4;
               this.i4 = this.i14 << 3;
               this.i4 = this.i7 - this.i4;
               this.i7 = this.i7 - this.i9;
               mstate.esp = mstate.esp - 8;
               this.i4 = this.i0 + this.i4;
               this.i7 = this.i0 + this.i7;
               si32(this.i4,mstate.esp);
               si32(this.i7,mstate.esp + 4);
               state = 11;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[this.i2]();
               return;
            case 9:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i5 >= 0)
               {
                  addr979:
                  this.i4 = this.i11;
               }
               §§goto(addr1040);
            case 10:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i5 < 0)
               {
                  §§goto(addr979);
               }
               §§goto(addr1040);
            case 11:
               this.i9 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 8;
               si32(this.i7,mstate.esp);
               si32(this.i8,mstate.esp + 4);
               state = 12;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[this.i2]();
               return;
            case 12:
               this.i11 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i9 <= -1)
               {
                  if(this.i11 > -1)
                  {
                     mstate.esp = mstate.esp - 8;
                     si32(this.i4,mstate.esp);
                     si32(this.i8,mstate.esp + 4);
                     state = 13;
                     mstate.esp = mstate.esp - 4;
                     mstate.funcs[this.i2]();
                     return;
                  }
               }
               else if(this.i11 <= 0)
               {
                  mstate.esp = mstate.esp - 8;
                  si32(this.i4,mstate.esp);
                  si32(this.i8,mstate.esp + 4);
                  state = 16;
                  mstate.esp = mstate.esp - 4;
                  mstate.funcs[this.i2]();
                  return;
               }
               this.i4 = this.i7;
               this.i7 = this.i10;
               §§goto(addr1431);
            case 13:
               this.i7 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i7 >= 0)
               {
                  mstate.esp = mstate.esp - 8;
                  si32(this.i10,mstate.esp);
                  si32(this.i5,mstate.esp + 4);
                  state = 14;
                  mstate.esp = mstate.esp - 4;
                  mstate.funcs[this.i2]();
                  return;
               }
               addr1423:
               this.i4 = this.i8;
               this.i7 = this.i10;
               §§goto(addr1431);
            case 14:
               this.i7 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 8;
               si32(this.i5,mstate.esp);
               si32(this.i4,mstate.esp + 4);
               state = 15;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[this.i2]();
               return;
            case 15:
               this.i8 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i7 >= 0)
               {
                  this.i7 = this.i10;
                  addr1346:
                  if(this.i8 >= 1)
                  {
                     this.i4 = this.i5;
                  }
                  else
                  {
                     mstate.esp = mstate.esp - 8;
                     si32(this.i7,mstate.esp);
                     si32(this.i4,mstate.esp + 4);
                     state = 20;
                     mstate.esp = mstate.esp - 4;
                     mstate.funcs[this.i2]();
                     return;
                  }
               }
               else
               {
                  this.i7 = this.i10;
                  addr1537:
                  if(this.i8 <= -1)
                  {
                     this.i4 = this.i5;
                  }
                  else
                  {
                     mstate.esp = mstate.esp - 8;
                     si32(this.i7,mstate.esp);
                     si32(this.i4,mstate.esp + 4);
                     state = 19;
                     mstate.esp = mstate.esp - 4;
                     mstate.funcs[this.i2]();
                     return;
                  }
               }
               §§goto(addr1735);
            case 16:
               this.i7 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i7 <= -1)
               {
                  this.i7 = this.i10;
               }
               else
               {
                  §§goto(addr1423);
               }
               §§goto(addr1431);
            case 17:
               this.i8 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 8;
               si32(this.i5,mstate.esp);
               si32(this.i4,mstate.esp + 4);
               state = 18;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[this.i2]();
               return;
            case 18:
               this.i9 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i8 >= 0)
               {
                  this.i8 = this.i9;
                  §§goto(addr1346);
               }
               else
               {
                  this.i8 = this.i9;
                  §§goto(addr1537);
               }
               §§goto(addr1735);
            case 19:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i5 <= -1)
               {
                  §§goto(addr1735);
               }
               else if(this.i3 != 0)
               {
                  this.i4 = this.i7;
                  §§goto(addr1741);
               }
               else
               {
                  this.i4 = this.i7;
               }
               §§goto(addr1616);
            case 20:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i5 <= -1)
               {
                  this.i4 = this.i7;
               }
               §§goto(addr1735);
            case 21:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i5 = this.i9;
               this.i7 = this.i8;
               if(this.i4 >= 1)
               {
                  this.i5 = this.i9;
                  this.i7 = this.i11;
                  this.i9 = this.i10;
                  this.i4 = this.i12;
                  §§goto(addr2202);
               }
               else
               {
                  if(this.i4 != 0)
                  {
                     this.i4 = this.i11;
                     this.i5 = this.i9;
                  }
                  else if(this.i3 == 0)
                  {
                     this.i4 = 1;
                     this.i5 = li32(this.i9);
                     this.i7 = li32(this.i8);
                     si32(this.i7,this.i9);
                     si32(this.i5,this.i8);
                     this.i7 = this.i8 + 4;
                     this.i11 = this.i9 + 4;
                     this.i8 = this.i10;
                     this.i5 = this.i12;
                     this.i9 = this.i7;
                     this.i7 = this.i11;
                  }
                  else
                  {
                     if(this.i3 >= 2)
                     {
                        this.i4 = 0;
                        this.i11 = 4;
                        while(true)
                        {
                           this.i13 = this.i5 + this.i4;
                           this.i14 = this.i7 + this.i4;
                           this.i15 = li8(this.i13);
                           this.i16 = li8(this.i14);
                           si8(this.i16,this.i13);
                           si8(this.i15,this.i14);
                           this.i11 = this.i11 + -1;
                           this.i4 = this.i4 + 1;
                           if(this.i11 >= 1)
                           {
                              continue;
                           }
                           break;
                        }
                     }
                     else
                     {
                        this.i4 = li32(this.i9);
                        this.i5 = li32(this.i8);
                        si32(this.i5,this.i9);
                        si32(this.i4,this.i8);
                     }
                     this.i4 = 1;
                     this.i5 = this.i9 + 4;
                  }
                  this.i7 = this.i5;
                  this.i9 = this.i8 + 4;
                  this.i8 = this.i10;
                  this.i5 = this.i12;
               }
               §§goto(addr2058);
            case 22:
               this.i13 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i13 <= -1)
               {
                  §§goto(addr2454);
               }
               else
               {
                  if(this.i13 != 0)
                  {
                     this.i4 = this.i7;
                     this.i5 = this.i12;
                     this.i7 = this.i11;
                  }
                  else
                  {
                     if(this.i3 >= 2)
                     {
                        this.i12 = 0;
                        this.i13 = 4;
                        while(true)
                        {
                           this.i14 = this.i4 + this.i12;
                           this.i15 = this.i5 + this.i12;
                           this.i16 = li8(this.i14);
                           this.i17 = li8(this.i15);
                           si8(this.i17,this.i14);
                           si8(this.i16,this.i15);
                           this.i13 = this.i13 + -1;
                           this.i12 = this.i12 + 1;
                           if(this.i13 >= 1)
                           {
                              continue;
                           }
                           break;
                        }
                     }
                     else
                     {
                        this.i4 = li32(this.i7);
                        this.i5 = li32(this.i11);
                        si32(this.i5,this.i7);
                        si32(this.i4,this.i11);
                     }
                     this.i5 = 1;
                     this.i11 = this.i11 + -4;
                     this.i4 = this.i7;
                     this.i7 = this.i11;
                  }
                  §§goto(addr2418);
               }
               §§goto(addr2424);
            case 23:
               this.i12 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i12 <= -1)
               {
                  this.i5 = this.i5 + this.i11;
                  this.i11 = this.i4 + this.i11;
                  this.i4 = this.i7;
                  this.i7 = this.i11;
               }
               else if(this.i12 != 0)
               {
                  this.i12 = this.i5 + this.i11;
                  this.i4 = this.i4 + this.i11;
                  this.i5 = this.i7;
                  this.i7 = this.i12;
                  §§goto(addr2418);
               }
               else
               {
                  this.i7 = this.i5 + this.i11;
                  this.i12 = this.i4 + this.i11;
                  this.i13 = li32(this.i12);
                  this.i14 = li32(this.i7);
                  si32(this.i14,this.i12);
                  this.i12 = this.i11 + -4;
                  si32(this.i13,this.i7);
                  this.i7 = this.i4 + this.i12;
                  if(uint(this.i8) <= uint(this.i7))
                  {
                     this.i11 = 1;
                     this.i7 = this.i12;
                     this.i12 = this.i11;
                  }
                  else
                  {
                     this.i7 = 1;
                     this.i11 = this.i4 + this.i12;
                     this.i5 = this.i5 + this.i12;
                     this.i4 = this.i7;
                     this.i7 = this.i11;
                  }
                  §§goto(addr2474);
               }
               §§goto(addr2664);
            case 24:
               this.i10 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i11 = this.i8;
               if(this.i10 >= 1)
               {
                  this.i10 = li32(this.i11);
                  this.i4 = li32(this.i8 + -4);
                  si32(this.i4,this.i11);
                  si32(this.i10,this.i8 + -4);
                  this.i5 = this.i5 + 1;
                  this.i8 = this.i8 + -4;
                  if(uint(this.i8) > uint(this.i0))
                  {
                  }
                  §§goto(addr2960);
               }
               §§goto(addr3138);
            case 25:
               this.i10 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i10 > 0)
               {
                  if(this.i3 >= 2)
                  {
                     this.i9 = 4;
                     do
                     {
                        this.i10 = li8(this.i8);
                        this.i11 = li8(this.i8 + -4);
                        si8(this.i11,this.i8);
                        si8(this.i10,this.i8 + -4);
                        this.i9 = this.i9 + -1;
                        this.i8 = this.i8 + 1;
                     }
                     while(this.i9 > 0);
                     
                     this.i8 = this.i5;
                  }
                  else
                  {
                     this.i8 = li32(this.i9);
                     this.i10 = li32(this.i5);
                     si32(this.i10,this.i9);
                     si32(this.i8,this.i5);
                     this.i8 = this.i5;
                  }
                  §§goto(addr2931);
               }
               §§goto(addr3138);
            case 26:
               mstate.esp = mstate.esp + 12;
               §§goto(addr3606);
         }
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
