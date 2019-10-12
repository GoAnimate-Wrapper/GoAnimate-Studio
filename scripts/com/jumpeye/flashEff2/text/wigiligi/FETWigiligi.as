package com.jumpeye.flashEff2.text.wigiligi
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffText;
   import com.jumpeye.flashEff2.presets.JFETP19;
   import com.jumpeye.flashEff2.presets.JFETP21;
   import com.jumpeye.flashEff2.presets.JFETP3;
   import com.jumpeye.flashEff2.presets.JFETP9;
   import com.jumpeye.flashEff2.text.patternsPresets.JFETPreset;
   import com.jumpeye.transitions.TweenLite;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.filters.BitmapFilter;
   import flash.filters.BlurFilter;
   import flash.geom.Matrix;
   
   public class FETWigiligi extends IFlashEffText
   {
       
      
      private var _position:Number = 200;
      
      private var _direction:String = "v";
      
      private var _delay:Number = 1;
      
      private var _subGrupDuration:Number = 0.5;
      
      private var _wigiliriStart:Number = 80;
      
      private var _maxBlurY:Number = 30;
      
      private var wigiliri:Number = 20;
      
      private var _sliceDelay:Number;
      
      private var timeDirection:Number;
      
      protected var owner:Object;
      
      private var _groupDuration:Number = 1;
      
      private var _slices:Number = 20;
      
      private var _prop:String;
      
      private var _blur:Number = 4;
      
      private var _finishPos:Number;
      
      private var bmpArray:Array;
      
      private var _blurQuality:Number = 2;
      
      private var elementObject:Object;
      
      private var _alphaPercentage:Number = 80;
      
      private var _alphaDelay:Number;
      
      private var _startPos:Number;
      
      private var _animationTarget;
      
      private var obj:Object;
      
      private var _phase:Number = 5;
      
      private var _preset:Number = 1;
      
      public function FETWigiligi(param1:JUIComponent = null)
      {
         bmpArray = new Array();
         super();
         this.component = param1;
         this.init();
      }
      
      protected function clearProperties() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:uint = 0;
         var _loc4_:* = undefined;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:Object = null;
         if(bmpArray != null)
         {
            for(_loc1_ in bmpArray)
            {
               bmpArray[_loc1_].dispose();
            }
            bmpArray = null;
         }
         if(owner is Object)
         {
            if(owner.elements is Array)
            {
               _loc2_ = owner.absMatrix;
               _loc3_ = owner.elements.length;
               if(this.component.targetOwner.contains(owner.masca))
               {
                  this.component.targetOwner.removeChild(owner.masca);
               }
               _loc4_ = 0;
               while(_loc4_ < _loc3_)
               {
                  _loc6_ = owner.elements[_loc4_].length;
                  _loc5_ = 0;
                  while(_loc5_ < _loc6_)
                  {
                     _loc7_ = owner.elements[_loc4_][_loc5_];
                     if(this.component.targetOwner.contains(_loc7_.mc))
                     {
                        if(owner.elements[_loc4_][_loc5_] is Object)
                        {
                           this.component.targetOwner.removeChild(_loc7_.mc);
                           this.component.targetOwner.removeChild(_loc7_.mc2);
                        }
                     }
                     TweenLite.killTweensOf(_loc7_,false);
                     TweenLite.killTweensOf(_loc7_.mc,false);
                     TweenLite.killTweensOf(_loc7_.mc2,false);
                     _loc5_++;
                  }
                  _loc4_++;
               }
            }
         }
         if(owner is Object)
         {
            if(owner.show == true)
            {
               if(this.component.textOwnerClip)
               {
                  this.component.textOwnerClip.visible = true;
               }
            }
         }
         owner = null;
      }
      
      public function set direction(param1:String) : void
      {
         this._direction = param1;
      }
      
      protected function motionChange(... rest) : void
      {
         var _loc2_:Object = rest[0];
         var _loc3_:* = _loc2_.prop;
         this.coordonateTween(_loc2_,_loc2_.mc,_loc3_);
         this.coordonateMask(_loc2_,_loc2_.mc2,_loc3_);
         var _loc4_:* = Math.abs((_loc2_.mc.x - _loc2_.startx) * this._blur / (_loc2_.finx - _loc2_.startx));
         this.blurEffect(_loc2_.mc,_loc4_);
         this.blurEffect(_loc2_.mc2,_loc4_);
      }
      
      public function get blur() : Number
      {
         return this._blur;
      }
      
      private function coordonateMask(param1:Object, param2:MovieClip, param3:Number) : *
      {
         param2.x = param1.fin_x - (param1.fin_x - param1.st_x) * Math.cos(2 * Math.PI * param3 * this.wigiliri);
      }
      
      private function coordonateTween(param1:Object, param2:MovieClip, param3:Number) : *
      {
         param2.x = param1.finx - (param1.finx - param1.stx) * Math.cos(2 * Math.PI * param3 * this.wigiliri);
      }
      
      override public function show() : void
      {
         if(this.component != null)
         {
            this.startTransition(true);
         }
      }
      
      public function get alphaPercentage() : Number
      {
         return this._alphaPercentage;
      }
      
      public function get wigiliriStart() : Number
      {
         return this._wigiliriStart;
      }
      
      public function set maxBlurY(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         this._maxBlurY = Number(Number(param1)) || Number(0);
      }
      
      public function get blurQuality() : Number
      {
         return this._blurQuality;
      }
      
      public function get slices() : Number
      {
         return this._slices;
      }
      
      override public function remove() : void
      {
         this.clearProperties();
      }
      
      public function set alphaPercentage(param1:Number) : void
      {
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
      
      public function get groupDuration() : Number
      {
         return this._groupDuration;
      }
      
      public function set wigiliriStart(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 > 100)
         {
            param1 = 100;
         }
         this._wigiliriStart = param1;
      }
      
      public function set preset(param1:Number) : void
      {
         if(param1 < 1)
         {
            param1 = 1;
         }
         if(param1 > 3)
         {
            param1 = 3;
         }
         this._preset = param1;
      }
      
      public function set blurQuality(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 > 3)
         {
            param1 = 3;
         }
         this._blurQuality = Number(Number(param1)) || Number(1);
      }
      
      public function set subGrupDuration(param1:Number) : void
      {
         if(param1 < 0.001)
         {
            param1 = 0.001;
         }
         this._subGrupDuration = Number(Number(param1)) || Number(1);
      }
      
      public function set blur(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 > 300)
         {
            param1 = 300;
         }
         this._blur = Number(Number(param1)) || Number(0);
      }
      
      public function set slices(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 20;
         }
         if(param1 > 100)
         {
            param1 = 100;
         }
         this._slices = param1;
      }
      
      private function createBitmap(param1:*) : *
      {
         this.wigiliri = this.slices;
         param1.mc = new MovieClip();
         this.component.targetOwner.addChild(param1.mc);
         param1.mc2 = new MovieClip();
         this.component.targetOwner.addChild(param1.mc2);
         param1.mc.alpha = 0;
         param1.mc2.alpha = 0;
         owner.bds = param1.clip.getBounds(param1.clip);
         param1.mc.x = param1.clip.x + owner.bds.x;
         param1.mc.y = param1.clip.y + owner.bds.y;
         param1.mc2.x = param1.clip.x + owner.bds.x;
         param1.mc2.y = param1.clip.y + owner.bds.y;
         if(owner.show == false)
         {
            param1.mc.alpha = 1;
            param1.mc2.alpha = 1;
         }
         var _loc2_:* = new Matrix();
         _loc2_.scale(param1.clip.scaleX,param1.clip.scaleY);
         _loc2_.tx = -owner.bds.x * param1.mc.scaleX / 1;
         _loc2_.ty = -owner.bds.y * param1.mc.scaleY / 1;
         owner.bmp = new BitmapData(param1.clip.width,param1.clip.height,true,65280);
         bmpArray.push(owner.bmp);
         param1.mc.cacheAsBitmap = true;
         param1.mc2.cacheAsBitmap = true;
         owner.bmp.draw(param1.clip,_loc2_);
         owner.bmpclone = owner.bmp.clone();
         bmpArray.push(owner.bmpclone);
         var _loc3_:* = new Bitmap(owner.bmp);
         param1.mc.addChild(_loc3_);
         var _loc4_:* = new Bitmap(owner.bmpclone);
         param1.mc2.addChild(_loc4_);
         param1.finx = param1.clip.x + this._phase;
         param1.stx = param1.clip.x + owner.bds.x;
         param1.fin_x = param1.clip.x - this._phase;
         param1.st_x = param1.clip.x + owner.bds.x;
      }
      
      private function createRectangle(param1:Sprite, param2:*, param3:*, param4:*, param5:*) : *
      {
         var clip:Sprite = param1;
         var _wid:* = param2;
         var _hei:* = param3;
         var x:* = param4;
         var y:* = param5;
         with(clip.graphics)
         {
            
            beginFill(0);
            drawRect(x,y,_wid,_hei);
            endFill();
         }
      }
      
      public function get maxBlurY() : Number
      {
         return this._maxBlurY;
      }
      
      protected function init() : void
      {
         _tweenDuration = 1.6;
         _tweenType = "Quadratic";
         _easeType = "easeOut";
      }
      
      protected function startTransition(param1:Boolean = true) : void
      {
         var _loc2_:JFETP9 = null;
         var _loc3_:JFETP3 = null;
         var _loc4_:JFETP19 = null;
         var _loc5_:JFETP21 = null;
         var _loc6_:Array = null;
         var _loc7_:uint = 0;
         var _loc8_:Array = null;
         var _loc9_:Object = null;
         var _loc10_:* = undefined;
         var _loc11_:uint = 0;
         var _loc15_:uint = 0;
         var _loc16_:* = undefined;
         var _loc17_:* = undefined;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:* = undefined;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc23_:* = undefined;
         var _loc24_:* = undefined;
         var _loc25_:Number = NaN;
         var _loc26_:Number = NaN;
         this.owner = {};
         if(this._alphaPercentage > 100)
         {
            this._alphaPercentage = 100;
         }
         if(this._alphaPercentage < 0)
         {
            this._alphaPercentage = 0;
         }
         bmpArray = [];
         this._animationTarget = this._target;
         var _loc12_:Number = Number(Number(this.preset)) || Number(1);
         obj = {};
         var _loc13_:String = "lines";
         if(this.preset == 1)
         {
            _loc12_ = 1;
         }
         if(this.preset == 2)
         {
            _loc12_ = 3;
         }
         if(this.preset == 3)
         {
            _loc12_ = 9;
         }
         if(this.preset < 1)
         {
            _loc12_ = 19;
         }
         if(this.preset > 3)
         {
            _loc12_ = 21;
         }
         this.component.drawTextTable(_loc13_,this.partialGroup,this.partialPercent,this.selectedStrings,this.partialStart,this.partialBlurAmount);
         _loc6_ = this.component.absMatrix;
         _loc9_ = JFETPreset.getPresetsArray(_loc12_,_loc6_);
         _loc8_ = _loc9_.timeMatrix;
         owner.maxItems = _loc9_.maxItems;
         owner.tweensFinished = 0;
         owner.tweensFinished2 = 0;
         _loc7_ = _loc6_.length;
         owner.target = this.component.targetOwner;
         var _loc14_:* = this;
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
         owner.show = param1;
         this._sliceDelay = (this._groupDuration - this._subGrupDuration) / this.slices;
         if(param1 == true)
         {
            this._startPos = 1;
            this._finishPos = 0;
            this._alphaDelay = 0;
         }
         else
         {
            this._alphaDelay = this.groupDuration - this.groupDuration * this.alphaPercentage / 100;
         }
         owner.tweensNumber = this.component.textTable.childs.length;
         owner.masca = this.component.targetOwner.addChild(new Sprite());
         owner.tweensFinished = 0;
         owner.elements = [];
         _loc10_ = 0;
         while(_loc10_ < _loc7_)
         {
            _loc15_ = _loc6_[_loc10_].length;
            owner.elements[_loc10_] = [];
            _loc11_ = 0;
            while(_loc11_ < _loc15_)
            {
               elementObject = owner.elements[_loc10_][_loc11_] = {};
               elementObject.clip = _loc6_[_loc10_][_loc11_];
               this._animationTarget = elementObject.clip;
               obj = elementObject;
               elementObject.height = elementObject.clip.height;
               elementObject.width = elementObject.clip.width;
               elementObject.startx = elementObject.clip.x;
               elementObject.starty = elementObject.clip.y;
               elementObject.finalx = elementObject.clip.x + owner.positionX;
               elementObject.finaly = elementObject.clip.y + owner.positionY;
               _loc16_ = elementObject.width;
               _loc17_ = elementObject.height;
               _loc18_ = elementObject.clip.getBounds(elementObject.clip).x;
               _loc19_ = elementObject.clip.getBounds(elementObject.clip).y;
               _loc20_ = elementObject.clip.y + _loc19_;
               owner.clipss = elementObject.clip;
               elementObject.slices = [];
               this.createBitmap(elementObject);
               owner.masca0 = owner.masca.addChild(new Sprite());
               owner.masca1 = owner.masca.addChild(new Sprite());
               owner.masca0.y = Math.round(_loc20_);
               owner.masca0.x = elementObject.clip.x + owner.bds.x;
               owner.masca1.y = Math.round(_loc20_);
               owner.masca1.x = elementObject.clip.x + owner.bds.x;
               elementObject.mc.mask = owner.masca0;
               elementObject.mc2.mask = owner.masca1;
               _loc21_ = 0;
               _loc22_ = 0;
               _loc23_ = _loc17_ / this._slices;
               _loc24_ = 0;
               while(_loc24_ < this._slices)
               {
                  _loc26_ = Math.floor(_loc23_ + _loc21_);
                  if(_loc24_ == this._slices - 1)
                  {
                     _loc26_ = Math.ceil(_loc23_ + _loc21_);
                  }
                  _loc21_ = _loc23_ + _loc21_ - _loc26_;
                  this.createRectangle(owner["masca" + _loc24_ % 2],_loc16_,_loc26_,0,_loc22_);
                  _loc22_ = _loc22_ + _loc26_;
                  _loc24_++;
               }
               _loc25_ = this.wigiliriStart * this.groupDuration / 100;
               this.wigiliri = _loc25_ * 100;
               elementObject.prop = this._startPos;
               if(owner.show == true)
               {
                  TweenLite.to(elementObject,this._groupDuration - _loc25_,{
                     "prop":this._finishPos,
                     "delay":_loc8_[_loc10_][_loc11_] * this._delay + this.wigiliriStart * this._groupDuration / 100,
                     "ease":this.easeFunc,
                     "onComplete":motionFinish,
                     "onUpdate":motionChange,
                     "onUpdateParams":[elementObject],
                     "onCompleteParams":[elementObject]
                  });
               }
               else
               {
                  TweenLite.to(elementObject,Math.abs(_loc25_ - this._groupDuration),{
                     "prop":this._finishPos,
                     "delay":_loc8_[_loc10_][_loc11_] * this._delay,
                     "ease":this.easeFunc,
                     "onComplete":motionFinish,
                     "onUpdate":motionChange,
                     "onUpdateParams":[elementObject],
                     "onCompleteParams":[elementObject]
                  });
               }
               TweenLite.to(elementObject.mc,this._groupDuration * this.alphaPercentage / 100,{
                  "alpha":this._startPos,
                  "delay":_loc8_[_loc10_][_loc11_] * this._delay + this._alphaDelay,
                  "ease":this.easeFunc
               });
               TweenLite.to(elementObject.mc2,this._groupDuration * this.alphaPercentage / 100,{
                  "alpha":this._startPos,
                  "delay":_loc8_[_loc10_][_loc11_] * this._delay + this._alphaDelay,
                  "ease":this.easeFunc,
                  "onComplete":motionFinish2,
                  "onCompleteParams":[elementObject]
               });
               _loc11_++;
            }
            this.component.textOwnerClip.visible = false;
            _loc10_++;
         }
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
      
      protected function blurEffect(param1:*, param2:Number, param3:uint = 2) : void
      {
         var _loc4_:BitmapFilter = new BlurFilter(param2,param2,param3);
         var _loc5_:Array = new Array();
         _loc5_.push(_loc4_);
         param1.filters = _loc5_;
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
         rest[0].mc2.filters = [];
         rest[0].mc.filters = [];
         owner.tweensFinished2++;
         if(owner.tweensFinished2 == owner.tweensNumber)
         {
            if(owner.show == true)
            {
               this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
               this.clearProperties();
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
      
      override public function hide() : void
      {
         if(this.component != null)
         {
            this.startTransition(false);
         }
      }
      
      protected function motionFinish2(... rest) : void
      {
         owner.tweensFinished++;
         if(owner.tweensFinished == owner.tweensNumber)
         {
            if(owner.show == false)
            {
               this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
               this.clearProperties();
            }
         }
      }
      
      public function get phase() : Number
      {
         return this._phase;
      }
      
      public function set phase(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 8;
         }
         this._phase = param1;
      }
      
      public function get direction() : String
      {
         return this._direction;
      }
   }
}
