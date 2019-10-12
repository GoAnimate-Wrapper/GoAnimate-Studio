package anifire.util
{
   public class UtilHashUint
   {
       
      
      private var keyToIndexMap:UtilHashMap;
      
      private var indexToKeyMap:Vector.<String>;
      
      private var data:Vector.<uint>;
      
      public function UtilHashUint()
      {
         super();
         this.keyToIndexMap = new UtilHashMap();
         this.indexToKeyMap = new Vector.<String>();
         this.data = new Vector.<uint>();
      }
      
      public function push(param1:String, param2:uint, param3:Boolean = true) : int
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
      
      public function insert(param1:int, param2:UtilHashUint, param3:Boolean = true) : void
      {
         var _loc4_:int = 0;
         _loc4_ = param2.length - 1;
         while(_loc4_ >= 0)
         {
            this.push(param2.getKey(_loc4_),param2.getValueByIndex(_loc4_),param3);
            _loc4_--;
         }
      }
      
      public function containsKey(param1:String) : Boolean
      {
         return this.keyToIndexMap.containsKey(param1);
      }
      
      public function containsValue(param1:uint) : Boolean
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
      
      public function getKeys() : Vector.<String>
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
      
      public function getValueByKey(param1:String) : uint
      {
         var _loc2_:* = this.keyToIndexMap.getValue(param1);
         if(_loc2_ != null)
         {
            return this.data[int(_loc2_)];
         }
         return null;
      }
      
      public function getValueByIndex(param1:int) : uint
      {
         return this.data[param1];
      }
      
      public function replaceValueByIndex(param1:int, param2:uint) : void
      {
         if(param1 >= this.length || param1 < 0)
         {
            throw new Error("index out of bound");
         }
         this.data[param1] = param2;
      }
      
      public function replaceValueByKey(param1:String, param2:uint) : void
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
         this.indexToKeyMap = new Vector.<String>();
         this.data.splice(0,this.data.length);
         this.data = new Vector.<uint>();
      }
      
      public function getVector() : Vector.<uint>
      {
         return this.data;
      }
      
      public function clone() : UtilHashUint
      {
         var _loc1_:UtilHashUint = new UtilHashUint();
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
   }
}
