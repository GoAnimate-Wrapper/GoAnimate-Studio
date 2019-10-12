package com.jumpeye.flashEff2.text.chaotic
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.display.JSprite;
   import com.jumpeye.effects.JChaoticDistort;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffText;
   import com.jumpeye.flashEff2.text.patternsPresets.JFERandomPreset;
   import com.jumpeye.flashEff2.text.patternsPresets.JFETPreset;
   import com.jumpeye.transitions.TweenLite;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   
   public class FETChaotic extends IFlashEffText
   {
       
      
      private var _vibrations:Number = 3;
      
      private var _scaleAmount:Number = 0.1;
      
      private var _blurAmount:Number = 20;
      
      private var _blurQuality:Number = 3;
      
      private var intervalArr:Array;
      
      private var _preset:Number = 1;
      
      private var prop:Number = 0;
      
      private var transitionType:String;
      
      protected var owner:Object;
      
      private var _groupDuration:Number = 1;
      
      private var outTime = 0.2;
      
      public function FETChaotic(param1:JUIComponent = null)
      {
         super();
         this.component = param1;
         this.init();
      }
      
      public function get scaleAmount() : Number
      {
         return _scaleAmount;
      }
      
      public function set scaleAmount(param1:Number) : void
      {
         if(isNaN(Number(param1)))
         {
            param1 = 0.1;
         }
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 > 10)
         {
            param1 = 10;
         }
         this._scaleAmount = param1;
      }
      
      public function set vibrations(param1:Number) : void
      {
         if(isNaN(Number(param1)))
         {
            param1 = 3;
         }
         param1 = Math.max(2,param1);
         this._vibrations = param1;
      }
      
      protected function init() : void
      {
         _tweenDuration = 1.5;
         _tweenType = "Quadratic";
         _easeType = "easeOut";
         this.owner = {};
      }
      
      override public function hide() : void
      {
         if(this.component != null)
         {
            this.startTransition(false);
         }
      }
      
      private function makeBlurVibe(param1:*, param2:*, param3:*) : *
      {
         param1.vibe++;
         clearInterval(param1.inte);
         var _loc4_:* = randRange(-100,100);
         if(intervalArr[param1.vibe] == undefined)
         {
            param1.distort.minScaleX = 1;
            param1.distort.minScaleY = 1;
            _loc4_ = 0;
            param1.fin = true;
         }
         else
         {
            param1.distort.maxSkewY = randRange(-100,100);
            param1.distort.maxSkewX = randRange(-100,100);
         }
         if(intervalArr[param1.vibe - 1] != undefined)
         {
            TweenLite.to(param1.distort,intervalArr[param1.vibe - 1] / 1000,{
               "value":_loc4_,
               "delay":0,
               "ease":this.easeFunc,
               "overwrite":false
            });
         }
         if(param1.vibe < vibrations + 1)
         {
            param1.inte = setInterval(makeBlurVibe,intervalArr[param1.vibe - 1],param1,param2,param3);
         }
      }
      
      override public function remove() : void
      {
         this.clearProperties();
      }
      
      public function set preset(param1:Number) : void
      {
         this._preset = param1;
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
         intervalArr = [];
         transitionType = !!param1?"show":"hide";
         var _loc8_:Number = Number(Number(this.preset)) || Number(1);
         var _loc9_:String = "chars";
         if(Number(_loc8_) > 25)
         {
            _loc8_ = 1;
         }
         _loc8_ = Math.max(1,_loc8_);
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
         owner.delay = owner.delay * 1000;
         component.targetOwner.scaleX = component.target.scaleX;
         component.targetOwner.scaleY = component.target.scaleY;
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
               _loc11_.clip.__x = _loc11_.clip.x;
               _loc11_.clip.__y = _loc11_.clip.y;
               _loc11_.clip.__parent = _loc11_.clip.parent;
               owner["clip" + _loc6_ + "_" + _loc7_] = new JSprite();
               owner["clip" + _loc6_ + "_" + _loc7_].__aliasParent = _loc11_.clip.parent;
               owner["clip" + _loc6_ + "_" + _loc7_].alias = _loc11_.clip;
               owner["clip" + _loc6_ + "_" + _loc7_].addChild(_loc11_.clip);
               _loc11_.clip["face"] = owner["clip" + _loc6_ + "_" + _loc7_];
               component.targetOwner.addChild(_loc11_.clip["face"]);
               _loc11_.clip.x = -_loc11_.clip.width / 2;
               _loc11_.clip.y = -_loc11_.clip.height / 2;
               owner["clip" + _loc6_ + "_" + _loc7_].x = _loc11_.clip.__x + _loc11_.clip.width / 2;
               owner["clip" + _loc6_ + "_" + _loc7_].y = _loc11_.clip.__y + _loc11_.clip.height / 2;
               owner["clip" + _loc6_ + "_" + _loc7_].alpha = transitionType == "show"?0:1;
               owner["clip" + _loc6_ + "_" + _loc7_].__x = owner["clip" + _loc6_ + "_" + _loc7_].x;
               owner["clip" + _loc6_ + "_" + _loc7_].__y = owner["clip" + _loc6_ + "_" + _loc7_].y;
               owner["clip" + _loc6_ + "_" + _loc7_].distort = new JChaoticDistort(owner["clip" + _loc6_ + "_" + _loc7_],10,3,scaleAmount,100,100,blurAmount);
               owner["clip" + _loc6_ + "_" + _loc7_].vibe = 0;
               owner["clip" + _loc6_ + "_" + _loc7_].fin = false;
               owner["clip" + _loc6_ + "_" + _loc7_].vibeEff = getParity(vibrations) == true?1:0;
               owner["clipInterval" + _loc6_ + "_" + _loc7_] = setInterval(startTween,_loc4_[_loc6_][_loc7_] * owner.delay,owner["clip" + _loc6_ + "_" + _loc7_],_loc6_,_loc7_);
               _loc7_++;
            }
            _loc6_++;
         }
         owner["tweeno"] = {};
         owner["tweeno"].position = 0;
         TweenLite.to(owner["tweeno"],tweenDuration,{
            "position":100,
            "delay":0,
            "onComplete":hdlFinishedTween,
            "ease":this.easeFunc,
            "overwrite":true
         });
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
      
      public function get blurQuality() : Number
      {
         return this._blurQuality;
      }
      
      public function get preset() : Number
      {
         return this._preset;
      }
      
      public function get vibrations() : Number
      {
         return _vibrations;
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
            TweenLite.killTweensOf(owner["tweeno"],false);
         }
         if(this.component != null)
         {
            component.targetOwner.scaleX = 1;
            component.targetOwner.scaleY = 1;
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
                     if(owner["clip" + _loc3_ + "_" + _loc4_])
                     {
                        clearInterval(owner["clip" + _loc3_ + "_" + _loc4_].inte);
                        delete owner["clip" + _loc3_ + "_" + _loc4_].inte;
                        TweenLite.killTweensOf(owner["clip" + _loc3_ + "_" + _loc4_].distort,false);
                        TweenLite.killTweensOf(owner["clip" + _loc3_ + "_" + _loc4_],false);
                        if(component.targetOwner.contains(owner["clip" + _loc3_ + "_" + _loc4_]))
                        {
                           _loc6_.clip = owner["clip" + _loc3_ + "_" + _loc4_].getChildAt(0);
                           owner["clip" + _loc3_ + "_" + _loc4_].__aliasParent.addChild(_loc6_.clip);
                           if(owner["clip" + _loc3_ + "_" + _loc4_]["distortTween"])
                           {
                              owner["clip" + _loc3_ + "_" + _loc4_]["distortTween"].stop();
                           }
                           component.targetOwner.removeChild(owner["clip" + _loc3_ + "_" + _loc4_]);
                           _loc6_.clip.x = _loc6_.clip.__x;
                           _loc6_.clip.y = _loc6_.clip.__y;
                           _loc6_.clip.visible = transitionType == "show";
                        }
                     }
                     if(owner["tweenAlpha" + _loc3_ + "_" + _loc4_])
                     {
                        owner["tweenAlpha" + _loc3_ + "_" + _loc4_].stop();
                     }
                     if(owner["tweenFilter" + _loc3_ + "_" + _loc4_])
                     {
                        owner["tweenFilter" + _loc3_ + "_" + _loc4_].stop();
                     }
                     if(owner["clipInterval" + _loc3_ + "_" + _loc4_])
                     {
                        clearInterval(owner["clipInterval" + _loc3_ + "_" + _loc4_]);
                        delete owner["clipInterval" + _loc3_ + "_" + _loc4_];
                     }
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
      
      private function randRange(param1:Number, param2:Number) : Number
      {
         var _loc3_:Number = Math.floor(Math.random() * (param2 - param1 + 1)) + param1;
         return _loc3_;
      }
      
      private function startTween(param1:*, param2:*, param3:*) : *
      {
         var _loc8_:* = undefined;
         clearInterval(owner["clipInterval" + param2 + "_" + param3]);
         var _loc4_:* = {};
         _loc4_.clip = param1;
         _loc4_.i = param2;
         _loc4_.j = param3;
         var _loc5_:* = this.groupDuration * 1000;
         var _loc6_:* = vibrations + 1;
         var _loc7_:* = 0;
         _loc8_ = 2 * (_loc5_ - 2 * _loc7_) / (_loc6_ * (_loc6_ - 1));
         intervalArr[0] = 0;
         var _loc9_:* = 0;
         while(_loc9_ < _loc6_ - 1)
         {
            intervalArr[_loc9_ + 1] = intervalArr[_loc9_] + _loc8_;
            _loc9_++;
         }
         intervalArr.shift();
         intervalArr = JFERandomPreset.randomArray(intervalArr);
         makeBlurVibe(param1,param2,param3);
         var _loc10_:* = transitionType == "show"?0:this.groupDuration * (1 - outTime);
         var _loc11_:* = transitionType == "show"?1:0;
         TweenLite.to(owner["clip" + param2 + "_" + param3],this.groupDuration * outTime,{
            "alpha":_loc11_,
            "delay":_loc10_,
            "overwrite":false
         });
      }
      
      private function getParity(param1:*) : Boolean
      {
         var _loc2_:* = false;
         var _loc3_:* = param1 / 2;
         var _loc4_:* = _loc3_ - Math.floor(_loc3_);
         _loc2_ = _loc4_ == 0;
         return _loc2_;
      }
      
      private function hdlFinishedTween() : *
      {
         this.clearProperties();
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
      }
      
      public function get blurAmount() : Number
      {
         return _blurAmount;
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
      
      public function set blurAmount(param1:Number) : void
      {
         if(isNaN(Number(param1)))
         {
            param1 = 20;
         }
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 > 100)
         {
            param1 = 100;
         }
         this._blurAmount = param1;
      }
   }
}
