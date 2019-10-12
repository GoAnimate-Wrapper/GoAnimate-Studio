package anifire.studio.managers
{
   import anifire.constant.ThemeConstants;
   import anifire.event.CoreEvent;
   import anifire.event.LoadMgrEvent;
   import anifire.studio.components.ThumbTray;
   import anifire.studio.core.BackgroundThumb;
   import anifire.studio.core.Console;
   import anifire.studio.core.PropThumb;
   import anifire.studio.core.Theme;
   import anifire.util.UtilErrorLogger;
   import anifire.util.UtilLoadMgr;
   import anifire.util.UtilSite;
   import flash.events.EventDispatcher;
   
   public class ThemeManager extends EventDispatcher
   {
      
      public static const COMMON_THEME_ID:String = "common";
      
      public static const WIDGET_THEME_ID:String = "bizwidget";
      
      public static const UGC_THEME_ID:String = "ugc";
      
      private static var _instance:ThemeManager;
       
      
      private var _themes:Object;
      
      private var _currentTheme:Theme;
      
      private var _communityTheme:Theme;
      
      private var _movieTheme:Theme;
      
      public var ccTheme:Theme;
      
      public var themeList:Array;
      
      public function ThemeManager()
      {
         super();
         this._themes = {};
         var _loc1_:Theme = new Theme();
         _loc1_.id = "ugc";
         this._themes["ugc"] = _loc1_;
         this._communityTheme = new Theme();
         this._communityTheme.id = "ugc";
         this.ccTheme = new Theme();
         this.ccTheme.id = "ugc";
         this._movieTheme = new Theme();
         this._movieTheme.id = ThumbTray.MOVIE_THEME;
      }
      
      public static function get instance() : ThemeManager
      {
         if(!_instance)
         {
            _instance = new ThemeManager();
         }
         return _instance;
      }
      
      public function addTheme(param1:String, param2:Theme) : void
      {
         var _loc3_:Theme = this.getTheme(param1);
         if(_loc3_)
         {
            _loc3_.mergeTheme(param2);
         }
         else
         {
            this._themes[param1] = param2;
         }
      }
      
      public function getTheme(param1:String) : Theme
      {
         return this._themes[param1];
      }
      
      public function get themes() : Vector.<Theme>
      {
         var _loc2_:* = null;
         var _loc1_:Vector.<Theme> = new Vector.<Theme>();
         for(_loc2_ in this._themes)
         {
            _loc1_.push(this._themes[_loc2_]);
         }
         return _loc1_;
      }
      
      public function get currentTheme() : Theme
      {
         return this._currentTheme;
      }
      
      public function set currentTheme(param1:Theme) : void
      {
         this._currentTheme = param1;
      }
      
      public function get userTheme() : Theme
      {
         return this._themes["ugc"];
      }
      
      public function get communityTheme() : Theme
      {
         return this._communityTheme;
      }
      
      public function get movieTheme() : Theme
      {
         return this._movieTheme;
      }
      
      public function get commonTheme() : Theme
      {
         return this._themes[COMMON_THEME_ID];
      }
      
      public function loadAllThemes() : void
      {
         var _loc3_:Object = null;
         var _loc4_:String = null;
         var _loc5_:Boolean = false;
         var _loc6_:Theme = null;
         var _loc1_:UtilLoadMgr = new UtilLoadMgr();
         var _loc2_:int = 0;
         while(_loc2_ < this.themeList.length)
         {
            _loc3_ = this.themeList[_loc2_];
            _loc4_ = _loc3_["id"];
            _loc6_ = this.getTheme(_loc4_);
            if(!_loc6_)
            {
               _loc6_ = new Theme();
               _loc6_.id = _loc4_;
               _loc5_ = true;
               this.addTheme(_loc4_,_loc6_);
               _loc1_.addEventDispatcher(_loc6_,CoreEvent.LOAD_THEME_COMPLETE);
               _loc6_.initThemeByLoadThemeFile(_loc4_);
            }
            _loc2_++;
         }
         _loc1_.addEventListener(LoadMgrEvent.ALL_COMPLETE,this.onLoadAllThemeComplete);
         _loc1_.commit();
      }
      
      private function onLoadAllThemeComplete(param1:LoadMgrEvent) : void
      {
         dispatchEvent(new CoreEvent(CoreEvent.LOAD_ALL_THEME_COMPLETE,this));
      }
      
      public function loadTheme(param1:String, param2:Boolean = true, param3:Boolean = true) : void
      {
         var _loc4_:Boolean = false;
         var _loc5_:Theme = null;
         UtilErrorLogger.getInstance().info("Load Theme: " + param1);
         _loc5_ = this.getTheme(param1);
         if(!_loc5_)
         {
            _loc5_ = new Theme();
            _loc5_.id = param1;
            _loc4_ = true;
            this.addTheme(param1,_loc5_);
         }
         if(param3)
         {
            this.currentTheme = _loc5_;
         }
         if(_loc4_ || param2)
         {
            _loc5_.addEventListener(CoreEvent.LOAD_THEME_COMPLETE,this.onLoadThemeComplete);
            _loc5_.initThemeByLoadThemeFile(param1);
         }
         else
         {
            this.dispatchThemeReady();
         }
      }
      
      private function onLoadThemeComplete(param1:CoreEvent) : void
      {
         var _loc2_:Theme = param1.getEventCreater() as Theme;
         _loc2_.removeEventListener(CoreEvent.LOAD_THEME_COMPLETE,this.onLoadThemeComplete);
         UtilErrorLogger.getInstance().info("Theme Loaded: " + _loc2_.id);
         if(this.commonTheme)
         {
            this.dispatchThemeReady();
         }
         else
         {
            this.loadCommonTheme();
         }
      }
      
      public function loadCommonTheme() : void
      {
         UtilErrorLogger.getInstance().info("Load Theme: Common");
         var _loc1_:Theme = new Theme();
         _loc1_.id = COMMON_THEME_ID;
         this._themes[COMMON_THEME_ID] = _loc1_;
         _loc1_.addEventListener(CoreEvent.LOAD_THEME_COMPLETE,this.onLoadCommonThemeComplete);
         _loc1_.initThemeByLoadThemeFile(COMMON_THEME_ID);
      }
      
      private function onLoadCommonThemeComplete(param1:CoreEvent) : void
      {
         this.commonTheme.removeEventListener(CoreEvent.LOAD_THEME_COMPLETE,this.onLoadCommonThemeComplete);
         UtilErrorLogger.getInstance().info("Theme Loaded: Common");
         this.dispatchThemeReady();
      }
      
      private function dispatchThemeReady() : void
      {
         dispatchEvent(new CoreEvent(CoreEvent.LOAD_THEME_COMPLETE,this));
      }
      
      public function getPropById(param1:String, param2:String) : PropThumb
      {
         if(param1 == "ugc")
         {
            return this.getUgcPropById(param2);
         }
         var _loc3_:Theme = this._themes[param1];
         if(_loc3_)
         {
            return _loc3_.getPropThumbById(param2) as PropThumb;
         }
         return null;
      }
      
      public function getUgcPropById(param1:String) : PropThumb
      {
         var _loc2_:PropThumb = this.ccTheme.getPropThumbById(param1) as PropThumb;
         if(!_loc2_)
         {
            _loc2_ = this.userTheme.getPropThumbById(param1) as PropThumb;
         }
         if(!_loc2_)
         {
            _loc2_ = this.communityTheme.getPropThumbById(param1) as PropThumb;
         }
         return _loc2_;
      }
      
      public function getBackgroundById(param1:String, param2:String) : BackgroundThumb
      {
         if(param1 == "ugc")
         {
            return this.getUgcBackgroundById(param2);
         }
         var _loc3_:Theme = this._themes[param1];
         if(_loc3_)
         {
            return _loc3_.getBackgroundThumbById(param2);
         }
         return null;
      }
      
      public function getUgcBackgroundById(param1:String) : BackgroundThumb
      {
         var _loc2_:BackgroundThumb = this.userTheme.getBackgroundThumbById(param1);
         if(!_loc2_)
         {
            _loc2_ = this.communityTheme.getBackgroundThumbById(param1);
         }
         return _loc2_;
      }
      
      public function isStaticTheme(param1:String) : Boolean
      {
         switch(param1)
         {
            case ThemeConstants.STICKLY_BIZ_THEME_ID:
            case ThemeConstants.BIZ_MODEL_THEME_ID:
            case ThemeConstants.COMMON_CRAFT_THEME_ID:
               return true;
            default:
               return false;
         }
      }
      
      public function useExtraLargeBackgroundThumbnails(param1:String) : Boolean
      {
         switch(param1)
         {
            case ThemeConstants.BUSINESS_THEME_ID:
            case ThemeConstants.WHITEBOARD_THEME_ID:
            case ThemeConstants.INFOGRAPHICS_THEME_ID:
               return true;
            default:
               return false;
         }
      }
      
      public function supportSearchSuggestion(param1:String) : Boolean
      {
         if(!Console.getConsole().assetTagsEnabled)
         {
            return false;
         }
         if(UtilSite.isGoAnimate || UtilSite.isG4S || UtilSite.isWix)
         {
            switch(param1)
            {
               case ThemeConstants.BUSINESS_THEME_ID:
               case ThemeConstants.WHITEBOARD_THEME_ID:
               case ThemeConstants.INFOGRAPHICS_THEME_ID:
               case ThemeConstants.COMMON_CRAFT_THEME_ID:
                  return true;
            }
         }
         else
         {
            switch(param1)
            {
               case ThemeConstants.BUSINESS_THEME_ID:
                  return true;
            }
         }
         return false;
      }
      
      public function supportCharacterSearch(param1:String) : Boolean
      {
         if(UtilSite.isGoAnimate || UtilSite.isG4S || UtilSite.isWix)
         {
            switch(param1)
            {
               case ThemeConstants.INFOGRAPHICS_THEME_ID:
               case ThemeConstants.COMMON_CRAFT_THEME_ID:
                  return false;
            }
         }
         return true;
      }
      
      public function supportActionSearch(param1:String) : Boolean
      {
         if(UtilSite.isGoAnimate || UtilSite.isG4S || UtilSite.isWix)
         {
            switch(param1)
            {
               case ThemeConstants.INFOGRAPHICS_THEME_ID:
               case ThemeConstants.COMMON_CRAFT_THEME_ID:
                  return false;
            }
         }
         return true;
      }
      
      public function supportSwapBackdrop(param1:String) : Boolean
      {
         switch(param1)
         {
            case ThemeConstants.WHITEBOARD_THEME_ID:
               return false;
            default:
               return true;
         }
      }
   }
}
