package anifire.studio.managers
{
   import anifire.constant.AnimeConstants;
   import anifire.studio.core.AnimeScene;
   import anifire.studio.core.Asset;
   import anifire.studio.core.Console;
   import anifire.studio.events.SceneViewEvent;
   import anifire.studio.interfaces.ISceneView;
   import anifire.util.ExtraDataLoader;
   import com.adobe.images.JPGEncoder;
   import flash.display.BitmapData;
   import flash.display.IBitmapDrawable;
   import flash.display.LoaderInfo;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.ProgressEvent;
   import flash.events.TimerEvent;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.net.SharedObject;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   import mx.graphics.codec.PNGEncoder;
   
   public class SceneThumbnailManager extends EventDispatcher
   {
      
      public static const SCENE_THUMBNAIL_WIDTH:Number = 220;
      
      public static const SCENE_THUMBNAIL_HEIGHT:Number = 141;
       
      
      private const MIN_CAPTURE_INTERVAL:int = 100;
      
      private var _captureSource:IBitmapDrawable;
      
      private var _timer:Timer;
      
      private var _locked:Boolean = false;
      
      private var _thumbnailGenerator:SceneThumbnailCaptureServiceProvider;
      
      private var _controller:ServiceController;
      
      private var _totalThumbnail:uint;
      
      public function SceneThumbnailManager(param1:IEventDispatcher, param2:IEventDispatcher = null)
      {
         this._timer = new Timer(this.MIN_CAPTURE_INTERVAL,1);
         super(param2);
         if(param1)
         {
            param1.addEventListener(SceneViewEvent.VIEW_CHANGE,this.onSceneViewChange);
            param1.addEventListener(SceneViewEvent.VIEW_LOAD_COMPLETE,this.onSceneViewLoadComplete);
         }
         this._thumbnailGenerator = new SceneThumbnailCaptureServiceProvider();
         this._controller = new ServiceController();
         this._controller.addServiceProvider(this._thumbnailGenerator);
      }
      
      private function onSceneViewChange(param1:SceneViewEvent) : void
      {
         if(!this._locked)
         {
            this.captureCurrentScene();
         }
      }
      
      private function onSceneViewLoadComplete(param1:SceneViewEvent) : void
      {
         this.captureCurrentScene();
      }
      
      private function captureCurrentScene() : void
      {
         this._locked = true;
         this._timer.reset();
         this._timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onTimerComplete);
         this._timer.start();
      }
      
      private function onTimerComplete(param1:TimerEvent) : void
      {
         this._timer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onTimerComplete);
         Console.getConsole().doUpdateTimelineByScene(Console.getConsole().currentScene,true);
         this._locked = false;
      }
      
      public function set captureSource(param1:IBitmapDrawable) : void
      {
         this._captureSource = param1;
         this._thumbnailGenerator.sceneView = param1 as ISceneView;
      }
      
      public function captureDefaultThumbnail(param1:AnimeScene) : BitmapData
      {
         return this.captureThumbnail(SCENE_THUMBNAIL_WIDTH,SCENE_THUMBNAIL_HEIGHT,param1);
      }
      
      public function captureThumbnail(param1:Number, param2:Number, param3:AnimeScene, param4:Boolean = true) : BitmapData
      {
         var rect:Rectangle = null;
         var scale:Number = NaN;
         var refX:Number = NaN;
         var refY:Number = NaN;
         var mat:Matrix = null;
         var sourceRect:Rectangle = null;
         var camera:Asset = null;
         var thumbnailWidth:Number = param1;
         var thumbnailHeight:Number = param2;
         var scene:AnimeScene = param3;
         var useCamera:Boolean = param4;
         var bd:BitmapData = new BitmapData(thumbnailWidth,thumbnailHeight,true,16777215);
         try
         {
            rect = new Rectangle(AnimeConstants.SCREEN_X,AnimeConstants.screenY,AnimeConstants.SCREEN_WIDTH,AnimeConstants.SCREEN_HEIGHT);
            if(useCamera && scene && scene.camera)
            {
               camera = scene.camera;
               rect = new Rectangle(camera.x,camera.y,camera.width,camera.height);
            }
            rect.inflate(-1,-1);
            scale = Math.min(thumbnailWidth / rect.width,thumbnailHeight / rect.height);
            refX = (thumbnailWidth - rect.width * scale) * 0.5;
            refY = (thumbnailHeight - rect.height * scale) * 0.5;
            mat = new Matrix();
            mat.translate(-rect.x,-rect.y);
            mat.scale(scale,scale);
            mat.translate(refX,refY);
            rect.inflate(1,1);
            sourceRect = new Rectangle(refX,refY,scale * rect.width,scale * rect.height);
            if(this._captureSource)
            {
               bd.draw(this._captureSource,mat,null,null,sourceRect);
            }
         }
         catch(e:Error)
         {
         }
         return bd;
      }
      
      public function captureThumbnailByLoader(param1:Number, param2:Number, param3:IBitmapDrawable) : BitmapData
      {
         var _loc4_:BitmapData = null;
         if(param3)
         {
            _loc4_ = new BitmapData(param1,param2);
            _loc4_.draw(param3);
            return _loc4_;
         }
         return null;
      }
      
      public function encodeWithJPG(param1:BitmapData) : ByteArray
      {
         var _loc2_:JPGEncoder = null;
         var _loc3_:ByteArray = null;
         if(param1)
         {
            _loc2_ = new JPGEncoder(85);
            _loc3_ = _loc2_.encode(param1);
            return _loc3_;
         }
         return null;
      }
      
      public function encodeWithPNG(param1:BitmapData) : ByteArray
      {
         var _loc2_:PNGEncoder = null;
         var _loc3_:ByteArray = null;
         if(param1)
         {
            _loc2_ = new PNGEncoder();
            _loc3_ = _loc2_.encode(param1);
            return _loc3_;
         }
         return null;
      }
      
      public function enqueueForRendering(param1:AnimeScene) : void
      {
         this._controller.enqueue(param1);
      }
      
      public function startRendering() : void
      {
         this._controller.addEventListener(Event.COMPLETE,this.onAllThumbnailReady);
         this._controller.addEventListener(Event.CHANGE,this.onServiceQueueChange);
         this._totalThumbnail = this._controller.queueLength;
         this._controller.startService();
      }
      
      private function onAllThumbnailReady(param1:Event) : void
      {
         var _loc2_:ProgressEvent = null;
         this._controller.removeEventListener(Event.COMPLETE,this.onAllThumbnailReady);
         this._controller.removeEventListener(Event.CHANGE,this.onServiceQueueChange);
         this.dispatchEvent(new Event(Event.COMPLETE));
         if(this._totalThumbnail == 0)
         {
            _loc2_ = new ProgressEvent(ProgressEvent.PROGRESS,false,false,1,1);
            this.dispatchEvent(_loc2_);
         }
      }
      
      private function onServiceQueueChange(param1:Event) : void
      {
         var _loc2_:ProgressEvent = new ProgressEvent(ProgressEvent.PROGRESS,false,false,this._totalThumbnail - this._controller.queueLength,this._totalThumbnail);
         this.dispatchEvent(_loc2_);
         Console.getConsole().updateProgressStatus("Loading scene <b>" + (this._totalThumbnail - this._controller.queueLength).toFixed() + "</b> of " + this._totalThumbnail.toFixed());
      }
      
      public function loadThumbnailFromSharedObject(param1:SharedObject, param2:uint, param3:String) : Boolean
      {
         var _loc4_:ByteArray = null;
         var _loc5_:ExtraDataLoader = null;
         var _loc6_:Object = null;
         if(param1 && param1.size > 0 && param3)
         {
            try
            {
               _loc4_ = param1.data[param3] as ByteArray;
               if(_loc4_)
               {
                  _loc4_.position = 0;
                  _loc5_ = new ExtraDataLoader();
                  _loc6_ = new Object();
                  _loc6_["sceneIndex"] = param2;
                  _loc5_.extraData = _loc6_;
                  _loc5_.contentLoaderInfo.addEventListener(Event.COMPLETE,this.loadThumbnailCompleteHandle);
                  _loc5_.loadBytes(_loc4_);
                  return true;
               }
            }
            catch(e:Error)
            {
            }
         }
         return false;
      }
      
      private function loadThumbnailCompleteHandle(param1:Event) : void
      {
         var _loc2_:LoaderInfo = LoaderInfo(param1.currentTarget);
         _loc2_.removeEventListener(Event.COMPLETE,this.loadThumbnailCompleteHandle);
         var _loc3_:ExtraDataLoader = ExtraDataLoader(_loc2_.loader);
         var _loc4_:Object = _loc3_.extraData;
         var _loc5_:BitmapData = this.captureThumbnailByLoader(SceneThumbnailManager.SCENE_THUMBNAIL_WIDTH,SceneThumbnailManager.SCENE_THUMBNAIL_HEIGHT,_loc3_);
         _loc3_.unloadAndStop();
         Console.getConsole().timeline.updateSceneImageByBitmapData(_loc4_["sceneIndex"],_loc5_);
      }
   }
}
