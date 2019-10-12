package anifire.studio.managers
{
   import anifire.studio.models.ActionExplorerCollection;
   import anifire.studio.models.CharacterActionCache;
   import flash.display.BitmapData;
   
   public class ImageDataManager
   {
      
      protected static var _instance:ImageDataManager;
      
      protected static const MAX_CHAR_ACTION_CACHE:int = 20;
       
      
      protected var _imageDataDictionary:Object;
      
      protected var _characterActionCacheDictionary:Object;
      
      protected var _characterActionCacheList:Vector.<CharacterActionCache>;
      
      public function ImageDataManager()
      {
         super();
         this._imageDataDictionary = {};
         this._characterActionCacheDictionary = {};
         this._characterActionCacheList = new Vector.<CharacterActionCache>();
      }
      
      public static function get instance() : ImageDataManager
      {
         if(_instance == null)
         {
            _instance = new ImageDataManager();
         }
         return _instance;
      }
      
      protected function uniqueKey(param1:String, param2:String, param3:String) : String
      {
         return param1 + "_" + param2 + "_" + param3;
      }
      
      public function hasImageData(param1:String, param2:String, param3:String) : Boolean
      {
         var _loc4_:String = this.uniqueKey(param1,param2,param3);
         return this._imageDataDictionary[_loc4_] != null;
      }
      
      public function getImageData(param1:String, param2:String, param3:String) : Object
      {
         var _loc4_:String = this.uniqueKey(param1,param2,param3);
         return this._imageDataDictionary[_loc4_];
      }
      
      public function setImageData(param1:String, param2:String, param3:String, param4:Object) : void
      {
         var _loc5_:String = this.uniqueKey(param1,param2,param3);
         this._imageDataDictionary[_loc5_] = param4;
      }
      
      protected function characterUniqueKey(param1:String, param2:String) : String
      {
         return param1 + ":" + param2;
      }
      
      protected function getCharacterActionCache(param1:String, param2:String) : CharacterActionCache
      {
         var _loc5_:int = 0;
         var _loc6_:CharacterActionCache = null;
         var _loc3_:String = this.characterUniqueKey(param1,param2);
         var _loc4_:CharacterActionCache = this._characterActionCacheDictionary[_loc3_];
         if(_loc4_)
         {
            _loc5_ = this._characterActionCacheList.indexOf(_loc4_);
            if(_loc5_ > 0)
            {
               this._characterActionCacheList.splice(_loc5_,1);
               this._characterActionCacheList.unshift(_loc4_);
            }
         }
         else
         {
            if(this._characterActionCacheList.length >= MAX_CHAR_ACTION_CACHE)
            {
               _loc6_ = this._characterActionCacheList.pop();
               _loc6_.release();
               delete this._characterActionCacheDictionary[_loc6_.uniqueKey];
            }
            _loc4_ = new CharacterActionCache(_loc3_);
            this._characterActionCacheDictionary[_loc3_] = _loc4_;
            this._characterActionCacheList.unshift(_loc4_);
         }
         return _loc4_;
      }
      
      public function setCharacterActionData(param1:String, param2:String, param3:String, param4:BitmapData) : void
      {
         var _loc5_:CharacterActionCache = this.getCharacterActionCache(param1,param2);
         _loc5_.setActionImage(param3,param4);
      }
      
      public function getCharacterActionData(param1:String, param2:String, param3:String) : BitmapData
      {
         var _loc4_:CharacterActionCache = this.getCharacterActionCache(param1,param2);
         return _loc4_.getActionImage(param3);
      }
      
      public function setCharacterActionCollection(param1:String, param2:String, param3:ActionExplorerCollection) : void
      {
         var _loc4_:CharacterActionCache = this.getCharacterActionCache(param1,param2);
         _loc4_.setActionCollection(param3);
      }
      
      public function getCharacterActionCollection(param1:String, param2:String) : ActionExplorerCollection
      {
         var _loc3_:CharacterActionCache = this.getCharacterActionCache(param1,param2);
         return _loc3_.getActionCollection();
      }
   }
}
