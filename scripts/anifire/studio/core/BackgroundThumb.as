package anifire.studio.core
{
   import anifire.constant.ProductConstants;
   import anifire.constant.ResponseConstants;
   import anifire.constant.ServerConstants;
   import anifire.event.CoreEvent;
   import anifire.event.ServerRequestEvent;
   import anifire.studio.managers.ImageDataManager;
   import anifire.studio.managers.SearchManager;
   import anifire.studio.managers.ThemeManager;
   import anifire.studio.managers.ThemeStarterManager;
   import anifire.util.ApiRequest;
   import anifire.util.UtilCrypto;
   import anifire.util.UtilDict;
   import anifire.util.UtilNetwork;
   import anifire.util.UtilURLStream;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.net.URLRequest;
   import flash.net.URLStream;
   import flash.utils.ByteArray;
   
   public class BackgroundThumb extends Thumb
   {
      
      public static const XML_NODE_NAME:String = "background";
      
      public static const XML_NODE_NAME_CBG:String = "compositebg";
      
      public static const XML_ATTRIBUTE_NAME_STARTER_ITEM_REF:String = "itemRef";
      
      public static const XML_NODE_NAME_STARTER:String = "starter";
      
      public static const XML_ATTRIBUTE_NAME_HIDE_IN_TUTORIAL:String = "notut";
      
      public static const STARTER_UNIQUE_ID_PREFIX:String = "starter.";
      
      public static const STARTER_DRAG_DATA_FORMAT:String = "StarterThumb";
      
      public static const CATEGORY_TAG_PREFIX:String = "cat:";
      
      public static const TAG_CATEGORY_PATTERN:RegExp = /^cat:(.+)$/;
       
      
      private var _isComposite:Boolean;
      
      public var sortOrder:int;
      
      protected var _backgroundThumbnailUrl:String;
      
      protected var _starterId:String;
      
      protected var _isStarter:Boolean;
      
      protected var _isThemeStarter:Boolean;
      
      protected var _numScenes:int;
      
      protected var _starterContent:XML;
      
      protected var _starterThumbnailUrl:String;
      
      protected var _category:String;
      
      protected var _starterCategories:Array;
      
      protected var _starterSubCategory:String;
      
      private var _shouldBeHiddenInTutorial:Boolean;
      
      protected var _itemRef:String;
      
      public function BackgroundThumb()
      {
         super();
      }
      
      public function get starterSubCategory() : String
      {
         return this._starterSubCategory;
      }
      
      public function get starterContent() : XML
      {
         return this._starterContent;
      }
      
      public function set starterContent(param1:XML) : void
      {
         if(this._starterContent != param1)
         {
            this._starterContent = param1;
         }
      }
      
      public function get numScenes() : int
      {
         return this._numScenes;
      }
      
      public function set isComposite(param1:Boolean) : void
      {
         this._isComposite = param1;
      }
      
      public function get isComposite() : Boolean
      {
         return this._isComposite;
      }
      
      override public function get isStarter() : Boolean
      {
         return this._isStarter;
      }
      
      public function get isThemeStarter() : Boolean
      {
         return this._isThemeStarter;
      }
      
      public function get isPlainBackdrop() : Boolean
      {
         return !this.isStarter && !this.isComposite && !this.isThemeStarter;
      }
      
      public function get defaultBackgroundOrderValue() : int
      {
         if(this.isStarter)
         {
            return 3;
         }
         if(this.isComposite)
         {
            return 2;
         }
         return 1;
      }
      
      public function get starterId() : String
      {
         return this._starterId;
      }
      
      public function get category() : String
      {
         return this._category;
      }
      
      public function get starterCategories() : Array
      {
         return this._starterCategories;
      }
      
      override public function deSerialize(param1:XML, param2:Theme) : void
      {
         var _loc3_:String = null;
         var _loc4_:XML = null;
         var _loc5_:int = 0;
         var _loc7_:XML = null;
         var _loc8_:String = null;
         var _loc10_:uint = 0;
         var _loc11_:String = null;
         var _loc12_:Array = null;
         this.thumbId = param1.@thumb != undefined?param1.@thumb:param1.@id;
         if(this._isComposite)
         {
            this.xml = param1;
            if(param1.bg[0])
            {
               _loc3_ = param1.bg[0].file;
               this.setFileName(_loc3_);
            }
         }
         else
         {
            _loc3_ = this.thumbId;
            this.setFileName("bg/" + _loc3_);
         }
         this.id = param1.@id;
         this.aid = param1.@aid;
         this.encAssetId = param1.@enc_asset_id;
         this.name = UtilDict.toDisplay("store",param1.@name);
         this.theme = param2;
         this._backgroundThumbnailUrl = param1.@asset_url;
         this.enable = param1.@enable != "N";
         if(Console.getConsole().excludedIds.containsKey(this.aid))
         {
            this.enable = false;
         }
         if(this.theme.id == "ugc")
         {
            this.tags = param1.tags;
            this.isPublished = param1.@published == "1";
         }
         var _loc6_:int = param1.colorset.length();
         _loc5_ = 0;
         while(_loc5_ < _loc6_)
         {
            _loc4_ = param1.colorset[_loc5_];
            colorRef.push(_loc4_.@aid,_loc4_);
            _loc5_++;
         }
         _loc6_ = param1.c_parts.c_area.length();
         _loc5_ = 0;
         while(_loc5_ < _loc6_)
         {
            _loc7_ = param1.c_parts.c_area[_loc5_];
            if(param1.c_parts.@enable != "N")
            {
               colorParts.push(_loc7_,_loc7_.attribute("oc").length() == 0?uint.MAX_VALUE:_loc7_.@oc);
            }
            _loc5_++;
         }
         _defaultColor = {};
         _loc6_ = param1.color.length();
         _loc5_ = 0;
         while(_loc5_ < _loc6_)
         {
            _loc10_ = uint("0x" + String(param1.color[_loc5_]));
            _loc11_ = param1.color[_loc5_].@r;
            if(_loc11_ && _loc11_.length > 0)
            {
               _defaultColor[_loc11_] = _loc10_;
            }
            _loc5_++;
         }
         var _loc9_:XMLList = param1.tag;
         _loc6_ = _loc9_.length();
         _loc5_ = 0;
         while(_loc5_ < _loc6_)
         {
            _loc8_ = _loc9_[_loc5_];
            sysTags.push(_loc8_);
            if(ThemeManager.instance.supportSearchSuggestion(theme.id))
            {
               SearchManager.instance.addAssetTag(themeId,!!this.xml?ProductConstants.PRODUCT_TYPE_TEMPLATE:ProductConstants.PRODUCT_TYPE_BACKGROUND,_loc8_,this.aid);
            }
            _loc12_ = TAG_CATEGORY_PATTERN.exec(_loc8_);
            if(_loc12_)
            {
               this._category = _loc12_[1];
            }
            _loc5_++;
         }
         sysTags.push(this.name);
         sysTags.push(this.fileName);
         if(param1.hasOwnProperty("@category"))
         {
            this._category = param1.@category;
         }
      }
      
      private function createStarterUniqueId(param1:String) : void
      {
         this._starterId = param1;
         this.aid = this._starterId;
         this.id = STARTER_UNIQUE_ID_PREFIX + this._starterId;
      }
      
      public function deserializeStarter(param1:XML, param2:Theme) : void
      {
         this._isStarter = true;
         this.createStarterUniqueId(param1.@id);
         this._numScenes = param1.@numScene;
         this.encAssetId = param1.@enc_asset_id;
         this.name = param1.@title;
         this.theme = param2;
         this._starterThumbnailUrl = param1.@thumbnail;
         if(this._starterThumbnailUrl == null || this._starterThumbnailUrl == "")
         {
            this._starterThumbnailUrl = param1.@thumbnail_url;
         }
         if(this.theme.id == "ugc")
         {
            this.setFileName(param1.@path);
         }
         this.tags = param1.tags;
         this._starterCategories = [];
         var _loc3_:XMLList = param1.child("category-list");
         var _loc4_:XMLList = _loc3_.child("category");
         var _loc5_:int = _loc4_.length();
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            this._starterCategories.push(_loc4_[_loc6_].toString());
            _loc6_++;
         }
         var _loc7_:XMLList = _loc3_.child("subcat");
         if(_loc7_ && _loc7_[0])
         {
            this._starterSubCategory = _loc7_[0].toString();
         }
         this._isThemeStarter = param1.film.length() != 0;
         if(this._isThemeStarter)
         {
            this._starterContent = new XML(param1.film);
            ThemeStarterManager.instance.addThemeStarter(this._starterId,this.name,this._starterThumbnailUrl);
         }
         if(param1.hasOwnProperty("@" + XML_ATTRIBUTE_NAME_HIDE_IN_TUTORIAL))
         {
            this._shouldBeHiddenInTutorial = String(param1.attribute(XML_ATTRIBUTE_NAME_HIDE_IN_TUTORIAL)[0]) == "1";
         }
         if(param1.hasOwnProperty("@" + XML_ATTRIBUTE_NAME_STARTER_ITEM_REF))
         {
            this._itemRef = String(param1.attribute(XML_ATTRIBUTE_NAME_STARTER_ITEM_REF)[0]);
         }
      }
      
      public function createUserStarterThumb(param1:String, param2:Theme, param3:int) : void
      {
         this._isStarter = true;
         this.createStarterUniqueId(param1);
         this.theme = param2;
         this._numScenes = param3;
         this.enable = true;
         this.loadStarterEncAssetId(param1);
      }
      
      override public function isThumbReady(param1:String = "") : Boolean
      {
         return this.imageData != null;
      }
      
      override public function loadImageData() : void
      {
         var _loc2_:URLRequest = null;
         var _loc3_:UtilURLStream = null;
         var _loc1_:Object = ImageDataManager.instance.getImageData("background",themeId,id);
         if(_loc1_)
         {
            imageData = _loc1_;
            dispatchEvent(new CoreEvent(CoreEvent.LOAD_THUMB_COMPLETE,this));
         }
         else
         {
            if(this._isStarter)
            {
               _loc2_ = new URLRequest(this._starterThumbnailUrl);
            }
            else if(this._backgroundThumbnailUrl)
            {
               _loc2_ = new URLRequest(this._backgroundThumbnailUrl);
            }
            else
            {
               _loc2_ = UtilNetwork.getGetThemeAssetRequest(theme.id,thumbId,ServerConstants.PARAM_BG);
            }
            _loc3_ = new UtilURLStream();
            _loc3_.addEventListener(Event.COMPLETE,this.loadImageDataComplete);
            _loc3_.addEventListener(IOErrorEvent.IO_ERROR,this.ioErrorHandler);
            if(_loc2_)
            {
               _loc3_.load(_loc2_);
            }
         }
      }
      
      private function ioErrorHandler(param1:IOErrorEvent) : void
      {
         param1.stopImmediatePropagation();
         this.removeLoadImageListeners(param1 as IEventDispatcher);
      }
      
      override public function loadImageDataComplete(param1:Event) : void
      {
         var _loc5_:UtilCrypto = null;
         this.removeLoadImageListeners(param1 as IEventDispatcher);
         var _loc2_:URLStream = URLStream(param1.target);
         var _loc3_:ByteArray = new ByteArray();
         _loc2_.readBytes(_loc3_,0,_loc2_.bytesAvailable);
         var _loc4_:ByteArray = _loc3_;
         if(!this._isStarter && !this._isComposite && theme.id != "ugc")
         {
            _loc5_ = new UtilCrypto();
            _loc5_.decrypt(_loc4_);
         }
         this.thumbImageData = this.imageData = _loc4_;
         ImageDataManager.instance.setImageData("background",themeId,aid,_loc4_);
         this.dispatchEvent(new CoreEvent(CoreEvent.LOAD_THUMB_COMPLETE,this));
      }
      
      private function removeLoadImageListeners(param1:IEventDispatcher) : void
      {
         if(param1)
         {
            param1.removeEventListener(Event.COMPLETE,this.loadImageDataComplete);
            param1.removeEventListener(IOErrorEvent.IO_ERROR,this.ioErrorHandler);
         }
      }
      
      public function get is16to9() : Boolean
      {
         return true;
      }
      
      override public function toString() : String
      {
         return super.toString() + "\n" + this.id;
      }
      
      override public function get searchKey() : String
      {
         if(this._isStarter)
         {
            return this.itemRef;
         }
         return super.searchKey;
      }
      
      public function get shouldBeHiddenInTutorial() : Boolean
      {
         return this._shouldBeHiddenInTutorial;
      }
      
      public function get itemRef() : String
      {
         return !!this._itemRef?this._itemRef:this.id;
      }
      
      private function loadStarterEncAssetId(param1:String) : void
      {
         var _loc2_:ApiRequest = new ApiRequest();
         _loc2_.addEventListener(ServerRequestEvent.COMPLETE,this.loadStarterEncAssetId_completeHandler);
         _loc2_.addEventListener(ServerRequestEvent.FAIL,this.loadStarterEncAssetId_failHandler);
         var _loc3_:Object = {};
         _loc3_[ResponseConstants.ASSET_STARTER_ID] = param1;
         _loc2_.post(ServerConstants.ACTION_GET_ASSET_V2,_loc3_);
      }
      
      private function loadStarterEncAssetId_completeHandler(param1:ServerRequestEvent) : void
      {
         IEventDispatcher(param1.target).removeEventListener(ServerRequestEvent.COMPLETE,this.loadStarterEncAssetId_completeHandler);
         IEventDispatcher(param1.target).removeEventListener(ServerRequestEvent.FAIL,this.loadStarterEncAssetId_failHandler);
         this.encAssetId = param1.data["enc_asset_id"];
      }
      
      private function loadStarterEncAssetId_failHandler(param1:ServerRequestEvent) : void
      {
         IEventDispatcher(param1.target).removeEventListener(ServerRequestEvent.COMPLETE,this.loadStarterEncAssetId_completeHandler);
         IEventDispatcher(param1.target).removeEventListener(ServerRequestEvent.FAIL,this.loadStarterEncAssetId_failHandler);
      }
   }
}
