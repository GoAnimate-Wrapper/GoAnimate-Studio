package com.jumpeye.flashEff2.text.slice
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffText;
   import com.jumpeye.flashEff2.text.patternsPresets.JFETPreset;
   import com.jumpeye.transitions.TweenLite;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.filters.BitmapFilter;
   import flash.filters.BlurFilter;
   import flash.geom.Matrix;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   
   public class FETSlice extends IFlashEffText
   {
       
      
      private var _direction:String = "v";
      
      private var _preset:Number = 1;
      
      private var _position:Number = 200;
      
      private var _delay:Number = 1;
      
      private var _subGrupDuration:Number = 0.6;
      
      private var _maxBlurX:Number = 30;
      
      private var _maxBlurY:Number = 30;
      
      private var _sliceDelay:Number;
      
      private var timeDirection:Number;
      
      protected var owner:Object;
      
      private var _groupDuration:Number = 1;
      
      private var _slices:Number = 4;
      
      private var _prop:String;
      
      private var _blur:Number = 10;
      
      private var _finishPos:Number;
      
      private var _blurQuality:Number = 2;
      
      private var elementObject:Object;
      
      private var _alphaPercentage:Number = 100;
      
      private var _alphaDelay:Number;
      
      private var _startPos:Number;
      
      private var _animationTarget;
      
      private var obj:Object;
      
      public function FETSlice(param1:JUIComponent = null)
      {
         super();
         this.component = param1;
         this.init();
      }
      
      protected function motionChange(... rest) : void
      {
         var _loc2_:* = rest[0];
         var _loc3_:* = _loc2_.prop;
         _loc2_.bmp.visible = true;
         var _loc4_:Number = _loc2_.var2 + (_loc2_.var1 - _loc2_.var2) * _loc3_;
         if(this._direction == "v")
         {
            _loc2_.bmp.y = _loc4_;
         }
         else
         {
            _loc2_.bmp.x = _loc4_;
         }
         var _loc5_:* = this._blur;
         var _loc6_:* = this._blurQuality;
         var _loc7_:Number = _loc3_ * _loc5_;
      }
      
      protected function init() : void
      {
         _tweenDuration = 1.5;
         _tweenType = "Strong";
         _easeType = "easeInOut";
      }
      
      public function set maxBlurX(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         this._maxBlurX = Number(Number(param1)) || Number(0);
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
      
      public function get slices() : Number
      {
         return this._slices;
      }
      
      override public function remove() : void
      {
         this.clearProperties();
      }
      
      public function get blurQuality() : Number
      {
         return this._blurQuality;
      }
      
      public function get position() : Number
      {
         return this._position;
      }
      
      public function set alphaPercentage(param1:Number) : void
      {
         this._alphaPercentage = param1;
      }
      
      public function get groupDuration() : Number
      {
         return this._groupDuration;
      }
      
      public function set subGrupDuration(param1:Number) : void
      {
         if(param1 < 0.001)
         {
            param1 = 0.001;
         }
         this._subGrupDuration = Number(Number(param1)) || Number(1);
      }
      
      public function set preset(param1:Number) : void
      {
         this._preset = param1;
      }
      
      public function set blurQuality(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         this._blurQuality = Number(Number(param1)) || Number(1);
      }
      
      protected function doTransition(param1:*) : *
      {
         var _loc2_:* = 0;
         while(_loc2_ < this._slices)
         {
            if(this._direction == "v")
            {
               this._prop = "y";
               if(show == true)
               {
                  if(Number(this._position) < 0)
                  {
                     param1.slices[_loc2_].duration = this._groupDuration - _loc2_ * this._sliceDelay;
                  }
                  else
                  {
                     param1.slices[_loc2_].duration = this._groupDuration - (this._slices - _loc2_) * this._sliceDelay;
                  }
                  this.timeDirection = 1;
               }
               else
               {
                  if(this._position < 0)
                  {
                     param1.slices[_loc2_].duration = this._groupDuration - (this._slices - _loc2_) * this._sliceDelay;
                  }
                  else
                  {
                     param1.slices[_loc2_].duration = this._groupDuration - _loc2_ * this._sliceDelay;
                  }
                  this.timeDirection = 0;
               }
               param1.slices[_loc2_].var1 = param1.slices[_loc2_].bmp.y + this._position;
               param1.slices[_loc2_].var2 = param1.slices[_loc2_].bmp.y;
            }
            else if(this._direction == "h")
            {
               this._prop = "x";
               if(show == true)
               {
                  this.timeDirection = 1;
                  if(Number(this._position) < 0)
                  {
                     param1.slices[_loc2_].duration = this._groupDuration - _loc2_ * this._sliceDelay;
                  }
                  else
                  {
                     param1.slices[_loc2_].duration = this._groupDuration - (this._slices - _loc2_) * this._sliceDelay;
                  }
               }
               else
               {
                  if(this._position < 0)
                  {
                     param1.slices[_loc2_].duration = this._groupDuration - (this._slices - _loc2_) * this._sliceDelay;
                  }
                  else
                  {
                     param1.slices[_loc2_].duration = this._groupDuration - _loc2_ * this._sliceDelay;
                  }
                  this.timeDirection = 0;
               }
               param1.slices[_loc2_].var1 = param1.slices[_loc2_].bmp.x + this._position;
               param1.slices[_loc2_].var2 = param1.slices[_loc2_].bmp.x;
            }
            param1.slices[_loc2_].bmp.alpha = this._finishPos;
            param1.slices[_loc2_].prop = param1.prop;
            TweenLite.to(param1.slices[_loc2_],param1.slices[_loc2_].duration,{
               "prop":this._finishPos,
               "delay":_loc2_ * this._sliceDelay,
               "ease":this.easeFunc,
               "onComplete":motionFinish,
               "onUpdate":motionChange,
               "onUpdateParams":[param1.slices[_loc2_]],
               "onCompleteParams":[param1.slices[_loc2_]]
            });
            TweenLite.to(param1.slices[_loc2_].bmp,param1.slices[_loc2_].duration * this.alphaPercentage / 100,{
               "alpha":this._startPos,
               "delay":_loc2_ * this._sliceDelay + this._alphaDelay,
               "onComplete":motionFinish2,
               "overwrite":false
            });
            clearInterval(param1.interval);
            _loc2_++;
         }
      }
      
      public function get maxBlurX() : Number
      {
         return this._maxBlurX;
      }
      
      public function get maxBlurY() : Number
      {
         return this._maxBlurY;
      }
      
      public function set slices(param1:Number) : void
      {
         this._slices = param1;
      }
      
      public function set position(param1:Number) : void
      {
         this._position = param1;
      }
      
      protected function startTransition(param1:Boolean = true) : void
      {
         var objMatrix:Array = null;
         var lin:uint = 0;
         var timeMatrix:Array = null;
         var presetObject:Object = null;
         var i:* = undefined;
         var j:uint = 0;
         var col:uint = 0;
         var w:* = undefined;
         var h:* = undefined;
         var xMin:Number = NaN;
         var yMin:Number = NaN;
         var clipAlias:* = undefined;
         var pass:Number = NaN;
         var hr:* = undefined;
         var wr:* = undefined;
         var hpos:Number = NaN;
         var wpos:Number = NaN;
         var e:* = undefined;
         var elementBmp:* = undefined;
         var hc:Number = NaN;
         var matrix:* = undefined;
         var wc:Number = NaN;
         var show:Boolean = param1;
         var doTrans:Function = function():*
         {
         };
         this.owner = {};
         if(this._alphaPercentage > 100)
         {
            this._alphaPercentage = 100;
         }
         if(this._alphaPercentage < 0)
         {
            this._alphaPercentage = 0;
         }
         if(this._slices < 1)
         {
            this._slices = 1;
         }
         this._animationTarget = this._target;
         var aliasPreset:Object = JFETPreset.getAliasPreset(this.preset);
         this.component.drawTextTable(aliasPreset.splitter,this.partialGroup,this.partialPercent,this.selectedStrings,this.partialStart,this.partialBlurAmount);
         objMatrix = this.component.absMatrix;
         presetObject = JFETPreset.getPresetsArray(aliasPreset.preset,objMatrix);
         timeMatrix = presetObject.timeMatrix;
         owner.maxItems = presetObject.maxItems;
         owner.tweensFinished = 0;
         lin = objMatrix.length;
         if(owner.maxItems <= 1)
         {
            this._delay = 0;
         }
         else
         {
            this._delay = Math.max((this.tweenDuration - this.groupDuration) / (owner.maxItems - 1),0);
         }
         this._startPos = 0;
         this._finishPos = 1;
         this.timeDirection = 0;
         owner.show = show;
         if(this._slices <= 1)
         {
            this._sliceDelay = 0;
         }
         else
         {
            this._sliceDelay = (this._groupDuration - this._subGrupDuration) / (this.slices - 1);
         }
         if(show == true)
         {
            this._startPos = 1;
            this._finishPos = 0;
            this._alphaDelay = 0;
         }
         else
         {
            this._alphaDelay = this.groupDuration - this.groupDuration * this.alphaPercentage / 100;
         }
         owner.tweensNumber = this.component.textTable.childs.length * this._slices;
         owner.elements = [];
         i = 0;
         while(i < lin)
         {
            col = objMatrix[i].length;
            owner.elements[i] = [];
            j = 0;
            while(j < col)
            {
               elementObject = owner.elements[i][j] = {};
               elementObject.clip = objMatrix[i][j];
               this._animationTarget = elementObject.clip;
               obj = elementObject;
               elementObject.height = this._animationTarget.height;
               elementObject.width = this._animationTarget.width;
               elementObject.endY = this._animationTarget.y - this._animationTarget.height / 2 * elementObject.scale;
               elementObject.endX = this._animationTarget.x - this._animationTarget.width / 2 * elementObject.scale;
               elementObject.startscalex = this._animationTarget.scaleX;
               elementObject.finalscalex = owner.maxScale;
               elementObject.startscaley = this._animationTarget.scaleY;
               elementObject.finalscaley = owner.maxScale;
               owner.tweensFinished = 0;
               elementObject.clip.alpha = Math.abs(1 - this._startPos);
               elementObject.startx = this._animationTarget.x;
               elementObject.starty = this._animationTarget.y;
               elementObject.finalx = this._animationTarget.x + 0;
               elementObject.finaly = this._animationTarget.y + 0;
               elementObject.slices = [];
               elementObject.matrix = timeMatrix[i][j];
               elementObject.delay = this._delay;
               elementObject.interval = setInterval(this.doTransition,timeMatrix[i][j] * this._delay * 1000,elementObject);
               w = elementObject.width;
               h = elementObject.height;
               xMin = elementObject.clip.getBounds(elementObject.clip).x;
               yMin = elementObject.clip.getBounds(elementObject.clip).y;
               clipAlias = elementObject.clip.parent.addChild(new Sprite());
               clipAlias.x = elementObject.clip.x + xMin;
               clipAlias.y = elementObject.clip.y + yMin;
               elementObject.clip.visible = false;
               elementObject.clipAlias = clipAlias;
               pass = 0;
               hr = h / this._slices;
               if(hr < 1)
               {
                  hr = 1;
                  if(this._direction == "v")
                  {
                     this._slices = Math.ceil(h);
                     owner.tweensNumber = this.component.textTable.childs.length * this._slices;
                  }
               }
               wr = w / this._slices;
               if(wr < 1)
               {
                  wr = 1;
                  if(this._direction == "h")
                  {
                     this._slices = Math.ceil(w);
                     owner.tweensNumber = this.component.textTable.childs.length * this._slices;
                  }
               }
               hpos = 0;
               wpos = 0;
               e = 0;
               while(e < this._slices)
               {
                  elementBmp = elementObject.slices[e] = {};
                  if(this._direction == "v")
                  {
                     hc = Math.floor(hr + pass);
                     if(e == this._slices - 1)
                     {
                        hc = Math.ceil(hr + pass);
                     }
                     pass = hr + pass - hc;
                     elementBmp.bitmap = new BitmapData(w,hc,true,65280);
                     matrix = new Matrix();
                     matrix.translate(-xMin,-hpos - yMin);
                     elementBmp.bmp = clipAlias.addChild(new Bitmap(elementBmp.bitmap));
                     elementBmp.bmp.y = hpos;
                     hpos = hpos + hc;
                  }
                  else
                  {
                     wc = Math.floor(wr + pass);
                     if(e == this._slices - 1)
                     {
                        wc = Math.ceil(wr + pass);
                     }
                     if(this._slices > w)
                     {
                        this._slices = Math.ceil(w);
                        owner.tweensNumber = this.component.textTable.childs.length * this._slices;
                     }
                     matrix = new Matrix();
                     matrix.translate(-wpos - xMin,-yMin);
                     pass = wr + pass - wc;
                     elementBmp.bitmap = new BitmapData(wc,h,true,65280);
                     elementBmp.bmp = clipAlias.addChild(new Bitmap(elementBmp.bitmap));
                     elementBmp.bmp.x = wpos;
                     wpos = wpos + wc;
                  }
                  elementBmp.bitmap.draw(elementObject.clip,matrix);
                  elementBmp.bmp.visible = true;
                  if(show == true)
                  {
                     elementBmp.bmp.visible = false;
                  }
                  e++;
               }
               elementObject.prop = this._startPos;
               elementObject.alpha = this._startPos;
               j++;
            }
            i++;
         }
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
      
      public function get preset() : Number
      {
         return this._preset;
      }
      
      public function get subGrupDuration() : Number
      {
         return this._subGrupDuration;
      }
      
      protected function motionFinish(... rest) : void
      {
         owner.tweensFinished++;
         if(owner.tweensNumber == owner.tweensFinished)
         {
            rest[0].bmp.filters = [];
            this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
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
      
      override public function hide() : void
      {
         if(this.component != null)
         {
            this.startTransition(false);
         }
      }
      
      protected function motionFinish2() : void
      {
      }
      
      protected function clearProperties() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:uint = 0;
         var _loc3_:* = undefined;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:Object = null;
         var _loc7_:* = undefined;
         if(owner is Object)
         {
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
                     if(_loc6_.clip.parent)
                     {
                        if(_loc6_.clip.parent.contains(_loc6_.clipAlias))
                        {
                           if(owner.elements[_loc3_][_loc4_] is Object)
                           {
                              _loc6_.clip.parent.removeChild(_loc6_.clipAlias);
                           }
                        }
                     }
                     _loc7_ = 0;
                     while(_loc7_ < this._slices)
                     {
                        TweenLite.killTweensOf(_loc6_.slices[_loc7_],false);
                        TweenLite.killTweensOf(_loc6_.slices[_loc7_].bmp,false);
                        _loc7_++;
                     }
                     if(_loc6_.interval)
                     {
                        clearInterval(_loc6_.interval);
                     }
                     _loc4_++;
                  }
                  _loc3_++;
               }
            }
            delete owner.elements;
            owner = null;
         }
      }
      
      protected function blurEffect(param1:*, param2:Number, param3:uint = 2) : void
      {
         var _loc4_:BitmapFilter = new BlurFilter(param2,param2,param3);
         var _loc5_:Array = new Array();
         _loc5_.push(_loc4_);
         param1.filters = _loc5_;
      }
      
      override public function show() : void
      {
         if(this.component != null)
         {
            this.startTransition(true);
         }
      }
      
      public function set direction(param1:String) : void
      {
         this._direction = param1;
      }
      
      public function get direction() : String
      {
         return this._direction;
      }
   }
}
