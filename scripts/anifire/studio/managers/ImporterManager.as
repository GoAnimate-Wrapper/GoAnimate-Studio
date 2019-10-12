package anifire.studio.managers
{
   import anifire.constant.AnimeConstants;
   import anifire.constant.ServerConstants;
   import anifire.event.CoreEvent;
   import anifire.managers.AppConfigManager;
   import anifire.managers.ServerConnector;
   import anifire.models.FontModel;
   import anifire.studio.core.BackgroundThumb;
   import anifire.studio.core.BubbleThumb;
   import anifire.studio.core.PropThumb;
   import anifire.studio.core.SoundThumb;
   import anifire.studio.core.ThumbDataLoader;
   import anifire.studio.core.VideoPropThumb;
   import anifire.studio.events.ImporterEvent;
   import anifire.util.FontManager;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.external.ExternalInterface;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.utils.ByteArray;
   
   public class ImporterManager extends EventDispatcher
   {
      
      protected static var __instance:ImporterManager;
       
      
      public function ImporterManager()
      {
         super();
         this.init();
      }
      
      public static function get instance() : ImporterManager
      {
         if(!__instance)
         {
            __instance = new ImporterManager();
         }
         return __instance;
      }
      
      protected function init() : void
      {
         ExternalInterface.addCallback("importerStatus",this.importerStatus);
         ExternalInterface.addCallback("importerUploadComplete",this.importerUploadComplete);
         ExternalInterface.addCallback("importerAddAsset",this.importerAddAsset);
      }
      
      public function showImporter() : void
      {
         ExternalInterface.call("showImporter");
      }
      
      protected function importerStatus(param1:String) : void
      {
         var _loc2_:ImporterEvent = new ImporterEvent(ImporterEvent.IMPORTER_STATUS);
         _loc2_.status = param1;
         dispatchEvent(_loc2_);
      }
      
      public function importerUploadComplete(param1:String, param2:String, param3:Object) : void
      {
         var _loc4_:ImporterEvent = new ImporterEvent(ImporterEvent.IMPORTER_UPLOAD_COMPLETE);
         _loc4_.assetType = param1;
         _loc4_.assetId = param2;
         switch(param1)
         {
            case "bg":
               this.createBackgroundThumb(param2,param3);
               break;
            case "prop":
               this.createPropThumb(param2,param3);
               break;
            case "video":
               this.createVideoThumb(param2,param3);
               break;
            case "sound":
               this.createSoundThumb(param2,param3);
               break;
            case "font":
               this.createBubbleThumb(param3);
         }
         dispatchEvent(_loc4_);
      }
      
      public function importerAddAsset(param1:String, param2:String) : void
      {
         var _loc3_:ImporterEvent = new ImporterEvent(ImporterEvent.IMPORTER_ADD_ASSET);
         _loc3_.assetType = param1;
         _loc3_.assetId = param2;
         dispatchEvent(_loc3_);
      }
      
      protected function dispatchAssetReady(param1:String, param2:String) : void
      {
         var _loc3_:ImporterEvent = new ImporterEvent(ImporterEvent.IMPORTER_ASSET_READY);
         _loc3_.assetType = param1;
         _loc3_.assetId = param2;
         dispatchEvent(_loc3_);
      }
      
      public function createBackgroundThumb(param1:String, param2:Object) : void
      {
         var _loc3_:URLVariables = AppConfigManager.instance.createURLVariables();
         _loc3_[ServerConstants.PARAM_ENC_ASSET_ID] = param2["enc_asset_id"];
         _loc3_[ServerConstants.PARAM_SIGNATURE] = param2["signature"];
         var _loc4_:URLRequest = new URLRequest(ServerConstants.ACTION_GET_ASSET_EX);
         _loc4_.method = URLRequestMethod.POST;
         _loc4_.data = _loc3_;
         var _loc5_:ThumbDataLoader = new ThumbDataLoader();
         _loc5_.assetId = param1;
         _loc5_.assetType = "bg";
         _loc5_.data = param2;
         _loc5_.addEventListener(Event.COMPLETE,this.onBackgroundDataComplete);
         _loc5_.addEventListener(IOErrorEvent.IO_ERROR,this.onLoadAssetError);
         _loc5_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onLoadAssetError);
         _loc5_.load(_loc4_);
      }
      
      protected function onBackgroundDataComplete(param1:Event) : void
      {
         var _loc2_:ThumbDataLoader = param1.currentTarget as ThumbDataLoader;
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:ByteArray = new ByteArray();
         _loc2_.readBytes(_loc3_);
         var _loc4_:BackgroundThumb = new BackgroundThumb();
         var _loc5_:Object = _loc2_.data;
         _loc4_.id = _loc4_.thumbId = _loc5_["file"];
         _loc4_.encAssetId = _loc5_["enc_asset_id"];
         _loc4_.signature = _loc5_["signature"];
         _loc4_.name = _loc5_["title"];
         _loc4_.tags = _loc5_["tags"];
         _loc4_.setFileName("bg/" + _loc5_["file"]);
         _loc4_.theme = ThemeManager.instance.userTheme;
         _loc4_.imageData = _loc4_.thumbImageData = _loc3_;
         _loc4_.enable = true;
         _loc4_.isPublished = false;
         _loc4_.sortOrder = ThemeManager.instance.userTheme.backgroundThumbs.length;
         ThemeManager.instance.userTheme.backgroundThumbs.push(_loc4_.id,_loc4_);
         UserAssetManager.instance.addBackgroundByThumb(_loc4_);
         UserAssetManager.instance.notifyUploadComplete();
         _loc2_.removeAllEventListeners();
         ServerConnector.instance.notifyAssetReady("bg",_loc5_["file"]);
         this.dispatchAssetReady("bg",_loc5_["file"]);
      }
      
      protected function createPropThumb(param1:String, param2:Object) : void
      {
         var _loc3_:URLVariables = AppConfigManager.instance.createURLVariables();
         _loc3_[ServerConstants.PARAM_ENC_ASSET_ID] = param2["enc_asset_id"];
         _loc3_[ServerConstants.PARAM_SIGNATURE] = param2["signature"];
         var _loc4_:URLRequest = new URLRequest(ServerConstants.ACTION_GET_ASSET_EX);
         _loc4_.method = URLRequestMethod.POST;
         _loc4_.data = _loc3_;
         var _loc5_:ThumbDataLoader = new ThumbDataLoader();
         _loc5_.assetId = param1;
         _loc5_.assetType = "prop";
         _loc5_.data = param2;
         _loc5_.addEventListener(Event.COMPLETE,this.onPropDataComplete);
         _loc5_.addEventListener(IOErrorEvent.IO_ERROR,this.onLoadAssetError);
         _loc5_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onLoadAssetError);
         _loc5_.load(_loc4_);
      }
      
      protected function onPropDataComplete(param1:Event) : void
      {
         var _loc2_:ThumbDataLoader = param1.currentTarget as ThumbDataLoader;
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:ByteArray = new ByteArray();
         _loc2_.readBytes(_loc3_);
         var _loc4_:PropThumb = new PropThumb();
         var _loc5_:Object = _loc2_.data;
         _loc4_.id = _loc5_["file"];
         _loc4_.encAssetId = _loc5_["enc_asset_id"];
         _loc4_.signature = _loc5_["signature"];
         _loc4_.name = _loc5_["title"];
         _loc4_.tags = _loc5_["tags"];
         _loc4_.setFileName("prop/" + _loc5_["file"]);
         _loc4_.theme = ThemeManager.instance.userTheme;
         _loc4_.imageData = _loc3_;
         _loc4_.placeable = true;
         _loc4_.holdable = false;
         _loc4_.headable = false;
         _loc4_.facing = AnimeConstants.FACING_LEFT;
         _loc4_.enable = true;
         _loc4_.isPublished = false;
         ThemeManager.instance.userTheme.addThumb(_loc4_,_loc4_.xml);
         UserAssetManager.instance.addPropByThumb(_loc4_);
         UserAssetManager.instance.notifyUploadComplete();
         _loc2_.removeAllEventListeners();
         ServerConnector.instance.notifyAssetReady("prop",_loc5_["file"]);
         this.dispatchAssetReady("prop",_loc5_["file"]);
      }
      
      protected function createSoundThumb(param1:String, param2:Object) : void
      {
         var _loc3_:URLVariables = AppConfigManager.instance.createURLVariables();
         _loc3_[ServerConstants.PARAM_ENC_ASSET_ID] = param2["enc_asset_id"];
         _loc3_[ServerConstants.PARAM_SIGNATURE] = param2["signature"];
         var _loc4_:URLRequest = new URLRequest(ServerConstants.ACTION_GET_ASSET_EX);
         _loc4_.method = URLRequestMethod.POST;
         _loc4_.data = _loc3_;
         var _loc5_:ThumbDataLoader = new ThumbDataLoader();
         _loc5_.assetId = param1;
         _loc5_.assetType = "sound";
         _loc5_.data = param2;
         _loc5_.addEventListener(Event.COMPLETE,this.onSoundDataComplete);
         _loc5_.addEventListener(IOErrorEvent.IO_ERROR,this.onLoadAssetError);
         _loc5_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onLoadAssetError);
         _loc5_.load(_loc4_);
      }
      
      protected function onSoundDataComplete(param1:Event) : void
      {
         var _loc2_:ThumbDataLoader = param1.currentTarget as ThumbDataLoader;
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:ByteArray = new ByteArray();
         _loc2_.readBytes(_loc3_);
         var _loc4_:SoundThumb = new SoundThumb();
         var _loc5_:Object = _loc2_.data;
         _loc4_.id = _loc5_["file"];
         _loc4_.encAssetId = _loc5_["enc_asset_id"];
         _loc4_.signature = _loc5_["signature"];
         _loc4_.name = _loc5_["title"];
         _loc4_.theme = ThemeManager.instance.userTheme;
         if(_loc5_["subtype"])
         {
            _loc4_.subType = _loc5_["subtype"];
         }
         else
         {
            _loc4_.subType = AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_BG_MUSIC;
         }
         _loc4_.downloadType = _loc5_["downloadtype"];
         _loc4_.duration = parseInt(_loc5_["duration"]);
         _loc4_.tags = _loc5_["tags"];
         _loc4_.isPublished = false;
         _loc4_.mergeIntoTheme(ThemeManager.instance.userTheme);
         _loc4_.addEventListener(CoreEvent.LOAD_THUMB_COMPLETE,this.onSoundThumbComplete);
         _loc4_.initSoundByByteArray(_loc3_);
         _loc2_.removeAllEventListeners();
      }
      
      protected function onSoundThumbComplete(param1:Event) : void
      {
         var _loc2_:SoundThumb = param1.currentTarget as SoundThumb;
         if(_loc2_)
         {
            _loc2_.removeEventListener(CoreEvent.LOAD_THUMB_COMPLETE,this.onSoundThumbComplete);
            ThemeManager.instance.userTheme.soundThumbs.push(_loc2_.id,_loc2_);
            UserAssetManager.instance.addSoundByThumb(_loc2_);
            UserAssetManager.instance.notifyUploadComplete();
            ServerConnector.instance.notifyAssetReady("sound",_loc2_.id);
            this.dispatchAssetReady("sound",_loc2_.id);
         }
      }
      
      protected function createVideoThumb(param1:String, param2:Object) : void
      {
         var _loc3_:String = param2["thumbnail"];
         if(!_loc3_)
         {
            return;
         }
         var _loc4_:URLRequest = new URLRequest(_loc3_);
         _loc4_.method = URLRequestMethod.GET;
         var _loc5_:ThumbDataLoader = new ThumbDataLoader();
         _loc5_.assetId = param1;
         _loc5_.assetType = "video";
         _loc5_.data = param2;
         _loc5_.addEventListener(Event.COMPLETE,this.onVideoDataComplete);
         _loc5_.addEventListener(IOErrorEvent.IO_ERROR,this.onLoadAssetError);
         _loc5_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onLoadAssetError);
         _loc5_.load(_loc4_);
      }
      
      protected function onVideoDataComplete(param1:Event) : void
      {
         var _loc3_:ByteArray = null;
         var _loc2_:ThumbDataLoader = param1.currentTarget as ThumbDataLoader;
         if(!_loc2_)
         {
            return;
         }
         _loc3_ = new ByteArray();
         _loc2_.readBytes(_loc3_);
         var _loc4_:VideoPropThumb = new VideoPropThumb();
         var _loc5_:Object = _loc2_.data;
         _loc4_.deserializeJson(_loc5_);
         _loc4_.theme = ThemeManager.instance.userTheme;
         _loc4_.imageData = _loc3_;
         _loc4_.enable = true;
         _loc4_.isPublished = false;
         ThemeManager.instance.userTheme.addThumb(_loc4_,_loc4_.serializeForPreviewPlayer());
         UserAssetManager.instance.addVideoByThumb(_loc4_);
         UserAssetManager.instance.notifyUploadComplete();
         _loc2_.removeAllEventListeners();
         ServerConnector.instance.notifyAssetReady("video",_loc4_.id);
         this.dispatchAssetReady("video",_loc4_.id);
      }
      
      protected function onLoadAssetError(param1:Event) : void
      {
         var _loc2_:ThumbDataLoader = param1.currentTarget as ThumbDataLoader;
         if(!_loc2_)
         {
            return;
         }
         _loc2_.removeAllEventListeners();
      }
      
      protected function createBubbleThumb(param1:Object) : void
      {
         var _loc4_:UserAssetManager = null;
         var _loc5_:BubbleThumb = null;
         if(!param1)
         {
            return;
         }
         var _loc2_:FontManager = FontManager.getFontManager();
         var _loc3_:FontModel = _loc2_.createFontModel(param1);
         if(_loc3_)
         {
            _loc2_.addFontModel(_loc3_);
            _loc4_ = UserAssetManager.instance;
            _loc5_ = _loc4_.createBubbleThumb(_loc3_.id);
            if(_loc5_)
            {
               ThemeManager.instance.userTheme.bubbleThumbs.push(_loc5_.id,_loc5_);
               _loc4_.addBubbleByImporter(_loc5_);
               _loc4_.notifyUploadComplete();
               ServerConnector.instance.notifyAssetReady("font",param1["file"]);
               this.dispatchAssetReady("font",param1["file"]);
            }
         }
      }
      
      public function imageFrameSelected() : void
      {
         ServerConnector.instance.notifyEvent("imageFrameSelect");
      }
      
      public function imageFrameDeselected() : void
      {
         ServerConnector.instance.notifyEvent("imageFrameDeselect");
      }
   }
}
