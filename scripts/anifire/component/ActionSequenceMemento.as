package anifire.component
{
   import anifire.util.UtilHashArray;
   
   public class ActionSequenceMemento
   {
       
      
      private var _vars:Array;
      
      public function ActionSequenceMemento(param1:Array, param2:UtilHashArray, param3:UtilHashArray, param4:Array, param5:Array)
      {
         super();
         this._vars = new Array();
         this._vars.push(param1 == null?null:param1.concat());
         this._vars.push(param2 == null?null:param2.clone());
         this._vars.push(param3 == null?null:param3.clone());
         this._vars.push(param4 == null?null:param4.concat());
         this._vars.push(param5 == null?null:param5.concat());
      }
      
      public function get vars() : Array
      {
         return this._vars;
      }
   }
}
