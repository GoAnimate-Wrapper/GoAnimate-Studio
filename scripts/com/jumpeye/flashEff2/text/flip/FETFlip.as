package com.jumpeye.flashEff2.text.flip
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffText;
   import com.jumpeye.flashEff2.text.patternsPresets.JFETPreset;
   import com.jumpeye.flashEff2.utils.distort.JDistortImage;
   import com.jumpeye.transitions.TweenLite;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.filters.BlurFilter;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class FETFlip extends IFlashEffText
   {
       
      
      private var _axis:String = "vertical";
      
      private var tweensFinished:Number = 0;
      
      private var _focalDistance:Number = 100;
      
      private var presetObject:Object;
      
      private var _preset:Number = 19;
      
      private var tweenArray:Array;
      
      private var transitionType:String;
      
      private var _groupDuration:Number = 1.1;
      
      private var maxItems:Number;
      
      private var _blurAmount:Number = 0;
      
      private var owner:Object;
      
      private var _smooth:Boolean = true;
      
      private var blX:Number;
      
      private var blY:Number;
      
      private var _blurQuality:Number = 2;
      
      private var _alphaPercentage:Number = 40;
      
      protected var endEvent:Boolean = false;
      
      public function FETFlip(param1:JUIComponent = null)
      {
         owner = {};
         presetObject = {};
         transitionType = new String();
         tweenArray = new Array();
         super();
         this.component = param1;
         this.init();
      }
      
      override public function remove() : void
      {
         if(component)
         {
            this.clearProperties();
         }
      }
      
      protected function init() : void
      {
         _tweenDuration = 1.5;
         _tweenType = "Strong";
         _easeType = "easeInOut";
      }
      
      private function startTweenWordsLine(param1:Object, param2:Number) : *
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:* = undefined;
         param1.myDelay = param2;
         motionChangeWordsLine(param1);
         if(transitionType == "show")
         {
            param1.propBlur = blurAmount;
            param1.endBlur = 0;
            param1.visible = false;
            _loc3_ = 1;
            param1.mc.alpha = 0;
            _loc4_ = param2;
            param1.prop = 0;
            _loc5_ = 1;
         }
         else
         {
            param1.propBlur = 0;
            param1.endBlur = blurAmount;
            _loc3_ = 0;
            param1.mc.alpha = 1;
            _loc4_ = param2 + this.groupDuration - this.groupDuration * this.alphaPercentage / 100;
            param1.prop = 1;
            _loc5_ = 0;
         }
         if(!param1.lastProp)
         {
            param1.lastProp = param1.prop;
         }
         TweenLite.to(param1.mc,this.groupDuration * this.alphaPercentage / 100,{
            "alpha":_loc3_,
            "overwrite":false,
            "delay":_loc4_
         });
      }
      
      public function get blurQuality() : Number
      {
         return this._blurQuality;
      }
      
      public function get blurAmount() : Number
      {
         return this._blurAmount;
      }
      
      public function get axis() : String
      {
         return this._axis;
      }
      
      function motionChangeBlur(param1:*) : *
      {
         var _loc2_:* = param1.propBlur;
         blurEffect(param1,_loc2_ * blX,_loc2_ * blY);
      }
      
      public function get alphaPercentage() : Number
      {
         return this._alphaPercentage;
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
      
      public function get groupDuration() : Number
      {
         return this._groupDuration;
      }
      
      public function get smooth() : Boolean
      {
         return this._smooth;
      }
      
      public function set blurQuality(param1:Number) : void
      {
         if(param1 <= 0)
         {
            param1 = 1;
         }
         this._blurQuality = param1;
      }
      
      private function startTweenChars(param1:Object, param2:Number) : *
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         var _loc8_:* = undefined;
         if(transitionType == "show")
         {
            param1.propBlur = blurAmount;
            _loc8_ = 0;
            param1.visible = false;
            _loc3_ = 1;
            param1.alpha = 0;
            _loc4_ = param2;
            param1.prop = 0;
            _loc5_ = 1;
            _loc6_ = 1;
            _loc7_ = 1;
            if(axis == "left" || axis == "right" || axis == "vertical")
            {
               blX = 1;
               blY = 0;
               param1.scaleX = 0;
               param1.scaleY = 1;
            }
            else
            {
               blX = 0;
               blY = 1;
               param1.scaleX = 1;
               param1.scaleY = 0;
            }
         }
         else
         {
            param1.propBlur = 0;
            _loc8_ = blurAmount;
            param1.scaleX = 1;
            param1.scaleY = 1;
            if(axis == "left" || axis == "right" || axis == "vertical")
            {
               _loc6_ = 0;
               _loc7_ = 1;
               blX = 1;
               blY = 0;
            }
            else
            {
               _loc6_ = 1;
               _loc7_ = 0;
               blX = 0;
               blY = 1;
            }
            _loc3_ = 0;
            param1.alpha = 1;
            _loc4_ = param2 + this.groupDuration - this.groupDuration * this.alphaPercentage / 100;
            param1.prop = 1;
            _loc5_ = 0;
         }
         if(!param1.lastProp)
         {
            param1.lastProp = param1.prop;
         }
         TweenLite.to(param1,this.groupDuration,{
            "prop":_loc5_,
            "propBlur":_loc8_,
            "scaleX":_loc6_,
            "scaleY":_loc7_,
            "overwrite":true,
            "delay":param2,
            "ease":this.easeFunc,
            "onComplete":motionFinish,
            "onCompleteParams":[param1],
            "onUpdateParams":[param1],
            "onUpdate":motionChangeChars
         });
         TweenLite.to(param1,this.groupDuration * this.alphaPercentage / 100,{
            "alpha":_loc3_,
            "overwrite":false,
            "delay":_loc4_
         });
      }
      
      public function set blurAmount(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         this._blurAmount = param1;
      }
      
      public function set axis(param1:String) : void
      {
         this._axis = param1;
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
            param1 = 1;
         }
         this._preset = param1;
      }
      
      protected function startTransition(param1:String) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Array = null;
         var _loc8_:* = undefined;
         var _loc9_:* = undefined;
         var _loc10_:* = undefined;
         var _loc11_:* = undefined;
         var _loc12_:* = undefined;
         var _loc13_:Point = null;
         tweensFinished = 0;
         endEvent = false;
         transitionType = param1;
         var _loc4_:Object = JFETPreset.getAliasPreset(this.preset);
         var _loc5_:* = _loc4_.splitter;
         this.component.drawTextTable(_loc4_.splitter,this.partialGroup,this.partialPercent,this.selectedStrings,this.partialStart,this.partialBlurAmount);
         _loc2_ = this.component.absMatrix;
         presetObject = JFETPreset.getPresetsArray(_loc4_.preset,_loc2_);
         _loc3_ = presetObject.timeMatrix;
         maxItems = this.component.textTable.childs.length;
         if(presetObject.maxItems > 1)
         {
            _loc8_ = Math.max((this.tweenDuration - this.groupDuration) / (presetObject.maxItems - 1),0);
         }
         else
         {
            _loc8_ = 0;
         }
         var _loc6_:* = this.component.absChars;
         switch(_axis)
         {
            case "up":
               for(_loc9_ in _loc6_)
               {
                  _loc6_[_loc9_].textField.y = -(_loc6_[_loc9_].height - _loc6_[_loc9_].textField.getLineMetrics(0).ascent);
                  _loc6_[_loc9_].y = _loc6_[_loc9_].y + _loc6_[_loc9_].height - _loc6_[_loc9_].textField.getLineMetrics(0).ascent;
               }
               break;
            case "down":
               for(_loc9_ in _loc6_)
               {
                  _loc6_[_loc9_].textField.x = -_loc6_[_loc9_].textField.width;
                  _loc6_[_loc9_].textField.y = -_loc6_[_loc9_].textField.height;
                  _loc6_[_loc9_].x = _loc6_[_loc9_].x + _loc6_[_loc9_].width;
                  _loc6_[_loc9_].y = _loc6_[_loc9_].y + _loc6_[_loc9_].height;
               }
               break;
            case "left":
               break;
            case "right":
               for(_loc9_ in _loc6_)
               {
                  _loc6_[_loc9_].textField.x = -_loc6_[_loc9_].textField.width;
                  _loc6_[_loc9_].textField.y = -_loc6_[_loc9_].textField.height;
                  _loc6_[_loc9_].x = _loc6_[_loc9_].x + _loc6_[_loc9_].width;
                  _loc6_[_loc9_].y = _loc6_[_loc9_].y + _loc6_[_loc9_].height;
               }
               break;
            case "vertical":
               for(_loc9_ in _loc6_)
               {
                  _loc6_[_loc9_].textField.x = -_loc6_[_loc9_].textField.width / 2;
                  _loc6_[_loc9_].textField.y = -_loc6_[_loc9_].textField.height / 2;
                  _loc6_[_loc9_].x = _loc6_[_loc9_].x + _loc6_[_loc9_].width / 2;
                  _loc6_[_loc9_].y = _loc6_[_loc9_].y + _loc6_[_loc9_].height / 2;
               }
               break;
            case "horizontal":
               for(_loc9_ in _loc6_)
               {
                  _loc6_[_loc9_].textField.y = -_loc6_[_loc9_].textField.height / 2;
                  _loc6_[_loc9_].y = _loc6_[_loc9_].y + _loc6_[_loc9_].height / 2;
               }
         }
         if(_loc5_ == "lines" || _loc5_ == "words")
         {
            _loc10_ = "startTweenWordsLine";
         }
         else
         {
            _loc10_ = "startTweenChars";
         }
         owner.groupDuration = groupDuration;
         var _loc7_:* = 0;
         while(_loc7_ < _loc3_.length)
         {
            _loc11_ = 0;
            while(_loc11_ < _loc3_[_loc7_].length)
            {
               _loc12_ = _loc2_[_loc7_][_loc11_];
               _loc13_ = new Point();
               _loc13_ = _loc12_.localToGlobal(_loc13_);
               _loc12_.xInit = _loc13_.x;
               _loc12_.yInit = _loc13_.y;
               this[_loc10_](_loc12_,_loc3_[_loc7_][_loc11_] * _loc8_);
               _loc11_++;
            }
            _loc7_++;
         }
      }
      
      function blurEffect(param1:*, param2:Number, param3:Number, param4:* = 3) : *
      {
         param4 = this._blurQuality;
         var _loc5_:BlurFilter = new BlurFilter(param2,param3,param4);
         var _loc6_:Array = new Array();
         _loc6_.push(_loc5_);
         param1.filters = _loc6_;
      }
      
      public function set smooth(param1:Boolean) : void
      {
         this._smooth = param1;
      }
      
      public function get preset() : Number
      {
         return this._preset;
      }
      
      protected function clearProperties() : void
      {
         var _loc3_:* = undefined;
         var _loc1_:* = this.component.absMatrix;
         var _loc2_:* = 0;
         while(_loc2_ < _loc1_.length)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc1_[_loc2_].length)
            {
               if(_loc1_[_loc2_][_loc3_] is Object)
               {
                  if(_loc1_[_loc2_][_loc3_].Flip)
                  {
                     _loc1_[_loc2_][_loc3_].Flip.clearProperties(_loc1_[_loc2_][_loc3_].mc);
                  }
                  TweenLite.killTweensOf(_loc1_[_loc2_][_loc3_],false);
                  if(_loc1_[_loc2_][_loc3_].mc is MovieClip)
                  {
                     if(_loc1_[_loc2_][_loc3_].mc.texture is BitmapData)
                     {
                        _loc1_[_loc2_][_loc3_].mc.texture.dispose();
                     }
                     if(this.component.targetOwner.contains(_loc1_[_loc2_][_loc3_].mc))
                     {
                        this.component.targetOwner.removeChild(_loc1_[_loc2_][_loc3_].mc);
                     }
                     delete _loc1_[_loc2_][_loc3_].mc;
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
      
      function clearBitmap(param1:*) : *
      {
         var _loc2_:* = param1.mc;
         tweensFinished++;
         _loc2_.texture.dispose();
         this.component.targetOwner.removeChild(_loc2_);
         if(transitionType == "hide")
         {
            param1.visible = false;
         }
         else
         {
            param1.visible = true;
            param1.alpha = 1;
         }
         if(tweensFinished == maxItems)
         {
            endEvent = true;
            remove();
         }
      }
      
      public function set groupDuration(param1:Number) : void
      {
         if(param1 < 0.001)
         {
            param1 = 0.001;
         }
         this._groupDuration = param1;
      }
      
      function motionChangeWordsLine(param1:*) : *
      {
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         param1.mc = new MovieClip();
         param1.mc.myDelay = param1.myDelay;
         this.component.targetOwner.addChild(param1.mc);
         param1.mc.x = param1.x;
         var _loc2_:Rectangle = param1.getBounds(param1);
         param1.mc.y = param1.y + _loc2_.y;
         param1.mc.x = _loc2_.x + param1.x;
         owner.tweenDuration = tweenDuration;
         var _loc3_:* = param1.width;
         var _loc4_:* = param1.height;
         if(_loc3_ != 0)
         {
            param1.mc.texture = new BitmapData(_loc3_,_loc4_,true,13434828);
            _loc5_ = new Matrix();
            _loc5_.tx = -_loc2_.x;
            _loc5_.ty = -_loc2_.y;
            param1.mc.texture.draw(param1,_loc5_);
            _loc6_ = 0;
            _loc7_ = 0;
            switch(axis)
            {
               case "up":
                  blX = 0;
                  blY = 1;
                  param1.mc.x = param1.mc.x + param1.width / 2;
                  param1.prspPara = param1.height;
                  owner.flipOrientation = "Vertical";
                  if(transitionType == "show")
                  {
                     owner.ori = -1;
                     _loc6_ = Math.PI / 2;
                     _loc7_ = 0;
                  }
                  else
                  {
                     param1.visible = false;
                     owner.ori = 1;
                  }
                  param1.mc.pointArray = [[-_loc3_ / 2,0],[_loc3_ / 2,0],[_loc3_ / 2,_loc4_],[-_loc3_ / 2,_loc4_]];
                  break;
               case "down":
                  blX = 0;
                  blY = 1;
                  param1.prspPara = param1.height;
                  param1.mc.x = param1.mc.x + param1.width / 2;
                  param1.mc.y = param1.mc.y + param1.height;
                  owner.flipOrientation = "Vertical";
                  if(transitionType == "show")
                  {
                     owner.ori = 1;
                     _loc6_ = -Math.PI / 2;
                     _loc7_ = 0;
                  }
                  else
                  {
                     param1.visible = false;
                     owner.ori = -1;
                  }
                  param1.mc.pointArray = [[-_loc3_ / 2,-_loc4_],[_loc3_ / 2,-_loc4_],[_loc3_ / 2,0],[-_loc3_ / 2,0]];
                  break;
               case "left":
                  blX = 1;
                  blY = 0;
                  param1.prspPara = param1.width;
                  param1.mc.y = param1.mc.y + param1.height / 2;
                  owner.flipOrientation = "Horizontal";
                  if(transitionType == "show")
                  {
                     owner.ori = 1;
                     _loc6_ = 0;
                     _loc7_ = -Math.PI / 2;
                  }
                  else
                  {
                     param1.visible = false;
                     owner.ori = -1;
                  }
                  param1.mc.pointArray = [[0,-_loc4_ / 2],[_loc3_,-_loc4_ / 2],[_loc3_,_loc4_ / 2],[0,_loc4_ / 2]];
                  break;
               case "right":
                  blX = 1;
                  blY = 0;
                  param1.prspPara = param1.width;
                  param1.mc.x = param1.mc.x + param1.width;
                  param1.mc.y = param1.mc.y + param1.height / 2;
                  owner.flipOrientation = "Horizontal";
                  if(transitionType == "show")
                  {
                     owner.ori = -1;
                     _loc6_ = 0;
                     _loc7_ = Math.PI / 2;
                  }
                  else
                  {
                     param1.visible = false;
                     owner.ori = 1;
                  }
                  param1.mc.pointArray = [[-_loc3_,-_loc4_ / 2],[0,-_loc4_ / 2],[0,_loc4_ / 2],[-_loc3_,_loc4_ / 2]];
                  break;
               case "vertical":
                  blX = 1;
                  blY = 0;
                  param1.prspPara = param1.width;
                  param1.mc.x = param1.mc.x + param1.width / 2;
                  param1.mc.y = param1.mc.y + param1.height / 2;
                  owner.flipOrientation = "Horizontal";
                  if(transitionType == "show")
                  {
                     owner.ori = -1;
                     _loc6_ = 0;
                     _loc7_ = Math.PI / 2;
                  }
                  else
                  {
                     param1.visible = false;
                     owner.ori = 1;
                  }
                  param1.mc.pointArray = [[-_loc3_ / 2,-_loc4_ / 2],[_loc3_ / 2,-_loc4_ / 2],[_loc3_ / 2,_loc4_ / 2],[-_loc3_ / 2,_loc4_ / 2]];
                  break;
               case "horizontal":
                  blX = 0;
                  blY = 1;
                  param1.prspPara = param1.height;
                  param1.mc.x = param1.mc.x + param1.width / 2;
                  param1.mc.y = param1.mc.y + param1.height / 2;
                  owner.flipOrientation = "Vertical";
                  if(transitionType == "show")
                  {
                     owner.ori = -1;
                     _loc6_ = Math.PI / 2;
                     _loc7_ = 0;
                  }
                  else
                  {
                     param1.visible = false;
                     owner.ori = 1;
                  }
                  param1.mc.pointArray = [[-_loc3_ / 2,-_loc4_ / 2],[_loc3_ / 2,-_loc4_ / 2],[_loc3_ / 2,_loc4_ / 2],[-_loc3_ / 2,_loc4_ / 2]];
            }
            owner.easeFunc = easeFunc;
            param1.mc.itm = param1;
            param1.Flip = new JFlip(focalDistance,param1.prspPara);
            owner.Flip = param1.Flip;
            param1.mc.distortObject = new JDistortImage(param1.mc,param1.mc.texture,3,3);
            param1.mc.distortObject.smooth = this._smooth;
            param1.Flip.firstDistortion(param1,_loc6_,_loc7_);
            param1.Flip.flipEffect(owner,0.5 * owner.ori,param1,owner.flipOrientation);
         }
         owner.motionChangeBlur = motionChangeBlur;
         owner.clearBitmap = clearBitmap;
      }
      
      public function set focalDistance(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         else if(param1 > 100)
         {
            param1 = 100;
         }
         this._focalDistance = param1;
      }
      
      function motionChangeChars(param1:*) : *
      {
         var _loc2_:* = param1.prop;
         motionChangeBlur(param1);
         param1.visible = true;
      }
      
      public function get focalDistance() : Number
      {
         return this._focalDistance;
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
