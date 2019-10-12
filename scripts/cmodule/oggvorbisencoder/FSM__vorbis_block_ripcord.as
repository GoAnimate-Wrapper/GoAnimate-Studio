package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM__vorbis_block_ripcord extends Machine
   {
      
      public static const intRegCount:int = 7;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public var i5:int;
      
      public var i6:int;
      
      public function FSM__vorbis_block_ripcord()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM__vorbis_block_ripcord = null;
         _loc1_ = new FSM__vorbis_block_ripcord();
         FSM__vorbis_block_ripcord.gworker = _loc1_;
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
               this.i1 = li32(this.i0 + 84);
               this.i2 = this.i0 + 84;
               addr161:
               if(this.i1 == 0)
               {
                  this.i1 = li32(this.i0 + 80);
                  this.i3 = this.i0 + 80;
                  if(this.i1 != 0)
                  {
                     this.i4 = 0;
                     this.i5 = li32(this.i0 + 76);
                     this.i6 = li32(this.i0 + 68);
                     mstate.esp = mstate.esp - 8;
                     this.i1 = this.i1 + this.i5;
                     si32(this.i6,mstate.esp);
                     si32(this.i1,mstate.esp + 4);
                     state = 3;
                     mstate.esp = mstate.esp - 4;
                     FSM__vorbis_block_ripcord.start();
                     return;
                  }
                  break;
               }
               this.i3 = 0;
               this.i4 = li32(this.i1 + 4);
               this.i5 = li32(this.i1);
               mstate.esp = mstate.esp - 8;
               si32(this.i5,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               state = 1;
               mstate.esp = mstate.esp - 4;
               FSM__vorbis_block_ripcord.start();
               return;
            case 1:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               si32(this.i3,this.i1);
               si32(this.i3,this.i1 + 4);
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               state = 2;
               mstate.esp = mstate.esp - 4;
               FSM__vorbis_block_ripcord.start();
               return;
            case 2:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i1 = this.i4;
               §§goto(addr161);
            case 3:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               si32(this.i1,this.i0 + 68);
               this.i1 = li32(this.i0 + 76);
               this.i5 = li32(this.i3);
               this.i1 = this.i1 + this.i5;
               si32(this.i1,this.i0 + 76);
               si32(this.i4,this.i3);
         }
         this.i1 = 0;
         si32(this.i1,this.i0 + 72);
         si32(this.i1,this.i2);
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
