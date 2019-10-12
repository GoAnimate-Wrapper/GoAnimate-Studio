package anifire.studio.managers
{
   import anifire.studio.core.AnimeScene;
   import anifire.studio.core.Console;
   import anifire.studio.events.SceneViewEvent;
   import anifire.studio.events.ServiceProviderEvent;
   import anifire.studio.interfaces.ISceneView;
   import anifire.studio.interfaces.IServiceProvider;
   import flash.events.EventDispatcher;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class SceneThumbnailCaptureServiceProvider extends EventDispatcher implements IServiceProvider
   {
       
      
      private const RENDERING_TIMEOUT:Number = 15000;
      
      private var _isRunning:Boolean;
      
      private var _sceneView:ISceneView;
      
      private var _scene:AnimeScene;
      
      private var _timeoutTimer:Timer;
      
      public function SceneThumbnailCaptureServiceProvider()
      {
         this._timeoutTimer = new Timer(this.RENDERING_TIMEOUT,1);
         super();
      }
      
      public function get isServing() : Boolean
      {
         return this._isRunning;
      }
      
      public function set sceneView(param1:ISceneView) : void
      {
         this._sceneView = param1;
      }
      
      public function serveCustomer(param1:Object) : void
      {
         var _loc2_:AnimeScene = param1 as AnimeScene;
         if(_loc2_)
         {
            this._isRunning = true;
            this._scene = _loc2_;
            this._sceneView.addEventListener(SceneViewEvent.VIEW_LOAD_COMPLETE,this.onSceneViewLoadComplete);
            this._sceneView.sceneModel = this._scene;
            this._timeoutTimer.reset();
            this._timeoutTimer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onTimerComplete);
            this._timeoutTimer.start();
         }
      }
      
      private function onTimerComplete(param1:TimerEvent) : void
      {
         this._timeoutTimer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onTimerComplete);
         Console.getConsole().doUpdateTimelineByScene(this._scene);
         this.stopService();
      }
      
      private function stopService() : void
      {
         if(this._isRunning)
         {
            this._sceneView.removeEventListener(SceneViewEvent.VIEW_LOAD_COMPLETE,this.onSceneViewLoadComplete);
            this._isRunning = false;
            this.dispatchEvent(new ServiceProviderEvent(ServiceProviderEvent.SERVICE_COMPLETE));
         }
      }
      
      private function onSceneViewLoadComplete(param1:SceneViewEvent) : void
      {
         this._sceneView.removeEventListener(SceneViewEvent.VIEW_LOAD_COMPLETE,this.onSceneViewLoadComplete);
         this._timeoutTimer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onTimerComplete);
         this._timeoutTimer.stop();
         Console.getConsole().doUpdateTimelineByScene(this._scene);
         this._isRunning = false;
         this.dispatchEvent(new ServiceProviderEvent(ServiceProviderEvent.SERVICE_COMPLETE));
      }
   }
}
