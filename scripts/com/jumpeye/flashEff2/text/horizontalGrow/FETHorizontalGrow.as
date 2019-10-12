package com.jumpeye.flashEff2.text.horizontalGrow
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffText;
   import com.jumpeye.flashEff2.text.patternsPresets.JFERandomPreset;
   import com.jumpeye.transitions.TweenLite;
   import com.jumpeye.utils.JTimer;
   import fl.transitions.easing.Strong;
   import flash.events.TimerEvent;
   import flash.filters.BitmapFilter;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.GlowFilter;
   import flash.utils.Timer;
   
   public class FETHorizontalGrow extends IFlashEffText
   {
       
      
      private var delay:uint;
      
      private var presetObject:Object;
      
      private var lin:uint;
      
      private var test:uint = 0;
      
      private var _preset:Number;
      
      private var objMatrix:Array;
      
      private var repeat:uint;
      
      private var _groupSize:Number = 7;
      
      private var finalDuration:Number;
      
      private var _maxBlurY:Number = 20;
      
      protected var owner:Object;
      
      private var _groupDuration:Number = 1;
      
      private var bol:Boolean;
      
      private var newDelay:Number;
      
      private var timer:Timer;
      
      private var _translateDurationPercent:Number = 70;
      
      private var percLet = 0.5;
      
      private var _glowColor:Number = 16777215;
      
      private var _blurQuality:Number = 2;
      
      private var _maxHorizontalSpace:Number = 50;
      
      private var _alphaPercentage:Number = 100;
      
      private var prop:Number = 0;
      
      private var _glowAmount:Number = 3;
      
      private var i;
      
      private var j:uint;
      
      private var timeMatrix:Array;
      
      private var chars;
      
      private var lettersChanges = 20;
      
      private var tweensFinished:Number = 0;
      
      public function FETHorizontalGrow(param1:JUIComponent = null)
      {
         chars = ["A","a","B","b","C","c","D","d","E","e","F","f","G","g","H","h","I","i","J","j","K","k","L","l","M","m","N","n","O","o","P","p","Q","q","R","r","S","s","T","t","U","u","V","v","W","w","X","x","Y","y","Z","z"];
         super();
         this.component = param1;
         this.init();
      }
      
      protected function setPositionTween(param1:*, param2:*) : *
      {
         var _loc3_:* = bol == true?0:1;
         var _loc4_:* = bol == true?1:0;
         param1.clip.alpha = _loc3_;
         var _loc5_:* = bol == true?param1.clip.trueY:owner.initX - randRange(-maxHorizontalSpace,maxHorizontalSpace);
         var _loc6_:* = param1.clip.x;
         TweenLite.to(param1.clip,owner.duration * translateDurationPercent / 100,{
            "alpha":_loc4_,
            "x":_loc5_,
            "delay":param2,
            "ease":this.easeFunc,
            "onUpdate":hdlYChange,
            "onUpdateParams":[param1,param1.clip,_loc5_,_loc6_]
         });
      }
      
      protected function hdlYChange(param1:*, param2:*, param3:*, param4:*) : *
      {
         var _loc7_:* = undefined;
         var _loc8_:* = undefined;
         var _loc5_:* = param1.clip;
         var _loc6_:* = bol == true?param1.clip.x < param3 * percLet:param1.clip.x > Math.abs(param3 - param4) * (1 - percLet);
         if(_loc6_)
         {
            _loc7_ = Math.round(Math.random() * (chars.length - 1));
            _loc8_ = chars[_loc7_];
            _loc5_.textField.text = _loc8_;
            _loc5_.textField.setTextFormat(_loc5_.txtForm);
         }
         else if(_loc5_.isSetNormal == undefined)
         {
            stopChangingLetters(_loc5_);
         }
      }
      
      protected function hdlFinishGlow(param1:*) : *
      {
         countTransitions(param1);
      }
      
      protected function hdlChangeGlow(param1:*) : *
      {
         var _loc2_:* = param1.prop;
         var _loc3_:* = param1;
         var _loc4_:* = param1.clip;
         var _loc5_:* = _loc4_.filters;
         var _loc6_:* = getGlow(_loc2_);
         _loc4_.filters = tweensFinished == owner.tweensNumber?[]:[_loc6_];
      }
      
      protected function init() : void
      {
         _tweenDuration = 1.5;
         _tweenType = "Strong";
         _easeType = "easeOut";
         this.owner = {};
      }
      
      override public function remove() : void
      {
         this.clearProperties();
      }
      
      public function set maxHorizontalSpace(param1:Number) : void
      {
         if(isNaN(Number(param1)))
         {
            param1 = 100;
         }
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 > 500)
         {
            param1 = 500;
         }
         this._maxHorizontalSpace = Number(Number(param1)) || Number(100);
      }
      
      public function set glowAmount(param1:Number) : void
      {
         if(isNaN(Number(param1)))
         {
            param1 = 5;
         }
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 > 100)
         {
            param1 = 100;
         }
         this._glowAmount = Number(Number(param1)) || Number(5);
      }
      
      public function get alphaPercentage() : Number
      {
         return this._alphaPercentage;
      }
      
      public function get groupSize() : Number
      {
         return this._groupSize;
      }
      
      protected function getGlow(param1:*) : BitmapFilter
      {
         var _loc2_:Number = this.glowColor;
         var _loc3_:Number = 1;
         var _loc4_:Number = param1;
         var _loc5_:Number = param1;
         var _loc6_:Number = param1 / 2;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:Number = BitmapFilterQuality.HIGH;
         return new GlowFilter(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc9_,_loc7_,_loc8_);
      }
      
      protected function randRange(param1:Number, param2:Number) : Number
      {
         var _loc3_:Number = Math.floor(Math.random() * (param2 - param1 + 1)) + param1;
         return _loc3_;
      }
      
      protected function stopChangingLetters(param1:*) : *
      {
         param1.textField.text = param1.finText;
         param1.textField.setTextFormat(param1.txtForm);
         param1.isSetNormal = true;
      }
      
      public function set glowColor(param1:Number) : void
      {
         this._glowColor = Number(param1);
      }
      
      protected function countTransitions(param1:*) : *
      {
         param1.clip.filters = [];
         tweensFinished++;
         if(tweensFinished == owner.tweensNumber)
         {
            clearProperties();
            this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
         }
      }
      
      public function set alphaPercentage(param1:Number) : void
      {
         if(isNaN(Number(param1)))
         {
            param1 = 100;
         }
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 > 100)
         {
            param1 = 100;
         }
         this._alphaPercentage = param1;
      }
      
      public function get maxHorizontalSpace() : Number
      {
         return this._maxHorizontalSpace;
      }
      
      public function set groupSize(param1:Number) : void
      {
         if(isNaN(Number(param1)))
         {
            param1 = 7;
         }
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 > 100)
         {
            param1 = 100;
         }
         this._groupSize = Number(Number(param1)) || Number(5);
      }
      
      public function get groupDuration() : Number
      {
         return this._groupDuration;
      }
      
      public function get glowAmount() : Number
      {
         return this._glowAmount;
      }
      
      public function set translateDurationPercent(param1:Number) : void
      {
         if(isNaN(Number(param1)))
         {
            param1 = 70;
         }
         if(param1 < 1)
         {
            param1 = 1;
         }
         if(param1 > 99)
         {
            param1 = 99;
         }
         this._translateDurationPercent = Number(Number(param1)) || Number(70);
      }
      
      protected function stTween(param1:TimerEvent) : *
      {
         param1.target.stop();
         var _loc2_:* = param1.target.data;
         _loc2_.clip.finText = _loc2_.clip.textField.text;
         _loc2_.clip.txtForm = _loc2_.clip.textField.getTextFormat();
         var _loc3_:* = bol == true?0:owner.duration * (1 - translateDurationPercent / 100) * 1000;
         var _loc4_:* = bol == true?owner.duration * translateDurationPercent / 100 * 1000:0;
         setGlowTweenIn(_loc2_,_loc3_ / 1000);
         setPositionTween(_loc2_,_loc3_ / 1000);
         setGlowTweenOut(_loc2_,_loc4_ / 1000);
      }
      
      override public function hide() : void
      {
         if(this.component != null)
         {
            this.startTransition(false);
         }
      }
      
      public function get glowColor() : Number
      {
         return this._glowColor;
      }
      
      protected function setGlowTweenOut(param1:*, param2:*) : *
      {
         var _loc3_:* = {};
         _loc3_.clip = param1.clip;
         var _loc4_:* = bol == true?glowAmount:0;
         var _loc5_:* = bol == true?0:glowAmount;
         _loc3_.prop = _loc4_;
         if(bol == true)
         {
            TweenLite.to(_loc3_,owner.duration * (1 - translateDurationPercent / 100),{
               "prop":_loc5_,
               "delay":param2,
               "overwrite":false,
               "ease":Strong,
               "onComplete":hdlFinishGlow,
               "onUpdate":hdlChangeGlow,
               "onUpdateParams":[_loc3_],
               "onCompleteParams":[_loc3_]
            });
         }
         else
         {
            TweenLite.to(_loc3_,owner.duration * (1 - translateDurationPercent / 100),{
               "prop":_loc5_,
               "delay":param2,
               "overwrite":false,
               "ease":Strong,
               "onUpdate":hdlChangeGlow,
               "onUpdateParams":[_loc3_]
            });
         }
      }
      
      protected function startTransition(param1:Boolean = true) : void
      {
         var _loc3_:uint = 0;
         var _loc4_:Object = null;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         this.clearProperties();
         bol = param1;
         tweensFinished = 0;
         this.component.drawTextTable("chars",this.partialGroup,this.partialPercent,this.selectedStrings,this.partialStart,this.partialBlurAmount);
         objMatrix = this.component.absMatrix;
         presetObject = JFERandomPreset.getPresetsArray(1,objMatrix,groupSize);
         timeMatrix = presetObject.timeMatrix;
         lin = objMatrix.length;
         owner.elements = [];
         owner.maxItems = presetObject.maxItems;
         owner.tweensNumber = owner.maxItems > 1?objMatrix[0][0].parent.childs.length:0;
         owner.delay = (tweenDuration - groupDuration) / (owner.maxItems / groupSize - 1);
         owner.delay = owner.delay < 0?0:owner.delay;
         owner.duration = groupDuration;
         var _loc2_:* = this.component.targetOwner.getBounds(this.component.targetOwner);
         owner.initX = _loc2_.x + _loc2_.width / 2;
         owner.elements = [];
         i = 0;
         while(i < lin)
         {
            _loc3_ = objMatrix[i].length;
            owner.elements[i] = [];
            j = 0;
            while(j < _loc3_)
            {
               _loc4_ = owner.elements[i][j] = {};
               _loc4_.clip = objMatrix[i][j];
               _loc4_.clip.alpha = bol == true?0:1;
               _loc4_.tex = _loc4_.clip.textField.text;
               _loc4_.clip.trueY = _loc4_.clip.x;
               _loc5_ = bol == true?owner.initX - randRange(-maxHorizontalSpace,maxHorizontalSpace):_loc4_.clip.x;
               _loc4_.clip.x = _loc5_;
               _loc6_ = timeMatrix[i][j] * owner.delay * 1000;
               _loc6_ = !!isNaN(_loc6_)?0:_loc6_;
               owner["myTimer" + i + "_" + j] = new JTimer(_loc6_);
               owner["myTimer" + i + "_" + j].data = _loc4_;
               owner["myTimer" + i + "_" + j].addEventListener("timer",stTween);
               owner["myTimer" + i + "_" + j].start();
               j++;
            }
            i++;
         }
         this.target.visible = false;
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
      
      public function get preset() : Number
      {
         return this._preset;
      }
      
      protected function setGlowTweenIn(param1:*, param2:*) : *
      {
         var _loc3_:* = {};
         _loc3_.clip = param1.clip;
         var _loc4_:* = bol == true?0:glowAmount;
         var _loc5_:* = bol == true?glowAmount:0;
         _loc3_.prop = _loc4_;
         if(bol == false)
         {
            TweenLite.to(_loc3_,owner.duration * translateDurationPercent / 100,{
               "prop":_loc5_,
               "delay":param2,
               "ease":Strong,
               "onComplete":hdlFinishGlow,
               "onUpdate":hdlChangeGlow,
               "onUpdateParams":[_loc3_],
               "onCompleteParams":[_loc3_]
            });
         }
         else
         {
            TweenLite.to(_loc3_,owner.duration * translateDurationPercent / 100,{
               "prop":_loc5_,
               "delay":param2,
               "ease":Strong,
               "onUpdate":hdlChangeGlow,
               "onUpdateParams":[_loc3_]
            });
         }
      }
      
      private function clearProperties() : void
      {
         var _loc1_:uint = 0;
         var _loc2_:* = undefined;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:Object = null;
         var _loc6_:* = undefined;
         if(owner.elements)
         {
            _loc1_ = owner.elements.length;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               _loc4_ = owner.elements[_loc2_].length;
               _loc3_ = 0;
               while(_loc3_ < _loc4_)
               {
                  owner["myTimer" + _loc2_ + "_" + _loc3_].stop();
                  _loc5_ = owner.elements[_loc2_][_loc3_];
                  if(_loc5_.clip)
                  {
                     TweenLite.killTweensOf(_loc5_.clip,false);
                     _loc5_.clip.filters = [];
                     _loc6_ = {};
                     _loc6_.clip = _loc5_.clip;
                     TweenLite.killTweensOf(_loc6_,false);
                  }
                  _loc3_++;
               }
               _loc2_++;
            }
         }
      }
      
      public function set preset(param1:Number) : void
      {
         this._preset = param1;
      }
      
      public function set groupDuration(param1:Number) : void
      {
         if(param1 < 0.001)
         {
            param1 = 0.001;
         }
         this._groupDuration = Number(Number(param1)) || Number(1);
      }
      
      public function get translateDurationPercent() : Number
      {
         return this._translateDurationPercent;
      }
      
      override public function show() : void
      {
         if(this.component != null)
         {
            this.startTransition(true);
         }
      }
   }
}
