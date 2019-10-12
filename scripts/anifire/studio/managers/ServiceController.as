package anifire.studio.managers
{
   import anifire.studio.events.ServiceProviderEvent;
   import anifire.studio.interfaces.IServiceProvider;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   public class ServiceController extends EventDispatcher
   {
      
      private static const QUEUE_MAX:uint = 1000;
       
      
      private var _queue:Vector.<Object>;
      
      private var _serviceProviderTeam:Vector.<IServiceProvider>;
      
      public function ServiceController()
      {
         this._queue = new Vector.<Object>();
         this._serviceProviderTeam = new Vector.<IServiceProvider>();
         super();
      }
      
      public function get queueLength() : uint
      {
         return this._queue.length;
      }
      
      public function addServiceProvider(param1:IServiceProvider) : void
      {
         if(param1)
         {
            this._serviceProviderTeam.push(param1);
         }
      }
      
      public function enqueue(param1:Object) : void
      {
         if(param1)
         {
            this._queue.push(param1);
            if(this._queue.length > QUEUE_MAX)
            {
               this._queue.splice(0,1);
            }
         }
      }
      
      public function startService() : void
      {
         var _loc1_:IServiceProvider = this.freeServiceProvider;
         if(_loc1_)
         {
            this.serveNextCustomer(_loc1_);
         }
      }
      
      private function get freeServiceProvider() : IServiceProvider
      {
         var _loc1_:IServiceProvider = null;
         for each(_loc1_ in this._serviceProviderTeam)
         {
            if(!_loc1_.isServing)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      private function serveNextCustomer(param1:IServiceProvider) : void
      {
         var _loc2_:Object = null;
         if(param1)
         {
            if(this._queue.length > 0)
            {
               _loc2_ = this._queue.splice(0,1);
               param1.addEventListener(ServiceProviderEvent.SERVICE_COMPLETE,this.onServiceComplete);
               param1.serveCustomer(_loc2_[0]);
               this.dispatchEvent(new Event(Event.CHANGE));
            }
            else
            {
               this.dispatchEvent(new Event(Event.COMPLETE));
            }
         }
      }
      
      private function onServiceComplete(param1:Event) : void
      {
         var _loc2_:IServiceProvider = param1.target as IServiceProvider;
         _loc2_.removeEventListener(ServiceProviderEvent.SERVICE_COMPLETE,this.onServiceComplete);
         this.serveNextCustomer(_loc2_);
      }
   }
}
