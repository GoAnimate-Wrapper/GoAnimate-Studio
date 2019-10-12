package anifire.studio.core
{
   import anifire.color.SelectedColor;
   import anifire.interfaces.IBehavior;
   import anifire.interfaces.IXmlConvertable;
   import anifire.studio.assets.interfaces.IReferencePoint;
   import anifire.studio.assets.models.AssetColor;
   import anifire.studio.events.AssetEvent;
   import anifire.util.UtilArray;
   import anifire.util.UtilHashSelectedColor;
   import anifire.util.UtilMath;
   import flash.display.DisplayObjectContainer;
   import flash.events.EventDispatcher;
   import flash.geom.Point;
   
   public class Asset extends EventDispatcher implements IXmlConvertable, IReferencePoint
   {
      
      public static const XML_VALUE_STRING_DELIMITER:String = ",";
      
      private static var _assetCount:int = 0;
       
      
      private var _mThumbId:String;
      
      private var _id:String;
      
      public var idFromTextComponent:String;
      
      private var _imageData:Object;
      
      protected var _thumb:Thumb;
      
      private var _scene:AnimeScene;
      
      private var _width:Number = 0;
      
      private var _height:Number = 0;
      
      protected var _scaleX:Number = 1;
      
      protected var _scaleY:Number = 1;
      
      private var _x:Number = 0;
      
      private var _y:Number = 0;
      
      private var _isLoadded:Boolean;
      
      private var _resize:Boolean;
      
      private var _type:String = "";
      
      private var _attachedBg:Boolean;
      
      private var _referencePoint:Point;
      
      private var _assetColor:AssetColor;
      
      public var componentRole:String;
      
      public function Asset()
      {
         this._referencePoint = new Point(-1,-1);
         this._assetColor = new AssetColor();
         super();
         _assetCount++;
      }
      
      public function get mThumbId() : String
      {
         return this._mThumbId;
      }
      
      public function set mThumbId(param1:String) : void
      {
         this._mThumbId = param1;
      }
      
      public function get attachedBg() : Boolean
      {
         return this._attachedBg;
      }
      
      public function set attachedBg(param1:Boolean) : void
      {
         this._attachedBg = param1;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
      }
      
      public function get minWidth() : Number
      {
         return 3;
      }
      
      public function get minHeight() : Number
      {
         return 3;
      }
      
      public function get maxWidth() : Number
      {
         return 999999;
      }
      
      public function get maxHeight() : Number
      {
         return 999999;
      }
      
      public function set action(param1:IBehavior) : void
      {
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function set id(param1:String) : void
      {
         this._id = param1;
         var _loc2_:RegExp = /\d/;
         var _loc3_:int = int(param1.substr(param1.search(_loc2_)));
         _assetCount = _loc3_ > _assetCount?int(_loc3_):int(_assetCount);
      }
      
      public function get imageData() : Object
      {
         return this._imageData;
      }
      
      public function set imageData(param1:Object) : void
      {
         this._imageData = param1;
         if(param1)
         {
            this.loadAssetImage();
         }
      }
      
      public function get thumb() : Thumb
      {
         return this._thumb;
      }
      
      public function set thumb(param1:Thumb) : void
      {
         this._thumb = param1;
      }
      
      public function get scene() : AnimeScene
      {
         return this._scene;
      }
      
      public function set scene(param1:AnimeScene) : void
      {
         this._scene = param1;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set x(param1:Number) : void
      {
         if(param1 != this.x)
         {
            this._x = param1;
            this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_MOVED,this));
         }
      }
      
      public function get y() : Number
      {
         return this._y;
      }
      
      public function set y(param1:Number) : void
      {
         if(param1 != this.y)
         {
            this._y = param1;
            this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_MOVED,this));
         }
      }
      
      public function move(param1:Number, param2:Number) : void
      {
         if(param1 != this.x || param2 != this.y)
         {
            this._x = param1;
            this._y = param2;
            this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_MOVED,this));
         }
      }
      
      public function indent(param1:Number, param2:Number) : void
      {
         this.move(this.x + param1,this.y + param2);
         if(this.referenceX != -1 && this.referenceY != -1)
         {
            this.setReferencePoint(this.referenceX + param1,this.referenceY + param2);
         }
      }
      
      public function get width() : Number
      {
         return this._width;
      }
      
      public function set width(param1:Number) : void
      {
         param1 = UtilMath.boundaryCheck(param1,this.minWidth,this.maxWidth);
         if(this._width == param1)
         {
            return;
         }
         this._width = param1;
         this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED,this));
      }
      
      public function get height() : Number
      {
         return this._height;
      }
      
      public function set height(param1:Number) : void
      {
         param1 = UtilMath.boundaryCheck(param1,this.minHeight,this.maxHeight);
         if(this._height == param1)
         {
            return;
         }
         this._height = param1;
         this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED,this));
      }
      
      public function get scaleX() : Number
      {
         return this._scaleX;
      }
      
      public function set scaleX(param1:Number) : void
      {
         if(this._scaleX == param1)
         {
            return;
         }
         this._scaleX = param1;
         this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED,this));
      }
      
      public function get scaleY() : Number
      {
         return this._scaleY;
      }
      
      public function set scaleY(param1:Number) : void
      {
         if(this._scaleY == param1)
         {
            return;
         }
         this._scaleY = param1;
         this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED,this));
      }
      
      public function get isLoadded() : Boolean
      {
         return this._isLoadded;
      }
      
      public function set isLoadded(param1:Boolean) : void
      {
         this._isLoadded = param1;
      }
      
      public function set isResize(param1:Boolean) : void
      {
         this._resize = param1;
      }
      
      public function get isResize() : Boolean
      {
         return this._resize;
      }
      
      public function getKey() : String
      {
         return this.thumb.theme.id + "." + this.thumb.id + "." + this.id;
      }
      
      public function serialize() : String
      {
         return null;
      }
      
      protected function initListeners() : void
      {
      }
      
      public function deleteAsset() : void
      {
         this._scene.removeAsset(this);
      }
      
      public function clone(param1:Boolean = false, param2:AnimeScene = null) : Asset
      {
         return null;
      }
      
      public function cloneNext() : Asset
      {
         return this.clone();
      }
      
      protected function getSceneEditor() : DisplayObjectContainer
      {
         return Console.getConsole().mainStage.sceneEditor;
      }
      
      public function unloadAssetImage(param1:Boolean) : void
      {
         this.imageData = null;
      }
      
      protected function loadAssetImage() : void
      {
      }
      
      protected function get assetCount() : int
      {
         return _assetCount;
      }
      
      public function set defaultColorSetId(param1:String) : void
      {
         this._assetColor.defaultColorSetId = param1;
      }
      
      public function get defaultColorSetId() : String
      {
         return this._assetColor.defaultColorSetId;
      }
      
      public function set defaultColorSet(param1:UtilHashSelectedColor) : void
      {
         this._assetColor.defaultColorSet = param1;
      }
      
      public function get defaultColorSet() : UtilHashSelectedColor
      {
         return this._assetColor.defaultColorSet;
      }
      
      protected function addCustomColor(param1:String, param2:SelectedColor) : void
      {
         this._assetColor.addCustomColor(param1,param2);
      }
      
      public function set customColor(param1:UtilHashSelectedColor) : void
      {
         this._assetColor.customColor = param1;
      }
      
      public function get customColor() : UtilHashSelectedColor
      {
         return this._assetColor.customColor;
      }
      
      public function get colorableArea() : Array
      {
         return new Array();
      }
      
      public function getColorArea() : Array
      {
         var _loc1_:Array = new Array();
         var _loc2_:Array = new Array();
         var _loc3_:Array = new Array();
         var _loc4_:Array = new Array();
         var _loc5_:int = 0;
         while(_loc5_ < this.thumb.colorParts.length)
         {
            _loc4_.push(this.thumb.colorParts.getKey(_loc5_));
            _loc5_++;
         }
         _loc3_ = _loc2_.concat(_loc4_);
         _loc3_ = AssetColor.removeCCUsedColor(_loc3_);
         _loc3_ = UtilArray.removeDuplicates(_loc3_,true);
         return _loc3_;
      }
      
      public function isColorable() : Boolean
      {
         if(this.thumb.colorParts.length > 0)
         {
            return true;
         }
         return false;
      }
      
      public function doChangeColor(param1:String, param2:uint = 4.294967295E9) : Number
      {
         return this.changeColor(param1,param2);
      }
      
      public function changeColor(param1:String, param2:uint = 4.294967295E9) : Number
      {
         var _loc3_:uint = 0;
         var _loc4_:SelectedColor = null;
         if(param2 == uint.MAX_VALUE)
         {
            this.customColor.removeByKey(param1);
         }
         else
         {
            _loc3_ = this.thumb.colorParts.getValueByKey(param1) == null?uint(uint.MAX_VALUE):uint(this.thumb.colorParts.getValueByKey(param1));
            _loc4_ = new SelectedColor(param1,_loc3_,param2);
            this.addCustomColor(param1,_loc4_);
         }
         this.dispatchEvent(new AssetEvent(AssetEvent.COLOR_CHANGE,this));
         return 0;
      }
      
      public function updateColor() : void
      {
         var _loc1_:int = 0;
         var _loc2_:SelectedColor = null;
         if(this.customColor.length != 0)
         {
            _loc1_ = 0;
            while(_loc1_ < this.customColor.length)
            {
               _loc2_ = SelectedColor(this.customColor.getValueByIndex(_loc1_));
               this.changeColor(_loc2_.areaName,_loc2_.dstColor);
               _loc1_++;
            }
         }
      }
      
      public function restoreColor() : void
      {
         this._assetColor.restoreColor();
         this.dispatchEvent(new AssetEvent(AssetEvent.COLOR_CHANGE,this));
      }
      
      public function get isCopyable() : Boolean
      {
         return true;
      }
      
      public function get shouldBeCopyToNextScene() : Boolean
      {
         if(this.thumb is Thumb)
         {
            return Thumb(this.thumb).shouldBeCopyToNextScene;
         }
         return false;
      }
      
      public function convertToXml() : XML
      {
         return new XML();
      }
      
      public function convertFromXml(param1:XML) : Boolean
      {
         return false;
      }
      
      public function get referenceX() : Number
      {
         return this._referencePoint.x;
      }
      
      public function get referenceY() : Number
      {
         return this._referencePoint.y;
      }
      
      public function set referenceX(param1:Number) : void
      {
         if(param1 != this.referenceX)
         {
            this._referencePoint.x = param1;
            this.dispatchEvent(new AssetEvent(AssetEvent.REFERENCE_POINT_CHANGED,this));
         }
      }
      
      public function set referenceY(param1:Number) : void
      {
         if(param1 != this.referenceY)
         {
            this._referencePoint.y = param1;
            this.dispatchEvent(new AssetEvent(AssetEvent.REFERENCE_POINT_CHANGED,this));
         }
      }
      
      public function setReferencePoint(param1:Number, param2:Number) : void
      {
         if(param1 != this.referenceX || param2 != this.referenceY)
         {
            this._referencePoint.x = param1;
            this._referencePoint.y = param2;
            this.dispatchEvent(new AssetEvent(AssetEvent.REFERENCE_POINT_CHANGED,this));
         }
      }
      
      public function get isWhiteboardAsset() : Boolean
      {
         if(this._thumb is Thumb)
         {
            return (this._thumb as Thumb).isWhiteboardAsset;
         }
         return false;
      }
      
      public function get isInfographicAsset() : Boolean
      {
         if(this._thumb is Thumb)
         {
            return (this._thumb as Thumb).isInfographicAsset;
         }
         return false;
      }
   }
}
