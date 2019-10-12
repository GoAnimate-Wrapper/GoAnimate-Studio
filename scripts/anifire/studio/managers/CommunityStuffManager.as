package anifire.studio.managers
{
   import anifire.constant.AnimeConstants;
   import anifire.constant.CcLibConstant;
   import anifire.constant.ServerConstants;
   import anifire.event.CoreEvent;
   import anifire.managers.AppConfigManager;
   import anifire.studio.core.CharThumb;
   import anifire.studio.core.Console;
   import anifire.studio.core.Theme;
   import anifire.studio.core.Thumb;
   import anifire.studio.models.ThumbModel;
   import anifire.studio.utils.UtilHashThumb;
   import anifire.util.UtilPlain;
   import anifire.util.UtilURLStream;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLStream;
   import flash.net.URLVariables;
   import flash.utils.ByteArray;
   import mx.collections.ArrayCollection;
   import mx.controls.Alert;
   import nochump.util.zip.ZipEntry;
   import nochump.util.zip.ZipFile;
   
   public class CommunityStuffManager extends EventDispatcher
   {
      
      private static var _instance:CommunityStuffManager;
      
      private static const PROP_PAGE_SIZE:int = 100;
      
      private static const BACKGROUND_PAGE_SIZE:int = 50;
      
      private static const CHARACTER_PAGE_SIZE:int = 50;
      
      private static const SEARCH_RESULT_PAGE_SIZE:int = 100;
       
      
      private var _nextCommunityCharPage:int = 0;
      
      private var _nextCommunityBgPage:int = 0;
      
      private var _nextCommunityPropPage:int = 0;
      
      private var _hasMoreCommunityBg:Boolean = true;
      
      private var _hasMoreCommunityProp:Boolean = true;
      
      private var _hasMoreCommunityChar:Boolean = true;
      
      private var _loadingType:String = "prop";
      
      private var _isLoading:Boolean = false;
      
      private var _hasMoreSearch:Boolean = true;
      
      private var _currentSearchPage:int = 0;
      
      private var _currentSearchType:String = "prop";
      
      private var _isSearching:Boolean = false;
      
      private var _characterSource:ArrayCollection;
      
      private var _characterLookup:Object;
      
      private var _propSource:ArrayCollection;
      
      private var _propLookup:Object;
      
      private var _backgroundSource:ArrayCollection;
      
      private var _backgroundLookup:Object;
      
      private var _searchResults:ArrayCollection;
      
      private var _lastLoadedTheme:Theme;
      
      private var _searchTheme:Theme;
      
      private var _themeManager:ThemeManager;
      
      private var _configManager:AppConfigManager;
      
      private var _zipFile:ZipFile;
      
      private var _xml:XML;
      
      public function CommunityStuffManager()
      {
         super();
         this._themeManager = ThemeManager.instance;
         this._configManager = AppConfigManager.instance;
         this._characterSource = new ArrayCollection();
         this._characterLookup = {};
         this._propSource = new ArrayCollection();
         this._propLookup = {};
         this._backgroundSource = new ArrayCollection();
         this._backgroundLookup = {};
         this._searchResults = new ArrayCollection();
         this._lastLoadedTheme = new Theme();
         this._lastLoadedTheme.id = "CommunityManagerLastLoadedTheme";
         this._lastLoadedTheme.addEventListener(CoreEvent.DESERIALIZE_THEME_COMPLETE,this.onAssetDataReady);
         this._searchTheme = new Theme();
         this._searchTheme.id = "CommunityManagerSearchTheme";
         this._searchTheme.addEventListener(CoreEvent.DESERIALIZE_THEME_COMPLETE,this.onSearchDataReady);
      }
      
      public static function get instance() : CommunityStuffManager
      {
         if(_instance == null)
         {
            _instance = new CommunityStuffManager();
         }
         return _instance;
      }
      
      [Bindable(event="load_community_asset_complete")]
      public function get characterSource() : ArrayCollection
      {
         return this._characterSource;
      }
      
      [Bindable(event="load_community_asset_complete")]
      public function get propSource() : ArrayCollection
      {
         return this._propSource;
      }
      
      [Bindable(event="load_community_asset_complete")]
      public function get backgroundSource() : ArrayCollection
      {
         return this._backgroundSource;
      }
      
      [Bindable(event="communitySearchDataReady")]
      public function get searchResults() : ArrayCollection
      {
         return this._searchResults;
      }
      
      public function get hasMoreCommunityBg() : Boolean
      {
         return this._hasMoreCommunityBg;
      }
      
      public function get hasMoreCommunityProp() : Boolean
      {
         return this._hasMoreCommunityProp;
      }
      
      public function get hasMoreCommunityChar() : Boolean
      {
         return this._hasMoreCommunityChar;
      }
      
      public function get isSearching() : Boolean
      {
         return this._isSearching;
      }
      
      public function loadStuff(param1:String = "prop") : void
      {
         var _loc3_:URLRequest = null;
         if(this._isLoading)
         {
            return;
         }
         switch(param1)
         {
            case AnimeConstants.ASSET_TYPE_PROP:
               if(this._hasMoreCommunityProp == false)
               {
                  return;
               }
               break;
            case AnimeConstants.ASSET_TYPE_CHAR:
               if(this._hasMoreCommunityChar == false)
               {
                  return;
               }
               break;
            case AnimeConstants.ASSET_TYPE_BG:
               if(this._hasMoreCommunityBg == false)
               {
                  return;
               }
               break;
         }
         this._isLoading = true;
         this._loadingType = param1;
         Console.getConsole().requestLoadStatus(true);
         var _loc2_:URLVariables = this._configManager.createURLVariables();
         _loc3_ = new URLRequest(ServerConstants.ACTION_GET_COMMUNITYASSETS);
         _loc2_["type"] = this._loadingType;
         if(this._loadingType == AnimeConstants.ASSET_TYPE_CHAR)
         {
            _loc2_["count"] = CHARACTER_PAGE_SIZE;
            _loc2_["page"] = this._nextCommunityCharPage;
         }
         else if(this._loadingType == AnimeConstants.ASSET_TYPE_BG)
         {
            _loc2_["count"] = BACKGROUND_PAGE_SIZE;
            _loc2_["page"] = this._nextCommunityBgPage;
         }
         else if(this._loadingType == AnimeConstants.ASSET_TYPE_PROP)
         {
            _loc2_["count"] = PROP_PAGE_SIZE;
            _loc2_["page"] = this._nextCommunityPropPage;
            _loc2_["subtype"] = "";
         }
         _loc3_.method = URLRequestMethod.POST;
         _loc3_.data = _loc2_;
         Console.getConsole().loadProgress = 0;
         var _loc4_:UtilURLStream = new UtilURLStream();
         _loc4_.addEventListener(ProgressEvent.PROGRESS,Console.getConsole().showProgress);
         _loc4_.addEventListener(Event.COMPLETE,this.onLoadAssetComplete);
         _loc4_.addEventListener(UtilURLStream.TIME_OUT,this.loadUserThemeTimeOutHandler);
         _loc4_.addEventListener(IOErrorEvent.IO_ERROR,this.loadUserThemeIOErrorHandler);
         _loc4_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.loadUserThemeSecurityErrorHandler);
         _loc4_.load(_loc3_);
      }
      
      private function onLoadAssetComplete(param1:Event) : void
      {
         var _loc5_:ByteArray = null;
         var _loc2_:UtilURLStream = UtilURLStream(param1.target);
         var _loc3_:ByteArray = new ByteArray();
         _loc2_.readBytes(_loc3_);
         _loc3_.position = 0;
         var _loc4_:int = _loc3_.readByte();
         if(_loc4_ == 0)
         {
            if(_loc4_ != 0)
            {
               _loc3_.position = 0;
            }
            this._zipFile = new ZipFile(_loc3_);
            this._xml = new XML(this._zipFile.getInput(this._zipFile.getEntry("desc.xml")));
            this._lastLoadedTheme.clearAllThumbs();
            this._lastLoadedTheme.deSerialize(this._xml);
         }
         else
         {
            _loc5_ = new ByteArray();
            _loc2_.readBytes(_loc5_);
            Alert.show("getUserAssets failed: \n" + _loc5_.toString());
            this._isLoading = false;
            Console.getConsole().loadProgressVisible = false;
            Console.getConsole().requestLoadStatus(false);
            dispatchEvent(new CoreEvent(CoreEvent.LOAD_COMMUNITY_ASSET_COMPLETE,this));
         }
      }
      
      private function onAssetDataReady(param1:Event) : void
      {
         var _loc2_:Thumb = null;
         var _loc3_:ZipEntry = null;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:CharThumb = null;
         var _loc15_:ByteArray = null;
         var _loc16_:ZipFile = null;
         var _loc17_:XML = null;
         var _loc18_:ZipEntry = null;
         var _loc19_:ByteArray = null;
         var _loc20_:ZipEntry = null;
         var _loc21_:ZipFile = null;
         var _loc22_:int = 0;
         var _loc23_:ZipEntry = null;
         var _loc4_:UtilHashThumb = this._lastLoadedTheme.backgroundThumbs;
         var _loc5_:UtilHashThumb = this._lastLoadedTheme.propThumbs;
         var _loc6_:UtilHashThumb = this._lastLoadedTheme.charThumbs;
         var _loc7_:ZipFile = this._zipFile;
         var _loc8_:XML = this._xml;
         var _loc9_:* = _loc8_.@moreBg == "1";
         var _loc10_:* = _loc8_.@moreProp == "1";
         var _loc11_:* = _loc8_.@moreChar == "1";
         _loc13_ = _loc4_.length;
         _loc12_ = 0;
         while(_loc12_ < _loc13_)
         {
            _loc2_ = _loc4_.getValueByIndex(_loc12_) as Thumb;
            _loc3_ = _loc7_.getEntry(_loc2_.getFileName());
            if(_loc3_)
            {
               _loc2_.imageData = _loc7_.getInput(_loc3_);
               _loc2_.thumbImageData = _loc7_.getInput(_loc3_);
            }
            this.addBackground(_loc2_);
            _loc12_++;
         }
         _loc13_ = _loc5_.length;
         _loc12_ = 0;
         while(_loc12_ < _loc13_)
         {
            _loc2_ = _loc5_.getValueByIndex(_loc12_) as Thumb;
            _loc3_ = _loc7_.getEntry(_loc2_.getFileName());
            if(_loc3_)
            {
               _loc2_.imageData = _loc7_.getInput(_loc3_);
            }
            if(_loc2_.enable)
            {
               this.addProp(_loc2_);
            }
            _loc12_++;
         }
         _loc13_ = _loc6_.length;
         _loc12_ = 0;
         while(_loc12_ < _loc13_)
         {
            _loc14_ = _loc6_.getValueByIndex(_loc12_) as CharThumb;
            _loc3_ = _loc7_.getEntry(_loc14_.getFileName());
            if(_loc3_)
            {
               if(!_loc14_.isCC)
               {
                  _loc14_.imageData = _loc7_.getInput(_loc3_);
               }
               else if(_loc14_.getFileName().indexOf("zip") >= 0)
               {
                  _loc15_ = _loc7_.getInput(_loc3_);
                  _loc16_ = new ZipFile(_loc15_);
                  _loc14_.imageData = UtilPlain.convertZipAsImagedataObject(_loc16_);
                  _loc18_ = _loc7_.getEntry("char/" + _loc2_.id + "/" + CcLibConstant.NODE_LIBRARY + ".zip");
                  if(_loc18_ != null)
                  {
                     _loc19_ = _loc7_.getInput(_loc18_) as ByteArray;
                     _loc21_ = new ZipFile(_loc19_);
                     _loc22_ = 0;
                     while(_loc22_ < _loc21_.size)
                     {
                        _loc20_ = _loc21_.entries[_loc22_];
                        _loc14_.addLibrary(_loc20_.name,_loc21_.getInput(_loc20_));
                        _loc22_++;
                     }
                  }
               }
            }
            else
            {
               _loc23_ = _loc7_.getEntry("char/" + _loc14_.id + "/" + _loc14_.id + ".png");
               _loc14_.imageData = _loc7_.getInput(_loc23_);
               _loc14_.useImageAsThumb = true;
            }
            this.addCharacter(_loc14_);
            _loc12_++;
         }
         if(this._loadingType == AnimeConstants.ASSET_TYPE_BG)
         {
            this._hasMoreCommunityBg = _loc9_;
            this._nextCommunityBgPage++;
         }
         else if(this._loadingType == AnimeConstants.ASSET_TYPE_PROP)
         {
            this._hasMoreCommunityProp = _loc10_;
            this._nextCommunityPropPage++;
         }
         else if(this._loadingType == AnimeConstants.ASSET_TYPE_CHAR)
         {
            this._hasMoreCommunityChar = _loc11_;
            this._nextCommunityCharPage++;
         }
         this._isLoading = false;
         Console.getConsole().loadProgressVisible = false;
         Console.getConsole().requestLoadStatus(false);
         dispatchEvent(new CoreEvent(CoreEvent.LOAD_COMMUNITY_ASSET_COMPLETE,this));
      }
      
      private function addCharacter(param1:Thumb) : void
      {
         var _loc2_:ThumbModel = new ThumbModel(param1);
         if(!this._characterLookup[param1.id])
         {
            this._characterLookup[param1.id] = _loc2_;
            this._characterSource.addItem(_loc2_);
         }
         this._themeManager.communityTheme.addThumb(param1);
      }
      
      private function addProp(param1:Thumb) : void
      {
         var _loc2_:ThumbModel = new ThumbModel(param1);
         if(!this._propLookup[param1.id])
         {
            this._propLookup[param1.id] = _loc2_;
            this._propSource.addItem(_loc2_);
         }
         this._themeManager.communityTheme.addThumb(param1);
      }
      
      private function addBackground(param1:Thumb) : void
      {
         var _loc2_:ThumbModel = new ThumbModel(param1);
         if(!this._backgroundLookup[param1.id])
         {
            this._backgroundLookup[param1.id] = _loc2_;
            this._backgroundSource.addItem(_loc2_);
         }
         this._themeManager.communityTheme.addThumb(param1);
      }
      
      private function loadUserThemeIOErrorHandler(param1:IOErrorEvent) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.loadUserThemeIOErrorHandler);
         this._isLoading = false;
         Console.getConsole().loadProgressVisible = false;
         Console.getConsole().requestLoadStatus(false);
         Alert.show("Error in loading user theme",param1.type);
      }
      
      private function loadUserThemeSecurityErrorHandler(param1:SecurityErrorEvent) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.loadUserThemeSecurityErrorHandler);
         this._isLoading = false;
         Console.getConsole().loadProgressVisible = false;
         Console.getConsole().requestLoadStatus(false);
         Alert.show("Error in loading user theme",param1.type);
      }
      
      private function loadUserThemeTimeOutHandler(param1:Event) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.loadUserThemeTimeOutHandler);
         this._isLoading = false;
         Console.getConsole().loadProgressVisible = false;
         Console.getConsole().requestLoadStatus(false);
         Alert.show("Operation timeout");
      }
      
      public function searchStuff(param1:String, param2:String = null, param3:Boolean = false) : void
      {
         if(this._isSearching)
         {
            return;
         }
         if(param3)
         {
            this._currentSearchPage = 0;
            this._hasMoreSearch = true;
         }
         if(this._hasMoreSearch == false)
         {
            return;
         }
         if(param2)
         {
            this._currentSearchType = param2;
         }
         this._isSearching = true;
         this._searchResults.source = [];
         Console.getConsole().requestLoadStatus(true);
         var _loc4_:URLVariables = this._configManager.createURLVariables();
         _loc4_["type"] = this._currentSearchType;
         _loc4_["keywords"] = param1;
         _loc4_["page"] = this._currentSearchPage++;
         _loc4_["count"] = SEARCH_RESULT_PAGE_SIZE;
         var _loc5_:URLRequest = new URLRequest(ServerConstants.ACTION_SEARCH_ASSET);
         _loc5_.method = URLRequestMethod.POST;
         _loc5_.data = _loc4_;
         var _loc6_:URLStream = new URLStream();
         _loc6_.addEventListener(Event.COMPLETE,this.onSearchComplete);
         _loc6_.addEventListener(ProgressEvent.PROGRESS,Console.getConsole().showProgress);
         _loc6_.load(_loc5_);
      }
      
      private function onSearchComplete(param1:Event) : void
      {
         var _loc2_:URLStream = URLStream(param1.target);
         var _loc3_:int = _loc2_.readByte();
         if(_loc3_ == 0)
         {
            this._zipFile = new ZipFile(_loc2_);
            this._xml = new XML(this._zipFile.getInput(this._zipFile.getEntry("desc.xml")));
            switch(this._currentSearchType)
            {
               case AnimeConstants.ASSET_TYPE_BG:
                  this._hasMoreSearch = this._xml.@moreBg == "1";
                  break;
               case AnimeConstants.ASSET_TYPE_PROP:
                  this._hasMoreSearch = this._xml.@moreProp == "1";
                  break;
               default:
                  this._hasMoreSearch = false;
            }
            this._searchTheme.clearAllThumbs();
            this._searchTheme.deSerialize(this._xml);
            dispatchEvent(new CoreEvent(CoreEvent.COMMUNITY_SEARCH_COMPLETE,this,this._xml.@all_asset_count));
         }
         else
         {
            Alert.show("Error: fail to search community library!");
            Console.getConsole().loadProgressVisible = false;
            Console.getConsole().requestLoadStatus(false);
            this._isSearching = false;
         }
      }
      
      private function onSearchDataReady(param1:Event) : void
      {
         var _loc6_:Thumb = null;
         var _loc7_:ZipEntry = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc2_:ZipFile = this._zipFile;
         var _loc3_:UtilHashThumb = this._searchTheme.backgroundThumbs;
         var _loc4_:UtilHashThumb = this._searchTheme.propThumbs;
         var _loc5_:UtilHashThumb = this._searchTheme.charThumbs;
         _loc9_ = _loc3_.length;
         _loc8_ = 0;
         while(_loc8_ < _loc9_)
         {
            _loc6_ = _loc3_.getValueByIndex(_loc8_) as Thumb;
            _loc7_ = _loc2_.getEntry(_loc6_.getFileName());
            if(_loc7_)
            {
               _loc6_.imageData = _loc2_.getInput(_loc7_);
               _loc6_.thumbImageData = _loc2_.getInput(_loc7_);
            }
            this._searchResults.addItem(_loc6_);
            _loc8_++;
         }
         _loc9_ = _loc4_.length;
         _loc8_ = 0;
         while(_loc8_ < _loc9_)
         {
            _loc6_ = _loc4_.getValueByIndex(_loc8_) as Thumb;
            _loc7_ = _loc2_.getEntry(_loc6_.getFileName());
            if(_loc7_)
            {
               _loc6_.imageData = _loc2_.getInput(_loc7_);
            }
            this._searchResults.addItem(_loc6_);
            _loc8_++;
         }
         _loc9_ = _loc5_.length;
         _loc8_ = 0;
         while(_loc8_ < _loc9_)
         {
            _loc6_ = _loc5_.getValueByIndex(_loc8_) as Thumb;
            _loc7_ = _loc2_.getEntry(_loc6_.getFileName());
            if(_loc7_)
            {
               _loc6_.imageData = _loc2_.getInput(_loc7_);
            }
            this._searchResults.addItem(_loc6_);
            _loc8_++;
         }
         Console.getConsole().loadProgressVisible = false;
         Console.getConsole().requestLoadStatus(false);
         this._isSearching = false;
         dispatchEvent(new CoreEvent(CoreEvent.COMMUNITY_SEARCH_DATA_READY,this));
      }
   }
}
