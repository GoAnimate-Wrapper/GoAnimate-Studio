package anifire.studio.interfaces
{
   import anifire.studio.components.Timeline;
   import mx.core.IUIComponent;
   import mx.core.UIComponent;
   
   public interface ITimelineContainer extends IUIComponent
   {
       
      
      function get length() : Number;
      
      function get count() : int;
      
      function get label() : String;
      
      function set label(param1:String) : void;
      
      function disableFocus() : void;
      
      function getCurrIndex() : int;
      
      function getCurrItem() : ITimelineElement;
      
      function addItem(param1:UIComponent) : void;
      
      function addItemAt(param1:UIComponent, param2:int) : void;
      
      function getItemAt(param1:int) : ITimelineElement;
      
      function removeItem(param1:Number = -1) : Boolean;
      
      function removeAllItems() : void;
      
      function changeProperty(param1:int, param2:String, param3:* = null) : void;
      
      function setHorizontalView(param1:Number = 0) : void;
      
      function getHorizontalView() : Number;
      
      function setTimelineReferer(param1:Timeline) : void;
   }
}
