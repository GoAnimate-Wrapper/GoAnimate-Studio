package anifire.util
{
   import anifire.event.LoadMgrEvent;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.TimerEvent;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   
   public class UtilLoadMgr extends EventDispatcher
   {
      
      private static const STATUS_INITIALIZE:String = "initialize";
      
      private static const STATUS_ON_PROGRESS:String = "onProgress";
      
      private static const STATUS_END:String = "end";
      
      private static const MAX_DELAY:Number = 1000;
      
      private static const MIN_DELAY:Number = 1;
      
      private static const MAX_JOBS:Number = 2;
       
      
      private var _progresses:Dictionary;
      
      private var _timer:Timer;
      
      private var _status:String = "initialize";
      
      private var _loaderQueue:Array;
      
      private var _byteArrayQueue:Array;
      
      private var _count:Number = 0;
      
      private var _tasks:Array;
      
      private var _extraData:Object;
      
      public function UtilLoadMgr()
      {
         this._progresses = new Dictionary();
         this._timer = new Timer(MIN_DELAY);
         this._tasks = new Array();
         super();
         this._loaderQueue = new Array();
         this._byteArrayQueue = new Array();
      }
      
      public function addEventDispatcher(param1:EventDispatcher, param2:String) : void
      {
         if(this._status != STATUS_INITIALIZE)
         {
            throw new Error("Error in using load manager. Loader object cannot be added after load manager has already started.");
         }
         var _loc3_:UtilLoadMgr = new UtilLoadMgr();
         _loc3_._progresses[param1] = 0;
         param1.addEventListener(param2,_loc3_.onEachComplete);
         _loc3_.commit();
         this.addLoadMgr(_loc3_);
      }
      
      public function setExtraData(param1:Object) : void
      {
         this._extraData = param1;
      }
      
      public function getExtraData() : Object
      {
         return this._extraData;
      }
      
      private function addLoadMgr(param1:UtilLoadMgr) : void
      {
         this._progresses[param1] = 0;
         param1.addEventListener(LoadMgrEvent.ALL_COMPLETE,this.onEachComplete);
      }
      
      private function onEachComplete(param1:Event) : void
      {
         var _loc2_:EventDispatcher = param1.target as EventDispatcher;
         _loc2_.removeEventListener(param1.type,this.onEachComplete);
         this._progresses[_loc2_] = 1;
         this._timer.delay = MIN_DELAY;
      }
      
      public function commit() : void
      {
         if(this._loaderQueue.length > 0)
         {
            this._count = 0;
            this.startNextTask();
         }
         this._status = STATUS_ON_PROGRESS;
         this._timer.addEventListener(TimerEvent.TIMER,this.onTimer);
         this._timer.start();
      }
      
      private function forceCompleteAll() : void
      {
         this._timer.removeEventListener(TimerEvent.TIMER,this.onTimer);
         this._timer.stop();
         this.dispatchEvent(new LoadMgrEvent(LoadMgrEvent.ALL_COMPLETE));
         this._status = STATUS_END;
      }
      
      private function onTimer(param1:Event) : void
      {
         if(this.isAllComplete())
         {
            this.forceCompleteAll();
         }
         else
         {
            this._timer.delay = MAX_DELAY;
         }
      }
      
      private function isAllComplete() : Boolean
      {
         var _loc1_:* = null;
         for(_loc1_ in this._progresses)
         {
            if(this._progresses[_loc1_] < 1)
            {
               return false;
            }
         }
         return true;
      }
      
      public function addTask(param1:Loader, param2:ByteArray) : void
      {
         this._loaderQueue.push(param1);
         this._byteArrayQueue.push(param2);
      }
      
      private function startNextTask() : void
      {
         var _loc1_:Loader = this._loaderQueue[this._count] as Loader;
         var _loc2_:ByteArray = this._byteArrayQueue[this._count] as ByteArray;
         _loc1_.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onTaskDone);
         _loc1_.loadBytes(_loc2_);
      }
      
      private function onTaskDone(param1:Event) : void
      {
         this._count++;
         if(this._count < this._loaderQueue.length)
         {
            this.startNextTask();
         }
         else
         {
            this.onComplete();
         }
      }
      
      private function onComplete() : void
      {
      }
   }
}
