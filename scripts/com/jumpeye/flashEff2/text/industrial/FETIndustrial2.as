package com.jumpeye.flashEff2.text.industrial
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffText;
   import com.jumpeye.transitions.TweenLite;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.filters.BitmapFilter;
   import flash.filters.BlurFilter;
   import flash.filters.GlowFilter;
   import flash.geom.Point;
   
   public class FETIndustrial2 extends IFlashEffText
   {
       
      
      protected var isShow:Boolean = true;
      
      protected var propOwner:Object;
      
      private var _distance:Number = 100;
      
      private var _blurCoeficient:Number = 1;
      
      private var _maxGlowStrength:Number = 4;
      
      private var _maxChars:Number = 10;
      
      private var _glowColor:Number = 16777215;
      
      public function FETIndustrial2(param1:JUIComponent = null)
      {
         super();
         this.component = param1;
         init();
      }
      
      public function get maxGlowStrength() : Number
      {
         return _maxGlowStrength;
      }
      
      override public function hide() : void
      {
         this.startTransition(false);
      }
      
      override public function remove() : void
      {
         try
         {
            TweenLite.killTweensOf(propOwner.tweenObject,false);
            delete propOwner.tweenObject;
            delete propOwner.timeline.frames;
            delete propOwner.timeline;
            delete propOwner.alphaElements;
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      protected function motionChange() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:Number = NaN;
         var _loc7_:Object = null;
         var _loc8_:Object = null;
         var _loc9_:* = undefined;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc3_:Object = propOwner.tweenObject;
         var _loc4_:* = propOwner.currentLevel;
         var _loc5_:uint = propOwner.timeline.frames[_loc4_].length;
         var _loc6_:Number = _loc3_.prop;
         _loc1_ = 0;
         while(_loc1_ < _loc5_)
         {
            _loc7_ = propOwner.timeline.frames[_loc4_][_loc1_].element;
            _loc8_ = _loc7_.elementTimeline[propOwner.timeline.frames[_loc4_][_loc1_].effectIndex];
            for(_loc9_ in _loc8_.axes)
            {
               _loc7_.clip[_loc8_.axes[_loc9_]] = _loc8_.startPos[_loc9_] + (_loc8_.endPos[_loc9_] - _loc8_.startPos[_loc9_]) * _loc6_;
            }
            _loc10_ = _loc7_.clip[_loc8_.blurRel];
            _loc11_ = Math.abs(_loc10_ - _loc7_.lastBlur) * this.blurCoeficient;
            _loc12_ = _loc11_ * _loc8_.blurX;
            _loc13_ = _loc11_ * _loc8_.blurY;
            _loc7_.lastBlur = _loc10_;
            this.filterEffect(_loc7_.clip,_loc12_,_loc13_,_loc11_);
            _loc1_++;
         }
         _loc5_ = propOwner.alphaElements.length;
         _loc1_ = 0;
         while(_loc1_ < _loc5_)
         {
            propOwner.alphaElements[_loc1_].clip.alpha = Math.abs(1 - _loc6_);
            _loc1_++;
         }
      }
      
      public function get blurCoeficient() : Number
      {
         return this._blurCoeficient;
      }
      
      public function get glowColor() : uint
      {
         return _glowColor;
      }
      
      protected function startTransition(param1:Boolean = true) : void
      {
         var _loc2_:Array = null;
         var _loc3_:uint = 0;
         var _loc4_:* = undefined;
         var _loc5_:uint = 0;
         var _loc11_:uint = 0;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:uint = 0;
         var _loc17_:uint = 0;
         var _loc18_:uint = 0;
         var _loc19_:Object = null;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:* = undefined;
         var _loc23_:uint = 0;
         var _loc24_:Object = null;
         var _loc25_:String = null;
         var _loc26_:uint = 0;
         var _loc27_:* = undefined;
         var _loc28_:Object = null;
         var _loc29_:String = null;
         var _loc30_:String = null;
         var _loc6_:Array = [["cw90","left"],["ccw90","right"],["cw90","up"],["ccw90","up"],["cw90","down"],["ccw90","down"],["up"],["down"],["cw180","down"],["cw180","up"],["ccw180","down"],["ccw180","up"]];
         propOwner = {};
         this.isShow = param1;
         var _loc7_:Number = 0;
         var _loc8_:String = this.target.text;
         var _loc9_:uint = this.target.numLines;
         var _loc10_:Array = [];
         var _loc12_:Number = this.target.width;
         var _loc13_:Number = this.target.height;
         while(_loc7_ < _loc9_)
         {
            _loc14_ = 0;
            _loc15_ = this.target.getLineLength(_loc7_);
            if(_loc15_ > 0)
            {
               _loc10_[_loc7_] = [];
               while(_loc14_ < _loc15_)
               {
                  _loc17_ = _loc10_[_loc7_].push(Math.floor(Math.random() * this.maxChars + 1));
                  _loc14_ = _loc14_ + _loc10_[_loc7_][_loc17_ - 1];
               }
               _loc16_ = _loc10_[_loc7_].length;
               _loc10_[_loc7_][_loc16_ - 1] = _loc10_[_loc7_][_loc16_ - 1] - (_loc14_ - _loc15_);
            }
            _loc7_++;
         }
         _loc11_ = _loc10_.length;
         this.component.drawTextTable("custom",this.partialGroup,this.partialPercent,this.selectedStrings,this.partialStart,this.partialBlurAmount,_loc10_);
         _loc2_ = this.component.absMatrix;
         propOwner.tweensFinished = 0;
         _loc3_ = _loc2_.length;
         propOwner.startPos = 0;
         propOwner.finishPos = 1;
         if(param1 == true)
         {
            propOwner.startPos = 1;
            propOwner.finishPos = 0;
         }
         propOwner.elements = [];
         propOwner.timeline = {};
         propOwner.levels = 2;
         propOwner.timeline.len = 0;
         propOwner.timeline.frames = [];
         propOwner.moveingClips = [0];
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc18_ = _loc2_[_loc4_].length;
            propOwner.elements[_loc4_] = [];
            _loc5_ = 0;
            while(_loc5_ < _loc18_)
            {
               _loc19_ = propOwner.elements[_loc4_][_loc5_] = {};
               _loc19_.clip = _loc2_[_loc4_][_loc5_];
               _loc19_.clip.alpha = propOwner.finishPos;
               _loc19_.effect = _loc6_[Math.floor(Math.random() * 12)];
               _loc19_.transitionCount = 0;
               _loc19_.elementTimeline = [];
               _loc19_.totalTransitions = _loc19_.effect.length;
               _loc20_ = _loc19_.clip.width;
               _loc21_ = _loc20_ / 2;
               for(_loc22_ in _loc19_.effect)
               {
                  _loc23_ = _loc19_.elementTimeline.push({
                     "type":_loc19_.effect[_loc22_],
                     "pos":_loc22_
                  });
                  _loc24_ = _loc19_.elementTimeline[_loc23_ - 1];
                  switch(_loc19_.effect[_loc22_])
                  {
                     case "cw90":
                        _loc24_.axes = ["rotation"];
                        _loc24_.startPos = [0];
                        _loc24_.endPos = [90];
                        _loc24_.blurX = 1;
                        _loc24_.blurY = 1;
                        _loc24_.blurRel = "rotation";
                        _loc24_.anchorPoint1 = new Point(_loc20_,_loc21_);
                        _loc24_.anchorPoint2 = new Point(_loc20_,-_loc21_);
                        this.setRegPoint(_loc19_.clip,_loc21_,-_loc21_);
                        break;
                     case "ccw90":
                        _loc24_.axes = ["rotation"];
                        _loc24_.startPos = [0];
                        _loc24_.endPos = [-90];
                        _loc24_.blurX = 1;
                        _loc24_.blurY = 1;
                        _loc24_.blurRel = "rotation";
                        _loc24_.anchorPoint1 = new Point(_loc20_,-_loc21_);
                        _loc24_.anchorPoint2 = new Point(_loc20_,_loc21_);
                        this.setRegPoint(_loc19_.clip,_loc21_,-_loc21_);
                        break;
                     case "cw180":
                        _loc24_.axes = ["rotation"];
                        _loc24_.startPos = [0];
                        _loc24_.endPos = [180];
                        _loc24_.blurX = 1;
                        _loc24_.blurY = 1;
                        _loc24_.blurRel = "rotation";
                        _loc24_.anchorPoint = new Point(_loc21_,-_loc20_);
                        _loc24_.anchorPoint = new Point(-_loc21_,-_loc20_);
                        this.setRegPoint(_loc19_.clip,_loc21_,-_loc21_);
                        break;
                     case "ccw180":
                        _loc24_.axes = ["rotation"];
                        _loc24_.startPos = [0];
                        _loc24_.endPos = [-180];
                        _loc24_.blurX = 1;
                        _loc24_.blurY = 1;
                        _loc24_.blurRel = "rotation";
                        _loc24_.anchorPoint = new Point(_loc21_,_loc20_);
                        _loc24_.anchorPoint = new Point(-_loc21_,_loc20_);
                        this.setRegPoint(_loc19_.clip,_loc21_,_loc21_);
                        break;
                     case "left":
                        _loc24_.axes = ["x"];
                        _loc24_.startPos = [_loc19_.clip.x];
                        _loc24_.endPos = [-this.distance + _loc19_.clip.x];
                        _loc24_.blurX = 1;
                        _loc24_.blurY = 0.1;
                        _loc24_.blurRel = "x";
                        break;
                     case "right":
                        _loc24_.axes = ["x"];
                        _loc24_.startPos = [_loc19_.clip.x];
                        _loc24_.endPos = [this.distance + _loc19_.clip.x];
                        _loc24_.blurX = 1;
                        _loc24_.blurY = 0.1;
                        _loc24_.blurRel = "x";
                        break;
                     case "up":
                        _loc24_.axes = ["y"];
                        _loc24_.startPos = [_loc19_.clip.y];
                        _loc24_.endPos = [-this.distance + _loc19_.clip.y];
                        _loc24_.blurX = 0.1;
                        _loc24_.blurY = 1;
                        _loc24_.blurRel = "y";
                        break;
                     case "down":
                        _loc24_.axes = ["y"];
                        _loc24_.startPos = [_loc19_.clip.y];
                        _loc24_.endPos = [this.distance + _loc19_.clip.y];
                        _loc24_.blurX = 0.1;
                        _loc24_.blurY = 1;
                        _loc24_.blurRel = "y";
                  }
                  _loc25_ = _loc19_.effect[_loc22_];
                  if(!(propOwner.timeline[_loc25_] is Array))
                  {
                     propOwner.timeline.len++;
                     _loc26_ = propOwner.timeline.frames.push([]);
                     propOwner.timeline[_loc25_] = propOwner.timeline.frames[_loc26_ - 1];
                  }
                  propOwner.timeline[_loc25_].push({
                     "element":_loc19_,
                     "effectIndex":_loc22_
                  });
                  if(this.isShow == true)
                  {
                     for(_loc27_ in _loc24_.axes)
                     {
                        _loc19_.clip[_loc24_.axes[_loc27_]] = _loc24_.endPos[_loc27_];
                     }
                  }
               }
               _loc19_.currentPosition = new Point(_loc19_.clip.x,_loc19_.clip.y);
               _loc5_++;
            }
            _loc4_++;
         }
         if(this.isShow == true)
         {
            propOwner.timeline.frames.reverse();
         }
         propOwner.timeLen = propOwner.timeline.len;
         propOwner.tweenObject = {};
         propOwner.alphaElements = [];
         propOwner.currentLevel = -1;
         _loc4_ = 0;
         while(_loc4_ < propOwner.timeLen)
         {
            _loc5_ = 0;
            while(_loc5_ < propOwner.timeline.frames[_loc4_].length)
            {
               _loc28_ = propOwner.timeline.frames[_loc4_][_loc5_];
               _loc29_ = _loc19_.effect[_loc28_.effectIndex];
               _loc19_ = _loc28_.element;
               if(_loc19_.isFirstEffect != true)
               {
                  _loc19_.firstEffect = _loc29_;
                  _loc19_.isFirstEffect = true;
               }
               else
               {
                  _loc19_.isFirstEffect = false;
               }
               if((_loc19_.firstEffect == "cw90" || _loc19_.firstEffect == "ccw90") && this.isShow == false || _loc19_.clip.rotation == 90 && _loc19_.isFirstEffect == true)
               {
                  _loc30_ = _loc19_.effect[_loc28_.effectIndex];
                  if(_loc30_ == "up" || _loc30_ == "down")
                  {
                     if(!(propOwner.timeline[_loc30_ + "Vertical"] is Array))
                     {
                        propOwner.timeline.len++;
                        _loc26_ = propOwner.timeline.frames.push([]);
                        propOwner.timeline[_loc30_ + "Vertical"] = propOwner.timeline.frames[_loc26_ - 1];
                     }
                     propOwner.timeline[_loc30_ + "Vertical"].push({
                        "element":_loc19_,
                        "effectIndex":_loc28_.effectIndex
                     });
                     propOwner.timeline.frames[_loc4_].splice(_loc5_,1);
                     _loc5_--;
                  }
               }
               _loc5_++;
            }
            _loc4_++;
         }
         propOwner.timeLen = propOwner.timeline.len;
         propOwner.duration = this.tweenDuration / propOwner.timeLen;
         this.motionFinish();
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
      
      public function get maxChars() : Number
      {
         return this._maxChars;
      }
      
      protected function setRegPoint(param1:*, param2:Number, param3:Number) : void
      {
         var _loc4_:* = undefined;
         for(_loc4_ in param1.childs)
         {
            param1.childs[_loc4_].x = param1.childs[_loc4_].x - param2;
            param1.childs[_loc4_].y = param1.childs[_loc4_].y - param3;
         }
         param1.x = param1.x + param2;
         param1.y = param1.y + param3;
      }
      
      private function init() : *
      {
         _tweenDuration = 1.5;
         _tweenType = "Strong";
         _easeType = "easeOut";
      }
      
      public function set maxGlowStrength(param1:Number) : void
      {
         _maxGlowStrength = param1;
      }
      
      public function set blurCoeficient(param1:Number) : void
      {
         this._blurCoeficient = param1;
      }
      
      protected function filterEffect(param1:Sprite, param2:Number, param3:Number, param4:Number, param5:uint = 2) : void
      {
         var _loc6_:BitmapFilter = new BlurFilter(param2,param3,param5);
         var _loc7_:BitmapFilter = new GlowFilter(this._glowColor,1,param2 * 2,param3 * 2,Math.min(param4,this._maxGlowStrength));
         var _loc8_:Array = new Array();
         _loc8_.push(_loc6_,_loc7_);
         param1.filters = _loc8_;
      }
      
      public function set distance(param1:Number) : void
      {
         this._distance = param1;
      }
      
      public function set glowColor(param1:uint) : void
      {
         _glowColor = param1;
      }
      
      protected function motionFinish() : void
      {
         var _loc1_:uint = 0;
         var _loc2_:* = undefined;
         var _loc3_:Object = null;
         var _loc4_:DisplayObject = null;
         var _loc5_:* = undefined;
         var _loc6_:Object = null;
         if(propOwner.currentLevel > -1)
         {
            _loc1_ = propOwner.timeline.frames[propOwner.currentLevel].length;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               _loc3_ = propOwner.timeline.frames[propOwner.currentLevel][_loc2_].element;
               _loc3_.clip.filters = [];
               _loc3_.currentPosition = new Point(_loc3_.clip.x,_loc3_.clip.y);
               _loc2_++;
            }
            _loc1_ = propOwner.alphaElements.length;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               _loc4_ = propOwner.alphaElements[_loc2_].clip;
               _loc4_.visible = this.isShow;
               _loc2_++;
            }
         }
         propOwner.alphaElements = [];
         propOwner.currentLevel++;
         if(propOwner.currentLevel < propOwner.timeLen)
         {
            TweenLite.killTweensOf(propOwner.tweenObject,false);
            _loc1_ = propOwner.timeline.frames[propOwner.currentLevel].length;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               _loc5_ = propOwner.timeline.frames[propOwner.currentLevel][_loc2_];
               _loc3_ = _loc5_.element;
               _loc6_ = _loc3_.elementTimeline[_loc5_.effectIndex];
               _loc3_.lastBlur = _loc3_.clip[_loc3_.elementTimeline[propOwner.timeline.frames[propOwner.currentLevel][_loc2_].effectIndex].blurRel];
               if(this.isShow == true)
               {
                  if(_loc3_.transitionCount == 0)
                  {
                     propOwner.alphaElements.push(_loc3_);
                     _loc3_.alpha = 0;
                  }
               }
               else if(_loc3_.transitionCount == _loc3_.totalTransitions - 1)
               {
                  propOwner.alphaElements.push(_loc3_);
                  _loc3_.alpha = 1;
               }
               _loc3_.transitionCount++;
               _loc2_++;
            }
            propOwner.tweenObject.prop = propOwner.startPos;
            TweenLite.to(propOwner.tweenObject,propOwner.duration,{
               "prop":propOwner.finishPos,
               "ease":this.easeFunc,
               "onUpdate":this.motionChange,
               "onComplete":this.motionFinish
            });
         }
         else
         {
            this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
         }
      }
      
      public function set maxChars(param1:Number) : void
      {
         this._maxChars = param1;
      }
      
      public function get distance() : Number
      {
         return this._distance;
      }
      
      override public function show() : void
      {
         this.startTransition(true);
      }
   }
}
