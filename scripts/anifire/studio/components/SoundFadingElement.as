package anifire.studio.components
{
   import anifire.constant.AnimeConstants;
   import anifire.studio.core.AnimeSound;
   import anifire.studio.core.sound.AnimeSoundEvent;
   import anifire.studio.core.sound.SoundEvent;
   import anifire.studio.core.sound.SoundWaveformData;
   import anifire.util.UtilUnitConvert;
   import flash.display.Graphics;
   import flash.events.Event;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.core.SpriteVisualElement;
   
   public class SoundFadingElement extends Group
   {
      
      private static const CURSOR_LINE_OFFSET:int = 2;
       
      
      private var _437343182waveDrawTarget:SpriteVisualElement;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _waveformInvalidateFlag:Boolean;
      
      protected var _animeSound:AnimeSound;
      
      protected var _hovered:Boolean;
      
      public function SoundFadingElement()
      {
         super();
         mx_internal::_document = this;
         this.height = 18;
         this.mxmlContent = [this._SoundFadingElement_SpriteVisualElement1_i()];
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
      
      [Bindable(event="propertyChange")]
      public function get hovered() : Boolean
      {
         return this._hovered;
      }
      
      private function set _1101035227hovered(param1:Boolean) : void
      {
         if(this._hovered != param1)
         {
            this._hovered = param1;
            this._waveformInvalidateFlag = true;
            invalidateDisplayList();
         }
      }
      
      public function get animeSound() : AnimeSound
      {
         return this._animeSound;
      }
      
      public function set animeSound(param1:AnimeSound) : void
      {
         if(this._animeSound)
         {
            this.cancelWaveformLoading();
            this._animeSound.removeEventListener(AnimeSoundEvent.VOLUME_CHANGE,this.animeSound_changeHandler);
         }
         this._animeSound = param1;
         if(this._animeSound)
         {
            this._animeSound.addEventListener(AnimeSoundEvent.VOLUME_CHANGE,this.animeSound_changeHandler);
            this.displayWaveform();
         }
      }
      
      protected function displayWaveform() : void
      {
         this._waveformInvalidateFlag = true;
         if(this._animeSound.soundThumb.isWaveformDataReady)
         {
            invalidateDisplayList();
         }
         else
         {
            this._animeSound.soundThumb.addEventListener(SoundEvent.WAVEFORM_LOADED,this.animeSound_waveformLoadedHandler);
            this._animeSound.soundThumb.addEventListener(SoundEvent.WAVEFORM_LOAD_ERROR,this.animeSound_waveformErrorHandler);
            this._animeSound.soundThumb.loadWaveform();
         }
      }
      
      protected function animeSound_changeHandler(param1:Event) : void
      {
      }
      
      protected function animeSound_waveformLoadedHandler(param1:Event) : void
      {
         this.cancelWaveformLoading();
         invalidateDisplayList();
      }
      
      protected function animeSound_waveformErrorHandler(param1:Event) : void
      {
         this.cancelWaveformLoading();
      }
      
      protected function cancelWaveformLoading() : void
      {
         if(this._animeSound && this._animeSound.soundThumb)
         {
            this._animeSound.soundThumb.removeEventListener(SoundEvent.WAVEFORM_LOADED,this.animeSound_waveformLoadedHandler);
            this._animeSound.soundThumb.removeEventListener(SoundEvent.WAVEFORM_LOAD_ERROR,this.animeSound_waveformErrorHandler);
         }
      }
      
      protected function drawWaveform() : void
      {
         var _loc9_:Number = NaN;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Function = null;
         var _loc16_:Number = NaN;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc1_:Graphics = this.waveDrawTarget.graphics;
         var _loc2_:Array = this._animeSound.soundThumb.waveform.samples;
         var _loc3_:int = 1;
         var _loc4_:int = -1;
         if(this._animeSound.trimStartFrame > 1)
         {
            _loc3_ = this._animeSound.trimStartFrame * AnimeConstants.PIXEL_PER_FRAME / SoundWaveformData.PIXEL_PER_SAMPLE - 1;
         }
         var _loc5_:int = this._animeSound.totalFrame;
         if(this._animeSound.trimEndFrame > 1)
         {
            _loc5_ = this._animeSound.trimEndFrame;
         }
         _loc4_ = _loc5_ * AnimeConstants.PIXEL_PER_FRAME / SoundWaveformData.PIXEL_PER_SAMPLE - 1;
         _loc2_ = _loc2_.slice((_loc3_ - 1) * 2,(_loc4_ - 1) * 2);
         var _loc6_:Number = getLayoutBoundsWidth();
         var _loc7_:Number = getLayoutBoundsHeight();
         _loc1_.clear();
         _loc1_.beginFill(!!this._hovered?uint(this._animeSound.hoverColor):uint(this._animeSound.backgroundColor));
         _loc1_.drawRect(0,0,_loc6_,_loc7_);
         _loc1_.endFill();
         _loc1_.lineStyle(1,this._animeSound.borderColor);
         _loc1_.moveTo(0,0);
         _loc1_.lineTo(0,_loc7_);
         _loc1_.moveTo(_loc6_,0);
         _loc1_.lineTo(_loc6_,_loc7_);
         var _loc8_:* = !this._animeSound.scene;
         if(_loc2_)
         {
            _loc9_ = _loc7_ / 2;
            _loc10_ = _loc2_.length / 2;
            _loc11_ = UtilUnitConvert.frameToPixel(this._animeSound.totalFrame) / SoundWaveformData.PIXEL_PER_SAMPLE;
            _loc12_ = _loc6_ / _loc11_ * SoundWaveformData.PIXEL_PER_SAMPLE;
            _loc15_ = Math.abs;
            _loc1_.lineStyle(1,this._animeSound.waveformColor);
            _loc1_.beginFill(this._animeSound.waveformColor);
            _loc1_.moveTo(_loc13_,_loc9_);
            _loc18_ = 0;
            while(_loc18_ < _loc11_)
            {
               _loc13_ = _loc18_ * _loc12_;
               if(_loc8_)
               {
                  _loc17_ = _loc18_ % _loc10_ * 2;
                  _loc16_ = _loc2_[_loc17_];
               }
               else
               {
                  _loc17_ = _loc18_ * 2;
                  _loc16_ = _loc18_ < _loc10_?Number(_loc2_[_loc17_]):Number(0);
               }
               _loc14_ = _loc9_ - _loc15_(_loc16_) * _loc9_;
               _loc1_.lineTo(_loc13_,_loc14_);
               _loc18_++;
            }
            _loc18_ = _loc11_ - 1;
            while(_loc18_ >= 0)
            {
               _loc13_ = _loc18_ * _loc12_;
               if(_loc8_)
               {
                  _loc17_ = _loc18_ % _loc10_ * 2;
                  _loc16_ = _loc2_[_loc17_ + 1];
               }
               else
               {
                  _loc17_ = _loc18_ * 2;
                  _loc16_ = _loc18_ < _loc10_?Number(_loc2_[_loc17_ + 1]):Number(0);
               }
               _loc14_ = _loc9_ + _loc15_(_loc16_) * _loc9_;
               _loc1_.lineTo(_loc13_,_loc14_);
               _loc18_--;
            }
            _loc1_.endFill();
            _loc1_.moveTo(0,_loc9_);
            _loc1_.lineTo(_loc6_,_loc9_);
            this._waveformInvalidateFlag = false;
         }
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         if(this._waveformInvalidateFlag)
         {
            this.drawWaveform();
         }
      }
      
      public function invalidateWaveform() : void
      {
         this._waveformInvalidateFlag = true;
         invalidateDisplayList();
      }
      
      private function _SoundFadingElement_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.initialized(this,"waveDrawTarget");
         this.waveDrawTarget = _loc1_;
         BindingManager.executeBindings(this,"waveDrawTarget",this.waveDrawTarget);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get waveDrawTarget() : SpriteVisualElement
      {
         return this._437343182waveDrawTarget;
      }
      
      public function set waveDrawTarget(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._437343182waveDrawTarget;
         if(_loc2_ !== param1)
         {
            this._437343182waveDrawTarget = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"waveDrawTarget",_loc2_,param1));
            }
         }
      }
      
      public function set hovered(param1:Boolean) : void
      {
         var _loc2_:Object = this.hovered;
         if(_loc2_ !== param1)
         {
            this._1101035227hovered = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hovered",_loc2_,param1));
            }
         }
      }
   }
}
