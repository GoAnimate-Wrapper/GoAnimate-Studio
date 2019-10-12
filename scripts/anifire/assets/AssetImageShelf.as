package anifire.assets
{
   import anifire.util.UtilErrorLogger;
   import flash.display.DisplayObject;
   
   public class AssetImageShelf
   {
       
      
      private var _index:Number = 0;
      
      private var _images:Array;
      
      public function AssetImageShelf()
      {
         super();
         this._images = new Array();
      }
      
      public function addImage(param1:DisplayObject) : void
      {
         this._images.push(new AssetImageLibraryObject(param1,this._images.length + 1));
      }
      
      public function get length() : Number
      {
         return this._images.length;
      }
      
      public function getImage(param1:Number, param2:String) : AssetImageLibraryObject
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:AssetImageLibraryObject = null;
         if(this._images.length > 0)
         {
            _loc3_ = 0;
            _loc4_ = 0;
            if(param1 > 0 && param1 <= this._images.length)
            {
               _loc5_ = AssetImageLibraryObject(this._images[param1 - 1]);
               if(_loc5_.borrowerId != param2)
               {
                  _loc5_.borrowerId = param2;
                  return _loc5_;
               }
            }
            _loc4_ = 0;
            while(_loc4_ < this._images.length)
            {
               _loc3_ = this._index + _loc4_;
               if(_loc3_ >= this._images.length)
               {
                  _loc3_ = _loc3_ - this._images.length;
               }
               _loc5_ = AssetImageLibraryObject(this._images[_loc3_]);
               if(_loc5_.borrowerId != param2)
               {
                  this._index = _loc3_ + 1;
                  _loc5_.borrowerId = param2;
                  return _loc5_;
               }
               _loc4_++;
            }
         }
         UtilErrorLogger.getInstance().error("no image found on shelf: " + param1);
         throw new Error("Error, no image found on shelf: " + param1);
      }
   }
}
