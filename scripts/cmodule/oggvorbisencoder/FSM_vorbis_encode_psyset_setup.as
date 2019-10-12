package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_vorbis_encode_psyset_setup extends Machine
   {
      
      public static const intRegCount:int = 11;
      
      public static const NumberRegCount:int = 1;
       
      
      public var i10:int;
      
      public var f0:Number;
      
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
      
      public function FSM_vorbis_encode_psyset_setup()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_vorbis_encode_psyset_setup = null;
         _loc1_ = new FSM_vorbis_encode_psyset_setup();
         FSM_vorbis_encode_psyset_setup.gworker = _loc1_;
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
               this.i0 = li32(mstate.ebp + 32);
               this.i1 = li32(mstate.ebp + 8);
               this.i1 = li32(this.i1 + 28);
               this.i2 = this.i0 << 2;
               this.i2 = this.i1 + this.i2;
               this.f0 = lf64(mstate.ebp + 12);
               this.i3 = li32(this.i2 + 2852);
               this.i4 = li32(this.i1 + 28);
               this.i2 = this.i2 + 2852;
               this.i5 = this.i1 + 28;
               this.i6 = int(this.f0);
               this.i7 = li32(mstate.ebp + 20);
               this.i8 = li32(mstate.ebp + 24);
               this.i9 = li32(mstate.ebp + 28);
               if(this.i4 <= this.i0)
               {
                  this.i4 = this.i0 + 1;
                  si32(this.i4,this.i5);
               }
               if(this.i3 != 0)
               {
                  this.i2 = this.i3;
                  break;
               }
               this.i3 = 520;
               mstate.esp = mstate.esp - 8;
               this.i4 = 0;
               si32(this.i4,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               state = 1;
               mstate.esp = mstate.esp - 4;
               FSM_vorbis_encode_psyset_setup.start();
               return;
            case 1:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i3 != 0)
               {
                  this.i4 = 0;
                  this.i5 = this.i3;
                  this.i10 = 520;
                  memset(this.i5,this.i4,this.i10);
               }
               si32(this.i3,this.i2);
               this.i2 = this.i3;
         }
         this.i3 = FSM_vorbis_encode_psyset_setup;
         this.i4 = this.i2;
         this.i5 = 520;
         memcpy(this.i4,this.i3,this.i5);
         this.i0 = this.i0 >> 1;
         si32(this.i0,this.i2);
         this.i0 = li32(this.i1 + 3460);
         if(this.i0 != 0)
         {
            this.i0 = 1;
            this.i1 = this.i6 << 2;
            si32(this.i0,this.i2 + 500);
            this.i0 = this.i7 + this.i1;
            this.i0 = li32(this.i0);
            si32(this.i0,this.i2 + 504);
            this.i0 = this.i8 + this.i1;
            this.i0 = li32(this.i0);
            this.i1 = this.i6 << 3;
            si32(this.i0,this.i2 + 508);
            this.i0 = this.i9 + this.i1;
            this.f0 = lf64(this.i0);
            sf64(this.f0,this.i2 + 512);
         }
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
