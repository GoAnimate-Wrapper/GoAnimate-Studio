package anifire.errors
{
   public class SerializeError extends Error
   {
      
      public static const ERROR_NODE_NAME:String = "serializeError";
      
      public static const MESSAGE_NODE_NAME:String = "message";
       
      
      private var _xmlStr:String;
      
      private var _error:Error;
      
      public function SerializeError(param1:* = "", param2:String = "", param3:Error = null, param4:* = 0)
      {
         super(param1,param4);
         this._xmlStr = param2;
         this._error = param3;
      }
      
      public static function createErrorNode(param1:String) : XML
      {
         return new XML("<" + SerializeError.ERROR_NODE_NAME + ">\n                        " + ("<" + SerializeError.MESSAGE_NODE_NAME + ">" + ({param1}) + "</" + SerializeError.MESSAGE_NODE_NAME + ">") + "\n                    </" + SerializeError.ERROR_NODE_NAME + ">");
      }
      
      public function toCustomString() : String
      {
         if(this._error is SerializeError)
         {
            return this.message + " " + this._xmlStr + " " + "\n\tas " + SerializeError(this._error).toCustomString();
         }
         return this.message + " " + this._xmlStr + " " + "\n\tas " + this._error.message;
      }
   }
}
