package anifire.models
{
   public class ApiEventModel
   {
       
      
      public var eventName:String;
      
      public var callback:String;
      
      public function ApiEventModel(param1:String, param2:String)
      {
         super();
         this.eventName = param1;
         this.callback = param2;
      }
   }
}
