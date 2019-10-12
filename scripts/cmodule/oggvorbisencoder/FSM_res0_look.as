package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_res0_look extends Machine
   {
      
      public static const intRegCount:int = 19;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i10:int;
      
      public var i11:int;
      
      public var i12:int;
      
      public var i13:int;
      
      public var i14:int;
      
      public var i15:int;
      
      public var i17:int;
      
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
      
      public function FSM_res0_look()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_res0_look = null;
         _loc1_ = new FSM_res0_look();
         FSM_res0_look.gworker = _loc1_;
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
               this.i0 = 44;
               mstate.esp = mstate.esp - 8;
               this.i1 = 0;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               state = 1;
               mstate.esp = mstate.esp - 4;
               FSM_res0_look.start();
               return;
            case 1:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i1 = li32(mstate.ebp + 12);
               this.i2 = li32(mstate.ebp + 8);
               this.i3 = this.i1;
               if(this.i0 != 0)
               {
                  this.i4 = 0;
                  this.i5 = this.i0;
                  this.i6 = 44;
                  memset(this.i5,this.i4,this.i6);
               }
               this.i2 = li32(this.i2 + 4);
               this.i2 = li32(this.i2 + 28);
               si32(this.i1,this.i0);
               this.i4 = li32(this.i1 + 12);
               si32(this.i4,this.i0 + 4);
               this.i5 = li32(this.i2 + 2848);
               si32(this.i5,this.i0 + 12);
               this.i5 = li32(this.i1 + 20);
               this.i6 = li32(this.i2 + 2848);
               this.i5 = this.i5 * 56;
               this.i5 = this.i6 + this.i5;
               si32(this.i5,this.i0 + 16);
               this.i5 = li32(this.i5);
               this.i2 = this.i2 + 2848;
               this.i6 = this.i0 + 4;
               this.i7 = this.i0;
               if(uint(this.i4) >= uint(1073741824))
               {
                  this.i4 = 12;
                  si32(this.i4,FSM_res0_look);
                  this.i4 = 0;
                  addr317:
                  this.i8 = 0;
                  si32(this.i4,this.i7 + 20);
                  this.i4 = this.i7 + 20;
                  this.i9 = this.i8;
                  this.i10 = this.i8;
                  this.i11 = this.i8;
                  while(true)
                  {
                     this.i12 = this.i9;
                     this.i9 = this.i11;
                     this.i11 = li32(this.i6);
                     if(this.i11 <= this.i10)
                     {
                        break;
                     }
                     this.i11 = 0;
                     this.i13 = this.i3 + this.i12;
                     this.i14 = li32(this.i13 + 24);
                     this.i13 = this.i13 + 24;
                     while(true)
                     {
                        this.i15 = this.i11;
                        this.i11 = this.i14;
                        if(this.i11 == 0)
                        {
                           break;
                        }
                        this.i14 = this.i15 + 1;
                        this.i15 = this.i11 >>> 1;
                        this.i11 = this.i14;
                        this.i14 = this.i15;
                     }
                     if(this.i15 == 0)
                     {
                        addr692:
                        this.i11 = this.i9;
                        this.i9 = this.i12 + 4;
                        this.i10 = this.i10 + 1;
                        continue;
                     }
                     this.i11 = li32(this.i4);
                     this.i8 = this.i15 > this.i8?int(this.i15):int(this.i8);
                     if(uint(this.i15) >= uint(1073741824))
                     {
                        this.i14 = 12;
                        si32(this.i14,FSM_res0_look);
                        this.i14 = 0;
                        break loop6;
                     }
                     this.i14 = 0;
                     mstate.esp = mstate.esp - 8;
                     this.i16 = this.i15 << 2;
                     si32(this.i14,mstate.esp);
                     si32(this.i16,mstate.esp + 4);
                     state = 3;
                     mstate.esp = mstate.esp - 4;
                     FSM_res0_look.start();
                     return;
                  }
                  this.i1 = 1;
                  si32(this.i1,this.i7 + 24);
                  this.i2 = 0;
                  this.i3 = this.i7 + 24;
                  while(this.i2 < this.i5)
                  {
                     this.i2 = this.i2 + 1;
                     this.i1 = this.i1 * this.i11;
                  }
                  this.i2 = 0;
                  si32(this.i1,this.i3);
                  si32(this.i8,this.i7 + 8);
                  mstate.esp = mstate.esp - 8;
                  this.i1 = this.i1 << 2;
                  si32(this.i2,mstate.esp);
                  si32(this.i1,mstate.esp + 4);
                  state = 4;
                  mstate.esp = mstate.esp - 4;
                  FSM_res0_look.start();
                  return;
               }
               this.i8 = 0;
               mstate.esp = mstate.esp - 8;
               this.i4 = this.i4 << 2;
               si32(this.i8,mstate.esp);
               si32(this.i4,mstate.esp + 4);
               state = 2;
               mstate.esp = mstate.esp - 4;
               FSM_res0_look.start();
               return;
            case 2:
               this.i8 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i8 == 0)
               {
                  this.i4 = this.i8;
               }
               else
               {
                  this.i9 = 0;
                  this.i10 = this.i8;
                  memset(this.i10,this.i9,this.i4);
                  this.i4 = this.i8;
               }
               §§goto(addr317);
            case 3:
               this.i14 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i14 == 0)
               {
                  break;
               }
               this.i17 = 0;
               this.i18 = this.i14;
               memset(this.i18,this.i17,this.i16);
               break;
            case 4:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               si32(this.i1,this.i7 + 28);
               this.i1 = this.i5 << 2;
               this.i4 = this.i7 + 28;
               this.i7 = this.i2;
               addr1052:
               this.i8 = this.i2;
               this.i2 = li32(this.i3);
               if(this.i2 <= this.i8)
               {
                  mstate.eax = this.i0;
                  mstate.esp = mstate.ebp;
                  mstate.ebp = li32(mstate.esp);
                  mstate.esp = mstate.esp + 4;
                  mstate.esp = mstate.esp + 4;
                  mstate.gworker = caller;
                  return;
               }
               this.i9 = 0;
               this.i10 = li32(this.i6);
               this.i11 = li32(this.i4);
               mstate.esp = mstate.esp - 8;
               si32(this.i9,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               state = 5;
               mstate.esp = mstate.esp - 4;
               FSM_res0_look.start();
               return;
            case 5:
               this.i12 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i11 = this.i11 + this.i7;
               si32(this.i12,this.i11);
               this.i11 = this.i9;
               this.i12 = this.i8;
               while(true)
               {
                  this.i13 = this.i9;
                  this.i9 = this.i12;
                  this.i2 = this.i2 / this.i10;
                  if(this.i13 >= this.i5)
                  {
                     break;
                  }
                  this.i10 = li32(this.i4);
                  this.i12 = this.i8 << 2;
                  this.i10 = this.i10 + this.i12;
                  this.i10 = li32(this.i10);
                  this.i14 = li32(this.i6);
                  this.i12 = this.i9 / this.i2;
                  this.i15 = this.i12 * this.i2;
                  this.i10 = this.i10 + this.i11;
                  si32(this.i12,this.i10);
                  this.i11 = this.i11 + 4;
                  this.i10 = this.i13 + 1;
                  this.i12 = this.i9 - this.i15;
                  this.i9 = this.i10;
                  this.i10 = this.i14;
               }
               this.i2 = this.i7 + 4;
               this.i8 = this.i8 + 1;
               this.i7 = this.i2;
               this.i2 = this.i8;
               §§goto(addr1052);
         }
         while(true)
         {
            this.i16 = 0;
            this.i11 = this.i11 + this.i12;
            si32(this.i14,this.i11);
            this.i11 = this.i16;
            this.i14 = this.i16;
            while(true)
            {
               this.i16 = this.i11;
               this.i11 = this.i14;
               if(this.i11 >= this.i15)
               {
                  break;
               }
               this.i14 = 1;
               this.i17 = li32(this.i13);
               this.i14 = this.i14 << this.i11;
               this.i14 = this.i17 & this.i14;
               if(this.i14 != 0)
               {
                  this.i14 = this.i9 << 2;
                  this.i17 = li32(this.i4);
                  this.i18 = this.i10 << 2;
                  this.i14 = this.i1 + this.i14;
                  this.i14 = li32(this.i14 + 280);
                  this.i17 = this.i17 + this.i18;
                  this.i17 = li32(this.i17);
                  this.i18 = li32(this.i2);
                  this.i14 = this.i14 * 56;
                  this.i17 = this.i17 + this.i16;
                  this.i14 = this.i18 + this.i14;
                  si32(this.i14,this.i17);
                  this.i9 = this.i9 + 1;
               }
               this.i14 = this.i16 + 4;
               this.i16 = this.i11 + 1;
               this.i11 = this.i14;
               this.i14 = this.i16;
            }
            §§goto(addr692);
         }
      }
   }
}
