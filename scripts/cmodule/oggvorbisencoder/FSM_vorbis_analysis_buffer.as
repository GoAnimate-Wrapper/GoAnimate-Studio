package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_vorbis_analysis_buffer extends Machine
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
      
      public function FSM_vorbis_analysis_buffer()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_vorbis_analysis_buffer = null;
         _loc1_ = new FSM_vorbis_analysis_buffer();
         FSM_vorbis_analysis_buffer.gworker = _loc1_;
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
               this.i1 = li32(this.i0 + 104);
               this.i2 = li32(this.i0 + 4);
               this.i3 = li32(this.i1 + 64);
               this.i4 = this.i1 + 64;
               this.i5 = li32(mstate.ebp + 12);
               if(this.i3 != 0)
               {
                  this.i6 = 0;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i3,mstate.esp);
                  si32(this.i6,mstate.esp + 4);
                  state = 1;
                  mstate.esp = mstate.esp - 4;
                  FSM_vorbis_analysis_buffer.start();
                  return;
               }
               addr116:
               this.i3 = 0;
               si32(this.i3,this.i4);
               this.i3 = li32(this.i1 + 68);
               this.i4 = this.i1 + 68;
               if(this.i3 != 0)
               {
                  this.i6 = 0;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i3,mstate.esp);
                  si32(this.i6,mstate.esp + 4);
                  state = 2;
                  mstate.esp = mstate.esp - 4;
                  FSM_vorbis_analysis_buffer.start();
                  return;
               }
               addr186:
               this.i3 = 0;
               si32(this.i3,this.i4);
               this.i3 = li32(this.i1 + 72);
               this.i1 = this.i1 + 72;
               if(this.i3 != 0)
               {
                  this.i4 = 0;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i3,mstate.esp);
                  si32(this.i4,mstate.esp + 4);
                  state = 3;
                  mstate.esp = mstate.esp - 4;
                  FSM_vorbis_analysis_buffer.start();
                  return;
               }
               addr256:
               this.i3 = 0;
               si32(this.i3,this.i1);
               this.i1 = li32(this.i0 + 20);
               this.i3 = li32(this.i0 + 16);
               this.i4 = this.i0 + 16;
               this.i6 = this.i0 + 20;
               this.i7 = this.i1 + this.i5;
               if(this.i7 >= this.i3)
               {
                  this.i3 = 0;
                  this.i5 = this.i5 << 1;
                  this.i1 = this.i1 + this.i5;
                  si32(this.i1,this.i4);
                  this.i1 = this.i0 + 8;
                  this.i5 = this.i2 + 4;
                  this.i7 = this.i3;
                  addr428:
                  this.i8 = li32(this.i5);
                  if(this.i8 <= this.i3)
                  {
                     break;
                  }
                  this.i8 = li32(this.i1);
                  this.i8 = this.i8 + this.i7;
                  this.i9 = li32(this.i4);
                  this.i10 = li32(this.i8);
                  mstate.esp = mstate.esp - 8;
                  this.i9 = this.i9 << 2;
                  si32(this.i10,mstate.esp);
                  si32(this.i9,mstate.esp + 4);
                  state = 4;
                  mstate.esp = mstate.esp - 4;
                  FSM_vorbis_analysis_buffer.start();
                  return;
               }
               break;
            case 1:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr116);
            case 2:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr186);
            case 3:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr256);
            case 4:
               this.i9 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               si32(this.i9,this.i8);
               this.i7 = this.i7 + 4;
               this.i3 = this.i3 + 1;
               §§goto(addr428);
         }
         this.i1 = 0;
         this.i3 = this.i0 + 8;
         this.i0 = this.i0 + 12;
         this.i2 = this.i2 + 4;
         this.i4 = this.i1;
         while(true)
         {
            this.i5 = this.i4;
            this.i4 = this.i1;
            this.i7 = li32(this.i2);
            this.i1 = li32(this.i0);
            this.i8 = this.i1;
            if(this.i7 <= this.i4)
            {
               break;
            }
            this.i7 = li32(this.i3);
            this.i8 = li32(this.i6);
            this.i7 = this.i7 + this.i5;
            this.i7 = li32(this.i7);
            this.i8 = this.i8 << 2;
            this.i1 = this.i1 + this.i5;
            this.i7 = this.i7 + this.i8;
            si32(this.i7,this.i1);
            this.i1 = this.i5 + 4;
            this.i5 = this.i4 + 1;
            this.i4 = this.i1;
            this.i1 = this.i5;
         }
         mstate.eax = this.i8;
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
