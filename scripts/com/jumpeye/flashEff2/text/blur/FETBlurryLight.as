package com.jumpeye.flashEff2.text.blur
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffText;
   import com.jumpeye.flashEff2.text.patternsPresets.JFETPreset;
   import com.jumpeye.transitions.TweenLite;
   import flash.display.Sprite;
   import flash.filters.BitmapFilter;
   import flash.filters.BlurFilter;
   import flash.filters.GlowFilter;
   
   public class FETBlurryLight extends IFlashEffText
   {
       
      
      private var _preset:Number = 18;
      
      protected var isShow:Boolean = false;
      
      protected var tweensNumber:Number;
      
      private var _maxGlow:Number = 10;
      
      private var _glowColor:Number = 16777215;
      
      private var _alphaPercentage:Number = 50;
      
      private var _blurQuality:Number = 2;
      
      private var _maxBlurX:Number = 4;
      
      private var _maxBlurY:Number = 16;
      
      protected var elements:Array;
      
      protected var tweensFinished:Number;
      
      private var _groupDuration:Number = 1;
      
      public function FETBlurryLight(param1:JUIComponent = null)
      {
         super();
         this.component = param1;
         this.init();
      }
      
      protected function complete(param1:Object) : void
      {
         param1.clip.filters = [];
         if(this.isShow == false)
         {
            param1.clip.visible = false;
         }
         this.tweensFinished++;
         if(this.tweensNumber == this.tweensFinished)
         {
            this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
         }
      }
      
      public function set glowColor(param1:uint) : void
      {
         _glowColor = param1;
      }
      
      protected function motionChange(param1:Object) : void
      {
         var _loc2_:Number = param1.prop;
         var _loc3_:Number = _loc2_;
         var _loc4_:Number = _loc3_ * this.maxBlurX;
         var _loc5_:Number = _loc3_ * this.maxBlurY;
         this.applyFilters(param1.clip,_loc4_,_loc5_,_loc3_ * this._maxGlow,this.blurQuality);
      }
      
      override public function hide() : void
      {
         if(this.component != null)
         {
            this.startTransition(false);
         }
      }
      
      override public function remove() : void
      {
         this.clearProperties();
      }
      
      public function get maxBlurX() : Number
      {
         return this._maxBlurX;
      }
      
      protected function applyFilters(param1:Sprite, param2:Number, param3:Number, param4:Number, param5:uint = 2) : void
      {
         var _loc6_:BitmapFilter = new BlurFilter(param2,param3,param5);
         var _loc7_:GlowFilter = new GlowFilter(this._glowColor,1,this._maxBlurX,this._maxBlurX,param4,param5);
         var _loc8_:Array = new Array();
         _loc8_.push(_loc7_,_loc6_);
         param1.filters = _loc8_;
      }
      
      protected function init() : void
      {
         _tweenDuration = 1.6;
         _tweenType = "Strong";
         _easeType = "easeOut";
      }
      
      public function get maxBlurY() : Number
      {
         return this._maxBlurY;
      }
      
      public function get glowColor() : uint
      {
         return _glowColor;
      }
      
      protected function getBezier(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         return (1 - param1) * (1 - param1) * param2 + 2 * param1 * (1 - param1) * param3 + param1 * param1 * param4;
      }
      
      public function set maxBlurY(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         this._maxBlurY = Number(Number(param1)) || Number(0);
      }
      
      public function get alphaPercentage() : Number
      {
         return this._alphaPercentage;
      }
      
      public function get preset() : Number
      {
         return this._preset;
      }
      
      public function set maxBlurX(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         this._maxBlurX = Number(Number(param1)) || Number(0);
      }
      
      public function set groupDuration(param1:Number) : void
      {
         if(param1 < 0.001)
         {
            param1 = 0.001;
         }
         this._groupDuration = Number(Number(param1)) || Number(1);
      }
      
      public function get blurQuality() : Number
      {
         return this._blurQuality;
      }
      
      public function get maxGlow() : Number
      {
         return _maxGlow;
      }
      
      protected function startTransition(param1:Boolean = true) : void
      {
         var _loc2_:Array = null;
         var _loc3_:uint = 0;
         var _loc4_:Array = null;
         var _loc5_:Object = null;
         var _loc6_:* = undefined;
         var _loc7_:uint = 0;
         var _loc12_:Number = NaN;
         var _loc13_:uint = 0;
         var _loc14_:Object = null;
         var _loc8_:Object = JFETPreset.getAliasPreset(this.preset);
         this.component.drawTextTable(_loc8_.splitter,this.partialGroup,this.partialPercent,this.selectedStrings,this.partialStart,this.partialBlurAmount);
         _loc2_ = this.component.absMatrix;
         _loc5_ = JFETPreset.getPresetsArray(_loc8_.preset,_loc2_);
         _loc4_ = _loc5_.timeMatrix;
         var _loc9_:* = _loc5_.maxItems;
         this.tweensFinished = 0;
         _loc3_ = _loc2_.length;
         var _loc10_:int = 0;
         var _loc11_:int = 1;
         isShow = param1;
         if(param1 == true)
         {
            _loc10_ = 1;
            _loc11_ = 0;
         }
         this.tweensNumber = 2 * this.component.textTable.childs.length;
         if(_loc9_ <= 1)
         {
            _loc12_ = 0;
         }
         else
         {
            _loc12_ = Math.max((this.tweenDuration - this.groupDuration) / (_loc9_ - 1),0);
         }
         this.elements = [];
         _loc6_ = 0;
         while(_loc6_ < _loc3_)
         {
            _loc13_ = _loc2_[_loc6_].length;
            this.elements[_loc6_] = [];
            _loc7_ = 0;
            while(_loc7_ < _loc13_)
            {
               _loc14_ = this.elements[_loc6_][_loc7_] = {};
               _loc14_.clip = _loc2_[_loc6_][_loc7_];
               _loc14_.clip.alpha = _loc11_;
               _loc14_.prop = _loc10_;
               TweenLite.to(_loc14_,this.groupDuration,{
                  "prop":_loc11_,
                  "delay":_loc4_[_loc6_][_loc7_] * _loc12_,
                  "ease":this.easeFunc,
                  "onUpdate":this.motionChange,
                  "onUpdateParams":[_loc14_],
                  "onComplete":this.complete,
                  "onCompleteParams":[_loc14_]
               });
               TweenLite.to(_loc14_.clip,this.groupDuration * this._alphaPercentage / 100,{
                  "alpha":_loc10_,
                  "delay":_loc4_[_loc6_][_loc7_] * _loc12_ + _loc11_ * this.groupDuration * (100 - this._alphaPercentage) / 100,
                  "onComplete":this.complete,
                  "onCompleteParams":[_loc14_]
               });
               _loc7_++;
            }
            _loc6_++;
         }
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
      
      public function set blurQuality(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         this._blurQuality = Number(Number(param1)) || Number(1);
      }
      
      public function set maxGlow(param1:Number) : void
      {
         _maxGlow = param1;
      }
      
      public function get groupDuration() : Number
      {
         return this._groupDuration;
      }
      
      protected function clearProperties() : void
      {
         var _loc1_:uint = 0;
         var _loc2_:* = undefined;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:Object = null;
         if(this.elements is Array)
         {
            _loc1_ = this.elements.length;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               _loc4_ = this.elements[_loc2_].length;
               _loc3_ = 0;
               while(_loc3_ < _loc4_)
               {
                  _loc5_ = this.elements[_loc2_][_loc3_];
                  _loc5_.clip.filters = [];
                  _loc5_.clip.alpha = 1;
                  TweenLite.killTweensOf(_loc5_,false);
                  TweenLite.killTweensOf(_loc5_.clip,false);
                  _loc3_++;
               }
               _loc2_++;
            }
         }
         this.elements = null;
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
      
      public function set alphaPercentage(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         else if(param1 > 100)
         {
            param1 = 100;
         }
         this._alphaPercentage = param1;
      }
   }
}
