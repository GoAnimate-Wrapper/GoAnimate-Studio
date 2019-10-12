package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   import avm2.intrinsics.memory.si8;
   
   public final class FSM_vorbis_comment_add_tag extends Machine
   {
      
      public static const intRegCount:int = 10;
      
      public static const NumberRegCount:int = 0;
       
      
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
      
      public function FSM_vorbis_comment_add_tag()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_vorbis_comment_add_tag = null;
         _loc1_ = new FSM_vorbis_comment_add_tag();
         FSM_vorbis_comment_add_tag.gworker = _loc1_;
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
               this.i1 = li8(this.i0);
               this.i2 = li32(mstate.ebp + 16);
               this.i3 = li32(mstate.ebp + 8);
               this.i4 = this.i0;
               this.i5 = this.i2;
               if(this.i1 != 0)
               {
                  this.i0 = this.i4;
                  while(true)
                  {
                     this.i6 = li8(this.i0 + 1);
                     this.i0 = this.i0 + 1;
                     this.i7 = this.i0;
                     if(this.i6 != 0)
                     {
                        this.i0 = this.i7;
                        continue;
                     }
                     break;
                  }
               }
               this.i6 = li8(this.i2);
               this.i0 = this.i0 - this.i4;
               if(this.i6 != 0)
               {
                  this.i2 = this.i5;
                  while(true)
                  {
                     this.i6 = li8(this.i2 + 1);
                     this.i2 = this.i2 + 1;
                     this.i7 = this.i2;
                     if(this.i6 != 0)
                     {
                        this.i2 = this.i7;
                        continue;
                     }
                     break;
                  }
               }
               this.i2 = this.i2 - this.i5;
               this.i0 = this.i0 + this.i2;
               this.i0 = this.i0 + 5;
               this.i2 = mstate.esp;
               this.i0 = this.i0 & -4;
               this.i0 = this.i2 - this.i0;
               mstate.esp = this.i0;
               si8(this.i1,this.i0);
               this.i2 = this.i0;
               this.i1 = this.i1 & 255;
               if(this.i1 != 0)
               {
                  this.i1 = 1;
                  while(true)
                  {
                     this.i6 = this.i4 + this.i1;
                     this.i6 = li8(this.i6);
                     this.i7 = this.i2 + this.i1;
                     si8(this.i6,this.i7);
                     this.i1 = this.i1 + 1;
                     if(this.i6 != 0)
                     {
                        continue;
                     }
                     break;
                  }
               }
               this.i1 = li8(this.i0);
               if(this.i1 != 0)
               {
                  this.i1 = this.i2;
                  while(true)
                  {
                     this.i4 = li8(this.i1 + 1);
                     this.i1 = this.i1 + 1;
                     this.i6 = this.i1;
                     if(this.i4 != 0)
                     {
                        this.i1 = this.i6;
                        continue;
                     }
                     break;
                  }
               }
               else
               {
                  this.i1 = this.i0;
               }
               this.i4 = FSM_vorbis_comment_add_tag;
               this.i6 = 0;
               while(true)
               {
                  this.i7 = this.i4 + this.i6;
                  this.i7 = li8(this.i7);
                  this.i8 = this.i1 + this.i6;
                  si8(this.i7,this.i8);
                  this.i6 = this.i6 + 1;
                  if(this.i7 != 0)
                  {
                     continue;
                  }
                  break;
               }
               this.i1 = li8(this.i0);
               if(this.i1 != 0)
               {
                  this.i1 = this.i2;
                  while(true)
                  {
                     this.i4 = li8(this.i1 + 1);
                     this.i1 = this.i1 + 1;
                     this.i6 = this.i1;
                     if(this.i4 != 0)
                     {
                        this.i1 = this.i6;
                        continue;
                     }
                     break;
                  }
               }
               else
               {
                  this.i1 = this.i0;
               }
               this.i4 = 0;
               while(true)
               {
                  this.i6 = this.i5 + this.i4;
                  this.i6 = li8(this.i6);
                  this.i7 = this.i1 + this.i4;
                  si8(this.i6,this.i7);
                  this.i4 = this.i4 + 1;
                  if(this.i6 != 0)
                  {
                     continue;
                  }
                  break;
               }
               this.i1 = li32(this.i3 + 8);
               this.i4 = li32(this.i3);
               this.i1 = this.i1 << 2;
               mstate.esp = mstate.esp - 8;
               this.i1 = this.i1 + 8;
               si32(this.i4,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               state = 1;
               mstate.esp = mstate.esp - 4;
               FSM_vorbis_comment_add_tag.start();
               return;
            case 1:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               si32(this.i1,this.i3);
               this.i1 = li32(this.i3 + 8);
               this.i4 = li32(this.i3 + 4);
               this.i1 = this.i1 << 2;
               mstate.esp = mstate.esp - 8;
               this.i1 = this.i1 + 8;
               si32(this.i4,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               state = 2;
               mstate.esp = mstate.esp - 4;
               FSM_vorbis_comment_add_tag.start();
               return;
            case 2:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               si32(this.i1,this.i3 + 4);
               this.i4 = li32(this.i3 + 8);
               this.i5 = li8(this.i0);
               this.i6 = this.i3 + 4;
               this.i7 = this.i3 + 8;
               if(this.i5 != 0)
               {
                  this.i5 = this.i2;
                  while(true)
                  {
                     this.i8 = li8(this.i5 + 1);
                     this.i5 = this.i5 + 1;
                     this.i9 = this.i5;
                     if(this.i8 != 0)
                     {
                        this.i5 = this.i9;
                        continue;
                     }
                     break;
                  }
               }
               else
               {
                  this.i5 = this.i0;
               }
               this.i8 = 0;
               this.i4 = this.i4 << 2;
               this.i1 = this.i1 + this.i4;
               this.i4 = this.i5 - this.i2;
               si32(this.i4,this.i1);
               this.i1 = li32(this.i7);
               this.i4 = li32(this.i6);
               this.i1 = this.i1 << 2;
               this.i4 = this.i4 + this.i1;
               this.i5 = li32(this.i3);
               this.i4 = li32(this.i4);
               mstate.esp = mstate.esp - 8;
               this.i4 = this.i4 + 1;
               si32(this.i8,mstate.esp);
               si32(this.i4,mstate.esp + 4);
               state = 3;
               mstate.esp = mstate.esp - 4;
               FSM_vorbis_comment_add_tag.start();
               return;
            case 3:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i1 = this.i5 + this.i1;
               si32(this.i4,this.i1);
               this.i1 = li32(this.i7);
               this.i4 = li32(this.i3);
               this.i1 = this.i1 << 2;
               this.i1 = this.i4 + this.i1;
               this.i1 = li32(this.i1);
               this.i0 = li8(this.i0);
               si8(this.i0,this.i1);
               if(this.i0 != 0)
               {
                  this.i0 = 1;
                  while(true)
                  {
                     this.i4 = this.i2 + this.i0;
                     this.i4 = li8(this.i4);
                     this.i5 = this.i1 + this.i0;
                     si8(this.i4,this.i5);
                     this.i0 = this.i0 + 1;
                     if(this.i4 != 0)
                     {
                        continue;
                     }
                     break;
                  }
               }
               this.i0 = 0;
               this.i1 = li32(this.i7);
               this.i1 = this.i1 + 1;
               si32(this.i1,this.i7);
               this.i2 = li32(this.i3);
               this.i1 = this.i1 << 2;
               this.i1 = this.i2 + this.i1;
               si32(this.i0,this.i1);
               mstate.esp = mstate.ebp;
               mstate.ebp = li32(mstate.esp);
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp + 4;
               mstate.gworker = caller;
               return;
         }
      }
   }
}
