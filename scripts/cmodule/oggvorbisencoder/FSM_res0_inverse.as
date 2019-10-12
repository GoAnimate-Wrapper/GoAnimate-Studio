package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_res0_inverse extends Machine
   {
      
      public static const intRegCount:int = 11;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i10:int;
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public var i5:int;
      
      public var i6:int;
      
      public var i8:int;
      
      public var i7:int;
      
      public var i9:int;
      
      public function FSM_res0_inverse()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_res0_inverse = null;
         _loc1_ = new FSM_res0_inverse();
         FSM_res0_inverse.gworker = _loc1_;
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
                  this.i4 = FSM_res0_inverse;
                  mstate.esp = mstate.esp - 20;
                  si32(this.i1,mstate.esp);
                  si32(this.i2,mstate.esp + 4);
                  si32(this.i3,mstate.esp + 8);
                  si32(this.i0,mstate.esp + 12);
                  si32(this.i4,mstate.esp + 16);
                  state = 1;
                  mstate.esp = mstate.esp - 4;
                  FSM_res0_inverse.start();
                  return;
               }
               this.i0 = 0;
               break;
            case 1:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 20;
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
