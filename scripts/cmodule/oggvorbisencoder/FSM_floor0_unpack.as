package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_floor0_unpack extends Machine
   {
      
      public static const intRegCount:int = 9;
      
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
      
      public function FSM_floor0_unpack()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_floor0_unpack = null;
         _loc1_ = new FSM_floor0_unpack();
         FSM_floor0_unpack.gworker = _loc1_;
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
               this.i0 = 96;
               this.i1 = li32(mstate.ebp + 8);
               this.i1 = li32(this.i1 + 28);
               mstate.esp = mstate.esp - 8;
               this.i2 = 0;
               si32(this.i2,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               state = 1;
               mstate.esp = mstate.esp - 4;
               FSM_floor0_unpack.start();
               return;
            case 1:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = li32(mstate.ebp + 12);
               mstate.esp = mstate.esp - 8;
               this.i3 = 8;
               si32(this.i2,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_floor0_unpack.start();
            case 2:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               si32(this.i4,this.i0);
               mstate.esp = mstate.esp - 8;
               this.i4 = 16;
               si32(this.i2,mstate.esp);
               si32(this.i4,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_floor0_unpack.start();
            case 3:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               si32(this.i5,this.i0 + 4);
               mstate.esp = mstate.esp - 8;
               si32(this.i2,mstate.esp);
               si32(this.i4,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_floor0_unpack.start();
            case 4:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               si32(this.i4,this.i0 + 8);
               mstate.esp = mstate.esp - 8;
               this.i4 = 6;
               si32(this.i2,mstate.esp);
               si32(this.i4,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_floor0_unpack.start();
            case 5:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               si32(this.i4,this.i0 + 12);
               mstate.esp = mstate.esp - 8;
               si32(this.i2,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_floor0_unpack.start();
            case 6:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               si32(this.i3,this.i0 + 16);
               mstate.esp = mstate.esp - 8;
               this.i3 = 4;
               si32(this.i2,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_floor0_unpack.start();
            case 7:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i3 = this.i3 + 1;
               si32(this.i3,this.i0 + 20);
               this.i4 = li32(this.i0);
               this.i5 = this.i0 + 20;
               this.i6 = this.i0 + 8;
               this.i7 = this.i0 + 4;
               this.i8 = this.i0;
               if(this.i4 >= 1)
               {
                  this.i4 = li32(this.i7);
                  if(this.i4 >= 1)
                  {
                     this.i4 = li32(this.i6);
                     if(this.i4 >= 1)
                     {
                        if(this.i3 >= 1)
                        {
                           this.i3 = 0;
                           this.i4 = this.i8 + 24;
                           this.i6 = this.i1 + 24;
                           addr571:
                           while(true)
                           {
                              this.i7 = this.i3;
                              this.i8 = li32(this.i5);
                              this.i3 = this.i4;
                              if(this.i8 <= this.i7)
                              {
                                 break;
                              }
                              this.i8 = 8;
                              mstate.esp = mstate.esp - 8;
                              si32(this.i2,mstate.esp);
                              si32(this.i8,mstate.esp + 4);
                              mstate.esp = mstate.esp - 4;
                              FSM_floor0_unpack.start();
                           }
                           mstate.eax = this.i0;
                           break;
                        }
                     }
                  }
               }
               addr591:
               if(this.i0 == 0)
               {
                  this.i0 = 0;
                  §§goto(addr601);
               }
               else
               {
                  this.i1 = 0;
                  this.i2 = this.i0;
                  this.i3 = 96;
                  memset(this.i2,this.i1,this.i3);
                  mstate.esp = mstate.esp - 8;
                  si32(this.i0,mstate.esp);
                  si32(this.i1,mstate.esp + 4);
                  state = 9;
                  mstate.esp = mstate.esp - 4;
                  FSM_floor0_unpack.start();
                  return;
               }
            case 8:
               while(true)
               {
                  this.i8 = mstate.eax;
                  mstate.esp = mstate.esp + 8;
                  si32(this.i8,this.i3);
                  if(this.i8 >= 0)
                  {
                     this.i3 = li32(this.i6);
                     if(this.i8 < this.i3)
                     {
                        this.i3 = this.i8 << 2;
                        this.i3 = this.i1 + this.i3;
                        this.i3 = li32(this.i3 + 1824);
                        this.i8 = li32(this.i3 + 12);
                        if(this.i8 != 0)
                        {
                           this.i3 = li32(this.i3);
                           if(this.i3 >= 1)
                           {
                              this.i3 = this.i4 + 4;
                              this.i7 = this.i7 + 1;
                              this.i4 = this.i3;
                              this.i3 = this.i7;
                              §§goto(addr571);
                           }
                           else
                           {
                              break;
                           }
                        }
                        break;
                     }
                     break;
                  }
                  break;
               }
               §§goto(addr591);
            case 9:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               mstate.eax = this.i1;
         }
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
