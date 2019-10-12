package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_floor1_look extends Machine
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
      
      public function FSM_floor1_look()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_floor1_look = null;
         _loc1_ = new FSM_floor1_look();
         FSM_floor1_look.gworker = _loc1_;
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
               this.i0 = 1312;
               mstate.esp = mstate.esp - 8;
               this.i1 = 0;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               state = 1;
               mstate.esp = mstate.esp - 4;
               FSM_floor1_look.start();
               return;
            case 1:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i1 = li32(mstate.ebp + 12);
               this.i2 = mstate.ebp + -272;
               this.i3 = this.i1;
               this.i4 = this.i1;
               if(this.i0 != 0)
               {
                  this.i5 = 0;
                  this.i6 = this.i0;
                  this.i7 = 1312;
                  memset(this.i6,this.i5,this.i7);
               }
               this.i5 = 0;
               si32(this.i4,this.i0 + 1296);
               this.i6 = li32(this.i4 + 840);
               si32(this.i6,this.i0 + 1288);
               this.i6 = li32(this.i1);
               this.i7 = this.i3 + 4;
               this.i8 = this.i0 + 1288;
               this.i9 = this.i0;
               this.i10 = this.i0;
               this.i11 = this.i5;
               while(true)
               {
                  this.i12 = this.i7;
                  this.i7 = this.i11;
                  this.i11 = this.i5;
                  this.i5 = this.i12;
                  if(this.i6 <= this.i7)
                  {
                     break;
                  }
                  this.i5 = li32(this.i5);
                  this.i5 = this.i5 << 2;
                  this.i5 = this.i4 + this.i5;
                  this.i5 = li32(this.i5 + 128);
                  this.i12 = this.i12 + 4;
                  this.i13 = this.i7 + 1;
                  this.i5 = this.i5 + this.i11;
                  this.i7 = this.i12;
                  this.i11 = this.i13;
               }
               this.i5 = 0;
               this.i6 = this.i11 + 2;
               si32(this.i6,this.i10 + 1284);
               this.i7 = this.i3 + 836;
               this.i12 = this.i5;
               while(this.i5 < this.i6)
               {
                  this.i13 = this.i2 + this.i12;
                  this.i14 = this.i7 + this.i12;
                  si32(this.i14,this.i13);
                  this.i12 = this.i12 + 4;
                  this.i5 = this.i5 + 1;
               }
               this.i5 = FSM_floor1_look;
               mstate.esp = mstate.esp - 12;
               this.i7 = mstate.ebp + -272;
               si32(this.i7,mstate.esp);
               si32(this.i6,mstate.esp + 4);
               si32(this.i5,mstate.esp + 8);
               state = 2;
               mstate.esp = mstate.esp - 4;
               FSM_floor1_look.start();
               return;
            case 2:
               mstate.esp = mstate.esp + 12;
               this.i1 = this.i1 + 836;
               this.i5 = 0;
               this.i7 = this.i5;
               while(this.i5 < this.i6)
               {
                  this.i12 = this.i2 + this.i7;
                  this.i12 = li32(this.i12);
                  this.i12 = this.i12 - this.i1;
                  this.i13 = this.i9 + this.i7;
                  this.i12 = this.i12 >> 2;
                  si32(this.i12,this.i13 + 260);
                  this.i7 = this.i7 + 4;
                  this.i5 = this.i5 + 1;
               }
               this.i2 = 0;
               this.i1 = this.i9 + 260;
               while(true)
               {
                  this.i5 = this.i1;
                  this.i1 = this.i5;
                  if(this.i2 >= this.i6)
                  {
                     break;
                  }
                  this.i1 = li32(this.i1);
                  this.i1 = this.i1 << 2;
                  this.i1 = this.i10 + this.i1;
                  si32(this.i2,this.i1 + 520);
                  this.i1 = this.i5 + 4;
                  this.i2 = this.i2 + 1;
               }
               this.i1 = 0;
               this.i2 = this.i9;
               while(true)
               {
                  this.i5 = this.i2;
                  this.i2 = this.i1;
                  this.i1 = this.i5;
                  if(this.i2 >= this.i6)
                  {
                     break;
                  }
                  this.i7 = li32(this.i5 + 260);
                  this.i7 = this.i7 << 2;
                  this.i7 = this.i4 + this.i7;
                  this.i7 = li32(this.i7 + 836);
                  si32(this.i7,this.i1);
                  this.i1 = this.i5 + 4;
                  this.i5 = this.i2 + 1;
                  this.i2 = this.i1;
                  this.i1 = this.i5;
               }
               this.i1 = li32(this.i4 + 832);
               if(this.i1 <= 2)
               {
                  if(this.i1 != 1)
                  {
                     if(this.i1 != 2)
                     {
                        addr593:
                        this.i10 = 0;
                        this.i1 = this.i10;
                     }
                     else
                     {
                        this.i1 = 128;
                        si32(this.i1,this.i10 + 1292);
                        this.i10 = 0;
                        this.i1 = this.i10;
                     }
                  }
                  else
                  {
                     this.i1 = 256;
                     si32(this.i1,this.i10 + 1292);
                     this.i10 = 0;
                     this.i1 = this.i10;
                  }
               }
               else if(this.i1 != 3)
               {
                  if(this.i1 != 4)
                  {
                     §§goto(addr593);
                  }
                  else
                  {
                     this.i1 = 64;
                     si32(this.i1,this.i10 + 1292);
                     this.i10 = 0;
                     this.i1 = this.i10;
                  }
               }
               else
               {
                  this.i1 = 86;
                  si32(this.i1,this.i10 + 1292);
                  this.i10 = 0;
                  this.i1 = this.i10;
               }
               while(true)
               {
                  this.i2 = this.i1;
                  this.i1 = this.i10;
                  if(this.i11 <= this.i1)
                  {
                     break;
                  }
                  this.i10 = 1;
                  this.i4 = this.i3 + this.i2;
                  this.i5 = li32(this.i8);
                  this.i4 = li32(this.i4 + 844);
                  this.i6 = 0;
                  this.i7 = this.i3 + 836;
                  this.i12 = this.i1 + 2;
                  this.i13 = this.i6;
                  this.i14 = this.i6;
                  while(true)
                  {
                     this.i15 = this.i7;
                     this.i16 = this.i13;
                     this.i7 = this.i14;
                     this.i13 = this.i10;
                     this.i10 = this.i15;
                     if(this.i12 <= this.i16)
                     {
                        break;
                     }
                     this.i10 = li32(this.i10);
                     this.i14 = this.i10 > this.i6?1:0;
                     this.i17 = this.i10 < this.i4?1:0;
                     this.i18 = this.i10 < this.i5?1:0;
                     this.i19 = this.i10 > this.i4?1:0;
                     this.i14 = this.i14 & this.i17;
                     this.i17 = this.i18 & this.i19;
                     this.i14 = this.i14 & 1;
                     this.i17 = this.i17 & 1;
                     this.i18 = this.i14 != 0?int(this.i16):int(this.i7);
                     this.i6 = this.i14 != 0?int(this.i10):int(this.i6);
                     this.i19 = this.i17 != 0?int(this.i16):int(this.i13);
                     this.i5 = this.i17 != 0?int(this.i10):int(this.i5);
                     this.i10 = this.i15 + 4;
                     this.i13 = this.i16 + 1;
                     this.i7 = this.i10;
                     this.i14 = this.i18;
                     this.i10 = this.i19;
                  }
                  this.i10 = this.i9 + this.i2;
                  si32(this.i7,this.i10 + 1032);
                  si32(this.i13,this.i10 + 780);
                  this.i2 = this.i2 + 4;
                  this.i10 = this.i1 + 1;
                  this.i1 = this.i2;
               }
               mstate.eax = this.i0;
               mstate.esp = mstate.ebp;
               mstate.ebp = li32(mstate.esp);
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp + 4;
               mstate.gworker = caller;
               return;
         }
      }
   }
}
