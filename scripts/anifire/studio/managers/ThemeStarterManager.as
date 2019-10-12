package anifire.studio.managers
{
   import anifire.constant.ResponseConstants;
   import anifire.constant.ServerConstants;
   import anifire.constant.ThemeConstants;
   import anifire.event.CoreEvent;
   import anifire.event.ServerRequestEvent;
   import anifire.managers.AppConfigManager;
   import anifire.studio.components.AlertPopUp;
   import anifire.studio.core.AnimeScene;
   import anifire.studio.core.Asset;
   import anifire.studio.core.BubbleAsset;
   import anifire.studio.core.CharThumb;
   import anifire.studio.core.Thumb;
   import anifire.util.ApiRequest;
   import anifire.util.FontManager;
   import anifire.util.UtilSite;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLStream;
   import flash.net.URLVariables;
   import mx.collections.ArrayCollection;
   
   public class ThemeStarterManager extends EventDispatcher
   {
      
      protected static var __instance:ThemeStarterManager;
      
      public static const THEME_STARTER_TAG_NAME:String = "_public";
      
      public static const SAVE_ERROR_TITLE:String = "Error";
      
      public static const SAVE_ERROR_MESSAGE_MORE_THAN_ONE_SCENE:String = "This starter contains more than one scene. Remove the extra scenes and save again.";
      
      public static const SAVE_ERROR_MESSAGE_INVALID_CONTENT:String = "This scene includes content from different themes and cannot be saved as a theme starter. Remove the content from other themes and try saving it again.";
      
      private static const STARTER_PAGE_SIZE:int = 50;
       
      
      private var _configManager:AppConfigManager;
      
      private var _starterIdLookup:Object;
      
      public var starters:ArrayCollection;
      
      public var lastSelectedStarterId:String;
      
      public function ThemeStarterManager()
      {
         super();
         this.init();
      }
      
      public static function get instance() : ThemeStarterManager
      {
         if(!__instance)
         {
            __instance = new ThemeStarterManager();
         }
         return __instance;
      }
      
      private function init() : void
      {
         this._configManager = AppConfigManager.instance;
         this._starterIdLookup = {};
         this.starters = new ArrayCollection();
      }
      
      public function addThemeStarter(param1:String, param2:String, param3:String) : void
      {
         var _loc4_:Object = null;
         if(!this._starterIdLookup[param1])
         {
            _loc4_ = {
               "id":param1,
               "title":param2,
               "thumbnail":param3
            };
            this._starterIdLookup[param1] = _loc4_;
            this.starters.addItem(_loc4_);
         }
      }
      
      public function getLastThemeStarterData() : Object
      {
         return this._starterIdLookup[this.lastSelectedStarterId];
      }
      
      public function updateStarter(param1:String, param2:String, param3:String, param4:String, param5:Object = null) : void
      {
         var _loc6_:Object = null;
         var _loc7_:ApiRequest = null;
         var _loc8_:URLVariables = null;
         var _loc9_:URLRequest = null;
         var _loc10_:URLStream = null;
         if(UtilSite.isGoAnimate)
         {
            _loc6_ = {};
            _loc6_[ResponseConstants.ASSETID] = param1;
            _loc6_[ResponseConstants.ID] = param4;
            if(!param4)
            {
               _loc6_[ResponseConstants.ASSET_STARTER_ID] = param1;
            }
            _loc6_[ResponseConstants.TITLE] = param2;
            _loc6_[ResponseConstants.TAGS] = param3;
            if(AccessRightManager.instance.getAccess(AccessRightManager.ACCESS_RIGHT_TEAM_SHARING))
            {
               _loc6_[ResponseConstants.ASSET_SHARING_SHARE] = param5;
            }
            _loc7_ = new ApiRequest();
            _loc7_.addEventListener(ServerRequestEvent.COMPLETE,this.updateStarter_completeHandler);
            _loc7_.addEventListener(ServerRequestEvent.FAIL,this.updateStarter_failHandler);
            _loc7_.post(ServerConstants.ACTION_UPDATE_ASSET_V2,_loc6_);
         }
         else
         {
            _loc8_ = this._configManager.createURLVariables();
            _loc8_["movieId"] = param1;
            _loc8_["title"] = param2;
            _loc8_["tags"] = param3;
            _loc8_["id"] = param4;
            _loc9_ = new URLRequest(ServerConstants.ACTION_UPDATE_TEMPLATE_INFO);
            _loc9_.data = _loc8_;
            _loc9_.method = URLRequestMethod.POST;
            _loc10_ = new URLStream();
            _loc10_.addEventListener(Event.COMPLETE,this.onUpdateStarterComplete);
            _loc10_.load(_loc9_);
         }
      }
      
      private function updateStarter_completeHandler(param1:ServerRequestEvent) : void
      {
         var _loc2_:ApiRequest = param1.target as ApiRequest;
         _loc2_.removeEventListener(ServerRequestEvent.COMPLETE,this.updateStarter_completeHandler);
         _loc2_.removeEventListener(ServerRequestEvent.FAIL,this.updateStarter_failHandler);
         dispatchEvent(new CoreEvent(CoreEvent.UPDATE_ASSET_COMPLETE,this));
      }
      
      private function updateStarter_failHandler(param1:ServerRequestEvent) : void
      {
         var _loc2_:ApiRequest = param1.target as ApiRequest;
         _loc2_.removeEventListener(ServerRequestEvent.COMPLETE,this.updateStarter_completeHandler);
         _loc2_.removeEventListener(ServerRequestEvent.FAIL,this.updateStarter_failHandler);
         AlertPopUp.openDefaultPopUpWithLocale(param1.message,"Error");
      }
      
      private function onUpdateStarterComplete(param1:Event) : void
      {
         EventDispatcher(param1.currentTarget).removeEventListener(Event.COMPLETE,this.onUpdateStarterComplete);
         dispatchEvent(new CoreEvent(CoreEvent.UPDATE_ASSET_COMPLETE,this));
      }
      
      public function checkThemeStarterContent(param1:AnimeScene, param2:String) : Boolean
      {
         var _loc3_:Asset = null;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:Thumb = null;
         var _loc7_:CharThumb = null;
         var _loc8_:BubbleAsset = null;
         if(!param1)
         {
            return false;
         }
         _loc3_ = param1.background;
         if(_loc3_)
         {
            _loc6_ = _loc3_.thumb;
            if(_loc6_)
            {
               if(_loc6_.themeId != param2 && _loc6_.themeId != ThemeConstants.COMMON_THEME_ID)
               {
                  return false;
               }
            }
         }
         _loc5_ = param1.props.length;
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            _loc3_ = param1.props.getValueByIndex(_loc4_) as Asset;
            if(_loc3_)
            {
               _loc6_ = _loc3_.thumb;
               if(_loc6_)
               {
                  if(_loc6_.themeId != param2 && _loc6_.themeId != ThemeConstants.COMMON_THEME_ID)
                  {
                     return false;
                  }
               }
            }
            _loc4_++;
         }
         _loc5_ = param1.characters.length;
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            _loc3_ = param1.characters.getValueByIndex(_loc4_) as Asset;
            if(_loc3_ && _loc3_.thumb is CharThumb)
            {
               _loc7_ = _loc3_.thumb as CharThumb;
               if(!_loc7_.isCC || _loc7_.ccThemeId != param2)
               {
                  return false;
               }
            }
            _loc4_++;
         }
         _loc5_ = param1.bubbles.length;
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            _loc8_ = param1.bubbles.getValueByIndex(_loc4_) as BubbleAsset;
            if(_loc8_)
            {
               if(FontManager.instance.isUserFont(_loc8_.textFont))
               {
                  return false;
               }
            }
            _loc4_++;
         }
         return true;
      }
   }
}
