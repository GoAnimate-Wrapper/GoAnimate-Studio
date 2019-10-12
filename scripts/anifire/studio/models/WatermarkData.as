package anifire.studio.models
{
   public class WatermarkData
   {
       
      
      private var _id:String = "";
      
      private var _url:String = "";
      
      public function WatermarkData()
      {
         super();
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function set id(param1:String) : void
      {
         this._id = param1;
      }
      
      public function get url() : String
      {
         return this._url;
      }
      
      public function set url(param1:String) : void
      {
         this._url = param1;
      }
   }
}
