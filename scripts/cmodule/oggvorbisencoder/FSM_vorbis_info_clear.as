package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_vorbis_info_clear extends Machine
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
      
      public function FSM_vorbis_info_clear()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_vorbis_info_clear = null;
         _loc1_ = new FSM_vorbis_info_clear();
         FSM_vorbis_info_clear.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         loop13:
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 0;
               this.i0 = li32(mstate.ebp + 8);
               this.i1 = li32(this.i0 + 28);
               this.i2 = this.i1;
               this.i3 = this.i1;
               if(this.i1 != 0)
               {
                  this.i4 = 0;
                  this.i5 = this.i1 + 32;
                  this.i6 = this.i2 + 8;
                  loop0:
                  while(true)
                  {
                     this.i7 = this.i5;
                     this.i5 = this.i4;
                     this.i8 = li32(this.i6);
                     this.i4 = this.i7;
                     if(this.i8 <= this.i5)
                     {
                        break;
                     }
                     this.i4 = li32(this.i4);
                     if(this.i4 != 0)
                     {
                        this.i8 = 0;
                        mstate.esp = mstate.esp - 8;
                        si32(this.i4,mstate.esp);
                        si32(this.i8,mstate.esp + 4);
                        state = 1;
                        mstate.esp = mstate.esp - 4;
                        FSM_vorbis_info_clear.start();
                        return;
                     }
                     addr124:
                     while(true)
                     {
                        this.i4 = this.i7 + 4;
                        this.i7 = this.i5 + 1;
                        this.i5 = this.i4;
                        this.i4 = this.i7;
                        continue loop0;
                     }
                  }
                  this.i4 = 0;
                  this.i5 = this.i2 + 12;
                  this.i6 = this.i1;
                  loop1:
                  while(true)
                  {
                     this.i7 = li32(this.i5);
                     if(this.i7 <= this.i4)
                     {
                        break;
                     }
                     this.i7 = li32(this.i6 + 544);
                     if(this.i7 != 0)
                     {
                        this.i8 = FSM_vorbis_info_clear;
                        this.i9 = li32(this.i6 + 288);
                        this.i9 = this.i9 << 2;
                        this.i8 = this.i8 + this.i9;
                        this.i8 = li32(this.i8);
                        this.i8 = li32(this.i8 + 8);
                        mstate.esp = mstate.esp - 4;
                        si32(this.i7,mstate.esp);
                        state = 2;
                        mstate.esp = mstate.esp - 4;
                        mstate.funcs[this.i8]();
                        return;
                     }
                     addr265:
                     while(true)
                     {
                        this.i6 = this.i6 + 4;
                        this.i4 = this.i4 + 1;
                        continue loop1;
                     }
                  }
                  this.i4 = 0;
                  this.i5 = this.i2 + 16;
                  this.i6 = this.i1;
                  loop2:
                  while(true)
                  {
                     this.i7 = li32(this.i5);
                     if(this.i7 <= this.i4)
                     {
                        break;
                     }
                     this.i7 = li32(this.i6 + 1056);
                     if(this.i7 != 0)
                     {
                        this.i8 = FSM_vorbis_info_clear;
                        this.i9 = li32(this.i6 + 800);
                        this.i9 = this.i9 << 2;
                        this.i8 = this.i8 + this.i9;
                        this.i8 = li32(this.i8);
                        this.i8 = li32(this.i8 + 12);
                        mstate.esp = mstate.esp - 4;
                        si32(this.i7,mstate.esp);
                        state = 3;
                        mstate.esp = mstate.esp - 4;
                        mstate.funcs[this.i8]();
                        return;
                     }
                     addr386:
                     while(true)
                     {
                        this.i6 = this.i6 + 4;
                        this.i4 = this.i4 + 1;
                        continue loop2;
                     }
                  }
                  this.i4 = 0;
                  this.i5 = this.i2 + 20;
                  this.i6 = this.i1;
                  loop3:
                  while(true)
                  {
                     this.i7 = li32(this.i5);
                     if(this.i7 <= this.i4)
                     {
                        break;
                     }
                     this.i7 = li32(this.i6 + 1568);
                     if(this.i7 != 0)
                     {
                        this.i8 = FSM_vorbis_info_clear;
                        this.i9 = li32(this.i6 + 1312);
                        this.i9 = this.i9 << 2;
                        this.i8 = this.i8 + this.i9;
                        this.i8 = li32(this.i8);
                        this.i8 = li32(this.i8 + 12);
                        mstate.esp = mstate.esp - 4;
                        si32(this.i7,mstate.esp);
                        state = 4;
                        mstate.esp = mstate.esp - 4;
                        mstate.funcs[this.i8]();
                        return;
                     }
                     addr507:
                     while(true)
                     {
                        this.i6 = this.i6 + 4;
                        this.i4 = this.i4 + 1;
                        continue loop3;
                     }
                  }
                  this.i4 = 0;
                  this.i5 = this.i1 + 1824;
                  this.i6 = this.i2 + 2848;
                  this.i7 = this.i2 + 24;
                  this.i8 = this.i4;
                  loop4:
                  while(true)
                  {
                     this.i9 = this.i5;
                     this.i5 = this.i4;
                     this.i10 = li32(this.i7);
                     this.i4 = this.i9;
                     if(this.i10 <= this.i5)
                     {
                        break;
                     }
                     this.i4 = li32(this.i4);
                     if(this.i4 != 0)
                     {
                        mstate.esp = mstate.esp - 4;
                        si32(this.i4,mstate.esp);
                        state = 5;
                        mstate.esp = mstate.esp - 4;
                        FSM_vorbis_info_clear.start();
                        return;
                     }
                     addr597:
                     while(true)
                     {
                        this.i4 = li32(this.i6);
                        if(this.i4 != 0)
                        {
                           mstate.esp = mstate.esp - 4;
                           this.i4 = this.i4 + this.i8;
                           si32(this.i4,mstate.esp);
                           state = 6;
                           mstate.esp = mstate.esp - 4;
                           FSM_vorbis_info_clear.start();
                           return;
                        }
                        addr644:
                        while(true)
                        {
                           this.i4 = this.i8 + 56;
                           this.i9 = this.i9 + 4;
                           this.i10 = this.i5 + 1;
                           this.i8 = this.i4;
                           this.i5 = this.i9;
                           this.i4 = this.i10;
                           continue loop4;
                        }
                     }
                  }
                  this.i4 = li32(this.i6);
                  if(this.i4 != 0)
                  {
                     this.i5 = 0;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i4,mstate.esp);
                     si32(this.i5,mstate.esp + 4);
                     state = 7;
                     mstate.esp = mstate.esp - 4;
                     FSM_vorbis_info_clear.start();
                     return;
                  }
                  addr751:
                  this.i4 = 0;
                  this.i1 = this.i1 + 2852;
                  this.i2 = this.i2 + 28;
                  break;
               }
               addr924:
               this.i1 = 0;
               si32(this.i1,this.i0);
               si32(this.i1,this.i0 + 4);
               si32(this.i1,this.i0 + 8);
               si32(this.i1,this.i0 + 12);
               si32(this.i1,this.i0 + 16);
               si32(this.i1,this.i0 + 20);
               si32(this.i1,this.i0 + 24);
               si32(this.i1,this.i0 + 28);
               mstate.esp = mstate.ebp;
               mstate.ebp = li32(mstate.esp);
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp + 4;
               mstate.gworker = caller;
               return;
            case 1:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr124);
            case 2:
               mstate.esp = mstate.esp + 4;
               §§goto(addr265);
            case 3:
               mstate.esp = mstate.esp + 4;
               §§goto(addr386);
            case 4:
               mstate.esp = mstate.esp + 4;
               §§goto(addr507);
            case 5:
               mstate.esp = mstate.esp + 4;
               §§goto(addr597);
            case 6:
               mstate.esp = mstate.esp + 4;
               §§goto(addr644);
            case 7:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr751);
            case 8:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               addr837:
               while(true)
               {
                  this.i4 = this.i5 + 4;
                  this.i5 = this.i1 + 1;
                  this.i1 = this.i4;
                  this.i4 = this.i5;
                  break loop13;
               }
            case 9:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr924);
         }
         while(true)
         {
            this.i5 = this.i1;
            this.i1 = this.i4;
            this.i6 = li32(this.i2);
            this.i4 = this.i5;
            if(this.i6 <= this.i1)
            {
               break;
            }
            this.i4 = li32(this.i4);
            if(this.i4 != 0)
            {
               this.i6 = 0;
               this.i7 = this.i4;
               this.i8 = 520;
               memset(this.i7,this.i6,this.i8);
               mstate.esp = mstate.esp - 8;
               si32(this.i4,mstate.esp);
               si32(this.i6,mstate.esp + 4);
               state = 8;
               mstate.esp = mstate.esp - 4;
               FSM_vorbis_info_clear.start();
               return;
            }
            §§goto(addr837);
         }
         this.i1 = 0;
         mstate.esp = mstate.esp - 8;
         si32(this.i3,mstate.esp);
         si32(this.i1,mstate.esp + 4);
         state = 9;
         mstate.esp = mstate.esp - 4;
         FSM_vorbis_info_clear.start();
      }
   }
}
