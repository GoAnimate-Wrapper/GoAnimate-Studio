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
   import anifire.models.creator.CCCharActionComponentModel;
   import anifire.models.creator.CCCharacterActionModel;
   import anifire.models.creator.CCColor;
   import anifire.util.ExtraDataLoader;
   import anifire.util.UtilColor;
   import anifire.util.UtilCrypto;
   import anifire.util.UtilErrorLogger;
   import anifire.util.UtilHashArray;
   import anifire.util.UtilHashBytes;
   import anifire.util.UtilHashNumber;
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
   import flash.display.Shader;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.filters.GlowFilter;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.net.URLStream;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   import flash.utils.setTimeout;
   import nochump.util.zip.ZipEntry;
   import nochump.util.zip.ZipFile;
   
   public class CustomCharacterMaker extends Sprite implements ICharacter
   {
      
      public static const LOOK_AT_CAMERA_CHANGED:String = "CcLookAtCamera";
      
      public static const SPEECH_PITCH_CHANGED:String = "CcPitchChanged";
      
      public static const STATE_NULL:String = "null";
      
      public static const STATE_LOADING:String = "loading";
      
      public static const STATE_FINISH_LOAD:String = "finish_load";
      
      public static const CC2_INIT_DELAY:Number = 200;
      
      private static var _numTotalLoadBytes:Number = 0;
       
      
      private var GoColorMapShaderClass:Class;
      
      private const BODYSHAPE:String = "bodyshape";
      
      private const XML_DESC:String = "desc.xml";
      
      private const UPPERBODY:String = "upper_body";
      
      private const CLIPUPPER:String = "theUpper";
      
      private const LOWERBODY:String = "lower_body";
      
      private const CLIPLOWER:String = "theLower";
      
      private const DEFAULTHEAD:String = "defaultHead";
      
      private const LIB_LEFT:String = "Left";
      
      private const LIB_RIGHT:String = "Right";
      
      private const NODE_COMPONENT:String = "component";
      
      private const SWF_EXT:String = ".swf";
      
      private const SKELETON:String = "skeleton";
      
      private var _eventDispatcher:EventDispatcher;
      
      private var _myActionModel:CCCharacterActionModel;
      
      private var _charXML:XML;
      
      private var _charSwfs:UtilHashBytes;
      
      private var _charZip:ZipFile;
      
      private const MC:String = "MC";
      
      private var _componentOrder:Array;
      
      private var _componentQueue:Array;
      
      private var should_decrypt:Boolean = true;
      
      private var _customColor:UtilHashSelectedColor;
      
      private var _shouldPauseOnLoadByteComplete:Boolean;
      
      private var _state:String;
      
      private var _waiting:Array;
      
      private var _decoArray:Array;
      
      private var _lookAtCameraSupported:Boolean = false;
      
      private var _prop:DisplayObjectContainer = null;
      
      private var _hasProp:Boolean = false;
      
      private var _sceneId:String;
      
      private var _head:CcHeadComponent;
      
      private var _head2:CCHeadView;
      
      private var _loadHead:Boolean = true;
      
      private var _useImageLibrary:Boolean = false;
      
      private var _headRect:Rectangle;
      
      private var _tempworker:GoBaseWorkerImp;
      
      private var _ccm:CCManager;
      
      private var _ver:Number;
      
      private var _libraries:UtilHashArray;
      
      private var _sDate:Date;
      
      private var _isLoadingLipSyncMouth:Boolean = false;
      
      private var _assetImageIdArray:UtilHashNumber;
      
      public function CustomCharacterMaker()
      {
         this.GoColorMapShaderClass = CustomCharacterMaker_GoColorMapShaderClass;
         this._charXML = ;
         this._componentOrder = CcLibConstant.ALL_BODY_COMPONENT_TYPES.concat(CcLibConstant.GET_COMPONENT_ORDER_IN_HEAD);
         this._componentQueue = new Array();
         this._waiting = new Array();
         this._headRect = new Rectangle();
         this._libraries = new UtilHashArray();
         this._assetImageIdArray = new UtilHashNumber();
         super();
         this._customColor = new UtilHashSelectedColor();
         this._ccm = new CCManager();
         this.state = STATE_NULL;
         this._eventDispatcher = new EventDispatcher();
         this._ver = 1;
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
         if(this._head2)
         {
            this._head2.useTalkMouth = param1;
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
         var _loc1_:DisplayObjectContainer = UtilPlain.getInstance(this,this.DEFAULTHEAD);
         if(_loc1_ != null)
         {
            return _loc1_;
         }
         return null;
      }
      
      public function get headRect() : Rectangle
      {
         return this._headRect;
      }
      
      private function getSkeletonContainer(param1:Number = 0) : DisplayObjectContainer
      {
         var _loc2_:DisplayObjectContainer = null;
         switch(param1)
         {
            case 2:
               _loc2_ = UtilPlain.getInstance(this,CcLibConstant.COMPONENT_TYPE_FREEACTION);
               break;
            default:
               _loc2_ = UtilPlain.getInstance(this,CcLibConstant.COMPONENT_TYPE_SKELETON);
         }
         return _loc2_;
      }
      
      public function get CCM() : CCManager
      {
         return this._ccm;
      }
      
      public function get lookAtCameraSupported() : Boolean
      {
         return this._lookAtCameraSupported;
      }
      
      public function get shouldPauseOnLoadBytesComplete() : Boolean
      {
         return this._shouldPauseOnLoadByteComplete;
      }
      
      public function set shouldPauseOnLoadBytesComplete(param1:Boolean) : void
      {
         this._shouldPauseOnLoadByteComplete = param1;
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
      
      public function get eventDispatcher() : EventDispatcher
      {
         return this._eventDispatcher;
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
      
      private function doUpdateState(param1:Event) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.doUpdateState);
         this.state = STATE_FINISH_LOAD;
      }
      
      public function prepareDataByCam() : void
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
      
      public function removeLibrary(param1:String) : void
      {
         this._libraries.removeByKey(param1);
      }
      
      public function addLibrary(param1:String, param2:String, param3:String) : void
      {
         var _loc4_:Library = new Library();
         _loc4_.type = param1;
         _loc4_.component_id = param2;
         _loc4_.theme_id = param3;
         this._libraries.push(_loc4_.type,_loc4_);
      }
      
      public function insertColor(param1:UtilHashSelectedColor) : void
      {
         if(param1)
         {
            this._customColor.insert(0,param1);
            this.CCM.colors.insert(0,param1);
         }
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
         this.destroy();
         this.charXML = new XML(param1.getInput(param1.getEntry(this.XML_DESC)));
         this.prepareXML(this.charXML);
         this.prepareSkin();
      }
      
      private function prepareSkinByCam() : void
      {
         var _loc2_:String = null;
         var _loc3_:ByteArray = null;
         var _loc5_:* = null;
         var _loc6_:ExtraDataLoader = null;
         var _loc7_:LoaderContext = null;
         var _loc8_:Object = null;
         var _loc1_:Date = new Date();
         var _loc4_:UtilLoadMgr = new UtilLoadMgr();
         _loc4_.addEventListener(LoadMgrEvent.ALL_COMPLETE,this.doPrepareFinishedByCam);
         for(_loc5_ in this._myActionModel.libraryPaths)
         {
            _loc6_ = new ExtraDataLoader();
            _loc2_ = this._myActionModel.libraryPaths[_loc5_];
            if(this._useImageLibrary)
            {
               if(CcImageLibrary.library.requestImage(_loc2_,this._sceneId,_loc6_) > 0)
               {
                  continue;
               }
            }
            _loc3_ = this.charSwfs.getValueByKey(_loc2_);
            _loc7_ = new LoaderContext();
            _loc7_.allowCodeImport = true;
            if(_loc3_ != null)
            {
               _loc8_ = new Object();
               _loc8_["part"] = _loc5_;
               _loc6_.extraData = _loc8_;
               _loc4_.addEventDispatcher(_loc6_.contentLoaderInfo,Event.COMPLETE);
               _loc6_.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onLoadStyleDone);
               _loc6_.loadBytes(_loc3_,_loc7_);
               _numTotalLoadBytes++;
            }
         }
         _loc4_.commit();
      }
      
      private function prepareSkin(param1:UtilHashBytes = null) : void
      {
         var _loc3_:XML = null;
         var _loc4_:String = null;
         var _loc5_:ByteArray = null;
         var _loc7_:ExtraDataLoader = null;
         var _loc8_:ZipEntry = null;
         var _loc9_:Object = null;
         var _loc2_:Date = new Date();
         var _loc6_:UtilLoadMgr = new UtilLoadMgr();
         _loc6_.addEventListener(LoadMgrEvent.ALL_COMPLETE,this.doPrepareFinished);
         for each(_loc3_ in this.charXML.child(CcLibConstant.NODE_LIBRARY))
         {
            _loc7_ = new ExtraDataLoader();
            _loc4_ = _loc3_.@theme_id + "." + _loc3_.@type + "." + _loc3_.@component_id + this.SWF_EXT;
            if(this._useImageLibrary)
            {
               if(CcImageLibrary.library.requestImage(_loc4_,this._sceneId,_loc7_) > 0)
               {
                  continue;
               }
            }
            if(param1 == null || param1.length == 0)
            {
               if(this.charZip != null)
               {
                  _loc8_ = this.charZip.getEntry(_loc4_);
                  if(_loc8_ != null)
                  {
                     _loc5_ = this.charZip.getInput(_loc8_);
                  }
               }
               else if(this.charSwfs != null)
               {
                  _loc5_ = this.charSwfs.getValueByKey(_loc4_);
               }
            }
            else
            {
               _loc5_ = param1.getValueByKey(_loc4_);
            }
            if(_loc5_ != null)
            {
               _loc9_ = new Object();
               _loc9_["part"] = String(_loc3_.@type);
               _loc7_.extraData = _loc9_;
               _loc6_.addEventDispatcher(_loc7_.contentLoaderInfo,Event.COMPLETE);
               _loc7_.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onLoadStyleDone);
               _loc7_.loadBytes(_loc5_);
               _numTotalLoadBytes++;
            }
         }
         _loc6_.commit();
      }
      
      private function onLoadStyleDone(param1:Event) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.onLoadStyleDone);
         var _loc2_:LoaderInfo = LoaderInfo(param1.currentTarget);
         var _loc3_:Object = ExtraDataLoader(_loc2_.loader).extraData;
         var _loc4_:Date = new Date();
         this.CCM.addStyle(_loc3_["part"],_loc2_);
      }
      
      private function doPrepareFinishedByCam(param1:Event) : void
      {
         var _loc2_:Date = new Date();
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.doPrepareFinishedByCam);
         this.loadAllComponentsByCam(null);
      }
      
      private function doPrepareFinished(param1:Event) : void
      {
         var _loc2_:Date = new Date();
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.doPrepareFinished);
         this.loadAllComponents(null);
      }
      
      public function get lookAtCamera() : Boolean
      {
         if(this._head)
         {
            return this._head.lookAtCamera;
         }
         if(this._head2)
         {
            return this._head2.lookAtCamera;
         }
         return false;
      }
      
      public function set lookAtCamera(param1:Boolean) : void
      {
         if(this._head)
         {
            this._head.lookAtCamera = param1;
         }
         if(this._head2)
         {
            this._head2.lookAtCamera = param1;
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
            else if(this._head2)
            {
               this._head2.addEventListener(Event.COMPLETE,this.onHeadImageRequested);
               this._head2.requestImage(this._sceneId);
            }
            else if(this._myActionModel)
            {
               this._head2 = new CCHeadView();
               this._head2.initByCam(this._myActionModel,this._sceneId,this._useImageLibrary);
               this._head2.addEventListener(Event.COMPLETE,this.onHeadImageRequested);
               this._head2.load();
               _loc2_ = UtilPlain.getInstance(this,this.DEFAULTHEAD);
               if(_loc2_)
               {
                  _loc2_.addChild(this._head2);
               }
            }
            else if(this.charXML)
            {
               this._head = new CcHeadComponent();
               this._head.init(this.charXML,this._sceneId,this._useImageLibrary);
               this._head.addEventListener(Event.COMPLETE,this.onHeadImageRequested);
               this._head.load();
               _loc2_ = UtilPlain.getInstance(this,this.DEFAULTHEAD);
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
         var _loc2_:ExtraDataLoader = null;
         var _loc3_:XML = null;
         var _loc4_:Object = null;
         var _loc5_:String = null;
         var _loc6_:AssetImageLibraryObject = null;
         var _loc7_:String = null;
         var _loc8_:ByteArray = null;
         var _loc9_:Number = NaN;
         var _loc10_:ZipEntry = null;
         var _loc11_:Object = null;
         var _loc12_:* = null;
         var _loc1_:UtilLoadMgr = new UtilLoadMgr();
         _loc1_.addEventListener(LoadMgrEvent.ALL_COMPLETE,this.onBodyImageRequested);
         if(this._useImageLibrary)
         {
            if(this.charXML)
            {
               for each(_loc3_ in this.charXML.child(CcLibConstant.NODE_LIBRARY))
               {
                  _loc2_ = new ExtraDataLoader();
                  _loc7_ = _loc3_.@theme_id + "." + _loc3_.@type + "." + _loc3_.@component_id + this.SWF_EXT;
                  _loc9_ = 0;
                  _loc9_ = CcImageLibrary.library.requestImage(_loc7_,this._sceneId,_loc2_);
                  if(_loc9_ <= 0)
                  {
                     if(this.charZip != null)
                     {
                        _loc10_ = this.charZip.getEntry(_loc7_);
                        if(_loc10_ != null)
                        {
                           _loc8_ = this.charZip.getInput(_loc10_);
                        }
                     }
                     else if(this.charSwfs != null)
                     {
                        _loc8_ = this.charSwfs.getValueByKey(_loc7_);
                     }
                     if(_loc8_ != null)
                     {
                        _loc11_ = new Object();
                        _loc11_["part"] = String(_loc3_.@type);
                        _loc2_.extraData = _loc11_;
                        _loc1_.addEventDispatcher(_loc2_.contentLoaderInfo,Event.COMPLETE);
                        _loc2_.loadBytes(_loc8_);
                        _numTotalLoadBytes++;
                     }
                  }
               }
               for each(_loc3_ in this.charXML.child(this.NODE_COMPONENT))
               {
                  if(this.shouldComponentBeBorrowed(_loc3_.@type) && CcLibConstant.ALL_BODY_COMPONENT_TYPES.indexOf(String(_loc3_.@type)) >= 0)
                  {
                     this.updateComponentImageData(_loc3_.@type,null,null,_loc1_,null,_loc3_.@id,_loc3_);
                  }
               }
            }
            if(this._myActionModel)
            {
               for(_loc12_ in this._myActionModel.libraryPaths)
               {
                  _loc2_ = new ExtraDataLoader();
                  _loc7_ = this._myActionModel.libraryPaths[_loc12_];
                  _loc9_ = 0;
                  _loc9_ = CcImageLibrary.library.requestImage(_loc7_,this._sceneId,_loc2_);
                  if(_loc9_ <= 0)
                  {
                     if(this.charZip != null)
                     {
                        _loc10_ = this.charZip.getEntry(_loc7_);
                        if(_loc10_ != null)
                        {
                           _loc8_ = this.charZip.getInput(_loc10_);
                        }
                     }
                     else if(this.charSwfs != null)
                     {
                        _loc8_ = this.charSwfs.getValueByKey(_loc7_);
                     }
                     if(_loc8_ != null)
                     {
                        _loc11_ = new Object();
                        _loc11_["part"] = String(_loc12_);
                        _loc2_.extraData = _loc11_;
                        _loc1_.addEventDispatcher(_loc2_.contentLoaderInfo,Event.COMPLETE);
                        _loc2_.loadBytes(_loc8_);
                        _numTotalLoadBytes++;
                     }
                  }
               }
               for(_loc12_ in this._myActionModel.components)
               {
                  if(this.shouldComponentBeBorrowed(_loc12_) && CcLibConstant.ALL_BODY_COMPONENT_TYPES.indexOf(_loc12_) >= 0)
                  {
                     this.updateComponentImageData(_loc12_,null,null,_loc1_,null,_loc12_);
                  }
               }
            }
         }
         _loc1_.commit();
      }
      
      private function shouldComponentBeBorrowed(param1:String) : Boolean
      {
         if(param1 == this.SKELETON || param1 == CcLibConstant.COMPONENT_TYPE_FREEACTION || param1 == this.BODYSHAPE)
         {
            return false;
         }
         return true;
      }
      
      public function initBySwfs(param1:XML, param2:UtilHashBytes, param3:UtilHashBytes = null) : void
      {
         var _loc4_:Date = new Date();
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
         this.should_decrypt = false;
         this.charXML = param1;
         this.charSwfs = param2.clone();
         this._waiting = new Array();
         this.visible = false;
         this.destroy();
         this.prepareXML(this.charXML);
         this.prepareSkin(param3);
      }
      
      public function initBySwfCam(param1:CCCharacterActionModel, param2:UtilHashBytes, param3:UtilHashBytes = null) : void
      {
         var _loc4_:Date = new Date();
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
         this.should_decrypt = false;
         this._myActionModel = param1;
         this.charSwfs = param2.clone();
         this._waiting = new Array();
         this.visible = false;
         this.destroy();
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
         this._sDate = new Date();
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
         this._sDate = new Date();
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
         var loader:CcActionLoader = null;
         var e:Event = param1;
         (e.target as IEventDispatcher).removeEventListener(e.type,this.onCcActionLoadedByCam);
         var cDate:Date = new Date();
         try
         {
            loader = CcActionLoader(e.target);
            if(loader.imageData)
            {
               this.initBySwfCam(loader.imageData["cam"] as CCCharacterActionModel,loader.imageData["imageData"] as UtilHashBytes);
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
      
      private function onCcActionLoaded(param1:Event) : void
      {
         var loader:CcActionLoader = null;
         var e:Event = param1;
         (e.target as IEventDispatcher).removeEventListener(e.type,this.onCcActionLoaded);
         var cDate:Date = new Date();
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
         var _loc3_:XML = null;
         var _loc5_:* = null;
         var _loc6_:ExtraDataLoader = null;
         if(!this._myActionModel)
         {
            return;
         }
         var _loc2_:Date = new Date();
         this._decoArray = new Array();
         var _loc4_:UtilLoadMgr = new UtilLoadMgr();
         _loc4_.addEventListener(LoadMgrEvent.ALL_COMPLETE,this.onBodyLoadedByCam);
         for(_loc5_ in this._myActionModel.components)
         {
            if(CcLibConstant.ALL_BODY_COMPONENT_TYPES.indexOf(_loc5_) > -1)
            {
               _loc6_ = this.updateComponentImageData(_loc5_,null,null,_loc4_,null,this._myActionModel.getComponentByType(_loc5_).path);
            }
         }
         _loc4_.commit();
      }
      
      private function loadAllComponents(param1:Event) : void
      {
         var _loc3_:XML = null;
         var _loc5_:ExtraDataLoader = null;
         var _loc2_:Date = new Date();
         this._decoArray = new Array();
         var _loc4_:UtilLoadMgr = new UtilLoadMgr();
         _loc4_.addEventListener(LoadMgrEvent.ALL_COMPLETE,this.onBodyLoaded);
         for each(_loc3_ in this.charXML.child(this.NODE_COMPONENT))
         {
            if(CcLibConstant.ALL_BODY_COMPONENT_TYPES.indexOf(String(_loc3_.@type)) >= 0)
            {
               _loc5_ = this.updateComponentImageData(_loc3_.@type,null,null,_loc4_,null,_loc3_.@id,_loc3_);
            }
         }
         _loc4_.commit();
      }
      
      public function updateComponentImageData(param1:String, param2:ByteArray, param3:Object, param4:UtilLoadMgr, param5:Array = null, param6:String = "", param7:XML = null) : ExtraDataLoader
      {
         var clipName:String = null;
         var key:String = null;
         var model:CcComponentModel = null;
         var cacm:CCCharActionComponentModel = null;
         var colorNames:Object = null;
         var swfkey:String = null;
         var tmpByteArray:ByteArray = null;
         var decryptEngine:UtilCrypto = null;
         var loaderContext:LoaderContext = null;
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
         var assetImageId:Number = 0;
         if(this._useImageLibrary)
         {
            if(node)
            {
               key = node.@theme_id + "." + node.@type + "." + node.@path + "." + node.@file;
               if(this.shouldComponentBeBorrowed(node.@type))
               {
                  assetImageId = CcImageLibrary.library.requestImage(key,this._sceneId,loader);
                  if(assetImageId > 0)
                  {
                     return null;
                  }
               }
            }
            if(this._myActionModel)
            {
               key = this._myActionModel.getComponentByType(componentType).path;
               if(this.shouldComponentBeBorrowed(componentType))
               {
                  assetImageId = CcImageLibrary.library.requestImage(key,this._sceneId,loader);
                  if(assetImageId > 0)
                  {
                     return null;
                  }
               }
            }
         }
         switch(componentType)
         {
            case this.SKELETON:
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
            case this.UPPERBODY:
               clipName = this.CLIPUPPER;
               break;
            case this.LOWERBODY:
               clipName = this.CLIPLOWER;
               break;
            default:
               clipName = this.DEFAULTHEAD;
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
         if(properties == null)
         {
            if(node)
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
            if(this._myActionModel)
            {
               cacm = this._myActionModel.getComponentByType(componentType) as CCCharActionComponentModel;
               properties = {
                  "x":cacm.x,
                  "y":cacm.y,
                  "xscale":cacm.xscale,
                  "yscale":cacm.yscale,
                  "offset":cacm.offset,
                  "rotation":cacm.rotation,
                  "split":cacm.split
               };
            }
         }
         if(colors == null)
         {
            if(node)
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
            if(this._myActionModel)
            {
               colorNames = CcLibConstant.COLORS_BY_COMPONENT(componentType);
               if(colorNames)
               {
                  colors = (colorNames as Array).map(function(param1:String, param2:int, param3:Array):Object
                  {
                     var _loc4_:* = _myActionModel.getColor(componentType);
                     var _loc5_:* = {
                        "colorReference":_loc4_.type,
                        "originalColor":_loc4_.oc,
                        "colorValue":_loc4_.dest,
                        "targetComponentId":""
                     };
                     return _loc5_;
                  });
               }
            }
         }
         loader.extraData = {
            "componentType":componentType,
            "properties":properties,
            "colors":colors,
            "clipName":clipName,
            "index":decoIndex
         };
         if(swfByteArray == null)
         {
            if(node)
            {
               if(node.@type != CcLibConstant.COMPONENT_TYPE_MOUTH)
               {
                  swfkey = node.@theme_id + "." + node.@type + "." + node.@component_id + this.SWF_EXT;
               }
            }
            else
            {
               swfkey = this._myActionModel.getComponentByType(componentType).path;
            }
            if(this.charZip != null)
            {
               swfByteArray = this.charZip.getInput(this.charZip.getEntry(swfkey));
            }
            else if(this.charSwfs != null)
            {
               swfByteArray = this.charSwfs.getValueByKey(swfkey);
            }
         }
         this._isLoadingLipSyncMouth = false;
         loadMgr.addEventDispatcher(loader,Event.INIT);
         loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onLoadImageData);
         if(swfByteArray)
         {
            if(this.should_decrypt)
            {
               tmpByteArray = new ByteArray();
               swfByteArray.readBytes(tmpByteArray);
               tmpByteArray.position = 0;
               swfByteArray.position = 0;
               decryptEngine = new UtilCrypto();
               decryptEngine.decrypt(tmpByteArray);
               loader.loadBytes(tmpByteArray);
            }
            else
            {
               loaderContext = new LoaderContext();
               loaderContext.allowCodeImport = true;
               swfByteArray.position = 0;
               loader.loadBytes(swfByteArray,loaderContext);
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
         if(this._head2)
         {
            this._head2.speak(param1);
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
         if(_loc8_ != null)
         {
            if(this._componentOrder.indexOf(_loc3_) == -1)
            {
               this.doLoadedComponent(param1);
            }
            else if(_loc6_ != this.DEFAULTHEAD)
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
         var _loc2_:int = 0;
         var _loc3_:ExtraDataLoader = null;
         var _loc1_:DisplayObjectContainer = UtilPlain.getInstance(this,this.DEFAULTHEAD);
         _loc2_ = 0;
         while(_loc2_ < this.waiting.length)
         {
            _loc3_ = this.waiting[_loc2_] as ExtraDataLoader;
            this.doLoadImageData(_loc3_);
            _loc2_++;
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
         var _loc7_:int = 0;
         var _loc8_:Object = null;
         var _loc2_:DisplayObjectContainer = UtilPlain.getInstance(this,this.DEFAULTHEAD);
         var _loc3_:Object = param1.extraData;
         var _loc4_:String = _loc3_["componentType"];
         var _loc5_:Object = _loc3_["properties"];
         var _loc6_:Array = _loc3_["colors"];
         if(this._componentOrder.indexOf(_loc4_) != -1)
         {
            if(_loc6_ != null)
            {
               _loc7_ = 0;
               while(_loc7_ < _loc6_.length)
               {
                  _loc8_ = _loc6_[_loc7_] as Object;
                  this.updateColor(_loc8_);
                  _loc7_++;
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
         var _loc3_:DisplayObject = null;
         if(param2 == "")
         {
            _loc3_ = this;
         }
         else
         {
            _loc3_ = UtilPlain.getInstance(this,param2);
         }
         var _loc4_:uint = UtilColor.setAssetPartColor(_loc3_,param1.areaName,param1.dstColor);
         return _loc4_;
      }
      
      public function changeColorForShader(param1:UtilHashUint) : Number
      {
         var _loc2_:Number = NaN;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc3_:Shader = new Shader();
         _loc3_.byteCode = new this.GoColorMapShaderClass();
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
            _loc12_ = uint(_loc7_.getValueByIndex(_loc9_)) >> 16 & 255;
            _loc13_ = uint(_loc7_.getValueByIndex(_loc9_)) >> 8 & 255;
            _loc14_ = uint(_loc7_.getValueByIndex(_loc9_)) & 255;
            if(_loc9_ / 4 < 1)
            {
               _loc4_[_loc9_ * 4 + 0] = _loc12_ / 255;
               _loc4_[_loc9_ * 4 + 1] = _loc13_ / 255;
               _loc4_[_loc9_ * 4 + 2] = _loc14_ / 255;
            }
            else
            {
               _loc5_[_loc9_ % 4 * 4 + 0] = _loc12_ / 255;
               _loc5_[_loc9_ % 4 * 4 + 1] = _loc13_ / 255;
               _loc5_[_loc9_ % 4 * 4 + 2] = _loc14_ / 255;
            }
            _loc9_++;
         }
         _loc3_.data["colorValue0"].value = _loc4_;
         _loc3_.data["colorValue1"].value = _loc5_;
         _loc3_.data["colorKey"].value = _loc6_;
         var _loc10_:Array = UtilPlain.getAllShaderObj(this);
         var _loc11_:int = 0;
         while(_loc11_ < _loc10_.length)
         {
            DisplayObject(_loc10_[_loc11_]).blendMode = BlendMode.NORMAL;
            DisplayObject(_loc10_[_loc11_]).blendMode = BlendMode.SHADER;
            DisplayObject(_loc10_[_loc11_]).visible = true;
            DisplayObject(_loc10_[_loc11_]).blendShader = _loc3_;
            _loc11_++;
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
         var _loc2_:Date = new Date();
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
         IEventDispatcher(param1.target).removeEventListener(param1.type,this.onBodyLoadedByCam);
         var _loc2_:Date = new Date();
         if(this._loadHead)
         {
            this._head2 = new CCHeadView();
            this._head2.initByCam(this._myActionModel,this._sceneId,this._useImageLibrary);
            this._head2.addEventListener(Event.COMPLETE,this.onHeadLoaded);
            this._head2.load();
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
         if(this._head2)
         {
            this._lookAtCameraSupported = this._head2.supportLookAtCamera;
         }
         this.onReady();
      }
      
      public function onReady(param1:Event = null) : void
      {
         var _loc3_:SelectedColor = null;
         var _loc4_:XML = null;
         var _loc7_:* = null;
         var _loc8_:CCColor = null;
         if(param1 != null)
         {
            (param1.target as IEventDispatcher).removeEventListener(param1.type,this.onReady);
         }
         var _loc2_:DisplayObjectContainer = UtilPlain.getInstance(this,this.DEFAULTHEAD);
         if(_loc2_)
         {
            if(this._head)
            {
               _loc2_.addChild(this._head);
            }
            if(this._head2)
            {
               _loc2_.addChild(this._head2);
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
            for(_loc7_ in this._myActionModel.colorCodes)
            {
               _loc8_ = this._myActionModel.colorCodes[_loc7_];
               _loc3_ = new SelectedColor(_loc8_.type,_loc8_.oc,_loc8_.dest);
               this.changeColor(_loc3_,!!_loc8_.targetComponent?_loc8_.targetComponent:"");
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
         if(!this.shouldPauseOnLoadBytesComplete)
         {
            this.resume();
         }
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
         var _loc6_:Date = new Date();
      }
      
      public function resume() : void
      {
         UtilPlain.playFamily(this);
      }
      
      public function pause() : void
      {
         UtilPlain.gotoAndStopFamilyAt1(this);
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
         this.visible = true;
         this.dispatchEvent(new LoadEmbedMovieEvent(LoadEmbedMovieEvent.COMPLETE_EVENT));
         this.eventDispatcher.dispatchEvent(new LoadEmbedMovieEvent(LoadEmbedMovieEvent.COMPLETE_EVENT));
      }
      
      private function updateHeadRect() : void
      {
         var _loc2_:Rectangle = null;
         var _loc3_:Point = null;
         var _loc4_:Number = NaN;
         var _loc1_:DisplayObjectContainer = UtilPlain.getInstance(this,this.DEFAULTHEAD);
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
         var _loc3_:DisplayObjectContainer = null;
         var _loc4_:DisplayObjectContainer = null;
         var _loc5_:Rectangle = null;
         var _loc6_:Rectangle = null;
         var _loc7_:DisplayObjectContainer = null;
         var _loc8_:Rectangle = null;
         var _loc9_:Point = null;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Point = null;
         var _loc15_:Number = NaN;
         var _loc1_:Boolean = false;
         var _loc2_:DisplayObjectContainer = this._head;
         if(!_loc2_)
         {
            _loc2_ = this._head2;
         }
         if(_loc2_)
         {
            _loc3_ = UtilPlain.getInstance(_loc2_,CcLibConstant.COMPONENT_TYPE_EYE + CcLibConstant.LEFT + this.MC);
            _loc4_ = UtilPlain.getInstance(_loc2_,CcLibConstant.COMPONENT_TYPE_EYE + CcLibConstant.RIGHT + this.MC);
            _loc5_ = _loc3_.getBounds(this);
            _loc6_ = _loc4_.getBounds(this);
            _loc7_ = UtilPlain.getInstance(_loc2_,CcLibConstant.COMPONENT_TYPE_NOSE + this.MC);
            _loc8_ = _loc7_.getBounds(this);
            if(_loc5_.width != 0 && _loc6_.width != 0)
            {
               _loc9_ = new Point((_loc5_.x + _loc6_.x + _loc5_.width) / 2,(_loc5_.y + _loc6_.y) / 2);
               _loc10_ = 100;
               _loc11_ = 100;
               _loc12_ = 2 / 5;
               _loc13_ = 2 / 5;
               this._headRect = new Rectangle(_loc9_.x - _loc10_ * _loc12_,_loc9_.y - _loc11_ * _loc13_,_loc10_,_loc11_);
            }
            else if(_loc8_.width != 0)
            {
               _loc14_ = new Point(_loc8_.x,_loc8_.y);
               _loc15_ = CcLibConstant.PHOTO_SIZE;
               this._headRect = new Rectangle(_loc14_.x - _loc15_ * 0.4,_loc14_.y - _loc15_ * 1 / 2,_loc15_,_loc15_);
            }
         }
      }
      
      public function reloadSkin() : void
      {
         this.eventDispatcher.dispatchEvent(new LoadEmbedMovieEvent(LoadEmbedMovieEvent.RELOAD_MOVIE_EVENT));
      }
      
      public function restoreHeadColor() : void
      {
         if(this._head2)
         {
            this._head2.restoreColors();
         }
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
         var _loc4_:DisplayObjectContainer = UtilPlain.getInstance(this,this.DEFAULTHEAD);
         if(_loc4_ != null)
         {
            if(this._componentOrder.indexOf(param1) == -1)
            {
               _loc5_ = UtilPlain.getInstance(_loc4_,param1 + this.LIB_RIGHT);
               _loc6_ = _loc5_.getChildAt(0) as DisplayObjectContainer;
               _loc5_.x = Number(param2["x"]);
               _loc5_.y = Number(param2["y"]);
               _loc6_.scaleX = Number(param2["xscale"]);
               _loc6_.scaleY = Number(param2["yscale"]);
               _loc5_.x = _loc5_.x - Number(param2["offset"]) / 2;
               _loc6_.rotation = Number(param2["rotation"]);
               _loc5_ = UtilPlain.getInstance(_loc4_,param1 + this.LIB_LEFT);
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
               _loc5_ = UtilPlain.getInstance(_loc4_,param1 + this.MC);
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
         var _loc3_:DisplayObjectContainer = null;
         var _loc4_:GlowFilter = null;
         var _loc5_:Array = null;
         var _loc2_:DisplayObjectContainer = UtilPlain.getInstance(this,this.DEFAULTHEAD);
         _loc3_ = UtilPlain.getInstance(_loc2_,param1);
         if(_loc3_)
         {
            _loc4_ = new GlowFilter(16777215);
            _loc5_ = new Array();
            _loc5_.push(_loc4_);
            _loc3_.filters = _loc5_;
         }
      }
      
      public function removeHighlight(param1:String) : void
      {
         var _loc3_:DisplayObjectContainer = null;
         var _loc2_:DisplayObjectContainer = UtilPlain.getInstance(this,this.DEFAULTHEAD);
         _loc3_ = UtilPlain.getInstance(_loc2_,param1);
         if(_loc3_ != null)
         {
            _loc3_.filters = new Array();
         }
      }
      
      public function removeComponentById(param1:String) : void
      {
         var _loc3_:DisplayObjectContainer = null;
         var _loc4_:DisplayObjectContainer = null;
         var _loc5_:int = 0;
         var _loc2_:DisplayObjectContainer = UtilPlain.getInstance(this,this.DEFAULTHEAD);
         _loc3_ = UtilPlain.getInstance(_loc2_,param1);
         if(_loc3_)
         {
            _loc4_ = _loc3_.parent;
            _loc5_ = _loc4_.numChildren - 1;
            while(_loc5_ >= 0)
            {
               if(_loc4_.getChildAt(_loc5_).name == param1)
               {
                  _loc4_.removeChildAt(_loc5_);
               }
               _loc5_--;
            }
         }
      }
      
      public function refreshProp() : void
      {
         var _loc1_:DisplayObjectContainer = null;
         var _loc2_:DisplayObjectContainer = null;
         if(this._hasProp)
         {
            _loc1_ = UtilPlain.getInstance(this,UtilPlain.THE_CHAR);
            _loc2_ = UtilPlain.getProp(_loc1_);
            UtilPlain.removeAllSon(_loc2_);
            this._hasProp = false;
         }
         if(this._prop)
         {
            this.addPropClipToPropContainer(this._prop,this);
            this._hasProp = true;
         }
      }
      
      private function addPropClipToPropContainer(param1:DisplayObjectContainer, param2:DisplayObjectContainer) : void
      {
         var _loc4_:DisplayObjectContainer = null;
         var _loc3_:DisplayObjectContainer = UtilPlain.getInstance(param2,UtilPlain.THE_CHAR);
         if(_loc3_ != null)
         {
            _loc4_ = UtilPlain.getProp(_loc3_);
            if(_loc4_ != null)
            {
               UtilPlain.removeAllSon(_loc4_);
               _loc4_.addChild(param1);
               this.updatePropSize(param1,_loc4_);
            }
         }
      }
      
      private function updatePropSize(param1:DisplayObjectContainer, param2:DisplayObjectContainer) : void
      {
         if(param1 != null)
         {
            try
            {
               param1.scaleX = Math.abs(1 / UtilPlain.getRelativeProperty(param2,param1,UtilPlain.PROPERTY_SCALEX));
               param1.scaleY = Math.abs(1 / UtilPlain.getRelativeProperty(param2,param1,UtilPlain.PROPERTY_SCALEY));
               return;
            }
            catch(e:Error)
            {
               return;
            }
         }
      }
      
      public function destroy(param1:Boolean = true) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Array = UtilPlain.getLoaderItemExcludeTheHeadTheHand(this);
         _loc2_ = 0;
         while(_loc2_ < _loc3_.length)
         {
            Loader(_loc3_[_loc2_]).unloadAndStop(param1);
            Loader(_loc3_[_loc2_]).parent.removeChild(Loader(_loc3_[_loc2_]));
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
            this._head.destroy();
         }
         if(this._head2)
         {
            this._head2.destroy();
         }
         this._ccm.destroy();
         this._ccm = new CCManager();
         this._libraries.removeAll();
         this._componentQueue = new Array();
         this._decoArray = new Array();
         this._customColor = new UtilHashSelectedColor();
         this.state = STATE_NULL;
         this._eventDispatcher = new EventDispatcher();
         this.eventDispatcher.dispatchEvent(new LoadEmbedMovieEvent(LoadEmbedMovieEvent.MOVIE_FINISH_EVENT));
      }
      
      public function unloadAssetImage(param1:Boolean = true) : void
      {
         this.destroy(param1);
      }
      
      public function get headPos() : Point
      {
         var _loc1_:DisplayObjectContainer = UtilPlain.getInstance(this,AnimeConstants.MOVIECLIP_DEFAULT_HEAD);
         return new Point(_loc1_.x,_loc1_.y);
      }
      
      public function resetHeadPos() : void
      {
         var _loc2_:int = 0;
         var _loc3_:DisplayObject = null;
         var _loc1_:DisplayObjectContainer = UtilPlain.getInstance(this,AnimeConstants.MOVIECLIP_THE_HEAD);
         if(_loc1_ != null)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc1_.numChildren)
            {
               _loc3_ = _loc1_.getChildAt(_loc2_);
               _loc3_.x = 0;
               _loc3_.y = 0;
               _loc2_++;
            }
         }
      }
      
      public function updateHeadPos(param1:Number, param2:Number) : void
      {
         var _loc4_:int = 0;
         var _loc5_:DisplayObject = null;
         var _loc3_:DisplayObjectContainer = UtilPlain.getInstance(this,AnimeConstants.MOVIECLIP_THE_HEAD);
         if(_loc3_ != null)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc3_.numChildren)
            {
               _loc5_ = _loc3_.getChildAt(_loc4_);
               _loc5_.x = _loc5_.x + param1;
               _loc5_.y = _loc5_.y + param2;
               _loc4_++;
            }
         }
      }
      
      public function updateHeadScale(param1:Number, param2:Number) : void
      {
         var _loc4_:int = 0;
         var _loc5_:DisplayObject = null;
         var _loc3_:DisplayObjectContainer = UtilPlain.getInstance(this,AnimeConstants.MOVIECLIP_THE_HEAD);
         if(_loc3_ != null)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc3_.numChildren)
            {
               _loc5_ = _loc3_.getChildAt(_loc4_);
               _loc5_.scaleX = param1;
               _loc5_.scaleY = param2;
               _loc4_++;
            }
         }
      }
      
      public function updateBodyScale(param1:Number, param2:Number) : void
      {
         var _loc3_:DisplayObjectContainer = this.getSkeletonContainer(this.ver);
         if(_loc3_ != null)
         {
            _loc3_.scaleX = param1;
            _loc3_.scaleY = param2;
         }
      }
      
      public function get bodyScale() : Number
      {
         var _loc1_:DisplayObjectContainer = this.getSkeletonContainer(this.ver);
         if(_loc1_ == null)
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
         var _loc3_:Rectangle = this.getBounds(this);
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
      
      private function resetComponentByCAM(param1:ExtraDataLoader, param2:String) : void
      {
         var colorArray:Array = null;
         var colorNames:Object = null;
         var cacm:CCCharActionComponentModel = null;
         var decoIndex:Number = NaN;
         var loader:ExtraDataLoader = param1;
         var type:String = param2;
         if(loader && type)
         {
            colorNames = CcLibConstant.COLORS_BY_COMPONENT(type);
            if(colorNames)
            {
               colorArray = (colorNames as Array).map(function(param1:String, param2:int, param3:Array):Object
               {
                  var _loc4_:* = _myActionModel.getColor(param1);
                  var _loc5_:* = {
                     "colorReference":_loc4_.type,
                     "originalColor":_loc4_.oc,
                     "colorValue":_loc4_.dest,
                     "targetComponentId":""
                  };
                  return _loc5_;
               });
            }
            loader.extraData["colors"] = colorArray;
            cacm = this._myActionModel.getComponentByType(type) as CCCharActionComponentModel;
            loader.extraData["properties"] = {
               "x":cacm.x,
               "y":cacm.y,
               "xscale":cacm.xscale,
               "yscale":cacm.yscale,
               "offset":cacm.offset,
               "rotation":cacm.rotation,
               "split":cacm.split
            };
            decoIndex = -1;
            if(CcLibConstant.ALL_MULTIPLE_COMPONENT_TYPES.indexOf(type) == -1)
            {
               loader.name = String(type);
            }
            else
            {
               loader.name = String(cacm.id);
               decoIndex = this._decoArray.push(cacm.id) - 1;
            }
            loader.extraData["index"] = decoIndex;
            this.doLoadImageData(loader);
         }
      }
      
      public function prepareImage(param1:String, param2:Boolean = true, param3:Boolean = true) : void
      {
         var _loc4_:ExtraDataLoader = null;
         var _loc5_:XML = null;
         var _loc6_:Object = null;
         var _loc7_:String = null;
         var _loc8_:AssetImageLibraryObject = null;
         var _loc9_:* = null;
         var _loc10_:Object = null;
         var _loc11_:Number = NaN;
         var _loc12_:UtilHashUint = null;
         var _loc13_:SelectedColor = null;
         var _loc14_:CCColor = null;
         if(this._useImageLibrary)
         {
            this._sceneId = param1;
            if(this.charXML)
            {
               for each(_loc5_ in this.charXML.child(CcLibConstant.NODE_LIBRARY))
               {
                  _loc7_ = _loc5_.@theme_id + "." + _loc5_.@type + "." + _loc5_.@component_id + this.SWF_EXT;
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
            }
            if(this._myActionModel)
            {
               for(_loc9_ in this._myActionModel.libraryPaths)
               {
                  _loc7_ = this._myActionModel.getLibraryFilename(_loc9_);
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
            }
            this.reloadSkin();
            _loc11_ = 0;
            if(this.charXML)
            {
               for each(_loc5_ in this.charXML.child(this.NODE_COMPONENT))
               {
                  if(this.shouldComponentBeBorrowed(_loc5_.@type) && CcLibConstant.ALL_BODY_COMPONENT_TYPES.indexOf(String(_loc5_.@type)) >= 0)
                  {
                     _loc7_ = _loc5_.@theme_id + "." + _loc5_.@type + "." + _loc5_.@path + "." + _loc5_.@file;
                     if(!param2)
                     {
                        _loc11_ = this._assetImageIdArray.getValueByKey(_loc7_);
                     }
                     _loc8_ = CcImageLibrary.library.borrowImage(_loc7_,_loc11_,this._sceneId);
                     _loc4_ = null;
                     if(_loc8_)
                     {
                        this._assetImageIdArray.push(_loc7_,_loc8_.imageId);
                        _loc4_ = _loc8_.image as ExtraDataLoader;
                     }
                     if(_loc4_)
                     {
                        this.resetComponent(_loc4_,_loc5_);
                     }
                  }
               }
            }
            if(this._myActionModel)
            {
               for(_loc9_ in this._myActionModel.components)
               {
                  if(this.shouldComponentBeBorrowed(_loc9_) && CcLibConstant.ALL_BODY_COMPONENT_TYPES.indexOf(_loc9_) >= 0)
                  {
                     _loc7_ = this._myActionModel.getComponentByType(_loc9_).path;
                     if(!param2)
                     {
                        _loc11_ = this._assetImageIdArray.getValueByKey(_loc7_);
                     }
                     _loc8_ = CcImageLibrary.library.borrowImage(_loc7_,_loc11_,this._sceneId);
                     _loc4_ = null;
                     if(_loc8_)
                     {
                        this._assetImageIdArray.push(_loc7_,_loc8_.imageId);
                        _loc4_ = _loc8_.image as ExtraDataLoader;
                     }
                     if(_loc4_)
                     {
                        this.resetComponentByCAM(_loc4_,_loc9_);
                     }
                  }
               }
            }
            if(param3)
            {
               if(this._head)
               {
                  this._head.prepareImage(this._sceneId,param2);
               }
               if(this._head2)
               {
                  this._head2.prepareImage(this._sceneId,param2);
               }
            }
            UtilColor.resetAssetPartsColor(this);
            _loc12_ = new UtilHashUint();
            if(this.charXML)
            {
               for each(_loc5_ in this.charXML.child(CcLibConstant.NODE_COLOR))
               {
                  _loc13_ = new SelectedColor(_loc5_.@r,String(_loc5_.@oc).length == 0?uint(uint.MAX_VALUE):uint(uint(_loc5_.@oc)),uint(_loc5_));
                  this.changeColor(_loc13_,_loc5_.@targetComponent == null?"":_loc5_.@targetComponent);
                  if(_loc13_.orgColor != uint.MAX_VALUE)
                  {
                     this._customColor.push(_loc13_.areaName,_loc13_);
                     _loc12_.push("0x" + _loc13_.orgColor.toString(16),_loc13_.dstColor);
                  }
               }
            }
            if(this._myActionModel)
            {
               for(_loc9_ in this._myActionModel.colorCodes)
               {
                  _loc14_ = this._myActionModel.getColor(_loc9_);
                  _loc13_ = new SelectedColor(_loc14_.type,_loc14_.oc,_loc14_.dest);
                  this.changeColor(_loc13_,_loc14_.targetComponent);
                  if(_loc13_.orgColor != uint.MAX_VALUE)
                  {
                     this._customColor.push(_loc13_.areaName,_loc13_);
                     _loc12_.push("0x" + _loc13_.orgColor.toString(16),_loc13_.dstColor);
                  }
               }
            }
            if(_loc12_.length > 0)
            {
               this.changeColorForShader(_loc12_);
            }
            this.refreshScale();
            this.updateHeadRect();
            if(param2)
            {
               UtilPlain.gotoAndStopFamilyAt1(this);
            }
         }
      }
   }
}

class Library
{
    
   
   private var _type:String;
   
   private var _component_id:String;
   
   private var _theme_id:String;
   
   function Library()
   {
      super();
   }
   
   public function get type() : String
   {
      return this._type;
   }
   
   public function get component_id() : String
   {
      return this._component_id;
   }
   
   public function get theme_id() : String
   {
      return this._theme_id;
   }
   
   public function set type(param1:String) : void
   {
      this._type = param1;
   }
   
   public function set component_id(param1:String) : void
   {
      this._component_id = param1;
   }
   
   public function set theme_id(param1:String) : void
   {
      this._theme_id = param1;
   }
}
