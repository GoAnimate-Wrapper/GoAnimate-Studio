package anifire.component
{
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.ProgressEvent;
   
   public class ProgressMonitor extends EventDispatcher
   {
      
      private static var _instance:ProgressMonitor;
       
      
      private var _progresses:Array;
      
      private var _numProgress:uint = 2;
      
      public function ProgressMonitor(param1:IEventDispatcher = null)
      {
         super(param1);
         this._progresses = new Array();
      }
      
      public static function getInstance() : ProgressMonitor
      {
         if(!_instance)
         {
            _instance = new ProgressMonitor();
         }
         return _instance;
      }
      
      public function addProgressEventDispatcher(param1:IEventDispatcher) : void
      {
         this._progresses.push({
            "dispatcher":param1,
            "progress":null
         });
         param1.addEventListener(ProgressEvent.PROGRESS,this.onProgress);
      }
      
      private function onProgress(param1:ProgressEvent) : void
      {
         var _loc3_:Object = null;
         var _loc2_:ProgressEvent = new ProgressEvent(ProgressEvent.PROGRESS,true);
         _loc2_.bytesLoaded = 0;
         _loc2_.bytesTotal = this._numProgress;
         for each(_loc3_ in this._progresses)
         {
            if(_loc3_.dispatcher == param1.target && param1.bytesTotal != 0)
            {
               _loc3_.progress = param1;
            }
            if(_loc3_.progress && _loc3_.progress.bytesTotal != 0)
            {
               _loc2_.bytesLoaded = _loc2_.bytesLoaded + _loc3_.progress.bytesLoaded / _loc3_.progress.bytesTotal;
            }
         }
         this.dispatchEvent(_loc2_);
      }
      
      public function reset() : void
      {
         var _loc1_:Object = null;
         for each(_loc1_ in this._progresses)
         {
            if(_loc1_.dispatcher)
            {
               IEventDispatcher(_loc1_.dispatcher).removeEventListener(ProgressEvent.PROGRESS,this.onProgress);
            }
            _loc1_ = null;
         }
         this._progresses = new Array();
      }
      
      public function set numProgress(param1:uint) : void
      {
         this._numProgress = param1;
      }
   }
}
