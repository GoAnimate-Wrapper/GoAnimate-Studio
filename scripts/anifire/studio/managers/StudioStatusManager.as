package anifire.studio.managers
{
   import anifire.managers.NativeCursorManager;
   import anifire.managers.ServerConnector;
   import flash.events.EventDispatcher;
   
   public class StudioStatusManager extends EventDispatcher
   {
      
      private static var _instance:StudioStatusManager;
       
      
      private var _isBusy:Boolean;
      
      private var _busyCounter:int;
      
      private var _modalCounter:int;
      
      private var _soundAlertCounter:int;
      
      public function StudioStatusManager()
      {
         super();
         this._modalCounter = 0;
         this._busyCounter = 0;
         this._soundAlertCounter = 0;
      }
      
      public static function get instance() : StudioStatusManager
      {
         if(!_instance)
         {
            _instance = new StudioStatusManager();
         }
         return _instance;
      }
      
      public function get isBusy() : Boolean
      {
         return this._isBusy;
      }
      
      private function checkBusyState() : void
      {
         var _loc2_:String = null;
         var _loc1_:Boolean = this._busyCounter > 0 || this._modalCounter > 0;
         if(_loc1_ != this._isBusy)
         {
            this._isBusy = _loc1_;
            _loc2_ = !!this._isBusy?"stageLock":"stageUnlock";
            ServerConnector.instance.notifyEvent(_loc2_);
         }
      }
      
      public function get isSoundAlertActive() : Boolean
      {
         return this._soundAlertCounter != 0;
      }
      
      public function increaseSoundAlertCounter() : void
      {
         this._soundAlertCounter++;
      }
      
      public function decreaseSoundAlertCounter() : void
      {
         this._soundAlertCounter--;
      }
      
      public function increaseModalCounter() : void
      {
         this._modalCounter++;
         if(this._modalCounter > 0)
         {
            this.checkBusyState();
         }
      }
      
      public function decreaseModalCounter() : void
      {
         this._modalCounter--;
         if(this._modalCounter < 0)
         {
            this._modalCounter = 0;
         }
         if(this._modalCounter == 0)
         {
            this.checkBusyState();
         }
      }
      
      public function increaseBusyCounter(param1:Number = 1) : Boolean
      {
         this._busyCounter = this._busyCounter + param1;
         if(this._busyCounter == 1)
         {
            NativeCursorManager.instance.setBusyCursor();
            this.checkBusyState();
            return true;
         }
         return false;
      }
      
      public function decreaseBusyCounter(param1:Number = 1) : Boolean
      {
         this._busyCounter = this._busyCounter - param1;
         if(this._busyCounter < 0)
         {
            this._busyCounter = 0;
         }
         if(this._busyCounter == 0)
         {
            NativeCursorManager.instance.removeBusyCursor();
            this.checkBusyState();
            return true;
         }
         return false;
      }
   }
}
