package anifire.studio.interfaces
{
   import flash.events.IEventDispatcher;
   import mx.core.UIComponent;
   
   public interface IAssetControl extends IDestroyable, IEventDispatcher
   {
       
      
      function get asset() : IEventDispatcher;
      
      function set asset(param1:IEventDispatcher) : void;
      
      function set drawingScale(param1:Number) : void;
      
      function get drawingScale() : Number;
      
      function get border() : UIComponent;
      
      function set showReferencePoint(param1:Boolean) : void;
      
      function get undoableAction() : Boolean;
      
      function set undoableAction(param1:Boolean) : void;
   }
}
