package com.jumpeye.flashEff2.text.verticalStripes
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffText;
   import com.jumpeye.flashEff2.text.patternsPresets.JFETPreset;
   import com.jumpeye.transitions.TweenLite;
   import flash.display.Sprite;
   import flash.filters.BlurFilter;
   import flash.geom.Rectangle;
   
   public class FETVerticalStripes extends IFlashEffText
   {
       
      
      private var _preset:Number = 15;
      
      private var _orientationUp:Boolean = true;
      
      private var changeCoeficient:Number;
      
      private var _maxBlurX:Number = 20;
      
      private var _maxBlurY:Number = 20;
      
      private var transitionType:String;
      
      private var _groupDuration:Number = 0.9;
      
      private var maxItems:Number;
      
      private var _blurAmount:Number = 20;
      
      private var _blurQuality:Number = 3;
      
      private var _alphaPercentage:Number = 40;
      
      private var _thickness:Number = 6;
      
      private var tweensFinished:Number = 0;
      
      private var presetObject:Object;
      
      private var endEvent:Boolean = false;
      
      public function FETVerticalStripes(param1:JUIComponent = null)
      {
         presetObject = {};
         transitionType = new String();
         super();
         this.component = param1;
         this.init();
      }
      
      protected function clearProperties() : void
      {
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc1_:* = this.component.absMatrix;
         var _loc2_:* = 0;
         while(_loc2_ < _loc1_.length)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc1_[_loc2_].length)
            {
               if(_loc1_[_loc2_][_loc3_] is Object)
               {
                  _loc4_ = _loc1_[_loc2_][_loc3_];
                  _loc4_.mask = null;
                  _loc5_ = 0;
                  while(_loc5_ < _loc4_.linesNumber)
                  {
                     if(_loc4_.bitmap.contains(_loc4_["rect" + _loc5_]))
                     {
                        _loc4_.bitmap.removeChild(_loc4_["rect" + _loc5_]);
                     }
                     _loc5_++;
                  }
                  TweenLite.killTweensOf(_loc1_[_loc2_][_loc3_],false);
               }
               _loc3_++;
            }
            _loc2_++;
         }
         if(endEvent == true)
         {
            this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
         }
      }
      
      override public function remove() : void
      {
         if(component)
         {
            this.clearProperties();
         }
      }
      
      function motionChange(param1:*) : *
      {
         var _loc2_:* = undefined;
         if(orientationUp)
         {
            _loc2_ = 0;
            while(_loc2_ < param1.linesNumber)
            {
               param1["rect" + _loc2_].y = -(param1["rect" + _loc2_].height * param1.prop) + param1["rect" + _loc2_].height * changeCoeficient;
               _loc2_++;
            }
         }
         else
         {
            _loc2_ = 0;
            while(_loc2_ < param1.linesNumber)
            {
               param1["rect" + _loc2_].y = param1["rect" + _loc2_].height * param1.prop - param1["rect" + _loc2_].height * changeCoeficient;
               _loc2_++;
            }
         }
      }
      
      public function get orientationUp() : Boolean
      {
         return this._orientationUp;
      }
      
      protected function init() : void
      {
         _tweenDuration = 1.5;
         _tweenType = "Strong";
         _easeType = "easeOut";
      }
      
      public function set orientationUp(param1:Boolean) : void
      {
         this._orientationUp = param1;
      }
      
      public function get alphaPercentage() : Number
      {
         return this._alphaPercentage;
      }
      
      function motionChangeBlur(param1:*) : *
      {
         var _loc2_:* = param1.prop * blurAmount;
         _loc2_ = Math.min(int(_loc2_),25);
         blurEffect(param1,_loc2_,_loc2_);
      }
      
      public function get blurAmount() : Number
      {
         return this._blurAmount;
      }
      
      public function get blurQuality() : Number
      {
         return this._blurQuality;
      }
      
      private function startTween(param1:*, param2:Number) : *
      {
         var _loc3_:* = undefined;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:* = undefined;
         if(transitionType == "show")
         {
            changeCoeficient = 1;
            param1.prop = 0;
            _loc3_ = 1;
            param1.scaleX = 1;
            param1.scaleY = 1;
            _loc4_ = 1;
            param1.alpha = 0;
            _loc5_ = param2;
            _loc6_ = 1;
         }
         else
         {
            changeCoeficient = 0;
            param1.prop = 0;
            _loc3_ = 1;
            param1.scaleX = 1;
            param1.scaleY = 1;
            _loc6_ = 1;
            _loc4_ = 0;
            param1.alpha = 1;
            _loc5_ = param2 + this.groupDuration - this.groupDuration * this.alphaPercentage / 100;
         }
         createLines(param1);
         param1.mask = param1.bitmap;
         param1.lastProp = param1.prop;
         param1.lastY = param1.y;
         TweenLite.to(param1,this.groupDuration,{
            "prop":_loc3_,
            "scaleX":_loc6_,
            "scaleY":_loc6_,
            "overwrite":true,
            "delay":param2,
            "ease":this.easeFunc,
            "onComplete":motionFinish,
            "onCompleteParams":[param1],
            "onUpdateParams":[param1],
            "onUpdate":motionChange
         });
         TweenLite.to(param1,this.groupDuration * this.alphaPercentage / 100,{
            "alpha":_loc4_,
            "overwrite":false,
            "delay":_loc5_
         });
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
      
      public function set blurQuality(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         this._blurQuality = param1;
      }
      
      public function get groupDuration() : Number
      {
         return this._groupDuration;
      }
      
      public function set blurAmount(param1:Number) : void
      {
         this._blurAmount = param1;
      }
      
      override public function hide() : void
      {
         if(this.component != null)
         {
            this.startTransition("hide");
         }
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
      
      public function set preset(param1:Number) : void
      {
         if(param1 <= 0)
         {
            param1 = 9;
         }
         this._preset = param1;
      }
      
      protected function startTransition(param1:String) : void
      {
         var _loc2_:Array = null;
         var _loc3_:uint = 0;
         var _loc4_:Array = null;
         var _loc5_:* = undefined;
         var _loc6_:uint = 0;
         var _loc8_:* = undefined;
         var _loc9_:* = undefined;
         var _loc10_:* = undefined;
         var _loc11_:* = undefined;
         tweensFinished = 0;
         endEvent = false;
         transitionType = param1;
         var _loc7_:Object = JFETPreset.getAliasPreset(this.preset);
         this.component.drawTextTable(_loc7_.splitter,this.partialGroup,this.partialPercent,this.selectedStrings,this.partialStart,this.partialBlurAmount);
         _loc2_ = this.component.absMatrix;
         presetObject = JFETPreset.getPresetsArray(_loc7_.preset,_loc2_);
         maxItems = this.component.textTable.childs.length;
         _loc4_ = presetObject.timeMatrix;
         if(presetObject.maxItems > 1)
         {
            _loc8_ = Math.max((this.tweenDuration - this.groupDuration) / (presetObject.maxItems - 1),0);
         }
         else
         {
            _loc8_ = 0;
         }
         _loc5_ = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc6_ = 0;
            while(_loc6_ < _loc4_[_loc5_].length)
            {
               _loc9_ = _loc2_[_loc5_][_loc6_];
               _loc10_ = _loc9_.width;
               _loc11_ = _loc9_.height;
               _loc9_.xInit = _loc9_.x;
               _loc9_.yInit = _loc9_.y;
               startTween(_loc9_,_loc4_[_loc5_][_loc6_] * _loc8_);
               _loc6_++;
            }
            _loc5_++;
         }
      }
      
      public function get preset() : Number
      {
         return this._preset;
      }
      
      private function createLines(param1:*) : *
      {
         var _loc4_:Number = NaN;
         var _loc6_:* = undefined;
         var _loc7_:Rectangle = null;
         var _loc2_:Number = thickness;
         var _loc3_:* = Math.ceil(param1.width / _loc2_);
         if(orientationUp)
         {
            _loc4_ = -1;
         }
         else
         {
            _loc4_ = 1;
         }
         param1.bitmap = new Sprite();
         param1.linesNumber = _loc3_;
         var _loc5_:* = 0;
         while(_loc5_ < _loc3_)
         {
            param1["rect" + _loc5_] = new Sprite();
            _loc6_ = param1.height + param1.height / 1.5 * Math.random();
            param1["rect" + _loc5_].graphics.beginFill(16711680);
            param1["rect" + _loc5_].graphics.drawRect(_loc5_ * _loc2_,0,_loc2_,_loc6_);
            param1.bitmap.addChild(param1["rect" + _loc5_]);
            _loc7_ = param1.getBounds(param1);
            param1["rect" + _loc5_].height = Math.max(param1["rect" + _loc5_].height,_loc7_.height);
            if(orientationUp)
            {
               param1["rect" + _loc5_].y = param1["rect" + _loc5_].height * changeCoeficient;
            }
            else
            {
               param1["rect" + _loc5_].y = -(param1["rect" + _loc5_].height * changeCoeficient);
            }
            _loc5_++;
         }
         param1.bitmap.x = param1.x + _loc7_.x;
         param1.bitmap.y = param1.y;
         this.component.targetOwner.addChild(param1.bitmap);
      }
      
      public function set groupDuration(param1:Number) : void
      {
         if(param1 < 0.001)
         {
            param1 = 0.001;
         }
         this._groupDuration = Number(Number(param1)) || Number(1);
      }
      
      function blurEffect(param1:*, param2:Number, param3:Number, param4:* = 3) : *
      {
         param4 = this.blurQuality;
         var _loc5_:BlurFilter = new BlurFilter(param2,param3,param4);
         var _loc6_:Array = new Array();
         _loc6_.push(_loc5_);
         param1.filters = _loc6_;
      }
      
      function motionFinish(param1:*) : *
      {
         tweensFinished++;
         param1.filters = [];
         if(transitionType == "hide")
         {
            param1.visible = false;
         }
         if(tweensFinished == maxItems)
         {
            endEvent = true;
            remove();
         }
      }
      
      public function set thickness(param1:Number) : void
      {
         if(param1 < 1)
         {
            param1 = 1;
         }
         else if(param1 > 50)
         {
            param1 = 50;
         }
         this._thickness = param1;
      }
      
      public function get thickness() : Number
      {
         return this._thickness;
      }
      
      override public function show() : void
      {
         if(this.component != null)
         {
            this.startTransition("show");
         }
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
   }
}
