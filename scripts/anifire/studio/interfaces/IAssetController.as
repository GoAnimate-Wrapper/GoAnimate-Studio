package anifire.studio.interfaces
{
   import flash.events.IEventDispatcher;
   
   public interface IAssetController extends IEventDispatcher, IDestroyable
   {
       
      
      function set view(param1:IAssetView) : void;
      
      function get view() : IAssetView;
   }
}
