package anifire.studio.models
{
   import flash.display.BitmapData;
   
   public class CharacterActionCache
   {
       
      
      protected var _uniqueKey:String;
      
      protected var actionImageDictionary:Object;
      
      protected var _actionCollection:ActionExplorerCollection;
      
      public function CharacterActionCache(param1:String)
      {
         super();
         this._uniqueKey = param1;
         this.actionImageDictionary = {};
      }
      
      public function get uniqueKey() : String
      {
         return this._uniqueKey;
      }
      
      public function release() : void
      {
         var _loc1_:* = null;
         var _loc2_:BitmapData = null;
         for(_loc1_ in this.actionImageDictionary)
         {
            _loc2_ = this.actionImageDictionary[_loc1_] as BitmapData;
            _loc2_.dispose();
            _loc2_ = null;
         }
         this.actionImageDictionary = {};
         this._actionCollection = null;
      }
      
      public function setActionImage(param1:String, param2:BitmapData) : void
      {
         this.actionImageDictionary[param1] = param2;
      }
      
      public function getActionImage(param1:String) : BitmapData
      {
         return this.actionImageDictionary[param1];
      }
      
      public function getActionCollection() : ActionExplorerCollection
      {
         return this._actionCollection;
      }
      
      public function setActionCollection(param1:ActionExplorerCollection) : void
      {
         this._actionCollection = param1;
      }
   }
}
