package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_vorbis_dsp_clear extends Machine
   {
      
      public static const intRegCount:int = 15;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i10:int;
      
      public var i11:int;
      
      public var i12:int;
      
      public var i13:int;
      
      public var i14:int;
      
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
      
      public function FSM_vorbis_dsp_clear()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_vorbis_dsp_clear = null;
         _loc1_ = new FSM_vorbis_dsp_clear();
         FSM_vorbis_dsp_clear.gworker = _loc1_;
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
               mstate.esp = mstate.esp - 0;
               this.i0 = li32(mstate.ebp + 8);
               if(this.i0 != 0)
               {
                  this.i1 = li32(this.i0 + 4);
                  if(this.i1 == 0)
                  {
                     this.i2 = 0;
                  }
                  else
                  {
                     this.i2 = li32(this.i1 + 28);
                  }
                  this.i3 = li32(this.i0 + 104);
                  this.i4 = this.i3;
                  this.i5 = this.i2;
                  if(this.i3 != 0)
                  {
                     this.i6 = li32(this.i4);
                     this.i7 = this.i6;
                     this.i8 = this.i4;
                     if(this.i6 != 0)
                     {
                        this.i9 = 0;
                        mstate.esp = mstate.esp - 4;
                        this.i10 = this.i7 + 16;
                        si32(this.i10,mstate.esp);
                        state = 1;
                        mstate.esp = mstate.esp - 4;
                        FSM_vorbis_dsp_clear.start();
                        return;
                     }
                     addr437:
                     this.i6 = li32(this.i3 + 12);
                     this.i7 = this.i3 + 12;
                     if(this.i6 != 0)
                     {
                        this.i8 = 0;
                        this.i6 = li32(this.i6);
                        mstate.esp = mstate.esp - 4;
                        si32(this.i6,mstate.esp);
                        state = 7;
                        mstate.esp = mstate.esp - 4;
                        FSM_vorbis_dsp_clear.start();
                        return;
                     }
                     addr590:
                     this.i6 = li32(this.i3 + 16);
                     this.i7 = this.i3 + 16;
                     if(this.i6 != 0)
                     {
                        this.i8 = 0;
                        this.i6 = li32(this.i6);
                        mstate.esp = mstate.esp - 4;
                        si32(this.i6,mstate.esp);
                        state = 10;
                        mstate.esp = mstate.esp - 4;
                        FSM_vorbis_dsp_clear.start();
                        return;
                     }
                     addr743:
                     this.i6 = li32(this.i3 + 48);
                     this.i7 = this.i3 + 48;
                     if(this.i6 != 0)
                     {
                        if(this.i2 != 0)
                        {
                           this.i6 = 0;
                           this.i8 = this.i2 + 16;
                           this.i9 = this.i6;
                           addr888:
                           this.i10 = li32(this.i8);
                           if(this.i10 > this.i6)
                           {
                              this.i10 = FSM_vorbis_dsp_clear;
                              this.i11 = this.i5 + this.i9;
                              this.i11 = li32(this.i11 + 800);
                              this.i11 = this.i11 << 2;
                              this.i12 = li32(this.i7);
                              this.i10 = this.i10 + this.i11;
                              this.i10 = li32(this.i10);
                              this.i11 = this.i12 + this.i9;
                              this.i10 = li32(this.i10 + 16);
                              this.i11 = li32(this.i11);
                              mstate.esp = mstate.esp - 4;
                              si32(this.i11,mstate.esp);
                              state = 13;
                              mstate.esp = mstate.esp - 4;
                              mstate.funcs[this.i10]();
                              return;
                           }
                        }
                        this.i6 = 0;
                        this.i7 = li32(this.i7);
                        mstate.esp = mstate.esp - 8;
                        si32(this.i7,mstate.esp);
                        si32(this.i6,mstate.esp + 4);
                        state = 14;
                        mstate.esp = mstate.esp - 4;
                        FSM_vorbis_dsp_clear.start();
                        return;
                     }
                     addr948:
                     this.i6 = li32(this.i3 + 52);
                     this.i7 = this.i3 + 52;
                     if(this.i6 != 0)
                     {
                        if(this.i2 != 0)
                        {
                           this.i6 = 0;
                           this.i8 = this.i2 + 20;
                           this.i9 = this.i6;
                           addr1093:
                           this.i10 = li32(this.i8);
                           if(this.i10 > this.i6)
                           {
                              this.i10 = FSM_vorbis_dsp_clear;
                              this.i11 = this.i5 + this.i9;
                              this.i11 = li32(this.i11 + 1312);
                              this.i11 = this.i11 << 2;
                              this.i12 = li32(this.i7);
                              this.i10 = this.i10 + this.i11;
                              this.i10 = li32(this.i10);
                              this.i11 = this.i12 + this.i9;
                              this.i10 = li32(this.i10 + 16);
                              this.i11 = li32(this.i11);
                              mstate.esp = mstate.esp - 4;
                              si32(this.i11,mstate.esp);
                              state = 15;
                              mstate.esp = mstate.esp - 4;
                              mstate.funcs[this.i10]();
                              return;
                           }
                        }
                        this.i5 = 0;
                        this.i6 = li32(this.i7);
                        mstate.esp = mstate.esp - 8;
                        si32(this.i6,mstate.esp);
                        si32(this.i5,mstate.esp + 4);
                        state = 16;
                        mstate.esp = mstate.esp - 4;
                        FSM_vorbis_dsp_clear.start();
                        return;
                     }
                     addr1153:
                     this.i5 = li32(this.i3 + 56);
                     this.i6 = this.i3 + 56;
                     if(this.i5 != 0)
                     {
                        if(this.i2 != 0)
                        {
                           this.i5 = 0;
                           this.i2 = this.i2 + 28;
                           this.i7 = this.i5;
                           loop1:
                           while(true)
                           {
                              this.i8 = li32(this.i2);
                              if(this.i8 <= this.i5)
                              {
                                 break;
                              }
                              this.i8 = li32(this.i6);
                              this.i9 = this.i8 + this.i7;
                              if(this.i9 != 0)
                              {
                                 this.i9 = this.i8 + this.i7;
                                 this.i9 = li32(this.i9 + 16);
                                 if(this.i9 != 0)
                                 {
                                    this.i10 = 0;
                                    mstate.esp = mstate.esp - 8;
                                    si32(this.i9,mstate.esp);
                                    si32(this.i10,mstate.esp + 4);
                                    state = 17;
                                    mstate.esp = mstate.esp - 4;
                                    FSM_vorbis_dsp_clear.start();
                                    return;
                                 }
                                 addr1271:
                                 while(true)
                                 {
                                    this.i9 = this.i8 + this.i7;
                                    this.i9 = li32(this.i9 + 20);
                                    if(this.i9 != 0)
                                    {
                                       this.i10 = 0;
                                       mstate.esp = mstate.esp - 8;
                                       si32(this.i9,mstate.esp);
                                       si32(this.i10,mstate.esp + 4);
                                       state = 18;
                                       mstate.esp = mstate.esp - 4;
                                       FSM_vorbis_dsp_clear.start();
                                       return;
                                    }
                                    addr1334:
                                    while(true)
                                    {
                                       this.i9 = this.i8 + this.i7;
                                       this.i9 = li32(this.i9 + 24);
                                       if(this.i9 != 0)
                                       {
                                          this.i10 = 0;
                                          mstate.esp = mstate.esp - 8;
                                          si32(this.i9,mstate.esp);
                                          si32(this.i10,mstate.esp + 4);
                                          state = 19;
                                          mstate.esp = mstate.esp - 4;
                                          FSM_vorbis_dsp_clear.start();
                                          return;
                                       }
                                       addr1397:
                                       while(true)
                                       {
                                          this.i9 = this.i8 + this.i7;
                                          this.i10 = li32(this.i9 + 8);
                                          this.i9 = this.i9 + 8;
                                          if(this.i10 != 0)
                                          {
                                             this.i10 = 0;
                                             addr1583:
                                             if(this.i10 <= 16)
                                             {
                                                this.i12 = 0;
                                                this.i11 = this.i12;
                                                break loop9;
                                             }
                                             this.i10 = 0;
                                             this.i9 = li32(this.i9);
                                             mstate.esp = mstate.esp - 8;
                                             si32(this.i9,mstate.esp);
                                             si32(this.i10,mstate.esp + 4);
                                             state = 22;
                                             mstate.esp = mstate.esp - 4;
                                             FSM_vorbis_dsp_clear.start();
                                             return;
                                          }
                                          addr1645:
                                          while(true)
                                          {
                                             this.i9 = this.i8 + this.i7;
                                             this.i10 = li32(this.i9 + 12);
                                             this.i9 = this.i9 + 12;
                                             if(this.i10 != 0)
                                             {
                                                this.i10 = 0;
                                                this.i11 = this.i10;
                                                addr1755:
                                                this.i12 = this.i11;
                                                this.i11 = this.i10;
                                                this.i13 = li32(this.i9);
                                                this.i10 = this.i13;
                                                if(this.i11 >= 3)
                                                {
                                                   this.i9 = 0;
                                                   mstate.esp = mstate.esp - 8;
                                                   si32(this.i13,mstate.esp);
                                                   si32(this.i9,mstate.esp + 4);
                                                   state = 24;
                                                   mstate.esp = mstate.esp - 4;
                                                   FSM_vorbis_dsp_clear.start();
                                                   return;
                                                }
                                                this.i13 = 0;
                                                this.i10 = this.i10 + this.i12;
                                                this.i10 = li32(this.i10);
                                                mstate.esp = mstate.esp - 8;
                                                si32(this.i10,mstate.esp);
                                                si32(this.i13,mstate.esp + 4);
                                                state = 23;
                                                mstate.esp = mstate.esp - 4;
                                                FSM_vorbis_dsp_clear.start();
                                                return;
                                             }
                                             addr1821:
                                             while(true)
                                             {
                                                this.i9 = 0;
                                                this.i8 = this.i8 + this.i7;
                                                this.i10 = 52;
                                                memset(this.i8,this.i9,this.i10);
                                             }
                                          }
                                       }
                                    }
                                 }
                              }
                              while(true)
                              {
                                 this.i7 = this.i7 + 52;
                                 this.i5 = this.i5 + 1;
                                 continue loop1;
                              }
                           }
                        }
                        this.i2 = 0;
                        this.i5 = li32(this.i6);
                        mstate.esp = mstate.esp - 8;
                        si32(this.i5,mstate.esp);
                        si32(this.i2,mstate.esp + 4);
                        state = 25;
                        mstate.esp = mstate.esp - 4;
                        FSM_vorbis_dsp_clear.start();
                        return;
                     }
                     addr1914:
                     this.i2 = li32(this.i3 + 60);
                     if(this.i2 != 0)
                     {
                        this.i5 = 0;
                        this.i6 = this.i2;
                        this.i7 = 36;
                        memset(this.i6,this.i5,this.i7);
                        mstate.esp = mstate.esp - 8;
                        si32(this.i2,mstate.esp);
                        si32(this.i5,mstate.esp + 4);
                        state = 26;
                        mstate.esp = mstate.esp - 4;
                        FSM_vorbis_dsp_clear.start();
                        return;
                     }
                     addr1985:
                     this.i2 = 0;
                     this.i5 = this.i4 + 80;
                     this.i6 = 48;
                     memset(this.i5,this.i2,this.i6);
                     mstate.esp = mstate.esp - 4;
                     this.i2 = this.i3 + 20;
                     si32(this.i2,mstate.esp);
                     state = 27;
                     mstate.esp = mstate.esp - 4;
                     FSM_vorbis_dsp_clear.start();
                     return;
                  }
                  addr2077:
                  this.i2 = li32(this.i0 + 8);
                  this.i5 = this.i0 + 8;
                  if(this.i2 != 0)
                  {
                     if(this.i1 != 0)
                     {
                        this.i2 = 0;
                        this.i1 = this.i1 + 4;
                        this.i6 = this.i2;
                        loop0:
                        while(true)
                        {
                           this.i7 = li32(this.i1);
                           if(this.i7 <= this.i2)
                           {
                              break;
                           }
                           this.i7 = li32(this.i5);
                           this.i7 = this.i7 + this.i6;
                           this.i7 = li32(this.i7);
                           if(this.i7 != 0)
                           {
                              this.i8 = 0;
                              mstate.esp = mstate.esp - 8;
                              si32(this.i7,mstate.esp);
                              si32(this.i8,mstate.esp + 4);
                              state = 29;
                              mstate.esp = mstate.esp - 4;
                              FSM_vorbis_dsp_clear.start();
                              return;
                           }
                           addr2181:
                           while(true)
                           {
                              this.i6 = this.i6 + 4;
                              this.i2 = this.i2 + 1;
                              continue loop0;
                           }
                        }
                     }
                     this.i1 = 0;
                     this.i2 = li32(this.i5);
                     mstate.esp = mstate.esp - 8;
                     si32(this.i2,mstate.esp);
                     si32(this.i1,mstate.esp + 4);
                     state = 30;
                     mstate.esp = mstate.esp - 4;
                     FSM_vorbis_dsp_clear.start();
                     return;
                  }
                  addr2309:
                  if(this.i4 != 0)
                  {
                     this.i1 = li32(this.i3 + 64);
                     if(this.i1 != 0)
                     {
                        this.i2 = 0;
                        mstate.esp = mstate.esp - 8;
                        si32(this.i1,mstate.esp);
                        si32(this.i2,mstate.esp + 4);
                        state = 32;
                        mstate.esp = mstate.esp - 4;
                        FSM_vorbis_dsp_clear.start();
                        return;
                     }
                     addr2370:
                     this.i1 = li32(this.i3 + 68);
                     if(this.i1 != 0)
                     {
                        this.i2 = 0;
                        mstate.esp = mstate.esp - 8;
                        si32(this.i1,mstate.esp);
                        si32(this.i2,mstate.esp + 4);
                        state = 33;
                        mstate.esp = mstate.esp - 4;
                        FSM_vorbis_dsp_clear.start();
                        return;
                     }
                     addr2426:
                     this.i1 = li32(this.i3 + 72);
                     if(this.i1 != 0)
                     {
                        this.i2 = 0;
                        mstate.esp = mstate.esp - 8;
                        si32(this.i1,mstate.esp);
                        si32(this.i2,mstate.esp + 4);
                        state = 34;
                        mstate.esp = mstate.esp - 4;
                        FSM_vorbis_dsp_clear.start();
                        return;
                     }
                     addr2482:
                     this.i1 = 0;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i4,mstate.esp);
                     si32(this.i1,mstate.esp + 4);
                     state = 35;
                     mstate.esp = mstate.esp - 4;
                     FSM_vorbis_dsp_clear.start();
                     return;
                  }
                  addr2526:
                  this.i1 = 0;
                  this.i2 = 112;
                  memset(this.i0,this.i1,this.i2);
               }
               mstate.esp = mstate.ebp;
               mstate.ebp = li32(mstate.esp);
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp + 4;
               mstate.gworker = caller;
               return;
            case 1:
               mstate.esp = mstate.esp + 4;
               this.i6 = this.i6 + 48;
               addr216:
               this.i10 = this.i6;
               this.i6 = this.i9;
               this.i9 = this.i10;
               if(this.i6 >= 7)
               {
                  this.i6 = 0;
                  this.i9 = li32(this.i7 + 36);
                  mstate.esp = mstate.esp - 8;
                  si32(this.i9,mstate.esp);
                  si32(this.i6,mstate.esp + 4);
                  state = 3;
                  mstate.esp = mstate.esp - 4;
                  FSM_vorbis_dsp_clear.start();
                  return;
               }
               this.i11 = 0;
               this.i9 = li32(this.i9);
               mstate.esp = mstate.esp - 8;
               si32(this.i9,mstate.esp);
               si32(this.i11,mstate.esp + 4);
               state = 2;
               mstate.esp = mstate.esp - 4;
               FSM_vorbis_dsp_clear.start();
               return;
            case 2:
               this.i9 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i9 = this.i10 + 16;
               this.i10 = this.i6 + 1;
               this.i6 = this.i9;
               this.i9 = this.i10;
               §§goto(addr216);
            case 3:
               this.i9 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i9 = li32(this.i7 + 152);
               mstate.esp = mstate.esp - 8;
               si32(this.i9,mstate.esp);
               si32(this.i6,mstate.esp + 4);
               state = 4;
               mstate.esp = mstate.esp - 4;
               FSM_vorbis_dsp_clear.start();
               return;
            case 4:
               this.i9 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i9 = li32(this.i7 + 160);
               mstate.esp = mstate.esp - 8;
               si32(this.i9,mstate.esp);
               si32(this.i6,mstate.esp + 4);
               state = 5;
               mstate.esp = mstate.esp - 4;
               FSM_vorbis_dsp_clear.start();
               return;
            case 5:
               this.i9 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i9 = 180;
               memset(this.i7,this.i6,this.i9);
               this.i7 = li32(this.i8);
               mstate.esp = mstate.esp - 8;
               si32(this.i7,mstate.esp);
               si32(this.i6,mstate.esp + 4);
               state = 6;
               mstate.esp = mstate.esp - 4;
               FSM_vorbis_dsp_clear.start();
               return;
            case 6:
               this.i6 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr437);
            case 7:
               mstate.esp = mstate.esp + 4;
               this.i6 = li32(this.i7);
               this.i6 = li32(this.i6);
               mstate.esp = mstate.esp - 8;
               si32(this.i6,mstate.esp);
               si32(this.i8,mstate.esp + 4);
               state = 8;
               mstate.esp = mstate.esp - 4;
               FSM_vorbis_dsp_clear.start();
               return;
            case 8:
               this.i6 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i6 = li32(this.i7);
               mstate.esp = mstate.esp - 8;
               si32(this.i6,mstate.esp);
               si32(this.i8,mstate.esp + 4);
               state = 9;
               mstate.esp = mstate.esp - 4;
               FSM_vorbis_dsp_clear.start();
               return;
            case 9:
               this.i6 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr590);
            case 10:
               mstate.esp = mstate.esp + 4;
               this.i6 = li32(this.i7);
               this.i6 = li32(this.i6);
               mstate.esp = mstate.esp - 8;
               si32(this.i6,mstate.esp);
               si32(this.i8,mstate.esp + 4);
               state = 11;
               mstate.esp = mstate.esp - 4;
               FSM_vorbis_dsp_clear.start();
               return;
            case 11:
               this.i6 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i6 = li32(this.i7);
               mstate.esp = mstate.esp - 8;
               si32(this.i6,mstate.esp);
               si32(this.i8,mstate.esp + 4);
               state = 12;
               mstate.esp = mstate.esp - 4;
               FSM_vorbis_dsp_clear.start();
               return;
            case 12:
               this.i6 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr743);
            case 13:
               mstate.esp = mstate.esp + 4;
               this.i9 = this.i9 + 4;
               this.i6 = this.i6 + 1;
               §§goto(addr888);
            case 14:
               this.i6 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr948);
            case 15:
               mstate.esp = mstate.esp + 4;
               this.i9 = this.i9 + 4;
               this.i6 = this.i6 + 1;
               §§goto(addr1093);
            case 16:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr1153);
            case 17:
               this.i9 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr1271);
            case 18:
               this.i9 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr1334);
            case 19:
               this.i9 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr1397);
            case 20:
               this.i11 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i11 = this.i13 + 4;
               this.i12 = this.i12 + 1;
               break;
            case 21:
               this.i11 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i10 = this.i10 + 1;
               §§goto(addr1583);
            case 22:
               this.i9 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr1645);
            case 23:
               this.i10 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i10 = this.i12 + 4;
               this.i12 = this.i11 + 1;
               this.i11 = this.i10;
               this.i10 = this.i12;
               §§goto(addr1755);
            case 24:
               this.i9 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr1821);
            case 25:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr1914);
            case 26:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr1985);
            case 27:
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp - 4;
               this.i2 = this.i3 + 32;
               si32(this.i2,mstate.esp);
               state = 28;
               mstate.esp = mstate.esp - 4;
               FSM_vorbis_dsp_clear.start();
               return;
            case 28:
               mstate.esp = mstate.esp + 4;
               §§goto(addr2077);
            case 29:
               this.i7 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr2181);
            case 30:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i1 = li32(this.i0 + 12);
               if(this.i1 != 0)
               {
                  this.i2 = 0;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i2,mstate.esp + 4);
                  state = 31;
                  mstate.esp = mstate.esp - 4;
                  FSM_vorbis_dsp_clear.start();
                  return;
               }
               §§goto(addr2309);
            case 31:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr2309);
            case 32:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr2370);
            case 33:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr2426);
            case 34:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr2482);
            case 35:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr2526);
         }
         this.i13 = this.i11;
         this.i11 = li32(this.i9);
         this.i14 = this.i10 << 2;
         this.i11 = this.i11 + this.i14;
         this.i11 = li32(this.i11);
         this.i14 = this.i11;
         if(this.i12 >= 8)
         {
            this.i11 = 0;
            mstate.esp = mstate.esp - 8;
            si32(this.i14,mstate.esp);
            si32(this.i11,mstate.esp + 4);
            state = 21;
            mstate.esp = mstate.esp - 4;
            FSM_vorbis_dsp_clear.start();
            return;
         }
         this.i14 = 0;
         this.i11 = this.i11 + this.i13;
         this.i11 = li32(this.i11);
         mstate.esp = mstate.esp - 8;
         si32(this.i11,mstate.esp);
         si32(this.i14,mstate.esp + 4);
         state = 20;
         mstate.esp = mstate.esp - 4;
         FSM_vorbis_dsp_clear.start();
      }
   }
}
