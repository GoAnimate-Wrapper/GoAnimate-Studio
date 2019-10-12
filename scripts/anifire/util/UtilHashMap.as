package anifire.util
{
   import flash.utils.Dictionary;
   
   public dynamic class UtilHashMap extends Dictionary implements IUtilMap
   {
       
      
      public function UtilHashMap(param1:Boolean = false)
      {
         super(param1);
      }
      
      public function put(param1:String, param2:*) : void
      {
         this[param1] = param2;
      }
      
      public function remove(param1:String) : void
      {
         this[param1] = null;
         delete this[param1];
      }
      
      public function containsKey(param1:String) : Boolean
      {
         return this[param1] != null;
      }
      
      public function containsValue(param1:*) : Boolean
      {
         var _loc2_:* = null;
         for(_loc2_ in this)
         {
            if(this[_loc2_] == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      public function getKey(param1:*) : String
      {
         var _loc2_:* = null;
         for(_loc2_ in this)
         {
            if(this[_loc2_] == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getValue(param1:String) : *
      {
         return this[param1];
      }
      
      public function size() : int
      {
         var _loc2_:* = null;
         var _loc1_:int = 0;
         for(_loc2_ in this)
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      public function isEmpty() : Boolean
      {
         return this.size() <= 0;
      }
      
      public function clear() : void
      {
         var _loc1_:* = null;
         for(_loc1_ in this)
         {
            this[_loc1_] = null;
            delete this[_loc1_];
         }
      }
   }
}
