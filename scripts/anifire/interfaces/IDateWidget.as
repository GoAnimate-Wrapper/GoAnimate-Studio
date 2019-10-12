package anifire.interfaces
{
   public interface IDateWidget
   {
       
      
      function get currentDate() : Date;
      
      function set currentDate(param1:Date) : void;
      
      function get selectedDate() : int;
      
      function set selectedDate(param1:int) : void;
   }
}
