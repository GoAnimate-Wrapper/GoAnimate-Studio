package com.jumpeye.flashEff2.symbol.intersectingStripes
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffSymbol;
   import com.jumpeye.transitions.TweenLite;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.filters.BitmapFilter;
   import flash.filters.BlurFilter;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   
   public class FESIntersectingStripes extends IFlashEffSymbol
   {
       
      
      private var col:Number;
      
      private var delay;
      
      private var _waveThickness:Number = 10;
      
      private var sqWidth;
      
      private var lin;
      
      private var startPos:uint = 0;
      
      private var targetHeight:Number;
      
      private var isMotionFinished:Boolean;
      
      private var sqHeight:Number;
      
      protected var targetBounds:Rectangle;
      
      private var _maxBlurX:Number = 20;
      
      private var _maxBlurY:Number = 20;
      
      private var _groupDuration:Number = 1;
      
      private var targetWidth;
      
      private var maxItems:Number;
      
      private var finishPos:uint = 1;
      
      private var aux:Boolean;
      
      private var _height;
      
      private var scale:String;
      
      private var bm:Bitmap;
      
      private var maskClip:MovieClip;
      
      private var start;
      
      private var _duration:Number;
      
      private var final:Number;
      
      private var obj:Object;
      
      private var bmd:BitmapData;
      
      private var tweensFinished:Number = 0;
      
      private var _preset:Number = 1;
      
      public function FESIntersectingStripes(param1:JUIComponent = null)
      {
         super();
         this.component = param1;
         this.init();
      }
      
      protected function drawSquare(param1:Boolean) : void
      {
         var _loc4_:* = undefined;
         var _loc5_:Number = NaN;
         var _loc8_:* = undefined;
         var _loc2_:* = this;
         if(aux == true)
         {
            start = 0;
            final = 1;
         }
         else
         {
            start = 1;
            final = 0;
         }
         this.targetBounds = this.target.getBounds(this.target);
         this.targetWidth = this.targetBounds.width * this.target.scaleX;
         this.targetHeight = this.targetBounds.height * this.target.scaleY;
         if(param1 == false)
         {
            if(_waveThickness > this.targetHeight)
            {
               _waveThickness = this.targetHeight;
            }
            sqWidth = this.targetWidth;
            sqHeight = _waveThickness;
         }
         else
         {
            if(_waveThickness > this.targetWidth)
            {
               _waveThickness = this.targetWidth;
            }
            sqWidth = _waveThickness;
            sqHeight = _waveThickness;
         }
         this.lin = Math.floor(this.targetHeight / this.sqHeight);
         this.col = Math.floor(this.targetWidth / this.sqWidth);
         var _loc3_:* = this.sqHeight;
         if(param1 == true)
         {
            this.lin = 1;
         }
         else
         {
            this.col = 1;
         }
         delay = Math.max((this.tweenDuration - this._groupDuration) / (this.lin * this.col - 1),0);
         if(this.lin * this.col - 1 == 0)
         {
            delay = 0;
         }
         _loc4_ = _loc5_ = 0;
         if(this.targetHeight / this.sqHeight != this.lin)
         {
            _loc4_ = (this.targetHeight - this.lin * this.sqHeight) / this.lin;
            this.sqHeight = this.sqHeight + Math.ceil(_loc4_);
         }
         if(this.targetWidth / this.sqWidth != this.col)
         {
            _loc5_ = (this.targetWidth - this.col * this.sqWidth) / this.col;
            this.sqWidth = this.sqWidth + Math.ceil(_loc5_);
         }
         maskClip = new MovieClip();
         this.maskClip.name = "maskClip";
         this.component.targetOwner.addChild(maskClip);
         var _loc6_:int = 0;
         if(this.target is TextField)
         {
            _loc6_ = 2;
         }
         var _loc7_:* = 0;
         while(_loc7_ < this.lin)
         {
            _loc8_ = 0;
            while(_loc8_ < this.col)
            {
               obj = this.component.targetOwner.clips["maskClip" + _loc7_ + "_" + _loc8_] = {};
               obj.clip = this.component.targetOwner.addChild(new MovieClip());
               obj.clip.x = this.targetBounds.x * this.target.scaleX + _loc8_ * this.sqWidth;
               obj.clip.y = this.targetBounds.y * this.target.scaleY + _loc7_ * this.sqHeight;
               _loc2_.createRectangle(obj.clip,this.sqWidth,this.sqHeight);
               obj.clip.x = obj.clip.x + _loc6_;
               obj.clip.y = obj.clip.y + _loc6_;
               obj.bmd = bmd;
               obj.bm = bm;
               if(this.preset == 3 || this.preset == 4 || this.preset == 7 || this.preset == 8)
               {
                  if(_loc7_ % 2 == 0)
                  {
                     obj.startx = obj.clip.x;
                     obj.starty = obj.clip.y;
                     obj.finalx = obj.clip.x + this.target.width;
                     obj.finaly = obj.clip.y + obj.clip.height;
                  }
                  else
                  {
                     obj.startx = obj.clip.x;
                     obj.starty = obj.clip.y;
                     obj.finalx = obj.clip.x;
                     obj.finaly = obj.clip.y;
                  }
                  obj.finalscaleX = 0;
                  obj.finalscaleY = 0;
                  obj.startscaleX = 1;
                  obj.startscaleY = 1;
               }
               else
               {
                  if(_loc8_ % 2 == 0)
                  {
                     obj.startx = obj.clip.x;
                     obj.starty = obj.clip.y;
                     obj.finalx = obj.clip.x;
                     obj.finaly = obj.clip.y + this.target.height;
                  }
                  else
                  {
                     obj.startx = obj.clip.x;
                     obj.starty = obj.clip.y;
                     obj.finalx = obj.clip.x;
                     obj.finaly = obj.clip.y;
                  }
                  obj.finalscaleX = 0;
                  obj.finalscaleY = 0;
                  obj.startscaleX = 1;
                  obj.startscaleY = 1;
               }
               if(aux == true)
               {
                  obj.clip[scale] = 0;
               }
               _loc8_++;
            }
            _loc7_++;
         }
         maskClip.x = this.target.x;
         maskClip.y = this.target.y;
         maskClip.rotation = this.target.rotation;
      }
      
      override public function show() : void
      {
         startTransition(true);
      }
      
      private function coordonate(param1:Object, param2:Sprite, param3:Number) : *
      {
         param2.x = param1.finalx - (param1.finalx - param1.startx) * Math.abs(1 - param3);
         param2.y = param1.finaly - (param1.finaly - param1.starty) * Math.abs(1 - param3);
         param2.scaleX = param1.finalscaleX - (param1.finalscaleX - param1.startscaleX) * Math.abs(1 - param3);
         param2.scaleY = param1.finalscaleY - (param1.finalscaleY - param1.startscaleY) * Math.abs(1 - param3);
      }
      
      protected function motionChange(param1:*) : void
      {
         var _loc2_:* = param1;
         var _loc3_:* = param1.prop;
         var _loc4_:Number = _loc2_.prop * this.maxBlurX;
         var _loc5_:Number = _loc2_.prop * this.maxBlurY;
         coordonate(_loc2_,_loc2_.clip,_loc3_);
         alphaTween(_loc2_.clip,_loc3_);
         blurEffect(_loc2_.clip,_loc4_,_loc5_);
      }
      
      override public function remove() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:Object = null;
         if(this.target)
         {
            this.target.visible = true;
         }
         if(maskClip is Sprite)
         {
            this.target.mask = null;
            this.component.targetOwner.removeChild(maskClip);
            maskClip = null;
         }
         if(this.component.targetOwner.clips != null)
         {
            _loc1_ = 0;
            while(_loc1_ < this.lin)
            {
               _loc2_ = 0;
               while(_loc2_ < this.col)
               {
                  _loc3_ = this.component.targetOwner.clips["maskClip" + _loc1_ + "_" + _loc2_];
                  if(_loc3_ != null)
                  {
                     _loc3_.clip.filters = [];
                     _loc3_.bmd.dispose();
                     TweenLite.killTweensOf(_loc3_,false);
                     TweenLite.killTweensOf(_loc3_.clip,false);
                     if(_loc3_.bm)
                     {
                        _loc3_.clip.removeChild(_loc3_.bm);
                     }
                     if(_loc3_.clip)
                     {
                        this.component.targetOwner.removeChild(_loc3_.clip);
                     }
                  }
                  _loc2_++;
               }
               _loc1_++;
            }
         }
         this.component.targetOwner.clips = null;
      }
      
      protected function init() : void
      {
         _tweenDuration = 1.3;
         _easeType = "easeOut";
         _tweenType = "Bounce";
      }
      
      public function set maxBlurX(param1:Number) : void
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
         this._maxBlurX = Number(Number(param1)) || Number(0);
      }
      
      public function get duration() : *
      {
         return this._duration;
      }
      
      public function set maxBlurY(param1:Number) : void
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
         this._maxBlurY = Number(Number(param1)) || Number(0);
      }
      
      public function set duration(param1:Number) : void
      {
         this._duration = param1;
      }
      
      public function get groupDuration() : *
      {
         return this._groupDuration;
      }
      
      public function set preset(param1:Number) : void
      {
         this._preset = param1;
      }
      
      override public function hide() : void
      {
         startTransition(false);
      }
      
      private function alphaTween(param1:*, param2:Number) : *
      {
         param1.alpha = Math.abs(1 - param2);
      }
      
      public function get maxBlurX() : Number
      {
         return this._maxBlurX;
      }
      
      public function get maxBlurY() : Number
      {
         return this._maxBlurY;
      }
      
      private function createRectangle(param1:Sprite, param2:*, param3:*) : *
      {
         var clip:Sprite = param1;
         var _wid:* = param2;
         var _hei:* = param3;
         bmd = new BitmapData(_wid,_hei,true,52224);
         var matrix:Matrix = new Matrix();
         matrix.scale(this.target.scaleX,this.target.scaleY);
         matrix.translate(-clip.x,-clip.y);
         bmd.draw(this.target,matrix);
         with(clip.graphics)
         {
            
         }
         bm = new Bitmap(bmd);
         clip.addChild(bm);
      }
      
      private function startSquareTransition(param1:*, param2:*) : void
      {
         var _loc3_:* = this;
         if(aux == true)
         {
            param2.clip.alpha = 0;
         }
         param2.tweenObject = {};
         param2.clip.scale = 1;
         if(scale == "scaleY")
         {
            TweenLite.to(param2.clip,this._groupDuration,{
               "scaleY":1,
               "delay":param1,
               "overwrite":false,
               "ease":this.easeFunc,
               "onComplete":motionFinish,
               "onCompleteParams":[param2,param2.clip]
            });
         }
         else
         {
            TweenLite.to(param2.clip,this._groupDuration,{
               "scaleX":1,
               "delay":param1,
               "overwrite":false,
               "ease":this.easeFunc,
               "onComplete":motionFinish,
               "onCompleteParams":[param2,param2.clip]
            });
         }
         param2.prop = startPos;
         TweenLite.to(param2,this._groupDuration,{
            "prop":finishPos,
            "delay":param1,
            "overwrite":false,
            "ease":this.easeFunc,
            "onUpdate":motionChange,
            "onUpdateParams":[param2]
         });
      }
      
      private function startTransition(param1:Boolean) : *
      {
         var _loc4_:* = undefined;
         var _loc5_:uint = 0;
         var _loc6_:* = undefined;
         var _loc7_:Number = NaN;
         var _loc8_:* = undefined;
         var _loc9_:* = undefined;
         startPos = 0;
         finishPos = 1;
         this.target.visible = false;
         if(param1 == true)
         {
            startPos = 1;
            finishPos = 0;
         }
         tweensFinished = 0;
         aux = param1;
         var _loc2_:* = this.component.targetOwner;
         var _loc3_:* = this;
         _loc2_.clips = {};
         switch(Number(this._preset))
         {
            default:
               this.scale = "scaleX";
               this.drawSquare(true);
               _loc4_ = 0;
               while(_loc4_ < this.col)
               {
                  _loc9_ = _loc2_.clips["maskClip0_" + _loc4_];
                  _loc3_.initSquare(_loc9_.clip);
                  startSquareTransition(_loc4_ * this.delay,_loc9_);
                  _loc4_++;
               }
               break;
            case 2:
               this.scale = "scaleX";
               this.drawSquare(true);
               _loc4_ = 0;
               while(_loc4_ < this.col)
               {
                  _loc9_ = _loc2_.clips["maskClip0_" + _loc4_];
                  this.initSquare(_loc9_.clip);
                  startSquareTransition((this.col - _loc4_ - 1) * this.delay,_loc9_);
                  this.maskClip.rotation = this.target.rotation;
                  _loc4_++;
               }
               break;
            case 3:
               this.scale = "scaleY";
               this.drawSquare(false);
               _loc4_ = 0;
               while(_loc4_ < this.lin)
               {
                  _loc9_ = _loc2_.clips["maskClip" + _loc4_ + "_" + 0];
                  this.initSquare(_loc9_.clip);
                  startSquareTransition(_loc4_ * this.delay,_loc9_);
                  this.maskClip.rotation = this.target.rotation;
                  _loc4_++;
               }
               break;
            case 4:
               this.scale = "scaleY";
               this.drawSquare(false);
               _loc4_ = 0;
               while(_loc4_ < this.lin)
               {
                  _loc9_ = _loc2_.clips["maskClip" + _loc4_ + "_" + 0];
                  this.initSquare(_loc9_.clip);
                  startSquareTransition((this.lin - _loc4_ - 1) * this.delay,_loc9_);
                  this.maskClip.rotation = this.target.rotation;
                  _loc4_++;
               }
               break;
            case 5:
               this.scale = "scaleX";
               this.drawSquare(true);
               _loc6_ = Math.floor(this.col / 2);
               _loc7_ = 1;
               maxItems = _loc6_ * this.lin;
               this.maskClip.rotation = this.target.rotation;
               if(_loc6_ == (this.col - 1) / 2)
               {
                  maxItems++;
                  _loc7_ = 0;
                  _loc9_ = _loc2_.clips["maskClip0_" + _loc6_];
                  this.initSquare(_loc9_.clip);
                  startSquareTransition(0,_loc9_);
               }
               delay = Math.max((this.tweenDuration - this._groupDuration) / (maxItems - 1),0);
               _loc4_ = 0;
               while(_loc4_ < _loc6_)
               {
                  _loc9_ = _loc2_.clips["maskClip0_" + _loc4_];
                  this.initSquare(_loc9_.clip);
                  startSquareTransition((_loc6_ - _loc4_ - _loc7_) * this.delay,_loc9_);
                  _loc9_ = _loc2_.clips["maskClip0_" + (this.col - _loc4_ - 1)];
                  this.initSquare(_loc9_.clip);
                  startSquareTransition((_loc6_ - _loc4_ - _loc7_) * this.delay,_loc9_);
                  _loc4_++;
               }
               break;
            case 6:
               this.scale = "scaleX";
               this.drawSquare(true);
               _loc6_ = Math.floor(this.col / 2);
               maxItems = _loc6_ * this.lin;
               this.maskClip.rotation = this.target.rotation;
               if(_loc6_ == (this.col - 1) / 2)
               {
                  maxItems++;
                  delay = Math.max((this.tweenDuration - this._groupDuration) / (maxItems - 1),0);
                  _loc9_ = _loc2_.clips["maskClip0_" + _loc6_];
                  this.initSquare(_loc9_.clip);
                  startSquareTransition(_loc6_ * this.delay,_loc9_);
               }
               delay = Math.max((this.tweenDuration - this._groupDuration) / (maxItems - 1),0);
               _loc4_ = 0;
               while(_loc4_ < _loc6_)
               {
                  _loc9_ = _loc2_.clips["maskClip0_" + _loc4_];
                  this.initSquare(_loc9_.clip);
                  startSquareTransition(_loc4_ * this.delay,_loc9_);
                  _loc9_ = _loc2_.clips["maskClip0_" + (this.col - _loc4_ - 1)];
                  this.col - _loc4_ - 1;
                  this.initSquare(_loc9_.clip);
                  startSquareTransition(_loc4_ * this.delay,_loc9_);
                  _loc4_++;
               }
               break;
            case 7:
               this.scale = "scaleY";
               this.drawSquare(false);
               this.maskClip.rotation = this.target.rotation;
               _loc7_ = 1;
               _loc8_ = Math.floor(this.lin / 2);
               maxItems = _loc8_ * this.col;
               if(_loc8_ == (this.lin - 1) / 2)
               {
                  maxItems++;
                  _loc7_ = 0;
                  _loc9_ = _loc2_.clips["maskClip" + _loc8_ + "_" + 0];
                  this.initSquare(_loc9_.clip);
                  startSquareTransition(0,_loc9_);
               }
               delay = Math.max((this.tweenDuration - this._groupDuration) / (maxItems - 1),0);
               _loc4_ = 0;
               while(_loc4_ < _loc8_)
               {
                  _loc9_ = _loc2_.clips["maskClip" + _loc4_ + "_" + 0];
                  this.initSquare(_loc9_.clip);
                  startSquareTransition((_loc8_ - _loc4_ - _loc7_) * this.delay,_loc9_);
                  _loc9_ = _loc2_.clips["maskClip" + (this.lin - _loc4_ - 1) + "_" + 0];
                  startSquareTransition((_loc8_ - _loc4_ - _loc7_) * this.delay,_loc9_);
                  _loc4_++;
               }
               break;
            case 8:
               this.scale = "scaleY";
               this.drawSquare(false);
               _loc8_ = Math.floor(this.lin / 2);
               maxItems = _loc8_ * this.col;
               if(_loc8_ == (this.lin - 1) / 2)
               {
                  maxItems++;
                  delay = Math.max((this.tweenDuration - this._groupDuration) / (maxItems - 1),0);
                  _loc9_ = _loc2_.clips["maskClip" + _loc8_ + "_" + 0];
                  this.initSquare(_loc9_.clip);
                  startSquareTransition(_loc8_ * this.delay,_loc9_);
               }
               delay = Math.max((this.tweenDuration - this._groupDuration) / (maxItems - 1),0);
               _loc4_ = 0;
               while(_loc4_ < _loc8_)
               {
                  _loc9_ = _loc2_.clips["maskClip" + _loc4_ + "_" + 0];
                  this.initSquare(_loc9_.clip);
                  startSquareTransition(_loc4_ * this.delay,_loc9_);
                  _loc9_ = _loc2_.clips["maskClip" + (this.lin - _loc4_ - 1) + "_" + 0];
                  startSquareTransition(_loc4_ * this.delay,_loc9_);
                  _loc4_++;
               }
         }
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
      
      public function get preset() : Number
      {
         return this._preset;
      }
      
      private function initSquare(param1:Sprite) : *
      {
         if(aux == true)
         {
            param1[scale] = 0;
         }
         else
         {
            param1[scale] = 1;
         }
      }
      
      private function blurEffect(param1:*, param2:Number, param3:Number, param4:uint = 2) : *
      {
         var _loc5_:BitmapFilter = new BlurFilter(param2,param3,param4);
         var _loc6_:Array = new Array();
         _loc6_.push(_loc5_);
         param1.filters = _loc6_;
      }
      
      protected function motionFinish(param1:*, param2:*) : void
      {
         param2.filters = [];
         tweensFinished++;
         if(tweensFinished == this.lin * this.col)
         {
            remove();
            if(aux == false)
            {
               this.target.visible = false;
            }
            else
            {
               this.target.visible = true;
            }
            if(maskClip)
            {
               this.target.mask = null;
               this.component.targetOwner.removeChild(maskClip);
               maskClip = null;
            }
            this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
         }
      }
      
      public function set groupDuration(param1:Number) : void
      {
         if(param1 <= 0)
         {
            param1 = 0.001;
         }
         this._groupDuration = param1;
      }
      
      public function get waveThickness() : *
      {
         return this._waveThickness;
      }
      
      public function set waveThickness(param1:Number) : void
      {
         if(isNaN(param1))
         {
            param1 = 15;
         }
         else if(param1 <= 0)
         {
            param1 = 1;
         }
         this._waveThickness = param1;
      }
   }
}
