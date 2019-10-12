package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_floor1_interpolate_fit extends Machine
   {
      
      public static const intRegCount:int = 13;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i10:int;
      
      public var i11:int;
      
      public var i12:int;
      
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
      
      public function FSM_floor1_interpolate_fit()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_floor1_interpolate_fit = null;
         _loc1_ = new FSM_floor1_interpolate_fit();
         FSM_floor1_interpolate_fit.gworker = _loc1_;
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
               this.i0 = li32(mstate.ebp + 12);
               this.i0 = li32(this.i0 + 1284);
               this.i1 = li32(mstate.ebp + 20);
               this.i2 = li32(mstate.ebp + 16);
               this.i3 = li32(mstate.ebp + 8);
               this.i4 = li32(mstate.ebp + 24);
               this.i5 = this.i1;
               if(this.i2 != 0)
               {
                  if(this.i1 != 0)
                  {
                     this.i1 = 0;
                     mstate.esp = mstate.esp - 8;
                     this.i6 = this.i0 << 2;
                     si32(this.i3,mstate.esp);
                     si32(this.i6,mstate.esp + 4);
                     state = 1;
                     mstate.esp = mstate.esp - 4;
                     FSM_floor1_interpolate_fit.start();
                     return;
                  }
               }
               this.i0 = 0;
               break;
            case 1:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i6 = 65536 - this.i4;
               this.i7 = this.i3;
               this.i8 = this.i1;
               while(this.i1 < this.i0)
               {
                  this.i9 = this.i5 + this.i8;
                  this.i10 = this.i2 + this.i8;
                  this.i11 = li32(this.i10);
                  this.i12 = li32(this.i9);
                  this.i12 = this.i12 & 32767;
                  this.i11 = this.i11 & 32767;
                  this.i12 = this.i12 * this.i4;
                  this.i11 = this.i6 * this.i11;
                  this.i11 = this.i11 + this.i12;
                  this.i11 = this.i11 + 32768;
                  this.i12 = this.i7 + this.i8;
                  this.i11 = this.i11 >> 16;
                  si32(this.i11,this.i12);
                  this.i10 = li32(this.i10);
                  this.i10 = this.i10 & 32768;
                  if(this.i10 != 0)
                  {
                     this.i9 = li32(this.i9);
                     this.i9 = this.i9 & 32768;
                     if(this.i9 != 0)
                     {
                        this.i9 = this.i11 | 32768;
                        si32(this.i9,this.i12);
                     }
                  }
                  this.i8 = this.i8 + 4;
                  this.i1 = this.i1 + 1;
               }
               this.i0 = this.i3;
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
