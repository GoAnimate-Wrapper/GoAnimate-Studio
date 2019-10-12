package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM__make_words extends Machine
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
      
      public function FSM__make_words()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM__make_words = null;
         _loc1_ = new FSM__make_words();
         FSM__make_words.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 144;
               this.i0 = 0;
               this.i1 = li32(mstate.ebp + 12);
               this.i2 = li32(mstate.ebp + 16);
               this.i3 = this.i2 == 0?int(this.i1):int(this.i2);
               mstate.esp = mstate.esp - 8;
               this.i3 = this.i3 << 2;
               si32(this.i0,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               state = 1;
               mstate.esp = mstate.esp - 4;
               FSM__make_words.start();
               return;
            case 1:
               this.i3 = mstate.eax;
               this.i4 = mstate.ebp + -144;
               mstate.esp = mstate.esp + 8;
               this.i5 = 132;
               memset(this.i4,this.i0,this.i5);
               this.i5 = li32(mstate.ebp + 8);
               this.i6 = this.i4 + 4;
               this.i7 = this.i3;
               this.i8 = this.i5;
               this.i9 = this.i0;
               while(true)
               {
                  this.i10 = this.i8;
                  this.i8 = this.i10;
                  if(this.i9 >= this.i1)
                  {
                     break;
                  }
                  this.i8 = li32(this.i8);
                  if(this.i8 >= 1)
                  {
                     this.i11 = mstate.ebp + -144;
                     this.i12 = this.i8 << 2;
                     this.i11 = this.i11 + this.i12;
                     this.i11 = li32(this.i11);
                     if(this.i8 <= 31)
                     {
                        this.i12 = this.i11 >>> this.i8;
                        if(this.i12 != 0)
                        {
                           this.i8 = 0;
                           mstate.esp = mstate.esp - 8;
                           si32(this.i3,mstate.esp);
                           si32(this.i8,mstate.esp + 4);
                           state = 2;
                           mstate.esp = mstate.esp - 4;
                           FSM__make_words.start();
                           return;
                        }
                     }
                     this.i12 = this.i0 << 2;
                     this.i13 = this.i8 << 2;
                     this.i12 = this.i7 + this.i12;
                     si32(this.i11,this.i12);
                     this.i12 = this.i4 + this.i13;
                     this.i0 = this.i0 + 1;
                     this.i13 = this.i8;
                     while(true)
                     {
                        this.i14 = this.i13;
                        this.i13 = this.i12;
                        if(this.i14 > 0)
                        {
                           this.i15 = li32(this.i13);
                           this.i16 = this.i15 & 1;
                           if(this.i16 != 0)
                           {
                              if(this.i14 == 1)
                              {
                                 this.i12 = li32(this.i6);
                                 this.i12 = this.i12 + 1;
                                 si32(this.i12,this.i6);
                                 break;
                              }
                              this.i12 = mstate.ebp + -144;
                              this.i14 = this.i14 << 2;
                              this.i12 = this.i14 + this.i12;
                              this.i12 = li32(this.i12 + -4);
                              this.i12 = this.i12 << 1;
                              si32(this.i12,this.i13);
                              break;
                           }
                           this.i15 = this.i15 + 1;
                           si32(this.i15,this.i13);
                           this.i12 = this.i12 + -4;
                           this.i13 = this.i14 + -1;
                           continue;
                        }
                        break;
                     }
                     this.i12 = this.i8 << 2;
                     this.i12 = this.i4 + this.i12;
                     this.i8 = this.i8 + 1;
                     while(true)
                     {
                        this.i13 = this.i12;
                        this.i12 = this.i8;
                        this.i8 = this.i13;
                        if(this.i12 >= 33)
                        {
                           break;
                        }
                        this.i14 = li32(this.i13 + 4);
                        this.i15 = this.i13 + 4;
                        this.i16 = this.i14 >>> 1;
                        if(this.i16 != this.i11)
                        {
                           break;
                        }
                        this.i8 = li32(this.i8);
                        this.i8 = this.i8 << 1;
                        si32(this.i8,this.i15);
                        this.i8 = this.i13 + 4;
                        this.i11 = this.i12 + 1;
                        this.i12 = this.i8;
                        this.i8 = this.i11;
                        this.i11 = this.i14;
                     }
                     this.i8 = this.i0;
                  }
                  else if(this.i2 != 0)
                  {
                     this.i8 = this.i0;
                  }
                  else
                  {
                     this.i8 = this.i0 + 1;
                  }
                  this.i0 = this.i8;
                  this.i8 = this.i10 + 4;
                  this.i9 = this.i9 + 1;
               }
               if(this.i2 != 1)
               {
                  this.i0 = 1;
                  this.i6 = 31;
                  this.i4 = this.i4 + 4;
                  while(true)
                  {
                     this.i8 = this.i4;
                     this.i4 = this.i8;
                     if(this.i0 >= 33)
                     {
                        break;
                     }
                     this.i9 = -1;
                     this.i4 = li32(this.i4);
                     this.i9 = this.i9 >>> this.i6;
                     this.i4 = this.i4 & this.i9;
                     if(this.i4 != 0)
                     {
                        this.i4 = 0;
                        mstate.esp = mstate.esp - 8;
                        si32(this.i3,mstate.esp);
                        si32(this.i4,mstate.esp + 4);
                        state = 3;
                        mstate.esp = mstate.esp - 4;
                        FSM__make_words.start();
                        return;
                     }
                     this.i4 = this.i8 + 4;
                     this.i6 = this.i6 + -1;
                     this.i0 = this.i0 + 1;
                  }
               }
               this.i3 = 0;
               this.i4 = this.i5;
               this.i5 = this.i3;
               while(true)
               {
                  this.i0 = this.i5;
                  this.i5 = this.i3;
                  this.i3 = this.i4;
                  if(this.i0 >= this.i1)
                  {
                     break;
                  }
                  this.i6 = 0;
                  this.i8 = this.i5 << 2;
                  this.i3 = li32(this.i3);
                  this.i8 = this.i7 + this.i8;
                  this.i9 = this.i6;
                  while(this.i3 > this.i9)
                  {
                     this.i10 = li32(this.i8);
                     this.i10 = this.i10 >>> this.i9;
                     this.i10 = this.i10 & 1;
                     this.i6 = this.i6 << 1;
                     this.i9 = this.i9 + 1;
                     this.i6 = this.i10 | this.i6;
                  }
                  if(this.i2 != 0)
                  {
                     if(this.i3 == 0)
                     {
                        this.i3 = this.i5;
                     }
                     else
                     {
                        si32(this.i6,this.i8);
                        this.i3 = this.i5 + 1;
                     }
                  }
                  else
                  {
                     si32(this.i6,this.i8);
                     this.i3 = this.i5 + 1;
                  }
                  this.i4 = this.i4 + 4;
                  this.i5 = this.i0 + 1;
               }
               mstate.eax = this.i7;
               break;
            case 2:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               mstate.eax = this.i8;
               break;
            case 3:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               mstate.eax = this.i4;
         }
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
