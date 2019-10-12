package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_res2_forward extends Machine
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
      
      public function FSM_res2_forward()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_res2_forward = null;
         _loc1_ = new FSM_res2_forward();
         FSM_res2_forward.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 4;
               this.i0 = 0;
               this.i1 = li32(mstate.ebp + 12);
               this.i2 = li32(this.i1 + 36);
               this.i3 = this.i2 >>> 31;
               this.i2 = this.i2 + this.i3;
               this.i3 = li32(mstate.ebp + 28);
               this.i2 = this.i2 >> 1;
               this.i4 = this.i2 * this.i3;
               mstate.esp = mstate.esp - 8;
               this.i4 = this.i4 << 2;
               si32(this.i1,mstate.esp);
               si32(this.i4,mstate.esp + 4);
               state = 1;
               mstate.esp = mstate.esp - 4;
               FSM_res2_forward.start();
               return;
            case 1:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               si32(this.i1,mstate.ebp + -4);
               this.i1 = li32(mstate.ebp + 24);
               this.i4 = li32(mstate.ebp + 20);
               this.i5 = li32(mstate.ebp + 8);
               this.i6 = li32(mstate.ebp + 16);
               this.i7 = li32(mstate.ebp + 32);
               this.i8 = li32(mstate.ebp + 36);
               this.i9 = this.i0;
               this.i10 = this.i0;
               while(true)
               {
                  this.i11 = this.i9;
                  this.i9 = this.i10;
                  if(this.i9 >= this.i3)
                  {
                     break;
                  }
                  this.i10 = 0;
                  this.i12 = this.i1 + this.i11;
                  this.i12 = li32(this.i12);
                  this.i12 = this.i12 != 0?1:0;
                  this.i13 = this.i4 + this.i11;
                  this.i13 = li32(this.i13);
                  this.i12 = this.i12 & 1;
                  this.i14 = this.i3 << 2;
                  this.i0 = this.i0 + this.i12;
                  this.i12 = this.i11;
                  while(true)
                  {
                     this.i15 = this.i13;
                     this.i13 = this.i15;
                     if(this.i10 >= this.i2)
                     {
                        break;
                     }
                     this.i16 = li32(mstate.ebp + -4);
                     this.i13 = li32(this.i13);
                     this.i16 = this.i16 + this.i12;
                     si32(this.i13,this.i16);
                     this.i12 = this.i14 + this.i12;
                     this.i13 = this.i15 + 4;
                     this.i10 = this.i10 + 1;
                  }
                  this.i10 = this.i11 + 4;
                  this.i11 = this.i9 + 1;
                  this.i9 = this.i10;
                  this.i10 = this.i11;
               }
               if(this.i0 != 0)
               {
                  this.i0 = 1;
                  mstate.esp = mstate.esp - 24;
                  this.i1 = mstate.ebp + -4;
                  si32(this.i5,mstate.esp);
                  si32(this.i6,mstate.esp + 4);
                  si32(this.i1,mstate.esp + 8);
                  si32(this.i0,mstate.esp + 12);
                  si32(this.i7,mstate.esp + 16);
                  si32(this.i8,mstate.esp + 20);
                  state = 2;
                  mstate.esp = mstate.esp - 4;
                  FSM_res2_forward.start();
                  return;
               }
               this.i0 = 0;
               break;
            case 2:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 24;
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
