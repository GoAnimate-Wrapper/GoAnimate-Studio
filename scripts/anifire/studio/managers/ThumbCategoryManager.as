package anifire.studio.managers
{
   import anifire.constant.ProductConstants;
   import anifire.constant.ResponseConstants;
   import anifire.constant.ServerConstants;
   import anifire.event.ServerRequestEvent;
   import anifire.managers.AmplitudeAnalyticsManager;
   import anifire.managers.AppConfigManager;
   import anifire.studio.models.ThumbCategory;
   import anifire.util.ApiRequest;
   import anifire.util.Util;
   import flash.events.Event;
   
   public class ThumbCategoryManager
   {
       
      
      private var _themeId:String;
      
      private var _thumbCategoryLookup:Object;
      
      private var _configManager:AppConfigManager;
      
      public var featuredCategoryKeys:Array;
      
      public function ThumbCategoryManager(param1:String)
      {
         this._configManager = AppConfigManager.instance;
         super();
         this.init(param1);
      }
      
      private function init(param1:String) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         this._thumbCategoryLookup = {};
         this._themeId = param1;
         var _loc2_:String = this._configManager.getValue("tray");
         var _loc3_:String = this._configManager.getValue("featured_categories");
         if(_loc3_ && _loc2_ == this._themeId)
         {
            this.featuredCategoryKeys = _loc3_.split(",");
            _loc4_ = this.featuredCategoryKeys.length;
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               PreferenceManager.instance.addFeatured(ProductConstants.PRODUCT_TYPE_TEMPLATE,ThemeManager.instance.currentTheme.id,this.featuredCategoryKeys[_loc5_]);
               _loc5_++;
            }
         }
      }
      
      public function hasFeatureCategory() : Boolean
      {
         return this.featuredCategoryKeys.length > 0;
      }
      
      public function getFirstFeatureCategoryKey() : String
      {
         if(this.featuredCategoryKeys)
         {
            return this.featuredCategoryKeys[0];
         }
         return null;
      }
      
      public function addCategory(param1:String, param2:ThumbCategory) : void
      {
         if(!this._thumbCategoryLookup[param1])
         {
            this._thumbCategoryLookup[param1] = {};
         }
         this._thumbCategoryLookup[param1][param2.key] = param2;
         param2.sortOrder = Util.numPropertiesOfObject(this._thumbCategoryLookup[param1] as Object);
         if(this.featuredCategoryKeys && this.featuredCategoryKeys.indexOf(param2.key) != -1)
         {
            param2.isFeatured = true;
            param2.isFavorited = true;
            this.addFeatured(param1,param2.key);
         }
      }
      
      public function getCategory(param1:String, param2:String) : ThumbCategory
      {
         return this._thumbCategoryLookup[param1][param2];
      }
      
      public function updateCategoryOrdering(param1:Array, param2:String) : void
      {
         if(!param2 || !param1)
         {
            return;
         }
         var _loc3_:Object = {};
         _loc3_[ResponseConstants.THUMB_CATEGORY_TYPE] = param2;
         _loc3_[ResponseConstants.THEME_CODE] = this._themeId;
         _loc3_[ResponseConstants.THUMB_ORDER] = param1;
         var _loc4_:ApiRequest = new ApiRequest();
         _loc4_.addEventListener(ServerRequestEvent.COMPLETE,this.updateCategoryOrder_completeHandler);
         _loc4_.post(ServerConstants.ACTION_CATEGORY_UPDATE_FAVORITE_ORDER,_loc3_);
      }
      
      private function updateCategoryOrder_completeHandler(param1:ServerRequestEvent = null) : void
      {
      }
      
      private function isNotEmpty(param1:*, param2:int, param3:Array) : Boolean
      {
         return param1 != null;
      }
      
      public function addFavorite(param1:String, param2:String) : void
      {
         PreferenceManager.instance.addFavorite(param1,this._themeId,param2);
         var _loc3_:Object = {
            "category":param2,
            "action":AmplitudeAnalyticsManager.EVENT_PROPERTIES_FAVORITE,
            "theme":this._themeId
         };
         var _loc4_:Array = PreferenceManager.instance.getFavoriteCategories("template","business");
         var _loc5_:Array = PreferenceManager.instance.getFavoriteCategories("template","whiteboard");
         var _loc6_:Object = {
            "BF_favorited_category":(!!_loc4_?_loc4_.join(","):""),
            "WF_favorited_category":(!!_loc5_?_loc5_.join(","):"")
         };
         AmplitudeAnalyticsManager.instance.log(AmplitudeAnalyticsManager.EVENT_NAME_FAVORITED_TEMPLATE_CATEGORY,_loc3_,_loc6_);
         var _loc7_:Object = {};
         _loc7_[ResponseConstants.THUMB_CATEGORY_TYPE] = param1;
         _loc7_[ResponseConstants.THEME_CODE] = this._themeId;
         _loc7_[ResponseConstants.THUMB_CATEGORY_KEY] = param2;
         var _loc8_:ApiRequest = new ApiRequest();
         _loc8_.addEventListener(ServerRequestEvent.COMPLETE,this.update_completeHandler);
         _loc8_.post(ServerConstants.ACTION_CATEGORY_ADD_FAVORITE,_loc7_);
      }
      
      public function addFeatured(param1:String, param2:String) : void
      {
         var _loc3_:Object = {};
         _loc3_[ResponseConstants.THUMB_CATEGORY_TYPE] = param1;
         _loc3_[ResponseConstants.THEME_CODE] = this._themeId;
         _loc3_[ResponseConstants.THUMB_CATEGORY_KEY] = param2;
         var _loc4_:ApiRequest = new ApiRequest();
         _loc4_.addEventListener(ServerRequestEvent.COMPLETE,this.update_completeHandler);
         _loc4_.post(ServerConstants.ACTION_CATEGORY_ADD_FEATURED,_loc3_);
      }
      
      private function update_completeHandler(param1:Event = null) : void
      {
      }
      
      public function removeFavorite(param1:String, param2:String) : void
      {
         PreferenceManager.instance.removeFavorite(param1,this._themeId,param2);
         var _loc3_:Object = {
            "category":param2,
            "action":AmplitudeAnalyticsManager.EVENT_PROPERTIES_UNFAVORITE,
            "theme":this._themeId
         };
         var _loc4_:Array = PreferenceManager.instance.getFavoriteCategories("template","business");
         var _loc5_:Array = PreferenceManager.instance.getFavoriteCategories("template","whiteboard");
         var _loc6_:Object = {
            "BF_favorited_category":(!!_loc4_?_loc4_.join(","):""),
            "WF_favorited_category":(!!_loc5_?_loc5_.join(","):"")
         };
         AmplitudeAnalyticsManager.instance.log(AmplitudeAnalyticsManager.EVENT_NAME_FAVORITED_TEMPLATE_CATEGORY,_loc3_,_loc6_);
         var _loc7_:Object = {};
         _loc7_[ResponseConstants.THUMB_CATEGORY_TYPE] = param1;
         _loc7_[ResponseConstants.THEME_CODE] = this._themeId;
         _loc7_[ResponseConstants.THUMB_CATEGORY_KEY] = param2;
         var _loc8_:ApiRequest = new ApiRequest();
         _loc8_.addEventListener(ServerRequestEvent.COMPLETE,this.update_completeHandler);
         _loc8_.post(ServerConstants.ACTION_CATEGORY_REMOVE_FAVORITE,_loc7_);
      }
      
      public function removeFeatured(param1:String, param2:String) : void
      {
         var _loc3_:Object = {};
         _loc3_[ResponseConstants.THUMB_CATEGORY_TYPE] = param1;
         _loc3_[ResponseConstants.THEME_CODE] = this._themeId;
         _loc3_[ResponseConstants.THUMB_CATEGORY_KEY] = param2;
         var _loc4_:ApiRequest = new ApiRequest();
         _loc4_.addEventListener(ServerRequestEvent.COMPLETE,this.update_completeHandler);
         _loc4_.post(ServerConstants.ACTION_CATEGORY_REMOVE_FEATURED,_loc3_);
      }
   }
}
