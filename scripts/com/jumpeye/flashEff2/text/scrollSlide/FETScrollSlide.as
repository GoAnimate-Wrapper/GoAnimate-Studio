package com.jumpeye.flashEff2.text.scrollSlide
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffText;
   import com.jumpeye.flashEff2.text.patternsPresets.JFETPreset;
   import com.jumpeye.transitions.TweenLite;
   import flash.display.Sprite;
   
   public class FETScrollSlide extends IFlashEffText
   {
       
      
      private var newDelay:Number;
      
      private var _preset:Number = 40;
      
      private var _alphaPercentage:Number = 100;
      
      private var _blurQuality:Number = 2;
      
      private var prop:Number = 0;
      
      private var _startPosition:Number = 1;
      
      private var timeMatrix:Array;
      
      protected var owner:Object;
      
      private var _groupDuration:Number = 1;
      
      public function FETScrollSlide(param1:JUIComponent = null)
      {
         super();
         this.component = param1;
         this.init();
      }
      
      public function get groupDuration() : Number
      {
         return this._groupDuration;
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
      
      protected function coordonateMask(param1:Object, param2:Sprite, param3:Number) : *
      {
         param2.x = param1.finalmaskx - (param1.finalmaskx - param1.startmaskx) * Math.abs(param3);
      }
      
      protected function init() : void
      {
         _tweenDuration = 1.6;
         _tweenType = "Strong";
         _easeType = "easeInOut";
         this.owner = {};
      }
      
      protected function createRectangle(param1:Sprite, param2:*, param3:*) : *
      {
         var clip:Sprite = param1;
         var _wid:* = param2;
         var _hei:* = param3;
         with(clip.graphics)
         {
            
            beginFill(16711680);
            drawRect(0,0,_wid,_hei);
            endFill();
         }
      }
      
      protected function coordonateTween(param1:Object, param2:Sprite, param3:Number) : *
      {
         param2.x = param1.finalx - (param1.finalx - param1.startx) * Math.abs(param3);
      }
      
      private function motionChange(param1:Object, param2:Sprite, param3:Sprite) : *
      {
         coordonateTween(param1,param2,param1.pos);
         coordonateMask(param1,param3,param1.pos);
      }
      
      public function set startPosition(param1:Number) : void
      {
         if(isNaN(Number(param1)))
         {
            param1 = 1;
         }
         if(param1 < 0)
         {
            param1 = 1;
         }
         if(param1 > 4)
         {
            param1 = 4;
         }
         this._startPosition = param1;
      }
      
      protected function startTransition(param1:Boolean = true) : void
      {
         var _loc2_:Array = null;
         var _loc3_:uint = 0;
         var _loc4_:Object = null;
         var _loc5_:* = undefined;
         var _loc6_:uint = 0;
         var _loc10_:uint = 0;
         var _loc11_:Object = null;
         var _loc7_:Object = JFETPreset.getAliasPreset(this.preset);
         this.component.drawTextTable(_loc7_.splitter,this.partialGroup,this.partialPercent,this.selectedStrings,this.partialStart,this.partialBlurAmount);
         _loc2_ = this.component.absMatrix;
         _loc4_ = JFETPreset.getPresetsArray(_loc7_.preset,_loc2_);
         timeMatrix = _loc4_.timeMatrix;
         owner.maxItems = _loc4_.maxItems;
         owner.tweensFinished = 0;
         _loc3_ = _loc2_.length;
         var _loc8_:uint = 0;
         var _loc9_:uint = 1;
         owner.timeDirection = 0;
         owner.show = param1;
         if(param1 == true)
         {
            _loc8_ = 1;
            _loc9_ = 0;
            owner.timeDirection = 1;
         }
         owner.tweensNumber = this.component.textTable.childs.length;
         if(owner.maxItems <= 1)
         {
            owner.delay = 0;
         }
         else
         {
            owner.delay = Math.max((this.tweenDuration - this.groupDuration) / (owner.maxItems - 1),0);
         }
         owner.masca = this.component.targetOwner.addChild(new Sprite());
         owner.elements = [];
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc10_ = _loc2_[_loc5_].length;
            owner.elements[_loc5_] = [];
            _loc6_ = 0;
            while(_loc6_ < _loc10_)
            {
               _loc11_ = owner.elements[_loc5_][_loc6_] = {};
               _loc11_.clip = _loc2_[_loc5_][_loc6_];
               _loc11_.clip.alpha = Math.abs(1 - _loc8_);
               createMasca(_loc11_,_loc11_.clip.width,_loc11_.clip.height,param1,_loc5_,_loc6_);
               checkTransitionType(param1,_loc11_);
               TweenLite.to(_loc11_,this._groupDuration,{
                  "pos":prop,
                  "delay":timeMatrix[_loc5_][_loc6_] * owner.delay,
                  "ease":this.easeFunc,
                  "onUpdate":motionChange,
                  "onUpdateParams":[_loc11_,_loc11_.clip,_loc11_.clip2],
                  "onComplete":motionFinish,
                  "onCompleteParams":[_loc11_,_loc11_.clip]
               });
               TweenLite.to(_loc11_.clip,_alphaPercentage * this._groupDuration / 100,{
                  "alpha":Number(param1),
                  "delay":timeMatrix[_loc5_][_loc6_] * owner.delay + newDelay,
                  "overwrite":false
               });
               _loc6_++;
            }
            _loc5_++;
         }
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
      
      private function checkTransitionType(param1:Boolean, param2:Object) : *
      {
         prop = Number(param1);
         if(param1 == false)
         {
            param2.pos = 1;
            newDelay = this._groupDuration - _alphaPercentage * this._groupDuration / 100;
         }
         else
         {
            param2.pos = 0;
            newDelay = 0;
         }
      }
      
      public function get preset() : Number
      {
         return this._preset;
      }
      
      protected function createMasca(param1:Object, param2:*, param3:*, param4:Boolean, param5:*, param6:*) : *
      {
         param1.clip2 = param1["masca" + timeMatrix[param5][param6]];
         param1.clip2 = owner.masca.addChild(new Sprite());
         createRectangle(param1.clip2,param2,param3);
         param1.clip.mask = param1.clip2;
         param1.clip2.alpha = 0.5;
         owner.bounds = param1.clip.getBounds(param1.clip);
         if(param4 == true)
         {
            param1.clip2.y = param1.clip.y + owner.bounds.y;
            param1.clip2.x = param1.clip.x + owner.bounds.x - param2 / 2;
         }
         else
         {
            param1.clip2.y = param1.clip.y + owner.bounds.y;
            param1.clip2.x = param1.clip.x + owner.bounds.x;
         }
         param1.startx = param1.clip.x;
         param1.startmaskx = param1.clip.x + owner.bounds.x;
         if(_startPosition == 1)
         {
            param1.finalx = param1.clip.x + param2 / 2 + owner.bounds.x;
            param1.finalmaskx = param1.clip.x - param2 / 2 + owner.bounds.x;
         }
         else if(_startPosition == 2)
         {
            param1.finalx = param1.clip.x - param2 / 2 + owner.bounds.x;
            param1.finalmaskx = param1.clip.x + param2 / 2 + owner.bounds.x;
         }
         else if(_startPosition == 3)
         {
            param1.finalx = param1.clip.x + param2 + owner.bounds.x;
            param1.finalmaskx = param1.clip.x + owner.bounds.x;
         }
         else
         {
            param1.finalx = param1.clip.x - param2 + owner.bounds.x;
            param1.finalmaskx = param1.clip.x + owner.bounds.x;
         }
      }
      
      public function get alphaPercentage() : Number
      {
         return this._alphaPercentage;
      }
      
      private function motionFinish(param1:Object, param2:Sprite) : *
      {
         param1.clip.filters = [];
         if(show == false)
         {
            param1.clip.visible = false;
         }
         owner.tweensFinished++;
         if(owner.tweensNumber == owner.tweensFinished)
         {
            this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
         }
      }
      
      public function get startPosition() : Number
      {
         return this._startPosition;
      }
      
      public function set groupDuration(param1:Number) : void
      {
         if(param1 < 0.001)
         {
            param1 = 0.001;
         }
         this._groupDuration = Number(Number(param1)) || Number(1);
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
            if(owner.masca is Sprite)
            {
               this.component.targetOwner.removeChild(owner.masca);
               delete owner.masca;
            }
         }
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
                  _loc4_++;
               }
               _loc3_++;
            }
         }
         delete owner.elements;
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
      
      public function set blurQuality(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         this._blurQuality = Number(Number(param1)) || Number(1);
      }
      
      public function get blurQuality() : Number
      {
         return this._blurQuality;
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
