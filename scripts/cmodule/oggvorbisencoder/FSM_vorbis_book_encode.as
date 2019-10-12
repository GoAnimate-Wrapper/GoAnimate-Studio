package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_vorbis_book_encode extends Machine
   {
      
      public static const intRegCount:int = 6;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public var i5:int;
      
      public function FSM_vorbis_book_encode()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_vorbis_book_encode = null;
         _loc1_ = new FSM_vorbis_book_encode();
         FSM_vorbis_book_encode.gworker = _loc1_;
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
               if(this.i1 >= 0)
               {
                  this.i3 = li32(this.i0 + 12);
                  this.i4 = li32(this.i3 + 4);
                  this.i5 = this.i0 + 12;
                  if(this.i4 > this.i1)
                  {
                     this.i3 = li32(this.i3 + 8);
                     this.i1 = this.i1 << 2;
                     this.i0 = li32(this.i0 + 20);
                     this.i0 = this.i0 + this.i1;
                     this.i3 = this.i3 + this.i1;
                     this.i3 = li32(this.i3);
                     this.i0 = li32(this.i0);
                     mstate.esp = mstate.esp - 12;
                     si32(this.i2,mstate.esp);
                     si32(this.i0,mstate.esp + 4);
                     si32(this.i3,mstate.esp + 8);
                     state = 1;
                     mstate.esp = mstate.esp - 4;
                     FSM_vorbis_book_encode.start();
                     return;
                  }
               }
               this.i0 = 0;
               break;
            case 1:
               mstate.esp = mstate.esp + 12;
               this.i0 = li32(this.i5);
               this.i0 = li32(this.i0 + 8);
               this.i0 = this.i0 + this.i1;
               this.i0 = li32(this.i0);
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
