package anifire.studio.components
{
   import anifire.studio.core.AnimeSound;
   import anifire.studio.core.sound.AnimeSoundEvent;
   import anifire.util.UtilDraw;
   import flash.display.Graphics;
   import flash.geom.Point;
   import mx.core.IFlexModuleFactory;
   import spark.components.Group;
   
   public class SoundVolumeRenderer extends Group
   {
       
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _fadeInDuration:int = 0;
      
      protected var _fadeOutDuration:int = 0;
      
      protected var _fadeInVolume:Number = 1;
      
      protected var _fadeOutVolume:Number = 1;
      
      protected var _volume:Number = 1;
      
      protected var _totalFrames:int = 1;
      
      protected var _animeSound:AnimeSound;
      
      protected var _startPt:Point;
      
      protected var _middlePtLeft:Point;
      
      protected var _middlePtRight:Point;
      
      protected var _endPt:Point;
      
      public function SoundVolumeRenderer()
      {
         this._startPt = new Point();
         this._middlePtLeft = new Point();
         this._middlePtRight = new Point();
         this._endPt = new Point();
         super();
         mx_internal::_document = this;
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
      
      public function get animeSound() : AnimeSound
      {
         return this._animeSound;
      }
      
      public function set animeSound(param1:AnimeSound) : void
      {
         if(this._animeSound != param1)
         {
            if(this._animeSound)
            {
               this._animeSound.removeEventListener(AnimeSoundEvent.FADING_CHANGE,this.animeSound_fadingChangeHandler);
               this._animeSound.removeEventListener(AnimeSoundEvent.VOLUME_CHANGE,this.animeSound_volumeChangeHandler);
               this._animeSound.removeEventListener(AnimeSoundEvent.TOTAL_FRAME_CHANGE,this.animeSound_totalFrameChangeHandler);
            }
            this._animeSound = param1;
            if(this._animeSound)
            {
               this.redrawWithSound();
               this._animeSound.addEventListener(AnimeSoundEvent.FADING_CHANGE,this.animeSound_fadingChangeHandler);
               this._animeSound.addEventListener(AnimeSoundEvent.VOLUME_CHANGE,this.animeSound_volumeChangeHandler);
               this._animeSound.addEventListener(AnimeSoundEvent.TOTAL_FRAME_CHANGE,this.animeSound_totalFrameChangeHandler);
            }
         }
      }
      
      public function redrawWithSound() : void
      {
         if(this._animeSound)
         {
            this._fadeInVolume = this._animeSound.fadeInVolume;
            this._fadeInDuration = this._animeSound.effectiveFadeInDuration;
            this._fadeOutVolume = this._animeSound.fadeOutVolume;
            this._fadeOutDuration = this._animeSound.effectiveFadeOutDuration;
            this._totalFrames = this._animeSound.totalFrame;
            this._volume = this._animeSound.volume;
            invalidateDisplayList();
         }
      }
      
      public function drawWithValues(param1:Number, param2:Number, param3:Number, param4:int, param5:int) : void
      {
         this._volume = param1;
         this._fadeInVolume = param2;
         this._fadeOutVolume = param3;
         this._fadeInDuration = param4;
         this._fadeOutDuration = param5;
         invalidateDisplayList();
      }
      
      protected function redraw() : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc1_:Graphics = this.graphics;
         _loc1_.clear();
         var _loc2_:Number = getLayoutBoundsWidth();
         if(this._animeSound && this._totalFrames >= 1)
         {
            _loc1_.lineStyle(1,this._animeSound.volumeLineColor,0.7);
            _loc3_ = this.convertVolumeToPosition(this._fadeInVolume);
            _loc4_ = this.convertVolumeToPosition(this._volume);
            _loc5_ = this.convertVolumeToPosition(this._fadeOutVolume);
            _loc6_ = this._fadeInDuration / this._totalFrames;
            _loc7_ = 1 - this._fadeOutDuration / this._totalFrames;
            this._startPt.x = 0;
            this._startPt.y = _loc3_;
            this._middlePtLeft.x = _loc6_ * _loc2_;
            this._middlePtLeft.y = _loc4_;
            this._middlePtRight.x = _loc7_ * _loc2_;
            this._middlePtRight.y = _loc4_;
            this._endPt.x = _loc2_;
            this._endPt.y = _loc5_;
            _loc1_.moveTo(0,_loc3_);
            UtilDraw.dashTo(this,this._startPt,this._middlePtLeft);
            UtilDraw.dashTo(this,this._middlePtLeft,this._middlePtRight);
            UtilDraw.dashTo(this,this._middlePtRight,this._endPt);
         }
      }
      
      protected function convertVolumeToPosition(param1:Number) : Number
      {
         var _loc2_:Number = this.getLayoutBoundsHeight();
         var _loc3_:Number = _loc2_ * 0.5;
         if(param1 > 1)
         {
            return _loc3_ - (param1 - 1) / 7 * _loc3_;
         }
         return _loc2_ - param1 * _loc3_;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         this.redraw();
      }
      
      protected function animeSound_fadingChangeHandler(param1:AnimeSoundEvent) : void
      {
         this.redrawWithSound();
      }
      
      protected function animeSound_volumeChangeHandler(param1:AnimeSoundEvent) : void
      {
         this.redrawWithSound();
      }
      
      protected function animeSound_totalFrameChangeHandler(param1:AnimeSoundEvent) : void
      {
         this.redrawWithSound();
      }
   }
}
