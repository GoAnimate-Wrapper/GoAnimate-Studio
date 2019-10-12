package com.jumpeye.flashEff2.text.slideBounce
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.display.JSprite;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffText;
   import com.jumpeye.flashEff2.text.patternsPresets.JFETPreset;
   import com.jumpeye.transitions.TweenLite;
   import flash.filters.BitmapFilter;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.BlurFilter;
   
   public class FETSlideBounce extends IFlashEffText
   {
       
      
      private var _alphaPercentageDuration:Number = 0.5;
      
      private var ptRIn;
      
      private var _positionDifferenceY:Number = 0;
      
      private var _positionDifferenceX:Number = -100;
      
      private var ptROut;
      
      private var transitionType:String;
      
      private var _groupDuration:Number = 1;
      
      protected var owner:Object;
      
      private var _blurAmount:Number = 30;
      
      private var ptR;
      
      private var ptX;
      
      private var _bouncePercentageDuration:Number = 50;
      
      private var _blurQuality:Number = 2;
      
      private var angle:Number;
      
      private var prop:Number = 0;
      
      private var _bounceAngle:Number = -15;
      
      private var _preset:Number = 32;
      
      public function FETSlideBounce(param1:JUIComponent = null)
      {
         super();
         this.component = param1;
         this.init();
      }
      
      override public function remove() : void
      {
         this.clearProperties();
      }
      
      protected function init() : void
      {
         _tweenDuration = 1.6;
         _tweenType = "Bounce";
         _easeType = "easeInOut";
         this.owner = {};
      }
      
      public function set alphaPercentageDuration(param1:Number) : void
      {
         if(isNaN(Number(param1)))
         {
            param1 = 50;
         }
         if(param1 < 1)
         {
            param1 = 1;
         }
         if(param1 > 99)
         {
            param1 = 99;
         }
         param1 = 100 - param1;
         this._alphaPercentageDuration = param1 / 100;
      }
      
      public function get blurAmount() : Number
      {
         return _blurAmount;
      }
      
      public function set positionDifferenceX(param1:Number) : void
      {
         this._positionDifferenceX = param1;
      }
      
      public function set positionDifferenceY(param1:Number) : void
      {
         this._positionDifferenceY = param1;
      }
      
      private function randRange(param1:Number, param2:Number) : Number
      {
         var _loc3_:Number = Math.floor(Math.random() * (param2 - param1 + 1)) + param1;
         return _loc3_;
      }
      
      public function get bounceAngle() : Number
      {
         return _bounceAngle;
      }
      
      public function get groupDuration() : Number
      {
         return this._groupDuration;
      }
      
      private function countTransitions() : *
      {
      }
      
      public function set preset(param1:Number) : void
      {
         this._preset = param1;
      }
      
      public function set blurAmount(param1:Number) : void
      {
         if(isNaN(Number(param1)))
         {
            param1 = 30;
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
      
      private function hdlChangeBlur(param1:*, param2:*, param3:*) : *
      {
         var _loc4_:* = param3.w;
         var _loc5_:* = param1.filters;
         var _loc6_:* = getBlur(param2,_loc4_);
         param1.filters = [_loc6_];
      }
      
      override public function hide() : void
      {
         if(this.component != null)
         {
            this.startTransition(false);
         }
      }
      
      public function get alphaPercentageDuration() : Number
      {
         return _alphaPercentageDuration;
      }
      
      private function moveMe(param1:*, param2:*, param3:*, param4:*, param5:*, param6:*, param7:* = false, param8:* = null) : *
      {
         var _loc9_:* = param5 - param4;
         if(!param7)
         {
            param1[param2] = param4 + param3 * (_loc9_ / (param6 / 100)) / 100;
         }
         else
         {
            param7 = param4 + param3 * (_loc9_ / (param6 / 100)) / 100;
            hdlChangeBlur(param1,param7,param8);
         }
      }
      
      public function get positionDifferenceX() : Number
      {
         return this._positionDifferenceX;
      }
      
      public function get positionDifferenceY() : Number
      {
         return this._positionDifferenceY;
      }
      
      public function set bounceAngle(param1:Number) : void
      {
         if(isNaN(Number(param1)))
         {
            param1 = 25;
         }
         this._bounceAngle = param1;
      }
      
      protected function startTransition(param1:Boolean = true) : void
      {
         var _loc2_:Array = null;
         var _loc3_:uint = 0;
         var _loc4_:Array = null;
         var _loc5_:Object = null;
         var _loc6_:* = undefined;
         var _loc7_:uint = 0;
         var _loc9_:String = null;
         var _loc10_:uint = 0;
         var _loc11_:Object = null;
         var _loc12_:* = undefined;
         var _loc13_:* = undefined;
         var _loc14_:* = undefined;
         var _loc15_:* = undefined;
         var _loc16_:* = undefined;
         ptR = bouncePercentageDuration;
         ptX = 100 - ptR;
         ptRIn = 10;
         ptROut = 90;
         ptRIn = ptRIn / 100 * ptR;
         ptROut = ptROut / 100 * ptR;
         angle = bounceAngle;
         var _loc8_:Number = Number(Number(this.preset)) || Number(9);
         if(Number(_loc8_) > 50)
         {
            _loc8_ = 9;
         }
         _loc8_ = Math.max(1,_loc8_);
         _loc9_ = _loc8_ < 26?"chars":"words";
         _loc8_ = _loc8_ > 26?Number(_loc8_ - 25):Number(_loc8_);
         transitionType = !!param1?"show":"hide";
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
               _loc11_.clip.__x = _loc11_.clip.x;
               _loc11_.clip.__y = _loc11_.clip.y;
               _loc11_.clip.__parent = _loc11_.clip.parent;
               owner["clip" + _loc6_ + "_" + _loc7_] = new JSprite();
               owner["clip" + _loc6_ + "_" + _loc7_].__aliasParent = _loc11_.clip.parent;
               owner["clip" + _loc6_ + "_" + _loc7_].sx = positionDifferenceX == 0?-1:-(positionDifferenceX / Math.abs(positionDifferenceX));
               owner["clip" + _loc6_ + "_" + _loc7_].sy = positionDifferenceY == 0?1:positionDifferenceY / Math.abs(positionDifferenceY);
               owner["clip" + _loc6_ + "_" + _loc7_].alias = _loc11_.clip;
               owner["clip" + _loc6_ + "_" + _loc7_].addChild(_loc11_.clip);
               _loc11_.clip.face = owner["clip" + _loc6_ + "_" + _loc7_];
               component.targetOwner.addChild(owner["clip" + _loc6_ + "_" + _loc7_]);
               switch(owner["clip" + _loc6_ + "_" + _loc7_].sx)
               {
                  case 1:
                     _loc11_.clip.x = -_loc11_.clip.width;
                     owner["clip" + _loc6_ + "_" + _loc7_].x = _loc11_.clip.__x + _loc11_.clip.width;
                     break;
                  case -1:
                     _loc11_.clip.x = 0;
                     owner["clip" + _loc6_ + "_" + _loc7_].x = _loc11_.clip.__x;
               }
               switch(owner["clip" + _loc6_ + "_" + _loc7_].sy)
               {
                  case 1:
                     _loc11_.clip.y = -_loc11_.clip.height;
                     owner["clip" + _loc6_ + "_" + _loc7_].y = _loc11_.clip.__y + _loc11_.clip.height;
                     break;
                  case -1:
                     _loc11_.clip.y = 0;
                     owner["clip" + _loc6_ + "_" + _loc7_].y = _loc11_.clip.__y;
               }
               owner["clip" + _loc6_ + "_" + _loc7_].jumpX = owner["clip" + _loc6_ + "_" + _loc7_].width / 2;
               owner["clip" + _loc6_ + "_" + _loc7_].jumpY = -owner["clip" + _loc6_ + "_" + _loc7_].height / 2;
               owner["clip" + _loc6_ + "_" + _loc7_].alpha = transitionType == "show"?0:1;
               owner["clip" + _loc6_ + "_" + _loc7_].__x = owner["clip" + _loc6_ + "_" + _loc7_].x;
               owner["clip" + _loc6_ + "_" + _loc7_].__y = owner["clip" + _loc6_ + "_" + _loc7_].y;
               owner["clip" + _loc6_ + "_" + _loc7_].__xf = owner["clip" + _loc6_ + "_" + _loc7_].x + positionDifferenceX;
               owner["clip" + _loc6_ + "_" + _loc7_].__yf = owner["clip" + _loc6_ + "_" + _loc7_].y + positionDifferenceY;
               owner["clip" + _loc6_ + "_" + _loc7_].tweenX = true;
               owner["clip" + _loc6_ + "_" + _loc7_].tweenY = true;
               owner["clip" + _loc6_ + "_" + _loc7_].tweenRot = true;
               if(transitionType == "show")
               {
                  owner["clip" + _loc6_ + "_" + _loc7_].x = owner["clip" + _loc6_ + "_" + _loc7_].__xf;
                  owner["clip" + _loc6_ + "_" + _loc7_].y = owner["clip" + _loc6_ + "_" + _loc7_].__yf;
               }
               owner["tweenAll" + _loc6_ + "_" + _loc7_] = {};
               owner["tweenAll" + _loc6_ + "_" + _loc7_].clip = owner["clip" + _loc6_ + "_" + _loc7_];
               owner["tweenAll" + _loc6_ + "_" + _loc7_].i = _loc6_;
               owner["tweenAll" + _loc6_ + "_" + _loc7_].j = _loc7_;
               owner["tweenAll" + _loc6_ + "_" + _loc7_].initX = owner["clip" + _loc6_ + "_" + _loc7_].__xf;
               owner["tweenAll" + _loc6_ + "_" + _loc7_].finX = owner["clip" + _loc6_ + "_" + _loc7_].__x;
               owner["tweenAll" + _loc6_ + "_" + _loc7_].initY = owner["clip" + _loc6_ + "_" + _loc7_].__yf;
               owner["tweenAll" + _loc6_ + "_" + _loc7_].finY = owner["clip" + _loc6_ + "_" + _loc7_].__y;
               owner["tweenAll" + _loc6_ + "_" + _loc7_].initRotIn = 0;
               owner["tweenAll" + _loc6_ + "_" + _loc7_].finRotIn = angle;
               owner["tweenAll" + _loc6_ + "_" + _loc7_].initRotOut = angle;
               owner["tweenAll" + _loc6_ + "_" + _loc7_].finRotOut = 0;
               owner["tweenAll" + _loc6_ + "_" + _loc7_].initJXIn = owner["clip" + _loc6_ + "_" + _loc7_].__x;
               owner["tweenAll" + _loc6_ + "_" + _loc7_].finJXIn = owner["clip" + _loc6_ + "_" + _loc7_].__x + owner["clip" + _loc6_ + "_" + _loc7_].sx * owner["clip" + _loc6_ + "_" + _loc7_].jumpX;
               owner["tweenAll" + _loc6_ + "_" + _loc7_].initJYIn = owner["clip" + _loc6_ + "_" + _loc7_].__y;
               owner["tweenAll" + _loc6_ + "_" + _loc7_].finJYIn = owner["clip" + _loc6_ + "_" + _loc7_].__y + owner["clip" + _loc6_ + "_" + _loc7_].sy * owner["clip" + _loc6_ + "_" + _loc7_].jumpY;
               owner["tweenAll" + _loc6_ + "_" + _loc7_].initBlur = blurAmount;
               owner["tweenAll" + _loc6_ + "_" + _loc7_].finBlur = 0;
               owner["tweenAll" + _loc6_ + "_" + _loc7_].w = positionDifferenceX != 0?1:0;
               _loc12_ = transitionType == "show"?0:100;
               _loc13_ = transitionType == "show"?100:0;
               _loc14_ = transitionType == "show"?0:1;
               _loc15_ = transitionType == "show"?1:0;
               _loc16_ = transitionType == "show"?0:this.groupDuration * (1 - alphaPercentageDuration);
               owner["clip" + _loc6_ + "_" + _loc7_].alpha = _loc14_;
               TweenLite.to(owner["clip" + _loc6_ + "_" + _loc7_],this.groupDuration * alphaPercentageDuration,{
                  "alpha":_loc15_,
                  "delay":_loc16_ + _loc4_[_loc6_][_loc7_] * owner.delay,
                  "ease":this.easeFunc,
                  "overwrite":false
               });
               owner["tweenAll" + _loc6_ + "_" + _loc7_].position = _loc12_;
               TweenLite.to(owner["tweenAll" + _loc6_ + "_" + _loc7_],this.groupDuration,{
                  "position":_loc13_,
                  "delay":_loc4_[_loc6_][_loc7_] * owner.delay,
                  "onUpdate":hdlTweenChange,
                  "onUpdateParams":[owner["tweenAll" + _loc6_ + "_" + _loc7_]],
                  "onComplete":hdlTweenFinish,
                  "ease":this.easeFunc,
                  "overwrite":false
               });
               _loc7_++;
            }
            _loc6_++;
         }
         owner["tweeno"] = {};
         owner["tweeno"].position = 0;
         TweenLite.to(owner["tweeno"],tweenDuration,{
            "position":100,
            "delay":0,
            "onComplete":hdlTweenFinished,
            "ease":this.easeFunc,
            "overwrite":true
         });
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
      
      private function hdlTweenFinish() : *
      {
         countTransitions();
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
            TweenLite.killTweensOf(owner["tweeno"],false);
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
                     if(owner["tweenAll" + _loc3_ + "_" + _loc4_])
                     {
                        TweenLite.killTweensOf(owner["tweenAll" + _loc3_ + "_" + _loc4_],false);
                     }
                     if(owner["clip" + _loc3_ + "_" + _loc4_])
                     {
                        TweenLite.killTweensOf(owner["clip" + _loc3_ + "_" + _loc4_],false);
                        if(component.targetOwner.contains(owner["clip" + _loc3_ + "_" + _loc4_]))
                        {
                           _loc6_.clip = owner["clip" + _loc3_ + "_" + _loc4_].getChildAt(0);
                           owner["clip" + _loc3_ + "_" + _loc4_].__aliasParent.addChild(_loc6_.clip);
                           component.targetOwner.removeChild(owner["clip" + _loc3_ + "_" + _loc4_]);
                           _loc6_.clip.x = _loc6_.clip.__x;
                           _loc6_.clip.y = _loc6_.clip.__y;
                           _loc6_.clip.visible = transitionType == "show";
                        }
                     }
                     _loc4_++;
                  }
                  _loc3_++;
               }
            }
            delete owner.elements;
         }
      }
      
      private function getBlur(param1:*, param2:uint = 1) : BitmapFilter
      {
         var _loc3_:Number = param2 == 1?Number(param1):Number(0);
         var _loc4_:Number = param2 == 1?Number(0):Number(param1);
         return new BlurFilter(_loc3_,_loc4_,BitmapFilterQuality.HIGH);
      }
      
      private function getParity(param1:*) : Boolean
      {
         var _loc2_:* = false;
         var _loc3_:* = param1 / 2;
         var _loc4_:* = _loc3_ - Math.floor(_loc3_);
         _loc2_ = _loc4_ == 0;
         return _loc2_;
      }
      
      private function hdlTweenChange(param1:*) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:* = param1.position;
         var _loc7_:* = param1.clip;
         var _loc8_:* = param1.initX;
         var _loc9_:* = param1.finX;
         var _loc10_:* = param1.initY;
         var _loc11_:* = param1.finY;
         var _loc12_:* = param1.initRotIn;
         var _loc13_:* = param1.finRotIn;
         var _loc14_:* = param1.initRotOut;
         var _loc15_:* = param1.finRotOut;
         var _loc16_:* = param1.initJXIn;
         var _loc17_:* = param1.finJXIn;
         var _loc18_:* = param1.initJYIn;
         var _loc19_:* = param1.finJYIn;
         var _loc20_:* = param1.initBlur;
         var _loc21_:* = param1.finBlur;
         if(_loc6_ <= ptX)
         {
            _loc2_ = _loc6_;
            moveMe(_loc7_,"x",_loc2_,_loc8_,_loc9_,ptX);
            moveMe(_loc7_,"y",_loc2_,_loc10_,_loc11_,ptX);
            moveMe(_loc7_,"blur",_loc2_,_loc20_,_loc21_,ptX,true,param1);
            _loc7_.rotation = 0;
         }
         else
         {
            _loc2_ = ptX;
            if(_loc7_.tweenX)
            {
               moveMe(_loc7_,"x",_loc2_,_loc8_,_loc9_,ptX);
               moveMe(_loc7_,"y",_loc2_,_loc10_,_loc11_,ptX);
               moveMe(_loc7_,"blur",_loc2_,_loc20_,_loc21_,ptX,true,param1);
            }
            _loc7_.filters = [];
            _loc7_.tweenX = false;
            if(_loc6_ <= ptX + ptRIn)
            {
               _loc4_ = _loc6_ - ptX;
               moveMe(_loc7_,"rotation",_loc4_,_loc12_,_loc13_,ptRIn);
               moveMe(_loc7_,"x",_loc4_,_loc16_,_loc17_,ptRIn);
               moveMe(_loc7_,"y",_loc4_,_loc18_,_loc19_,ptRIn);
            }
            else
            {
               _loc4_ = ptX + ptRIn;
               if(_loc7_.tweenRot)
               {
                  _loc7_.tweenRot = false;
                  moveMe(_loc7_,"rotation",_loc4_,_loc12_,_loc13_,ptRIn);
                  moveMe(_loc7_,"x",_loc4_,_loc16_,_loc17_,ptRIn);
                  moveMe(_loc7_,"y",_loc4_,_loc18_,_loc19_,ptRIn);
               }
               _loc5_ = _loc6_ - ptX - ptRIn;
               moveMe(_loc7_,"rotation",_loc5_,_loc14_,_loc15_,ptROut);
               moveMe(_loc7_,"x",_loc5_,_loc17_,_loc16_,ptROut);
               moveMe(_loc7_,"y",_loc5_,_loc19_,_loc18_,ptROut);
            }
         }
      }
      
      public function set groupDuration(param1:Number) : void
      {
         if(param1 < 0.001)
         {
            param1 = 0.001;
         }
         this._groupDuration = Number(Number(param1)) || Number(1);
      }
      
      public function set bouncePercentageDuration(param1:Number) : void
      {
         if(isNaN(Number(param1)))
         {
            param1 = 50;
         }
         if(param1 < 1)
         {
            param1 = 1;
         }
         if(param1 > 99)
         {
            param1 = 99;
         }
         this._bouncePercentageDuration = param1;
      }
      
      private function hdlTweenFinished() : *
      {
         clearProperties();
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
      }
      
      public function get bouncePercentageDuration() : Number
      {
         return _bouncePercentageDuration;
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
