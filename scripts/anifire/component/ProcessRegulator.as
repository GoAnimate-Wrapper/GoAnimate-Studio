package anifire.component
{
   import anifire.interfaces.IRegulatedProcess;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.ProgressEvent;
   import flash.utils.setTimeout;
   
   public class ProcessRegulator extends EventDispatcher implements IRegulatedProcess
   {
       
      
      private const STATE_IDLE:String = "STATE_IDLE";
      
      private const STATE_IN_PROGRESS:String = "STATE_IN_PROGRESS";
      
      private const STATE_HOLD:String = "STATE_HOLD";
      
      private const STATE_COMPLETE:String = "STATE_COMPLETE";
      
      private var _processes:Vector.<ProcessData>;
      
      private var _step:Number = 0;
      
      private var _oneByOne:Boolean = false;
      
      private var _interval:Number = 0;
      
      private var _state:String;
      
      private var _numComplete:Number = 0;
      
      public function ProcessRegulator(param1:IEventDispatcher = null)
      {
         super(param1);
         this.reset();
      }
      
      public function addProcess(param1:IRegulatedProcess, param2:String) : void
      {
         var _loc3_:Boolean = false;
         var _loc4_:ProcessData = null;
         if(param1 && param2)
         {
            _loc3_ = false;
            for each(_loc4_ in this._processes)
            {
               if(_loc4_.process == param1)
               {
                  _loc3_ = true;
                  break;
               }
            }
            if(!_loc3_)
            {
               this._processes.push(new ProcessData(param1,param2));
            }
         }
      }
      
      public function get numProcess() : Number
      {
         return this._processes.length;
      }
      
      public function get progress() : Number
      {
         return this._numComplete;
      }
      
      public function startProcess(param1:Boolean = false, param2:Number = 0) : void
      {
         var _loc3_:ProcessData = null;
         this._oneByOne = param1;
         this._interval = param2;
         if(0 == this._processes.length || this._state == this.STATE_COMPLETE)
         {
            this.dispatchEvent(new Event(Event.COMPLETE));
            return;
         }
         if(this._state != this.STATE_IDLE)
         {
            return;
         }
         this._state = this.STATE_IN_PROGRESS;
         if(param1)
         {
            this.startNext();
         }
         else
         {
            for each(_loc3_ in this._processes)
            {
               _loc3_.process.addEventListener(_loc3_.eventType,this.onProcessComplete);
               _loc3_.process.startProcess(param1,param2);
            }
         }
      }
      
      public function reset() : void
      {
         var _loc1_:ProcessData = null;
         for each(_loc1_ in this._processes)
         {
            _loc1_.process.removeEventListener(_loc1_.eventType,this.onProcessComplete);
         }
         this._processes = new Vector.<ProcessRegulator>();
         this._step = 0;
         this._oneByOne = false;
         this._interval = 0;
         this._state = this.STATE_IDLE;
         this._numComplete = 0;
      }
      
      private function startNext() : void
      {
         if(this._step < this._processes.length)
         {
            this._step++;
            this._processes[this._step - 1].process.addEventListener(this._processes[this._step - 1].eventType,this.onProcessComplete);
            this._processes[this._step - 1].process.startProcess(this._oneByOne,this._interval);
         }
      }
      
      private function onProcessComplete(param1:Event) : void
      {
         IEventDispatcher(param1.target).removeEventListener(param1.type,this.onProcessComplete);
         this._numComplete++;
         var _loc2_:ProgressEvent = new ProgressEvent(ProgressEvent.PROGRESS);
         _loc2_.bytesLoaded = this._numComplete;
         _loc2_.bytesTotal = this._processes.length;
         this.dispatchEvent(_loc2_);
         if(this._numComplete == this._processes.length)
         {
            this._state = this.STATE_COMPLETE;
            this.dispatchEvent(new Event(Event.COMPLETE));
            return;
         }
         if(this._oneByOne)
         {
            if(this._state == this.STATE_IN_PROGRESS)
            {
               if(this._interval > 0)
               {
                  setTimeout(this.startNext,this._interval);
               }
               else
               {
                  this.startNext();
               }
            }
         }
      }
   }
}

import anifire.interfaces.IRegulatedProcess;

class ProcessData
{
    
   
   private var _process:IRegulatedProcess;
   
   private var _eventType:String;
   
   public var completed:Boolean = false;
   
   function ProcessData(param1:IRegulatedProcess, param2:String)
   {
      super();
      this._process = param1;
      this._eventType = param2;
   }
   
   public function get process() : IRegulatedProcess
   {
      return this._process;
   }
   
   public function get eventType() : String
   {
      return this._eventType;
   }
}
