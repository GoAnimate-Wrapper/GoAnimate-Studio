package anifire.studio.interfaces
{
   import anifire.util.UtilHashSelectedColor;
   
   public interface IColorable
   {
       
      
      function get customColor() : UtilHashSelectedColor;
      
      function get colorableArea() : Array;
      
      function changeColor(param1:String, param2:uint = 4.294967295E9) : Number;
      
      function restoreColor() : void;
   }
}
