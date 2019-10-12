package anifire.iterators
{
   import anifire.interfaces.IIterator;
   
   public class ArrayIterator implements IIterator
   {
       
      
      private var _index:uint = 0;
      
      private var _collection:Array;
      
      public function ArrayIterator(param1:Array)
      {
         super();
         this._collection = param1.concat();
         this._index = 0;
      }
      
      public function get hasNext() : Boolean
      {
         if(this._collection)
         {
            return this._index < this._collection.length;
         }
         return false;
      }
      
      public function get next() : Object
      {
         if(this._collection)
         {
            return this._collection[this._index++];
         }
         return null;
      }
      
      public function reset() : void
      {
         this._index = 0;
      }
   }
}
