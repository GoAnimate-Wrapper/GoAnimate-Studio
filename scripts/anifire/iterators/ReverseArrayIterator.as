package anifire.iterators
{
   import anifire.interfaces.IIterator;
   
   public class ReverseArrayIterator implements IIterator
   {
       
      
      private var _index:int = -1;
      
      private var _collection:Array;
      
      public function ReverseArrayIterator(param1:Array)
      {
         super();
         this._collection = param1.concat();
         this._index = this._collection.length - 1;
      }
      
      public function get hasNext() : Boolean
      {
         if(this._collection)
         {
            return this._index >= 0;
         }
         return false;
      }
      
      public function get next() : Object
      {
         if(this._collection)
         {
            return this._collection[this._index--];
         }
         return null;
      }
      
      public function reset() : void
      {
         this._index = this._collection.length - 1;
      }
   }
}
