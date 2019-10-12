package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_ogg_stream_packetin extends Machine
   {
      
      public static const intRegCount:int = 16;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i10:int;
      
      public var i11:int;
      
      public var i12:int;
      
      public var i13:int;
      
      public var i14:int;
      
      public var i15:int;
      
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
      
      public function FSM_ogg_stream_packetin()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_ogg_stream_packetin = null;
         _loc1_ = new FSM_ogg_stream_packetin();
         FSM_ogg_stream_packetin.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 8;
               this.i0 = mstate.ebp + -8;
               this.i1 = li32(mstate.ebp + 12);
               this.i2 = li32(this.i1);
               si32(this.i2,mstate.ebp + -8);
               this.i2 = li32(this.i1 + 4);
               si32(this.i2,mstate.ebp + -4);
               this.i2 = li32(this.i1 + 12);
               this.i3 = li32(this.i1 + 16);
               this.i1 = li32(this.i1 + 20);
               this.i4 = li32(mstate.ebp + 8);
               if(this.i4 != 0)
               {
                  this.i5 = li32(this.i4);
                  if(this.i5 != 0)
                  {
                     this.i5 = 0;
                     this.i6 = this.i0 + 4;
                     this.i7 = this.i5;
                     while(true)
                     {
                        this.i8 = this.i6;
                        this.i6 = this.i5;
                        this.i5 = this.i8;
                        if(this.i7 >= 1)
                        {
                           break;
                        }
                        this.i5 = li32(this.i5);
                        this.i8 = this.i8 + 8;
                        this.i7 = this.i7 + 1;
                        this.i5 = this.i5 + this.i6;
                        this.i6 = this.i8;
                     }
                     this.i5 = this.i6 / 255;
                     this.i7 = li32(this.i4 + 12);
                     this.i8 = this.i4 + 12;
                     this.i9 = this.i5 + 1;
                     if(this.i7 != 0)
                     {
                        this.i10 = li32(this.i4 + 8);
                        this.i11 = this.i10 - this.i7;
                        si32(this.i11,this.i4 + 8);
                        if(this.i10 != this.i7)
                        {
                           this.i10 = li32(this.i4);
                           this.i7 = this.i10 + this.i7;
                           memmove(this.i10,this.i7,this.i11);
                        }
                        this.i7 = 0;
                        si32(this.i7,this.i8);
                     }
                     this.i7 = li32(this.i4 + 4);
                     this.i8 = li32(this.i4 + 8);
                     this.i10 = this.i4 + 8;
                     this.i11 = this.i4 + 4;
                     this.i8 = this.i8 + this.i6;
                     if(this.i7 <= this.i8)
                     {
                        this.i8 = li32(this.i4);
                        this.i7 = this.i7 + this.i6;
                        mstate.esp = mstate.esp - 8;
                        this.i7 = this.i7 + 1024;
                        si32(this.i8,mstate.esp);
                        si32(this.i7,mstate.esp + 4);
                        state = 1;
                        mstate.esp = mstate.esp - 4;
                        FSM_ogg_stream_packetin.start();
                        return;
                     }
                     addr422:
                     this.i7 = li32(this.i4 + 24);
                     this.i8 = li32(this.i4 + 28);
                     this.i11 = this.i4 + 28;
                     this.i12 = this.i4 + 24;
                     this.i8 = this.i8 + this.i9;
                     if(this.i7 <= this.i8)
                     {
                        this.i7 = this.i7 + this.i9;
                        this.i8 = li32(this.i4 + 16);
                        this.i7 = this.i7 << 2;
                        mstate.esp = mstate.esp - 8;
                        this.i7 = this.i7 + 128;
                        si32(this.i8,mstate.esp);
                        si32(this.i7,mstate.esp + 4);
                        state = 3;
                        mstate.esp = mstate.esp - 4;
                        FSM_ogg_stream_packetin.start();
                        return;
                     }
                     addr661:
                     this.i7 = 0;
                     this.i8 = this.i4;
                     while(true)
                     {
                        this.i12 = this.i0;
                        this.i0 = this.i12;
                        if(this.i7 >= 1)
                        {
                           break;
                        }
                        this.i13 = li32(this.i12 + 4);
                        this.i0 = li32(this.i0);
                        this.i14 = li32(this.i8);
                        this.i15 = li32(this.i10);
                        this.i14 = this.i14 + this.i15;
                        memcpy(this.i14,this.i0,this.i13);
                        this.i0 = li32(this.i10);
                        this.i13 = li32(this.i12 + 4);
                        this.i0 = this.i0 + this.i13;
                        si32(this.i0,this.i10);
                        this.i0 = this.i12 + 8;
                        this.i7 = this.i7 + 1;
                     }
                     this.i0 = 0;
                     this.i7 = this.i4 + 352;
                     this.i8 = this.i4 + 20;
                     this.i10 = this.i4 + 16;
                     while(true)
                     {
                        this.i12 = this.i0;
                        this.i0 = li32(this.i10);
                        this.i13 = li32(this.i11);
                        this.i13 = this.i13 + this.i12;
                        if(this.i5 <= this.i12)
                        {
                           break;
                        }
                        this.i14 = 255;
                        this.i13 = this.i13 << 2;
                        this.i0 = this.i0 + this.i13;
                        si32(this.i14,this.i0);
                        this.i0 = li32(this.i11);
                        this.i0 = this.i0 + this.i12;
                        this.i13 = li32(this.i8);
                        this.i0 = this.i0 << 3;
                        this.i14 = li32(this.i7);
                        this.i15 = li32(this.i7 + 4);
                        this.i0 = this.i13 + this.i0;
                        si32(this.i14,this.i0);
                        si32(this.i15,this.i0 + 4);
                        this.i0 = this.i12 + 1;
                     }
                     this.i5 = 1;
                     this.i14 = this.i6 / 255;
                     this.i14 = this.i14 * 255;
                     this.i13 = this.i13 << 2;
                     this.i6 = this.i6 - this.i14;
                     this.i0 = this.i0 + this.i13;
                     si32(this.i6,this.i0);
                     this.i0 = li32(this.i11);
                     this.i0 = this.i0 + this.i12;
                     this.i6 = li32(this.i8);
                     this.i0 = this.i0 << 3;
                     this.i0 = this.i6 + this.i0;
                     si32(this.i3,this.i0);
                     si32(this.i1,this.i0 + 4);
                     si32(this.i3,this.i7);
                     si32(this.i1,this.i7 + 4);
                     this.i0 = li32(this.i11);
                     this.i1 = li32(this.i10);
                     this.i0 = this.i0 << 2;
                     this.i0 = this.i1 + this.i0;
                     this.i1 = li32(this.i0);
                     this.i1 = this.i1 | 256;
                     si32(this.i1,this.i0);
                     this.i0 = li32(this.i11);
                     this.i0 = this.i0 + this.i9;
                     si32(this.i0,this.i11);
                     this.i0 = li32(this.i4 + 344);
                     this.i1 = li32(this.i4 + 348);
                     this.i3 = 0;
                     this.i0 = __addc(this.i0,this.i5);
                     this.i1 = __adde(this.i1,this.i3);
                     si32(this.i0,this.i4 + 344);
                     si32(this.i1,this.i4 + 348);
                     if(this.i2 != 0)
                     {
                        this.i0 = 1;
                        si32(this.i0,this.i4 + 328);
                        break;
                     }
                     break;
                  }
                  break;
               }
               break;
            case 1:
               this.i7 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i8 = this.i4;
               if(this.i7 == 0)
               {
                  addr363:
                  mstate.esp = mstate.esp - 4;
                  si32(this.i4,mstate.esp);
                  state = 2;
                  mstate.esp = mstate.esp - 4;
                  FSM_ogg_stream_packetin.start();
                  return;
               }
               this.i12 = li32(this.i11);
               this.i12 = this.i12 + this.i6;
               this.i12 = this.i12 + 1024;
               si32(this.i12,this.i11);
               si32(this.i7,this.i8);
               §§goto(addr422);
            case 2:
               mstate.esp = mstate.esp + 4;
               break;
            case 3:
               this.i7 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i8 = this.i4 + 16;
               if(this.i7 == 0)
               {
                  addr542:
                  §§goto(addr363);
               }
               else
               {
                  si32(this.i7,this.i8);
                  this.i7 = li32(this.i12);
                  this.i8 = li32(this.i4 + 20);
                  this.i7 = this.i7 + this.i9;
                  this.i7 = this.i7 << 3;
                  mstate.esp = mstate.esp - 8;
                  this.i7 = this.i7 + 256;
                  si32(this.i8,mstate.esp);
                  si32(this.i7,mstate.esp + 4);
                  state = 4;
                  mstate.esp = mstate.esp - 4;
                  FSM_ogg_stream_packetin.start();
                  return;
               }
            case 4:
               this.i7 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i8 = this.i4 + 20;
               if(this.i7 == 0)
               {
                  §§goto(addr542);
               }
               else
               {
                  si32(this.i7,this.i8);
                  this.i7 = li32(this.i12);
                  this.i7 = this.i7 + this.i9;
                  this.i7 = this.i7 + 32;
                  si32(this.i7,this.i12);
                  §§goto(addr661);
               }
         }
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
