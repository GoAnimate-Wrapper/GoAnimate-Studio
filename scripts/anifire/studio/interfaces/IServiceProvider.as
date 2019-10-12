package anifire.studio.interfaces
{
   import flash.events.IEventDispatcher;
   
   public interface IServiceProvider extends IEventDispatcher
   {
       
      
      function get isServing() : Boolean;
      
      function serveCustomer(param1:Object) : void;
   }
}
