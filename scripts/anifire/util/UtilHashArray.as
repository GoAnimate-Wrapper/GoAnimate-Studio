package anifire.util
{
   public class UtilHashArray
   {
       
      
      private var keyToIndexMap:UtilHashMap;
      
      private var indexToKeyMap:Array;
      
      private var data:Array;
      
      public function UtilHashArray()
      {
         super();
         this.keyToIndexMap = new UtilHashMap();
         this.indexToKeyMap = new Array();
         this.data = new Array();
      }
      
      public function push(param1:String, param2:*, param3:Boolean = true) : int
      {
         var _loc4_:int = 0;
         if(this.keyToIndexMap.containsKey(param1))
         {
            if(param3)
            {
               _loc4_ = this.keyToIndexMap.getValue(param1) as int;
               this.data[_loc4_] = param2;
            }
         }
         else
         {
            _loc4_ = this.data.length;
            this.data.push(param2);
            this.indexToKeyMap.push(param1);
            this.keyToIndexMap.put(param1,_loc4_);
         }
         return _loc4_;
      }
      
      public function remove(param1:int, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 >= this.length || param1 + param2 - 1 >= this.length)
         {
            throw new Error("UtilHashArray index out of bound error. Index --> " + param1);
         }
         _loc3_ = 0;
         while(_loc3_ < param2)
         {
            this.keyToIndexMap.remove(this.indexToKeyMap[param1 + _loc3_]);
            _loc3_++;
         }
         this.data.splice(param1,param2);
         this.indexToKeyMap.splice(param1,param2);
         _loc3_ = param1;
         while(_loc3_ < this.length)
         {
            this.keyToIndexMap.remove(this.indexToKeyMap[_loc3_]);
            this.keyToIndexMap.put(this.indexToKeyMap[_loc3_],_loc3_);
            _loc3_++;
         }
      }
      
      public function removeByKey(param1:String) : void
      {
         var _loc2_:int = this.getIndex(param1);
         if(_loc2_ != -1)
         {
            this.remove(_loc2_,1);
         }
      }
      
      public function insert(param1:int, param2:UtilHashArray, param3:Boolean = true) : void
      {
         var _loc4_:int = 0;
         var _loc6_:Function = null;
         var _loc7_:Array = null;
         var _loc8_:String = null;
         var _loc5_:UtilHashArray = param2.clone();
         if(param3)
         {
            _loc4_ = _loc5_.length - 1;
            while(_loc4_ >= 0)
            {
               _loc8_ = _loc5_.getKey(_loc4_);
               if(this.containsKey(_loc8_))
               {
                  this.replaceValueByKey(_loc8_,_loc5_.getValueByIndex(_loc4_));
                  _loc5_.remove(_loc4_,1);
               }
               _loc4_--;
            }
         }
         else
         {
            _loc4_ = 0;
            while(_loc4_ < _loc5_.length)
            {
               if(this.containsKey(_loc5_.getKey(_loc4_)))
               {
                  throw new Error("The key already exist in the HashArray");
               }
               _loc4_++;
            }
         }
         _loc6_ = this.indexToKeyMap.splice;
         _loc7_ = _loc5_.indexToKeyMap.concat();
         _loc7_.unshift(0);
         _loc7_.unshift(param1);
         _loc6_.apply(this.indexToKeyMap,_loc7_);
         _loc6_ = this.data.splice;
         _loc7_ = _loc5_.data.concat();
         _loc7_.unshift(0);
         _loc7_.unshift(param1);
         _loc6_.apply(this.data,_loc7_);
         _loc5_.removeAll();
         _loc5_ = null;
         _loc4_ = param1;
         while(_loc4_ < this.length)
         {
            this.keyToIndexMap.put(this.indexToKeyMap[_loc4_],_loc4_);
            _loc4_++;
         }
      }
      
      public function containsKey(param1:String) : Boolean
      {
         return this.keyToIndexMap.containsKey(param1);
      }
      
      public function containsValue(param1:*) : Boolean
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.data.length)
         {
            if(this.data[_loc2_] == param1)
            {
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      public function getKey(param1:int) : String
      {
         return this.indexToKeyMap[param1];
      }
      
      public function getKeys() : Array
      {
         return this.indexToKeyMap;
      }
      
      public function getIndex(param1:String) : int
      {
         var _loc2_:* = this.keyToIndexMap.getValue(param1);
         if(_loc2_ != null)
         {
            return int(_loc2_);
         }
         return -1;
      }
      
      public function getValueByKey(param1:String) : *
      {
         var _loc2_:* = this.keyToIndexMap.getValue(param1);
         if(_loc2_ != null)
         {
            return this.data[int(_loc2_)];
         }
         return null;
      }
      
      public function getValueByIndex(param1:int) : *
      {
         return this.data[param1];
      }
      
      public function replaceValueByIndex(param1:int, param2:*) : void
      {
         if(param1 >= this.length || param1 < 0)
         {
            throw new Error("index out of bound");
         }
         this.data[param1] = param2;
      }
      
      public function replaceValueByKey(param1:String, param2:*) : void
      {
         var _loc3_:* = this.keyToIndexMap.getValue(param1);
         if(_loc3_ == null)
         {
            throw new Error("key not exist!");
         }
         this.data[_loc3_ as int] = param2;
      }
      
      public function get length() : int
      {
         return this.data.length;
      }
      
      public function removeAll() : void
      {
         this.keyToIndexMap.clear();
         this.keyToIndexMap = new UtilHashMap();
         this.indexToKeyMap.splice(0,this.indexToKeyMap.length);
         this.indexToKeyMap = new Array();
         this.data.splice(0,this.data.length);
         this.data = new Array();
      }
      
      public function getArray() : Array
      {
         return this.data;
      }
      
      public function unShift(param1:String, param2:Object) : uint
      {
         if(this.keyToIndexMap.containsKey(param1))
         {
            this.remove(this.getIndex(param1),1);
         }
         this.data.unshift(param2);
         this.indexToKeyMap.unshift(param1);
         var _loc3_:int = 0;
         while(_loc3_ < this.indexToKeyMap.length)
         {
            this.keyToIndexMap.put(this.indexToKeyMap[_loc3_],_loc3_);
            _loc3_++;
         }
         return this.length;
      }
      
      public function clone() : UtilHashArray
      {
         var _loc1_:UtilHashArray = new UtilHashArray();
         _loc1_.data = this.data.concat();
         _loc1_.indexToKeyMap = this.indexToKeyMap.concat();
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.indexToKeyMap.length)
         {
            _loc1_.keyToIndexMap.put(_loc1_.indexToKeyMap[_loc2_],_loc2_);
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function isIdentical(param1:UtilHashArray) : Boolean
      {
         if(this.data.toString() == param1.data.toString() && this.indexToKeyMap.toString() == param1.indexToKeyMap.toString())
         {
            return true;
         }
         return false;
      }
   }
}
