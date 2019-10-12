package anifire.util
{
   import anifire.constant.AnimeConstants;
   import anifire.constant.LanguageConstants;
   import anifire.constant.ServerConstants;
   import anifire.event.LoadMgrEvent;
   import anifire.managers.AppConfigManager;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.system.Capabilities;
   import flash.utils.Dictionary;
   import mx.core.FlexGlobals;
   import mx.events.ResourceEvent;
   import mx.events.StyleEvent;
   import mx.resources.ResourceManager;
   
   public class Util
   {
      
      public static var isDebugMode:Boolean = false;
      
      public static var HTTP_ADDRESS_REGEXP:RegExp = /^https?\:\/\//i;
      
      private static var flashVar_index_by_application:Dictionary = new Dictionary();
      
      private static var _configManager:AppConfigManager = AppConfigManager.instance;
      
      private static var _currentThemeCode:String;
       
      
      public function Util()
      {
         super();
      }
      
      public static function roundNum(param1:Number, param2:int = 7) : Number
      {
         return Math.round(param1 * Math.pow(10,param2)) / Math.pow(10,param2);
      }
      
      public static function cielNum(param1:Number, param2:int = 1) : Number
      {
         return Math.ceil(param1 * Math.pow(10,param2)) / Math.pow(10,param2);
      }
      
      public static function initLog() : void
      {
      }
      
      public static function getCharacter(param1:DisplayObjectContainer) : MovieClip
      {
         if(!param1)
         {
            return null;
         }
         return UtilPlain.getCharacter(param1);
      }
      
      public static function traceDisplayList(param1:DisplayObjectContainer, param2:String = "") : void
      {
         UtilPlain.traceDisplayList(param1,param2);
      }
      
      public static function capturePicture(param1:DisplayObject, param2:Rectangle = null, param3:int = 0, param4:int = 0) : BitmapData
      {
         var _loc5_:BitmapData = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:BitmapData = null;
         var _loc9_:Matrix = null;
         var _loc10_:BitmapData = null;
         try
         {
            _loc6_ = param3 == 0?int(param1.width):int(param3);
            _loc7_ = param4 == 0?int(param1.height):int(param4);
            _loc8_ = param1.width == 0?new BitmapData(100,100):new BitmapData(_loc6_,_loc7_);
            _loc9_ = new Matrix();
            _loc8_.draw(param1,_loc9_);
            if(param2 == null || _loc8_ == null)
            {
               _loc5_ = _loc8_;
            }
            else
            {
               _loc10_ = new BitmapData(param2.width,param2.height);
               _loc10_.copyPixels(_loc8_,param2,new Point());
               _loc5_ = _loc10_;
            }
         }
         catch(e:Error)
         {
         }
         return _loc5_;
      }
      
      public static function preferLanguageShortCode() : String
      {
         var _loc1_:String = _configManager.getValue(ServerConstants.FLASHVAR_CLIENT_THEME_LANG_CODE);
         var _loc2_:String = LanguageConstants.MEDIUM_TO_SHORT_LANG_CODES_MAPPING.getValueByKey(_loc1_);
         if(_loc2_ == null)
         {
            _loc2_ = AnimeConstants.LANGUAGE_CODE_ENGLISH;
         }
         return _loc2_;
      }
      
      public static function getMovieThumbnailUrl() : String
      {
         var _loc1_:String = null;
         _loc1_ = _configManager.getValue(ServerConstants.FLASHVAR_THUMBNAIL) as String;
         if(_loc1_ == null)
         {
            _loc1_ = "";
         }
         else if(!_loc1_.match(HTTP_ADDRESS_REGEXP))
         {
            _loc1_ = (_configManager.getValue(ServerConstants.FLASHVAR_APISERVER) as String) + _loc1_;
         }
         return _loc1_;
      }
      
      public static function get currentThemeCode() : String
      {
         return _currentThemeCode;
      }
      
      public static function loadClientTheming(param1:Array, param2:Array, param3:Array, param4:Function = null) : void
      {
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc10_:IEventDispatcher = null;
         var _loc8_:UtilLoadMgr = new UtilLoadMgr();
         if(param4 != null)
         {
            _loc8_.addEventListener(LoadMgrEvent.ALL_COMPLETE,param4);
         }
         var _loc9_:int = 0;
         while(_loc9_ < param1.length)
         {
            _loc5_ = param1[_loc9_] as String;
            _loc6_ = param2[_loc9_] as String;
            _loc7_ = param3[_loc9_] as String;
            _loc10_ = FlexGlobals.topLevelApplication.styleManager.loadStyleDeclarations(UtilNetwork.getClientThemeUrl(_loc7_,_loc6_,_loc5_),true);
            _loc8_.addEventDispatcher(_loc10_ as EventDispatcher,StyleEvent.COMPLETE);
            _loc10_.addEventListener(StyleEvent.ERROR,onLoadClientThemingError);
            _loc9_++;
         }
         _loc8_.commit();
      }
      
      private static function onLoadClientThemingError(param1:StyleEvent) : void
      {
      }
      
      private static function unloadClientTheming(param1:Array, param2:Array, param3:Array) : void
      {
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:int = 0;
         while(_loc7_ < param1.length)
         {
            _loc4_ = param1[_loc7_] as String;
            _loc5_ = param2[_loc7_] as String;
            _loc6_ = param3[_loc7_] as String;
            FlexGlobals.topLevelApplication.styleManager.unloadStyleDeclarations(UtilNetwork.getClientThemeUrl(_loc6_,_loc5_,_loc4_),true);
            _loc7_++;
         }
      }
      
      public static function isVideoRecording() : Boolean
      {
         return _configManager.getValue(ServerConstants.FLASHVAR_IS_VIDEO_RECORD_MODE) == "1";
      }
      
      public static function is1080Recording() : Boolean
      {
         return _configManager.getValue(ServerConstants.FLASHVAR_IS_VIDEO_RECORD_MODE) == "1" && _configManager.getValue(ServerConstants.FLASHVAR_CUSTOM_PLAYER_HEIGHT) == "1080";
      }
      
      public static function loadClientLocale(param1:String, param2:Function) : void
      {
         var langCode:String = null;
         var themeCode:String = null;
         var eventDispatcher:IEventDispatcher = null;
         var app:String = param1;
         var callback:Function = param2;
         langCode = _configManager.getValue(ServerConstants.FLASHVAR_CLIENT_THEME_LANG_CODE);
         themeCode = _configManager.getValue(ServerConstants.FLASHVAR_CLIENT_THEME_CODE);
         if(themeCode == null || themeCode == "silver")
         {
            themeCode = "go";
         }
         if(!langCode)
         {
            langCode = "en_US";
         }
         var resourceModuleURL:String = UtilNetwork.getClientLocaleUrl(themeCode,langCode,"framework");
         eventDispatcher = ResourceManager.getInstance().loadResourceModule(resourceModuleURL);
         function():void
         {
            var counter:* = 2;
            var _callback:* = function(param1:Event):void
            {
               if(--counter == 0)
               {
                  callback(null);
               }
            };
            UtilGettext.initAggregate(app,themeCode,langCode,_callback);
            eventDispatcher.addEventListener(ResourceEvent.COMPLETE,_callback);
         }();
         ResourceManager.getInstance().localeChain = [langCode];
      }
      
      public static function playerIsUpdated(param1:Number, param2:Number) : Boolean
      {
         var _loc3_:String = Capabilities.version;
         var _loc4_:Array = _loc3_.split(" ");
         var _loc5_:String = _loc4_[0];
         var _loc6_:Array = _loc4_[1].split(",");
         var _loc7_:Number = parseInt(_loc6_[0]);
         var _loc8_:Number = parseInt(_loc6_[1]);
         var _loc9_:Number = parseInt(_loc6_[2]);
         var _loc10_:Number = parseInt(_loc6_[3]);
         if(_loc7_ > param1)
         {
            return true;
         }
         if(_loc7_ == param1 && _loc8_ >= param2)
         {
            return true;
         }
         return false;
      }
      
      public static function numPropertiesOfObject(param1:Object) : int
      {
         var _loc3_:Object = null;
         var _loc2_:int = 0;
         for each(_loc3_ in param1)
         {
            _loc2_++;
         }
         return _loc2_;
      }
   }
}
