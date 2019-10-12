package anifire.studio.interfaces
{
   import anifire.studio.core.MotionData;
   
   public interface IMotion
   {
       
      
      function get motionData() : MotionData;
      
      function set motionData(param1:MotionData) : void;
      
      function get shadow() : Object;
      
      function get isShadow() : Boolean;
   }
}
