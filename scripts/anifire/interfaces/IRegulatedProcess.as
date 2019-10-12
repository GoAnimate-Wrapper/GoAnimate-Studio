package anifire.interfaces
{
   import flash.events.IEventDispatcher;
   
   public interface IRegulatedProcess extends IEventDispatcher
   {
       
      
      function startProcess(param1:Boolean = false, param2:Number = 0) : void;
   }
}
