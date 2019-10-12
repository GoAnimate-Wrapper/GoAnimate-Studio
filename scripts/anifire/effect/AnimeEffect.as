package anifire.effect
{
   import anifire.constant.AnimeConstants;
   import anifire.event.EffectEvt;
   import anifire.util.UtilCommonLoader;
   import anifire.util.UtilPlain;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.geom.Rectangle;
   import flash.media.SoundTransform;
   import flash.utils.ByteArray;
   
   public class AnimeEffect extends SuperEffect
   {
      
      public static const DEFAULT_THUMBNAIL:Class = AnimeEffect_DEFAULT_THUMBNAIL;
       
      
      private var _loader:UtilCommonLoader;
      
      private var _thumbnailLoader:Loader;
      
      private var _shouldPauseOnLoadComplete:Boolean = false;
      
      public function AnimeEffect()
      {
         super();
         type = EffectMgr.TYPE_ANIME;
         this._loader = new UtilCommonLoader();
      }
      
      public function set shouldPauseOnLoadComplete(param1:Boolean) : void
      {
         this._shouldPauseOnLoadComplete = param1;
      }
      
      public function get shouldPauseOnLoadComplete() : Boolean
      {
         return this._shouldPauseOnLoadComplete;
      }
      
      override public function serialize() : XML
      {
         var _loc1_:* = "<effect id=\"" + this.id + "\" type=\"ANIME\"/>";
         return new XML(_loc1_);
      }
      
      override public function deSerialize(param1:XML) : void
      {
         id = param1.@id;
      }
      
      override public function getFileName(param1:XML) : String
      {
         return "effect/" + param1.@id;
      }
      
      override public function getSize() : Rectangle
      {
         return this.getBounds(this);
      }
      
      override public function setSize(param1:Number, param2:Number) : void
      {
         width = param1;
         height = param2;
      }
      
      override public function loadThumbnail(param1:ByteArray = null) : DisplayObject
      {
         this._thumbnailLoader = new Loader();
         this._thumbnailLoader.name = AnimeConstants.LOADER_NAME;
         this._thumbnailLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.loadThumbnailComplete);
         if(param1)
         {
            this._thumbnailLoader.loadBytes(param1);
         }
         var _loc2_:Sprite = new Sprite();
         _loc2_.addChild(this._thumbnailLoader);
         return _loc2_;
      }
      
      private function stopLoaderContent(param1:Event) : void
      {
         var _loc3_:SoundTransform = null;
         var _loc2_:Loader = param1.target.loader as Loader;
         if(_loc2_.content is MovieClip)
         {
            _loc3_ = new SoundTransform(0,(_loc2_.content as MovieClip).soundTransform.pan);
            (_loc2_.content as MovieClip).soundTransform = _loc3_;
         }
      }
      
      protected function loadThumbnailComplete(param1:Event) : void
      {
         var _loc6_:Class = null;
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.loadThumbnailComplete);
         this._thumbnailLoader = null;
         var _loc2_:Loader = param1.target.loader as Loader;
         var _loc3_:DisplayObjectContainer = _loc2_.parent as DisplayObjectContainer;
         var _loc4_:DisplayObject = UtilPlain.extractEffectThumbnail(_loc2_);
         if(_loc4_ == null)
         {
            _loc6_ = DEFAULT_THUMBNAIL;
            _loc4_ = new _loc6_();
         }
         UtilPlain.removeAllSon(_loc3_);
         _loc3_.addChild(_loc4_);
         var _loc5_:EffectEvt = new EffectEvt(EffectEvt.LOAD_EFFECT_THUMBNAIL_COMPLETE,this);
         _loc5_.thumbnail = _loc3_;
         this.dispatchEvent(_loc5_);
         if(_loc2_.content.loaderInfo.applicationDomain.hasDefinition("theSound"))
         {
            this.dispatchEvent(new Event("SoundAdded"));
         }
      }
      
      override public function loadEffectImage(param1:ByteArray) : void
      {
         this._loader.addEventListener(Event.COMPLETE,this.onLoadEffectImageCompleted);
         if(this.shouldPauseOnLoadComplete)
         {
            this._loader.shouldPauseOnLoadBytesComplete = true;
         }
         if(param1)
         {
            this._loader.loadBytes(param1,UtilCommonLoader.externalLoaderContext);
         }
      }
      
      private function onLoadEffectImageCompleted(param1:Event) : void
      {
         var _loc2_:Loader = param1.target as Loader;
         _loc2_.name = AnimeConstants.LOADER_NAME;
         var _loc3_:DisplayObject = _loc2_.content as DisplayObject;
         this.addChild(_loc2_);
         var _loc4_:EffectEvt = new EffectEvt(EffectEvt.LOAD_EFFECT_COMPLETE,this,_loc2_);
         this.dispatchEvent(_loc4_);
      }
      
      public function unloadEffectImage(param1:Boolean) : void
      {
         this._loader.unloadAndStop(param1);
      }
   }
}
