package anifire.studio.models
{
   import anifire.studio.core.Theme;
   import anifire.studio.managers.PreferenceManager;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import mx.events.PropertyChangeEvent;
   
   public class ThumbCategory implements IEventDispatcher
   {
      
      public static const XML_NODE_NAME:String = "category";
      
      public static const DEFAULT_CATEGORY_FOR_TUTORIAL:String = "office";
      
      public static const DEFAULT_CATEGORY_FOR_INFOGRAPHICS_TUTORIAL:String = "text";
       
      
      private var _606819266isFavorited:Boolean;
      
      private var _1083929736isFeatured:Boolean;
      
      private var _categoryType:String;
      
      private var _themeCode:String;
      
      private var _key:String;
      
      private var _displayName:String;
      
      private var _iconUrl:String;
      
      private var _description:String;
      
      private var _sortOrder:int;
      
      private var _theme:Theme;
      
      private var _bindingEventDispatcher:EventDispatcher;
      
      public function ThumbCategory()
      {
         this._bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
         super();
      }
      
      public function get categoryType() : String
      {
         return this._categoryType;
      }
      
      public function get themeCode() : String
      {
         return this._themeCode;
      }
      
      public function get key() : String
      {
         return this._key;
      }
      
      public function get sortOrder() : int
      {
         return this._sortOrder;
      }
      
      public function set sortOrder(param1:int) : void
      {
         this._sortOrder = param1;
      }
      
      public function get description() : String
      {
         return this._description;
      }
      
      public function set description(param1:String) : void
      {
         this._description = param1;
      }
      
      public function get iconUrl() : String
      {
         return this._iconUrl;
      }
      
      public function set iconUrl(param1:String) : void
      {
         this._iconUrl = param1;
      }
      
      public function get displayName() : String
      {
         return this._displayName;
      }
      
      public function set displayName(param1:String) : void
      {
         this._displayName = param1;
      }
      
      public function deserialize(param1:XML, param2:Theme) : void
      {
         var _loc6_:int = 0;
         if(!param1)
         {
            return;
         }
         this._key = param1.@key;
         this._displayName = param1.display_name.toString();
         this._description = param1.description.toString();
         this._iconUrl = param1.@thumbnail;
         this._categoryType = param1.@type;
         this._themeCode = param1.@theme;
         this._theme = param2;
         var _loc3_:PreferenceManager = PreferenceManager.instance;
         var _loc4_:Array = _loc3_.getFavoriteCategories(this._categoryType,this._themeCode);
         var _loc5_:Array = _loc3_.getFeaturedCategories(this._categoryType,this._themeCode);
         if(_loc4_)
         {
            _loc6_ = _loc4_.indexOf(this._key);
            if(_loc6_ != -1)
            {
               this.isFavorited = true;
               this._sortOrder = _loc6_;
            }
         }
         if(_loc5_ && _loc5_.indexOf(this._key) != -1)
         {
            this.isFeatured = true;
         }
      }
      
      public function setFavorite(param1:Boolean) : void
      {
         this.isFavorited = param1;
         if(this.isFavorited)
         {
            this._theme.thumbCategoryManager.addFavorite(this._categoryType,this._key);
         }
         else
         {
            this.isFeatured = false;
            this._theme.thumbCategoryManager.removeFavorite(this._categoryType,this._key);
         }
      }
      
      public function setFeatured(param1:Boolean) : void
      {
         this.isFeatured = param1;
         if(!this.isFeatured)
         {
            this._theme.thumbCategoryManager.removeFeatured(this._categoryType,this._key);
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get isFavorited() : Boolean
      {
         return this._606819266isFavorited;
      }
      
      public function set isFavorited(param1:Boolean) : void
      {
         var _loc2_:Object = this._606819266isFavorited;
         if(_loc2_ !== param1)
         {
            this._606819266isFavorited = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"isFavorited",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get isFeatured() : Boolean
      {
         return this._1083929736isFeatured;
      }
      
      public function set isFeatured(param1:Boolean) : void
      {
         var _loc2_:Object = this._1083929736isFeatured;
         if(_loc2_ !== param1)
         {
            this._1083929736isFeatured = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"isFeatured",_loc2_,param1));
            }
         }
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         this._bindingEventDispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return this._bindingEventDispatcher.dispatchEvent(param1);
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.hasEventListener(param1);
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         this._bindingEventDispatcher.removeEventListener(param1,param2,param3);
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.willTrigger(param1);
      }
   }
}
