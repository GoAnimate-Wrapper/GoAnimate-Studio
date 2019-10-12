package anifire.studio.models
{
   import anifire.studio.core.Theme;
   import anifire.studio.core.Thumb;
   import anifire.studio.managers.SearchManager;
   import anifire.studio.managers.ThemeManager;
   import anifire.util.UtilDict;
   import mx.events.PropertyChangeEvent;
   import mx.utils.StringUtil;
   
   public class SearchCollection extends ProductCollection
   {
      
      public static const SEARCH_TERM_PATTERH:RegExp = /\s+/;
       
      
      protected var _searchPattern:RegExp;
      
      protected var _resultBySuggestion:Object;
      
      protected var _keyword:String;
      
      protected var _themeId:String;
      
      public function SearchCollection(param1:String, param2:Array = null)
      {
         super(param1,param2);
         sortOrder = -1;
         this.reset();
      }
      
      [Bindable(event="propertyChange")]
      public function get keyword() : String
      {
         return this._keyword;
      }
      
      private function set _814408215keyword(param1:String) : void
      {
         if(this._keyword != param1)
         {
            this._keyword = param1;
         }
      }
      
      public function search(param1:String) : void
      {
         this.keyword = param1;
         this._searchPattern = new RegExp(param1,"i");
         filterFunction = this.searchFilter;
         refresh();
         this.completeSearch();
      }
      
      public function searchBySuggestion(param1:String, param2:String, param3:String = null) : void
      {
         var _loc4_:Vector.<Theme> = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         this.keyword = param1;
         this._resultBySuggestion = {};
         if(param3)
         {
            this.searchThemeBySuggestion(param1,param2,param3);
         }
         else
         {
            _loc4_ = ThemeManager.instance.themes;
            _loc5_ = _loc4_.length;
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               this.searchThemeBySuggestion(param1,param2,_loc4_[_loc6_].id);
               _loc6_++;
            }
         }
         filterFunction = this.searchFilterBySuggestion;
         refresh();
         this.completeSearch();
      }
      
      private function searchThemeBySuggestion(param1:String, param2:String, param3:String) : void
      {
         var _loc9_:* = null;
         var _loc4_:Array = param1.split(SEARCH_TERM_PATTERH);
         var _loc5_:int = _loc4_.length;
         var _loc6_:SearchManager = SearchManager.instance;
         var _loc7_:Object = {};
         var _loc8_:Object = {};
         var _loc10_:int = 0;
         while(_loc10_ < _loc5_)
         {
            _loc7_ = _loc6_.getAssetByTerm(param3,param2,_loc4_[_loc10_]);
            if(_loc10_ == 0)
            {
               for(_loc9_ in _loc7_)
               {
                  _loc8_[_loc9_] = _loc7_[_loc9_];
               }
            }
            else
            {
               for(_loc9_ in _loc8_)
               {
                  if(!_loc7_[_loc9_])
                  {
                     _loc8_[_loc9_] = false;
                  }
               }
            }
            _loc10_++;
         }
         for(_loc9_ in _loc8_)
         {
            this._resultBySuggestion[_loc9_] = _loc7_[_loc9_];
         }
      }
      
      protected function searchFilterBySuggestion(param1:Object) : Boolean
      {
         var _loc3_:Boolean = false;
         if(!this._resultBySuggestion)
         {
            return false;
         }
         var _loc2_:ThumbModel = param1 as ThumbModel;
         if(_loc2_ && _loc2_.thumb)
         {
            _loc3_ = this._resultBySuggestion[_loc2_.thumb.searchKey];
            if(_loc3_)
            {
               return this.postSuggestionFilter(_loc2_);
            }
            return _loc3_;
         }
         return false;
      }
      
      protected function postSuggestionFilter(param1:ThumbModel) : Boolean
      {
         return true;
      }
      
      protected function searchFilter(param1:Object) : Boolean
      {
         var _loc3_:Thumb = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:String = null;
         var _loc7_:int = 0;
         var _loc2_:ThumbModel = param1 as ThumbModel;
         if(_loc2_)
         {
            _loc3_ = _loc2_.thumb;
            if(this._searchPattern.exec(_loc2_.name))
            {
               return true;
            }
            if(_loc3_)
            {
               _loc4_ = _loc3_.sysTags;
               _loc5_ = 0;
               while(_loc5_ < _loc4_.length)
               {
                  _loc6_ = _loc4_[_loc5_];
                  _loc7_ = _loc6_.indexOf("cat:");
                  if(_loc7_ != -1)
                  {
                     _loc6_ = _loc6_.substr(_loc7_ + 1);
                  }
                  if(this._searchPattern.exec(_loc6_))
                  {
                     return true;
                  }
                  _loc5_++;
               }
            }
         }
         return false;
      }
      
      protected function completeSearch() : void
      {
         label = StringUtil.substitute(UtilDict.translate("{0} results for \"{1}\""),length,this.keyword);
         valid = true;
      }
      
      public function reset() : void
      {
         this.keyword = "";
         label = categoryName;
         valid = false;
      }
      
      override public function addProductIfAppropriate(param1:ThumbModel, param2:Boolean = true) : Boolean
      {
         return false;
      }
      
      override public function get isProperCollection() : Boolean
      {
         return false;
      }
      
      override public function get isMeta() : Boolean
      {
         return true;
      }
      
      public function set keyword(param1:String) : void
      {
         var _loc2_:Object = this.keyword;
         if(_loc2_ !== param1)
         {
            this._814408215keyword = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"keyword",_loc2_,param1));
            }
         }
      }
   }
}
