package anifire.studio.core
{
   import anifire.color.SelectedColor;
   import anifire.constant.RaceConstants;
   import anifire.constant.ThemeConstants;
   import anifire.interfaces.IBehavior;
   import anifire.util.UtilHashArray;
   import anifire.util.UtilHashSelectedColor;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   public class Thumb extends EventDispatcher
   {
      
      public static const DRAG_DATA_FORMAT:String = "thumb";
       
      
      private var _id:String;
      
      private var _aid:String;
      
      private var _encAssetId:String;
      
      protected var _thumbId:String;
      
      private var _name:String;
      
      private var _tags:String;
      
      private var _isPublished:Boolean;
      
      private var _imageData:Object;
      
      protected var _imageFileName:String;
      
      protected var _theme:Theme;
      
      private var _enable:Boolean = true;
      
      private var _thumbImageData:Object;
      
      private var _colorRef:UtilHashArray;
      
      private var _colorParts:UtilHashArray;
      
      private var _raceCode:int = 0;
      
      private var _encryptId:String;
      
      private var _useImageDataAsThumbnail:Boolean = false;
      
      private var _imageObject:DisplayObject = null;
      
      private var _themeId:String = null;
      
      private var _defAction:IBehavior;
      
      private var _path:String;
      
      protected var _sysTags:Array;
      
      private var _showFav:Boolean = false;
      
      private var _sharingOptions:Object;
      
      private var _signature:String;
      
      protected var _defaultColor:Object;
      
      protected var _categoryName:String;
      
      public var folder:FolderThumb;
      
      private var _editable:Boolean;
      
      private var _xml:XML;
      
      public function Thumb()
      {
         this._colorRef = new UtilHashArray();
         this._colorParts = new UtilHashArray();
         this._sysTags = new Array();
         super();
      }
      
      public function get signature() : String
      {
         return this._signature;
      }
      
      public function set signature(param1:String) : void
      {
         this._signature = param1;
      }
      
      public function get defaultColor() : Object
      {
         return this._defaultColor;
      }
      
      public function get encAssetId() : String
      {
         return this._encAssetId;
      }
      
      public function set encAssetId(param1:String) : void
      {
         this._encAssetId = param1;
      }
      
      public function get sharingOptions() : Object
      {
         return this._sharingOptions;
      }
      
      public function set sharingOptions(param1:Object) : void
      {
         this._sharingOptions = param1;
      }
      
      public function get showFav() : Boolean
      {
         return this._showFav;
      }
      
      public function set showFav(param1:Boolean) : void
      {
         this._showFav = param1;
      }
      
      public function get sysTags() : Array
      {
         return this._sysTags;
      }
      
      public function get editable() : Boolean
      {
         return this._editable;
      }
      
      public function set editable(param1:Boolean) : void
      {
         if(this._editable != param1)
         {
            this._editable = param1;
         }
      }
      
      public function get path() : String
      {
         return this._path;
      }
      
      public function set path(param1:String) : void
      {
         this._path = param1;
      }
      
      public function isThumbReady(param1:String = "") : Boolean
      {
         return false;
      }
      
      public function deSerializeFacial(param1:XML, param2:Theme, param3:int = -1, param4:int = 1) : void
      {
      }
      
      public function get defaultAction() : IBehavior
      {
         return this._defAction;
      }
      
      public function get handStyle() : String
      {
         return "";
      }
      
      public function set handStyle(param1:String) : void
      {
      }
      
      public function clone() : Thumb
      {
         var _loc1_:Thumb = new Thumb();
         _loc1_.id = this.id;
         _loc1_.encryptId = this.encryptId;
         _loc1_.aid = this.aid;
         _loc1_.thumbId = this.thumbId;
         _loc1_.name = this.name;
         _loc1_.isPublished = this.isPublished;
         _loc1_.imageData = this.imageData;
         _loc1_.theme = this.theme;
         _loc1_.enable = this.enable;
         _loc1_.thumbImageData = this.thumbImageData;
         _loc1_.colorRef = this.colorRef.clone();
         _loc1_.colorParts = this.colorParts.clone();
         return _loc1_;
      }
      
      public function set imageObject(param1:DisplayObject) : void
      {
         this._imageObject = param1;
      }
      
      public function get imageObject() : DisplayObject
      {
         return this._imageObject;
      }
      
      public function get encryptId() : String
      {
         return this._encryptId;
      }
      
      public function set encryptId(param1:String) : void
      {
         this._encryptId = param1;
      }
      
      public function get isCC() : Boolean
      {
         return this.raceCode == RaceConstants.CUSTOM_CHARACTER;
      }
      
      public function get raceCode() : int
      {
         return this._raceCode;
      }
      
      public function set raceCode(param1:int) : void
      {
         this._raceCode = param1;
      }
      
      public function set colorParts(param1:UtilHashArray) : void
      {
         this._colorParts = param1;
      }
      
      public function get colorParts() : UtilHashArray
      {
         return this._colorParts;
      }
      
      public function set colorRef(param1:UtilHashArray) : void
      {
         this._colorRef = param1;
      }
      
      public function get colorRef() : UtilHashArray
      {
         return this._colorRef;
      }
      
      public function set xml(param1:XML) : void
      {
         this._xml = param1;
      }
      
      public function get xml() : XML
      {
         if(!this._xml)
         {
            this._xml = this.serialize();
         }
         return this._xml;
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function set id(param1:String) : void
      {
         this._id = param1;
      }
      
      public function get aid() : String
      {
         return this._aid;
      }
      
      public function get uid() : String
      {
         return this._aid + this.id + this.fileName;
      }
      
      public function set aid(param1:String) : void
      {
         this._aid = param1;
      }
      
      public function get thumbId() : String
      {
         return this._thumbId;
      }
      
      public function set thumbId(param1:String) : void
      {
         this._thumbId = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get tags() : String
      {
         return this._tags;
      }
      
      public function set tags(param1:String) : void
      {
         this._tags = param1;
      }
      
      public function get isPublished() : Boolean
      {
         return this._isPublished;
      }
      
      public function set isPublished(param1:Boolean) : void
      {
         this._isPublished = param1;
      }
      
      public function get imageData() : Object
      {
         return this._imageData;
      }
      
      public function set imageData(param1:Object) : void
      {
         this._imageData = param1;
      }
      
      public function get thumbImageData() : Object
      {
         return this._thumbImageData;
      }
      
      public function set thumbImageData(param1:Object) : void
      {
         this._thumbImageData = param1;
      }
      
      public function get theme() : Theme
      {
         return this._theme;
      }
      
      public function set theme(param1:Theme) : void
      {
         this._theme = param1;
         if(param1)
         {
            this._themeId = param1.id;
         }
      }
      
      public function get themeId() : String
      {
         return this._themeId;
      }
      
      public function set themeId(param1:String) : void
      {
         this._themeId = param1;
      }
      
      public function get enable() : Boolean
      {
         return this._enable;
      }
      
      public function set enable(param1:Boolean) : void
      {
         this._enable = param1;
      }
      
      public function set useImageAsThumb(param1:Boolean) : void
      {
         this._useImageDataAsThumbnail = param1;
      }
      
      public function get useImageAsThumb() : Boolean
      {
         return this._useImageDataAsThumbnail;
      }
      
      public function serialize() : XML
      {
         return new XML();
      }
      
      public function deSerialize(param1:XML, param2:Theme) : void
      {
      }
      
      override public function toString() : String
      {
         return this._name + "\n(" + this._themeId + "/" + this._imageFileName + ")\n" + this._aid;
      }
      
      public function get fileName() : String
      {
         return this._imageFileName;
      }
      
      public function getFileName() : String
      {
         return this._imageFileName;
      }
      
      public function setFileName(param1:String) : void
      {
         this._imageFileName = param1;
      }
      
      public function getKey() : String
      {
         return this.theme.id + "." + this.id;
      }
      
      public function getColorSetById(param1:String) : UtilHashSelectedColor
      {
         var _loc3_:UtilHashSelectedColor = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:XML = null;
         var _loc7_:SelectedColor = null;
         var _loc2_:XML = this.colorRef.getValueByKey(param1);
         if(_loc2_)
         {
            _loc3_ = new UtilHashSelectedColor();
            _loc4_ = _loc2_.color.length();
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc6_ = _loc2_.child("color")[_loc5_];
               _loc7_ = new SelectedColor(_loc6_.@r,_loc6_.attribute("oc").length() == 0?uint(uint.MAX_VALUE):uint(_loc6_.@oc),uint(_loc6_));
               _loc3_.push(_loc2_.color[_loc5_].@r,_loc7_);
               _loc5_++;
            }
            return _loc3_;
         }
         return new UtilHashSelectedColor();
      }
      
      public function getColorSetByIndex(param1:Number) : UtilHashArray
      {
         var _loc4_:int = 0;
         var _loc2_:XML = this.colorRef.getValueByIndex(param1);
         var _loc3_:UtilHashArray = new UtilHashArray();
         _loc4_ = 0;
         while(_loc4_ < _loc2_.color.length())
         {
            _loc3_.push(_loc2_.color[_loc4_].@r,_loc2_.color[_loc4_]);
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function loadImageData() : void
      {
      }
      
      public function loadImageDataComplete(param1:Event) : void
      {
      }
      
      public function get shouldBeCopyToNextScene() : Boolean
      {
         return true;
      }
      
      public function get firstColorSetId() : String
      {
         var _loc3_:XML = null;
         var _loc1_:int = this.colorRef.length;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = this.colorRef.getValueByIndex(_loc2_);
            if(_loc3_.@enable == "Y")
            {
               return _loc3_.@aid;
            }
            _loc2_++;
         }
         return "";
      }
      
      public function get isWhiteboardAsset() : Boolean
      {
         return this.themeId == ThemeConstants.WHITEBOARD_THEME_ID;
      }
      
      public function get isInfographicAsset() : Boolean
      {
         return this.themeId == ThemeConstants.INFOGRAPHICS_THEME_ID;
      }
      
      public function get isStarter() : Boolean
      {
         return false;
      }
      
      public function get searchKey() : String
      {
         return this.aid;
      }
      
      public function get categoryName() : String
      {
         return this._categoryName;
      }
      
      public function set categoryName(param1:String) : void
      {
         this._categoryName = param1;
      }
   }
}
