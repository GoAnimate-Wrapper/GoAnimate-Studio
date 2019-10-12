package anifire.component
{
   import anifire.color.SelectedColor;
   import anifire.constant.AnimeConstants;
   import anifire.constant.CcLibConstant;
   import anifire.core.CCLipSyncController;
   import anifire.core.CCManager;
   import anifire.event.LoadEmbedMovieEvent;
   import anifire.event.SpeechPitchEvent;
   import anifire.interfaces.ICharacter;
   import anifire.util.ExtraDataLoader;
   import anifire.util.UtilColor;
   import anifire.util.UtilHashBytes;
   import anifire.util.UtilHashSelectedColor;
   import anifire.util.UtilPlain;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.utils.ByteArray;
   import flash.utils.setTimeout;
   
   public class SkinnedAssetMaker extends Sprite implements ICharacter
   {
      
      public static const STATE_NULL:String = "null";
      
      public static const STATE_LOADING:String = "loading";
      
      public static const STATE_FINISH_LOAD:String = "finish_load";
       
      
      private var _shouldPauseOnLoadBytesComplete:Boolean = false;
      
      private var _ccm:CCManager;
      
      private var _charXML:XML;
      
      private var _charSwfs:UtilHashBytes;
      
      private var _figure:ByteArray;
      
      private var _ver:Number = 3;
      
      public var _lipSync:Boolean = false;
      
      private var _demoSpeech:Boolean = false;
      
      private var _themeId:String;
      
      private var _state:String;
      
      private var _mouthLoader:ExtraDataLoader;
      
      private var _lipSyncMouthLoader:ExtraDataLoader;
      
      public function SkinnedAssetMaker()
      {
         super();
         this.state = STATE_NULL;
      }
      
      public function get state() : String
      {
         return this._state;
      }
      
      public function set state(param1:String) : void
      {
         this._state = param1;
      }
      
      public function get themeId() : String
      {
         return this._themeId;
      }
      
      public function set themeId(param1:String) : void
      {
         this._themeId = param1;
      }
      
      public function get figure() : ByteArray
      {
         return this._figure;
      }
      
      public function set figure(param1:ByteArray) : void
      {
         this._figure = param1;
      }
      
      public function get charSwfs() : UtilHashBytes
      {
         return this._charSwfs;
      }
      
      public function set charSwfs(param1:UtilHashBytes) : void
      {
         this._charSwfs = param1;
      }
      
      public function set charXML(param1:XML) : void
      {
         this._charXML = param1;
      }
      
      public function get ver() : Number
      {
         return this._ver;
      }
      
      public function set ver(param1:Number) : void
      {
         this._ver = param1;
      }
      
      public function get demoSpeech() : Boolean
      {
         return this._demoSpeech;
      }
      
      public function set demoSpeech(param1:Boolean) : void
      {
         var _loc2_:* = this._demoSpeech != param1;
         this._demoSpeech = param1;
      }
      
      public function get charXML() : XML
      {
         return this._charXML;
      }
      
      public function get CCM() : CCManager
      {
         return this._ccm;
      }
      
      public function set CCM(param1:CCManager) : void
      {
         this._ccm = param1;
      }
      
      public function get eventDispatcher() : EventDispatcher
      {
         return this;
      }
      
      public function set lipSync(param1:Boolean) : void
      {
         if(this._lipSync != param1)
         {
            this._lipSync = param1;
            if(param1)
            {
               this.addMouthClipToHeadContainer(this.updateComponentImageData("mouth",null),this);
            }
            else
            {
               this.removeMouthClipToHeadContainer(this);
            }
         }
      }
      
      public function prepareXML(param1:XML) : void
      {
         var _loc2_:XMLList = null;
         var _loc3_:int = 0;
         _loc2_ = param1..color;
         _loc3_ = 0;
         while(_loc3_ < _loc2_.length())
         {
            this.addColor(_loc2_[_loc3_].@r,uint(_loc2_[_loc3_].@oc.length() > 0?_loc2_[_loc3_].@oc:uint.MAX_VALUE),uint(_loc2_[_loc3_].text()));
            _loc3_++;
         }
      }
      
      public function addColor(param1:String, param2:uint, param3:uint) : void
      {
         var _loc4_:SelectedColor = new SelectedColor(param1,param2,param3);
         this.CCM.addColor(_loc4_.areaName,_loc4_);
      }
      
      public function loadAssetImageComplete(param1:Event = null) : void
      {
         if(param1 != null)
         {
            (param1.target as IEventDispatcher).removeEventListener(param1.type,this.loadAssetImageComplete);
         }
         if(this.demoSpeech)
         {
            this.addMouthClipToHeadContainer(this.updateComponentImageData("mouth",null),this);
         }
         this.onReady();
      }
      
      public function updateComponentImageData(param1:String, param2:ByteArray, param3:String = "", param4:XML = null) : ExtraDataLoader
      {
         var _loc5_:String = null;
         var _loc7_:String = null;
         var _loc6_:ExtraDataLoader = new ExtraDataLoader();
         _loc6_.name = param3;
         _loc6_.extraData = {
            "componentType":param1,
            "clipName":_loc5_
         };
         if(param2 == null)
         {
            if(this._lipSync)
            {
               _loc7_ = this.themeId + "." + "mouth" + "." + CCLipSyncController.LIPSYNC_LIB_ID;
               this._lipSyncMouthLoader = _loc6_;
            }
            else if(this.demoSpeech)
            {
               _loc7_ = this.themeId + "." + "mouth" + "." + CCLipSyncController.DEMO_LIPSYNC_LIB_ID;
            }
            if(this._charSwfs != null)
            {
               param2 = this._charSwfs.getValueByKey(_loc7_);
            }
         }
         if(param2)
         {
            param2.position = 0;
            _loc6_.loadBytes(param2);
         }
         return _loc6_;
      }
      
      public function addMouthClipToHeadContainer(param1:DisplayObject, param2:DisplayObjectContainer) : void
      {
         var _loc5_:DisplayObjectContainer = null;
         var _loc7_:DisplayObjectContainer = null;
         var _loc8_:DisplayObjectContainer = null;
         var _loc3_:DisplayObjectContainer = UtilPlain.getInstance(param2,UtilPlain.THE_CHAR_FLIP);
         var _loc4_:DisplayObjectContainer = UtilPlain.getInstance(param2,UtilPlain.THE_CHAR);
         if(_loc4_ != null)
         {
            if(_loc3_ != null && scaleX == -1)
            {
               _loc5_ = UtilPlain.getHead(_loc3_);
            }
            else
            {
               _loc5_ = UtilPlain.getHead(_loc4_);
            }
         }
         else
         {
            _loc5_ = UtilPlain.getHead(param2);
         }
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_.numChildren)
         {
            _loc7_ = _loc5_.getChildAt(_loc6_) as DisplayObjectContainer;
            if(_loc7_ != null)
            {
               _loc8_ = UtilPlain.getMouth(_loc7_);
               if(_loc8_ != null)
               {
                  _loc8_.getChildByName(AnimeConstants.MOVIECLIP_DEFAULT_MOUTH).alpha = 0;
                  while(_loc8_.numChildren > 1)
                  {
                     _loc8_.removeChildAt(1);
                  }
                  _loc8_.addChildAt(param1,1);
               }
            }
            _loc6_++;
         }
      }
      
      private function removeMouthClipToHeadContainer(param1:DisplayObjectContainer) : void
      {
         var _loc4_:DisplayObjectContainer = null;
         var _loc5_:DisplayObjectContainer = null;
         var _loc2_:DisplayObjectContainer = UtilPlain.getHead(param1);
         var _loc3_:DisplayObjectContainer = _loc2_.getChildByName(AnimeConstants.MOVIECLIP_DEFAULT_HEAD) as DisplayObjectContainer;
         _loc4_ = _loc3_;
         if(_loc3_ != null && _loc3_.alpha == 0)
         {
            _loc4_ = _loc2_.getChildAt(0) as DisplayObjectContainer;
         }
         if(_loc4_ != null)
         {
            _loc5_ = UtilPlain.getMouth(_loc4_);
            if(_loc5_ != null)
            {
               _loc5_.getChildByName(AnimeConstants.MOVIECLIP_DEFAULT_MOUTH).alpha = 1;
               _loc5_.removeChildAt(0);
            }
         }
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
      
      public function onReady(param1:Event = null) : void
      {
         var _loc2_:XML = null;
         var _loc3_:SelectedColor = null;
         if(param1 != null)
         {
            (param1.target as IEventDispatcher).removeEventListener(param1.type,this.onReady);
         }
         for each(_loc2_ in this._charXML.child(CcLibConstant.NODE_COLOR))
         {
            _loc3_ = new SelectedColor(_loc2_.@r,String(_loc2_.@oc).length == 0?uint(uint.MAX_VALUE):uint(_loc2_.@oc),uint(_loc2_));
            this.changeColor(_loc3_,_loc2_.@targetComponent == null?"":_loc2_.@targetComponent);
         }
         UtilPlain.gotoAndStopFamilyAt1(this);
         if(!this._shouldPauseOnLoadBytesComplete)
         {
            UtilPlain.playFamily(this);
         }
         this.state = STATE_FINISH_LOAD;
         setTimeout(this.dispatchComplete,200);
      }
      
      public function dispatchComplete() : void
      {
         this.visible = true;
         this.dispatchEvent(new LoadEmbedMovieEvent(LoadEmbedMovieEvent.COMPLETE_EVENT));
      }
      
      public function getColorByName(param1:String) : uint
      {
         return 0;
      }
      
      public function doLoadMainImage(param1:Event) : void
      {
         if(param1 != null)
         {
            (param1.target as IEventDispatcher).removeEventListener(param1.type,this.doLoadMainImage);
         }
         var _loc2_:Loader = new Loader();
         _loc2_.contentLoaderInfo.addEventListener(Event.COMPLETE,this.loadAssetImageComplete);
         _loc2_.loadBytes(this._figure);
         _loc2_.name = AnimeConstants.IMAGE_OBJECT_NAME;
         if(this.getChildByName(AnimeConstants.IMAGE_OBJECT_NAME))
         {
            this.removeChild(this.getChildByName(AnimeConstants.IMAGE_OBJECT_NAME));
         }
         this.addChild(_loc2_);
      }
      
      public function unloadAssetImage(param1:Boolean = true) : void
      {
         this.destroy(param1);
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
         this._ccm = new CCManager();
         this.state = STATE_NULL;
         dispatchEvent(new LoadEmbedMovieEvent(LoadEmbedMovieEvent.MOVIE_FINISH_EVENT));
      }
      
      public function insertColor(param1:UtilHashSelectedColor) : void
      {
         this.CCM.colors.insert(0,param1);
      }
      
      public function addLibrary(param1:String, param2:String, param3:String) : void
      {
      }
      
      public function removeLibrary(param1:String) : void
      {
      }
      
      public function speak(param1:Number) : void
      {
         var _loc2_:SpeechPitchEvent = null;
         this.lipSync = param1 != -1;
         if(this._lipSync && this._lipSyncMouthLoader && MovieClip(this._lipSyncMouthLoader.content))
         {
            _loc2_ = new SpeechPitchEvent(SpeechPitchEvent.PITCH);
            _loc2_.value = param1;
            MovieClip(this._lipSyncMouthLoader.content).dispatchEvent(_loc2_);
         }
      }
      
      public function reloadSkin() : void
      {
         dispatchEvent(new LoadEmbedMovieEvent(LoadEmbedMovieEvent.RELOAD_MOVIE_EVENT));
      }
   }
}
