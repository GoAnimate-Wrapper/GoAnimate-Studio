package com.jumpeye.flashEff2.symbol.squareEffect
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffSymbol;
   import com.jumpeye.transitions.TweenLite;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   
   public class FESSquareExplode extends IFlashEffSymbol
   {
       
      
      protected var col:Number = 0;
      
      private var _squareHeight:Number = 20;
      
      private var _maxExplosionDistance:Number = 200;
      
      protected var lin:Number = 0;
      
      private var alphaFinish:Number;
      
      private var alphaStart:Number;
      
      private var _maxScale:Number = 2;
      
      private var _groupDuration:Number = 1;
      
      protected var targetBounds:Rectangle;
      
      protected var squareObjects:Object;
      
      protected var finalSquareHeight:Number = 20;
      
      protected var isShow:Boolean = true;
      
      protected var finalSquareWidth:Number = 20;
      
      protected var squaresOwner:Sprite;
      
      public var forceSquareDimension:Boolean = false;
      
      private var _squareWidth:Number = 20;
      
      protected var masksOwner:Sprite;
      
      protected var timeMatrix:Array;
      
      protected var tweensFinished:Number = 0;
      
      private var _preset:Number = 1;
      
      public function FESSquareExplode(param1:JUIComponent = null)
      {
         super();
         this.component = param1;
         this.init();
      }
      
      protected function squareStartTransition(param1:Sprite) : void
      {
         param1.visible = true;
      }
      
      override public function remove() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:Object = null;
         if(this.squaresOwner != null)
         {
            if(this.squaresOwner.parent != null)
            {
               this.squaresOwner.parent.removeChild(this.squaresOwner);
            }
            this.squaresOwner = null;
            if(this.masksOwner.parent != null)
            {
               this.masksOwner.parent.removeChild(this.masksOwner);
            }
            this.target.mask = null;
         }
         if(this.squareObjects != null)
         {
            _loc1_ = 0;
            while(_loc1_ < this.lin)
            {
               _loc2_ = 0;
               while(_loc2_ < this.col)
               {
                  _loc3_ = this.squareObjects["clip" + _loc1_ + "_" + _loc2_];
                  TweenLite.killTweensOf(_loc3_.clip,false);
                  _loc2_++;
               }
               _loc1_++;
            }
         }
         if(this.target != null)
         {
            this.target.removeEventListener(Event.ENTER_FRAME,this.waitAFrame);
         }
         this.squareObjects = null;
         this.timeMatrix = null;
      }
      
      public function set maxScale(param1:Number) : void
      {
         _maxScale = param1;
      }
      
      protected function init() : void
      {
         _tweenDuration = 1.5;
         _easeType = "easeOut";
         _tweenType = "Quadratic";
      }
      
      protected function drawSquares(param1:uint, param2:Number) : void
      {
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         var _loc8_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:uint = 0;
         var _loc12_:Number = NaN;
         var _loc13_:Sprite = null;
         var _loc14_:* = undefined;
         var _loc15_:Number = NaN;
         var _loc16_:Object = null;
         var _loc17_:BitmapData = null;
         var _loc18_:Matrix = null;
         this.timeMatrix = [];
         this.squareObjects = {};
         var _loc3_:* = Math.round(this.finalSquareHeight);
         var _loc4_:* = Math.round(this.finalSquareWidth);
         _loc6_ = 0;
         _loc8_ = 0;
         var _loc9_:uint = 0;
         while(_loc9_ < this.lin)
         {
            this.timeMatrix[_loc9_] = [];
            _loc5_ = 0;
            _loc7_ = 0;
            _loc10_ = Math.floor(_loc8_);
            if(_loc9_ == this.lin - 1)
            {
               _loc10_ = Math.ceil(_loc8_ + this.finalSquareHeight - _loc3_);
            }
            _loc11_ = 0;
            while(_loc11_ < this.col)
            {
               this.timeMatrix[_loc9_][_loc11_] = 0;
               _loc12_ = Math.floor(_loc7_);
               if(_loc11_ == this.col - 1)
               {
                  _loc12_ = Math.ceil(_loc7_ + this.finalSquareWidth - _loc4_);
               }
               _loc13_ = new Sprite();
               this.createRectangle(_loc13_,_loc4_ + _loc12_,_loc3_ + _loc10_);
               _loc13_.x = _loc5_;
               _loc13_.y = _loc6_;
               _loc13_.alpha = param2;
               masksOwner.addChild(_loc13_);
               _loc14_ = new Sprite();
               _loc14_.name = "clip" + _loc9_ + "_" + _loc11_;
               _loc15_ = 2 - Math.random() * this.maxScale;
               _loc16_ = this.squareObjects["clip" + _loc9_ + "_" + _loc11_] = {
                  "clip":_loc14_,
                  "scaleX":_loc15_,
                  "scaleY":_loc15_,
                  "x":Math.random() * this.maxExplosionDistance - this.maxExplosionDistance / 2,
                  "y":Math.random() * this.maxExplosionDistance - this.maxExplosionDistance / 2,
                  "aliasMask":_loc13_
               };
               _loc14_.x = _loc5_;
               _loc14_.y = _loc6_;
               _loc14_.visible = false;
               _loc16_.width = _loc4_ + _loc12_;
               _loc16_.height = _loc3_ + _loc10_;
               _loc17_ = new BitmapData(_loc16_.width,_loc16_.height,true,16711935);
               _loc18_ = new Matrix();
               _loc18_.translate(-_loc5_ / this.target.scaleX - targetBounds.x,-_loc6_ / this.target.scaleY - targetBounds.y);
               _loc18_.scale(this.target.scaleX,this.target.scaleY);
               _loc17_.draw(this.target,_loc18_);
               _loc14_.addChild(new Bitmap(_loc17_));
               squaresOwner.addChild(_loc14_);
               _loc14_.alpha = param1;
               _loc5_ = _loc5_ + _loc16_.width;
               _loc7_ = _loc7_ + this.finalSquareWidth - _loc16_.width;
               _loc11_++;
            }
            _loc6_ = _loc6_ + (_loc3_ + _loc10_);
            _loc8_ = _loc8_ + this.finalSquareHeight - _loc3_ - _loc10_;
            _loc9_++;
         }
      }
      
      protected function squareBrightnessChange(param1:Object, param2:Number, param3:Number) : void
      {
         param1.aliasMask.alpha = param2 + (param3 - param2) * param1.clip.alpha * 0.1;
      }
      
      public function get maxExplosionDistance() : Number
      {
         return _maxExplosionDistance;
      }
      
      public function get squareHeight() : Number
      {
         return this._squareHeight;
      }
      
      public function get squareWidth() : Number
      {
         return this._squareWidth;
      }
      
      public function get groupDuration() : Number
      {
         return this._groupDuration;
      }
      
      public function set preset(param1:Number) : void
      {
         this._preset = param1;
      }
      
      public function get maxScale() : Number
      {
         return _maxScale;
      }
      
      override public function hide() : void
      {
         if(this.component != null)
         {
            this.startTransition(false);
         }
      }
      
      public function set squareHeight(param1:Number) : *
      {
         if(param1 < 1)
         {
            param1 = 1;
         }
         this._squareHeight = param1;
         this.finalSquareHeight = param1;
      }
      
      public function set squareWidth(param1:Number) : *
      {
         if(param1 < 1)
         {
            param1 = 1;
         }
         this._squareWidth = param1;
         this.finalSquareWidth = param1;
      }
      
      protected function startTransition(param1:Boolean) : void
      {
         this.targetBounds = this.target.getBounds(this.target);
         if(this.squareHeight > this.targetBounds.height * this.target.scaleY)
         {
            this.finalSquareHeight = this.targetBounds.height * this.target.scaleY;
         }
         if(this.squareWidth > this.targetBounds.width * this.target.scaleX)
         {
            this.finalSquareWidth = this.targetBounds.width * this.target.scaleX;
         }
         this.lin = Math.floor(this.targetBounds.height * this.target.scaleY / this.finalSquareHeight);
         this.col = Math.floor(this.targetBounds.width * this.target.scaleX / this.finalSquareWidth);
         isShow = param1;
         if(forceSquareDimension == false)
         {
            if(lin * col > 1600)
            {
               this.lin = Math.min(this.lin,40);
               this.col = Math.min(this.col,40);
            }
         }
         this.finalSquareHeight = this.targetBounds.height / this.lin * this.target.scaleY;
         this.finalSquareWidth = this.targetBounds.width / this.col * this.target.scaleX;
         alphaStart = 0;
         alphaFinish = 1;
         if(param1 == true)
         {
            alphaStart = 1;
            alphaFinish = 0;
         }
         squaresOwner = new Sprite();
         masksOwner = new Sprite();
         squaresOwner.name = "squaresOwner";
         var _loc2_:uint = 0;
         if(this.target is TextField)
         {
            _loc2_ = 2;
         }
         masksOwner.x = squaresOwner.x = this.target.x + this.targetBounds.x * this.target.scaleX + _loc2_;
         masksOwner.y = squaresOwner.y = this.target.y + this.targetBounds.y * this.target.scaleY + _loc2_;
         squaresOwner.rotation = this.target.rotation;
         this.component.targetOwner.addChild(masksOwner);
         this.component.targetOwner.addChild(squaresOwner);
         this.target.cacheAsBitmap = true;
         masksOwner.cacheAsBitmap = true;
         this.drawSquares(1,alphaFinish);
         this.target.mask = masksOwner;
         this.tweensFinished = 0;
         this.target.addEventListener(Event.ENTER_FRAME,this.waitAFrame,false,0,true);
      }
      
      protected function createRectangle(param1:Sprite, param2:Number, param3:Number) : void
      {
         var clip:Sprite = param1;
         var w:Number = param2;
         var h:Number = param3;
         with(clip.graphics)
         {
            
            beginFill(16711680,100);
            lineTo(w,0);
            lineTo(w,h);
            lineTo(0,h);
            lineTo(0,0);
            endFill();
         }
      }
      
      public function set maxExplosionDistance(param1:Number) : void
      {
         _maxExplosionDistance = param1;
      }
      
      public function get preset() : Number
      {
         return this._preset;
      }
      
      protected function waitAFrame(param1:Event) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:uint = 0;
         var _loc5_:Number = NaN;
         var _loc6_:Object = null;
         this.target.removeEventListener(Event.ENTER_FRAME,this.waitAFrame);
         var _loc4_:Array = [];
         JFESquarePresets.getPresetsArray(this.preset,this.lin,this.col,this.timeMatrix,_loc4_);
         if(_loc4_.MAX > 2)
         {
            _loc5_ = Math.max((this.tweenDuration - this.groupDuration) / (_loc4_.MAX - 1),0);
         }
         else
         {
            _loc5_ = Math.max(this.tweenDuration - this.groupDuration,0);
         }
         _loc2_ = 0;
         while(_loc2_ < this.lin)
         {
            _loc3_ = 0;
            while(_loc3_ < this.col)
            {
               _loc6_ = this.squareObjects["clip" + _loc2_ + "_" + _loc3_];
               TweenLite.to(_loc6_.clip,this.groupDuration,{
                  "scaleX":_loc6_.scaleX,
                  "scaleY":_loc6_.scaleY,
                  "alpha":0,
                  "x":_loc6_.clip.x + _loc6_.x,
                  "y":_loc6_.clip.y + _loc6_.y,
                  "delay":this.timeMatrix[_loc2_][_loc3_] * _loc5_,
                  "onStart":this.squareStartTransition,
                  "onStartParams":[_loc6_.clip],
                  "ease":this.easeFunc,
                  "onUpdate":squareBrightnessChange,
                  "onUpdateParams":[_loc6_,alphaStart,alphaFinish],
                  "onComplete":motionFinish,
                  "onCompleteParams":[_loc6_]
               });
               _loc3_++;
            }
            _loc2_++;
         }
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
      
      public function set groupDuration(param1:Number) : void
      {
         if(param1 < 0.001)
         {
            param1 = 0.001;
         }
         this._groupDuration = param1;
      }
      
      protected function motionFinish(param1:Object) : void
      {
         if(param1.clip != null)
         {
            param1.clip.removeChildAt(0);
         }
         tweensFinished++;
         if(tweensFinished == this.lin * this.col)
         {
            this.remove();
            if(this.isShow == false)
            {
               if(this.target != null)
               {
                  this.target.visible = false;
               }
            }
            this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
         }
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
