package com.jumpeye.flashEff2.text.wavingLines
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.effects.JWavesEffect;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffText;
   import com.jumpeye.flashEff2.text.patternsPresets.JFETPreset;
   import com.jumpeye.transitions.TweenLite;
   import flash.display.Sprite;
   
   public class FETWavingLines extends IFlashEffText
   {
       
      
      protected var owner:Object;
      
      private var _preset:Number = 2;
      
      private var _waveIntensity:Number = 10;
      
      private var _blurQuality:Number = 2;
      
      private var prop:Number = 0;
      
      private var _waveSize:Number = 50;
      
      private var _groupDuration:Number = 1.2;
      
      public function FETWavingLines(param1:JUIComponent = null)
      {
         super();
         this.component = param1;
         this.init();
      }
      
      public function set waveIntensity(param1:Number) : void
      {
         if(isNaN(Number(param1)))
         {
            param1 = 100;
         }
         this._waveIntensity = param1;
      }
      
      override public function remove() : void
      {
         this.clearProperties();
      }
      
      override public function hide() : void
      {
         if(this.component != null)
         {
            this.startTransition(false);
         }
      }
      
      public function get groupDuration() : Number
      {
         return this._groupDuration;
      }
      
      protected function init() : void
      {
         _tweenDuration = 1.7;
         _tweenType = "Strong";
         _easeType = "easeNone";
         this.owner = {};
      }
      
      private function alphaFinish(param1:Object, param2:Sprite) : *
      {
         param1.clip.filters = [];
         if(show == false)
         {
            param1.clip.visible = false;
         }
         owner.tweensFinished++;
         if(owner.tweensNumber == owner.tweensFinished)
         {
            clearProperties();
            this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
         }
      }
      
      protected function startTransition(param1:Boolean = true) : void
      {
         var _loc2_:Array = null;
         var _loc3_:uint = 0;
         var _loc4_:Array = null;
         var _loc5_:Object = null;
         var _loc6_:* = undefined;
         var _loc7_:uint = 0;
         var _loc10_:uint = 0;
         var _loc11_:Object = null;
         var _loc12_:* = undefined;
         var _loc13_:* = undefined;
         var _loc14_:* = undefined;
         var _loc15_:* = undefined;
         var _loc16_:* = undefined;
         var _loc8_:Number = Number(Number(this.preset)) || Number(1);
         if(Number(_loc8_) > 5)
         {
            _loc8_ = 1;
         }
         _loc8_ = Math.max(1,_loc8_);
         var _loc9_:String = "lines";
         _loc8_ = _loc8_ + 25;
         this.component.drawTextTable(_loc9_,this.partialGroup,this.partialPercent,this.selectedStrings,this.partialStart,this.partialBlurAmount);
         _loc2_ = this.component.absMatrix;
         _loc5_ = JFETPreset.getPresetsArray(_loc8_,_loc2_);
         _loc4_ = _loc5_.timeMatrix;
         owner.maxItems = _loc5_.maxItems;
         owner.tweensFinished = 0;
         _loc3_ = _loc2_.length;
         owner.tweensNumber = this.component.textTable.childs.length;
         if(owner.maxItems <= 1)
         {
            owner.delay = 0;
         }
         else
         {
            owner.delay = Math.max((this.tweenDuration - this.groupDuration) / (owner.maxItems - 1),0);
         }
         owner.elements = [];
         _loc6_ = 0;
         while(_loc6_ < _loc3_)
         {
            _loc10_ = _loc2_[_loc6_].length;
            owner.elements[_loc6_] = [];
            _loc7_ = 0;
            while(_loc7_ < _loc10_)
            {
               _loc11_ = owner.elements[_loc6_][_loc7_] = {};
               _loc11_.clip = _loc2_[_loc6_][_loc7_];
               _loc12_ = !!param1?0:1;
               _loc13_ = !!param1?1:0;
               _loc11_.clip.alpha = _loc12_;
               TweenLite.to(_loc11_.clip,this.groupDuration,{
                  "alpha":_loc13_,
                  "delay":_loc4_[_loc6_][_loc7_] * owner.delay,
                  "ease":this.easeFunc,
                  "onComplete":alphaFinish,
                  "onCompleteParams":[_loc11_,_loc11_.clip],
                  "overwrite":false
               });
               _loc14_ = _loc11_.clip.height;
               owner["wave" + _loc6_ + "_" + _loc7_] = new JWavesEffect(_loc11_.clip,_loc11_.clip.width,_loc14_);
               owner["wave" + _loc6_ + "_" + _loc7_].baseX = waveIntensity;
               owner["wave" + _loc6_ + "_" + _loc7_].baseY = waveIntensity;
               _loc15_ = !!param1?waveSize:0;
               _loc16_ = !!param1?0:waveSize;
               owner["wave" + _loc6_ + "_" + _loc7_].value = _loc15_;
               TweenLite.to(owner["wave" + _loc6_ + "_" + _loc7_],this.groupDuration,{
                  "value":_loc16_,
                  "delay":_loc4_[_loc6_][_loc7_] * owner.delay,
                  "ease":this.easeFunc
               });
               _loc7_++;
            }
            _loc6_++;
         }
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
      
      public function get waveSize() : Number
      {
         return _waveSize;
      }
      
      public function get preset() : Number
      {
         return this._preset;
      }
      
      protected function clearProperties() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:uint = 0;
         var _loc3_:* = undefined;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:Object = null;
         if(owner is Object)
         {
            if(owner.elements is Array)
            {
               _loc1_ = owner.absMatrix;
               _loc2_ = owner.elements.length;
               _loc3_ = 0;
               while(_loc3_ < _loc2_)
               {
                  _loc5_ = owner.elements[_loc3_].length;
                  _loc4_ = 0;
                  while(_loc4_ < _loc5_)
                  {
                     _loc6_ = owner.elements[_loc3_][_loc4_];
                     TweenLite.killTweensOf(_loc6_.clip,false);
                     TweenLite.killTweensOf(_loc6_,false);
                     delete owner["wave" + _loc3_ + "_" + _loc4_];
                     _loc4_++;
                  }
                  _loc3_++;
               }
            }
         }
         delete owner.elements;
      }
      
      public function set groupDuration(param1:Number) : void
      {
         if(param1 < 0.001)
         {
            param1 = 0.001;
         }
         this._groupDuration = Number(Number(param1)) || Number(1);
      }
      
      public function set waveSize(param1:Number) : void
      {
         if(isNaN(Number(param1)))
         {
            param1 = 100;
         }
         this._waveSize = param1;
      }
      
      public function get waveIntensity() : Number
      {
         return _waveIntensity;
      }
      
      override public function show() : void
      {
         if(this.component != null)
         {
            this.startTransition(true);
         }
      }
      
      public function set preset(param1:Number) : void
      {
         this._preset = param1;
      }
   }
}
