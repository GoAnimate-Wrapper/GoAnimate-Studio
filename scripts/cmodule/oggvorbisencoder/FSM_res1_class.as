package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_res1_class extends Machine
   {
      
      public static const intRegCount:int = 22;
      
      public static const NumberRegCount:int = 3;
       
      
      public var f0:Number;
      
      public var f1:Number;
      
      public var f2:Number;
      
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
      
      public var i2:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public var i5:int;
      
      public var i6:int;
      
      public var i7:int;
      
      public var i8:int;
      
      public var i9:int;
      
      public var i20:int;
      
      public var i21:int;
      
      public function FSM_res1_class()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_res1_class = null;
         _loc1_ = new FSM_res1_class();
         FSM_res1_class.gworker = _loc1_;
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
               this.i0 = 0;
               this.i1 = li32(mstate.ebp + 8);
               this.i2 = li32(mstate.ebp + 12);
               this.i3 = li32(mstate.ebp + 16);
               this.i4 = li32(mstate.ebp + 24);
               this.i5 = li32(mstate.ebp + 20);
               this.i6 = this.i3;
               this.i7 = this.i0;
               this.i8 = this.i0;
               while(true)
               {
                  this.i9 = this.i7;
                  this.i7 = this.i8;
                  if(this.i7 >= this.i4)
                  {
                     break;
                  }
                  this.i8 = this.i5 + this.i9;
                  this.i8 = li32(this.i8);
                  if(this.i8 != 0)
                  {
                     this.i8 = this.i0 << 2;
                     this.i10 = this.i6 + this.i9;
                     this.i10 = li32(this.i10);
                     this.i8 = this.i3 + this.i8;
                     si32(this.i10,this.i8);
                     this.i0 = this.i0 + 1;
                  }
                  this.i8 = this.i9 + 4;
                  this.i9 = this.i7 + 1;
                  this.i7 = this.i8;
                  this.i8 = this.i9;
               }
               if(this.i0 != 0)
               {
                  this.i3 = 0;
                  this.i4 = li32(this.i2);
                  this.i5 = li32(this.i4 + 8);
                  this.i7 = li32(this.i4 + 12);
                  this.i8 = li32(this.i4 + 4);
                  this.i9 = li32(this.i4);
                  mstate.esp = mstate.esp - 8;
                  this.i10 = this.i0 << 2;
                  si32(this.i1,mstate.esp);
                  si32(this.i10,mstate.esp + 4);
                  this.f0 = Number(this.i5);
                  this.f0 = 100 / this.f0;
                  state = 1;
                  mstate.esp = mstate.esp - 4;
                  FSM_res1_class.start();
                  return;
               }
               this.i0 = 0;
               mstate.eax = this.i0;
               break;
            case 1:
               this.i10 = mstate.eax;
               this.i8 = this.i8 - this.i9;
               mstate.esp = mstate.esp + 8;
               this.f0 = this.f0;
               this.i8 = this.i8 / this.i5;
               this.i9 = this.i10;
               this.i11 = this.i4;
               this.i12 = this.i9;
               addr380:
               this.i13 = this.i12;
               this.i12 = this.i3;
               this.i3 = this.i13;
               if(this.i12 >= this.i0)
               {
                  this.i1 = 0;
                  this.i3 = this.i7 + -1;
                  this.i7 = this.i1;
                  while(this.i1 < this.i8)
                  {
                     this.i12 = 0;
                     this.i13 = li32(this.i4);
                     this.i14 = this.i12;
                     while(this.i12 < this.i0)
                     {
                        this.i15 = 0;
                        this.i16 = this.i13 + this.i7;
                        this.i16 = this.i16 << 2;
                        this.i17 = this.i6 + this.i14;
                        this.i18 = this.i15;
                        this.i19 = this.i15;
                        while(true)
                        {
                           this.i20 = this.i18;
                           this.i18 = this.i19;
                           if(this.i20 >= this.i5)
                           {
                              break;
                           }
                           this.i19 = li32(this.i17);
                           this.i19 = this.i19 + this.i16;
                           this.i19 = li32(this.i19);
                           this.i21 = this.i19 >> 31;
                           this.i19 = this.i19 + this.i21;
                           this.i19 = this.i19 ^ this.i21;
                           this.i21 = this.i19 > this.i18?int(this.i19):int(this.i18);
                           this.i16 = this.i16 + 4;
                           this.i18 = this.i20 + 1;
                           this.i15 = this.i19 + this.i15;
                           this.i19 = this.i21;
                        }
                        this.i16 = 0;
                        this.f1 = Number(this.i15);
                        this.f2 = this.f0;
                        this.f1 = this.f1;
                        this.f1 = this.f1 * this.f2;
                        this.f1 = this.f1;
                        this.i15 = int(this.f1);
                        this.i17 = this.i11;
                        for(; this.i3 > this.i16; this.i17 = this.i17 + 4,this.i16 = this.i16 + 1)
                        {
                           this.i19 = li32(this.i17 + 2328);
                           if(this.i19 >= this.i18)
                           {
                              this.i19 = li32(this.i17 + 2584);
                              if(this.i19 >= 0)
                              {
                                 if(this.i19 <= this.i15)
                                 {
                                    continue;
                                 }
                                 break;
                              }
                              break;
                           }
                        }
                        this.i15 = this.i9 + this.i14;
                        this.i15 = li32(this.i15);
                        this.i17 = this.i1 << 2;
                        this.i15 = this.i15 + this.i17;
                        si32(this.i16,this.i15);
                        this.i14 = this.i14 + 4;
                        this.i12 = this.i12 + 1;
                     }
                     this.i7 = this.i5 + this.i7;
                     this.i1 = this.i1 + 1;
                  }
                  this.i0 = li32(this.i2 + 40);
                  this.i0 = this.i0 + 1;
                  si32(this.i0,this.i2 + 40);
                  mstate.eax = this.i10;
                  break;
               }
               this.i14 = 0;
               mstate.esp = mstate.esp - 8;
               this.i15 = this.i8 << 2;
               si32(this.i1,mstate.esp);
               si32(this.i15,mstate.esp + 4);
               state = 2;
               mstate.esp = mstate.esp - 4;
               FSM_res1_class.start();
               return;
            case 2:
               this.i16 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               si32(this.i16,this.i3);
               memset(this.i16,this.i14,this.i15);
               this.i3 = this.i13 + 4;
               this.i13 = this.i12 + 1;
               this.i12 = this.i3;
               this.i3 = this.i13;
               §§goto(addr380);
         }
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
