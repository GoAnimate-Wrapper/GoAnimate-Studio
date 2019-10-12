package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM__vorbis_block_alloc extends Machine
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
      
      public function FSM__vorbis_block_alloc()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM__vorbis_block_alloc = null;
         _loc1_ = new FSM__vorbis_block_alloc();
         FSM__vorbis_block_alloc.gworker = _loc1_;
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
               this.i1 = this.i1 + 7;
               this.i2 = li32(this.i0 + 72);
               this.i3 = li32(this.i0 + 76);
               this.i1 = this.i1 & -8;
               this.i4 = this.i0 + 76;
               this.i5 = this.i0 + 72;
               this.i6 = this.i2 + this.i1;
               if(this.i6 <= this.i3)
               {
                  this.i4 = this.i2;
                  break;
               }
               this.i2 = li32(this.i0 + 68);
               this.i3 = this.i0 + 68;
               if(this.i2 != 0)
               {
                  this.i2 = 8;
                  mstate.esp = mstate.esp - 8;
                  this.i6 = 0;
                  si32(this.i6,mstate.esp);
                  si32(this.i2,mstate.esp + 4);
                  state = 1;
                  mstate.esp = mstate.esp - 4;
                  FSM__vorbis_block_alloc.start();
                  return;
               }
               addr218:
               this.i2 = 0;
               si32(this.i1,this.i4);
               mstate.esp = mstate.esp - 8;
               si32(this.i2,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               state = 2;
               mstate.esp = mstate.esp - 4;
               FSM__vorbis_block_alloc.start();
               return;
            case 1:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i6 = li32(this.i0 + 80);
               this.i7 = li32(this.i5);
               this.i6 = this.i6 + this.i7;
               si32(this.i6,this.i0 + 80);
               this.i6 = li32(this.i0 + 84);
               si32(this.i6,this.i2 + 4);
               this.i6 = li32(this.i3);
               si32(this.i6,this.i2);
               si32(this.i2,this.i0 + 84);
               §§goto(addr218);
            case 2:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               si32(this.i4,this.i3);
               si32(this.i2,this.i5);
               this.i4 = this.i2;
         }
         this.i2 = this.i4;
         this.i0 = li32(this.i0 + 68);
         this.i1 = this.i2 + this.i1;
         si32(this.i1,this.i5);
         this.i0 = this.i0 + this.i2;
         mstate.eax = this.i0;
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
