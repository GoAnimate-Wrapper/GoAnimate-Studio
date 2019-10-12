package anifire.component
{
   import anifire.assets.AssetImageLibraryObject;
   import anifire.cc.interfaces.ICcPairComponent;
   import anifire.cc.model.CcComponentModel;
   import anifire.cc.view.CCHeadView;
   import anifire.cc.view.CcComponent;
   import anifire.cc.view.CcHeadComponent;
   import anifire.cc.view.CcImageLibrary;
   import anifire.color.SelectedColor;
   import anifire.constant.AnimeConstants;
   import anifire.constant.CcLibConstant;
   import anifire.core.CCManager;
   import anifire.core.GoBaseWorkerImp;
   import anifire.event.LoadEmbedMovieEvent;
   import anifire.event.LoadMgrEvent;
   import anifire.interfaces.ICharacter;
   import anifire.models.creator.CCCharacterActionModel;
   import anifire.models.creator.CCColor;
   import anifire.util.ExtraDataLoader;
   import anifire.util.UtilCrypto;
   import anifire.util.UtilErrorLogger;
   import anifire.util.UtilHashBytes;
   import anifire.util.UtilHashSelectedColor;
   import anifire.util.UtilHashUint;
   import anifire.util.UtilLoadMgr;
   import anifire.util.UtilPlain;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.display.MovieClip;
   import flash.display.Shader;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.filters.GlowFilter;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.net.URLStream;
   import flash.utils.ByteArray;
   import flash.utils.setTimeout;
   import nochump.util.zip.ZipEntry;
   import nochump.util.zip.ZipFile;
   
   public class CustomActionMaker extends MovieClip implements ICharacter
   {
      
      private static const GoColorMapShaderClass:Class = CustomActionMaker_GoColorMapShaderClass;
      
      public static const LOOK_AT_CAMERA_CHANGED:String = "CcLookAtCamera";
      
      public static const SPEECH_PITCH_CHANGED:String = "CcPitchChanged";
      
      private static const BODYSHAPE:String = CcLibConstant.COMPONENT_TYPE_BODYSHAPE;
      
      private static const XML_DESC:String = CcLibConstant.XML_DESC;
      
      private static const UPPERBODY:String = CcLibConstant.COMPONENT_TYPE_UPPER_BODY;
      
      private static const CLIPUPPER:String = CcLibConstant.CLIPUPPER;
      
      private static const LOWERBODY:String = CcLibConstant.COMPONENT_TYPE_LOWER_BODY;
      
      private static const CLIPLOWER:String = CcLibConstant.CLIPLOWER;
      
      private static const DEFAULTHEAD:String = AnimeConstants.MOVIECLIP_DEFAULT_HEAD;
      
      private static const CURRENT_HEAD:String = AnimeConstants.MOVIECLIP_THE_HEAD;
      
      private static const LIB_LEFT:String = CcLibConstant.LIB_LEFT;
      
      private static const LIB_RIGHT:String = CcLibConstant.LIB_RIGHT;
      
      private static const NODE_COMPONENT:String = CcLibConstant.NODE_COMPONENT;
      
      private static const SWF_EXT:String = CcLibConstant.SWF_EXT;
      
      private static const SKELETON:String = CcLibConstant.COMPONENT_TYPE_SKELETON;
      
      private static const SPEECH_MOUTH:String = "speechMouth";
      
      protected static var __componentOrder:Object;
      
      private static const MC:String = CcLibConstant.MC_NAME_EXT;
      
      public static const STATE_NULL:String = "null";
      
      public static const STATE_LOADING:String = "loading";
      
      public static const STATE_FINISH_LOAD:String = "finish_load";
      
      protected static var _decoder:UtilCrypto;
      
      public static const CC2_INIT_DELAY:Number = 200;
      
      private static var _numTotalLoadBytes:Number = 0;
       
      
      private var _myActionModel:CCCharacterActionModel;
      
      private var _charXML:XML;
      
      private var _charSwfs:UtilHashBytes;
      
      private var _charZip:ZipFile;
      
      private var shouldDecrypt:Boolean = true;
      
      private var _customColor:UtilHashSelectedColor;
      
      private var _state:String;
      
      private var _waiting:Array;
      
      private var _decoArray:Array;
      
      private var _lookAtCameraSupported:Boolean = false;
      
      private var _prop:DisplayObjectContainer = null;
      
      private var _hasProp:Boolean = false;
      
      private var _sceneId:String;
      
      private var _head:CcHeadComponent;
      
      private var _loadHead:Boolean = true;
      
      private var _useImageLibrary:Boolean = false;
      
      private var _subClips:Vector.<DisplayObjectContainer>;
      
      private var _subClipLookup:Object;
      
      private var _headParts:Vector.<DisplayObjectContainer>;
      
      private var _headPartLookup:Object;
      
      private var _shaderTargets:Vector.<DisplayObject>;
      
      private var _assetImageLookup:Object;
      
      private var _colorLookup:Object;
      
      private var _tempworker:GoBaseWorkerImp;
      
      private var _headRect:Rectangle;
      
      private var _ccm:CCManager;
      
      private var _ver:Number;
      
      public function CustomActionMaker()
      {
         this._waiting = new Array();
         this._headRect = new Rectangle();
         super();
         this._assetImageLookup = {};
         this._customColor = new UtilHashSelectedColor();
         this._ccm = new CCManager();
         this.state = STATE_NULL;
         this._ver = 1;
      }
      
      protected static function includedInComponentOrder(param1:String) : Boolean
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(!__componentOrder)
         {
            __componentOrder = {};
            _loc2_ = CcLibConstant.ALL_BODY_COMPONENT_TYPES.concat(CcLibConstant.GET_COMPONENT_ORDER_IN_HEAD);
            _loc3_ = _loc2_.length;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               __componentOrder[_loc2_[_loc4_]] = true;
               _loc4_++;
            }
         }
         return __componentOrder[param1];
      }
      
      protected static function get decoder() : UtilCrypto
      {
         if(!_decoder)
         {
            _decoder = new UtilCrypto();
         }
         return _decoder;
      }
      
      public function get eventDispatcher() : EventDispatcher
      {
         return this;
      }
      
      public function set useImageLibrary(param1:Boolean) : void
      {
         this._useImageLibrary = param1;
      }
      
      public function set loadHead(param1:Boolean) : void
      {
         this._loadHead = param1;
      }
      
      public function get demoSpeech() : Boolean
      {
         return false;
      }
      
      public function set demoSpeech(param1:Boolean) : void
      {
         if(this._head)
         {
            this._head.useTalkMouth = param1;
         }
      }
      
      public function set sceneId(param1:String) : void
      {
         this._sceneId = param1;
      }
      
      public function get prop() : DisplayObjectContainer
      {
         return this._prop;
      }
      
      public function set prop(param1:DisplayObjectContainer) : void
      {
         this._prop = param1;
      }
      
      public function get head() : DisplayObjectContainer
      {
         return this.getSubClipByName(DEFAULTHEAD);
      }
      
      public function get currentHead() : DisplayObjectContainer
      {
         return this.getSubClipByName(CURRENT_HEAD);
      }
      
      public function get headRect() : Rectangle
      {
         return this._headRect;
      }
      
      private function getSkeletonContainer(param1:Number = 0) : DisplayObjectContainer
      {
         var _loc2_:String = null;
         switch(param1)
         {
            case 2:
               _loc2_ = CcLibConstant.COMPONENT_TYPE_FREEACTION;
               break;
            default:
               _loc2_ = CcLibConstant.COMPONENT_TYPE_SKELETON;
         }
         return this.getSubClipByName(_loc2_);
      }
      
      public function get CCM() : CCManager
      {
         return this._ccm;
      }
      
      public function get lookAtCameraSupported() : Boolean
      {
         return this._lookAtCameraSupported;
      }
      
      private function get charXML() : XML
      {
         return this._charXML;
      }
      
      private function set charXML(param1:XML) : void
      {
         this._charXML = param1;
      }
      
      private function get charSwfs() : UtilHashBytes
      {
         return this._charSwfs;
      }
      
      private function set charSwfs(param1:UtilHashBytes) : void
      {
         this._charSwfs = param1;
      }
      
      private function get charZip() : ZipFile
      {
         return this._charZip;
      }
      
      private function set charZip(param1:ZipFile) : void
      {
         this._charZip = param1;
      }
      
      private function get state() : String
      {
         return this._state;
      }
      
      private function set state(param1:String) : void
      {
         this._state = param1;
      }
      
      private function get waiting() : Array
      {
         return this._waiting;
      }
      
      public function get ver() : Number
      {
         return this._ver;
      }
      
      public function set ver(param1:Number) : void
      {
         this._ver = param1;
      }
      
      public function reset() : void
      {
         this._customColor = new UtilHashSelectedColor();
         this._ccm = new CCManager();
         this.state = STATE_NULL;
         this._ver = 1;
         this._subClips = null;
         this._subClipLookup = null;
         this._headParts = null;
         this._headPartLookup = null;
         this._shaderTargets = null;
      }
      
      private function doUpdateState(param1:Event) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.doUpdateState);
         this.state = STATE_FINISH_LOAD;
      }
      
      private function prepareDataByCam() : void
      {
         var _loc1_:* = null;
         var _loc2_:String = null;
         var _loc3_:CCColor = null;
         this._ver = this._myActionModel.version;
         for(_loc1_ in this._myActionModel.libraryPaths)
         {
            _loc2_ = this._myActionModel.libraryPaths[_loc1_] as String;
            this.addLibrary(_loc1_,_loc2_,this._myActionModel.themeId);
         }
         for(_loc1_ in this._myActionModel.colorCodes)
         {
            _loc3_ = this._myActionModel.colorCodes[_loc1_];
            this.addColor(_loc3_.type,_loc3_.oc,_loc3_.dest);
         }
      }
      
      private function prepareXML(param1:XML) : void
      {
         var _loc2_:XMLList = null;
         var _loc3_:int = 0;
         _loc2_ = param1.library;
         this._ver = String(param1.@version).length > 0?Number(Number(param1.@version)):Number(1);
         _loc3_ = 0;
         while(_loc3_ < _loc2_.length())
         {
            this.addLibrary(_loc2_[_loc3_].@type,_loc2_[_loc3_].@component_id,_loc2_[_loc3_].@theme_id);
            _loc3_++;
         }
         _loc2_ = param1.color;
         _loc3_ = 0;
         while(_loc3_ < _loc2_.length())
         {
            this.addColor(_loc2_[_loc3_].@r,uint(_loc2_[_loc3_].@oc.length() > 0?_loc2_[_loc3_].@oc:uint.MAX_VALUE),uint(_loc2_[_loc3_].text()));
            _loc3_++;
         }
      }
      
      public function insertColor(param1:UtilHashSelectedColor) : void
      {
         this._customColor.insert(0,param1);
         this.CCM.colors.insert(0,param1);
      }
      
      public function addColor(param1:String, param2:uint, param3:uint) : void
      {
         var _loc4_:SelectedColor = new SelectedColor(param1,param2,param3);
         this._customColor.push(_loc4_.areaName,_loc4_);
         this.CCM.addColor(_loc4_.areaName,_loc4_);
      }
      
      public function getColorByName(param1:String) : uint
      {
         return SelectedColor(this._customColor.getValueByKey(param1)).dstColor;
      }
      
      public function loadZip(param1:String, param2:String, param3:String = "") : void
      {
         this.initByActionId(param1,param2,param3);
      }
      
      private function doLoadZipComplete(param1:Event) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.doLoadZipComplete);
         var _loc2_:URLStream = URLStream(param1.target);
         var _loc3_:ByteArray = new ByteArray();
         _loc2_.readBytes(_loc3_,0,_loc2_.bytesAvailable);
         var _loc4_:ZipFile = new ZipFile(_loc3_);
         this.charZip = _loc4_;
         this.initByZip(_loc4_);
      }
      
      public function updateByZip(param1:ByteArray) : void
      {
         var _loc2_:ZipFile = new ZipFile(param1);
         this.charZip = _loc2_;
         this.initByZip(_loc2_);
      }
      
      public function initByZip(param1:ZipFile) : void
      {
         this.charXML = new XML(param1.getInput(param1.getEntry(XML_DESC)));
         this.prepareXML(this.charXML);
         this.prepareSkin();
      }
      
      private function prepareSkinByCam() : void
      {
         var _loc1_:String = null;
         var _loc2_:ByteArray = null;
         var _loc4_:* = null;
         var _loc5_:ExtraDataLoader = null;
         var _loc6_:Object = null;
         var _loc3_:UtilLoadMgr = new UtilLoadMgr();
         _loc3_.addEventListener(LoadMgrEvent.ALL_COMPLETE,this.doPrepareFinishedByCam);
         for(_loc4_ in this._myActionModel.libraryPaths)
         {
            _loc5_ = new ExtraDataLoader();
            _loc1_ = this._myActionModel.libraryPaths[_loc4_];
            if(this._useImageLibrary)
            {
               if(CcImageLibrary.library.requestImage(_loc1_,this._sceneId,_loc5_) > 0)
               {
                  continue;
               }
            }
            _loc2_ = this.charSwfs.getValueByKey(_loc1_);
            if(_loc2_ != null)
            {
               _loc6_ = new Object();
               _loc6_["part"] = _loc4_;
               _loc5_.extraData = _loc6_;
               _loc3_.addEventDispatcher(_loc5_.contentLoaderInfo,Event.COMPLETE);
               _loc5_.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onLoadStyleDone);
               _loc5_.loadBytes(_loc2_);
               _numTotalLoadBytes++;
            }
         }
         _loc3_.commit();
      }
      
      private function prepareSkin(param1:UtilHashBytes = null) : void
      {
         var _loc2_:XML = null;
         var _loc3_:String = null;
         var _loc4_:ByteArray = null;
         var _loc6_:ExtraDataLoader = null;
         var _loc7_:ZipEntry = null;
         var _loc8_:Object = null;
         var _loc5_:UtilLoadMgr = new UtilLoadMgr();
         _loc5_.addEventListener(LoadMgrEvent.ALL_COMPLETE,this.doPrepareFinished);
         for each(_loc2_ in this.charXML.child(CcLibConstant.NODE_LIBRARY))
         {
            _loc6_ = new ExtraDataLoader();
            _loc3_ = _loc2_.@theme_id + "." + _loc2_.@type + "." + _loc2_.@component_id + SWF_EXT;
            if(this._useImageLibrary)
            {
               if(CcImageLibrary.library.requestImage(_loc3_,this._sceneId,_loc6_) > 0)
               {
                  continue;
               }
            }
            if(param1 == null || param1.length == 0)
            {
               if(this.charZip != null)
               {
                  _loc7_ = this.charZip.getEntry(_loc3_);
                  if(_loc7_ != null)
                  {
                     _loc4_ = this.charZip.getInput(_loc7_);
                  }
               }
               else if(this.charSwfs != null)
               {
                  _loc4_ = this.charSwfs.getValueByKey(_loc3_);
               }
            }
            else
            {
               _loc4_ = param1.getValueByKey(_loc3_);
            }
            if(_loc4_ != null)
            {
               _loc8_ = new Object();
               _loc8_["part"] = String(_loc2_.@type);
               _loc6_.extraData = _loc8_;
               _loc5_.addEventDispatcher(_loc6_.contentLoaderInfo,Event.COMPLETE);
               _loc6_.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onLoadStyleDone);
               _loc6_.loadBytes(_loc4_);
               _numTotalLoadBytes++;
            }
         }
         _loc5_.commit();
      }
      
      private function onLoadStyleDone(param1:Event) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.onLoadStyleDone);
         var _loc2_:LoaderInfo = LoaderInfo(param1.currentTarget);
         var _loc3_:Object = ExtraDataLoader(_loc2_.loader).extraData;
         this.CCM.addStyle(_loc3_["part"],_loc2_);
      }
      
      private function doPrepareFinishedByCam(param1:Event) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.doPrepareFinishedByCam);
         this.loadAllComponentsByCam(null);
      }
      
      private function doPrepareFinished(param1:Event) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.doPrepareFinished);
         this.loadAllComponents(null);
      }
      
      public function get lookAtCamera() : Boolean
      {
         if(this._head)
         {
            return this._head.lookAtCamera;
         }
         return false;
      }
      
      public function set lookAtCamera(param1:Boolean) : void
      {
         if(this._head)
         {
            this._head.lookAtCamera = param1;
         }
      }
      
      private function onBodyImageRequested(param1:Event) : void
      {
         var _loc2_:DisplayObjectContainer = null;
         IEventDispatcher(param1.target).removeEventListener(param1.type,this.onBodyImageRequested);
         if(this._loadHead)
         {
            if(this._head)
            {
               this._head.addEventListener(Event.COMPLETE,this.onHeadImageRequested);
               this._head.requestImage(this._sceneId);
            }
            else
            {
               this._head = new CcHeadComponent();
               this._head.init(this.charXML,this._sceneId,this._useImageLibrary);
               this._head.addEventListener(Event.COMPLETE,this.onHeadImageRequested);
               this._head.load();
               _loc2_ = this.head;
               if(_loc2_)
               {
                  _loc2_.addChild(this._head);
               }
            }
         }
         else
         {
            this.dispatchComplete();
         }
      }
      
      private function onHeadImageRequested(param1:Event) : void
      {
         IEventDispatcher(param1.target).removeEventListener(param1.type,this.onHeadImageRequested);
         this.dispatchComplete();
      }
      
      private function requestImage() : void
      {
         var _loc1_:ExtraDataLoader = null;
         var _loc2_:XML = null;
         var _loc3_:Object = null;
         var _loc4_:String = null;
         var _loc5_:AssetImageLibraryObject = null;
         var _loc6_:String = null;
         var _loc7_:ByteArray = null;
         var _loc8_:UtilLoadMgr = null;
         var _loc9_:Number = NaN;
         var _loc10_:ZipEntry = null;
         var _loc11_:Object = null;
         if(this._useImageLibrary)
         {
            _loc8_ = new UtilLoadMgr();
            _loc8_.addEventListener(LoadMgrEvent.ALL_COMPLETE,this.onBodyImageRequested);
            for each(_loc2_ in this.charXML.child(CcLibConstant.NODE_LIBRARY))
            {
               _loc1_ = new ExtraDataLoader();
               _loc6_ = _loc2_.@theme_id + "." + _loc2_.@type + "." + _loc2_.@component_id + SWF_EXT;
               _loc9_ = 0;
               _loc9_ = CcImageLibrary.library.requestImage(_loc6_,this._sceneId,_loc1_);
               if(_loc9_ <= 0)
               {
                  if(this.charZip != null)
                  {
                     _loc10_ = this.charZip.getEntry(_loc6_);
                     if(_loc10_ != null)
                     {
                        _loc7_ = this.charZip.getInput(_loc10_);
                     }
                  }
                  else if(this.charSwfs != null)
                  {
                     _loc7_ = this.charSwfs.getValueByKey(_loc6_);
                  }
                  if(_loc7_ != null)
                  {
                     _loc11_ = new Object();
                     _loc11_["part"] = String(_loc2_.@type);
                     _loc1_.extraData = _loc11_;
                     _loc8_.addEventDispatcher(_loc1_.contentLoaderInfo,Event.COMPLETE);
                     _loc1_.loadBytes(_loc7_);
                     _numTotalLoadBytes++;
                  }
               }
            }
            for each(_loc2_ in this.charXML.child(NODE_COMPONENT))
            {
               if(this.shouldComponentBeBorrowed(_loc2_.@type) && CcLibConstant.ALL_BODY_COMPONENT_TYPES.indexOf(String(_loc2_.@type)) >= 0)
               {
                  _loc4_ = _loc2_.@theme_id + "." + _loc2_.@type + "." + _loc2_.@path + "." + _loc2_.@file;
                  this.updateComponentImageData(_loc2_.@type,null,null,_loc8_,null,_loc2_.@id,_loc2_);
               }
            }
            _loc8_.commit();
         }
      }
      
      private function shouldComponentBeBorrowed(param1:String) : Boolean
      {
         if(param1 == SKELETON || param1 == CcLibConstant.COMPONENT_TYPE_FREEACTION || param1 == BODYSHAPE)
         {
            return false;
         }
         return true;
      }
      
      public function initBySwfs(param1:XML, param2:UtilHashBytes, param3:UtilHashBytes = null) : void
      {
         if(this.state == STATE_NULL)
         {
            this.state = STATE_LOADING;
         }
         else
         {
            if(this.state == STATE_LOADING)
            {
               if(this._useImageLibrary)
               {
                  this.requestImage();
               }
               return;
            }
            if(this.state == STATE_FINISH_LOAD)
            {
               if(this._useImageLibrary)
               {
                  this.requestImage();
               }
               else
               {
                  setTimeout(this.dispatchComplete,100);
               }
               return;
            }
         }
         this.shouldDecrypt = false;
         this.charXML = param1;
         this.charSwfs = param2.clone();
         this._waiting = new Array();
         this.visible = false;
         this.prepareXML(this.charXML);
         this.prepareSkin(param3);
      }
      
      public function initBySwfCam(param1:CCCharacterActionModel, param2:UtilHashBytes, param3:UtilHashBytes = null) : void
      {
         if(this.state == STATE_NULL)
         {
            this.state = STATE_LOADING;
         }
         else
         {
            if(this.state == STATE_LOADING)
            {
               if(this._useImageLibrary)
               {
                  this.requestImage();
               }
               return;
            }
            if(this.state == STATE_FINISH_LOAD)
            {
               if(this._useImageLibrary)
               {
                  this.requestImage();
               }
               else
               {
                  setTimeout(this.dispatchComplete,100);
               }
               return;
            }
         }
         this.shouldDecrypt = false;
         this._myActionModel = param1;
         this.charSwfs = param2.clone();
         this._waiting = new Array();
         this.visible = false;
         this.prepareDataByCam();
         this.prepareSkinByCam();
      }
      
      public function initByActionId(param1:String, param2:String = "", param3:String = "", param4:Boolean = false) : void
      {
         var loader:CcActionLoader = null;
         var aid:String = param1;
         var actionId:String = param2;
         var facialId:String = param3;
         var isDefault:Boolean = param4;
         try
         {
            if(aid)
            {
               loader = CcActionLoader.getActionLoader(aid + actionId);
               loader.addEventListener(Event.COMPLETE,this.onCcActionLoaded);
               loader.addEventListener(IOErrorEvent.IO_ERROR,this.onCcActionFailed);
               loader.load(aid,actionId,facialId,isDefault);
            }
            return;
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().appendCustomError("CCM:initByActionId",e);
            return;
         }
      }
      
      public function initByCamWithData(param1:CCCharacterActionModel, param2:Number = 0, param3:Number = 0, param4:UtilHashBytes = null, param5:Boolean = false, param6:Boolean = false, param7:String = "") : void
      {
         if(!param1)
         {
            return;
         }
         var _loc8_:CcActionLoader = CcActionLoader.getActionLoader(param7);
         _loc8_.addEventListener(Event.COMPLETE,this.onCcActionLoadedByCam);
         _loc8_.addEventListener(IOErrorEvent.IO_ERROR,this.onCcActionFailed);
         _loc8_.loadCcComponentsByCam(param1,param4,this.ver);
      }
      
      public function initByXMLWithData(param1:XML, param2:Number = 0, param3:Number = 0, param4:UtilHashBytes = null, param5:Boolean = false, param6:Boolean = false, param7:String = "") : void
      {
         if(!param1)
         {
            return;
         }
         var _loc8_:CcActionLoader = CcActionLoader.getActionLoader(param7);
         _loc8_.addEventListener(Event.COMPLETE,this.onCcActionLoaded);
         _loc8_.addEventListener(IOErrorEvent.IO_ERROR,this.onCcActionFailed);
         _loc8_.loadCcComponents(param1,param2,param3,param4,this.ver,param6);
      }
      
      public function initByXml(param1:XML, param2:Number = 0, param3:Number = 0, param4:Boolean = false) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc5_:CcActionLoader = new CcActionLoader();
         _loc5_.addEventListener(Event.COMPLETE,this.onCcActionLoaded);
         _loc5_.addEventListener(IOErrorEvent.IO_ERROR,this.onCcActionFailed);
         _loc5_.loadCcComponents(param1,param2,param3,null,this.ver);
      }
      
      public function initByCam(param1:CCCharacterActionModel) : void
      {
         if(!param1)
         {
            return;
         }
         this._myActionModel = param1;
         var _loc2_:CcActionLoader = new CcActionLoader();
         _loc2_.addEventListener(Event.COMPLETE,this.onCcActionLoadedByCam);
         _loc2_.addEventListener(IOErrorEvent.IO_ERROR,this.onCcActionFailed);
         _loc2_.loadCcComponentsByCam(param1);
      }
      
      private function onCcActionFailed(param1:IOErrorEvent) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.onCcActionFailed);
         dispatchEvent(new IOErrorEvent(IOErrorEvent.IO_ERROR));
      }
      
      private function onCcActionLoadedByCam(param1:Event) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.onCcActionLoadedByCam);
         var _loc2_:CcActionLoader = CcActionLoader(param1.target);
         if(_loc2_.imageData)
         {
            this.initBySwfCam(_loc2_.imageData["cam"] as CCCharacterActionModel,_loc2_.imageData["imageData"] as UtilHashBytes);
         }
         _loc2_ = null;
      }
      
      private function onCcActionLoaded(param1:Event) : void
      {
         var loader:CcActionLoader = null;
         var e:Event = param1;
         (e.target as IEventDispatcher).removeEventListener(e.type,this.onCcActionLoaded);
         try
         {
            loader = CcActionLoader(e.target);
            loader.removeEventListener(e.type,this.onCcActionLoaded);
            if(loader.imageData)
            {
               this.initBySwfs(loader.imageData["xml"] as XML,loader.imageData["imageData"] as UtilHashBytes);
            }
            loader = null;
            return;
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().appendCustomError("CCM:onCcActionLoaded:",e);
            return;
         }
      }
      
      private function loadAllComponentsByCam(param1:Event) : void
      {
         var _loc2_:XML = null;
         var _loc4_:* = null;
         var _loc5_:ExtraDataLoader = null;
         if(!this._myActionModel)
         {
            return;
         }
         this._decoArray = new Array();
         var _loc3_:UtilLoadMgr = new UtilLoadMgr();
         _loc3_.addEventListener(LoadMgrEvent.ALL_COMPLETE,this.onBodyLoadedByCam);
         for(_loc4_ in this._myActionModel.components)
         {
            if(CcLibConstant.ALL_BODY_COMPONENT_TYPES.indexOf(_loc4_) > -1)
            {
               _loc5_ = this.updateComponentImageData(_loc4_,null,null,_loc3_,null,this._myActionModel.getComponentByType(_loc4_).path);
            }
         }
         _loc3_.commit();
      }
      
      private function loadAllComponents(param1:Event) : void
      {
         var _loc2_:XML = null;
         var _loc4_:ExtraDataLoader = null;
         this._decoArray = new Array();
         var _loc3_:UtilLoadMgr = new UtilLoadMgr();
         _loc3_.addEventListener(LoadMgrEvent.ALL_COMPLETE,this.onBodyLoaded);
         for each(_loc2_ in this.charXML.child(NODE_COMPONENT))
         {
            if(CcLibConstant.ALL_BODY_COMPONENT_TYPES.indexOf(String(_loc2_.@type)) >= 0)
            {
               _loc4_ = this.updateComponentImageData(_loc2_.@type,null,null,_loc3_,null,_loc2_.@id,_loc2_);
            }
         }
         _loc3_.commit();
      }
      
      public function updateComponentImageData(param1:String, param2:ByteArray, param3:Object, param4:UtilLoadMgr, param5:Array = null, param6:String = "", param7:XML = null) : ExtraDataLoader
      {
         var clipName:String = null;
         var key:String = null;
         var model:CcComponentModel = null;
         var assetImageId:Number = NaN;
         var colorNames:Object = null;
         var swfkey:String = null;
         var tmpByteArray:ByteArray = null;
         var componentType:String = param1;
         var swfByteArray:ByteArray = param2;
         var properties:Object = param3;
         var loadMgr:UtilLoadMgr = param4;
         var colors:Array = param5;
         var id:String = param6;
         var node:XML = param7;
         if(CcLibConstant.ALL_BODY_COMPONENT_TYPES.indexOf(componentType) < 0)
         {
            if(!this._head)
            {
               this._head = new CcHeadComponent();
            }
            model = CcComponentModel.createModelByType(componentType);
            model.initProperties(id,componentType,properties.x,properties.y,properties.xscale,properties.yscale,properties.rotation,properties.offset,properties.split);
            model.initColors(colors);
            this._head.addEventListener(Event.COMPLETE,this.onHeadLoaded);
            this._head.setComponent(model,swfByteArray);
            return null;
         }
         var loader:ExtraDataLoader = new ExtraDataLoader();
         if(this._useImageLibrary && node)
         {
            key = node.@theme_id + "." + node.@type + "." + node.@path + "." + node.@file;
            if(this.shouldComponentBeBorrowed(node.@type))
            {
               assetImageId = 0;
               assetImageId = CcImageLibrary.library.requestImage(key,this._sceneId,loader);
               if(assetImageId > 0)
               {
                  return null;
               }
            }
         }
         switch(componentType)
         {
            case SKELETON:
            case CcLibConstant.COMPONENT_TYPE_FREEACTION:
               clipName = "";
               properties = {
                  "x":0,
                  "y":0,
                  "xscale":1,
                  "yscale":1,
                  "offset":0
               };
               break;
            case UPPERBODY:
               clipName = CLIPUPPER;
               break;
            case LOWERBODY:
               clipName = CLIPLOWER;
               break;
            default:
               clipName = DEFAULTHEAD;
         }
         var decoIndex:Number = -1;
         if(CcLibConstant.ALL_MULTIPLE_COMPONENT_TYPES.indexOf(componentType) == -1)
         {
            loader.name = componentType;
         }
         else
         {
            loader.name = id;
            decoIndex = this._decoArray.push(id) - 1;
         }
         if(properties == null && node)
         {
            properties = {
               "x":String(node.@x),
               "y":String(node.@y),
               "xscale":String(node.@xscale),
               "yscale":String(node.@yscale),
               "offset":String(node.@offset),
               "rotation":String(node.@rotation),
               "split":(!!Boolean(String(node.@split) == "N")?false:true)
            };
         }
         if(node && colors == null)
         {
            colorNames = CcLibConstant.COLORS_BY_COMPONENT(node.@type);
            if(colorNames)
            {
               colors = (colorNames as Array).map(function(param1:String, param2:int, param3:Array):Object
               {
                  var colorXMLNode:* = undefined;
                  var colorObj:* = undefined;
                  var item:String = param1;
                  var index:int = param2;
                  var array:Array = param3;
                  colorXMLNode = charXML.color.(@r == item);
                  colorObj = {
                     "colorReference":String(colorXMLNode.@r),
                     "originalColor":(String(colorXMLNode.@oc).length == 0?uint.MAX_VALUE:uint(colorXMLNode.@oc)),
                     "colorValue":uint(colorXMLNode.text()),
                     "targetComponentId":""
                  };
                  return colorObj;
               });
            }
         }
         loader.extraData = {
            "componentType":componentType,
            "properties":properties,
            "colors":colors,
            "clipName":clipName,
            "index":decoIndex
         };
         if(!swfByteArray)
         {
            if(node)
            {
               if(node.@type != CcLibConstant.COMPONENT_TYPE_MOUTH)
               {
                  swfkey = node.@theme_id + "." + node.@type + "." + node.@component_id + SWF_EXT;
               }
            }
            else
            {
               swfkey = this._myActionModel.getComponentByType(componentType).path;
            }
            if(this.charZip)
            {
               swfByteArray = this.charZip.getInput(this.charZip.getEntry(swfkey));
            }
            else if(this.charSwfs != null)
            {
               swfByteArray = this.charSwfs.getValueByKey(swfkey);
            }
         }
         loadMgr.addEventDispatcher(loader,Event.INIT);
         loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onLoadImageData);
         if(swfByteArray)
         {
            if(this.shouldDecrypt)
            {
               tmpByteArray = new ByteArray();
               swfByteArray.readBytes(tmpByteArray);
               tmpByteArray.position = 0;
               swfByteArray.position = 0;
               decoder.decrypt(tmpByteArray);
               loader.loadBytes(tmpByteArray);
            }
            else
            {
               swfByteArray.position = 0;
               loader.loadBytes(swfByteArray);
            }
            _numTotalLoadBytes++;
         }
         return loader;
      }
      
      public function speak(param1:Number) : void
      {
         if(this._head)
         {
            this._head.speak(param1);
         }
      }
      
      private function onLoadImageData(param1:Event) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.onLoadImageData);
         var _loc2_:ExtraDataLoader = ExtraDataLoader(LoaderInfo(param1.currentTarget).loader);
         var _loc3_:Object = _loc2_.extraData;
         var _loc4_:String = _loc3_["componentType"];
         if(this._useImageLibrary && this.shouldComponentBeBorrowed(_loc4_) && _loc4_ != "mouth")
         {
            _loc2_.dispatchEvent(new Event(Event.INIT));
         }
         else
         {
            this.doLoadImageData(_loc2_);
         }
      }
      
      private function doLoadImageData(param1:ExtraDataLoader) : void
      {
         var _loc8_:DisplayObjectContainer = null;
         var _loc9_:int = 0;
         var _loc2_:Object = param1.extraData;
         var _loc3_:String = _loc2_["componentType"];
         var _loc4_:Object = _loc2_["properties"];
         var _loc5_:Array = _loc2_["colors"];
         var _loc6_:String = _loc2_["clipName"];
         var _loc7_:Number = Number(_loc2_["index"]);
         if(_loc6_ != "")
         {
            _loc8_ = UtilPlain.getInstance(this,_loc6_);
         }
         else
         {
            _loc8_ = this;
         }
         if(_loc8_)
         {
            if(!includedInComponentOrder(_loc3_))
            {
               this.doLoadedComponent(param1);
            }
            else if(_loc6_ != DEFAULTHEAD)
            {
               _loc9_ = _loc8_.numChildren;
               while(_loc9_ > 0)
               {
                  _loc8_.removeChildAt(_loc9_ - 1);
                  _loc9_--;
               }
               param1.addEventListener(Event.ADDED,this.loadedComponent);
               _loc8_.addChild(param1);
               if(_loc8_ == this)
               {
                  this.redoWaitingImageData();
               }
               if(this.ver == 2)
               {
                  this.reloadSkin();
               }
            }
         }
         else
         {
            this.waiting.push(param1);
         }
      }
      
      private function coNumber() : Number
      {
         return this._decoArray.length >= 0?Number(this._decoArray.length):Number(100);
      }
      
      private function redoWaitingImageData() : void
      {
         var _loc1_:int = 0;
         var _loc2_:ExtraDataLoader = null;
         _loc1_ = 0;
         while(_loc1_ < this.waiting.length)
         {
            _loc2_ = this.waiting[_loc1_] as ExtraDataLoader;
            this.doLoadImageData(_loc2_);
            _loc1_++;
         }
      }
      
      private function loadedComponent(param1:Event) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.loadedComponent);
         var _loc2_:ExtraDataLoader = ExtraDataLoader(param1.currentTarget);
         this.doLoadedComponent(_loc2_);
      }
      
      private function doLoadedComponent(param1:ExtraDataLoader) : void
      {
         var _loc6_:int = 0;
         var _loc7_:Object = null;
         var _loc2_:Object = param1.extraData;
         var _loc3_:String = _loc2_["componentType"];
         var _loc4_:Object = _loc2_["properties"];
         var _loc5_:Array = _loc2_["colors"];
         if(includedInComponentOrder(_loc3_))
         {
            if(_loc7_)
            {
               _loc6_ = 0;
               while(_loc6_ < _loc5_.length)
               {
                  _loc7_ = _loc5_[_loc6_] as Object;
                  this.updateColor(_loc7_);
                  _loc6_++;
               }
            }
            param1.dispatchEvent(new Event(Event.INIT));
         }
      }
      
      public function updateColor(param1:Object) : void
      {
         var _loc2_:UtilHashUint = new UtilHashUint();
         var _loc3_:SelectedColor = new SelectedColor(param1["colorReference"],param1["originalColor"],param1["colorValue"]);
         this.changeColor(_loc3_,param1["targetComponentId"]);
         if(param1["originalColor"] != uint.MAX_VALUE)
         {
            this._customColor.push(_loc3_.areaName,_loc3_);
            _loc2_.push("0x" + _loc3_.orgColor.toString(16),_loc3_.dstColor);
         }
         if(_loc2_.length > 0)
         {
            this.changeColorForShader(_loc2_);
         }
         this.addColor(_loc3_.areaName,_loc3_.orgColor,_loc3_.dstColor);
      }
      
      public function deleteColorByArea(param1:String) : void
      {
         this._customColor.removeByKey(param1);
         this.CCM.deleteColor(param1);
      }
      
      public function changeColor(param1:SelectedColor, param2:String = "") : Number
      {
         var _loc4_:ColorTransform = null;
         var _loc5_:int = 0;
         var _loc6_:DisplayObject = null;
         var _loc7_:int = 0;
         var _loc3_:Vector.<DisplayObject> = this.getColorPartsByName(param1.areaName);
         if(_loc3_)
         {
            _loc4_ = new ColorTransform();
            if(param1.dstColor != uint.MAX_VALUE)
            {
               _loc4_.color = param1.dstColor;
            }
            _loc5_ = _loc3_.length;
            _loc7_ = 0;
            while(_loc7_ < _loc5_)
            {
               _loc6_ = _loc3_[_loc7_];
               _loc6_.transform.colorTransform = _loc4_;
               _loc7_++;
            }
            return _loc3_.length;
         }
         return 0;
      }
      
      public function resetColor() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Vector.<DisplayObject> = null;
         var _loc5_:* = null;
         var _loc1_:ColorTransform = new ColorTransform();
         for(_loc5_ in this._colorLookup)
         {
            _loc4_ = this._colorLookup[_loc5_];
            _loc3_ = _loc4_.length;
            _loc2_ = 0;
            while(_loc2_ < _loc3_)
            {
               _loc4_[_loc2_].transform.colorTransform = _loc1_;
               _loc2_++;
            }
         }
         _loc4_ = this.getShaderTargets();
         _loc3_ = _loc4_.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_[_loc2_].visible = false;
            _loc2_++;
         }
      }
      
      public function changeColorForShader(param1:UtilHashUint) : Number
      {
         var _loc2_:Number = NaN;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc11_:DisplayObject = null;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc3_:Shader = new Shader();
         _loc3_.byteCode = new GoColorMapShaderClass();
         var _loc4_:Array = new Array();
         var _loc5_:Array = new Array();
         var _loc6_:Array = new Array();
         var _loc7_:UtilHashUint = new UtilHashUint();
         _loc8_ = 0;
         while(_loc8_ < this._customColor.length)
         {
            if(SelectedColor(this._customColor.getValueByIndex(_loc8_)).orgColor != uint.MAX_VALUE)
            {
               _loc7_.push("0x" + SelectedColor(this._customColor.getValueByIndex(_loc8_)).orgColor.toString(16),SelectedColor(this._customColor.getValueByIndex(_loc8_)).dstColor);
            }
            _loc8_++;
         }
         _loc7_.insert(0,param1,true);
         _loc9_ = 0;
         while(_loc9_ < _loc7_.length)
         {
            if(uint(_loc7_.getKey(_loc9_)) == 0)
            {
               _loc7_.remove(_loc9_,1);
            }
            _loc9_++;
         }
         _loc9_ = 0;
         while(_loc9_ < _loc7_.length)
         {
            _loc6_.push(uint(_loc7_.getKey(_loc9_)));
            _loc13_ = uint(_loc7_.getValueByIndex(_loc9_)) >> 16 & 255;
            _loc14_ = uint(_loc7_.getValueByIndex(_loc9_)) >> 8 & 255;
            _loc15_ = uint(_loc7_.getValueByIndex(_loc9_)) & 255;
            if(_loc9_ / 4 < 1)
            {
               _loc4_[_loc9_ * 4 + 0] = _loc13_ / 255;
               _loc4_[_loc9_ * 4 + 1] = _loc14_ / 255;
               _loc4_[_loc9_ * 4 + 2] = _loc15_ / 255;
            }
            else
            {
               _loc5_[_loc9_ % 4 * 4 + 0] = _loc13_ / 255;
               _loc5_[_loc9_ % 4 * 4 + 1] = _loc14_ / 255;
               _loc5_[_loc9_ % 4 * 4 + 2] = _loc15_ / 255;
            }
            _loc9_++;
         }
         _loc3_.data["colorValue0"].value = _loc4_;
         _loc3_.data["colorValue1"].value = _loc5_;
         _loc3_.data["colorKey"].value = _loc6_;
         var _loc10_:Vector.<DisplayObject> = this.getShaderTargets();
         var _loc12_:int = 0;
         while(_loc12_ < _loc10_.length)
         {
            _loc11_ = _loc10_[_loc12_];
            _loc11_.blendMode = BlendMode.NORMAL;
            _loc11_.blendMode = BlendMode.SHADER;
            _loc11_.visible = true;
            _loc11_.blendShader = _loc3_;
            _loc12_++;
         }
         return _loc2_;
      }
      
      private function hideColorItems(param1:Array) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            DisplayObject(param1[_loc2_]).alpha = 0;
            _loc2_++;
         }
      }
      
      private function onBodyLoaded(param1:Event) : void
      {
         IEventDispatcher(param1.target).removeEventListener(param1.type,this.onBodyLoaded);
         if(this._loadHead)
         {
            this._head = new CcHeadComponent();
            this._head.init(this.charXML,this._sceneId,this._useImageLibrary);
            this._head.addEventListener(Event.COMPLETE,this.onHeadLoaded);
            this._head.load();
         }
         else
         {
            this.onReady();
         }
      }
      
      private function onBodyLoadedByCam(param1:Event) : void
      {
         var _loc2_:CCHeadView = null;
         IEventDispatcher(param1.target).removeEventListener(param1.type,this.onBodyLoadedByCam);
         if(this._loadHead)
         {
            _loc2_ = new CCHeadView();
            this._head = _loc2_;
            _loc2_.initByCam(this._myActionModel,this._sceneId,this._useImageLibrary);
            _loc2_.addEventListener(Event.COMPLETE,this.onHeadLoaded);
            _loc2_.load();
         }
         else
         {
            this.onReady();
         }
      }
      
      private function onHeadLoaded(param1:Event) : void
      {
         IEventDispatcher(param1.target).removeEventListener(param1.type,this.onHeadLoaded);
         if(this._head)
         {
            this._lookAtCameraSupported = this._head.supportLookAtCamera;
         }
         this.onReady();
      }
      
      public function onReady(param1:Event = null) : void
      {
         var _loc3_:SelectedColor = null;
         var _loc4_:XML = null;
         var _loc6_:* = null;
         var _loc7_:CCColor = null;
         if(param1)
         {
            (param1.target as IEventDispatcher).removeEventListener(param1.type,this.onReady);
         }
         var _loc2_:DisplayObjectContainer = this.head;
         if(_loc2_)
         {
            if(this._head)
            {
               _loc2_.addChild(this._head);
            }
         }
         var _loc5_:UtilHashUint = new UtilHashUint();
         if(this.charXML)
         {
            for each(_loc4_ in this.charXML.child(CcLibConstant.NODE_COLOR))
            {
               _loc3_ = new SelectedColor(_loc4_.@r,String(_loc4_.@oc).length == 0?uint(uint.MAX_VALUE):uint(uint(_loc4_.@oc)),uint(_loc4_));
               this.changeColor(_loc3_,_loc4_.@targetComponent == null?"":_loc4_.@targetComponent);
               if(_loc3_.orgColor != uint.MAX_VALUE)
               {
                  this._customColor.push(_loc3_.areaName,_loc3_);
                  _loc5_.push("0x" + _loc3_.orgColor.toString(16),_loc3_.dstColor);
               }
            }
         }
         if(this._myActionModel)
         {
            for(_loc6_ in this._myActionModel.colorCodes)
            {
               _loc7_ = this._myActionModel.colorCodes[_loc6_];
               _loc3_ = new SelectedColor(_loc7_.type,_loc7_.oc,_loc7_.dest);
               this.changeColor(_loc3_,!!_loc7_.targetComponent?_loc7_.targetComponent:"");
               if(_loc3_.orgColor != uint.MAX_VALUE)
               {
                  this._customColor.push(_loc3_.areaName,_loc3_);
                  _loc5_.push("0x" + _loc3_.orgColor.toString(16),_loc3_.dstColor);
               }
            }
         }
         if(_loc5_.length > 0)
         {
            this.changeColorForShader(_loc5_);
         }
         this.refreshScale();
         this.pause();
         this.state = STATE_FINISH_LOAD;
         this.updateHeadRect();
         if(this.ver == 2)
         {
            setTimeout(this.dispatchComplete,CC2_INIT_DELAY);
         }
         else
         {
            this.dispatchComplete();
         }
      }
      
      public function resume() : void
      {
         var _loc1_:MovieClip = null;
         var _loc2_:int = 0;
         var _loc3_:Vector.<DisplayObjectContainer> = this.getSubClips();
         var _loc4_:int = _loc3_.length;
         _loc2_ = 0;
         while(_loc2_ < _loc4_)
         {
            _loc1_ = _loc3_[_loc2_] as MovieClip;
            if(_loc1_)
            {
               _loc1_.play();
            }
            _loc2_++;
         }
         _loc3_ = this.getHeadParts();
         _loc4_ = _loc3_.length;
         _loc2_ = 0;
         while(_loc2_ < _loc4_)
         {
            _loc1_ = _loc3_[_loc2_] as MovieClip;
            if(_loc1_ && _loc1_.name != SPEECH_MOUTH)
            {
               _loc1_.play();
            }
            _loc2_++;
         }
      }
      
      public function pause() : void
      {
         var _loc1_:MovieClip = null;
         var _loc2_:int = 0;
         var _loc3_:Vector.<DisplayObjectContainer> = this.getSubClips();
         var _loc4_:int = _loc3_.length;
         _loc2_ = 0;
         while(_loc2_ < _loc4_)
         {
            _loc1_ = _loc3_[_loc2_] as MovieClip;
            if(_loc1_)
            {
               _loc1_.gotoAndStop(1);
            }
            _loc2_++;
         }
         _loc3_ = this.getHeadParts();
         _loc4_ = _loc3_.length;
         _loc2_ = 0;
         while(_loc2_ < _loc4_)
         {
            _loc1_ = _loc3_[_loc2_] as MovieClip;
            if(_loc1_)
            {
               _loc1_.gotoAndStop(1);
            }
            _loc2_++;
         }
      }
      
      private function shiftHead() : void
      {
         if(this.charXML.@headdx != 0 || this.charXML.@headdy != 0)
         {
            this.updateHeadPos(Number(this.charXML.@headdx),Number(this.charXML.@headdy));
         }
      }
      
      public function refreshScale() : void
      {
         if(this.charXML)
         {
            if(this.charXML.@xscale > 0 && this.charXML.@yscale > 0)
            {
               this.updateBodyScale(Number(this.charXML.@xscale),Number(this.charXML.@yscale));
            }
            if(this.charXML.@hxscale > 0 && this.charXML.@hyscale > 0)
            {
               this.updateHeadScale(Number(this.charXML.@hxscale),Number(this.charXML.@hyscale));
            }
            if(this.charXML.@headdx.length() > 0 && this.charXML.@headdy.length() > 0 && (this.charXML.@headdx as Number != 0 || this.charXML.@headdy as Number != 0))
            {
               this.resetHeadPos();
               this.updateHeadPos(Number(this.charXML.@headdx),Number(this.charXML.@headdy));
            }
         }
         if(this._myActionModel)
         {
            if(this._myActionModel.bodyScale.scalex > 0 && this._myActionModel.bodyScale.scaley > 0)
            {
               this.updateBodyScale(this._myActionModel.bodyScale.scalex,this._myActionModel.bodyScale.scaley);
            }
            if(this._myActionModel.headScale.scalex > 0 && this._myActionModel.headScale.scaley > 0)
            {
               this.updateHeadScale(this._myActionModel.headScale.scalex,this._myActionModel.headScale.scaley);
            }
            if(this._myActionModel.headPos.dx != 0 || this._myActionModel.headPos.dy != 0)
            {
               this.resetHeadPos();
               this.updateHeadPos(this._myActionModel.headPos.dx,this._myActionModel.headPos.dy);
            }
         }
      }
      
      private function dispatchComplete() : void
      {
         visible = true;
         dispatchEvent(new LoadEmbedMovieEvent(LoadEmbedMovieEvent.COMPLETE_EVENT));
      }
      
      private function updateHeadRect() : void
      {
         var _loc2_:Rectangle = null;
         var _loc3_:Point = null;
         var _loc4_:Number = NaN;
         var _loc1_:DisplayObjectContainer = this.head;
         if(_loc1_)
         {
            _loc2_ = _loc1_.getBounds(this);
            _loc3_ = new Point(_loc2_.x + _loc2_.width / 2,_loc2_.y + _loc2_.height / 2);
            _loc4_ = CcLibConstant.PHOTO_SIZE;
            this._headRect = new Rectangle(_loc3_.x - _loc4_ * 0.4,_loc3_.y - _loc4_ * 1 / 2,_loc4_,_loc4_);
         }
         this.updateEyesRect();
      }
      
      private function updateEyesRect() : void
      {
         var _loc2_:DisplayObjectContainer = null;
         var _loc3_:DisplayObjectContainer = null;
         var _loc4_:Rectangle = null;
         var _loc5_:Rectangle = null;
         var _loc6_:DisplayObjectContainer = null;
         var _loc7_:Rectangle = null;
         var _loc8_:Point = null;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Point = null;
         var _loc14_:Number = NaN;
         var _loc1_:Boolean = false;
         if(this._head)
         {
            _loc2_ = this.getHeadPartByName(CcLibConstant.COMPONENT_TYPE_EYE + CcLibConstant.LEFT + MC);
            _loc3_ = this.getHeadPartByName(CcLibConstant.COMPONENT_TYPE_EYE + CcLibConstant.RIGHT + MC);
            _loc4_ = _loc2_.getBounds(this);
            _loc5_ = _loc3_.getBounds(this);
            _loc6_ = this.getHeadPartByName(CcLibConstant.COMPONENT_TYPE_NOSE + MC);
            _loc7_ = _loc6_.getBounds(this);
            if(_loc4_.width != 0 && _loc5_.width != 0)
            {
               _loc8_ = new Point((_loc4_.x + _loc5_.x + _loc4_.width) / 2,(_loc4_.y + _loc5_.y) / 2);
               _loc9_ = 100;
               _loc10_ = 100;
               _loc11_ = 2 / 5;
               _loc12_ = 2 / 5;
               this._headRect = new Rectangle(_loc8_.x - _loc9_ * _loc11_,_loc8_.y - _loc10_ * _loc12_,_loc9_,_loc10_);
            }
            else if(_loc7_.width != 0)
            {
               _loc13_ = new Point(_loc7_.x,_loc7_.y);
               _loc14_ = CcLibConstant.PHOTO_SIZE;
               this._headRect = new Rectangle(_loc13_.x - _loc14_ * 0.4,_loc13_.y - _loc14_ * 1 / 2,_loc14_,_loc14_);
            }
         }
      }
      
      public function reloadSkin() : void
      {
         dispatchEvent(new LoadEmbedMovieEvent(LoadEmbedMovieEvent.RELOAD_MOVIE_EVENT));
      }
      
      public function updateLocation(param1:String, param2:Object, param3:String = "") : void
      {
         var _loc5_:DisplayObjectContainer = null;
         var _loc6_:DisplayObjectContainer = null;
         var _loc7_:String = null;
         var _loc8_:CcComponent = null;
         if(this._head)
         {
            _loc7_ = param3 == ""?param1:param3;
            _loc8_ = this._head.getComponent(_loc7_);
            if(_loc8_ && _loc8_.model)
            {
               _loc8_.model.x = Number(param2["x"]);
               _loc8_.model.y = Number(param2["y"]);
               _loc8_.model.xscale = Number(param2["xscale"]);
               _loc8_.model.yscale = Number(param2["yscale"]);
               _loc8_.model.rotation = Number(param2["rotation"]);
               if(_loc8_.model is ICcPairComponent)
               {
                  ICcPairComponent(_loc8_.model).offset = Number(param2["offset"]);
               }
               return;
            }
         }
         var _loc4_:DisplayObjectContainer = this.head;
         if(_loc4_)
         {
            if(!includedInComponentOrder(param1))
            {
               _loc5_ = this.getSubClipByName(param1 + LIB_RIGHT);
               _loc6_ = _loc5_.getChildAt(0) as DisplayObjectContainer;
               _loc5_.x = Number(param2["x"]);
               _loc5_.y = Number(param2["y"]);
               _loc6_.scaleX = Number(param2["xscale"]);
               _loc6_.scaleY = Number(param2["yscale"]);
               _loc5_.x = _loc5_.x - Number(param2["offset"]) / 2;
               _loc6_.rotation = Number(param2["rotation"]);
               _loc5_ = this.getSubClipByName(param1 + LIB_LEFT);
               _loc6_ = _loc5_.getChildAt(0) as DisplayObjectContainer;
               _loc5_.x = Number(param2["x"]);
               _loc5_.y = Number(param2["y"]);
               _loc6_.scaleX = Number(param2["xscale"]);
               _loc6_.scaleY = Number(param2["yscale"]);
               _loc5_.x = _loc5_.x + Number(param2["offset"]) / 2;
               _loc6_.rotation = -Number(param2["rotation"]);
            }
            else
            {
               _loc5_ = this.getSubClipByName(param1 + MC);
               if(param3 != "")
               {
                  _loc6_ = _loc5_.getChildByName(param3) as DisplayObjectContainer;
               }
               else if(_loc5_.numChildren > 0)
               {
                  _loc6_ = _loc5_.getChildAt(0) as DisplayObjectContainer;
               }
               if(_loc6_ != null)
               {
                  if(CcLibConstant.ALL_MULTIPLE_COMPONENT_TYPES.indexOf(param1) > -1)
                  {
                     _loc6_.x = Number(param2["x"]);
                     _loc6_.y = Number(param2["y"]);
                  }
                  else
                  {
                     _loc5_.x = Number(param2["x"]);
                     _loc5_.y = Number(param2["y"]);
                  }
                  _loc6_.scaleX = Number(param2["xscale"]);
                  _loc6_.scaleY = Number(param2["yscale"]);
                  _loc6_.rotation = Number(param2["rotation"]);
               }
            }
         }
         this.updateHeadRect();
      }
      
      public function highlightComponent(param1:String) : void
      {
         var _loc2_:DisplayObjectContainer = this.getSubClipByName(param1);
         if(_loc2_)
         {
            _loc2_.filters = [new GlowFilter(16777215)];
         }
      }
      
      public function removeHighlight(param1:String) : void
      {
         var _loc2_:DisplayObjectContainer = this.getSubClipByName(param1);
         if(_loc2_)
         {
            _loc2_.filters = [];
         }
      }
      
      public function removeComponentById(param1:String) : void
      {
         var _loc2_:DisplayObjectContainer = this.getSubClipByName(param1);
         if(_loc2_ && _loc2_.parent)
         {
            _loc2_.parent.removeChild(_loc2_);
         }
      }
      
      protected function removeSubClips(param1:DisplayObjectContainer) : void
      {
         var _loc2_:int = param1.numChildren;
         while(_loc2_)
         {
            param1.removeChildAt(0);
            _loc2_--;
         }
      }
      
      public function refreshProp() : void
      {
         var _loc1_:DisplayObjectContainer = this.getSubClipByName(AnimeConstants.MOVIECLIP_THE_PROP);
         if(_loc1_)
         {
            if(this._hasProp)
            {
               this.removeSubClips(_loc1_);
            }
            if(this._prop)
            {
               _loc1_.addChild(this._prop);
               this.updatePropSize(this._prop,_loc1_);
            }
            this._hasProp = true;
         }
      }
      
      private function updatePropSize(param1:DisplayObjectContainer, param2:DisplayObjectContainer) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:DisplayObject = null;
         if(param1 && param2)
         {
            _loc3_ = 1;
            _loc4_ = 1;
            _loc5_ = param1;
            do
            {
               _loc3_ = _loc3_ * _loc5_.scaleX;
               _loc4_ = _loc4_ * _loc5_.scaleY;
               _loc5_ = _loc5_.parent;
            }
            while(_loc5_ && _loc5_ != param2);
            
            param1.scaleX = Math.abs(1 / scaleX);
            param1.scaleY = Math.abs(1 / scaleY);
         }
      }
      
      public function destroy(param1:Boolean = true) : void
      {
         var _loc2_:int = 0;
         var _loc5_:Loader = null;
         var _loc3_:Vector.<DisplayObjectContainer> = this.getSubClips();
         var _loc4_:int = _loc3_.length;
         _loc2_ = 0;
         while(_loc2_ < _loc4_)
         {
            _loc5_ = _loc3_[_loc2_] as Loader;
            if(_loc5_)
            {
               _loc5_.unloadAndStop(param1);
            }
            _loc2_++;
         }
         _loc2_ = this.numChildren;
         while(_loc2_ > 0)
         {
            this.removeChildAt(_loc2_ - 1);
            _loc2_--;
         }
         if(this._head)
         {
            this._head.destroy(param1);
         }
         this._ccm.destroy();
         this.state = STATE_NULL;
         dispatchEvent(new LoadEmbedMovieEvent(LoadEmbedMovieEvent.MOVIE_FINISH_EVENT));
      }
      
      public function get headPos() : Point
      {
         var _loc1_:DisplayObjectContainer = this.head;
         return new Point(_loc1_.x,_loc1_.y);
      }
      
      public function resetHeadPos() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:DisplayObject = null;
         var _loc1_:DisplayObjectContainer = this.currentHead;
         if(_loc1_)
         {
            _loc2_ = _loc1_.numChildren;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc4_ = _loc1_.getChildAt(_loc3_);
               _loc4_.x = 0;
               _loc4_.y = 0;
               _loc3_++;
            }
         }
      }
      
      public function updateHeadPos(param1:Number, param2:Number) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:DisplayObject = null;
         var _loc3_:DisplayObjectContainer = this.currentHead;
         if(_loc3_)
         {
            _loc4_ = _loc3_.numChildren;
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc6_ = _loc3_.getChildAt(_loc5_);
               _loc6_.x = _loc6_.x + param1;
               _loc6_.y = _loc6_.y + param2;
               _loc5_++;
            }
         }
      }
      
      public function updateHeadScale(param1:Number, param2:Number) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:DisplayObject = null;
         var _loc3_:DisplayObjectContainer = this.currentHead;
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.numChildren;
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc6_ = _loc3_.getChildAt(_loc5_);
               _loc6_.scaleX = param1;
               _loc6_.scaleY = param2;
               _loc5_++;
            }
         }
      }
      
      public function updateBodyScale(param1:Number, param2:Number) : void
      {
         var _loc3_:DisplayObjectContainer = this.getSkeletonContainer(this.ver);
         if(_loc3_)
         {
            _loc3_.scaleX = param1;
            _loc3_.scaleY = param2;
         }
      }
      
      public function get bodyScale() : Number
      {
         var _loc1_:DisplayObjectContainer = this.getSkeletonContainer(this.ver);
         if(!_loc1_)
         {
            return 1;
         }
         return _loc1_.scaleX;
      }
      
      public function getHeadBitmap() : BitmapData
      {
         var _loc1_:BitmapData = null;
         this.updateHeadRect();
         var _loc2_:Matrix = new Matrix();
         _loc1_ = new BitmapData(100,100,true,255);
         _loc2_.translate(-this.headRect.x,-this.headRect.y);
         _loc2_.scale(100 / this.headRect.width,100 / this.headRect.height);
         _loc1_.draw(this,_loc2_);
         return _loc1_;
      }
      
      public function getBitmap() : BitmapData
      {
         var _loc1_:BitmapData = null;
         var _loc2_:Matrix = new Matrix();
         var _loc3_:Rectangle = this.parent.getBounds(this);
         var _loc4_:Number = _loc3_.width;
         var _loc5_:Number = _loc3_.height;
         _loc1_ = new BitmapData(_loc4_,_loc5_,true,0);
         _loc2_.translate(-_loc3_.x,-_loc3_.y);
         _loc2_.scale(1,1);
         _loc1_.draw(this,_loc2_);
         return _loc1_;
      }
      
      private function resetComponent(param1:ExtraDataLoader, param2:XML) : void
      {
         var colorArray:Array = null;
         var colorNames:Object = null;
         var decoIndex:Number = NaN;
         var loader:ExtraDataLoader = param1;
         var node:XML = param2;
         if(loader && node)
         {
            colorNames = CcLibConstant.COLORS_BY_COMPONENT(node.@type);
            if(colorNames)
            {
               colorArray = (colorNames as Array).map(function(param1:String, param2:int, param3:Array):Object
               {
                  var colorXMLNode:* = undefined;
                  var colorObj:* = undefined;
                  var item:String = param1;
                  var index:int = param2;
                  var array:Array = param3;
                  colorXMLNode = charXML.color.(@r == item);
                  colorObj = {
                     "colorReference":String(colorXMLNode.@r),
                     "originalColor":(String(colorXMLNode.@oc).length == 0?uint.MAX_VALUE:uint(colorXMLNode.@oc)),
                     "colorValue":uint(colorXMLNode.text()),
                     "targetComponentId":""
                  };
                  return colorObj;
               });
            }
            loader.extraData["colors"] = colorArray;
            loader.extraData["properties"] = {
               "x":String(node.@x),
               "y":String(node.@y),
               "xscale":String(node.@xscale),
               "yscale":String(node.@yscale),
               "offset":String(node.@offset),
               "rotation":String(node.@rotation),
               "split":(!!Boolean(String(node.@split) == "N")?false:true)
            };
            decoIndex = -1;
            if(CcLibConstant.ALL_MULTIPLE_COMPONENT_TYPES.indexOf(String(node.@type)) == -1)
            {
               loader.name = String(node.@type);
            }
            else
            {
               loader.name = String(node.@id);
               decoIndex = this._decoArray.push(String(node.@id)) - 1;
            }
            loader.extraData["index"] = decoIndex;
            this.doLoadImageData(loader);
         }
      }
      
      public function getSubClipByName(param1:String) : DisplayObjectContainer
      {
         if(!this._subClipLookup)
         {
            this.processSubClips();
         }
         return this._subClipLookup[param1] as DisplayObjectContainer;
      }
      
      public function getHeadPartByName(param1:String) : DisplayObjectContainer
      {
         if(!this._headPartLookup)
         {
            this.processHeadParts();
         }
         return this._headPartLookup[param1] as DisplayObjectContainer;
      }
      
      public function getSubClips() : Vector.<DisplayObjectContainer>
      {
         if(!this._subClipLookup)
         {
            this.processSubClips();
         }
         return this._subClips;
      }
      
      public function getHeadParts() : Vector.<DisplayObjectContainer>
      {
         if(!this._headParts)
         {
            this.processHeadParts();
         }
         return this._headParts;
      }
      
      public function getShaderTargets() : Vector.<DisplayObject>
      {
         var _loc1_:Vector.<DisplayObjectContainer> = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(!this._shaderTargets)
         {
            this._shaderTargets = new Vector.<DisplayObject>();
            _loc1_ = this.getSubClips();
            _loc2_ = _loc1_.length;
            while(_loc3_ < _loc2_)
            {
               if(_loc1_[_loc3_].name == "shaderObj")
               {
                  this._shaderTargets.push(_loc1_[_loc3_]);
               }
               _loc3_++;
            }
         }
         return this._shaderTargets;
      }
      
      public function getColorPartsByName(param1:String) : Vector.<DisplayObject>
      {
         if(!this._colorLookup)
         {
            this.buildColorIndex();
         }
         return this._colorLookup[param1];
      }
      
      protected function buildColorIndex() : void
      {
         this._colorLookup = {};
         this.buildColorIndexImpl(this.getSubClips());
         this.buildColorIndexImpl(this.getHeadParts());
      }
      
      protected function buildColorIndexImpl(param1:Vector.<DisplayObjectContainer>) : void
      {
         var _loc3_:int = 0;
         var _loc4_:DisplayObjectContainer = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:Vector.<DisplayObject> = null;
         var _loc2_:int = param1.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1[_loc3_];
            _loc5_ = _loc4_.name;
            if(_loc5_ && _loc5_.indexOf("theColor_") != -1)
            {
               _loc6_ = _loc5_.substr(9);
               _loc7_ = this._colorLookup[_loc6_];
               if(!_loc7_)
               {
                  _loc7_ = new Vector.<DisplayObject>();
                  this._colorLookup[_loc6_] = _loc7_;
               }
               _loc7_.push(_loc4_);
            }
            _loc3_++;
         }
      }
      
      protected function processSubClips() : void
      {
         this._subClips = new Vector.<DisplayObjectContainer>();
         this._subClipLookup = {};
         this.processClipContainer(this,this._subClips,this._subClipLookup);
      }
      
      protected function processHeadParts() : void
      {
         this._headParts = new Vector.<DisplayObjectContainer>();
         this._headPartLookup = {};
         this.processClipContainer(this._head,this._headParts,this._headPartLookup);
      }
      
      protected function processClipContainer(param1:DisplayObjectContainer, param2:Vector.<DisplayObjectContainer>, param3:Object) : void
      {
         var _loc4_:int = 0;
         var _loc5_:DisplayObjectContainer = null;
         var _loc6_:String = null;
         var _loc7_:int = 0;
         if(param1)
         {
            _loc4_ = param1.numChildren;
            _loc7_ = 0;
            while(_loc7_ < _loc4_)
            {
               _loc5_ = param1.getChildAt(_loc7_) as DisplayObjectContainer;
               if(_loc5_)
               {
                  if(param2)
                  {
                     param2.push(_loc5_);
                  }
                  if(param3)
                  {
                     _loc6_ = _loc5_.name;
                     if(_loc6_ && !param3[_loc6_])
                     {
                        param3[_loc6_] = _loc5_;
                     }
                  }
                  this.processClipContainer(_loc5_,param2,param3);
               }
               _loc7_++;
            }
         }
      }
      
      public function addLibrary(param1:String, param2:String, param3:String) : void
      {
      }
      
      public function removeLibrary(param1:String) : void
      {
      }
      
      public function prepareImage(param1:String, param2:Boolean = true, param3:Boolean = true) : void
      {
         var _loc4_:ExtraDataLoader = null;
         var _loc5_:XML = null;
         var _loc6_:Object = null;
         var _loc7_:String = null;
         var _loc8_:AssetImageLibraryObject = null;
         var _loc9_:UtilHashUint = null;
         var _loc10_:Object = null;
         var _loc11_:Number = NaN;
         var _loc12_:SelectedColor = null;
         if(this._useImageLibrary)
         {
            this._sceneId = param1;
            for each(_loc5_ in this.charXML.child(CcLibConstant.NODE_LIBRARY))
            {
               _loc7_ = _loc5_.@theme_id + "." + _loc5_.@type + "." + _loc5_.@component_id + SWF_EXT;
               _loc8_ = CcImageLibrary.library.borrowImage(_loc7_,0,this._sceneId);
               _loc4_ = null;
               if(_loc8_)
               {
                  _loc4_ = _loc8_.image as ExtraDataLoader;
               }
               if(_loc4_)
               {
                  _loc10_ = _loc4_.extraData;
                  this.CCM.addStyle(_loc10_["part"],_loc4_.contentLoaderInfo);
               }
            }
            this.reloadSkin();
            this._decoArray = new Array();
            for each(_loc5_ in this.charXML.child(NODE_COMPONENT))
            {
               if(this.shouldComponentBeBorrowed(_loc5_.@type) && CcLibConstant.ALL_BODY_COMPONENT_TYPES.indexOf(String(_loc5_.@type)) >= 0)
               {
                  _loc7_ = _loc5_.@theme_id + "." + _loc5_.@type + "." + _loc5_.@path + "." + _loc5_.@file;
                  _loc11_ = 0;
                  if(!param2)
                  {
                     _loc11_ = this._assetImageLookup[_loc7_];
                  }
                  _loc8_ = CcImageLibrary.library.borrowImage(_loc7_,_loc11_,this._sceneId);
                  _loc4_ = null;
                  if(_loc8_)
                  {
                     this._assetImageLookup[_loc7_] = _loc8_.imageId;
                     _loc4_ = _loc8_.image as ExtraDataLoader;
                  }
                  if(_loc4_)
                  {
                     this.resetComponent(_loc4_,_loc5_);
                  }
               }
            }
            if(this._head && param3)
            {
               this._head.prepareImage(this._sceneId,param2);
            }
            this.resetColor();
            _loc9_ = new UtilHashUint();
            for each(_loc5_ in this.charXML.child(CcLibConstant.NODE_COLOR))
            {
               _loc12_ = new SelectedColor(_loc5_.@r,String(_loc5_.@oc).length == 0?uint(uint.MAX_VALUE):uint(uint(_loc5_.@oc)),uint(_loc5_));
               this.changeColor(_loc12_,_loc5_.@targetComponent == null?"":_loc5_.@targetComponent);
               if(_loc12_.orgColor != uint.MAX_VALUE)
               {
                  this._customColor.push(_loc12_.areaName,_loc12_);
                  _loc9_.push("0x" + _loc12_.orgColor.toString(16),_loc12_.dstColor);
               }
            }
            if(_loc9_.length > 0)
            {
               this.changeColorForShader(_loc9_);
            }
            this.refreshScale();
            this.updateHeadRect();
            this.pause();
         }
      }
   }
}
