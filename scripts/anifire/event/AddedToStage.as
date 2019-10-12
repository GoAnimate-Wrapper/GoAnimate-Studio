package anifire.event
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class AddedToStage extends EventDispatcher
   {
       
      
      private var _timer:Timer;
      
      private var _displayObject:DisplayObject;
      
      public function AddedToStage(param1:DisplayObject)
      {
         super();
         this._displayObject = param1;
      }
      
      override public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0.0, param5:Boolean = false) : void
      {
         super.addEventListener(param1,param2,param3,param4,param5);
         this._timer = new Timer(50);
         this._timer.addEventListener(TimerEvent.TIMER,this.onTimer);
         this._timer.start();
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         if(this._displayObject.stage)
         {
            this._timer.stop();
            this._timer.removeEventListener(TimerEvent.TIMER,this.onTimer);
            dispatchEvent(new Event(CoreEvent.ADDED_TO_STAGE_BY_TIMER));
         }
      }
   }
}
