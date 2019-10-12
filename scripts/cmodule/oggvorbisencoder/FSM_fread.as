package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_fread extends Machine
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
      
      public function FSM_fread()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_fread = null;
         _loc1_ = new FSM_fread();
         FSM_fread.gworker = _loc1_;
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
               this.i1 = li32(mstate.ebp + 16);
               this.i2 = li32(mstate.ebp + 8);
               this.i3 = li32(mstate.ebp + 20);
               this.i4 = this.i1 * this.i0;
               if(this.i4 != 0)
               {
                  this.i5 = li32(this.i3 + 56);
                  this.i6 = li32(this.i5 + 16);
                  this.i5 = this.i5 + 16;
                  if(this.i6 == 0)
                  {
                     this.i6 = -1;
                     si32(this.i6,this.i5);
                  }
                  this.i5 = li32(this.i3 + 4);
                  this.i6 = this.i3 + 4;
                  if(this.i5 >= 0)
                  {
                     this.i5 = this.i4;
                     addr243:
                     this.i7 = li32(this.i6);
                     this.i9 = li32(this.i3);
                     if(uint(this.i7) >= uint(this.i5))
                     {
                        this.i0 = this.i5;
                        this.i5 = this.i9;
                     }
                     else
                     {
                        this.i8 = this.i5;
                        this.i5 = this.i9;
                        addr151:
                        this.i9 = this.i2;
                        this.i10 = this.i7;
                        memcpy(this.i9,this.i5,this.i10);
                        this.i5 = li32(this.i3);
                        this.i5 = this.i5 + this.i7;
                        si32(this.i5,this.i3);
                        mstate.esp = mstate.esp - 4;
                        si32(this.i3,mstate.esp);
                        state = 1;
                        mstate.esp = mstate.esp - 4;
                        FSM_fread.start();
                        return;
                     }
                  }
                  else
                  {
                     this.i5 = 0;
                     si32(this.i5,this.i6);
                     this.i5 = li32(this.i3);
                     if(this.i4 != 0)
                     {
                        this.i7 = 0;
                        this.i8 = this.i4;
                        §§goto(addr151);
                     }
                     else
                     {
                        this.i0 = this.i4;
                     }
                  }
                  this.i4 = this.i5;
                  this.i5 = this.i0;
                  memcpy(this.i2,this.i4,this.i5);
                  this.i2 = li32(this.i6);
                  this.i2 = this.i2 - this.i0;
                  si32(this.i2,this.i6);
                  this.i2 = li32(this.i3);
                  this.i0 = this.i2 + this.i0;
                  si32(this.i0,this.i3);
                  mstate.eax = this.i1;
                  break;
               }
               this.i0 = 0;
               mstate.eax = this.i0;
               break;
            case 1:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               this.i8 = this.i8 - this.i7;
               this.i2 = this.i2 + this.i7;
               if(this.i5 == 0)
               {
                  this.i5 = this.i8;
                  §§goto(addr243);
               }
               else
               {
                  this.i2 = this.i4 - this.i8;
                  this.i2 = uint(this.i2) / uint(this.i0);
                  mstate.eax = this.i2;
                  break;
               }
         }
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
