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
   
   public class FETBlur extends IFlashEffText
   {
       
      
      private var _preset:Number = 10;
      
      protected var isShow:Boolean = false;
      
      protected var tweensNumber:Number = 0;
      
      private var _blurQuality:Number = 2;
      
      private var _maxBlurX:Number = 10;
      
      private var _maxBlurY:Number = 10;
      
      private var _groupDuration:Number = 0.8;
      
      protected var elements:Array;
      
      protected var tweensFinished:Number = 0;
      
      public function FETBlur(param1:JUIComponent = null)
      {
         super();
         this.component = param1;
         this.init();
      }
      
      override public function remove() : void
      {
         this.clearProperties();
      }
      
      protected function motionChange(param1:Object) : void
      {
         var _loc2_:Number = param1.prop * this.maxBlurX;
         var _loc3_:Number = param1.prop * this.maxBlurY;
         this.blurEffect(param1.clip,_loc2_,_loc3_,this.blurQuality);
      }
      
      override public function hide() : void
      {
         if(this.component != null)
         {
            this.startTransition(false);
         }
      }
      
      public function get maxBlurX() : Number
      {
         return this._maxBlurX;
      }
      
      protected function init() : void
      {
         _groupDuration = 0.8;
         _tweenDuration = 1.7;
         _tweenType = "Strong";
         _easeType = "easeInOut";
      }
      
      public function get maxBlurY() : Number
      {
         return this._maxBlurY;
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
         var _loc9_:Number = _loc5_.maxItems;
         this.tweensFinished = 0;
         _loc3_ = _loc2_.length;
         var _loc10_:uint = 0;
         var _loc11_:uint = 1;
         this.isShow = param1;
         if(param1 == true)
         {
            _loc10_ = 1;
            _loc11_ = 0;
         }
         this.tweensNumber = this.component.textTable.childs.length;
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
            elements[_loc6_] = [];
            _loc7_ = 0;
            while(_loc7_ < _loc13_)
            {
               _loc14_ = elements[_loc6_][_loc7_] = {};
               _loc14_.clip = _loc2_[_loc6_][_loc7_];
               _loc14_.clip.alpha = Math.abs(1 - _loc10_);
               _loc14_.prop = _loc10_;
               TweenLite.to(_loc14_,this.groupDuration,{
                  "prop":_loc11_,
                  "delay":_loc4_[_loc6_][_loc7_] * _loc12_,
                  "ease":this.easeFunc,
                  "onUpdate":this.motionChange,
                  "onComplete":this.motionFinish,
                  "onCompleteParams":[_loc14_],
                  "onUpdateParams":[_loc14_]
               });
               TweenLite.to(_loc14_.clip,this.groupDuration,{
                  "alpha":_loc10_,
                  "delay":_loc4_[_loc6_][_loc7_] * _loc12_,
                  "onComplete":this.motionFinish,
                  "onCompleteParams":[_loc14_]
               });
               _loc7_++;
            }
            _loc6_++;
         }
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
      
      public function set maxBlurY(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         this._maxBlurY = Number(Number(param1)) || Number(0);
      }
      
      protected function blurEffect(param1:Sprite, param2:Number, param3:Number, param4:uint = 2) : void
      {
         var _loc5_:BitmapFilter = new BlurFilter(param2,param3,param4);
         var _loc6_:Array = new Array();
         _loc6_.push(_loc5_);
         param1.filters = _loc6_;
      }
      
      public function get preset() : Number
      {
         return this._preset;
      }
      
      protected function clearProperties() : void
      {
         var _loc1_:uint = 0;
         var _loc2_:* = undefined;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:Object = null;
         if(elements is Array)
         {
            _loc1_ = elements.length;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               _loc4_ = elements[_loc2_].length;
               _loc3_ = 0;
               while(_loc3_ < _loc4_)
               {
                  _loc5_ = elements[_loc2_][_loc3_];
                  _loc5_.clip.filters = [];
                  _loc5_.clip.alpha = 1;
                  TweenLite.killTweensOf(_loc5_.clip,false);
                  TweenLite.killTweensOf(_loc5_,false);
                  _loc3_++;
               }
               _loc2_++;
            }
         }
         elements = null;
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
      
      protected function motionFinish(param1:Object) : void
      {
         param1.clip.filters = [];
         if(this.isShow == false)
         {
            param1.clip.visible = false;
         }
         this.tweensFinished++;
         if(2 * tweensNumber == tweensFinished)
         {
            this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
         }
      }
      
      public function set blurQuality(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         this._blurQuality = Number(Number(param1)) || Number(1);
      }
      
      public function get groupDuration() : Number
      {
         return this._groupDuration;
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
