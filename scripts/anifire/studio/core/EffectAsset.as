package anifire.studio.core
{
   import anifire.constant.AnimeConstants;
   import anifire.effect.AnimeEffect;
   import anifire.effect.EffectMgr;
   import anifire.effect.SuperEffect;
   import anifire.studio.events.AssetEvent;
   import anifire.studio.interfaces.IResizable;
   import anifire.studio.managers.ThemeManager;
   import anifire.util.UtilHashArray;
   import anifire.util.UtilMath;
   import anifire.util.UtilUnitConvert;
   import anifire.util.UtilXmlInfo;
   import flash.geom.Rectangle;
   
   public class EffectAsset extends Asset implements IResizable
   {
      
      public static const XML_NODE_NAME:String = "effectAsset";
      
      public static const STATUS_SHOW:String = "Show";
      
      public static const STATUS_HIDE:String = "Hide";
      
      private static var _existIDs:UtilHashArray = new UtilHashArray();
       
      
      protected var _fromTray:Boolean;
      
      private var _effect:SuperEffect;
      
      protected var _myEffectXML:XML;
      
      private var _status:String = "Show";
      
      private var _startFrame:int = 1;
      
      private var _startDuration:int = 0;
      
      private var _duration:int = 0;
      
      private var _endDuration:int = 0;
      
      private var _spanWholeScene:Boolean = true;
      
      private var _fromSpeech:Boolean;
      
      public function EffectAsset(param1:String = "")
      {
         var _loc3_:int = 0;
         super();
         if(param1 == null)
         {
            param1 = "";
         }
         var _loc2_:String = param1 != ""?param1:"EFFECT" + _existIDs.length;
         if(param1 == "")
         {
            _loc3_ = _existIDs.length + 1;
            while(_existIDs.containsKey(_loc2_))
            {
               _loc2_ = "EFFECT" + _loc3_;
               _loc3_++;
            }
         }
         this.id = _loc2_;
         _existIDs.push(_loc2_,_loc2_);
      }
      
      static function getEffectType(param1:XML) : String
      {
         return EffectMgr.getType(param1.child(EffectMgr.XML_NODE_TAG)[0]);
      }
      
      public static function getThemeIdFromAssetXml(param1:XML) : String
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         if(param1.child("file").length() > 0)
         {
            _loc3_ = UtilXmlInfo.getZipFileNameOfEffect(param1.child("file")[0].toString());
            _loc2_ = UtilXmlInfo.getThemeIdFromFileName(_loc3_);
         }
         else
         {
            _loc2_ = param1.@themecode;
            if(_loc2_ == "")
            {
               _loc2_ = "common";
            }
         }
         return _loc2_;
      }
      
      public function get startFrame() : int
      {
         return this._startFrame;
      }
      
      public function set startFrame(param1:int) : void
      {
         param1 = 1 + Math.round(param1 / AnimeConstants.SCENE_FRAME_INTERVAL) * AnimeConstants.SCENE_FRAME_INTERVAL;
         if(param1 < 1)
         {
            param1 = 1;
         }
         if(this._startFrame != param1)
         {
            this._startFrame = param1;
            this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_TIMING_CHANGE,this));
         }
      }
      
      public function get startDuration() : int
      {
         return this._startDuration;
      }
      
      public function set startDuration(param1:int) : void
      {
         param1 = Math.round(param1 / AnimeConstants.SCENE_FRAME_INTERVAL) * AnimeConstants.SCENE_FRAME_INTERVAL;
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(this._startDuration != param1)
         {
            this._startDuration = param1;
            this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_TIMING_CHANGE,this));
         }
      }
      
      public function get endFrame() : int
      {
         return this.startFrame + this.duration - 1;
      }
      
      public function set endFrame(param1:int) : void
      {
         this.duration = param1 - this.startFrame + 1;
      }
      
      public function get endDuration() : int
      {
         return this._endDuration;
      }
      
      public function set endDuration(param1:int) : void
      {
         param1 = Math.round(param1 / AnimeConstants.SCENE_FRAME_INTERVAL) * AnimeConstants.SCENE_FRAME_INTERVAL;
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(this._endDuration != param1)
         {
            this._endDuration = param1;
            this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_TIMING_CHANGE,this));
         }
      }
      
      public function get duration() : int
      {
         return this._duration;
      }
      
      public function set duration(param1:int) : void
      {
         param1 = Math.round(param1 / AnimeConstants.SCENE_FRAME_INTERVAL) * AnimeConstants.SCENE_FRAME_INTERVAL;
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(this._duration != param1)
         {
            this._duration = param1;
            this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_TIMING_CHANGE,this));
         }
      }
      
      public function get spanWholeScene() : Boolean
      {
         return this._spanWholeScene;
      }
      
      public function set spanWholeScene(param1:Boolean) : void
      {
         if(this._spanWholeScene != param1)
         {
            this._spanWholeScene = param1;
            this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_TIMING_CHANGE,this));
         }
      }
      
      public function set fromSpeech(param1:Boolean) : void
      {
         this._fromSpeech = param1;
      }
      
      public function get fromSpeech() : Boolean
      {
         return this._fromSpeech;
      }
      
      override public function set id(param1:String) : void
      {
         _existIDs.push(param1,param1);
         super.id = param1;
      }
      
      function set fromTray(param1:Boolean) : void
      {
         this._fromTray = param1;
      }
      
      function get fromTray() : Boolean
      {
         return this._fromTray;
      }
      
      public function set effect(param1:SuperEffect) : void
      {
         this._effect = param1;
      }
      
      public function get effect() : SuperEffect
      {
         return this._effect;
      }
      
      public function getType() : String
      {
         return (this.thumb as EffectThumb).getType();
      }
      
      public function getExactType() : String
      {
         return (this.thumb as EffectThumb).getExactType();
      }
      
      override public function get width() : Number
      {
         return this._effect != null?Number(this._effect.width):Number(275);
      }
      
      override public function get height() : Number
      {
         return this._effect != null?Number(this._effect.height):Number(177);
      }
      
      override public function set width(param1:Number) : void
      {
         param1 = UtilMath.boundaryCheck(param1,this.minWidth,this.maxWidth);
         if(this._effect)
         {
            this._effect.width = param1;
         }
         this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED,this));
      }
      
      override public function set height(param1:Number) : void
      {
         param1 = UtilMath.boundaryCheck(param1,this.minHeight,this.maxHeight);
         if(this._effect)
         {
            this._effect.height = param1;
         }
         this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED,this));
      }
      
      public function get rect() : Rectangle
      {
         return new Rectangle();
      }
      
      public function resize(param1:Number, param2:Number, param3:Boolean = false) : void
      {
         if(param1 != this.width || param2 != this.height)
         {
            this.width = param1;
            this.height = param2;
         }
      }
      
      public function get status() : String
      {
         return this._status;
      }
      
      public function set status(param1:String) : void
      {
         if(param1 == STATUS_SHOW || param1 == STATUS_HIDE)
         {
            this._status = param1;
         }
      }
      
      override public function clone(param1:Boolean = false, param2:AnimeScene = null) : Asset
      {
         var _loc3_:EffectAsset = new EffectAsset();
         _loc3_.id = this.id;
         _loc3_.x = this.x;
         _loc3_.y = this.y;
         _loc3_.effect = this.effect;
         _loc3_.scene = this.scene;
         _loc3_.thumb = this.thumb;
         return _loc3_;
      }
      
      public function updateTiming(param1:int, param2:int) : void
      {
         var _loc3_:Number = NaN;
         if(!this._spanWholeScene)
         {
            _loc3_ = param1 / param2;
            this.startFrame = UtilUnitConvert.timeToFrame(_loc3_ * UtilUnitConvert.frameToTime(this.startFrame));
            this.duration = this.duration * _loc3_;
            this.startDuration = this.startDuration * _loc3_;
            this.endDuration = this.endDuration * _loc3_;
         }
      }
      
      public function stopEffect() : void
      {
      }
      
      public function playEffect() : void
      {
      }
      
      override public function set imageData(param1:Object) : void
      {
         if(super.imageData != param1 || super.imageData == null)
         {
            super.imageData = param1;
            this.loadAssetImage();
         }
      }
      
      override protected function loadAssetImage() : void
      {
         var _loc1_:SuperEffect = null;
         if(this._myEffectXML == null)
         {
            _loc1_ = (this.thumb as EffectThumb).getNewEffect();
         }
         else
         {
            _loc1_ = (this.thumb as EffectThumb).getNewEffect(this._myEffectXML);
         }
         this.effect = _loc1_;
      }
      
      override public function unloadAssetImage(param1:Boolean) : void
      {
         if(this.effect is AnimeEffect)
         {
            AnimeEffect(this.effect).unloadEffectImage(param1);
            this.imageData = null;
         }
      }
      
      public function deSerialize(param1:XML, param2:AnimeScene, param3:Boolean = true, param4:Boolean = true) : void
      {
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:Theme = null;
         var _loc9_:String = null;
         var _loc10_:String = null;
         this._myEffectXML = param1.child(EffectMgr.XML_NODE_TAG)[0];
         if(param1.child("file").length() > 0)
         {
            _loc9_ = UtilXmlInfo.getZipFileNameOfEffect(param1.file);
            _loc6_ = UtilXmlInfo.getThemeIdFromFileName(_loc9_);
            _loc10_ = UtilXmlInfo.getThumbIdFromFileName(_loc9_);
         }
         else
         {
            _loc6_ = getThemeIdFromAssetXml(param1);
         }
         _loc7_ = ThemeManager.instance.getTheme(_loc6_);
         _loc5_ = EffectMgr.getId(this._myEffectXML);
         var _loc8_:EffectThumb = _loc7_.getEffectThumbById(_loc5_);
         this.scene = param2;
         this.x = param1.@x;
         this.y = param1.@y;
         this._spanWholeScene = true;
         if(param1.child("st").length() > 0 && param1.child("et").length() > 0)
         {
            this.startFrame = int(param1.st);
            this.endFrame = int(param1.et);
            if(param1.child("st").@dur > -1 && param1.child("et").@dur > -1)
            {
               this.startDuration = int(param1.st.@dur);
               this.endDuration = int(param1.et.@dur);
            }
            this._spanWholeScene = false;
         }
         if(param4)
         {
            this.thumb = _loc8_;
         }
         else
         {
            super.thumb = _loc8_;
         }
         this.isLoadded = true;
      }
      
      public function checkEffectAssetSize() : void
      {
         var _loc3_:Number = NaN;
         var _loc1_:Number = this.effect.width;
         var _loc2_:Number = this.effect.height;
         if(_loc1_ > AnimeConstants.SCREEN_WIDTH)
         {
            _loc3_ = AnimeConstants.SCREEN_WIDTH / _loc1_;
            _loc1_ = _loc1_ * _loc3_;
            _loc2_ = _loc2_ * _loc3_;
         }
         if(_loc2_ > AnimeConstants.SCREEN_HEIGHT)
         {
            _loc3_ = AnimeConstants.SCREEN_HEIGHT / _loc2_;
            _loc1_ = _loc1_ * _loc3_;
            _loc2_ = _loc2_ * _loc3_;
         }
         this.effect.setSize(_loc1_,_loc2_);
         this.width = _loc1_;
         this.height = _loc2_;
      }
      
      override public function serialize() : String
      {
         return "";
      }
      
      override public function set thumb(param1:Thumb) : void
      {
         super.thumb = param1;
         this.imageData = param1.imageData;
      }
      
      public function redraw() : void
      {
         this._effect.redraw();
      }
   }
}
