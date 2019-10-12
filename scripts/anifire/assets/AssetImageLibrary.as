package anifire.assets
{
   import anifire.util.UtilErrorLogger;
   import anifire.util.UtilHashArray;
   import flash.display.DisplayObject;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   
   public class AssetImageLibrary extends EventDispatcher
   {
      
      private static var _instance:AssetImageLibrary;
       
      
      private var _imageShelfArray:UtilHashArray;
      
      private var _requesters:UtilHashArray;
      
      private var enabled:Boolean = true;
      
      private var _timeStamp:String = "";
      
      public function AssetImageLibrary(param1:IEventDispatcher = null)
      {
         super(param1);
         this._imageShelfArray = new UtilHashArray();
         this._requesters = new UtilHashArray();
      }
      
      public static function get instance() : AssetImageLibrary
      {
         if(!_instance)
         {
            _instance = new AssetImageLibrary();
         }
         return _instance;
      }
      
      public function updateTimeStamp() : void
      {
         var _loc1_:Date = new Date();
         this._timeStamp = _loc1_.time.toString();
      }
      
      public function requestImage(param1:String, param2:String, param3:DisplayObject) : Number
      {
         var _loc4_:UtilHashArray = null;
         var _loc5_:Number = NaN;
         var _loc6_:AssetImageShelf = null;
         if(!this.enabled)
         {
            return 0;
         }
         if(param1 && param2 && param3)
         {
            _loc4_ = this._requesters.getValueByKey(param2);
            if(_loc4_ == null)
            {
               _loc4_ = new UtilHashArray();
               this._requesters.push(param2,_loc4_);
            }
            _loc5_ = _loc4_.getValueByKey(param1);
            _loc5_++;
            _loc4_.push(param1,_loc5_);
            _loc6_ = this._imageShelfArray.getValueByKey(param1);
            if(_loc6_ == null)
            {
               _loc6_ = new AssetImageShelf();
               this._imageShelfArray.push(param1,_loc6_);
            }
            if(_loc6_.length < _loc5_)
            {
               _loc6_.addImage(param3);
               return -_loc5_;
            }
            return _loc5_;
         }
         throw new Error("Error, fail to request image: " + param1);
      }
      
      public function borrowImage(param1:String, param2:Number, param3:String) : AssetImageLibraryObject
      {
         if(!this.enabled)
         {
            return null;
         }
         param3 = param3 + this._timeStamp;
         var _loc4_:AssetImageShelf = this._imageShelfArray.getValueByKey(param1);
         if(_loc4_)
         {
            return _loc4_.getImage(param2,param3);
         }
         UtilErrorLogger.getInstance().error("no image shelf found on library: " + param1);
         throw new Error("Error, no image shelf found on library: " + param1);
      }
   }
}
