package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_res2_class extends Machine
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
      
      public function FSM_res2_class()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_res2_class = null;
         _loc1_ = new FSM_res2_class();
         FSM_res2_class.gworker = _loc1_;
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
               while(true)
               {
                  this.i8 = this.i5;
                  this.i5 = this.i0;
                  this.i0 = this.i8;
                  if(this.i7 >= this.i4)
                  {
                     break;
                  }
                  this.i0 = li32(this.i0);
                  this.i0 = this.i0 != 0?1:0;
                  this.i0 = this.i0 & 1;
                  this.i8 = this.i8 + 4;
                  this.i7 = this.i7 + 1;
                  this.i0 = this.i5 + this.i0;
                  this.i5 = this.i8;
               }
               if(this.i5 != 0)
               {
                  this.i0 = 4;
                  this.i5 = li32(this.i2);
                  this.i7 = li32(this.i5 + 12);
                  this.i8 = li32(this.i5 + 8);
                  this.i9 = li32(this.i5 + 4);
                  this.i10 = li32(this.i5);
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i0,mstate.esp + 4);
                  state = 1;
                  mstate.esp = mstate.esp - 4;
                  FSM_res2_class.start();
                  return;
               }
               this.i0 = 0;
               break;
            case 1:
               this.i0 = mstate.eax;
               this.i9 = this.i9 - this.i10;
               mstate.esp = mstate.esp + 8;
               this.i9 = this.i9 / this.i8;
               mstate.esp = mstate.esp - 8;
               this.i10 = this.i9 << 2;
               si32(this.i1,mstate.esp);
               si32(this.i10,mstate.esp + 4);
               state = 2;
               mstate.esp = mstate.esp - 4;
               FSM_res2_class.start();
               return;
            case 2:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               si32(this.i1,this.i0);
               this.i11 = 0;
               this.i12 = this.i11;
               memset(this.i1,this.i12,this.i10);
               this.i1 = li32(this.i5);
               this.i7 = this.i7 + -1;
               this.i1 = this.i1 / this.i4;
               this.i10 = this.i11;
               while(true)
               {
                  this.i12 = this.i1;
                  if(this.i11 < this.i9)
                  {
                     this.i16 = 0;
                     this.i13 = this.i12 << 2;
                     this.i1 = this.i16;
                     this.i14 = this.i13;
                     this.i13 = this.i12;
                     this.i12 = this.i16;
                     while(true)
                     {
                        this.i15 = this.i1;
                        this.i1 = this.i16;
                        if(this.i15 >= this.i8)
                        {
                           break;
                        }
                        this.i16 = 1;
                        this.i17 = li32(this.i3);
                        this.i17 = this.i17 + this.i14;
                        this.i17 = li32(this.i17);
                        this.i18 = this.i17 >> 31;
                        this.i17 = this.i17 + this.i18;
                        this.i17 = this.i17 ^ this.i18;
                        this.i12 = this.i17 > this.i12?int(this.i17):int(this.i12);
                        this.i17 = this.i6 + 4;
                        while(true)
                        {
                           this.i18 = this.i17;
                           this.i17 = this.i16;
                           this.i16 = this.i1;
                           this.i1 = this.i18;
                           if(this.i17 >= this.i4)
                           {
                              break;
                           }
                           this.i1 = li32(this.i1);
                           this.i19 = this.i13 << 2;
                           this.i1 = this.i1 + this.i19;
                           this.i1 = li32(this.i1);
                           this.i19 = this.i1 >> 31;
                           this.i1 = this.i1 + this.i19;
                           this.i1 = this.i1 ^ this.i19;
                           this.i1 = this.i1 > this.i16?int(this.i1):int(this.i16);
                           this.i16 = this.i18 + 4;
                           this.i18 = this.i17 + 1;
                           this.i17 = this.i16;
                           this.i16 = this.i18;
                        }
                        this.i1 = this.i4 + this.i15;
                        this.i14 = this.i14 + 4;
                        this.i13 = this.i13 + 1;
                     }
                     this.i14 = 0;
                     this.i16 = this.i5;
                     while(this.i7 > this.i14)
                     {
                        this.i15 = li32(this.i16 + 2328);
                        if(this.i15 >= this.i12)
                        {
                           this.i15 = li32(this.i16 + 2584);
                           if(this.i15 >= this.i1)
                           {
                              break;
                           }
                        }
                        this.i16 = this.i16 + 4;
                        this.i14 = this.i14 + 1;
                     }
                     this.i1 = li32(this.i0);
                     this.i1 = this.i1 + this.i10;
                     si32(this.i14,this.i1);
                     this.i1 = this.i10 + 4;
                     this.i11 = this.i11 + 1;
                     this.i10 = this.i1;
                     this.i1 = this.i13;
                     continue;
                  }
                  break;
               }
               this.i1 = li32(this.i2 + 40);
               this.i1 = this.i1 + 1;
               si32(this.i1,this.i2 + 40);
         }
         mstate.eax = this.i0;
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
