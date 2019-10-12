package anifire.studio.managers
{
   import anifire.constant.ThemeConstants;
   import flash.events.EventDispatcher;
   import flash.external.ExternalInterface;
   
   public class SearchManager extends EventDispatcher
   {
      
      public static const SANITIZE_PATTERN:RegExp = /\\/g;
      
      private static var __instance:SearchManager;
       
      
      private var _tagLookup:Object;
      
      private var _cacheResult:Object;
      
      public function SearchManager()
      {
         super();
         this.init();
      }
      
      public static function get instance() : SearchManager
      {
         if(!__instance)
         {
            __instance = new SearchManager();
         }
         return __instance;
      }
      
      private function init() : void
      {
         this._tagLookup = {};
         this._cacheResult = {};
      }
      
      protected function sanitizeInput(param1:String) : String
      {
         var _loc2_:String = null;
         if(param1 != null)
         {
            _loc2_ = param1.replace(SANITIZE_PATTERN,"");
         }
         else
         {
            _loc2_ = "";
         }
         return _loc2_.toLowerCase();
      }
      
      public function getSuggestions(param1:String) : Array
      {
         var _loc2_:Array = null;
         if(ExternalInterface.available)
         {
            _loc2_ = ExternalInterface.call("SearchSuggestion.suggest",this.sanitizeInput(param1));
         }
         return _loc2_;
      }
      
      public function getControlTerms(param1:String) : Array
      {
         var _loc2_:Array = null;
         if(ExternalInterface.available)
         {
            _loc2_ = ExternalInterface.call("SearchSuggestion.getControlTerms",this.sanitizeInput(param1));
         }
         return _loc2_;
      }
      
      public function processAssetTags(param1:Object) : void
      {
         var _loc2_:* = null;
         var _loc3_:Object = null;
         var _loc4_:* = null;
         var _loc5_:Object = null;
         var _loc6_:* = null;
         var _loc7_:Array = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         for(_loc2_ in param1)
         {
            _loc3_ = param1[_loc2_];
            for(_loc4_ in _loc3_)
            {
               _loc5_ = _loc3_[_loc4_];
               for(_loc6_ in _loc5_)
               {
                  _loc7_ = _loc5_[_loc6_];
                  _loc8_ = _loc7_.length;
                  _loc9_ = 0;
                  while(_loc9_ < _loc8_)
                  {
                     this.addAssetTag(_loc2_,_loc4_,_loc6_,_loc7_[_loc9_]);
                     _loc9_++;
                  }
               }
            }
         }
      }
      
      public function addAssetTag(param1:String, param2:String, param3:String, param4:String) : void
      {
         if(param3 == null || param3 == "")
         {
            return;
         }
         param3 = param3.toLowerCase();
         if(!this._tagLookup[param1])
         {
            this._tagLookup[param1] = {};
         }
         var _loc5_:Object = this._tagLookup[param1];
         if(!_loc5_[param2])
         {
            _loc5_[param2] = {};
         }
         var _loc6_:Object = _loc5_[param2];
         if(!_loc6_[param3])
         {
            _loc6_[param3] = [];
         }
         var _loc7_:Array = _loc6_[param3];
         _loc7_.push(param4);
      }
      
      public function getAssetByTerm(param1:String, param2:String, param3:String) : Object
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:String = null;
         var _loc11_:Array = null;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         param3 = param3.toLowerCase();
         var _loc4_:Object = {};
         var _loc5_:Array = this.getControlTerms(param3);
         if(this._cacheResult[param1] && this._cacheResult[param1][param2] && this._cacheResult[param1][param2][param3])
         {
            return this._cacheResult[param1][param2][param3];
         }
         var _loc6_:Object = this._tagLookup[param1];
         if(!_loc6_)
         {
            return _loc4_;
         }
         var _loc7_:Object = _loc6_[param2];
         if(!_loc7_)
         {
            _loc6_ = this._tagLookup[ThemeConstants.COMMON_THEME_ID];
            _loc7_ = _loc6_[param2];
            if(!_loc7_)
            {
               return _loc6_;
            }
         }
         if(_loc5_)
         {
            _loc8_ = _loc5_.length;
            AnalyticsManager.instance.trackSearchControlTerm(param3,_loc5_.length > 0);
            _loc9_ = 0;
            while(_loc9_ < _loc8_)
            {
               _loc10_ = _loc5_[_loc9_];
               _loc10_ = _loc10_.toLowerCase();
               _loc11_ = _loc7_[_loc10_];
               if(_loc11_)
               {
                  _loc12_ = _loc11_.length;
                  _loc13_ = 0;
                  while(_loc13_ < _loc12_)
                  {
                     _loc4_[_loc11_[_loc13_]] = true;
                     _loc13_++;
                  }
               }
               _loc9_++;
            }
         }
         if(!this._cacheResult[param1])
         {
            this._cacheResult[param1] = {};
         }
         if(!this._cacheResult[param1][param2])
         {
            this._cacheResult[param1][param2] = {};
         }
         this._cacheResult[param1][param2][param3] = _loc4_;
         return _loc4_;
      }
      
      public function hasResult(param1:String, param2:String, param3:*) : Boolean
      {
         var _loc5_:* = null;
         var _loc4_:Object = this.getAssetByTerm(param1,param2,param3);
         for(_loc5_ in _loc4_)
         {
            return true;
         }
         return false;
      }
   }
}
