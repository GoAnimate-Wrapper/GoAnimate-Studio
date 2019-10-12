package anifire.studio.managers
{
   import anifire.constant.ServerConstants;
   import anifire.event.CoreEvent;
   import anifire.studio.core.BackgroundThumb;
   import anifire.studio.core.Console;
   import anifire.studio.core.PropThumb;
   import anifire.studio.core.SoundThumb;
   import anifire.studio.core.Theme;
   import anifire.studio.core.VideoPropThumb;
   import anifire.studio.models.ThumbModel;
   import anifire.util.UtilURLStream;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLStream;
   import flash.net.URLVariables;
   import flash.utils.ByteArray;
   import nochump.util.zip.ZipEntry;
   import nochump.util.zip.ZipFile;
   
   public class LegacyUserAssetManager extends UserAssetManager
   {
      
      private static var _instance:UserAssetManager;
      
      private static const PROP_PAGE_SIZE:int = 1000;
      
      private static const BACKGROUND_PAGE_SIZE:int = 50;
      
      private static const STARTER_PAGE_SIZE:int = 50;
      
      private static const CHARACTER_PAGE_SIZE:int = 1000;
      
      private static const SOUND_PAGE_SIZE:int = 1000;
      
      private static const VIDEO_PAGE_SIZE:int = 50;
      
      private static const ERROR_CHECK_BYTE:int = 49;
       
      
      public function LegacyUserAssetManager()
      {
         super();
      }
      
      override public function updateAsset(param1:String, param2:String, param3:String, param4:String, param5:Boolean, param6:Object = null) : void
      {
         var _loc7_:URLVariables = _configManager.createURLVariables();
         _loc7_["assetId"] = param1;
         _loc7_["title"] = param3;
         _loc7_["tags"] = param4;
         _loc7_["isPublished"] = !!param5?"1":"0";
         var _loc8_:URLRequest = new URLRequest(ServerConstants.ACTION_UPDATE_ASSET);
         _loc8_.data = _loc7_;
         _loc8_.method = URLRequestMethod.POST;
         var _loc9_:URLStream = new URLStream();
         _loc9_.addEventListener(Event.COMPLETE,this.updateAsset_completeHandler);
         _loc9_.addEventListener(UtilURLStream.TIME_OUT,common_errorHandler);
         _loc9_.addEventListener(IOErrorEvent.IO_ERROR,common_errorHandler);
         _loc9_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,common_errorHandler);
         _loc9_.load(_loc8_);
      }
      
      private function updateAsset_completeHandler(param1:Event) : void
      {
         dispatchEvent(new CoreEvent(CoreEvent.UPDATE_ASSET_COMPLETE,this));
      }
      
      override public function loadSound() : void
      {
         startLoading();
         var _loc1_:URLVariables = _configManager.createURLVariables();
         var _loc2_:UtilURLStream = new UtilURLStream();
         _loc2_.addEventListener(Event.COMPLETE,this.loadSound_completeHandler);
         _loc2_.addEventListener(ProgressEvent.PROGRESS,Console.getConsole().showProgress);
         _loc2_.addEventListener(UtilURLStream.TIME_OUT,common_errorHandler);
         _loc2_.addEventListener(IOErrorEvent.IO_ERROR,common_errorHandler);
         _loc2_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,common_errorHandler);
         _loc1_["count"] = SOUND_PAGE_SIZE;
         _loc1_["page"] = _nextSoundPage;
         _loc1_["type"] = "sound";
         var _loc3_:URLRequest = new URLRequest(ServerConstants.ACTION_GET_USER_ASSETS_XML);
         _loc3_.data = _loc1_;
         _loc3_.method = URLRequestMethod.POST;
         _loc2_.load(_loc3_);
      }
      
      private function loadSound_completeHandler(param1:Event) : void
      {
         var _loc8_:SoundThumb = null;
         var _loc9_:XML = null;
         var _loc12_:ThumbModel = null;
         var _loc2_:UtilURLStream = UtilURLStream(param1.target);
         var _loc3_:ByteArray = new ByteArray();
         _loc2_.readBytes(_loc3_);
         _loc3_.position = 0;
         var _loc4_:int = _loc3_.readByte();
         if(_loc4_ == ERROR_CHECK_BYTE)
         {
            errorMessageHandler(_loc3_);
            return;
         }
         _loc3_.position = 0;
         var _loc5_:XML = new XML(_loc3_);
         if(checkXmlError(_loc5_))
         {
            return;
         }
         _hasMoreSound = _loc5_.@more == "1";
         var _loc6_:XMLList = _loc5_.children();
         var _loc7_:int = _loc6_.length();
         var _loc10_:Theme = ThemeManager.instance.userTheme;
         var _loc11_:int = 0;
         while(_loc11_ < _loc7_)
         {
            _loc9_ = _loc6_[_loc11_];
            _loc8_ = new SoundThumb();
            _loc8_.deSerialize(_loc9_,_loc10_);
            _loc8_.xml = _loc9_;
            _loc8_.editable = true;
            _loc10_.addThumb(_loc8_,_loc9_);
            _loc12_ = new ThumbModel(_loc8_);
            _soundCollection.addProduct(_loc12_);
            _voiceTabSoundCollection.addProduct(_loc12_);
            _loc11_++;
         }
         _nextSoundPage++;
         finishLoading();
         dispatchEvent(new CoreEvent(CoreEvent.USER_SOUND_COMPLETE,this));
      }
      
      override public function loadBackground() : void
      {
         startLoading();
         var _loc1_:URLVariables = _configManager.createURLVariables();
         var _loc2_:UtilURLStream = new UtilURLStream();
         _loc2_.addEventListener(Event.COMPLETE,this.loadBackground_completeHandler);
         _loc2_.addEventListener(ProgressEvent.PROGRESS,Console.getConsole().showProgress);
         _loc2_.addEventListener(UtilURLStream.TIME_OUT,common_errorHandler);
         _loc2_.addEventListener(IOErrorEvent.IO_ERROR,common_errorHandler);
         _loc2_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,common_errorHandler);
         _loc1_["count"] = BACKGROUND_PAGE_SIZE;
         _loc1_["page"] = _nextBackgroundPage;
         _loc1_["type"] = "bg";
         var _loc3_:URLRequest = new URLRequest(ServerConstants.ACTION_GET_USERASSETS);
         _loc3_.data = _loc1_;
         _loc3_.method = URLRequestMethod.POST;
         _loc2_.load(_loc3_);
      }
      
      private function loadBackground_completeHandler(param1:Event) : void
      {
         var _loc5_:XML = null;
         var _loc6_:ZipFile = null;
         var _loc7_:XMLList = null;
         var _loc8_:int = 0;
         var _loc9_:BackgroundThumb = null;
         var _loc10_:XML = null;
         var _loc11_:Theme = null;
         var _loc12_:int = 0;
         var _loc13_:ZipEntry = null;
         var _loc2_:UtilURLStream = UtilURLStream(param1.target);
         var _loc3_:ByteArray = new ByteArray();
         _loc2_.readBytes(_loc3_);
         _loc3_.position = 0;
         var _loc4_:int = _loc3_.readByte();
         if(_loc4_ == 0)
         {
            _loc6_ = new ZipFile(_loc3_);
            _loc5_ = new XML(_loc6_.getInput(_loc6_.getEntry("desc.xml")));
            if(checkXmlError(_loc5_))
            {
               return;
            }
            _hasMoreBackground = _loc5_.@moreBg == "1";
            _loc7_ = _loc5_.children();
            _loc8_ = _loc7_.length();
            _loc11_ = ThemeManager.instance.userTheme;
            _loc12_ = 0;
            while(_loc12_ < _loc8_)
            {
               _loc10_ = _loc7_[_loc12_];
               _loc9_ = new BackgroundThumb();
               _loc9_.deSerialize(_loc10_,_loc11_);
               _loc9_.editable = true;
               _loc13_ = _loc6_.getEntry(_loc9_.getFileName());
               if(_loc13_)
               {
                  _loc9_.imageData = _loc9_.thumbImageData = _loc6_.getInput(_loc13_);
               }
               _loc11_.addThumb(_loc9_);
               _backgroundCollection.addProduct(new ThumbModel(_loc9_));
               _loc12_++;
            }
            _nextBackgroundPage++;
            finishLoading();
            dispatchEvent(new CoreEvent(CoreEvent.USER_BACKGROUND_COMPLETE,this));
            return;
         }
         if(_loc4_ == ERROR_CHECK_BYTE)
         {
            errorMessageHandler(_loc3_);
            return;
         }
         displayErrorPopUp("");
         finishLoading();
      }
      
      override public function loadProp() : void
      {
         startLoading();
         var _loc1_:URLVariables = _configManager.createURLVariables();
         var _loc2_:UtilURLStream = new UtilURLStream();
         _loc2_.addEventListener(Event.COMPLETE,this.loadProp_completeHandler);
         _loc2_.addEventListener(ProgressEvent.PROGRESS,Console.getConsole().showProgress);
         _loc2_.addEventListener(UtilURLStream.TIME_OUT,common_errorHandler);
         _loc2_.addEventListener(IOErrorEvent.IO_ERROR,common_errorHandler);
         _loc2_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,common_errorHandler);
         _loc1_["count"] = PROP_PAGE_SIZE;
         _loc1_["page"] = _nextPropPage;
         _loc1_["type"] = "prop";
         var _loc3_:URLRequest = new URLRequest(ServerConstants.ACTION_GET_USER_ASSETS_XML);
         _loc3_.data = _loc1_;
         _loc3_.method = URLRequestMethod.POST;
         _loc2_.load(_loc3_);
      }
      
      private function loadProp_completeHandler(param1:Event) : void
      {
         var _loc8_:PropThumb = null;
         var _loc9_:XML = null;
         var _loc2_:UtilURLStream = UtilURLStream(param1.target);
         var _loc3_:ByteArray = new ByteArray();
         _loc2_.readBytes(_loc3_);
         _loc3_.position = 0;
         var _loc4_:int = _loc3_.readByte();
         if(_loc4_ == ERROR_CHECK_BYTE)
         {
            errorMessageHandler(_loc3_);
            return;
         }
         _loc3_.position = 0;
         var _loc5_:XML = new XML(_loc3_);
         if(checkXmlError(_loc5_))
         {
            return;
         }
         _hasMoreProp = _loc5_.@more == "1";
         var _loc6_:XMLList = _loc5_.children();
         var _loc7_:int = _loc6_.length();
         var _loc10_:Theme = ThemeManager.instance.userTheme;
         var _loc11_:int = 0;
         while(_loc11_ < _loc7_)
         {
            _loc9_ = _loc6_[_loc11_];
            _loc8_ = new PropThumb();
            _loc8_.deSerialize(_loc9_,_loc10_);
            _loc8_.xml = _loc9_;
            _loc8_.editable = true;
            _loc10_.addThumb(_loc8_);
            _propCollection.addProduct(new ThumbModel(_loc8_));
            _flowFrameImageCollection.addProduct(new ThumbModel(_loc8_,"",false));
            _loc11_++;
         }
         _nextPropPage++;
         finishLoading();
         dispatchEvent(new CoreEvent(CoreEvent.USER_PROP_COMPLETE,this));
      }
      
      override public function loadVideo() : void
      {
         startLoading();
         var _loc1_:URLVariables = _configManager.createURLVariables();
         var _loc2_:UtilURLStream = new UtilURLStream();
         _loc2_.addEventListener(Event.COMPLETE,this.loadVideo_completeHandler);
         _loc2_.addEventListener(ProgressEvent.PROGRESS,Console.getConsole().showProgress);
         _loc2_.addEventListener(UtilURLStream.TIME_OUT,common_errorHandler);
         _loc2_.addEventListener(IOErrorEvent.IO_ERROR,common_errorHandler);
         _loc2_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,common_errorHandler);
         _loc1_["count"] = VIDEO_PAGE_SIZE;
         _loc1_["page"] = _nextVideoPage;
         _loc1_["type"] = "prop";
         _loc1_["subtype"] = "video";
         var _loc3_:URLRequest = new URLRequest(ServerConstants.ACTION_GET_USERASSETS);
         _loc3_.data = _loc1_;
         _loc3_.method = URLRequestMethod.POST;
         _loc2_.load(_loc3_);
      }
      
      private function loadVideo_completeHandler(param1:Event) : void
      {
         var _loc5_:ZipFile = null;
         var _loc6_:XML = null;
         var _loc7_:XMLList = null;
         var _loc8_:int = 0;
         var _loc9_:VideoPropThumb = null;
         var _loc10_:XML = null;
         var _loc11_:Theme = null;
         var _loc12_:int = 0;
         var _loc13_:ZipEntry = null;
         var _loc2_:UtilURLStream = UtilURLStream(param1.target);
         var _loc3_:ByteArray = new ByteArray();
         _loc2_.readBytes(_loc3_);
         _loc3_.position = 0;
         var _loc4_:int = _loc3_.readByte();
         if(_loc4_ == 0)
         {
            _loc5_ = new ZipFile(_loc3_);
            _loc6_ = new XML(_loc5_.getInput(_loc5_.getEntry("desc.xml")));
            if(checkXmlError(_loc6_))
            {
               return;
            }
            _hasMoreVideo = _loc6_.@moreVideoProp == "1";
            _loc7_ = _loc6_.children();
            _loc8_ = _loc7_.length();
            _loc11_ = ThemeManager.instance.userTheme;
            _loc12_ = 0;
            while(_loc12_ < _loc8_)
            {
               _loc10_ = _loc7_[_loc12_];
               _loc9_ = new VideoPropThumb();
               _loc9_.deSerialize(_loc10_,_loc11_);
               _loc9_.xml = _loc10_;
               _loc9_.editable = true;
               _loc13_ = _loc5_.getEntry(_loc9_.getFileName());
               if(_loc13_)
               {
                  _loc9_.imageData = _loc5_.getInput(_loc13_);
               }
               _loc11_.addThumb(_loc9_,_loc10_);
               addVideoByThumb(_loc9_,true);
               _loc12_++;
            }
            _nextVideoPage++;
            finishLoading();
            dispatchEvent(new CoreEvent(CoreEvent.USER_VIDEO_COMPLETE,this));
            return;
         }
         if(_loc4_ == ERROR_CHECK_BYTE)
         {
            errorMessageHandler(_loc3_);
            return;
         }
         displayErrorPopUp("");
         finishLoading();
      }
      
      override public function loadStarter() : void
      {
         startLoading();
         var _loc1_:URLRequest = new URLRequest(ServerConstants.ACTION_GET_USERASSETS);
         var _loc2_:URLVariables = _configManager.createURLVariables();
         var _loc3_:UtilURLStream = new UtilURLStream();
         _loc3_.addEventListener(ProgressEvent.PROGRESS,Console.getConsole().showProgress);
         _loc3_.addEventListener(Event.COMPLETE,this.loadStarter_completeHandler);
         _loc3_.addEventListener(UtilURLStream.TIME_OUT,common_errorHandler);
         _loc3_.addEventListener(IOErrorEvent.IO_ERROR,common_errorHandler);
         _loc3_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,common_errorHandler);
         _loc2_["count"] = STARTER_PAGE_SIZE;
         _loc2_["page"] = _nextStarterPage;
         _loc2_["type"] = "movie";
         _loc1_.method = URLRequestMethod.POST;
         _loc1_.data = _loc2_;
         _loc3_.load(_loc1_);
      }
      
      private function loadStarter_completeHandler(param1:Event) : void
      {
         var _loc5_:ZipFile = null;
         var _loc6_:XML = null;
         var _loc7_:XMLList = null;
         var _loc8_:int = 0;
         var _loc9_:BackgroundThumb = null;
         var _loc10_:XML = null;
         var _loc11_:Theme = null;
         var _loc12_:int = 0;
         var _loc13_:ZipEntry = null;
         var _loc14_:ThumbModel = null;
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.loadStarter_completeHandler);
         var _loc2_:UtilURLStream = UtilURLStream(param1.target);
         var _loc3_:ByteArray = new ByteArray();
         _loc2_.readBytes(_loc3_);
         _loc3_.position = 0;
         var _loc4_:int = _loc3_.readByte();
         if(_loc4_ == 0)
         {
            _loc5_ = new ZipFile(_loc3_);
            _loc6_ = new XML(_loc5_.getInput(_loc5_.getEntry("desc.xml")));
            if(checkXmlError(_loc6_))
            {
               return;
            }
            _hasMoreStarter = _loc6_.@moreMovie == "1";
            _loc7_ = _loc6_.children();
            _loc8_ = _loc7_.length();
            _loc11_ = ThemeManager.instance.userTheme;
            _loc12_ = 0;
            while(_loc12_ < _loc8_)
            {
               _loc10_ = _loc7_[_loc12_];
               _loc9_ = new BackgroundThumb();
               _loc9_.deserializeStarter(_loc10_,_loc11_);
               _loc9_.editable = true;
               _loc13_ = _loc5_.getEntry(_loc9_.getFileName());
               if(_loc13_)
               {
                  _loc9_.imageData = _loc9_.thumbImageData = _loc5_.getInput(_loc13_);
               }
               if(!_starterLookup[_loc9_.id])
               {
                  _loc14_ = new ThumbModel(_loc9_);
                  _starterLookup[_loc9_.id] = _loc14_;
                  _loc11_.addThumb(_loc9_);
                  _backgroundCollection.addStarter(_loc14_);
               }
               _loc12_++;
            }
            _nextStarterPage++;
            finishLoading();
            dispatchEvent(new CoreEvent(CoreEvent.USER_STARTER_COMPLETE,this));
            return;
         }
         if(_loc4_ == ERROR_CHECK_BYTE)
         {
            errorMessageHandler(_loc3_);
            return;
         }
         displayErrorPopUp("");
         finishLoading();
      }
   }
}
