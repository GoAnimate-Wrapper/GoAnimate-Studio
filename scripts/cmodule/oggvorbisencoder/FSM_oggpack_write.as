package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   import avm2.intrinsics.memory.si8;
   
   public final class FSM_oggpack_write extends Machine
   {
      
      public static const intRegCount:int = 8;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public var i5:int;
      
      public var i6:int;
      
      public var i7:int;
      
      public function FSM_oggpack_write()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_oggpack_write = null;
         _loc1_ = new FSM_oggpack_write();
         FSM_oggpack_write.gworker = _loc1_;
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
               this.i0 = li32(mstate.ebp + 8);
               this.i1 = li32(mstate.ebp + 12);
               this.i2 = li32(mstate.ebp + 16);
               if(uint(this.i2) <= uint(32))
               {
                  this.i3 = li32(this.i0 + 16);
                  this.i4 = li32(this.i0);
                  this.i5 = this.i0 + 16;
                  this.i6 = this.i0;
                  this.i7 = this.i3 + -4;
                  if(this.i4 >= this.i7)
                  {
                     this.i4 = li32(this.i0 + 12);
                     this.i7 = this.i0 + 12;
                     if(this.i4 != 0)
                     {
                        if(this.i3 <= 2147483391)
                        {
                           this.i4 = li32(this.i0 + 8);
                           mstate.esp = mstate.esp - 8;
                           this.i3 = this.i3 + 256;
                           si32(this.i4,mstate.esp);
                           si32(this.i3,mstate.esp + 4);
                           state = 1;
                           mstate.esp = mstate.esp - 4;
                           FSM_oggpack_write.start();
                           return;
                        }
                     }
                  }
                  else
                  {
                     addr216:
                     this.i3 = FSM_oggpack_write;
                     this.i4 = this.i2 << 2;
                     this.i3 = this.i3 + this.i4;
                     this.i3 = li32(this.i3);
                     this.i4 = li32(this.i0 + 4);
                     this.i1 = this.i3 & this.i1;
                     this.i3 = li32(this.i0 + 12);
                     this.i5 = li8(this.i3);
                     this.i7 = this.i1 << this.i4;
                     this.i5 = this.i5 | this.i7;
                     si8(this.i5,this.i3);
                     this.i3 = this.i0 + 12;
                     this.i2 = this.i4 + this.i2;
                     this.i0 = this.i0 + 4;
                     if(this.i2 >= 8)
                     {
                        this.i4 = li32(this.i0);
                        this.i5 = li32(this.i3);
                        this.i4 = 8 - this.i4;
                        this.i4 = this.i1 >>> this.i4;
                        si8(this.i4,this.i5 + 1);
                        if(this.i2 >= 16)
                        {
                           this.i4 = li32(this.i0);
                           this.i5 = li32(this.i3);
                           this.i4 = 16 - this.i4;
                           this.i4 = this.i1 >>> this.i4;
                           si8(this.i4,this.i5 + 2);
                           if(this.i2 >= 24)
                           {
                              this.i4 = li32(this.i0);
                              this.i5 = li32(this.i3);
                              this.i4 = 24 - this.i4;
                              this.i4 = this.i1 >>> this.i4;
                              si8(this.i4,this.i5 + 3);
                              if(this.i2 >= 32)
                              {
                                 this.i4 = li32(this.i0);
                                 this.i5 = li32(this.i3);
                                 if(this.i4 != 0)
                                 {
                                    this.i4 = 32 - this.i4;
                                    this.i1 = this.i1 >>> this.i4;
                                    si8(this.i1,this.i5 + 4);
                                 }
                                 else
                                 {
                                    this.i1 = 0;
                                    si8(this.i1,this.i5 + 4);
                                 }
                              }
                           }
                        }
                     }
                     this.i1 = this.i2 >> 31;
                     this.i1 = this.i1 >>> 29;
                     this.i1 = this.i2 + this.i1;
                     this.i4 = li32(this.i6);
                     this.i1 = this.i1 >> 3;
                     this.i4 = this.i4 + this.i1;
                     si32(this.i4,this.i6);
                     this.i4 = li32(this.i3);
                     this.i1 = this.i4 + this.i1;
                     si32(this.i1,this.i3);
                     this.i1 = this.i2 & 7;
                     si32(this.i1,this.i0);
                  }
                  addr621:
                  mstate.esp = mstate.ebp;
                  mstate.ebp = li32(mstate.esp);
                  mstate.esp = mstate.esp + 4;
                  mstate.esp = mstate.esp + 4;
                  mstate.gworker = caller;
                  return;
               }
               addr529:
               this.i1 = li32(this.i0 + 8);
               if(this.i1 != 0)
               {
                  this.i2 = 0;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i2,mstate.esp + 4);
                  state = 2;
                  mstate.esp = mstate.esp - 4;
                  FSM_oggpack_write.start();
                  return;
               }
               break;
            case 1:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i4 = this.i0 + 8;
               if(this.i3 != 0)
               {
                  si32(this.i3,this.i4);
                  this.i4 = li32(this.i5);
                  this.i4 = this.i4 + 256;
                  si32(this.i4,this.i5);
                  this.i4 = li32(this.i6);
                  this.i3 = this.i3 + this.i4;
                  si32(this.i3,this.i7);
                  §§goto(addr216);
               }
               else
               {
                  §§goto(addr529);
               }
            case 2:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
         }
         this.i1 = 0;
         si32(this.i1,this.i0);
         si32(this.i1,this.i0 + 4);
         si32(this.i1,this.i0 + 8);
         si32(this.i1,this.i0 + 12);
         si32(this.i1,this.i0 + 16);
         §§goto(addr621);
      }
   }
}
