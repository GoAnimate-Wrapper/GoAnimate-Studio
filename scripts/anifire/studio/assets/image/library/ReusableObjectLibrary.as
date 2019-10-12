package anifire.studio.assets.image.library
{
   public class ReusableObjectLibrary
   {
       
      
      private var _library:Object;
      
      public function ReusableObjectLibrary()
      {
         this._library = new Object();
         super();
      }
      
      public function borrowObject(param1:String) : IReusableObject
      {
         var _loc2_:ReusableObjectShelf = null;
         var _loc3_:IReusableObject = null;
         if(param1)
         {
            _loc2_ = this._library[param1];
            if(!_loc2_)
            {
               _loc2_ = new ReusableObjectShelf();
               this._library[param1] = _loc2_;
            }
            _loc3_ = _loc2_.borrowObject();
            if(_loc3_)
            {
               _loc3_.doBeforeReuse();
            }
            return _loc3_;
         }
         return null;
      }
      
      public function addObject(param1:IReusableObject, param2:String) : Boolean
      {
         var _loc3_:ReusableObjectShelf = null;
         if(param2 && param1)
         {
            _loc3_ = this._library[param2];
            if(!_loc3_)
            {
               _loc3_ = new ReusableObjectShelf();
               this._library[param2] = _loc3_;
            }
            return _loc3_.addObject(param1);
         }
         return false;
      }
      
      public function returnAllObjects() : void
      {
         var _loc2_:ReusableObjectShelf = null;
         var _loc1_:uint = 50;
         for each(_loc2_ in this._library)
         {
            _loc2_.returnAllObjects();
            if(_loc2_.age > _loc1_)
            {
               _loc2_.destroy();
            }
         }
      }
      
      public function destroy() : void
      {
         var _loc1_:ReusableObjectShelf = null;
         for each(_loc1_ in this._library)
         {
            _loc1_.destroy();
         }
         this._library = new Object();
      }
   }
}
