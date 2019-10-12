package anifire.studio.interfaces
{
   import anifire.studio.core.MotionData;
   
   public interface ISlidable
   {
       
      
      function startSlideMotion() : void;
      
      function removeSlideMotion() : void;
      
      function get motionData() : MotionData;
      
      function set motionData(param1:MotionData) : void;
      
      function get slideEnabled() : Boolean;
      
      function get isSliding() : Boolean;
   }
}
