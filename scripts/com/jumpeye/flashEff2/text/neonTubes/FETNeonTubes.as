package com.jumpeye.flashEff2.text.neonTubes
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffText;
   import com.jumpeye.flashEff2.text.patternsPresets.JFETPreset;
   import com.jumpeye.transitions.TweenLite;
   import flash.display.Sprite;
   import flash.filters.BlurFilter;
   
   public class FETNeonTubes extends IFlashEffText
   {
       
      
      private var maxItems:Number;
      
      private var _blurAmount:Number = 8;
      
      private var presetObject:Object;
      
      private var _alphaPercentage:Number = 15;
      
      private var _blurQuality:Number = 3;
      
      private var _preset:Number = 1;
      
      private var tweenArray:Array;
      
      private var transitionType:String;
      
      private var _groupDuration:Number = 1;
      
      private var tweensFinished:Number = 0;
      
      protected var endEvent:Boolean = false;
      
      public function FETNeonTubes(param1:JUIComponent = null)
      {
         presetObject = {};
         transitionType = new String();
         tweenArray = new Array();
         super();
         this.component = param1;
         this.init();
      }
      
      function motionFinish(param1:*) : *
      {
         tweensFinished++;
         param1.filters = [];
         if(transitionType == "hide")
         {
            param1.visible = false;
         }
         param1.bitmap.removeChild(param1.rect1);
         param1.bitmap.removeChild(param1.rect2);
         param1.bitmap.removeChild(param1.rect3);
         delete param1.rect1;
         delete param1.rect2;
         delete param1.rect3;
         param1.mask = null;
         if(tweensFinished == maxItems)
         {
            endEvent = true;
            remove();
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
         param1.mask = param1.bitmap;
         param1.visible = true;
         var _loc2_:* = param1.prop;
         motionChangeBlur(param1);
         var _loc3_:* = param1.width;
         var _loc4_:* = param1.height;
         var _loc5_:* = param1.x;
         var _loc6_:* = param1.y;
         param1.rect1.x = _loc5_ + _loc3_ * Math.random();
         param1.rect1.y = _loc6_ + _loc4_ * Math.random();
         param1.rect1.width = _loc3_ * Math.random();
         param1.rect1.height = _loc2_ * _loc4_ * Math.random();
         param1.rect2.x = _loc5_ + _loc3_ * Math.random();
         param1.rect2.y = _loc6_ + _loc4_ * Math.random();
         param1.rect2.width = _loc3_ * Math.random();
         param1.rect2.height = _loc2_ * _loc4_;
         param1.rect3.x = _loc5_ + _loc3_ * Math.random();
         param1.rect3.y = _loc6_ + _loc4_ * Math.random();
         param1.rect3.width = _loc3_ * Math.random();
         param1.rect3.height = _loc2_ * _loc4_;
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
      
      override public function hide() : void
      {
         if(this.component != null)
         {
            this.startTransition("hide");
         }
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
      
      protected function init() : void
      {
         _tweenDuration = 1.6;
         _tweenType = "Linear";
         _easeType = "easeOut";
      }
      
      function blurEffect(param1:*, param2:Number, param3:Number, param4:* = 3) : *
      {
         param4 = this._blurQuality;
         var _loc5_:BlurFilter = new BlurFilter(param2,param3,param4);
         var _loc6_:Array = new Array();
         _loc6_.push(_loc5_);
         param1.filters = _loc6_;
      }
      
      protected function clearProperties() : void
      {
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
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
                  TweenLite.killTweensOf(_loc4_,false);
                  if(_loc4_.bitmap is Sprite)
                  {
                     if(this.component.targetOwner.contains(_loc4_.bitmap))
                     {
                        this.component.targetOwner.removeChild(_loc4_.bitmap);
                     }
                  }
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
      
      protected function startTransition(param1:String) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Array = null;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         var _loc8_:* = undefined;
         tweensFinished = 0;
         endEvent = false;
         transitionType = param1;
         var _loc4_:Object = JFETPreset.getAliasPreset(this.preset);
         this.component.drawTextTable(_loc4_.splitter,this.partialGroup,this.partialPercent,this.selectedStrings,this.partialStart,this.partialBlurAmount);
         _loc2_ = this.component.absMatrix;
         presetObject = JFETPreset.getPresetsArray(_loc4_.preset,_loc2_);
         _loc3_ = presetObject.timeMatrix;
         maxItems = this.component.textTable.childs.length;
         if(presetObject.maxItems > 1)
         {
            _loc6_ = Math.max((this.tweenDuration - this.groupDuration) / (presetObject.maxItems - 1),0);
         }
         else
         {
            _loc6_ = 0;
         }
         var _loc5_:* = 0;
         while(_loc5_ < _loc3_.length)
         {
            _loc7_ = 0;
            while(_loc7_ < _loc3_[_loc5_].length)
            {
               _loc8_ = _loc2_[_loc5_][_loc7_];
               startTween(_loc8_,_loc3_[_loc5_][_loc7_] * _loc6_);
               _loc7_++;
            }
            _loc5_++;
         }
      }
      
      public function get blurQuality() : Number
      {
         return this._blurQuality;
      }
      
      public function get preset() : Number
      {
         return this._preset;
      }
      
      private function createMasks(param1:*) : *
      {
         param1.bitmap = new Sprite();
         param1.rect1 = new Sprite();
         param1.rect2 = new Sprite();
         param1.rect3 = new Sprite();
         param1.bitmap.addChild(param1.rect1);
         param1.bitmap.addChild(param1.rect2);
         param1.bitmap.addChild(param1.rect3);
         param1.rect1.graphics.beginFill(16711680,0);
         param1.rect1.graphics.drawRect(0,0,1,1);
         param1.rect2.graphics.beginFill(16711680,0);
         param1.rect2.graphics.drawRect(0,0,1,1);
         param1.rect3.graphics.beginFill(16711680,0);
         param1.rect3.graphics.drawRect(0,0,1,1);
         this.component.targetOwner.addChild(param1.bitmap);
      }
      
      function motionChangeBlur(param1:*) : *
      {
         var _loc2_:* = Math.min((1 - param1.prop) * blurAmount,100);
         blurEffect(param1,_loc2_,_loc2_);
      }
      
      public function get blurAmount() : Number
      {
         return this._blurAmount;
      }
      
      public function get alphaPercentage() : Number
      {
         return this._alphaPercentage;
      }
      
      private function startTween(param1:Object, param2:Number) : *
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:* = undefined;
         createMasks(param1);
         if(transitionType == "show")
         {
            param1.visible = false;
            _loc3_ = this.target.alpha;
            param1.alpha = 0;
            _loc4_ = param2;
            param1.prop = 0;
            _loc5_ = 1;
         }
         else
         {
            _loc3_ = 0;
            param1.alpha = this.target.alpha;
            _loc4_ = param2 + this.groupDuration - this.groupDuration * this.alphaPercentage / 100;
            param1.prop = 1;
            _loc5_ = 0;
         }
         TweenLite.to(param1,this.groupDuration,{
            "prop":_loc5_,
            "overwrite":true,
            "delay":param2,
            "ease":this.easeFunc,
            "onComplete":motionFinish,
            "onCompleteParams":[param1],
            "onUpdateParams":[param1],
            "onUpdate":motionChange
         });
         TweenLite.to(param1,this.groupDuration * this.alphaPercentage / 100,{
            "alpha":_loc3_,
            "overwrite":false,
            "delay":_loc4_
         });
      }
      
      public function set groupDuration(param1:Number) : void
      {
         if(param1 < 0.001)
         {
            param1 = 0.001;
         }
         this._groupDuration = param1;
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
         if(param1 < 0)
         {
            param1 = 0;
         }
         this._blurAmount = param1;
      }
      
      override public function show() : void
      {
         if(this.component != null)
         {
            this.startTransition("show");
         }
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
      
      public function set preset(param1:Number) : void
      {
         if(param1 <= 0)
         {
            param1 = 1;
         }
         this._preset = param1;
      }
   }
}
