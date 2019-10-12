package anifire.studio.interfaces
{
   public interface IEye
   {
       
      
      function get lookAtCameraSupported() : Boolean;
      
      function get lookAtCamera() : Boolean;
      
      function set lookAtCamera(param1:Boolean) : void;
   }
}
