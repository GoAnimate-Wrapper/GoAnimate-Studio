package com.jumpeye.flashEff2.text.twilight
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffText;
   import com.jumpeye.transitions.TweenLite;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Shader;
   import flash.display.Sprite;
   import flash.filters.BitmapFilter;
   import flash.filters.BlurFilter;
   import flash.filters.GradientGlowFilter;
   import flash.filters.ShaderFilter;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
   
   public class FETTwilight extends IFlashEffText
   {
       
      
      private var cloudOwner:Sprite;
      
      private var grandCloud:Sprite;
      
      private var _scale:Number = 0.5;
      
      private var _lightColor:Number = 16777215;
      
      private var maskee:Bitmap;
      
      private var _glowAmount:Number = 10;
      
      protected var lightBeam:Class;
      
      private var _radius:Number = 210;
      
      private var _offset:Number = 0;
      
      private var cloud:JMaskCloud;
      
      protected var mPosition:Point;
      
      protected var lightTween:Object;
      
      protected var tPosition:Point;
      
      protected var maskeeTween:Object;
      
      public function FETTwilight(param1:JUIComponent = null)
      {
         this.lightBeam = FETTwilight_lightBeam;
         super();
         this.component = param1;
         this.init();
      }
      
      override public function hide() : void
      {
         if(this.component != null)
         {
            this.startTransition(false);
         }
      }
      
      override public function show() : void
      {
         if(this.component != null)
         {
            this.startTransition(true);
         }
      }
      
      protected function motionChange(param1:Object) : void
      {
         var _loc2_:Number = param1.pos;
         var _loc3_:Number = -this._radius + (param1.target.width + 2 * this._radius) * _loc2_;
         param1.shader.data.center.value = [_loc3_,param1.target.height / 2 + this.offset];
         var _loc4_:Number = this.getBezier(_loc2_,0,2,0);
         param1.target.filters = [new ShaderFilter(param1.shader),this.getGlow(_loc4_ * this._glowAmount)];
         this.maskee.scaleX = this.maskee.scaleY = this.target.scaleX = this.target.scaleY = this._scale + (1 - this._scale) * _loc2_;
         this.maskee.x = this.mPosition.x + (this.maskee.width / this.maskee.scaleX - this.maskee.width) / 2;
         this.maskee.y = this.mPosition.y + (this.maskee.height / this.maskee.scaleY - this.maskee.height) / 2;
         target.x = this.tPosition.x + (target.width / target.scaleX - target.width) / 2;
         target.y = this.tPosition.y + (target.height / target.scaleY - target.height) / 2;
         target.alpha = Math.min((this.radius + _loc3_) / this._radius,1);
      }
      
      protected function init() : void
      {
         _tweenDuration = 1.8;
         _tweenType = "Strong";
         _easeType = "easeOut";
      }
      
      public function set radius(param1:Number) : void
      {
         if(param1 < 1)
         {
            param1 = 1;
         }
         this._radius = Number(Number(param1)) || Number(1);
      }
      
      private function cloudChange(param1:JMaskCloud) : void
      {
         param1.amount = this.getBezier(param1.pos,0,100,0);
      }
      
      protected function getBezier(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         return (1 - param1) * (1 - param1) * param2 + 2 * param1 * (1 - param1) * param3 + param1 * param1 * param4;
      }
      
      protected function startTransition(param1:Boolean = true) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:uint = 1;
         if(param1 == false)
         {
            _loc2_ = 1;
            _loc3_ = 0;
         }
         this.cloudOwner = new Sprite();
         var _loc4_:Sprite = new Sprite();
         _loc4_.graphics.beginFill(0,0);
         _loc4_.graphics.drawRect(-15,-15,target.width + 30,target.height + 30);
         this.cloudOwner.addChild(_loc4_);
         var _loc5_:BitmapData = new BitmapData(this.target.width,this.target.height,true,0);
         _loc5_.draw(this.target);
         this.maskee = new Bitmap(_loc5_);
         var _loc6_:Rectangle = this.target.getBounds(this.target);
         this.maskee.x = -_loc6_.x;
         this.maskee.y = -_loc6_.y;
         this.mPosition = new Point(this.maskee.x,this.maskee.y);
         this.tPosition = new Point(target.x,target.y);
         this.cloud = new JMaskCloud(this.target.width,this.target.height);
         this.cloudOwner.addChild(this.cloud);
         this.cloudOwner.addChild(this.maskee);
         this.cloud.mask = this.maskee;
         this.cloud.cacheAsBitmap = this.maskee.cacheAsBitmap = true;
         this.cloud.filters = [new BlurFilter(2,2,2)];
         var _loc7_:Sprite = new Sprite();
         _loc7_.graphics.beginFill(this._lightColor);
         _loc7_.graphics.drawRect(0,0,this.target.width,this.target.height);
         this.cloudOwner.cacheAsBitmap = _loc7_.cacheAsBitmap = true;
         _loc7_.mask = this.cloudOwner;
         this.grandCloud = new Sprite();
         this.grandCloud.addChild(_loc7_);
         this.grandCloud.addChild(this.cloudOwner);
         this.component.targetOwner.addChild(this.grandCloud);
         this.cloud.pos = _loc2_;
         TweenLite.to(this.cloud,this.tweenDuration,{
            "ease":this.easeFunc,
            "pos":_loc3_,
            "onUpdate":this.cloudChange,
            "onUpdateParams":[this.cloud]
         });
         var _loc8_:Shader = new Shader();
         _loc8_.byteCode = ByteArray(new this.lightBeam());
         _loc8_.data.radius.value = [this._radius];
         _loc8_.data.intensity.value = [0.9];
         this.target.scaleX = this.target.scaleY = 0.8;
         this.lightTween = {
            "pos":_loc2_,
            "target":this.component.targetOwner,
            "shader":_loc8_
         };
         TweenLite.to(this.lightTween,this.tweenDuration,{
            "pos":_loc3_,
            "ease":this.easeFunc,
            "onUpdate":this.motionChange,
            "onUpdateParams":[this.lightTween],
            "onComplete":this.motionFinish
         });
         this.motionChange(this.lightTween);
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
      
      public function get radius() : Number
      {
         return this._radius;
      }
      
      public function get offset() : Number
      {
         return this._offset;
      }
      
      private function getGlow(param1:*) : BitmapFilter
      {
         var _loc2_:Number = 0;
         var _loc3_:Number = 0;
         var _loc4_:Array = [this._lightColor,this._lightColor];
         var _loc5_:Array = [0,1];
         var _loc6_:Array = [0,256];
         var _loc7_:Number = param1;
         var _loc8_:Number = param1;
         var _loc9_:Number = param1 / 5;
         var _loc10_:Number = 3;
         var _loc11_:String = "full";
         var _loc12_:Boolean = false;
         return new GradientGlowFilter(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_);
      }
      
      override public function remove() : void
      {
         this.clearProperties();
      }
      
      public function get glowAmount() : Number
      {
         return this._glowAmount;
      }
      
      public function set glowAmount(param1:Number) : void
      {
         this._glowAmount = param1;
      }
      
      protected function clearProperties() : void
      {
         var _loc1_:Sprite = null;
         if(this.component != null)
         {
            this.component.targetOwner.filters = [];
            if(this.grandCloud != null)
            {
               this.cloud.destroy();
               this.cloudOwner.removeChild(this.cloud);
               this.grandCloud.removeChild(this.cloudOwner);
               this.cloudOwner = null;
               _loc1_ = this.component.targetOwner as Sprite;
               if(_loc1_.contains(this.grandCloud))
               {
                  _loc1_.removeChild(this.grandCloud);
               }
               this.grandCloud = null;
            }
         }
         if(this.cloud != null)
         {
            TweenLite.killTweensOf(this.cloud,false);
            this.cloud = null;
         }
         if(this.lightTween != null)
         {
            TweenLite.killTweensOf(this.lightTween,false);
            this.lightTween = null;
         }
         if(this.target != null)
         {
            this.target.scaleX = this.target.scaleY = 1;
            this.target.alpha = 1;
            target.x = this.tPosition.x;
            target.y = this.tPosition.y;
         }
      }
      
      public function set lightColor(param1:uint) : void
      {
         this._lightColor = param1;
      }
      
      public function set scale(param1:Number) : void
      {
         this._scale = param1;
      }
      
      public function set offset(param1:Number) : void
      {
         this._offset = param1;
      }
      
      protected function motionFinish() : void
      {
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
      }
      
      public function get lightColor() : uint
      {
         return this._lightColor;
      }
      
      public function get scale() : Number
      {
         return this._scale;
      }
   }
}
