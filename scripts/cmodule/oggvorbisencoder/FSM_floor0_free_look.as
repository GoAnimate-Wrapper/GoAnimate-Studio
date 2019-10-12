package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_floor0_free_look extends Machine
   {
      
      public static const intRegCount:int = 4;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public function FSM_floor0_free_look()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_floor0_free_look = null;
         _loc1_ = new FSM_floor0_free_look();
         FSM_floor0_free_look.gworker = _loc1_;
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
               if(this.i0 != 0)
               {
                  this.i1 = li32(this.i0 + 8);
                  this.i2 = this.i0 + 8;
                  if(this.i1 != 0)
                  {
                     this.i1 = li32(this.i1);
                     if(this.i1 != 0)
                     {
                        this.i3 = 0;
                        mstate.esp = mstate.esp - 8;
                        si32(this.i1,mstate.esp);
                        si32(this.i3,mstate.esp + 4);
                        state = 1;
                        mstate.esp = mstate.esp - 4;
                        FSM_floor0_free_look.start();
                        return;
                     }
                     addr110:
                     this.i1 = li32(this.i2);
                     this.i1 = li32(this.i1 + 4);
                     if(this.i1 != 0)
                     {
                        this.i3 = 0;
                        mstate.esp = mstate.esp - 8;
                        si32(this.i1,mstate.esp);
                        si32(this.i3,mstate.esp + 4);
                        state = 2;
                        mstate.esp = mstate.esp - 4;
                        FSM_floor0_free_look.start();
                        return;
                     }
                     break;
                  }
                  addr220:
                  this.i1 = 0;
                  si32(this.i1,this.i0);
                  si32(this.i1,this.i0 + 4);
                  si32(this.i1,this.i0 + 8);
                  si32(this.i1,this.i0 + 12);
                  si32(this.i1,this.i0 + 16);
                  si32(this.i1,this.i0 + 20);
                  si32(this.i1,this.i0 + 24);
                  si32(this.i1,this.i0 + 28);
                  mstate.esp = mstate.esp - 8;
                  si32(this.i0,mstate.esp);
                  si32(this.i1,mstate.esp + 4);
                  state = 4;
                  mstate.esp = mstate.esp - 4;
                  FSM_floor0_free_look.start();
                  return;
               }
               addr318:
               mstate.esp = mstate.ebp;
               mstate.ebp = li32(mstate.esp);
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp + 4;
               mstate.gworker = caller;
               return;
            case 1:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr110);
            case 2:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               break;
            case 3:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr220);
            case 4:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr318);
         }
         this.i1 = 0;
         this.i2 = li32(this.i2);
         mstate.esp = mstate.esp - 8;
         si32(this.i2,mstate.esp);
         si32(this.i1,mstate.esp + 4);
         state = 3;
         mstate.esp = mstate.esp - 4;
         FSM_floor0_free_look.start();
      }
   }
}
