package anifire.interfaces
{
   public interface IIterator
   {
       
      
      function get hasNext() : Boolean;
      
      function get next() : Object;
      
      function reset() : void;
   }
}
