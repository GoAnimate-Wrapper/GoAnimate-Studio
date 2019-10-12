package anifire.assets
{
   import flash.display.DisplayObject;
   
   public class AssetImageLibraryObject
   {
       
      
      private var _image:DisplayObject;
      
      private var _borrowerId:String;
      
      private var _imageId:Number;
      
      public function AssetImageLibraryObject(param1:DisplayObject, param2:Number)
      {
         super();
         this._image = param1;
         this._imageId = param2;
      }
      
      public function get imageId() : Number
      {
         return this._imageId;
      }
      
      public function get borrowerId() : String
      {
         return this._borrowerId;
      }
      
      public function set borrowerId(param1:String) : void
      {
         this._borrowerId = param1;
      }
      
      public function get image() : DisplayObject
      {
         return this._image;
      }
   }
}
