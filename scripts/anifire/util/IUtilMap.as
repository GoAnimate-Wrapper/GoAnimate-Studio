package anifire.util
{
   public interface IUtilMap
   {
       
      
      function put(param1:String, param2:*) : void;
      
      function remove(param1:String) : void;
      
      function containsKey(param1:String) : Boolean;
      
      function containsValue(param1:*) : Boolean;
      
      function getKey(param1:*) : String;
      
      function getValue(param1:String) : *;
      
      function size() : int;
      
      function isEmpty() : Boolean;
      
      function clear() : void;
   }
}
