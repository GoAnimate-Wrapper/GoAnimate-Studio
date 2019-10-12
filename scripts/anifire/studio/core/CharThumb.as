package anifire.studio.core
{
   import anifire.component.CcActionLoader;
   import anifire.constant.AnimeConstants;
   import anifire.constant.CcLibConstant;
   import anifire.constant.RaceConstants;
   import anifire.constant.ServerConstants;
   import anifire.constant.ThemeConstants;
   import anifire.event.CoreEvent;
   import anifire.event.StudioEvent;
   import anifire.interfaces.IBehavior;
   import anifire.managers.CCBodyManager;
   import anifire.managers.CCThemeManager;
   import anifire.models.creator.CCBodyModel;
   import anifire.models.creator.CCCharacterActionModel;
   import anifire.models.creator.CCThemeModel;
   import anifire.studio.managers.ThemeManager;
   import anifire.util.UtilCrypto;
   import anifire.util.UtilHashArray;
   import anifire.util.UtilHashBytes;
   import anifire.util.UtilNetwork;
   import anifire.util.UtilPlain;
   import anifire.util.UtilString;
   import anifire.util.UtilURLStream;
   import anifire.util.UtilUser;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.geom.Rectangle;
   import flash.net.URLRequest;
   import flash.net.URLStream;
   import flash.utils.ByteArray;
   import mx.controls.Alert;
   import nochump.util.zip.ZipEntry;
   import nochump.util.zip.ZipFile;
   
   public class CharThumb extends Thumb
   {
      
      public static const XML_NODE_NAME:String = "char";
      
      public static const CATEGORY_TAG_PREFIX:String = "_cat:";
      
      public static const TAG_CATEGORY_PATTERN:RegExp = /^\s*_?cat:(.+)\s*$/;
      
      public static const XML_ATTRIBUTE_NAME_ITEM_REF:String = "itemRef";
       
      
      private var _facing:String;
      
      private var _actions:Vector.<Action>;
      
      private var _actionLookup:Object;
      
      private var _defaultActionId:String;
      
      private var _defaultMotionId:String;
      
      private var _motions:Vector.<Motion>;
      
      private var _motionLookup:Object;
      
      private var _facials:Vector.<Facial>;
      
      private var _facialLookup:Object;
      
      private var _libraries:UtilHashBytes;
      
      private var _defaultTalkAction:Action;
      
      private var _defaultAction:Action;
      
      private var _defaultMotion:Motion;
      
      private var _isLoadingActionMotion:Boolean = false;
      
      private var _isZipLoaded:Boolean = false;
      
      private var _ccThemeId:String;
      
      private var _numCcAction:int = 0;
      
      private var _numTotalCcAction:int = 0;
      
      private var _copyable:Boolean = true;
      
      private var _tray:String;
      
      private var _propXML:Vector.<XML>;
      
      private var _propThumb:PropThumb;
      
      private var _mThumbId:String;
      
      private var _processed:Boolean;
      
      protected var _originalTheme:Theme;
      
      protected var _isFromThemeStarter:Boolean;
      
      protected var _itemRef:String;
      
      private var _ccThemeModel:CCThemeModel;
      
      private var _locked:Boolean;
      
      protected var _processedActionXML:Boolean;
      
      private var _ccBodyModel:CCBodyModel;
      
      private var _thumbnailUrl:String;
      
      public var thumbBitmapData:BitmapData;
      
      protected var _actionIdToLoad:String;
      
      public function CharThumb()
      {
         this._facing = AnimeConstants.FACING_UNKNOW;
         this._propXML = new Vector.<XML>();
         super();
         this.clearActionData();
         this._facials = new Vector.<Facial>();
         this._facialLookup = {};
         this._libraries = new UtilHashBytes();
      }
      
      public function get isFromThemeStarter() : Boolean
      {
         return this._isFromThemeStarter;
      }
      
      public function set isFromThemeStarter(param1:Boolean) : void
      {
         this._isFromThemeStarter = param1;
      }
      
      public function get originalTheme() : Theme
      {
         return this._originalTheme;
      }
      
      public function get ccThemeModel() : CCThemeModel
      {
         if(!this._ccThemeModel && this._ccThemeId)
         {
            this._ccThemeModel = CCThemeManager.instance.getThemeModel(this._ccThemeId);
         }
         return this._ccThemeModel;
      }
      
      public function get ccBodyModel() : CCBodyModel
      {
         if(!this._ccBodyModel)
         {
            this._ccBodyModel = CCBodyManager.instance.getBodyModel(this.id);
         }
         return this._ccBodyModel;
      }
      
      public function get processed() : Boolean
      {
         return this._processed;
      }
      
      public function get mThumbId() : String
      {
         return this._mThumbId;
      }
      
      public function set mThumbId(param1:String) : void
      {
         this._mThumbId = param1;
      }
      
      public function get propXML() : Vector.<XML>
      {
         return this._propXML;
      }
      
      public function set propXML(param1:Vector.<XML>) : void
      {
         this._propXML = param1;
      }
      
      public function get tray() : String
      {
         return this._tray;
      }
      
      public function set tray(param1:String) : void
      {
         this._tray = param1;
      }
      
      public function get locked() : Boolean
      {
         return this._locked;
      }
      
      protected function clearActionData() : void
      {
         this._actions = new Vector.<Action>();
         this._actionLookup = {};
         this._motions = new Vector.<Motion>();
         this._motionLookup = {};
         this._defaultAction = null;
         this._defaultMotion = null;
         this._defaultTalkAction = null;
      }
      
      public function isSWFCharacter() : Boolean
      {
         if(this.defaultAction)
         {
            return UtilString.hasSWFextension(this.defaultAction.id);
         }
         return false;
      }
      
      public function getIsZipLoaded() : Boolean
      {
         return this._isZipLoaded;
      }
      
      private function setIsZipLoaded(param1:Boolean) : void
      {
         this._isZipLoaded = param1;
      }
      
      public function addLibrary(param1:String, param2:Object) : void
      {
         this._libraries.push(param1,param2 as ByteArray);
      }
      
      public function getLibraryNum() : Number
      {
         return this._libraries.length;
      }
      
      public function getLibraryById(param1:String) : Object
      {
         return this._libraries.getValueByKey(param1);
      }
      
      public function getLibraryIdByIndex(param1:Number) : String
      {
         return this._libraries.getKey(param1);
      }
      
      public function getLibraries() : UtilHashBytes
      {
         return this._libraries;
      }
      
      public function addAction(param1:Action) : void
      {
         this._actions.push(param1);
         this._actionLookup[param1.id] = param1;
      }
      
      private function createActionByXML(param1:XML) : Action
      {
         var _loc2_:Action = null;
         var _loc3_:Motion = null;
         var _loc4_:XML = null;
         var _loc7_:int = 0;
         var _loc9_:Array = null;
         var _loc10_:Number = NaN;
         var _loc5_:Vector.<XML> = new Vector.<XML>();
         var _loc6_:Boolean = false;
         var _loc8_:String = this.xml.attribute["default"];
         if(param1.name().localName == Motion.XML_NODE_NAME)
         {
            _loc6_ = true;
         }
         if(_loc6_)
         {
            _loc3_ = new Motion(this,param1.@id,param1.@name,param1.@totalframe,param1.@enable,param1.@aid);
            _loc3_.defaultActionId = _loc8_;
            this.addMotion(_loc3_);
         }
         if(param1.prop.length() > 0)
         {
            _loc7_ = 0;
            while(_loc7_ < param1.prop.length())
            {
               _loc4_ = param1.prop[_loc7_];
               _loc5_.push(_loc4_);
               _loc7_++;
            }
         }
         if(param1.hasOwnProperty("@seq") && String(param1.@seq) != "" && Number(param1.@seq) > 0)
         {
            _loc9_ = new Array();
            _loc10_ = 0;
            while(_loc10_ < Number(param1.@seq))
            {
               _loc9_.push(_loc10_);
               _loc10_++;
            }
         }
         if(_loc9_)
         {
            _loc2_ = new SequentialAction(this,param1.@id,param1.@name,param1.@totalframe,param1.@enable,param1.@aid,_loc5_);
            SequentialAction(_loc2_).actionSequence.init(_loc9_);
         }
         else
         {
            _loc2_ = new Action(this,param1.@id,param1.@name,param1.@totalframe,param1.@enable,param1.@aid,_loc5_);
         }
         _loc2_.defaultActionId = _loc8_;
         if(param1.@next.length() > 0)
         {
            _loc2_.nextActionId = param1.@next;
         }
         _loc2_.isMotion = _loc6_;
         this.addAction(_loc2_);
         return _loc2_;
      }
      
      private function createAction(param1:String) : Action
      {
         var _loc2_:Action = null;
         var _loc3_:CCCharacterActionModel = null;
         var _loc4_:Vector.<XML> = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:XML = null;
         if(param1 && this.ccBodyModel.completed)
         {
            _loc3_ = this.ccThemeModel.getCharacterActionModel(this.ccBodyModel,param1);
            if(_loc3_ && _loc3_.actionModel)
            {
               _loc4_ = new Vector.<XML>();
               if(_loc3_.actionModel.propXML)
               {
                  _loc5_ = _loc3_.actionModel.propXML.length();
                  _loc6_ = 0;
                  while(_loc6_ < _loc5_)
                  {
                     _loc7_ = _loc3_.actionModel.propXML[_loc6_];
                     _loc4_.push(_loc7_);
                     _loc6_++;
                  }
               }
               _loc2_ = new Action(this,_loc3_.actionModel.id,_loc3_.actionModel.name,_loc3_.actionModel.totalframe,"Y","",_loc4_);
               _loc2_.isMotion = _loc3_.actionModel.isMotion;
               _loc2_.defaultActionId = _loc3_.defaultActionId;
               _loc2_.nextActionId = _loc3_.actionModel.nextActionId;
               this.addAction(_loc2_);
            }
         }
         return _loc2_;
      }
      
      public function getActionByIdWithDefault(param1:String) : Action
      {
         var _loc2_:Action = this.getActionById(param1);
         if(!_loc2_)
         {
            _loc2_ = this.defaultAction as Action;
         }
         return _loc2_;
      }
      
      public function getActionById(param1:String) : Action
      {
         if(!this.ccThemeModel && !this._processedActionXML)
         {
            this.deserializeAction();
         }
         var _loc2_:Action = this._actionLookup[param1];
         if(!_loc2_ && this.ccThemeModel)
         {
            _loc2_ = this.createAction(param1);
         }
         return _loc2_;
      }
      
      public function getActionAt(param1:int) : Action
      {
         return this._actions[param1] as Action;
      }
      
      public function getActionNum() : int
      {
         return this._actions.length;
      }
      
      public function get facials() : Vector.<Facial>
      {
         return this._facials;
      }
      
      public function addFacial(param1:Facial) : void
      {
         this._facials.push(param1);
         this._facialLookup[param1.id] = param1;
      }
      
      public function getFacialById(param1:String) : Facial
      {
         return this._facialLookup[param1];
      }
      
      public function getFacialAt(param1:int) : Facial
      {
         return this._facials[param1];
      }
      
      public function getMotionByIdWithDefault(param1:String) : Motion
      {
         var _loc2_:Motion = this._motionLookup[param1];
         if(!_loc2_)
         {
            _loc2_ = this.defaultMotion as Motion;
         }
         return _loc2_;
      }
      
      public function getMotionById(param1:String) : Motion
      {
         var _loc2_:Motion = this._motionLookup[param1];
         if(!_loc2_)
         {
            this.getActionById(param1);
            _loc2_ = this._motionLookup[param1];
         }
         return _loc2_;
      }
      
      public function addMotion(param1:Motion) : void
      {
         this._motions.push(param1);
         this._motionLookup[param1.id] = param1;
      }
      
      public function getMotionAt(param1:int) : Motion
      {
         return this._motions[param1];
      }
      
      public function getMotionNum() : int
      {
         return this._motions.length;
      }
      
      public function get facing() : String
      {
         return this._facing;
      }
      
      public function set facing(param1:String) : void
      {
         this._facing = param1;
      }
      
      public function get motions() : Vector.<Motion>
      {
         return this._motions;
      }
      
      public function get defaultTalkAction() : Action
      {
         var _loc1_:XMLList = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:XML = null;
         var _loc5_:String = null;
         if(!this._defaultTalkAction)
         {
            if(this.xml)
            {
               _loc1_ = this.xml..action;
               _loc2_ = _loc1_.length();
               _loc3_ = 0;
               while(_loc3_ < _loc2_)
               {
                  _loc4_ = _loc1_[_loc3_];
                  if(_loc4_.hasOwnProperty("@id"))
                  {
                     _loc5_ = _loc4_.@id.toString();
                     if(_loc5_.search("talk") > -1 && _loc5_.search("phone") == -1)
                     {
                        this._defaultAction = this.getActionById(_loc4_.@id);
                     }
                  }
                  _loc3_++;
               }
            }
         }
         return this._defaultTalkAction;
      }
      
      public function get defaultStandActionId() : String
      {
         if(this.ccThemeModel && this.ccBodyModel && this.ccBodyModel.completed)
         {
            return this.ccThemeModel.getCharacterDefaultActionId(this.ccBodyModel.bodyShapeId);
         }
         return this.defaultActionId;
      }
      
      public function get defaultActionId() : String
      {
         if(!this._defaultActionId)
         {
            if(this.ccThemeModel && this.ccBodyModel && this.ccBodyModel.completed)
            {
               this._defaultActionId = this.ccThemeModel.getCharacterDefaultActionId(this.ccBodyModel.bodyShapeId);
            }
            else if(this.xml)
            {
               this._defaultActionId = String(this.xml.@§default§);
            }
         }
         return this._defaultActionId;
      }
      
      override public function get defaultAction() : IBehavior
      {
         var _loc1_:String = null;
         if(!this._defaultAction)
         {
            if(this.ccThemeModel && this.ccBodyModel.completed && !this._isFromThemeStarter)
            {
               _loc1_ = this.ccBodyModel.bodyShapeId;
               this._defaultAction = this.getActionById(this.ccThemeModel.getCharacterDefaultActionId(_loc1_));
            }
            else if(xml)
            {
               if(this._defaultActionId)
               {
                  this._defaultAction = this.getActionById(this._defaultActionId);
               }
               else
               {
                  this._defaultAction = this.getActionById(xml.@§default§);
               }
            }
         }
         return this._defaultAction;
      }
      
      public function get defaultMotion() : Motion
      {
         if(!this._defaultMotion)
         {
            this._defaultMotion = this.getMotionById(this.defaultMotionId);
         }
         return this._defaultMotion;
      }
      
      public function get defaultMotionId() : String
      {
         var _loc1_:String = null;
         if(!this._defaultMotionId)
         {
            if(this.ccThemeModel && this.ccBodyModel.completed)
            {
               _loc1_ = this.ccBodyModel.bodyShapeId;
               this._defaultMotionId = this.ccThemeModel.getCharacterDefaultMotionId(_loc1_);
            }
            else if(this.xml)
            {
               this._defaultMotionId = String(this.xml.@motion);
            }
         }
         return this._defaultMotionId;
      }
      
      public function get themeOrCCThemeId() : String
      {
         if(this._ccThemeId != null && this._ccThemeId != "")
         {
            return this._ccThemeId;
         }
         return theme.id;
      }
      
      public function get ccThemeId() : String
      {
         return this._ccThemeId;
      }
      
      public function set ccThemeId(param1:String) : void
      {
         this._ccThemeId = param1;
      }
      
      public function get isBusinessTheme() : Boolean
      {
         switch(this.themeOrCCThemeId)
         {
            case ThemeConstants.BUSINESS_THEME_ID:
            case ThemeConstants.BIZ_MODEL_THEME_ID:
            case ThemeConstants.STICKLY_BIZ_THEME_ID:
            case ThemeConstants.WHITEBOARD_THEME_ID:
            case ThemeConstants.INFOGRAPHICS_THEME_ID:
               return true;
            default:
               return false;
         }
      }
      
      public function get copyable() : Boolean
      {
         return this._copyable;
      }
      
      public function get thumbnailUrl() : String
      {
         if(this._thumbnailUrl != null && this._thumbnailUrl != "")
         {
            return this._thumbnailUrl;
         }
         return null;
      }
      
      override public function deSerialize(param1:XML, param2:Theme) : void
      {
         this.id = param1.@id;
         this._defaultActionId = param1.@§default§;
         this._ccThemeId = param1.@cc_theme_id;
         this._isFromThemeStarter = false;
         this.doDeserialize(param1,param2);
         if(param1.hasOwnProperty("@" + XML_ATTRIBUTE_NAME_ITEM_REF))
         {
            this._itemRef = String(param1.attribute(XML_ATTRIBUTE_NAME_ITEM_REF)[0]);
         }
      }
      
      public function deSerializeForThemeStarter(param1:XML, param2:Theme, param3:String, param4:String) : void
      {
         this.id = param3;
         this._defaultActionId = param4;
         this._ccThemeId = Console.getConsole().selectedStarterThumb.themeId;
         this._isFromThemeStarter = true;
         if(!param1.hasOwnProperty("@starter_char_id"))
         {
            param1.@starter_char_id = param1.@id;
         }
         param1.@id = param3;
         param1.@cc_theme_id = this._ccThemeId;
         this.doDeserialize(param1,param2);
      }
      
      protected function doDeserialize(param1:XML, param2:Theme) : void
      {
         var _loc4_:XML = null;
         var _loc5_:Facial = null;
         var _loc7_:int = 0;
         var _loc8_:XML = null;
         var _loc9_:XML = null;
         var _loc10_:* = null;
         var _loc11_:String = null;
         this.xml = param1;
         this.setFileName("char/" + param1.@id + "/" + param1.@thumb);
         this.aid = param1.@aid;
         this.encAssetId = param1.@enc_asset_id;
         this.name = param1.@name;
         this._originalTheme = param2 as Theme;
         if(this._originalTheme.isCCTheme)
         {
            this.theme = ThemeManager.instance.ccTheme;
         }
         else
         {
            this.theme = param2;
         }
         this.enable = param1.@enable != "N"?true:false;
         this.raceCode = this._ccThemeId.length > 0?1:0;
         if(param1.@raceCode.length() > 0)
         {
            this.raceCode = int(param1.@raceCode);
         }
         this.encryptId = param1.@encryptId;
         this._locked = param1.@locked == "Y";
         editable = UtilUser.isContentAdmin && isCC;
         this._copyable = param1.@copyable != "N";
         this._thumbnailUrl = param1.@thumbnail_url;
         if(param1.hasOwnProperty("@path"))
         {
            this.path = String(param1.@path);
         }
         _loc7_ = 0;
         while(_loc7_ < param1.prop.length())
         {
            this.propXML.push(param1.prop[_loc7_]);
            _loc7_++;
         }
         if(Console.getConsole().excludedIds.containsKey(this.aid))
         {
            this.enable = false;
         }
         if(param1.@facing == AnimeConstants.FACING_LEFT || param1.@facing == AnimeConstants.FACING_RIGHT)
         {
            this.facing = param1.@facing;
         }
         else
         {
            this.facing = AnimeConstants.FACING_LEFT;
         }
         tags = param1.child("tags");
         var _loc3_:XMLList = param1.child("tag");
         _loc7_ = 0;
         while(_loc7_ < _loc3_.length())
         {
            sysTags.push(_loc3_[_loc7_]);
            _loc7_++;
         }
         if(this.theme.id == "ugc")
         {
            this.isPublished = param1.@published == "1"?true:false;
         }
         var _loc6_:int = param1.category.length();
         _loc7_ = 0;
         this.clearActionData();
         this._facials = new Vector.<Facial>();
         this._facialLookup = {};
         _loc7_ = 0;
         while(_loc7_ < param1.library.length())
         {
            _loc4_ = param1.library[_loc7_];
            _loc10_ = this.themeId + "." + _loc4_.@type + "." + _loc4_.@component_id + ".swf";
            this.addLibrary(_loc10_,null);
            _loc7_++;
         }
         _loc7_ = 0;
         while(_loc7_ < param1.colorset.length())
         {
            _loc8_ = param1.colorset[_loc7_];
            _loc11_ = _loc8_.attribute("aid").length() == 0?"0":_loc8_.@aid;
            colorRef.push(_loc11_,_loc8_);
            _loc7_++;
         }
         _loc7_ = 0;
         while(_loc7_ < param1.c_parts.c_area.length())
         {
            _loc9_ = param1.c_parts.c_area[_loc7_];
            if(param1.c_parts.@enable != "N")
            {
               colorParts.push(_loc9_,_loc9_.attribute("oc").length() == 0?uint.MAX_VALUE:_loc9_.@oc);
            }
            _loc7_++;
         }
         if(this.getLibraryNum() > 0)
         {
            raceCode = RaceConstants.SKINNED_SWF;
         }
      }
      
      private function deserializeAction() : void
      {
         var _loc1_:XML = null;
         this.clearActionData();
         var _loc2_:XMLList = this.xml..action as XMLList;
         var _loc3_:XMLList = this.xml..motion as XMLList;
         for each(_loc1_ in _loc2_)
         {
            this.createActionByXML(_loc1_);
         }
         for each(_loc1_ in _loc3_)
         {
            this.createActionByXML(_loc1_);
         }
         this._processedActionXML = true;
      }
      
      override public function isThumbReady(param1:String = "") : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:Action = null;
         var _loc5_:Motion = null;
         if(this.ccThemeModel && !this.ccBodyModel.completed)
         {
            return false;
         }
         if(this.getIsZipLoaded())
         {
            return true;
         }
         if(theme.id == "ugc")
         {
            if(this.isSWFCharacter())
            {
               _loc3_ = 0;
               while(_loc3_ < this._actions.length)
               {
                  _loc4_ = this._actions[_loc3_] as Action;
                  if(!_loc4_.imageData)
                  {
                     return false;
                  }
                  _loc3_++;
               }
               _loc3_ = 0;
               while(_loc3_ < this.motions.length)
               {
                  _loc5_ = this.motions[_loc3_] as Motion;
                  if(!_loc5_.imageData)
                  {
                     return false;
                  }
                  _loc3_++;
               }
            }
         }
         if(param1 == "" && this.defaultAction)
         {
            param1 = this.defaultAction.id;
         }
         var _loc2_:Action = this._actionLookup[param1];
         return param1 && _loc2_ && _loc2_.imageData != null;
      }
      
      private function onLoadCCBodyFinish(param1:Event) : void
      {
         IEventDispatcher(param1.currentTarget).removeEventListener(Event.COMPLETE,this.onLoadCCBodyFinish);
         if(this._actionIdToLoad)
         {
            this.loadActionById(this._actionIdToLoad);
         }
         else
         {
            this.loadAction();
         }
      }
      
      public function loadActionById(param1:String) : void
      {
         this._actionIdToLoad = param1;
         if(this.ccThemeModel && !this.ccBodyModel.completed)
         {
            this.ccBodyModel.addEventListener(Event.COMPLETE,this.onLoadCCBodyFinish);
            this.ccBodyModel.load();
            return;
         }
         var _loc2_:Action = this.getActionByIdWithDefault(this._actionIdToLoad);
         if(_loc2_)
         {
            if(!_loc2_.imageData)
            {
               _loc2_.addEventListener(CoreEvent.LOAD_STATE_COMPLETE,this.onLoadBehaviorComplete);
               if(this.ccThemeModel)
               {
                  _loc2_.loadImageDataByCam(this.ccThemeModel.getCharacterActionModel(this.ccBodyModel,_loc2_.id));
               }
               else
               {
                  _loc2_.loadImageData(ServerConstants.PARAM_CHAR_ACTION,false,this.path);
               }
            }
            else
            {
               dispatchEvent(new CoreEvent(CoreEvent.LOAD_STATE_COMPLETE,this));
            }
         }
         this._actionIdToLoad = null;
      }
      
      public function loadAction(param1:Behavior = null, param2:Boolean = false) : void
      {
         if(this.ccThemeModel && !this.ccBodyModel.completed)
         {
            this.ccBodyModel.addEventListener(Event.COMPLETE,this.onLoadCCBodyFinish);
            this.ccBodyModel.load();
            return;
         }
         if(param1 == null)
         {
            param1 = this.defaultAction as Behavior;
         }
         param1.addEventListener(CoreEvent.LOAD_STATE_COMPLETE,this.onLoadBehaviorComplete);
         if(param1.imageData == null || param1.withSpeech != param2)
         {
            if(param1 is Action)
            {
               if(this.ccThemeModel)
               {
                  param1.loadImageDataByCam(this.ccThemeModel.getCharacterActionModel(this.ccBodyModel,param1.id));
               }
               else
               {
                  param1.loadImageData(ServerConstants.PARAM_CHAR_ACTION,param2,this.path);
               }
            }
            else if(param1 is Facial)
            {
               param1.loadImageData(ServerConstants.PARAM_CHAR_FACIAL,param2,this.path);
            }
         }
      }
      
      private function onLoadBehaviorComplete(param1:Event) : void
      {
         IEventDispatcher(param1.target).removeEventListener(param1.type,this.onLoadBehaviorComplete);
         this.dispatchEvent(param1);
      }
      
      public function loadDefaultActionByBodyModel() : void
      {
         if(!this.ccBodyModel.completed)
         {
            this.ccBodyModel.addEventListener(Event.COMPLETE,this.onCCBodyModelComplete);
            this.ccBodyModel.load();
         }
         else
         {
            dispatchEvent(new StudioEvent(StudioEvent.BODY_MODEL_COMPLETE));
         }
      }
      
      private function onCCBodyModelComplete(param1:Event) : void
      {
         this.ccBodyModel.removeEventListener(Event.COMPLETE,this.onCCBodyModelComplete);
         dispatchEvent(new StudioEvent(StudioEvent.BODY_MODEL_COMPLETE));
      }
      
      public function loadActionsAndMotions() : void
      {
         var _loc1_:URLRequest = null;
         var _loc2_:UtilURLStream = null;
         if(!this._isLoadingActionMotion)
         {
            this._isLoadingActionMotion = true;
            Console.getConsole().requestLoadStatus(true);
            _loc1_ = UtilNetwork.getGetThemeAssetRequest(this.theme.id,this.id,ServerConstants.PARAM_CHAR);
            _loc2_ = new UtilURLStream();
            _loc2_.addEventListener(ProgressEvent.PROGRESS,Console.getConsole().showProgress);
            _loc2_.addEventListener(Event.COMPLETE,this.doLoadActionsAndMotionsCompleted);
            _loc2_.addEventListener(UtilURLStream.TIME_OUT,this.doLoadActionsAndMotionsTimeOut);
            _loc2_.addEventListener(IOErrorEvent.IO_ERROR,this.doLoadActionsAndMotionsIOError);
            _loc2_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.doLoadActionsAndMotionsSecurityError);
            _loc2_.load(_loc1_);
         }
      }
      
      public function initImageData(param1:ZipFile, param2:String) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc6_:ZipEntry = null;
         var _loc7_:UtilCrypto = null;
         var _loc8_:ByteArray = null;
         var _loc9_:ZipFile = null;
         var _loc10_:ZipEntry = null;
         var _loc11_:ByteArray = null;
         var _loc12_:UtilHashArray = null;
         var _loc13_:Action = null;
         var _loc14_:Object = null;
         var _loc20_:XML = null;
         var _loc21_:Motion = null;
         var _loc22_:ByteArray = null;
         var _loc23_:ZipEntry = null;
         var _loc24_:ZipFile = null;
         var _loc25_:int = 0;
         var _loc26_:Number = NaN;
         var _loc27_:State = null;
         var _loc15_:Boolean = this.theme.id != "ugc"?true:false;
         if(!this._processedActionXML)
         {
            this.deserializeAction();
         }
         var _loc16_:Number = this.getActionNum();
         var _loc17_:Number = this.getMotionNum();
         this._numCcAction = 0;
         this._numTotalCcAction = 0;
         _loc3_ = 0;
         while(_loc3_ < _loc16_)
         {
            _loc13_ = this.getActionAt(_loc3_);
            _loc5_ = param2 + _loc13_.id;
            _loc6_ = param1.getEntry(_loc5_);
            if(_loc6_ && isCC)
            {
               this._numTotalCcAction++;
            }
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < _loc16_)
         {
            _loc13_ = this.getActionAt(_loc3_);
            _loc5_ = param2 + _loc13_.id;
            _loc6_ = param1.getEntry(_loc5_);
            if(_loc6_)
            {
               if(!isCC)
               {
                  this.imageData = this.thumbImageData = _loc13_.imageData = param1.getInput(_loc6_);
                  if(_loc15_)
                  {
                     _loc7_ = new UtilCrypto();
                     _loc7_.decrypt(_loc13_.imageData as ByteArray);
                  }
               }
               else if(_loc13_.id.indexOf(".zip") >= 0)
               {
                  _loc8_ = param1.getInput(_loc6_);
                  _loc9_ = new ZipFile(_loc8_);
                  _loc13_.imageData = UtilPlain.convertZipAsImagedataObject(_loc9_);
               }
               else
               {
                  _loc20_ = XML(param1.getInput(_loc6_));
                  this._numCcAction++;
                  _loc13_.addEventListener(CoreEvent.LOAD_STATE_COMPLETE,this.onCcActionReady);
                  _loc13_.loadImageDataByXml(_loc20_);
               }
            }
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < _loc17_)
         {
            _loc21_ = this.getMotionAt(_loc3_);
            _loc5_ = param2 + _loc21_.id;
            _loc6_ = param1.getEntry(_loc5_);
            if(_loc6_)
            {
               _loc21_.imageData = param1.getInput(_loc6_);
               if(_loc15_)
               {
                  _loc7_ = new UtilCrypto();
                  _loc7_.decrypt(_loc21_.imageData as ByteArray);
               }
            }
            _loc3_++;
         }
         var _loc18_:ZipEntry = param1.getEntry(param2 + CcLibConstant.NODE_LIBRARY + ".zip");
         if(_loc18_ != null)
         {
            _loc22_ = param1.getInput(_loc18_) as ByteArray;
            _loc24_ = new ZipFile(_loc22_);
            _loc25_ = 0;
            while(_loc25_ < _loc24_.size)
            {
               _loc23_ = _loc24_.entries[_loc25_];
               this.addLibrary(_loc23_.name,_loc24_.getInput(_loc23_));
               _loc25_++;
            }
         }
         var _loc19_:PropThumb = theme.getPropThumbById(id + ".head") as PropThumb;
         if(_loc19_ != null)
         {
            _loc26_ = _loc19_.states.length;
            _loc3_ = 0;
            while(_loc3_ < _loc26_)
            {
               _loc27_ = _loc19_.getStateAt(_loc3_);
               _loc5_ = param2 + "head/" + _loc27_.id;
               _loc6_ = param1.getEntry(_loc5_);
               if(!isCC)
               {
                  if(_loc6_ != null)
                  {
                     _loc27_.imageData = param1.getInput(param1.getEntry(_loc5_));
                     if(_loc15_)
                     {
                        _loc7_ = new UtilCrypto();
                        _loc7_.decrypt(_loc27_.imageData as ByteArray);
                     }
                  }
               }
               else if(_loc6_ != null)
               {
                  _loc8_ = param1.getInput(_loc6_);
                  _loc9_ = new ZipFile(_loc8_);
                  _loc27_.imageData = UtilPlain.convertZipAsImagedataObject(_loc9_);
               }
               _loc3_++;
            }
         }
         if(!isCC || this._numCcAction == 0)
         {
            this.dispatchEvent(new CoreEvent(CoreEvent.LOAD_THUMB_COMPLETE,this));
         }
      }
      
      public function onCcActionReady(param1:Event) : void
      {
         if(this._numTotalCcAction == this._numCcAction)
         {
            this.dispatchEvent(new CoreEvent(CoreEvent.LOAD_THUMB_COMPLETE,this));
         }
      }
      
      public function BitmapDataToByteArray(param1:DisplayObject) : ByteArray
      {
         var _loc2_:uint = param1.width;
         var _loc3_:uint = param1.height;
         var _loc4_:BitmapData = new BitmapData(_loc2_,_loc3_);
         _loc4_.draw(param1);
         var _loc5_:ByteArray = _loc4_.getPixels(new Rectangle(0,0,_loc2_,_loc3_));
         _loc5_.writeShort(_loc3_);
         _loc5_.writeShort(_loc2_);
         return _loc5_;
      }
      
      private function doLoadActionsAndMotionsIOError(param1:IOErrorEvent) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.doLoadActionsAndMotionsIOError);
         Console.getConsole().requestLoadStatus(false);
         this._isLoadingActionMotion = false;
         Alert.show("Error in loading character action",param1.type);
      }
      
      private function doLoadActionsAndMotionsSecurityError(param1:SecurityErrorEvent) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.doLoadActionsAndMotionsSecurityError);
         Console.getConsole().requestLoadStatus(false);
         this._isLoadingActionMotion = false;
         Alert.show("Error in loading character action",param1.type);
      }
      
      private function doLoadActionsAndMotionsTimeOut(param1:Event) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.doLoadActionsAndMotionsTimeOut);
         Console.getConsole().requestLoadStatus(false);
         this._isLoadingActionMotion = false;
         Alert.show("Operation Timeout");
      }
      
      public function getFolderPathInCharZip() : String
      {
         if(this.path)
         {
            return "char/" + this.path + "/";
         }
         return "char/" + this.id + "/";
      }
      
      private function doLoadActionCompleted(param1:Event) : void
      {
      }
      
      private function doLoadActionsAndMotionsCompleted(param1:Event) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.doLoadActionsAndMotionsCompleted);
         var _loc2_:URLStream = URLStream(param1.target);
         Console.getConsole().requestLoadStatus(false);
         var _loc3_:ByteArray = new ByteArray();
         _loc2_.readBytes(_loc3_,0,_loc2_.bytesAvailable);
         var _loc4_:ZipFile = new ZipFile(_loc3_);
         this.initImageData(_loc4_,this.getFolderPathInCharZip());
         this._isLoadingActionMotion = false;
         this.setIsZipLoaded(true);
         this.dispatchEvent(new CoreEvent(CoreEvent.LOAD_THUMB_COMPLETE,this));
      }
      
      override public function loadImageData() : void
      {
         var _loc1_:URLRequest = null;
         var _loc3_:CCBodyModel = null;
         var _loc4_:String = null;
         var _loc5_:CCCharacterActionModel = null;
         var _loc6_:CcActionLoader = null;
         var _loc2_:UtilURLStream = new UtilURLStream();
         if(this.isCC)
         {
            _loc3_ = CCBodyManager.instance.getBodyModel(this.id);
            _loc4_ = CCThemeManager.instance.getThemeModel(this.ccThemeId).getCharacterDefaultActionId(_loc3_.bodyShapeId);
            _loc5_ = CCThemeManager.instance.getThemeModel(this.ccThemeId).getCharacterActionModel(_loc3_,_loc4_);
            if(_loc5_)
            {
               _loc6_ = new CcActionLoader();
               _loc6_.addEventListener(Event.COMPLETE,this.onCcActionLoaded);
               _loc6_.addEventListener(IOErrorEvent.IO_ERROR,this.onCcActionFailed);
               _loc6_.loadCcComponentsByCam(_loc5_);
               return;
            }
            _loc1_ = UtilNetwork.getGetCcActionRequest(this.id,this.defaultAction.id);
         }
         else if(this.path)
         {
            _loc1_ = UtilNetwork.getGetThemeAssetRequest(this.theme.id,this.path,ServerConstants.PARAM_CHAR_ACTION,this.defaultAction.id);
         }
         else
         {
            _loc1_ = UtilNetwork.getGetThemeAssetRequest(this.theme.id,this.id,ServerConstants.PARAM_CHAR_ACTION,this.defaultAction.id);
         }
         _loc2_.addEventListener(Event.COMPLETE,this.loadImageDataComplete);
         _loc2_.addEventListener(UtilURLStream.TIME_OUT,this.onLoadImageDataFail);
         _loc2_.addEventListener(IOErrorEvent.IO_ERROR,this.onLoadImageDataFail);
         _loc2_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onLoadImageDataFail);
         _loc2_.load(_loc1_);
      }
      
      private function onLoadImageDataFail(param1:Event) : void
      {
      }
      
      private function onCcActionLoaded(param1:Event) : void
      {
         var _loc2_:CcActionLoader = CcActionLoader(param1.target);
         if(_loc2_.imageData)
         {
            if(!this.imageData)
            {
               this.imageData = new Object();
            }
            if(_loc2_.imageData["xml"])
            {
               this.imageData["xml"] = _loc2_.imageData["xml"];
            }
            if(_loc2_.imageData["cam"])
            {
               this.imageData["cam"] = _loc2_.imageData["cam"];
            }
            this.imageData["imageData"] = _loc2_.imageData["imageData"];
            this.dispatchEvent(new CoreEvent(CoreEvent.LOAD_THUMB_COMPLETE,this));
         }
      }
      
      override public function loadImageDataComplete(param1:Event) : void
      {
         var _loc2_:UtilCrypto = null;
         var _loc5_:CcActionLoader = null;
         var _loc6_:ZipFile = null;
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.loadImageDataComplete);
         var _loc3_:URLStream = URLStream(param1.target);
         var _loc4_:ByteArray = new ByteArray();
         _loc3_.readBytes(_loc4_,0,_loc3_.bytesAvailable);
         if(this.isCC)
         {
            if(this.id.indexOf("zip") >= 0)
            {
               _loc6_ = new ZipFile(_loc4_);
               this.imageData = UtilPlain.convertZipAsImagedataObject(_loc6_);
            }
            else
            {
               _loc5_ = new CcActionLoader();
               _loc5_.addEventListener(Event.COMPLETE,this.onCcActionLoaded);
               _loc5_.addEventListener(IOErrorEvent.IO_ERROR,this.onCcActionFailed);
               _loc5_.loadCcComponents(XML(_loc4_),0,0,null,this._ccThemeId == "cc2"?Number(2):Number(1));
               return;
            }
         }
         else
         {
            this.imageData = new Object();
            this.imageData["figure"] = _loc4_;
            if(this.theme.id != "ugc" && !this.isCC)
            {
               _loc2_ = new UtilCrypto();
               _loc2_.decrypt(ByteArray(this.imageData["figure"]));
            }
            if(raceCode == RaceConstants.SKINNED_SWF)
            {
               _loc5_ = new CcActionLoader();
               _loc5_.addEventListener(Event.COMPLETE,this.onCcActionLoaded);
               _loc5_.addEventListener(IOErrorEvent.IO_ERROR,this.onCcActionFailed);
               _loc5_.loadCcComponents(this.xml,0,0,null,raceCode + 1,false,"default");
               return;
            }
         }
         if(this.propXML.length > 0 && this.theme)
         {
            this._propThumb = this.theme.getPropThumbById(this.propXML[0].@id) as PropThumb;
            if(this._propThumb && !this._propThumb.imageData)
            {
               this._propThumb.addEventListener(CoreEvent.LOAD_THUMB_COMPLETE,this.onPropImageDataLoaded);
               this._propThumb.loadImageData();
               return;
            }
         }
         this.dispatchEvent(new CoreEvent(CoreEvent.LOAD_THUMB_COMPLETE,this));
      }
      
      private function onPropImageDataLoaded(param1:Event) : void
      {
         this.dispatchEvent(new CoreEvent(CoreEvent.LOAD_THUMB_COMPLETE,this));
      }
      
      private function onCcActionFailed(param1:IOErrorEvent) : void
      {
         this.dispatchEvent(new CoreEvent(CoreEvent.LOAD_THUMB_COMPLETE,this));
      }
      
      public function get propImageData() : Object
      {
         if(this._propThumb)
         {
            return this._propThumb.imageData;
         }
         return null;
      }
      
      public function createCCHeadPropThumb() : PropThumb
      {
         var _loc1_:PropThumb = new PropThumb();
         _loc1_.initAsCCHeadProp(this,this.ccThemeModel);
         return _loc1_;
      }
      
      public function getHeadPropThumb() : PropThumb
      {
         var _loc1_:* = this.id + ".head";
         var _loc2_:Theme = theme as Theme;
         var _loc3_:PropThumb = _loc2_.getPropThumbById(_loc1_) as PropThumb;
         if(!_loc3_)
         {
            _loc3_ = (this as CharThumb).createCCHeadPropThumb();
            _loc2_.addThumb(_loc3_);
         }
         return _loc3_;
      }
      
      override public function get isWhiteboardAsset() : Boolean
      {
         return super.isWhiteboardAsset || this.ccThemeId == ThemeConstants.WHITEBOARD_THEME_ID;
      }
      
      override public function get isInfographicAsset() : Boolean
      {
         return super.isInfographicAsset || this.ccThemeId == ThemeConstants.INFOGRAPHICS_THEME_ID;
      }
      
      public function checkPropAttachmentSupport(param1:PropThumb) : Boolean
      {
         if(param1)
         {
            if(param1.holdable && this.checkHandheldSupport())
            {
               return true;
            }
            if(param1.wearable && this.checkHeadGearSupport())
            {
               return true;
            }
            if(param1.headable && this.checkHeadReplacementSupport())
            {
               return true;
            }
         }
         return false;
      }
      
      public function checkHandheldSupport() : Boolean
      {
         switch(this.themeOrCCThemeId)
         {
            case ThemeConstants.ANIME_THEME_ID:
            case ThemeConstants.CHIBI_THEME_ID:
            case ThemeConstants.CHRISTMAS_THEME_ID:
            case ThemeConstants.THEME_GROUP_CC1:
            case ThemeConstants.THEME_GROUP_CC2:
            case ThemeConstants.MONSTERMSH_THEME_ID:
            case ThemeConstants.NINJA_THEME_ID:
            case ThemeConstants.NINJAANIME_THEME_ID:
            case ThemeConstants.POLITIC_2_THEME_ID:
            case ThemeConstants.POLITIC_THEME_ID:
            case ThemeConstants.RETRO_THEME_ID:
            case ThemeConstants.SPACE_CITIZEN_THEME_ID:
            case ThemeConstants.STICK_THEME_ID:
               return true;
            default:
               return false;
         }
      }
      
      public function checkHeadGearSupport() : Boolean
      {
         switch(this.themeOrCCThemeId)
         {
            case ThemeConstants.CHRISTMAS_THEME_ID:
            case ThemeConstants.MONSTERMSH_THEME_ID:
            case ThemeConstants.POLITIC_THEME_ID:
            case ThemeConstants.RETRO_THEME_ID:
            case ThemeConstants.STICK_THEME_ID:
               return true;
            default:
               return false;
         }
      }
      
      public function checkHeadReplacementSupport() : Boolean
      {
         switch(this.themeOrCCThemeId)
         {
            case ThemeConstants.CHRISTMAS_THEME_ID:
            case ThemeConstants.MONSTERMSH_THEME_ID:
            case ThemeConstants.POLITIC_THEME_ID:
            case ThemeConstants.POLITIC_2_THEME_ID:
            case ThemeConstants.RETRO_THEME_ID:
            case ThemeConstants.STICK_THEME_ID:
               return true;
            default:
               return false;
         }
      }
      
      override public function get searchKey() : String
      {
         return this.itemRef;
      }
      
      public function get itemRef() : String
      {
         return !!this._itemRef?this._itemRef:this.id;
      }
   }
}
