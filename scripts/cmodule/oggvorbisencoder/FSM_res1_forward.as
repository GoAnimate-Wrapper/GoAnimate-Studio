package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_res1_forward extends Machine
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
      
      public function FSM_res1_forward()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_res1_forward = null;
         _loc1_ = new FSM_res1_forward();
         FSM_res1_forward.gworker = _loc1_;
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
               this.i2 = li32(mstate.ebp + 16);
               this.i3 = li32(mstate.ebp + 20);
               this.i4 = li32(mstate.ebp + 28);
               this.i5 = li32(mstate.ebp + 32);
               this.i6 = li32(mstate.ebp + 36);
               this.i7 = li32(mstate.ebp + 24);
               this.i8 = this.i3;
               this.i9 = this.i0;
               this.i10 = this.i0;
               while(this.i10 < this.i4)
               {
                  this.i11 = this.i7 + this.i9;
                  this.i11 = li32(this.i11);
                  if(this.i11 != 0)
                  {
                     this.i11 = this.i0 << 2;
                     this.i12 = this.i8 + this.i9;
                     this.i12 = li32(this.i12);
                     this.i11 = this.i3 + this.i11;
                     si32(this.i12,this.i11);
                     this.i0 = this.i0 + 1;
                  }
                  this.i9 = this.i9 + 4;
                  this.i10 = this.i10 + 1;
               }
               if(this.i0 != 0)
               {
                  mstate.esp = mstate.esp - 24;
                  si32(this.i1,mstate.esp);
                  si32(this.i2,mstate.esp + 4);
                  si32(this.i3,mstate.esp + 8);
                  si32(this.i0,mstate.esp + 12);
                  si32(this.i5,mstate.esp + 16);
                  si32(this.i6,mstate.esp + 20);
                  state = 1;
                  mstate.esp = mstate.esp - 4;
                  FSM_res1_forward.start();
                  return;
               }
               this.i0 = 0;
               break;
            case 1:
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
