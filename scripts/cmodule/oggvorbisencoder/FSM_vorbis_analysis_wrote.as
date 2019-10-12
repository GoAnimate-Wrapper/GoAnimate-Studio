package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_vorbis_analysis_wrote extends Machine
   {
      
      public static const intRegCount:int = 14;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i10:int;
      
      public var i11:int;
      
      public var i12:int;
      
      public var i13:int;
      
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
      
      public function FSM_vorbis_analysis_wrote()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_vorbis_analysis_wrote = null;
         _loc1_ = new FSM_vorbis_analysis_wrote();
         FSM_vorbis_analysis_wrote.gworker = _loc1_;
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
               this.i1 = li32(this.i0 + 4);
               this.i2 = li32(this.i1 + 28);
               this.i3 = li32(mstate.ebp + 12);
               if(this.i3 <= 0)
               {
                  this.i3 = mstate.esp;
                  this.i3 = this.i3 + -128;
                  mstate.esp = this.i3;
                  this.i4 = li32(this.i0 + 28);
                  if(this.i4 == 0)
                  {
                     mstate.esp = mstate.esp - 4;
                     si32(this.i0,mstate.esp);
                     mstate.esp = mstate.esp - 4;
                     FSM_vorbis_analysis_wrote.start();
                  }
                  addr112:
                  this.i4 = 0;
                  this.i5 = li32(this.i2 + 4);
                  mstate.esp = mstate.esp - 8;
                  this.i5 = this.i5 * 3;
                  si32(this.i0,mstate.esp);
                  si32(this.i5,mstate.esp + 4);
                  state = 2;
                  mstate.esp = mstate.esp - 4;
                  FSM_vorbis_analysis_wrote.start();
                  return;
               }
               this.i1 = li32(this.i0 + 20);
               this.i4 = li32(this.i0 + 16);
               this.i1 = this.i1 + this.i3;
               this.i3 = this.i0 + 20;
               if(this.i1 <= this.i4)
               {
                  si32(this.i1,this.i3);
                  this.i3 = li32(this.i0 + 28);
                  if(this.i3 == 0)
                  {
                     this.i3 = li32(this.i0 + 48);
                     this.i2 = li32(this.i2 + 4);
                     this.i1 = this.i1 - this.i3;
                     if(this.i1 > this.i2)
                     {
                        mstate.esp = mstate.esp - 4;
                        si32(this.i0,mstate.esp);
                        mstate.esp = mstate.esp - 4;
                        FSM_vorbis_analysis_wrote.start();
                     }
                     break;
                  }
                  break;
               }
               break;
            case 1:
               mstate.esp = mstate.esp + 4;
               §§goto(addr112);
            case 2:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i5 = li32(this.i0 + 20);
               si32(this.i5,this.i0 + 32);
               this.i6 = li32(this.i2 + 4);
               this.i6 = this.i6 * 3;
               this.i5 = this.i5 + this.i6;
               si32(this.i5,this.i0 + 20);
               this.i5 = this.i0 + 8;
               this.i1 = this.i1 + 4;
               this.i6 = this.i0 + 32;
               this.i0 = this.i0 + 20;
               this.i2 = this.i2 + 4;
               this.i7 = this.i4;
               loop0:
               while(true)
               {
                  this.i8 = li32(this.i1);
                  if(this.i8 <= this.i4)
                  {
                     break;
                  }
                  addr536:
                  this.i8 = li32(this.i6);
                  if(this.i8 >= 65)
                  {
                     this.i9 = 32;
                     this.i10 = li32(this.i2);
                     this.i11 = li32(this.i5);
                     this.i10 = this.i10 < this.i8?int(this.i10):int(this.i8);
                     this.i11 = this.i11 + this.i7;
                     this.i11 = li32(this.i11);
                     this.i8 = this.i8 - this.i10;
                     this.i8 = this.i8 << 2;
                     mstate.esp = mstate.esp - 16;
                     this.i8 = this.i11 + this.i8;
                     si32(this.i8,mstate.esp);
                     si32(this.i3,mstate.esp + 4);
                     si32(this.i10,mstate.esp + 8);
                     si32(this.i9,mstate.esp + 12);
                     mstate.esp = mstate.esp - 4;
                     FSM_vorbis_analysis_wrote.start();
                  }
                  else
                  {
                     this.i9 = 0;
                     this.i10 = li32(this.i5);
                     this.i10 = this.i10 + this.i7;
                     this.i11 = li32(this.i0);
                     this.i10 = li32(this.i10);
                     this.i12 = this.i8 << 2;
                     this.i10 = this.i10 + this.i12;
                     this.i8 = this.i11 - this.i8;
                     this.i8 = this.i8 << 2;
                     memset(this.i10,this.i9,this.i8);
                  }
                  while(true)
                  {
                     this.i7 = this.i7 + 4;
                     this.i4 = this.i4 + 1;
                     continue loop0;
                  }
               }
               break;
            case 3:
               while(true)
               {
                  mstate.esp = mstate.esp + 16;
                  this.i8 = li32(this.i5);
                  this.i10 = li32(this.i6);
                  this.i8 = this.i8 + this.i7;
                  this.i11 = li32(this.i0);
                  this.i8 = li32(this.i8);
                  this.i12 = this.i10 << 2;
                  this.i13 = this.i12 + this.i8;
                  mstate.esp = mstate.esp - 20;
                  this.i13 = this.i13 + -128;
                  this.i8 = this.i8 + this.i12;
                  this.i10 = this.i11 - this.i10;
                  si32(this.i3,mstate.esp);
                  si32(this.i13,mstate.esp + 4);
                  si32(this.i9,mstate.esp + 8);
                  si32(this.i8,mstate.esp + 12);
                  si32(this.i10,mstate.esp + 16);
                  mstate.esp = mstate.esp - 4;
                  FSM_vorbis_analysis_wrote.start();
               }
            case 4:
               while(true)
               {
                  mstate.esp = mstate.esp + 20;
                  §§goto(addr536);
               }
            case 5:
               mstate.esp = mstate.esp + 4;
         }
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
