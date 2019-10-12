package anifire.studio.components
{
   import anifire.studio.core.AnimeScene;
   import anifire.studio.core.Console;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.primitives.BitmapImage;
   
   public class SceneThumbnail extends Group
   {
       
      
      private var _2024940825imageDisplay:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _target:AnimeScene;
      
      private var _timer:Timer;
      
      private var _locked:Boolean = false;
      
      public function SceneThumbnail()
      {
         this._timer = new Timer(1000,1);
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._SceneThumbnail_BitmapImage1_i()];
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      public function set target(param1:AnimeScene) : void
      {
         this._target = param1;
         if(!this._locked)
         {
            this.updateThumbnail();
            this._locked = true;
            this._timer.reset();
            this._timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onTimerComplete);
            this._timer.start();
         }
      }
      
      private function onTimerComplete(param1:TimerEvent) : void
      {
         this._timer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onTimerComplete);
         this.updateThumbnail();
         this._locked = false;
      }
      
      private function updateThumbnail() : void
      {
         var _loc1_:int = 0;
         var _loc2_:BitmapData = null;
         if(this._target)
         {
            _loc1_ = Console.getConsole().getSceneIndex(this._target);
            _loc2_ = Console.getConsole().timeline.getSceneImageBitmapByIndex(_loc1_);
            if(_loc2_)
            {
               this.imageDisplay.source = _loc2_;
            }
         }
      }
      
      private function _SceneThumbnail_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.scaleMode = "letterbox";
         _loc1_.smooth = true;
         _loc1_.verticalAlign = "middle";
         _loc1_.horizontalAlign = "center";
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.initialized(this,"imageDisplay");
         this.imageDisplay = _loc1_;
         BindingManager.executeBindings(this,"imageDisplay",this.imageDisplay);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get imageDisplay() : BitmapImage
      {
         return this._2024940825imageDisplay;
      }
      
      public function set imageDisplay(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._2024940825imageDisplay;
         if(_loc2_ !== param1)
         {
            this._2024940825imageDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageDisplay",_loc2_,param1));
            }
         }
      }
   }
}
