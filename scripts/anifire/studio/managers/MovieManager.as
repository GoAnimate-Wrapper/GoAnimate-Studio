package anifire.studio.managers
{
   import anifire.constant.AnimeConstants;
   import anifire.constant.ServerConstants;
   import anifire.managers.AppConfigManager;
   import anifire.studio.components.AlertPopUp;
   import anifire.studio.core.Console;
   import anifire.studio.core.GroupController;
   import anifire.studio.core.MetaData;
   import anifire.studio.events.SaveMovieCompleteEvent;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLStream;
   import flash.net.URLVariables;
   import flash.utils.ByteArray;
   import mx.utils.Base64Encoder;
   import mx.utils.StringUtil;
   import nochump.util.zip.ZipEntry;
   import nochump.util.zip.ZipOutput;
   
   public class MovieManager extends EventDispatcher
   {
      
      public static const SAVE_MOVIE_COMPLETE:String = "save_movie_complete";
      
      public static const SAVE_MOVIE_ERROR:String = "save_movie_error";
       
      
      private var _urlStream:URLStream;
      
      public function MovieManager(param1:IEventDispatcher = null)
      {
         super(param1);
      }
      
      public function addURLVariables(param1:URLVariables, param2:XML, param3:MetaData, param4:String, param5:Boolean, param6:String) : URLVariables
      {
         AppConfigManager.instance.appendURLVariables(param1);
         if(param2..serializeError.length() > 0)
         {
            AlertPopUp.openDefaultPopUpWithLocale("Your video has been saved. However, we detected instablilty in your browser. Please close this window and reload the video maker.");
            param1["error"] = "1";
         }
         if(param5)
         {
            if(param3.movieId != null)
            {
               param1[ServerConstants.PARAM_AUTOSAVE] = 1;
            }
            param1[ServerConstants.PARAM_IS_TRIGGER_BY_AUTOSAVE] = 1;
         }
         param1[ServerConstants.PARAM_IS_PASSWORD_PROTECTED] = !!Console.getConsole().tempPasswordProtected?1:0;
         param1["publish_quality"] = param6;
         var _loc7_:String = AnimeConstants.MOVIE_XML_FILENAME;
         var _loc8_:ByteArray = new ByteArray();
         _loc8_.writeUTFBytes(param2.toString());
         var _loc9_:ZipOutput = new ZipOutput();
         var _loc10_:ZipEntry = new ZipEntry(_loc7_);
         _loc9_.putNextEntry(_loc10_);
         _loc9_.write(_loc8_);
         _loc9_.closeEntry();
         _loc9_.finish();
         var _loc11_:ByteArray = _loc9_.byteArray;
         var _loc12_:Base64Encoder = new Base64Encoder();
         _loc12_.encodeBytes(_loc11_);
         param1[ServerConstants.PARAM_BODY_ZIP] = _loc12_.flush();
         delete param1[ServerConstants.PARAM_MOVIE_ID];
         if(param3.movieId != null)
         {
            param1[ServerConstants.PARAM_MOVIE_ID] = param3.movieId;
         }
         if(param3.movieId == null && param4 != null)
         {
            param1[ServerConstants.PARAM_INITIAL_THEME_CODE] = param4;
         }
         delete param1[ServerConstants.PARAM_ORIGINAL_ID];
         if(param3.originalId != null && StringUtil.trim(param3.originalId))
         {
            param1[ServerConstants.PARAM_ORIGINAL_ID] = param3.originalId;
         }
         return param1;
      }
      
      public function addURLVariablesForThumbnail(param1:URLVariables, param2:ByteArray, param3:String) : URLVariables
      {
         var _loc4_:Base64Encoder = new Base64Encoder();
         _loc4_.encodeBytes(param2);
         param1[param3] = _loc4_.flush();
         return param1;
      }
      
      public function addURLVariablesForSchool(param1:URLVariables, param2:GroupController) : URLVariables
      {
         if(param2.isSchoolProject)
         {
            param1[ServerConstants.PARAM_GROUP_ID] = !!param2.currentGroup?param2.currentGroup.id:"0";
         }
         return param1;
      }
      
      public function addURLVariablesForYouTube(param1:URLVariables, param2:Boolean) : URLVariables
      {
         param1[ServerConstants.PARAM_YOUTUBE_PUBLISH] = !!param2?"publish":"private";
         return param1;
      }
      
      public function addURLVariablesForSkoletube(param1:URLVariables, param2:Boolean, param3:GroupController) : URLVariables
      {
         param1[ServerConstants.PARAM_GROUP_ID] = !!param3.currentGroup?param3.currentGroup.id:"0";
         param1[ServerConstants.PARAM_SKOLETUBE_PUBLISH] = !!param2?"publish":"private";
         return param1;
      }
      
      public function saveMovie(param1:URLVariables) : void
      {
         var _loc2_:URLRequest = new URLRequest(ServerConstants.get_ACTION_SAVE_MOVIE());
         _loc2_.method = URLRequestMethod.POST;
         _loc2_.data = param1;
         this._urlStream = new URLStream();
         this.addEventListenerToStream();
         this._urlStream.load(_loc2_);
      }
      
      public function saveStarter(param1:XML, param2:ByteArray, param3:ByteArray, param4:String = "") : void
      {
         var _loc5_:URLVariables = AppConfigManager.instance.createURLVariables();
         _loc5_[ServerConstants.PARAM_MOVIE_ID] = "";
         if(AccessRightManager.instance.getAccess(AccessRightManager.ACCESS_RIGHT_ADMIN) && param4 != "")
         {
            _loc5_[ServerConstants.PARAM_MOVIE_ID] = param4;
         }
         _loc5_[ServerConstants.PARAM_SAVE_THUMBNAIL] = "1";
         var _loc6_:String = AnimeConstants.MOVIE_XML_FILENAME;
         var _loc7_:ByteArray = new ByteArray();
         _loc7_.writeUTFBytes(param1.toString());
         var _loc8_:ZipOutput = new ZipOutput();
         var _loc9_:ZipEntry = new ZipEntry(_loc6_);
         _loc8_.putNextEntry(_loc9_);
         _loc8_.write(_loc7_);
         _loc8_.closeEntry();
         _loc8_.finish();
         var _loc10_:ByteArray = _loc8_.byteArray;
         var _loc11_:Base64Encoder = new Base64Encoder();
         _loc11_.encodeBytes(_loc10_);
         _loc5_[ServerConstants.PARAM_BODY_ZIP] = _loc11_.flush();
         var _loc12_:Base64Encoder = new Base64Encoder();
         _loc12_.encodeBytes(param2);
         _loc5_[ServerConstants.PARAM_THUMBNAIL] = _loc12_.flush();
         var _loc13_:Base64Encoder = new Base64Encoder();
         _loc13_.encodeBytes(param3);
         _loc5_[ServerConstants.PARAM_THUMBNAIL_LARGE] = _loc13_.flush();
         var _loc14_:URLRequest = new URLRequest(ServerConstants.ACTION_SAVE_STARTER);
         _loc14_.method = URLRequestMethod.POST;
         _loc14_.data = _loc5_;
         this._urlStream = new URLStream();
         this.addEventListenerToStream();
         this._urlStream.load(_loc14_);
      }
      
      private function addEventListenerToStream() : void
      {
         this._urlStream.addEventListener(Event.COMPLETE,this.onComplete);
         this._urlStream.addEventListener(IOErrorEvent.IO_ERROR,this.onError);
         this._urlStream.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onError);
      }
      
      private function removeListenerFromStream() : void
      {
         this._urlStream.removeEventListener(Event.COMPLETE,this.onComplete);
         this._urlStream.removeEventListener(IOErrorEvent.IO_ERROR,this.onError);
         this._urlStream.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onError);
      }
      
      private function onError(param1:Event) : void
      {
         this.removeListenerFromStream();
         if(param1.type == IOErrorEvent.IO_ERROR)
         {
            this.dispatchEvent(new IOErrorEvent(IOErrorEvent.IO_ERROR));
         }
         else if(param1.type == SecurityErrorEvent.SECURITY_ERROR)
         {
            this.dispatchEvent(new SecurityErrorEvent(SecurityErrorEvent.SECURITY_ERROR));
         }
      }
      
      private function onComplete(param1:Event) : void
      {
         this.removeListenerFromStream();
         this.dispatchEvent(SaveMovieCompleteEvent.getInstance(this._urlStream));
      }
   }
}
