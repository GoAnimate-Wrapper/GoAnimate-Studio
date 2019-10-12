package com.jumpeye.flashEff2.text.wavesMask
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffText;
   import com.jumpeye.transitions.TweenLite;
   import flash.display.Sprite;
   import flash.filters.BitmapFilter;
   import flash.filters.BlurFilter;
   
   public class FETWavesMask extends IFlashEffText
   {
       
      
      private var col:Number = 0;
      
      private var delay:Number;
      
      private var _preset:Number = 1;
      
      private var sqWidth;
      
      private var lin;
      
      private var finalrot;
      
      private var sqHeight:Number;
      
      private var finalDuration:Number;
      
      private var _maxBlurX:Number = 10;
      
      private var _maxBlurY:Number = 10;
      
      protected var owner:Object;
      
      private var _groupDuration:Number = 0.8;
      
      private var startrot;
      
      private var maxItems:Number;
      
      private var bol:Boolean;
      
      private var newDelay:Number;
      
      private var scale;
      
      private var _maxRotation:Number = 180;
      
      private var _blurQuality:Number = 2;
      
      private var showTr:Boolean = true;
      
      private var maskClip:Sprite;
      
      private var prop:Number = 0;
      
      private var finalxposition;
      
      private var finalyposition:Number;
      
      private var timeMatrix:Array;
      
      private var tweensFinished:Number = 0;
      
      private var _waveThickness:Number = 10;
      
      public function FETWavesMask(param1:JUIComponent = null)
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
         var _loc9_:* = undefined;
         var _loc2_:* = this;
         if(param1 == false)
         {
            if(_waveThickness > this.component.textOwnerClip.height)
            {
               _waveThickness = this.component.textOwnerClip.height;
            }
            sqWidth = this.component.textOwnerClip.width;
            sqHeight = _waveThickness;
         }
         else
         {
            if(_waveThickness > this.component.textOwnerClip.width)
            {
               _waveThickness = this.component.textOwnerClip.width;
            }
            sqWidth = _waveThickness;
            sqHeight = _waveThickness;
         }
         this.lin = Math.floor(this.component.textOwnerClip.height / sqHeight);
         this.col = Math.floor(this.component.textOwnerClip.width / sqWidth);
         var _loc3_:* = sqHeight;
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
         if(this.component.textOwnerClip.height / sqHeight != this.lin)
         {
            _loc4_ = (this.component.textOwnerClip.height - this.lin * sqHeight) / this.lin;
            sqHeight = sqHeight + Math.ceil(_loc4_);
         }
         if(this.component.textOwnerClip.width / sqWidth != this.col)
         {
            _loc5_ = (this.component.textOwnerClip.width - this.col * sqWidth) / this.col;
            sqWidth = sqWidth + Math.ceil(_loc5_);
         }
         maskClip = new Sprite();
         this.maskClip.name = "maskClip";
         this.component.targetOwner.addChild(maskClip);
         var _loc6_:* = 0;
         while(_loc6_ < this.lin)
         {
            _loc8_ = 0;
            while(_loc8_ < this.col)
            {
               _loc9_ = owner.clips["maskClip" + _loc6_ + "_" + _loc8_] = {};
               _loc9_.clip = maskClip.addChild(new Sprite());
               _loc2_.createRectangle(_loc9_.clip,sqWidth,sqHeight);
               _loc9_.clip.x = _loc8_ * sqWidth;
               _loc9_.clip.y = _loc6_ * sqHeight;
               if(show == true)
               {
                  _loc9_.clip[scale] = 0;
               }
               _loc8_++;
            }
            _loc6_++;
         }
         maskClip.cacheAsBitmap = true;
         this.component.textOwnerClip.mask = maskClip;
         var _loc7_:* = this.component.textOwnerClip.getBounds(this.component.textOwnerClip);
         maskClip.x = this.component.textOwnerClip.x + _loc7_.x;
         maskClip.y = this.component.textOwnerClip.y;
         maskClip.rotation = this.target.rotation;
         maskClip.visible = false;
      }
      
      public function get maxRotation() : Number
      {
         return this._maxRotation;
      }
      
      public function set maxRotation(param1:Number) : void
      {
         if(isNaN(Number(param1)))
         {
            param1 = 90;
         }
         if(param1 < -180 || param1 > 180)
         {
            param1 = param1 - int(param1 / 180) * 180;
         }
         this._maxRotation = param1;
      }
      
      override public function remove() : void
      {
         this.clearProperties();
      }
      
      protected function init() : void
      {
         _tweenDuration = 1.5;
         _tweenType = "Strong";
         _easeType = "easeInOut";
      }
      
      public function get blurQuality() : Number
      {
         return this._blurQuality;
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
      
      private function motionChange(param1:Object) : *
      {
         var _loc2_:* = param1.prop;
         param1.clip[this.scale] = _loc2_;
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
      
      public function set preset(param1:Number) : void
      {
         this._preset = param1;
      }
      
      override public function hide() : void
      {
         if(this.component != null)
         {
            this.startTransition(false);
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
      
      private function createRectangle(param1:Sprite, param2:*, param3:*) : *
      {
         var clip:Sprite = param1;
         var _wid:* = param2;
         var _hei:* = param3;
         with(clip.graphics)
         {
            
            beginFill(0);
            drawRect(0,0,_wid,_hei);
            endFill();
         }
      }
      
      protected function startTransition(param1:Boolean = true) : void
      {
         var _loc2_:Array = null;
         var _loc4_:Object = null;
         var _loc5_:* = undefined;
         var _loc6_:uint = 0;
         var _loc10_:* = undefined;
         var _loc11_:* = undefined;
         var _loc12_:* = undefined;
         var _loc13_:Number = NaN;
         var _loc14_:* = undefined;
         bol = param1;
         owner = new Object();
         var _loc3_:* = this;
         var _loc7_:Number = Number(Number(this.preset)) || Number(9);
         showTr = param1;
         this.component.drawTextTable("chars",this.partialGroup,this.partialPercent,this.selectedStrings,this.partialStart,this.partialBlurAmount);
         tweensFinished = 0;
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
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
         owner.clips = {};
         owner.tweensNumber = this.component.textTable.childs.length;
         if(owner.maxItems <= 1)
         {
            delay = 0;
         }
         else
         {
            delay = Math.max((this.tweenDuration - this.groupDuration) / owner.maxItems - 1,0);
         }
         switch(Number(this._preset))
         {
            default:
               this.scale = "scaleX";
               this.drawSquare(true);
               _loc5_ = 0;
               while(_loc5_ < this.col)
               {
                  _loc14_ = owner.clips["maskClip0_" + _loc5_];
                  TweenLite.killTweensOf(_loc14_,false);
                  _loc3_.initSquare(_loc14_.clip);
                  doTrans(_loc14_,_loc5_ * this.delay);
                  _loc5_++;
               }
               break;
            case 2:
               this.scale = "scaleX";
               this.drawSquare(true);
               _loc10_ = this.target.rotation;
               this.maskClip.rotation = this.target.rotation;
               _loc5_ = 0;
               while(_loc5_ < this.col)
               {
                  _loc14_ = owner.clips["maskClip0_" + _loc5_];
                  _loc14_.clip.rotation = 180;
                  _loc14_.clip.x = _loc14_.clip.x + this.sqWidth;
                  _loc14_.clip.y = this.target.height;
                  TweenLite.killTweensOf(_loc14_,false);
                  this.initSquare(_loc14_.clip);
                  doTrans(_loc14_,_loc5_ * this.delay);
                  _loc5_++;
               }
               break;
            case 3:
               this.scale = "scaleX";
               this.drawSquare(true);
               _loc5_ = 0;
               while(_loc5_ < this.col)
               {
                  _loc14_ = owner.clips["maskClip0_" + _loc5_];
                  _loc14_.clip.rotation = 180;
                  _loc14_.clip.x = _loc14_.clip.x + this.sqWidth;
                  _loc14_.clip.y = this.target.height;
                  TweenLite.killTweensOf(_loc14_,false);
                  this.initSquare(_loc14_.clip);
                  doTrans(_loc14_,(this.col - _loc5_ - 1) * this.delay);
                  _loc5_++;
               }
               break;
            case 4:
               this.scale = "scaleX";
               this.drawSquare(true);
               _loc5_ = 0;
               while(_loc5_ < this.col)
               {
                  _loc14_ = owner.clips["maskClip0_" + _loc5_];
                  TweenLite.killTweensOf(_loc14_,false);
                  this.initSquare(_loc14_.clip);
                  doTrans(_loc14_,(this.col - _loc5_ - 1) * this.delay);
                  this.maskClip.rotation = this.target.rotation;
                  _loc5_++;
               }
               break;
            case 5:
               this.scale = "scaleY";
               this.drawSquare(false);
               _loc5_ = 0;
               while(_loc5_ < this.lin)
               {
                  _loc14_ = owner.clips["maskClip" + _loc5_ + "_" + 0];
                  TweenLite.killTweensOf(_loc14_,false);
                  this.initSquare(_loc14_.clip);
                  doTrans(_loc14_,_loc5_ * this.delay);
                  this.maskClip.rotation = this.target.rotation;
                  _loc5_++;
               }
               break;
            case 6:
               this.scale = "scaleY";
               this.drawSquare(false);
               this.maskClip.rotation = this.target.rotation;
               _loc5_ = 0;
               while(_loc5_ < this.lin)
               {
                  _loc14_ = owner.clips["maskClip" + _loc5_ + "_" + 0];
                  _loc14_.clip.rotation = 180;
                  _loc14_.clip.x = _loc14_.clip.x + this.sqWidth;
                  _loc14_.clip.y = _loc14_.clip.y + this.sqHeight;
                  TweenLite.killTweensOf(_loc14_,false);
                  this.initSquare(_loc14_.clip);
                  doTrans(_loc14_,_loc5_ * this.delay);
                  this.maskClip.rotation = this.target.rotation;
                  _loc5_++;
               }
               break;
            case 7:
               this.scale = "scaleY";
               this.drawSquare(false);
               _loc5_ = 0;
               while(_loc5_ < this.lin)
               {
                  _loc14_ = owner.clips["maskClip" + _loc5_ + "_" + 0];
                  TweenLite.killTweensOf(_loc14_,false);
                  this.initSquare(_loc14_.clip);
                  doTrans(_loc14_,(this.lin - _loc5_ - 1) * this.delay);
                  this.maskClip.rotation = this.target.rotation;
                  _loc5_++;
               }
               break;
            case 8:
               this.scale = "scaleY";
               this.drawSquare(false);
               _loc5_ = 0;
               while(_loc5_ < this.lin)
               {
                  _loc14_ = owner.clips["maskClip" + _loc5_ + "_" + 0];
                  _loc14_.clip.rotation = 180;
                  _loc14_.clip.x = _loc14_.clip.x + this.sqWidth;
                  _loc14_.clip.y = _loc14_.clip.y + this.sqHeight;
                  TweenLite.killTweensOf(_loc14_,false);
                  this.initSquare(_loc14_.clip);
                  doTrans(_loc14_,(this.lin - _loc5_ - 1) * this.delay);
                  this.maskClip.rotation = this.target.rotation;
                  _loc5_++;
               }
               break;
            case 9:
               this.scale = "scaleX";
               this.drawSquare(true);
               _loc11_ = Math.floor(this.col / 2);
               maxItems = _loc11_ * lin;
               this.maskClip.rotation = this.target.rotation;
               if(_loc11_ == (this.col - 1) / 2)
               {
                  maxItems++;
                  _loc14_ = owner.clips["maskClip0_" + _loc11_];
                  TweenLite.killTweensOf(_loc14_,false);
                  this.initSquare(_loc14_.clip);
                  doTrans(_loc14_,0);
               }
               delay = Math.max((this.tweenDuration - this._groupDuration) / (maxItems - 1),0);
               _loc5_ = 0;
               while(_loc5_ < _loc11_)
               {
                  _loc14_ = owner.clips["maskClip0_" + _loc5_];
                  TweenLite.killTweensOf(_loc14_,false);
                  this.initSquare(_loc14_.clip);
                  doTrans(_loc14_,(_loc11_ - _loc5_ - 1) * this.delay);
                  _loc14_ = owner.clips["maskClip0_" + (this.col - _loc5_ - 1)];
                  _loc14_.clip.rotation = 180;
                  _loc14_.clip.x = _loc14_.clip.x + this.sqWidth;
                  _loc14_.clip.y = _loc14_.clip.y + this.sqHeight;
                  TweenLite.killTweensOf(_loc14_,false);
                  this.initSquare(_loc14_.clip);
                  doTrans(_loc14_,(_loc11_ - _loc5_ - 1) * this.delay);
                  _loc5_++;
               }
               break;
            case 10:
               this.scale = "scaleX";
               this.drawSquare(true);
               this.maskClip.rotation = this.target.rotation;
               _loc11_ = Math.floor(this.col / 2);
               maxItems = _loc11_ * lin;
               if(_loc11_ == (this.col - 1) / 2)
               {
                  maxItems++;
                  _loc14_ = owner.clips["maskClip0_" + _loc11_];
                  TweenLite.killTweensOf(_loc14_,false);
                  this.initSquare(_loc14_.clip);
                  doTrans(_loc14_,0);
               }
               delay = Math.max((this.tweenDuration - this._groupDuration) / (maxItems - 1),0);
               _loc5_ = 0;
               while(_loc5_ < _loc11_)
               {
                  _loc14_ = owner.clips["maskClip0_" + (this.col - _loc5_ - 1)];
                  TweenLite.killTweensOf(_loc14_,false);
                  this.initSquare(_loc14_.clip);
                  doTrans(_loc14_,(_loc11_ - _loc5_ - 1) * this.delay);
                  _loc14_ = owner.clips["maskClip0_" + _loc5_];
                  _loc14_.clip.rotation = 180;
                  _loc14_.clip.x = _loc14_.clip.x + this.sqWidth;
                  _loc14_.clip.y = _loc14_.clip.y + this.sqHeight;
                  TweenLite.killTweensOf(_loc14_,false);
                  this.initSquare(_loc14_.clip);
                  doTrans(_loc14_,(_loc11_ - _loc5_ - 1) * this.delay);
                  _loc5_++;
               }
               break;
            case 11:
               this.scale = "scaleX";
               this.drawSquare(true);
               _loc11_ = Math.floor(this.col / 2);
               maxItems = _loc11_ * lin;
               this.maskClip.rotation = this.target.rotation;
               if(_loc11_ == (this.col - 1) / 2)
               {
                  maxItems++;
                  _loc14_ = owner.clips["maskClip0_" + _loc11_];
                  TweenLite.killTweensOf(_loc14_,false);
                  this.initSquare(_loc14_.clip);
                  doTrans(_loc14_,_loc11_ * this.delay);
               }
               delay = Math.max((this.tweenDuration - this._groupDuration) / (maxItems - 1),0);
               _loc5_ = 0;
               while(_loc5_ < _loc11_)
               {
                  _loc14_ = owner.clips["maskClip0_" + _loc5_];
                  _loc14_.clip.rotation = 180;
                  _loc14_.clip.x = _loc14_.clip.x + this.sqWidth;
                  _loc14_.clip.y = _loc14_.clip.y + this.sqHeight;
                  TweenLite.killTweensOf(_loc14_,false);
                  this.initSquare(_loc14_.clip);
                  doTrans(_loc14_,_loc5_ * this.delay);
                  _loc14_ = owner.clips["maskClip0_" + (this.col - _loc5_ - 1)];
                  this.col - _loc5_ - 1;
                  TweenLite.killTweensOf(_loc14_,false);
                  this.initSquare(_loc14_.clip);
                  doTrans(_loc14_,_loc5_ * this.delay);
                  _loc5_++;
               }
               break;
            case 12:
               this.scale = "scaleX";
               this.drawSquare(true);
               _loc11_ = Math.floor(this.col / 2);
               maxItems = _loc11_ * lin;
               if(_loc11_ == (this.col - 1) / 2)
               {
                  maxItems++;
                  _loc14_ = owner.clips["maskClip0_" + _loc11_];
                  TweenLite.killTweensOf(_loc14_,false);
                  this.initSquare(_loc14_.clip);
                  doTrans(_loc14_,_loc11_ * this.delay);
               }
               delay = Math.max((this.tweenDuration - this._groupDuration) / (maxItems - 1),0);
               _loc5_ = 0;
               while(_loc5_ < _loc11_)
               {
                  _loc14_ = owner.clips["maskClip0_" + _loc5_];
                  TweenLite.killTweensOf(_loc14_,false);
                  this.initSquare(_loc14_.clip);
                  doTrans(_loc14_,_loc5_ * this.delay);
                  _loc14_ = owner.clips["maskClip0_" + (this.col - _loc5_ - 1)];
                  _loc14_.clip.rotation = 180;
                  _loc14_.clip.x = _loc14_.clip.x + this.sqWidth;
                  _loc14_.clip.y = _loc14_.clip.y + this.sqHeight;
                  TweenLite.killTweensOf(_loc14_,false);
                  this.initSquare(_loc14_.clip);
                  doTrans(_loc14_,_loc5_ * this.delay);
                  _loc5_++;
               }
               break;
            case 13:
               this.scale = "scaleY";
               this.drawSquare(false);
               this.maskClip.rotation = this.target.rotation;
               _loc12_ = Math.floor(this.lin / 2);
               maxItems = _loc12_ * this.col;
               _loc13_ = 1;
               if(_loc12_ == (this.lin - 1) / 2)
               {
                  _loc13_ = 0;
                  maxItems++;
                  delay = Math.max((this.tweenDuration - this._groupDuration) / (maxItems - 1),0);
                  _loc14_ = owner.clips["maskClip" + _loc12_ + "_" + 0];
                  TweenLite.killTweensOf(_loc14_,false);
                  this.initSquare(_loc14_.clip);
                  doTrans(_loc14_,(_loc12_ - _loc5_) * this.delay);
               }
               delay = Math.max((this.tweenDuration - this._groupDuration) / (maxItems - 1),0);
               _loc5_ = 0;
               while(_loc5_ < _loc12_)
               {
                  _loc14_ = owner.clips["maskClip" + _loc5_ + "_" + 0];
                  TweenLite.killTweensOf(_loc14_,false);
                  this.initSquare(_loc14_.clip);
                  doTrans(_loc14_,(_loc12_ - _loc5_ - _loc13_) * this.delay);
                  _loc14_ = owner.clips["maskClip" + (this.lin - _loc5_ - 1) + "_" + 0];
                  _loc14_.clip.rotation = 180;
                  _loc14_.clip.x = _loc14_.clip.x + this.sqWidth;
                  _loc14_.clip.y = _loc14_.clip.y + this.sqHeight;
                  doTrans(_loc14_,(_loc12_ - _loc5_ - _loc13_) * this.delay);
                  _loc5_++;
               }
               break;
            case 14:
               this.scale = "scaleY";
               this.drawSquare(false);
               _loc12_ = Math.floor(this.lin / 2);
               maxItems = _loc12_ * col;
               _loc13_ = 1;
               if(_loc12_ == (this.lin - 1) / 2)
               {
                  maxItems++;
                  _loc13_ = 0;
                  delay = Math.max((this.tweenDuration - this._groupDuration) / (maxItems - 1),0);
                  _loc14_ = owner.clips["maskClip" + _loc12_ + "_" + 0];
                  TweenLite.killTweensOf(_loc14_,false);
                  this.initSquare(_loc14_.clip);
                  doTrans(_loc14_,(_loc12_ - _loc5_) * this.delay);
               }
               delay = Math.max((this.tweenDuration - this._groupDuration) / (maxItems - 1),0);
               _loc5_ = 0;
               while(_loc5_ < _loc12_)
               {
                  _loc14_ = owner.clips["maskClip" + _loc5_ + "_" + 0];
                  _loc14_.clip.rotation = 180;
                  _loc14_.clip.x = _loc14_.clip.x + this.sqWidth;
                  _loc14_.clip.y = _loc14_.clip.y + this.sqHeight;
                  doTrans(_loc14_,(_loc12_ - _loc5_ - _loc13_) * this.delay);
                  _loc14_ = owner.clips["maskClip" + (this.lin - _loc5_ - 1) + "_" + 0];
                  TweenLite.killTweensOf(_loc14_,false);
                  this.initSquare(_loc14_.clip);
                  doTrans(_loc14_,(_loc12_ - _loc5_ - _loc13_) * this.delay);
                  _loc5_++;
               }
               break;
            case 15:
               this.scale = "scaleY";
               this.drawSquare(false);
               _loc12_ = Math.floor(this.lin / 2);
               maxItems = _loc12_ * col;
               if(_loc12_ == (this.lin - 1) / 2)
               {
                  maxItems++;
                  delay = Math.max((this.tweenDuration - this._groupDuration) / (maxItems - 1),0);
                  _loc14_ = owner.clips["maskClip" + _loc12_ + "_" + 0];
                  TweenLite.killTweensOf(_loc14_,false);
                  this.initSquare(_loc14_.clip);
                  doTrans(_loc14_,_loc12_ * this.delay);
               }
               delay = Math.max((this.tweenDuration - this._groupDuration) / (maxItems - 1),0);
               _loc5_ = 0;
               while(_loc5_ < _loc12_)
               {
                  _loc14_ = owner.clips["maskClip" + _loc5_ + "_" + 0];
                  TweenLite.killTweensOf(_loc14_,false);
                  this.initSquare(_loc14_.clip);
                  doTrans(_loc14_,_loc5_ * this.delay);
                  _loc14_ = owner.clips["maskClip" + (this.lin - _loc5_ - 1) + "_" + 0];
                  _loc14_.clip.rotation = 180;
                  _loc14_.clip.x = _loc14_.clip.x + this.sqWidth;
                  _loc14_.clip.y = _loc14_.clip.y + this.sqHeight;
                  doTrans(_loc14_,_loc5_ * this.delay);
                  _loc5_++;
               }
               break;
            case 16:
               this.scale = "scaleY";
               this.drawSquare(false);
               _loc12_ = Math.floor(this.lin / 2);
               maxItems = _loc12_ * col;
               if(_loc12_ == (this.lin - 1) / 2)
               {
                  maxItems++;
                  delay = Math.max((this.tweenDuration - this._groupDuration) / (maxItems - 1),0);
                  _loc14_ = owner.clips["maskClip" + _loc12_ + "_" + 0];
                  TweenLite.killTweensOf(_loc14_,false);
                  this.initSquare(_loc14_.clip);
                  doTrans(_loc14_,_loc12_ * this.delay);
               }
               delay = Math.max((this.tweenDuration - this._groupDuration) / (maxItems - 1),0);
               _loc5_ = 0;
               while(_loc5_ < _loc12_)
               {
                  _loc14_ = owner.clips["maskClip" + _loc5_ + "_" + 0];
                  _loc14_.clip.rotation = 180;
                  _loc14_.clip.x = _loc14_.clip.x + this.sqWidth;
                  _loc14_.clip.y = _loc14_.clip.y + this.sqHeight;
                  doTrans(_loc14_,_loc5_ * this.delay);
                  _loc14_ = owner.clips["maskClip" + (this.lin - _loc5_ - 1) + "_" + 0];
                  TweenLite.killTweensOf(_loc14_,false);
                  this.initSquare(_loc14_.clip);
                  doTrans(_loc14_,_loc5_ * this.delay);
                  _loc5_++;
               }
         }
         if(param1 == true)
         {
            owner.prop = 1;
            owner.lastProp = 1;
            TweenLite.to(owner,Math.max(this.tweenDuration,this.groupDuration),{
               "prop":0,
               "ease":this.easeFunc,
               "delay":0,
               "onUpdate":motionBlurChange,
               "onComplete":motionFinish
            });
         }
         else
         {
            owner.prop = 0;
            owner.lastProp = 0;
            TweenLite.to(owner,Math.max(this.tweenDuration,this.groupDuration),{
               "prop":1,
               "ease":this.easeFunc,
               "delay":0,
               "onUpdate":motionBlurChange,
               "onComplete":motionFinish
            });
         }
      }
      
      protected function doTrans(param1:Object, param2:Number = 0) : *
      {
         if(this.showTr == true)
         {
            param1.clip[this.scale] = 0;
            param1.prop = 0;
            TweenLite.to(param1,this._groupDuration,{
               "prop":1,
               "delay":param2,
               "ease":this.easeFunc,
               "onUpdate":motionChange,
               "onUpdateParams":[param1],
               "onComplete":motionFinish
            });
         }
         else
         {
            param1.clip[this.scale] = 1;
            param1.prop = 1;
            TweenLite.to(param1,this._groupDuration,{
               "prop":0,
               "delay":param2,
               "ease":this.easeFunc,
               "onUpdate":motionChange,
               "onUpdateParams":[param1],
               "onComplete":motionFinish
            });
         }
      }
      
      private function checkTransitionType(param1:Boolean, param2:Object) : *
      {
         prop = Number(param1);
         if(param1 == false)
         {
            param2.pos = 1;
            param2.lastProp = 1;
         }
         else
         {
            param2.lastProp = 0;
            param2.pos = 0;
         }
      }
      
      protected function clearProperties() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         if(maskClip is Sprite)
         {
            if(this.component != null)
            {
               this.component.textOwnerClip.filters = [];
               this.component.textOwnerClip.mask = null;
               this.component.targetOwner.removeChild(maskClip);
            }
            maskClip = null;
         }
         if(owner != null)
         {
            if(owner.clips is Object)
            {
               _loc1_ = 0;
               while(_loc1_ < this.lin)
               {
                  _loc2_ = 0;
                  while(_loc2_ < this.col)
                  {
                     _loc3_ = owner.clips["maskClip" + _loc1_ + "_" + _loc2_];
                     TweenLite.killTweensOf(owner,false);
                     TweenLite.killTweensOf(_loc3_,false);
                     _loc2_++;
                  }
                  _loc1_++;
               }
               delete owner.clips;
            }
         }
      }
      
      protected function motionBlurChange() : *
      {
         var _loc1_:Number = owner.prop * this.maxBlurX;
         var _loc2_:Number = owner.prop * this.maxBlurY;
         blurEffect(this.component.textOwnerClip,_loc1_,_loc2_);
         owner.lastProp = owner.prop;
      }
      
      private function blurEffect(param1:*, param2:Number, param3:Number, param4:uint = 2) : *
      {
         var _loc5_:BitmapFilter = new BlurFilter(param2,param3,param4);
         var _loc6_:Array = new Array();
         _loc6_.push(_loc5_);
         param1.filters = _loc6_;
      }
      
      protected function motionFinish() : void
      {
         tweensFinished++;
         if(tweensFinished == this.lin * this.col + 1)
         {
            this.component.textOwnerClip.filters = [];
            if(bol == false)
            {
               this.component.textOwnerClip.visible = false;
            }
            if(maskClip is Sprite)
            {
               this.component.textOwnerClip.mask = null;
               this.component.targetOwner.removeChild(maskClip);
               maskClip = null;
            }
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
      
      private function initSquare(param1:Sprite) : *
      {
         if(show == true)
         {
            param1[scale] = 0;
         }
         else
         {
            param1[scale] = 1;
         }
      }
      
      public function set waveThickness(param1:Number) : void
      {
         if(isNaN(Number(param1)))
         {
            param1 = 15;
         }
         if(param1 <= 0)
         {
            param1 = 15;
         }
         this._waveThickness = param1;
      }
      
      public function get preset() : Number
      {
         return this._preset;
      }
      
      public function get waveThickness() : Number
      {
         return this._waveThickness;
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
