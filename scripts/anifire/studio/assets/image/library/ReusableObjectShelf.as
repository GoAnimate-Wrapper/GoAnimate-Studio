package anifire.studio.assets.image.library
{
   public class ReusableObjectShelf
   {
       
      
      private const DEFAULT_MAX_CAPACITY:uint = 100;
      
      private var _shelf:Vector.<IReusableObject>;
      
      private var _index:uint = 0;
      
      private var _age:uint = 0;
      
      public function ReusableObjectShelf()
      {
         this._shelf = new Vector.<IReusableObject>();
         super();
      }
      
      public function get age() : uint
      {
         return this._age;
      }
      
      public function borrowObject() : IReusableObject
      {
         this._age = 0;
         if(this._index < this._shelf.length)
         {
            return this._shelf[this._index++];
         }
         return null;
      }
      
      public function addObject(param1:IReusableObject) : Boolean
      {
         if(param1 && this._shelf.length < this.DEFAULT_MAX_CAPACITY)
         {
            this._shelf.push(param1);
            return true;
         }
         return false;
      }
      
      public function returnAllObjects() : void
      {
         this._index = 0;
         this._age++;
      }
      
      public function destroy() : void
      {
         var _loc1_:IReusableObject = null;
         for each(_loc1_ in this._shelf)
         {
            if(_loc1_)
            {
               _loc1_.releaseResource();
            }
         }
         this._index = 0;
         this._age = 0;
         this._shelf = new Vector.<IReusableObject>();
      }
   }
}
