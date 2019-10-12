package anifire.studio.interfaces
{
   import anifire.studio.components.Timeline;
   
   public interface ITimelineElement
   {
       
      
      function set focus(param1:Boolean) : void;
      
      function get focus() : Boolean;
      
      function set x(param1:Number) : void;
      
      function get x() : Number;
      
      function set y(param1:Number) : void;
      
      function get y() : Number;
      
      function set width(param1:Number) : void;
      
      function get width() : Number;
      
      function set height(param1:Number) : void;
      
      function get height() : Number;
      
      function setTimelineReferer(param1:Timeline) : void;
   }
}
