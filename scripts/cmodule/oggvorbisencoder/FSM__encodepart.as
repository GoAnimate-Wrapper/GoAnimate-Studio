package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM__encodepart extends Machine
   {
      
      public static const intRegCount:int = 32;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i21:int;
      
      public var i30:int;
      
      public var i31:int;
      
      public var i10:int;
      
      public var i11:int;
      
      public var i12:int;
      
      public var i13:int;
      
      public var i14:int;
      
      public var i15:int;
      
      public var i17:int;
      
      public var i19:int;
      
      public var i16:int;
      
      public var i18:int;
      
      public var i0:int;
      
      public var i1:int;
      
      public var i22:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public var i5:int;
      
      public var i6:int;
      
      public var i7:int;
      
      public var i8:int;
      
      public var i2:int;
      
      public var i23:int;
      
      public var i24:int;
      
      public var i25:int;
      
      public var i26:int;
      
      public var i27:int;
      
      public var i20:int;
      
      public var i9:int;
      
      public var i28:int;
      
      public var i29:int;
      
      public function FSM__encodepart()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM__encodepart = null;
         _loc1_ = new FSM__encodepart();
         FSM__encodepart.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 244;
               this.i0 = mstate.ebp + -64;
               this.i1 = li32(mstate.ebp + 20);
               this.i2 = li32(this.i1);
               this.i3 = mstate.ebp + -32;
               this.i4 = li32(mstate.ebp + 16);
               this.i5 = li32(mstate.ebp + 12);
               this.i6 = this.i2 << 2;
               si32(this.i6,mstate.ebp + -72);
               this.i6 = 0;
               this.i7 = this.i1 + 4;
               this.i8 = this.i0 + 28;
               si32(this.i8,mstate.ebp + -81);
               this.i8 = this.i0 + 24;
               si32(this.i8,mstate.ebp + -90);
               this.i8 = this.i0 + 20;
               si32(this.i8,mstate.ebp + -99);
               this.i8 = this.i0 + 16;
               si32(this.i8,mstate.ebp + -108);
               this.i8 = this.i0 + 12;
               si32(this.i8,mstate.ebp + -117);
               this.i8 = this.i0 + 8;
               si32(this.i8,mstate.ebp + -126);
               this.i8 = this.i0 + 4;
               si32(this.i8,mstate.ebp + -135);
               this.i8 = this.i1 + 12;
               si32(this.i8,mstate.ebp + -144);
               this.i8 = this.i3 + 28;
               si32(this.i8,mstate.ebp + -153);
               this.i8 = this.i3 + 24;
               si32(this.i8,mstate.ebp + -162);
               this.i8 = this.i3 + 20;
               si32(this.i8,mstate.ebp + -171);
               this.i8 = this.i3 + 16;
               si32(this.i8,mstate.ebp + -180);
               this.i8 = this.i3 + 12;
               si32(this.i8,mstate.ebp + -189);
               this.i8 = this.i3 + 8;
               si32(this.i8,mstate.ebp + -198);
               this.i8 = this.i3 + 4;
               si32(this.i8,mstate.ebp + -207);
               this.i8 = this.i1 + 44;
               si32(this.i8,mstate.ebp + -216);
               this.i8 = this.i1 + 52;
               this.i9 = this.i1 + 48;
               si32(this.i9,mstate.ebp + -225);
               this.i4 = this.i4 / this.i2;
               si32(this.i4,mstate.ebp + -234);
               this.i4 = li32(mstate.ebp + 8);
               si32(this.i4,mstate.ebp + -243);
               this.i4 = this.i0;
               this.i9 = this.i3;
               this.i10 = this.i1;
               this.i11 = this.i0;
               this.i12 = this.i3;
               this.i13 = this.i5;
               this.i14 = this.i6;
               this.i15 = this.i6;
               break;
            case 1:
               this.i6 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               this.i17 = li32(mstate.ebp + -72);
               this.i13 = this.i17 + this.i13;
               this.i16 = this.i2 + this.i16;
               this.i17 = this.i14 + 1;
               this.i6 = this.i6 + this.i15;
               this.i14 = this.i16;
               this.i15 = this.i17;
         }
         this.i16 = this.i14;
         this.i14 = this.i15;
         this.i15 = this.i6;
         this.i6 = this.i13;
         this.i17 = li32(mstate.ebp + -234);
         if(this.i14 >= this.i17)
         {
            mstate.eax = this.i15;
            mstate.esp = mstate.ebp;
            mstate.ebp = li32(mstate.esp);
            mstate.esp = mstate.esp + 4;
            mstate.esp = mstate.esp + 4;
            mstate.gworker = caller;
            return;
         }
         this.i17 = 0;
         this.i18 = li32(mstate.ebp + -216);
         this.i18 = li32(this.i18);
         this.i19 = li32(this.i10);
         this.i20 = li32(mstate.ebp + -225);
         this.i20 = li32(this.i20);
         this.i21 = li32(this.i8);
         si32(this.i17,this.i9);
         this.i22 = li32(mstate.ebp + -207);
         si32(this.i17,this.i22);
         this.i22 = li32(mstate.ebp + -198);
         si32(this.i17,this.i22);
         this.i22 = li32(mstate.ebp + -189);
         si32(this.i17,this.i22);
         this.i22 = li32(mstate.ebp + -180);
         si32(this.i17,this.i22);
         this.i22 = li32(mstate.ebp + -171);
         si32(this.i17,this.i22);
         this.i22 = li32(mstate.ebp + -162);
         si32(this.i17,this.i22);
         this.i22 = li32(mstate.ebp + -153);
         si32(this.i17,this.i22);
         this.i17 = this.i18 >> 1;
         if(this.i21 != 1)
         {
            this.i22 = 0;
            this.i23 = this.i19 + this.i16;
            this.i23 = this.i23 << 2;
            this.i24 = this.i19 << 2;
            this.i24 = this.i12 + this.i24;
            this.i23 = this.i5 + this.i23;
            this.i25 = this.i18 + -1;
            this.i26 = this.i21 >> 1;
            this.i27 = this.i22;
            this.i28 = this.i22;
            while(this.i28 < this.i19)
            {
               this.i29 = this.i23 + this.i27;
               this.i29 = li32(this.i29 + -4);
               this.i29 = this.i29 - this.i20;
               this.i29 = this.i29 + this.i26;
               this.i29 = this.i29 / this.i21;
               if(this.i29 < this.i17)
               {
                  this.i30 = this.i17 - this.i29;
                  this.i30 = this.i30 << 1;
                  this.i30 = this.i30 + -1;
               }
               else
               {
                  this.i30 = this.i29 - this.i17;
                  this.i30 = this.i30 << 1;
               }
               this.i22 = this.i22 * this.i18;
               if(this.i30 <= -1)
               {
                  this.i30 = 0;
               }
               else if(this.i30 >= this.i18)
               {
                  this.i30 = this.i25;
               }
               this.i29 = this.i29 * this.i21;
               this.i31 = this.i24 + this.i27;
               this.i29 = this.i29 + this.i20;
               si32(this.i29,this.i31 + -4);
               this.i27 = this.i27 + -4;
               this.i28 = this.i28 + 1;
               this.i22 = this.i22 + this.i30;
            }
            this.i17 = this.i22;
         }
         else
         {
            this.i22 = 0;
            this.i23 = this.i19 + this.i16;
            this.i23 = this.i23 << 2;
            this.i24 = this.i19 << 2;
            this.i24 = this.i12 + this.i24;
            this.i23 = this.i5 + this.i23;
            this.i25 = this.i18 + -1;
            this.i26 = this.i22;
            this.i27 = this.i22;
            while(true)
            {
               this.i28 = this.i26;
               this.i26 = this.i27;
               if(this.i26 >= this.i19)
               {
                  break;
               }
               this.i27 = this.i23 + this.i28;
               this.i27 = li32(this.i27 + -4);
               this.i27 = this.i27 - this.i20;
               if(this.i27 < this.i17)
               {
                  this.i29 = this.i17 - this.i27;
                  this.i29 = this.i29 << 1;
                  this.i29 = this.i29 + -1;
               }
               else
               {
                  this.i29 = this.i27 - this.i17;
                  this.i29 = this.i29 << 1;
               }
               this.i22 = this.i22 * this.i18;
               if(this.i29 <= -1)
               {
                  this.i29 = 0;
               }
               else if(this.i29 >= this.i18)
               {
                  this.i29 = this.i25;
               }
               this.i27 = this.i27 * this.i21;
               this.i30 = this.i24 + this.i28;
               this.i27 = this.i27 + this.i20;
               si32(this.i27,this.i30 + -4);
               this.i27 = this.i28 + -4;
               this.i28 = this.i26 + 1;
               this.i22 = this.i22 + this.i29;
               this.i26 = this.i27;
               this.i27 = this.i28;
            }
            this.i17 = this.i22;
         }
         this.i22 = li32(mstate.ebp + -144);
         this.i22 = li32(this.i22);
         this.i23 = li32(this.i22 + 8);
         this.i24 = this.i17 << 2;
         this.i23 = this.i23 + this.i24;
         this.i23 = li32(this.i23);
         this.i22 = this.i22 + 8;
         if(this.i23 < 1)
         {
            this.i23 = 0;
            si32(this.i23,this.i4);
            this.i24 = li32(mstate.ebp + -135);
            si32(this.i23,this.i24);
            this.i24 = li32(mstate.ebp + -126);
            si32(this.i23,this.i24);
            this.i24 = li32(mstate.ebp + -117);
            si32(this.i23,this.i24);
            this.i24 = li32(mstate.ebp + -108);
            si32(this.i23,this.i24);
            this.i24 = li32(mstate.ebp + -99);
            si32(this.i23,this.i24);
            this.i18 = this.i18 + -1;
            this.i24 = li32(mstate.ebp + -90);
            si32(this.i23,this.i24);
            this.i18 = this.i21 * this.i18;
            this.i21 = li32(mstate.ebp + -81);
            si32(this.i23,this.i21);
            this.i18 = this.i20 + this.i18;
            this.i20 = -1;
            this.i21 = this.i23;
            while(true)
            {
               this.i24 = li32(this.i7);
               if(this.i24 <= this.i23)
               {
                  break;
               }
               this.i24 = li32(this.i22);
               this.i24 = this.i24 + this.i21;
               this.i24 = li32(this.i24);
               if(this.i24 <= 0)
               {
                  addr1135:
               }
               else
               {
                  this.i24 = 0;
                  this.i25 = this.i2 * this.i14;
                  this.i25 = this.i25 << 2;
                  this.i25 = this.i25 + this.i5;
                  this.i26 = this.i24;
                  this.i27 = this.i24;
                  while(this.i27 < this.i19)
                  {
                     this.i28 = this.i25 + this.i26;
                     this.i29 = this.i11 + this.i26;
                     this.i29 = li32(this.i29);
                     this.i28 = li32(this.i28);
                     this.i28 = this.i29 - this.i28;
                     this.i28 = this.i28 * this.i28;
                     this.i26 = this.i26 + 4;
                     this.i27 = this.i27 + 1;
                     this.i24 = this.i28 + this.i24;
                  }
                  if(this.i20 != -1)
                  {
                     if(this.i24 >= this.i20)
                     {
                        §§goto(addr1135);
                     }
                  }
                  this.i17 = li32(this.i0);
                  this.i20 = li32(this.i0 + 4);
                  this.i25 = li32(this.i0 + 8);
                  this.i26 = li32(this.i0 + 12);
                  this.i27 = li32(this.i0 + 16);
                  this.i28 = li32(this.i0 + 20);
                  this.i29 = li32(this.i0 + 24);
                  this.i30 = li32(this.i0 + 28);
                  si32(this.i17,this.i3);
                  si32(this.i20,this.i3 + 4);
                  si32(this.i25,this.i3 + 8);
                  si32(this.i26,this.i3 + 12);
                  si32(this.i27,this.i3 + 16);
                  si32(this.i28,this.i3 + 20);
                  si32(this.i29,this.i3 + 24);
                  si32(this.i30,this.i3 + 28);
                  this.i17 = this.i23;
                  this.i20 = this.i24;
               }
               this.i24 = this.i11;
               while(true)
               {
                  this.i25 = this.i24;
                  this.i26 = li32(this.i25);
                  this.i24 = this.i25;
                  if(this.i26 < this.i18)
                  {
                     break;
                  }
                  this.i26 = 0;
                  si32(this.i26,this.i24);
                  this.i24 = this.i25 + 4;
               }
               if(this.i26 > -1)
               {
                  this.i25 = li32(this.i8);
                  this.i26 = this.i26 + this.i25;
                  si32(this.i26,this.i24);
               }
               this.i25 = this.i26;
               this.i25 = 0 - this.i25;
               si32(this.i25,this.i24);
               this.i21 = this.i21 + 4;
               this.i23 = this.i23 + 1;
            }
         }
         if(this.i17 >= 0)
         {
            this.i18 = 0;
            this.i20 = this.i12;
            while(true)
            {
               this.i21 = this.i6;
               this.i6 = this.i20;
               if(this.i18 >= this.i19)
               {
                  break;
               }
               this.i22 = li32(this.i21);
               this.i6 = li32(this.i6);
               this.i6 = this.i22 - this.i6;
               si32(this.i6,this.i21);
               this.i6 = this.i20 + 4;
               this.i18 = this.i18 + 1;
               this.i21 = this.i21 + 4;
               this.i20 = this.i6;
               this.i6 = this.i21;
            }
         }
         mstate.esp = mstate.esp - 12;
         si32(this.i1,mstate.esp);
         si32(this.i17,mstate.esp + 4);
         this.i6 = li32(mstate.ebp + -243);
         si32(this.i6,mstate.esp + 8);
         state = 1;
         mstate.esp = mstate.esp - 4;
         FSM__encodepart.start();
      }
   }
}
