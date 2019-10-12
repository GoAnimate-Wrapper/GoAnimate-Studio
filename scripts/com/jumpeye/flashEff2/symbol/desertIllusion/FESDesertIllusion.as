package com.jumpeye.flashEff2.symbol.desertIllusion
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffSymbol;
   import com.jumpeye.flashEff2.utils.wavesEffect.JWavesEffect;
   import com.jumpeye.transitions.TweenLite;
   import flash.filters.BlurFilter;
   
   public class FESDesertIllusion extends IFlashEffSymbol
   {
       
      
      private var _scaleAmount:Number = 1;
      
      private var radius:Number;
      
      private var maxWaveSize;
      
      private var transitionType:String;
      
      private var owner:Object;
      
      private var bounds:Object;
      
      private var _blurAmount = 3;
      
      private var waveIntensity;
      
      private var _smooth:Boolean = true;
      
      private var _blurQuality:Number = 1;
      
      private var _wavesIntensity:Number = 80;
      
      private var t;
      
      private var _waveSize:Number = 80;
      
      private var _preset:Number;
      
      public function FESDesertIllusion(param1:JUIComponent = null)
      {
         owner = {};
         super();
         this.component = param1;
         this.init();
      }
      
      public function set scaleAmount(param1:Number) : void
      {
         this._scaleAmount = param1;
      }
      
      protected function init() : void
      {
         _tweenDuration = 1.5;
         _easeType = "easeNone";
         _tweenType = "Quadratic";
      }
      
      override public function remove() : void
      {
         destroy();
      }
      
      public function get blurQuality() : Number
      {
         return this._blurQuality;
      }
      
      public function get blurAmount() : Number
      {
         return this._blurAmount;
      }
      
      public function get waveSize() : Number
      {
         return _waveSize;
      }
      
      private function hdlScaleXChange() : *
      {
         this.component.targetOwner.x = owner.origX - this.component.targetOwner.width / 2;
      }
      
      public function set waveSize(param1:Number) : void
      {
         this._waveSize = param1;
      }
      
      private function getBlurFilter(param1:*) : BlurFilter
      {
         var _loc2_:Number = param1;
         var _loc3_:Number = param1;
         return new BlurFilter(_loc2_,_loc3_,_blurQuality);
      }
      
      public function set blurQuality(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         this._blurQuality = param1;
      }
      
      public function get wavesIntensity() : Number
      {
         return _wavesIntensity;
      }
      
      public function get smooth() : Boolean
      {
         return this._smooth;
      }
      
      public function get scaleAmount() : Number
      {
         return this._scaleAmount;
      }
      
      public function set blurAmount(param1:Number) : void
      {
         this._blurAmount = param1;
      }
      
      override public function hide() : void
      {
         startTransition("hide");
      }
      
      private function transition() : *
      {
         this.target.visible = true;
         owner.scX = target.width / target.getBounds(target).width;
         owner.scY = target.height / target.getBounds(target).height;
         owner.origX = target.x + target.width / 2;
         owner.origY = target.y + target.height / 2;
         var _loc1_:* = transitionType == "show"?0:1;
         var _loc2_:* = transitionType == "show"?1:0;
         var _loc3_:* = transitionType == "show"?maxWaveSize:0;
         var _loc4_:* = transitionType == "show"?0:maxWaveSize;
         owner["wave"] = new JWavesEffect(target,smooth,_blurQuality,component.width,component.height);
         owner["wave"].baseX = waveIntensity;
         owner["wave"].baseY = waveIntensity;
         target.alpha = _loc1_;
         TweenLite.to(target,t,{
            "alpha":_loc2_,
            "delay":0,
            "onComplete":hdlMotionFinished,
            "ease":this.easeFunc,
            "overwrite":false
         });
         owner["wave"].value = _loc3_;
         TweenLite.to(owner["wave"],t,{
            "value":_loc4_,
            "delay":0,
            "onComplete":hdlMotionFinished,
            "ease":this.easeFunc,
            "overwrite":false
         });
         var _loc5_:* = transitionType == "show"?target.scaleX * scaleAmount:owner.scX;
         var _loc6_:* = transitionType == "show"?owner.scX:target.scaleX * scaleAmount;
         var _loc7_:* = transitionType == "show"?target.scaleY * scaleAmount:owner.scY;
         var _loc8_:* = transitionType == "show"?owner.scY:target.scaleY * scaleAmount;
         var _loc9_:* = transitionType == "show"?blurAmount:0;
         var _loc10_:* = transitionType == "show"?0:blurAmount;
         owner.blurFilterTween = {};
         owner.blurFilterTween.value = _loc9_;
         TweenLite.to(owner.blurFilterTween,t,{
            "value":_loc10_,
            "delay":0,
            "onUpdate":hdlChangeFilter,
            "onUpdateParams":[owner.blurFilterTween],
            "ease":this.easeFunc,
            "overwrite":false
         });
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
      
      public function set preset(param1:Number) : void
      {
         this._preset = param1;
      }
      
      private function startTransition(param1:String) : *
      {
         owner.gain = waveSize;
         owner.customParam1 = wavesIntensity;
         radius = Math.abs(component.rotation) / 180 * Math.PI;
         transitionType = param1;
         maxWaveSize = owner.gain == "" || isNaN(Number(owner.gain))?100:owner.gain;
         maxWaveSize = Math.max(0,maxWaveSize);
         waveIntensity = owner.customParam1 == "" || isNaN(Number(owner.customParam1))?100:owner.customParam1;
         t = this._tweenDuration;
         bounds = target.getBounds(target);
         var _loc2_:* = target.getBounds(target.parent);
         owner["targetObj"] = {
            "x":target.x,
            "y":target.y,
            "width":_loc2_.width * target.scaleX,
            "height":_loc2_.height * target.scaleY,
            "scaleX":target.scaleX,
            "scaleY":target.scaleY,
            "xMin":_loc2_.x,
            "yMin":_loc2_.y
         };
         transition();
      }
      
      private function hdlChangeFilter(param1:Object) : void
      {
         if(!target)
         {
            return;
         }
         var _loc2_:* = param1.value;
         var _loc3_:* = getBlurFilter(_loc2_);
         var _loc4_:* = target.filters;
         _loc4_.push(_loc3_);
         target.filters = _loc4_;
      }
      
      public function set smooth(param1:Boolean) : void
      {
         this._smooth = param1;
      }
      
      private function hdlMotionFinished() : *
      {
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
      }
      
      public function get preset() : Number
      {
         return this._preset;
      }
      
      private function hdlScaleYChange() : *
      {
         this.component.targetOwner.y = owner.origY - this.component.targetOwner.height / 2;
      }
      
      public function set wavesIntensity(param1:Number) : void
      {
         this._wavesIntensity = param1;
      }
      
      private function destroy() : void
      {
         if(!owner)
         {
            return;
         }
         TweenLite.killTweensOf(target,false);
         TweenLite.killTweensOf(owner["wave"],false);
         TweenLite.killTweensOf(owner.blurFilterTween,false);
         if(owner["wave"])
         {
            owner["wave"].bitmap.dispose();
         }
         if(target)
         {
            target.filters = [];
            target.alpha = 1;
         }
      }
      
      override public function show() : void
      {
         startTransition("show");
      }
   }
}
