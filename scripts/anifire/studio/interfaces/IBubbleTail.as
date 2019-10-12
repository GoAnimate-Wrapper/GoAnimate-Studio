package anifire.studio.interfaces
{
   public interface IBubbleTail
   {
       
      
      function get hasTail() : Boolean;
      
      function get tailX() : Number;
      
      function set tailX(param1:Number) : void;
      
      function get tailY() : Number;
      
      function set tailY(param1:Number) : void;
      
      function moveTail(param1:Number, param2:Number) : void;
   }
}
