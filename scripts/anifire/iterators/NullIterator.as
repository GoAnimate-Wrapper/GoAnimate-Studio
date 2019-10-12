package anifire.iterators
{
   import anifire.interfaces.IIterator;
   
   public class NullIterator implements IIterator
   {
       
      
      public function NullIterator()
      {
         super();
      }
      
      public function get hasNext() : Boolean
      {
         return false;
      }
      
      public function get next() : Object
      {
         return null;
      }
      
      public function reset() : void
      {
      }
   }
}
