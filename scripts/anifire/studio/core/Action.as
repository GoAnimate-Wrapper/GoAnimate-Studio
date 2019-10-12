package anifire.studio.core
{
   public class Action extends Behavior
   {
      
      public static const XML_NODE_NAME:String = "action";
       
      
      private var _propXML:Vector.<XML>;
      
      private var _defaultActionId:String;
      
      private var _isMotion:Boolean = false;
      
      private var _nextActionId:String;
      
      public function Action(param1:CharThumb, param2:String, param3:String, param4:int, param5:String, param6:String, param7:Vector.<XML> = null)
      {
         if(!param7)
         {
            param7 = new Vector.<XML>();
         }
         this.propXML = param7;
         super(param1,param2,param3,param4,param5,param6);
      }
      
      public function get nextActionId() : String
      {
         return this._nextActionId;
      }
      
      public function set nextActionId(param1:String) : void
      {
         this._nextActionId = param1;
      }
      
      public function get isMotion() : Boolean
      {
         return this._isMotion;
      }
      
      public function set isMotion(param1:Boolean) : void
      {
         this._isMotion = param1;
      }
      
      public function get defaultActionId() : String
      {
         return this._defaultActionId;
      }
      
      public function set defaultActionId(param1:String) : void
      {
         this._defaultActionId = param1;
      }
      
      public function get propXML() : Vector.<XML>
      {
         return this._propXML;
      }
      
      public function set propXML(param1:Vector.<XML>) : void
      {
         this._propXML = param1;
      }
   }
}
