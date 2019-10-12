package anifire.studio.core
{
   import anifire.color.SelectedColor;
   import anifire.component.CustomCharacterMaker;
   import anifire.constant.AnimeConstants;
   import anifire.constant.RaceConstants;
   import anifire.constant.ThemeConstants;
   import anifire.errors.SerializeError;
   import anifire.event.CoreEvent;
   import anifire.event.ExtraDataEvent;
   import anifire.event.LoadMgrEvent;
   import anifire.studio.assets.models.AssetRotation;
   import anifire.studio.events.AssetEvent;
   import anifire.studio.events.CharacterAssetEvent;
   import anifire.studio.interfaces.IColorable;
   import anifire.studio.interfaces.IEye;
   import anifire.studio.interfaces.IFlippable;
   import anifire.studio.interfaces.IMotion;
   import anifire.studio.interfaces.IMouth;
   import anifire.studio.interfaces.IMovable;
   import anifire.studio.interfaces.IRotatable;
   import anifire.studio.interfaces.IScalable;
   import anifire.studio.interfaces.ISlidable;
   import anifire.studio.managers.TextComponentManager;
   import anifire.studio.managers.ThemeManager;
   import anifire.util.Util;
   import anifire.util.UtilHashArray;
   import anifire.util.UtilHashSelectedColor;
   import anifire.util.UtilLoadMgr;
   import anifire.util.UtilXmlInfo;
   import flash.events.Event;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class Prop extends Asset implements ISlidable, IRotatable, IScalable, IMovable, IColorable, IFlippable, IEye, IMouth, IMotion
   {
      
      public static const ASSET_TYPE:String = "prop";
      
      public static const XML_NODE_NAME:String = "prop";
      
      public static const XML_NODE_NAME_HEAD:String = "head";
      
      public static const XML_NODE_NAME_WEAR:String = "wear";
      
      public static const XML_NODE_NAME_FILE:String = "file";
      
      public static const XML_NODE_NAME_X:String = "x";
      
      public static const XML_NODE_NAME_Y:String = "y";
      
      public static const XML_NODE_NAME_X_SCALE:String = "xscale";
      
      public static const XML_NODE_NAME_Y_SCALE:String = "yscale";
      
      public static const XML_NODE_NAME_ROTATION:String = "rotation";
      
      public static const XML_NODE_NAME_FACING:String = "face";
      
      public static const PROPERTY_X:String = "x";
      
      public static const PROPERTY_Y:String = "y";
      
      public static const PROPERTY_X_SCALE:String = "xscale";
      
      public static const PROPERTY_Y_SCALE:String = "yscale";
      
      public static const PROPERTY_FACING:String = "facing";
      
      public static const PROPERTY_ROTATION:String = "rotation";
      
      private static const ZIP_FILE_EXTENSION_PATTERN:RegExp = /\.zip$/i;
      
      private static const XML_FILE_EXTENSION:String = ".xml";
      
      private static var _existIDs:UtilHashArray = new UtilHashArray();
      
      public static const STAGE_FIT_WIDTH:Number = 576;
      
      public static const STAGE_FIT_HEIGHT:Number = 324;
       
      
      private var _stateId:String;
      
      private var _state:State;
      
      private var _checkedStateItem:Object;
      
      private var _fromTray:Boolean = false;
      
      private var _char:Character = null;
      
      protected var _motionShadow:Prop;
      
      private var _shadowParent:Prop;
      
      private var _motionShadow_facing:String;
      
      private var _motionData:MotionData;
      
      private var _facing:String = "left";
      
      private var _lookAtCamera:Boolean = false;
      
      private var _demoSpeech:Boolean = false;
      
      private var _rotation:AssetRotation;
      
      private var _imageLocalCenter:Point;
      
      protected var _isSwapping:Boolean;
      
      protected var _imageWidth:Number;
      
      protected var _imageHeight:Number;
      
      protected var _preSwapHeight:Number;
      
      protected var _preSwapWidth:Number;
      
      public function Prop(param1:String = "")
      {
         var _loc3_:int = 0;
         this._rotation = new AssetRotation();
         super();
         var _loc2_:String = "PROP" + Prop._existIDs.length;
         if(param1 == "")
         {
            _loc3_ = Prop._existIDs.length;
            while(Prop._existIDs.containsKey(_loc2_))
            {
               _loc2_ = "PROP" + _loc3_;
               _loc3_++;
            }
         }
         else
         {
            _loc2_ = param1;
         }
         Prop._existIDs.push(_loc2_,_loc2_);
         this.id = _loc2_;
      }
      
      public static function getThumbByJsonObj(param1:Object) : PropThumb
      {
         var _loc2_:String = param1.theme_code;
         var _loc3_:* = _loc2_ + "." + param1.src + ".swf";
         var _loc4_:String = UtilXmlInfo.getZipFileNameOfProp(_loc3_.toString());
         var _loc5_:String = UtilXmlInfo.getThumbIdFromFileName(_loc4_);
         var _loc6_:String = _loc4_.split(".").length == 4?_loc5_:UtilXmlInfo.getCharIdFromFileName(_loc4_);
         if(_loc5_.indexOf(".head.") != -1)
         {
            _loc6_ = UtilXmlInfo.getFacialThumbIdFromFileName(_loc5_);
            _loc5_ = UtilXmlInfo.getFacialIdFromFileName(_loc5_);
            _loc5_ = _loc5_.replace(ZIP_FILE_EXTENSION_PATTERN,XML_FILE_EXTENSION);
         }
         return ThemeManager.instance.getPropById(_loc2_,_loc6_);
      }
      
      public static function getThumbByXML(param1:XML) : PropThumb
      {
         var _loc2_:String = UtilXmlInfo.getZipFileNameOfProp(param1.child("file")[0].toString());
         var _loc3_:String = UtilXmlInfo.getThumbIdFromFileName(_loc2_);
         var _loc4_:String = _loc2_.split(".").length == 4?_loc3_:UtilXmlInfo.getCharIdFromFileName(_loc2_);
         if(_loc3_.indexOf(".head.") != -1)
         {
            _loc4_ = UtilXmlInfo.getFacialThumbIdFromFileName(_loc3_);
            _loc3_ = UtilXmlInfo.getFacialIdFromFileName(_loc3_);
            _loc3_ = _loc3_.replace(ZIP_FILE_EXTENSION_PATTERN,XML_FILE_EXTENSION);
         }
         var _loc5_:String = UtilXmlInfo.getThemeIdFromFileName(_loc2_);
         return ThemeManager.instance.getPropById(_loc5_,_loc4_);
      }
      
      public function get lookAtCameraSupported() : Boolean
      {
         return false;
      }
      
      public function get lookAtCamera() : Boolean
      {
         return this._lookAtCamera;
      }
      
      public function set lookAtCamera(param1:Boolean) : void
      {
         this._lookAtCamera = param1;
         if(this.thumb != null && (this.thumb as PropThumb).isCC)
         {
            this.dispatchEvent(new ExtraDataEvent(CustomCharacterMaker.LOOK_AT_CAMERA_CHANGED,this,param1));
            this.dispatchEvent(new AssetEvent(AssetEvent.EYE_CHANGE,this));
         }
      }
      
      public function set demoSpeech(param1:Boolean) : void
      {
         if(this._demoSpeech != param1)
         {
            this._demoSpeech = param1;
            this.dispatchEvent(new AssetEvent(CharacterAssetEvent.MOUTH_CHANGE,this));
         }
      }
      
      public function get demoSpeech() : Boolean
      {
         return this._demoSpeech;
      }
      
      public function get char() : Character
      {
         return this._char;
      }
      
      public function set char(param1:Character) : void
      {
         this._char = param1;
      }
      
      private function onShadowMoved(param1:Event) : void
      {
         if(this._motionShadow && this._motionData)
         {
            this._motionData.moveEndPoint(this._motionShadow.x,this._motionShadow.y);
            this.dispatchEvent(new AssetEvent(AssetEvent.MOTION_CHANGE,this));
         }
      }
      
      override public function set x(param1:Number) : void
      {
         if(param1 != this.x)
         {
            super.x = param1;
            if(this._motionData)
            {
               this._motionData.startX = this.x;
            }
            this.dispatchEvent(new AssetEvent(AssetEvent.MOTION_CHANGE,this));
         }
      }
      
      override public function set y(param1:Number) : void
      {
         if(param1 != this.y)
         {
            super.y = param1;
            if(this._motionData)
            {
               this._motionData.startY = this.y;
            }
            this.dispatchEvent(new AssetEvent(AssetEvent.MOTION_CHANGE,this));
         }
      }
      
      override public function move(param1:Number, param2:Number) : void
      {
         if(param1 != this.x || param2 != this.y)
         {
            super.move(param1,param2);
            if(this._motionData)
            {
               this._motionData.moveStartPoint(this.x,this.y);
            }
            this.dispatchEvent(new AssetEvent(AssetEvent.MOTION_CHANGE,this));
         }
      }
      
      public function get imageLocalCenter() : Point
      {
         return this._imageLocalCenter;
      }
      
      public function set imageLocalCenter(param1:Point) : void
      {
         this._imageLocalCenter = param1;
      }
      
      public function fitToStage(param1:Number, param2:Number) : void
      {
         var _loc3_:Number = STAGE_FIT_WIDTH / param1;
         var _loc4_:Number = STAGE_FIT_HEIGHT / param2;
         var _loc5_:Number = Math.min(_loc3_,_loc4_,1);
         if(_loc5_ < 1)
         {
            scaleX = _loc5_;
            scaleY = _loc5_;
         }
      }
      
      public function moveOnStateChange(param1:Point) : void
      {
         var _loc2_:Matrix = null;
         var _loc3_:Matrix = null;
         var _loc4_:Matrix = null;
         var _loc5_:Point = null;
         if(param1)
         {
            if(this._imageLocalCenter)
            {
               _loc2_ = new Matrix();
               _loc2_.scale(this.scaleX,this.scaleY);
               if(this.isFlipped)
               {
                  _loc2_.scale(-1,1);
               }
               _loc2_.rotate(this.rotation * Math.PI / 180);
               _loc2_.translate(this.x,this.y);
               _loc3_ = new Matrix();
               _loc3_.translate(param1.x - this._imageLocalCenter.x,param1.y - this._imageLocalCenter.y);
               _loc4_ = _loc2_.clone();
               _loc4_.invert();
               _loc4_.concat(_loc3_);
               _loc4_.concat(_loc2_);
               _loc5_ = new Point(this.x,this.y);
               _loc5_ = _loc4_.transformPoint(_loc5_);
               this.move(_loc5_.x,_loc5_.y);
            }
            else
            {
               this.setReferencePoint(this.x,this.y);
            }
            this._imageLocalCenter = param1;
         }
      }
      
      override public function set thumb(param1:Thumb) : void
      {
         var _loc2_:PropThumb = null;
         if(param1)
         {
            super.thumb = param1;
            if(param1 is VideoPropThumb)
            {
               this.imageData = param1.imageData;
            }
            else if(param1 is PropThumb)
            {
               _loc2_ = param1 as PropThumb;
               if(_loc2_.states.length > 0)
               {
                  if(this._fromTray)
                  {
                     this.state = _loc2_.defaultState;
                  }
                  else
                  {
                     this.state = _loc2_.getStateById(this.stateId);
                  }
               }
               else if(param1.imageData)
               {
                  this.imageData = param1.imageData;
               }
               else
               {
                  param1.loadImageData();
                  param1.addEventListener(CoreEvent.LOAD_THUMB_COMPLETE,this.propThumb_loadImageDataCompleteHandler);
               }
            }
         }
      }
      
      public function propThumb_loadImageDataCompleteHandler(param1:CoreEvent) : void
      {
         this.imageData = _thumb.imageData;
      }
      
      private function get defaultFacing() : String
      {
         return PropThumb(this.thumb).facing;
      }
      
      public function set stateId(param1:String) : void
      {
         this._stateId = param1;
      }
      
      public function get stateId() : String
      {
         return this._stateId;
      }
      
      public function set state(param1:State) : void
      {
         if(this._state != param1)
         {
            this._state = param1;
            this.stateId = param1.id;
            this.imageData = param1.imageData;
            this.dispatchEvent(new AssetEvent(AssetEvent.STATE_CHANGE,this));
         }
      }
      
      public function get state() : State
      {
         return this._state;
      }
      
      public function get motionShadow() : Prop
      {
         return this._motionShadow;
      }
      
      public function get shadow() : Object
      {
         return this._motionShadow;
      }
      
      public function get motionData() : MotionData
      {
         return this._motionData;
      }
      
      public function get isShadow() : Boolean
      {
         return this._shadowParent != null;
      }
      
      public function set shadowParent(param1:Prop) : void
      {
         this._shadowParent = param1;
      }
      
      public function set motionShadow(param1:Prop) : void
      {
         if(this._motionShadow != param1)
         {
            if(this._motionShadow)
            {
               this._motionShadow.removeEventListener(AssetEvent.ASSET_MOVED,this.onShadowMoved);
            }
            this._motionShadow = param1;
            if(this._motionShadow)
            {
               this._motionShadow.shadowParent = this;
               this._motionShadow.addEventListener(AssetEvent.ASSET_MOVED,this.onShadowMoved);
            }
         }
      }
      
      public function get fromTray() : Boolean
      {
         return this._fromTray;
      }
      
      public function set fromTray(param1:Boolean) : void
      {
         this._fromTray = param1;
      }
      
      public function get facing() : String
      {
         return this._facing;
      }
      
      public function get isFlipped() : Boolean
      {
         return this._facing != AnimeConstants.FACING_LEFT;
      }
      
      public function set facing(param1:String) : void
      {
         if(this._facing != param1)
         {
            this._facing = param1;
            this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_HFLIPPED,this));
         }
      }
      
      public function getDataAndKey() : UtilHashArray
      {
         var _loc1_:UtilHashArray = new UtilHashArray();
         if(this.state == null)
         {
            this.state = (this.thumb as PropThumb).defaultState;
         }
         var _loc2_:String = !!(this.thumb as PropThumb).path?(this.thumb as PropThumb).path:this.thumb.id;
         _loc1_.push(this.thumb.theme.id + ".prop." + _loc2_ + "." + this.state.id,this.state.imageData,true);
         return _loc1_;
      }
      
      public function loadState(param1:CoreEvent) : void
      {
         if(this._fromTray)
         {
            this.state = (this.thumb as PropThumb).defaultState;
         }
         else
         {
            this.state = (this.thumb as PropThumb).getStateById(this.stateId);
         }
      }
      
      protected function addMotionShadow() : void
      {
         var _loc1_:Prop = null;
         if(!this.isShadow && this._motionShadow == null)
         {
            _loc1_ = this.clone() as Prop;
            _loc1_.removeSlideMotion();
            this._motionShadow_facing = _loc1_.facing;
            this.motionShadow = _loc1_;
         }
      }
      
      protected function recreateMotionShadow() : void
      {
         var _loc1_:MotionData = null;
         if(this._motionData && !this.isShadow)
         {
            _loc1_ = this._motionData;
            this._motionData = null;
            this.motionData = _loc1_;
         }
      }
      
      public function get fileId() : String
      {
         var _loc1_:String = null;
         try
         {
            _loc1_ = "";
            if((this.thumb as PropThumb).getStateNum() > 0)
            {
               if(this.state == null)
               {
                  _loc1_ = (this.thumb as PropThumb).defaultState.getKey();
               }
               else
               {
                  _loc1_ = this.state.getKey();
               }
            }
            else
            {
               _loc1_ = this.thumb.theme.id + "." + this.thumb.id;
            }
         }
         catch(e:Error)
         {
         }
         return _loc1_;
      }
      
      public function convertToJsonObj() : Object
      {
         var _loc2_:String = null;
         var _loc1_:Object = new Object();
         var _loc3_:PropThumb = this.thumb as PropThumb;
         if(_loc3_ == null)
         {
            throw new Error("null thumb");
         }
         if(this.thumb.theme == null)
         {
            throw new Error("null thumb");
         }
         _loc2_ = this.thumb.theme.id + "." + this.thumb.id;
         var _loc4_:uint = this.scene.getOverallOrdering(this);
         _loc1_.id = this.id;
         _loc1_.type = ASSET_TYPE;
         _loc1_.src = this.fileId.split(".")[1];
         _loc1_.index = _loc4_;
         _loc1_.theme_code = this.thumb.themeId;
         _loc1_.componentRole = componentRole;
         _loc1_.x = this.x;
         _loc1_.y = this.y;
         _loc1_.sx = this.scaleX;
         _loc1_.sy = this.scaleY;
         _loc1_.rotate = this.rotation;
         _loc1_.face = this.facing;
         _loc1_.motion = {
            "x":this.serializeMotion(PROPERTY_X,this._motionShadow),
            "y":this.serializeMotion(PROPERTY_Y,this._motionShadow),
            "sx":this.serializeMotion(PROPERTY_X_SCALE,this._motionShadow),
            "sy":this.serializeMotion(PROPERTY_Y_SCALE,this._motionShadow),
            "face":this.serializeMotion(PROPERTY_FACING,this._motionShadow),
            "rotate":this.serializeMotion(PROPERTY_ROTATION,this._motionShadow)
         };
         if(customColor && customColor.length)
         {
            _loc1_.color = this.generateColorJsonObj();
         }
         return _loc1_;
      }
      
      private function generateColorJsonObj() : Array
      {
         var _loc2_:SelectedColor = null;
         var _loc4_:Object = null;
         if(!customColor)
         {
            return null;
         }
         var _loc1_:int = customColor.length;
         var _loc3_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < _loc1_)
         {
            _loc2_ = customColor.getValueByIndex(_loc5_) as SelectedColor;
            if(_loc2_)
            {
               _loc4_ = {
                  "r":customColor.getKey(_loc5_),
                  "value":_loc2_.dstColor
               };
               if(_loc2_.orgColor != uint.MAX_VALUE)
               {
                  _loc4_.oc = "0x" + _loc2_.orgColor.toString(16);
               }
               else
               {
                  _loc4_.oc = uint.MAX_VALUE;
               }
               _loc3_.push(_loc4_);
            }
            _loc5_++;
         }
         return _loc3_;
      }
      
      override public function convertToXml() : XML
      {
         var xml:XML = null;
         var childXml:XML = null;
         var filepath:String = null;
         var propThumb:PropThumb = null;
         var index:uint = 0;
         var colorList:XMLList = null;
         xml = <prop/>;
         var error:Error = new Error();
         try
         {
            if(this.thumb is PropThumb)
            {
               propThumb = this.thumb as PropThumb;
               if(propThumb.getStateNum() > 0)
               {
                  if(this.state == null)
                  {
                     if(propThumb.defaultState)
                     {
                        filepath = propThumb.defaultState.getKey();
                     }
                     else
                     {
                        error.message = "null defaultState";
                        throw error;
                     }
                  }
                  else if(this.state)
                  {
                     filepath = this.state.getKey();
                  }
                  else
                  {
                     error.message = "null state";
                     throw error;
                  }
               }
               else if(this.thumb.theme)
               {
                  filepath = this.thumb.theme.id + "." + this.thumb.id;
               }
               else
               {
                  error.message = "null theme";
                  throw error;
               }
               if(this.char)
               {
                  if(this.char.prop)
                  {
                     if(this.char.prop.id == this.id)
                     {
                        xml.@id = this.id;
                        if(propThumb.raceCode != 0)
                        {
                           xml.@raceCode = propThumb.raceCode;
                        }
                        if(propThumb.handStyle != "")
                        {
                           xml.@handstyle = propThumb.handStyle;
                        }
                        xml.file = filepath;
                     }
                  }
                  if(this.char.head)
                  {
                     if(this.char.head.id == this.id)
                     {
                        xml = <head/>;
                        xml.@id = this.id;
                        if(propThumb.raceCode != 0)
                        {
                           xml.@raceCode = propThumb.raceCode;
                        }
                        xml.file = filepath;
                     }
                  }
                  if(this.char.wear)
                  {
                     if(this.char.wear.id == this.id)
                     {
                        xml = <wear/>;
                        xml.@id = this.id;
                        if(propThumb.raceCode != 0)
                        {
                           xml.@raceCode = propThumb.raceCode;
                        }
                        xml.file = filepath;
                     }
                  }
               }
               else
               {
                  index = this.scene.getOverallOrdering(this);
                  xml.@id = this.id;
                  xml.@index = String(index);
                  if(propThumb.isCC)
                  {
                     xml.@isCC = "Y";
                  }
                  if(propThumb.subType == AnimeConstants.ASSET_TYPE_PROP_VIDEO)
                  {
                     xml.@subtype = "video";
                  }
                  if(componentRole)
                  {
                     xml.@componentRole = componentRole;
                  }
                  xml.file = filepath;
                  xml.x = this.serializeMotion(PROPERTY_X,this._motionShadow);
                  xml.y = this.serializeMotion(PROPERTY_Y,this._motionShadow);
                  xml.xscale = this.serializeMotion(PROPERTY_X_SCALE,this._motionShadow);
                  xml.yscale = this.serializeMotion(PROPERTY_Y_SCALE,this._motionShadow);
                  xml.face = this.serializeMotion(PROPERTY_FACING,this._motionShadow);
                  xml.rotation = this.serializeMotion(PROPERTY_ROTATION,this._motionShadow);
                  if(defaultColorSetId != "")
                  {
                     xml.dcsn = defaultColorSetId;
                  }
                  colorList = this.getColorXmlList();
                  if(colorList)
                  {
                     xml.appendChild(colorList);
                  }
                  if(attachedBg)
                  {
                     xml.@attached = "Y";
                  }
                  if(this._motionData)
                  {
                     childXml = this._motionData.convertToXml();
                     xml.appendChild(childXml);
                  }
               }
            }
            else
            {
               error.message = "null thumb";
               throw error;
            }
         }
         catch(e:Error)
         {
            xml = SerializeError.createErrorNode("Failed to serialize prop, broken xml: " + xml.toXMLString() + e.message);
         }
         return xml;
      }
      
      override public function serialize() : String
      {
         return this.convertToXml().toXMLString();
      }
      
      private function getColorXmlList() : XMLList
      {
         var xml:XML = null;
         var xmlList:XMLList = null;
         var i:int = 0;
         try
         {
            if(customColor.length > 0)
            {
               xmlList = new XMLList();
               i = 0;
               while(i < customColor.length)
               {
                  xml = <color>{(customColor.getValueByIndex(i) as SelectedColor).dstColor}</color>;
                  xml.@r = customColor.getKey(i);
                  if((customColor.getValueByIndex(i) as SelectedColor).orgColor != uint.MAX_VALUE)
                  {
                     xml.@oc = "0x" + (customColor.getValueByIndex(i) as SelectedColor).orgColor.toString(16);
                  }
                  xmlList = xmlList + xml;
                  i++;
               }
            }
         }
         catch(e:Error)
         {
            throw new SerializeError("Failed to serialize prop color " + this.id,xmlList.toString(),e);
         }
         return xmlList;
      }
      
      protected function serializeMotion(param1:String, param2:Prop) : Array
      {
         var tempArray:Array = null;
         var i:int = 0;
         var pt:Point = null;
         var path:Vector.<Point> = null;
         var property:String = param1;
         var shadow:Prop = param2;
         try
         {
            tempArray = new Array();
            switch(property)
            {
               case PROPERTY_X:
                  tempArray.push(Util.roundNum(this.x));
                  break;
               case PROPERTY_Y:
                  tempArray.push(Util.roundNum(this.y));
                  break;
               case PROPERTY_X_SCALE:
                  tempArray.push(Util.roundNum(this.scaleX));
                  break;
               case PROPERTY_Y_SCALE:
                  tempArray.push(Util.roundNum(this.scaleY));
                  break;
               case PROPERTY_FACING:
                  tempArray.push(this.facing == this.defaultFacing?1:-1);
                  break;
               case PROPERTY_ROTATION:
                  tempArray.push(Util.roundNum(this.rotation));
            }
            if(this._motionData && this._motionData.path && this._motionData.path.length > 2)
            {
               i = 0;
               path = this._motionData.path;
               switch(property)
               {
                  case PROPERTY_X:
                     i = 1;
                     while(i < path.length - 1)
                     {
                        pt = path[i] as Point;
                        if(pt)
                        {
                           tempArray.push(Util.roundNum(pt.x));
                        }
                        i++;
                     }
                     break;
                  case PROPERTY_Y:
                     i = 1;
                     while(i < path.length - 1)
                     {
                        pt = path[i] as Point;
                        if(pt)
                        {
                           tempArray.push(Util.roundNum(pt.y));
                        }
                        i++;
                     }
               }
            }
            if(shadow)
            {
               switch(property)
               {
                  case PROPERTY_X:
                     tempArray.push(Util.roundNum(shadow.x));
                     break;
                  case PROPERTY_Y:
                     tempArray.push(Util.roundNum(shadow.y));
                     break;
                  case PROPERTY_X_SCALE:
                     tempArray.push(Util.roundNum(shadow.scaleX));
                     break;
                  case PROPERTY_Y_SCALE:
                     tempArray.push(Util.roundNum(shadow.scaleY));
                     break;
                  case PROPERTY_FACING:
                     tempArray.push(this._motionShadow_facing == this.defaultFacing?1:-1);
                     break;
                  case PROPERTY_ROTATION:
                     tempArray.push(Util.roundNum(shadow.rotation));
               }
            }
         }
         catch(e:Error)
         {
            throw new SerializeError("Failed to serialize prop motion " + this.id + tempArray.toString(),tempArray.toString(),e);
         }
         return tempArray;
      }
      
      public function deSerializeJsonObj(param1:Object, param2:Character, param3:AnimeScene = null, param4:Boolean = true, param5:Boolean = true) : void
      {
         var _loc6_:int = 0;
         var _loc13_:Object = null;
         var _loc14_:MotionData = null;
         var _loc15_:Array = null;
         var _loc16_:Array = null;
         var _loc17_:Array = null;
         var _loc18_:Array = null;
         var _loc19_:Array = null;
         var _loc20_:Array = null;
         var _loc21_:Vector.<Point> = null;
         var _loc7_:String = param1.theme_code;
         var _loc8_:* = _loc7_ + "." + param1.src + ".swf";
         var _loc9_:String = UtilXmlInfo.getZipFileNameOfProp(_loc8_.toString());
         var _loc10_:String = UtilXmlInfo.getThumbIdFromFileName(_loc9_);
         var _loc11_:String = _loc9_.split(".").length == 4?_loc10_:UtilXmlInfo.getCharIdFromFileName(_loc9_);
         if(!Console.getConsole().validateThemeStarterAssetId(_loc7_))
         {
            return;
         }
         var _loc12_:PropThumb = ThemeManager.instance.getPropById(_loc7_,_loc11_);
         if(!_loc12_)
         {
            return;
         }
         if(param5)
         {
            this.init(_loc12_,param2);
         }
         else
         {
            super.thumb = _loc12_;
         }
         if(!param2 && param3)
         {
            this.scene = param3;
            this.idFromTextComponent = param1.id;
            this.x = param1.x;
            this.y = param1.y;
            this.scaleX = param1.sx;
            this.scaleY = param1.sy;
            this.rotation = param1.rotate;
            this.facing = param1.face;
            this.componentRole = param1.componentRole;
            _loc13_ = param1.motion;
            if(_loc13_ && _loc13_.x.length > 1)
            {
               _loc14_ = new MotionData();
               _loc15_ = _loc13_.x;
               _loc16_ = _loc13_.y;
               _loc17_ = _loc13_.sx;
               _loc18_ = _loc13_.sy;
               _loc19_ = _loc13_.rotate;
               _loc20_ = _loc13_.face;
               _loc21_ = new Vector.<Point>();
               _loc6_ = 0;
               while(_loc6_ < _loc15_.length)
               {
                  _loc21_.push(new Point(_loc15_[_loc6_],_loc16_[_loc6_]));
                  _loc6_++;
               }
               _loc14_.path = _loc21_;
               _loc14_.startRotation = this.rotation;
               _loc14_.pathOriented = _loc13_.pathOriented;
               if(_loc13_.version == null)
               {
                  _loc14_.version = "1";
               }
               else
               {
                  _loc14_.version = _loc13_.version;
               }
               this.motionData = _loc14_;
               if(this._motionShadow)
               {
                  this._motionShadow.setReferencePoint(_loc15_[_loc15_.length - 1],_loc16_[_loc16_.length - 1]);
                  this._motionShadow.move(_loc15_[_loc15_.length - 1],_loc16_[_loc16_.length - 1]);
                  if(_loc19_ && _loc19_.length > 1)
                  {
                     this._motionShadow.rotation = _loc19_[_loc19_.length - 1];
                  }
                  if(_loc17_ && _loc18_ && _loc17_.length > 1 && _loc18_.length > 1)
                  {
                     this._motionShadow.scaleX = _loc17_[_loc17_.length - 1];
                     this._motionShadow.scaleY = _loc18_[_loc18_.length - 1];
                  }
               }
            }
            if(param1.color)
            {
               this.deSerializeColorJsonObj(param1.color);
            }
         }
         if(param5)
         {
            this.state = _loc12_.getStateById(_loc10_);
         }
         else
         {
            this._state = _loc12_.getStateById(_loc10_);
            this._stateId = _loc10_;
         }
         if(this.state && this.state.imageData)
         {
            this.isLoadded = true;
         }
      }
      
      private function deSerializeColorJsonObj(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:SelectedColor = null;
         if(!param1)
         {
            return;
         }
         var _loc3_:int = param1.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = new SelectedColor(param1[_loc2_].r,param1[_loc2_].oc,uint(param1[_loc2_].value));
            this.addCustomColor(param1[_loc2_].r,_loc4_);
            _loc2_++;
         }
      }
      
      public function deSerialize(param1:XML, param2:Character, param3:AnimeScene = null, param4:Boolean = true, param5:Boolean = true) : void
      {
         var _loc11_:XML = null;
         var _loc12_:int = 0;
         var _loc13_:UtilHashSelectedColor = null;
         var _loc14_:SelectedColor = null;
         var _loc15_:SelectedColor = null;
         var _loc16_:SelectedColor = null;
         var _loc17_:Array = null;
         var _loc18_:Array = null;
         var _loc19_:Array = null;
         var _loc20_:Array = null;
         var _loc21_:Array = null;
         var _loc22_:Array = null;
         var _loc6_:String = UtilXmlInfo.getZipFileNameOfProp(param1.child("file")[0].toString());
         var _loc7_:String = UtilXmlInfo.getThumbIdFromFileName(_loc6_);
         var _loc8_:String = _loc6_.split(".").length == 4?_loc7_:UtilXmlInfo.getCharIdFromFileName(_loc6_);
         if(_loc7_.indexOf(".head.") != -1)
         {
            _loc8_ = UtilXmlInfo.getFacialThumbIdFromFileName(_loc7_);
            _loc7_ = UtilXmlInfo.getFacialIdFromFileName(_loc7_);
            _loc7_ = _loc7_.replace(ZIP_FILE_EXTENSION_PATTERN,XML_FILE_EXTENSION);
         }
         var _loc9_:String = UtilXmlInfo.getThemeIdFromFileName(_loc6_);
         if(!Console.getConsole().validateThemeStarterAssetId(_loc9_))
         {
            return;
         }
         var _loc10_:PropThumb = ThemeManager.instance.getPropById(_loc9_,_loc8_);
         if(param4 && !Prop._existIDs.containsKey(param1.attribute("id")))
         {
            this.id = param1.attribute("id");
            Prop._existIDs.push(this.id,this.id);
         }
         if(param1.hasOwnProperty("@" + TextComponentManager.XML_ATTRIBUTE_NAME_COMPONENT_ROLE))
         {
            this.componentRole = String(param1.attribute(TextComponentManager.XML_ATTRIBUTE_NAME_COMPONENT_ROLE)[0]);
         }
         if(_loc10_)
         {
            if(param5)
            {
               this.init(_loc10_,param2);
            }
            else
            {
               super.thumb = _loc10_;
            }
            if(param1.dcsn.length() > 0)
            {
               this.defaultColorSetId = String(param1.dcsn);
               this.defaultColorSet = Thumb(this.thumb).getColorSetById(this.defaultColorSetId);
            }
            if(_loc9_ == ThemeConstants.INFOGRAPHICS_THEME_ID)
            {
               _loc13_ = new UtilHashSelectedColor();
               _loc14_ = new SelectedColor("ccColorA",uint.MAX_VALUE,4674913);
               _loc13_.push(_loc14_.areaName,_loc14_);
               _loc15_ = new SelectedColor("ccColorB",uint.MAX_VALUE,15946832);
               _loc13_.push(_loc15_.areaName,_loc15_);
               this.defaultColorSet = _loc13_;
            }
            _loc12_ = 0;
            while(_loc12_ < param1.child("color").length())
            {
               _loc11_ = param1.child("color")[_loc12_];
               _loc16_ = new SelectedColor(_loc11_.@r,_loc11_.attribute("oc").length() == 0?uint(uint.MAX_VALUE):uint(_loc11_.@oc),uint(_loc11_));
               this.addCustomColor(_loc11_.@r,_loc16_);
               _loc12_++;
            }
            if(!this is VideoProp)
            {
               updateColor();
            }
            if(param2 == null && param3 != null)
            {
               this.scene = param3;
               if(param1.hasOwnProperty(XML_NODE_NAME_X))
               {
                  _loc17_ = String(param1.x).split(XML_VALUE_STRING_DELIMITER);
               }
               if(param1.hasOwnProperty(XML_NODE_NAME_Y))
               {
                  _loc18_ = String(param1.y).split(XML_VALUE_STRING_DELIMITER);
               }
               if(param1.hasOwnProperty(XML_NODE_NAME_X_SCALE))
               {
                  _loc19_ = String(param1.xscale).split(XML_VALUE_STRING_DELIMITER);
               }
               if(param1.hasOwnProperty(XML_NODE_NAME_Y_SCALE))
               {
                  _loc20_ = String(param1.yscale).split(XML_VALUE_STRING_DELIMITER);
               }
               if(param1.hasOwnProperty(XML_NODE_NAME_ROTATION))
               {
                  _loc21_ = String(param1.rotation).split(XML_VALUE_STRING_DELIMITER);
               }
               if(param1.hasOwnProperty(XML_NODE_NAME_FACING))
               {
                  _loc22_ = String(param1.face).split(XML_VALUE_STRING_DELIMITER);
               }
               this.setReferencePoint(_loc17_[0],_loc18_[0]);
               this.move(_loc17_[0],_loc18_[0]);
               this.scaleX = _loc19_[0];
               this.scaleY = _loc20_[0];
               this.rotation = _loc21_[0];
               if(_loc22_[0] == "1")
               {
                  this.facing = this.defaultFacing;
               }
               else if(_loc22_[0] == "-1")
               {
                  if(this.defaultFacing == AnimeConstants.FACING_LEFT)
                  {
                     this.facing = AnimeConstants.FACING_RIGHT;
                  }
                  else if(this.defaultFacing == AnimeConstants.FACING_RIGHT)
                  {
                     this.facing = AnimeConstants.FACING_LEFT;
                  }
               }
               if(param1.@attached == "Y")
               {
                  this.attachedBg = true;
               }
               this.deserializeMotion(param1,_loc17_,_loc18_,_loc21_,_loc19_,_loc20_);
            }
            if(param5)
            {
               this.state = _loc10_.getStateById(_loc7_);
            }
            else
            {
               this._state = _loc10_.getStateById(_loc7_);
               this._stateId = _loc7_;
            }
            if(this.state != null && this.state.imageData != null)
            {
               this.isLoadded = true;
            }
         }
      }
      
      protected function deserializeMotion(param1:XML, param2:Array, param3:Array, param4:Array, param5:Array, param6:Array) : void
      {
         var _loc7_:MotionData = null;
         var _loc8_:Vector.<Point> = null;
         var _loc9_:int = 0;
         if(param2.length > 1 && param2.length == param3.length)
         {
            _loc7_ = new MotionData();
            _loc8_ = new Vector.<Point>();
            _loc9_ = 0;
            while(_loc9_ < param2.length)
            {
               _loc8_.push(new Point(param2[_loc9_],param3[_loc9_]));
               _loc9_++;
            }
            _loc7_.path = _loc8_;
            _loc7_.startRotation = this.rotation;
            if(param1.hasOwnProperty(MotionData.XML_TAG_NAME))
            {
               _loc7_.convertFromXml(param1.child(MotionData.XML_TAG_NAME)[0]);
            }
            else
            {
               _loc7_.version = "1";
            }
            this.motionData = _loc7_;
            if(this._motionShadow)
            {
               this._motionShadow.setReferencePoint(param2[param2.length - 1],param3[param3.length - 1]);
               this._motionShadow.move(param2[param2.length - 1],param3[param3.length - 1]);
               if(param4 && param4.length > 1)
               {
                  this._motionShadow.rotation = param4[param4.length - 1];
               }
               if(param5 && param5.length > 1 && param6 && param6.length > 1)
               {
                  this._motionShadow.scaleX = param5[param5.length - 1];
                  this._motionShadow.scaleY = param6[param6.length - 1];
               }
            }
         }
      }
      
      override public function cloneNext() : Asset
      {
         var _loc1_:Prop = this.clone() as Prop;
         if(this._motionShadow)
         {
            _loc1_.facing = this._motionShadow.facing;
            _loc1_.scaleX = this._motionShadow.scaleX;
            _loc1_.scaleY = this._motionShadow.scaleY;
            _loc1_.rotation = this._motionShadow.rotation;
            _loc1_.move(this._motionShadow.x,this._motionShadow.y);
            _loc1_.setReferencePoint(this._motionShadow.referenceX,this._motionShadow.referenceY);
            _loc1_.removeSlideMotion();
         }
         return _loc1_;
      }
      
      override public function clone(param1:Boolean = false, param2:AnimeScene = null) : Asset
      {
         var _loc3_:Prop = new Prop();
         if(this.char == null)
         {
            _loc3_.x = this.x;
            _loc3_.y = this.y;
            _loc3_.scaleX = this.scaleX;
            _loc3_.scaleY = this.scaleY;
            _loc3_.rotation = this.rotation;
            _loc3_.scene = this.scene;
         }
         _loc3_.id = this.id;
         _loc3_.attachedBg = this.attachedBg;
         _loc3_.init(Thumb(this.thumb),this.char);
         _loc3_.facing = this.facing;
         _loc3_.stateId = this.stateId;
         _loc3_.state = this.state;
         _loc3_.lookAtCamera = this.lookAtCamera;
         _loc3_.customColor = this.customColor.clone();
         _loc3_.defaultColorSet = this.defaultColorSet.clone();
         _loc3_.setReferencePoint(this.referenceX,this.referenceY);
         _loc3_.componentRole = this.componentRole;
         if(this._imageLocalCenter)
         {
            _loc3_.imageLocalCenter = this._imageLocalCenter.clone();
         }
         if(this._motionData)
         {
            _loc3_.motionData = this._motionData.clone();
         }
         if(this._motionShadow)
         {
            _loc3_.motionShadow = this._motionShadow.clone() as Prop;
         }
         return _loc3_;
      }
      
      public function reloadAssetImage() : void
      {
         this.loadAssetImage();
      }
      
      override protected function loadAssetImage() : void
      {
         this.dispatchEvent(new CoreEvent(CoreEvent.LOAD_ASSET_COMPLETE,this));
      }
      
      public function init(param1:Thumb, param2:Character) : void
      {
         this.thumb = param1;
         if(param2 != null)
         {
            this.char = param2;
            this.scene = param2.scene;
         }
      }
      
      override public function doChangeColor(param1:String, param2:uint = 4.294967295E9) : Number
      {
         var _loc3_:Number = super.doChangeColor(param1,param2);
         if(this._motionShadow)
         {
            this._motionShadow.doChangeColor(param1,param2);
         }
         return _loc3_;
      }
      
      override public function restoreColor() : void
      {
         super.restoreColor();
         if(this._motionShadow)
         {
            this._motionShadow.restoreColor();
         }
      }
      
      public function flipIt() : void
      {
         this.facing = this.facing == AnimeConstants.FACING_LEFT?AnimeConstants.FACING_RIGHT:AnimeConstants.FACING_LEFT;
         if(this._motionShadow)
         {
            this._motionShadow.flipIt();
         }
      }
      
      public function changeState(param1:State) : void
      {
         var _loc2_:PropThumb = null;
         var _loc3_:UtilLoadMgr = null;
         var _loc4_:Array = null;
         if(param1.imageData != null)
         {
            this.updateState(param1);
         }
         else
         {
            _loc2_ = PropThumb(this.thumb);
            _loc3_ = new UtilLoadMgr();
            _loc4_ = new Array();
            _loc4_.push(param1);
            _loc3_.setExtraData(_loc4_);
            _loc3_.addEventDispatcher(_loc2_,CoreEvent.LOAD_THUMB_COMPLETE);
            _loc3_.addEventListener(LoadMgrEvent.ALL_COMPLETE,this.updateStateAgain);
            _loc3_.commit();
            _loc2_.loadState(param1);
         }
      }
      
      private function updateStateAgain(param1:LoadMgrEvent) : void
      {
         var _loc2_:UtilLoadMgr = param1.target as UtilLoadMgr;
         var _loc3_:Array = _loc2_.getExtraData() as Array;
         var _loc4_:State = _loc3_[0] as State;
         this.updateState(_loc4_);
      }
      
      private function updateState(param1:State) : void
      {
         try
         {
            this.state = param1;
            if(this._motionShadow != null)
            {
               this._motionShadow.state = param1;
            }
            if(this.char != null)
            {
               switch(this.char.thumb.raceCode)
               {
                  case RaceConstants.CUSTOM_CHARACTER:
                     this.char.updatePropState(Thumb(this.thumb),this.state);
                     break;
                  case RaceConstants.SKINNED_SWF:
                     this.char.updatePropState(Thumb(this.thumb),this.state);
               }
               this.char.onPropChange();
            }
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      public function startSlideMotion() : void
      {
         var _loc1_:MotionData = null;
         var _loc2_:int = 0;
         if(!this._motionData)
         {
            _loc1_ = new MotionData();
            _loc1_.moveStartPoint(this.x,this.y);
            _loc1_.moveEndPoint(this.x,this.y);
            _loc1_.startRotation = this.rotation;
            _loc2_ = this.x > AnimeConstants.STAGE_WIDTH / 2?-100:100;
            _loc1_.endX = _loc1_.endX + _loc2_;
            this.motionData = _loc1_;
         }
      }
      
      private function onMotionChange(param1:Event) : void
      {
         if(this._motionData && this._motionShadow)
         {
            if(this._motionData.pathOriented)
            {
               this._motionShadow.isRotatable = false;
               this._motionShadow.rotation = this._motionData.endRotation;
            }
            else
            {
               this._motionShadow.isRotatable = true;
            }
         }
      }
      
      public function set motionData(param1:MotionData) : void
      {
         if(param1 != this._motionData)
         {
            this.motionShadow = null;
            if(this._motionData)
            {
               this._motionData.removeEventListener(Event.CHANGE,this.onMotionChange);
               this._motionData = null;
            }
            if(param1)
            {
               this.addMotionShadow();
               this._motionData = param1.clone();
               this._motionData.addEventListener(Event.CHANGE,this.onMotionChange);
               if(this._motionShadow)
               {
                  this._motionShadow.move(this._motionData.endX,this._motionData.endY);
                  this._motionShadow.setReferencePoint(this._motionData.endX,this._motionData.endY);
                  if(this._motionData.pathOriented)
                  {
                     this._motionShadow.isRotatable = false;
                     this._motionShadow.rotation = this._motionData.endRotation;
                  }
                  else
                  {
                     this._motionShadow.isRotatable = true;
                  }
               }
            }
            this.dispatchEvent(new AssetEvent(AssetEvent.MOTION_CHANGE,this));
         }
      }
      
      public function get slideEnabled() : Boolean
      {
         return true;
      }
      
      public function removeSlideMotion() : void
      {
         this.motionData = null;
      }
      
      public function get isSliding() : Boolean
      {
         return this._motionShadow != null;
      }
      
      public function get isRotatable() : Boolean
      {
         return this._rotation.enabled;
      }
      
      public function set isRotatable(param1:Boolean) : void
      {
         if(this._rotation.enabled != param1)
         {
            this._rotation.enabled = param1;
            this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED,this));
         }
      }
      
      public function get rotation() : Number
      {
         return this._rotation.rotation;
      }
      
      public function set rotation(param1:Number) : void
      {
         if(param1 != this.rotation)
         {
            this._rotation.rotation = param1;
            if(this._motionData)
            {
               this._motionData.startRotation = this.rotation;
            }
            this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_ROTATED,this));
         }
      }
      
      public function updateImageSize(param1:Number, param2:Number) : void
      {
         var _loc3_:Number = NaN;
         if(this._isSwapping)
         {
            this._isSwapping = false;
            _loc3_ = this._preSwapHeight / _scaleY / param2;
            _scaleX = _scaleX * _loc3_;
            _scaleY = _scaleY * _loc3_;
            dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED,this));
         }
         this._imageWidth = param1;
         this._imageHeight = param2;
      }
      
      public function get preSwapHeight() : Number
      {
         return this._preSwapHeight;
      }
      
      public function get preSwapWidth() : Number
      {
         return this._preSwapWidth;
      }
      
      public function swapWithThumb(param1:PropThumb) : void
      {
         if(param1)
         {
            this._imageLocalCenter = null;
            this._isSwapping = true;
            this._preSwapWidth = this._imageWidth * _scaleX;
            this._preSwapHeight = this._imageHeight * _scaleY;
            this.thumb = param1;
            if(param1.states.length > 0)
            {
               this.changeState(param1.defaultState);
            }
            else
            {
               this._state = null;
               this._stateId = null;
               dispatchEvent(new AssetEvent(AssetEvent.STATE_CHANGE,this));
            }
            if(this._motionShadow)
            {
               this._motionShadow.swapWithThumb(param1);
            }
         }
      }
   }
}
