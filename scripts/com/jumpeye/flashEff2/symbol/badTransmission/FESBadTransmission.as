package com.jumpeye.flashEff2.symbol.badTransmission
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffSymbol;
   import com.jumpeye.transitions.TweenLite;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.filters.BitmapFilter;
   import flash.filters.DisplacementMapFilter;
   import flash.filters.DisplacementMapFilterMode;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class FESBadTransmission extends IFlashEffSymbol
   {
       
      
      protected var isShow:Boolean = false;
      
      protected var tweenObject:Object;
      
      protected var noiseBmp:Bitmap;
      
      private var _disturbance:Number = 50;
      
      protected var targetBD:BitmapData;
      
      protected var perlinBD:BitmapData;
      
      protected var screenNoiseBmp:Bitmap;
      
      protected var noiseBD:BitmapData;
      
      protected var backBmp:Bitmap;
      
      protected var effectOwner:Sprite;
      
      private var updateParams:Array;
      
      protected var outputEffect:Sprite;
      
      protected var targetBmp:Bitmap;
      
      private var _maxNoise:Number = 0.5;
      
      protected var overlayNoiseBmp:Bitmap;
      
      public function FESBadTransmission(param1:JUIComponent = null)
      {
         super();
         this.component = param1;
         this.init();
      }
      
      override public function hide() : void
      {
         this.remove();
         this.startMotion(false);
      }
      
      public function get maxNoise() : Number
      {
         return _maxNoise;
      }
      
      protected function motionChange(... rest) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:Object = null;
         for(_loc2_ in rest)
         {
            _loc3_ = rest[_loc2_] as Object;
            _loc3_.target[_loc3_.prop] = _loc3_.getValue(this.tweenObject.pos,_loc3_.begin,_loc3_.change,this._tweenDuration);
         }
         if(Math.floor(this.tweenObject.pos * 100) % 3 == 0)
         {
            this.outputEffect.filters = [this.createDisplacementMap()];
         }
         else if((Math.floor(this.tweenObject.pos * 100) + 1) % 3 == 0)
         {
            this.overlayNoiseBmp.bitmapData.noise(Math.random() * int.MAX_VALUE,0,255,7,true);
         }
      }
      
      protected function init() : void
      {
         _tweenDuration = 2;
         _tweenType = "Quadratic";
         _easeType = "easeOut";
      }
      
      public function get disturbance() : Number
      {
         return _disturbance;
      }
      
      protected function waitAFrame(param1:Event) : *
      {
         this.component.removeEventListener(Event.ENTER_FRAME,this.waitAFrame);
         TweenLite.to(this.tweenObject,this.tweenDuration,{
            "pos":this.tweenDuration * Number(isShow),
            "onUpdate":this.motionChange,
            "onUpdateParams":updateParams,
            "onComplete":this.motionFinish
         });
         this.motionChange.apply(this,updateParams);
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
      
      public function set disturbance(param1:Number) : void
      {
         _disturbance = param1;
      }
      
      protected function createDisplacementMap() : BitmapFilter
      {
         var _loc1_:BitmapData = this.createPerlinBD();
         var _loc2_:Point = new Point();
         var _loc3_:uint = 1;
         var _loc4_:uint = _loc3_;
         var _loc5_:uint = _loc3_;
         var _loc6_:Number = this.disturbance / 2 + Math.random() * this.disturbance / 2;
         var _loc7_:Number = 0.5;
         var _loc8_:String = DisplacementMapFilterMode.CLAMP;
         var _loc9_:uint = 0;
         var _loc10_:Number = 0;
         return new DisplacementMapFilter(_loc1_,_loc2_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_);
      }
      
      protected function motionFinish() : void
      {
         this.remove();
         if(this.target != null)
         {
            this.target.visible = this.isShow;
         }
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
      }
      
      override public function remove() : void
      {
         if(this.tweenObject != null)
         {
            TweenLite.killTweensOf(this.tweenObject,false);
            this.tweenObject = null;
         }
         if(this.component != null)
         {
            if(this.effectOwner != null)
            {
               if(this.component.targetOwner.contains(this.effectOwner))
               {
                  this.component.targetOwner.removeChild(this.effectOwner);
               }
               this.effectOwner = null;
            }
            this.component.removeEventListener(Event.ENTER_FRAME,this.waitAFrame);
         }
         if(this.target != null)
         {
            this.target.alpha = 1;
         }
         if(perlinBD != null)
         {
            perlinBD.dispose();
         }
         perlinBD = null;
         if(targetBD != null)
         {
            targetBD.dispose();
         }
         targetBD = null;
         if(noiseBD != null)
         {
            noiseBD.dispose();
         }
         noiseBD = null;
         targetBmp = null;
         backBmp = null;
         noiseBmp = null;
         screenNoiseBmp = null;
         overlayNoiseBmp = null;
         updateParams = null;
      }
      
      public function set maxNoise(param1:Number) : void
      {
         if(param1 > 1)
         {
            param1 = 1;
         }
         else if(param1 < 0)
         {
            param1 = 0;
         }
         _maxNoise = param1;
      }
      
      protected function createPerlinBD() : BitmapData
      {
         var _loc1_:BitmapData = new BitmapData(this.component.width,this.component.height,true,16711680);
         _loc1_.perlinNoise(10,1.5,1,Math.random() * 1000,true,true,3);
         return _loc1_;
      }
      
      override public function show() : void
      {
         this.remove();
         this.startMotion(true);
      }
      
      protected function startMotion(param1:Boolean) : void
      {
         var _loc2_:Rectangle = this.target.getBounds(this.target);
         var _loc3_:Matrix = new Matrix();
         this.isShow = param1;
         this.outputEffect = new Sprite();
         this.effectOwner = new Sprite();
         this.component.targetOwner.addChild(this.effectOwner);
         this.effectOwner.addChild(this.outputEffect);
         this.effectOwner.x = _loc2_.x * this.target.scaleX;
         this.effectOwner.y = _loc2_.y * this.target.scaleY;
         _loc3_.translate(-_loc2_.x,-_loc2_.y);
         _loc3_.scale(this.target.scaleX,this.target.scaleY);
         this.targetBD = new BitmapData(this.target.width,this.target.height,true,16711680);
         this.targetBD.draw(this.target,_loc3_);
         this.targetBmp = new Bitmap(this.targetBD);
         this.backBmp = new Bitmap(this.targetBD.clone());
         this.backBmp.alpha = 0.34;
         this.outputEffect.addChild(this.backBmp);
         this.outputEffect.addChild(this.targetBmp);
         this.noiseBD = new BitmapData(this.target.width,this.target.height,false);
         this.noiseBD.noise(Math.random() * int.MAX_VALUE,0,255,7,true);
         this.noiseBmp = new Bitmap(this.noiseBD);
         this.noiseBmp.alpha = 0.15 * this.maxNoise;
         this.outputEffect.addChild(this.noiseBmp);
         this.outputEffect.filters = [this.createDisplacementMap()];
         this.overlayNoiseBmp = new Bitmap(this.noiseBD.clone());
         this.overlayNoiseBmp.alpha = 0;
         this.effectOwner.addChild(this.overlayNoiseBmp);
         this.screenNoiseBmp = new Bitmap(this.noiseBD.clone());
         this.screenNoiseBmp.bitmapData.noise(Math.random() * int.MAX_VALUE,0,255,7,true);
         this.screenNoiseBmp.blendMode = BlendMode.SCREEN;
         this.screenNoiseBmp.alpha = 0.1 * this.maxNoise;
         this.screenNoiseBmp.cacheAsBitmap = true;
         this.effectOwner.addChild(this.screenNoiseBmp);
         var _loc4_:Sprite = new Sprite();
         _loc4_.graphics.beginFill(10066329,0.32);
         _loc4_.graphics.drawRect(0,0,this.target.width,1);
         _loc4_.alpha = 0;
         var _loc5_:Sprite = new Sprite();
         _loc5_.graphics.beginFill(10066329,0.32);
         _loc5_.graphics.drawRect(0,0,this.target.width,1);
         var _loc6_:Sprite = new Sprite();
         _loc6_.graphics.beginFill(10066329);
         _loc6_.graphics.drawRect(0,0,this.target.width,this.target.height / 10);
         _loc6_.cacheAsBitmap = true;
         this.screenNoiseBmp.mask = _loc6_;
         this.effectOwner.addChild(_loc4_);
         this.effectOwner.addChild(_loc5_);
         this.effectOwner.addChild(_loc6_);
         this.tweenObject = {"pos":this.tweenDuration * Number(!param1)};
         this.outputEffect.alpha = 0;
         this.effectOwner.alpha = 0;
         this.target.alpha = 0;
         var _loc7_:CustomMotion = new CustomMotion();
         _loc7_.points = [0.07,0.14,0.21,0.29,0.36,0.43,0.5,0.57,0.64,0.71,0.79,0.86,0.93,1,0.12,0.95,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0.45,0,0,0,0,0,0.57,1,1,0.66,0.23,0,0.45,0.84,0.42,0,0.01,0.01,0.01,0.36,0.62,0.57,0.52,0.48,0.37,0.29,0.24,0.19,0.15,0.12,0.09,0.07,0.05,0.04,0.03,0.02,0.01,0,0];
         var _loc8_:CustomMotion = new CustomMotion();
         _loc8_.points = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.01,0.01,0.02,0.02,0.03,0.04,0.05,0.06,0.07,0.08,0.1,0.12,0.14,0.16,0.18,0.21,0.23,0.26,0.3,0.34,0.38,0.43,0.48,0.54,0.62,0.7,0.81,1];
         var _loc9_:CustomMotion = new CustomMotion();
         _loc9_.points = [0,0.01,0.02,0.03,0.04,0.04,0.05,0.06,0.07,0.08,0.09,0.1,0.11,0.12,0.13,0.14,0.15,0.16,0.18,0.19,0.2,0.21,0.22,0.24,0.25,0.26,0.27,0.29,0.3,0.32,0.33,0.35,0.37,0.39,0.41,0.04,0.04,0.04,0.04,0.04,0.04,0.04,0.04,0.3,0.09,0.06,0,0.04,0.11,0.18,0.2,0.2,0.2,0.19,0.19,0.18,0.17,0.16,0.15,0.14,0.13,0.11,0.1,0.09,0.07,0.06,0.05,0.03,0.02,0];
         var _loc10_:CustomMotion = new CustomMotion();
         _loc10_.points = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.8,0.8,0,0,1,0.95,0.8,0.58,0.35,0.16,0.05,0,0,0,0,0,0,0,0,-0.4,-0.4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
         var _loc11_:CustomMotion = new CustomMotion();
         _loc11_.points = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.8,0.8,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0.95,0.8,0.58,0.35,0.16,0.05,0,0,0,0,0,0,0,0,0,0,0,0];
         var _loc12_:CustomMotion = new CustomMotion();
         _loc12_.points = [0,0,0,0,0.1,0.11,0.12,0.13,0.14,0.15,0.16,0.17,0.18,0.19,0.2,0.21,0.22,0.23,0.24,0.25,0.26,0.27,0.28,0.3,0.31,0.32,0.34,0.35,0.36,0.38,0.39,0.41,0.42,0.44,0.46,0.47,0.49,0.51,0.53,0.55,0.57,0.59,0.61,0.64,0.66,0.69,0.71,0.74,0.77,0.8,0.84,0.87,0.91,0.95,1,1,0.45,0,0,0,0,0,0,0,0,0,0,0,0,0];
         var _loc13_:CustomMotion = new CustomMotion();
         _loc13_.points = [0.9,0.88,0.84,0.76,0.68,0.61,0.54,0.47,0.41,0.36,0.3,0.26,0.21,0.17,0.14,0.1,0.08,0.05,0.03,0.02,0.01,0,0,0.03,0.07,0.1,0.13,0.16,0.19,0.22,0.25,0.27,0.29,0.31,0.33,0.34,0.35,0.36,0.36,0.36,0.35,0.34,0.32,0.3,0.28,0.25,0.23,0.2,0.17,0.14,0.11,0.07,0.04,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
         var _loc14_:CustomMotion = new CustomMotion();
         _loc14_.points = [0,0,0,0,0.1,0.11,0.12,0.13,0.14,0.15,0.16,0.17,0.18,0.19,0.2,0.21,0.22,0.23,0.24,0.25,0.26,0.27,0.28,0.3,0.31,0.32,0.34,0.35,0.36,0.38,0.39,0.41,0.42,0.44,0.46,0.47,0.49,0.51,0.53,0.55,0.57,0.59,0.61,0.64,0.66,0.69,0.71,0.74,0.77,0.8,0.84,0.87,0.91,0.95,1,0.81,0.45,0,0,0,0,0,0,0,0,0,0,0,0,0];
         var _loc15_:CustomMotion = new CustomMotion();
         _loc15_.points = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.01,0.03,0.06,0.11,0.16,0.22,0.28,0.34,0.41,0.48,0.55,0.61,0.68,0.74,0.8,0.85,0.9,0.94,0.97,0.99,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];
         updateParams = [];
         updateParams.push({
            "target":this.outputEffect,
            "prop":"alpha",
            "getValue":_loc7_.getValue,
            "begin":0,
            "change":1
         });
         updateParams.push({
            "target":this.overlayNoiseBmp,
            "prop":"alpha",
            "getValue":_loc9_.getValue,
            "begin":0,
            "change":this.maxNoise
         });
         updateParams.push({
            "target":this.backBmp,
            "prop":"x",
            "getValue":_loc10_.getValue,
            "begin":this.outputEffect.x,
            "change":-(Math.random() * this.disturbance / 2 + this.disturbance / 2)
         });
         updateParams.push({
            "target":this.outputEffect,
            "prop":"x",
            "getValue":_loc11_.getValue,
            "begin":this.outputEffect.x,
            "change":this.disturbance / 5
         });
         updateParams.push({
            "target":_loc4_,
            "prop":"y",
            "getValue":_loc12_.getValue,
            "begin":_loc4_.y,
            "change":this.target.height * 0.8
         });
         updateParams.push({
            "target":_loc4_,
            "prop":"alpha",
            "getValue":_loc14_.getValue,
            "begin":0,
            "change":1
         });
         updateParams.push({
            "target":_loc5_,
            "prop":"y",
            "getValue":_loc13_.getValue,
            "begin":_loc5_.y,
            "change":this.target.height
         });
         updateParams.push({
            "target":_loc5_,
            "prop":"alpha",
            "getValue":_loc13_.getValue,
            "begin":0,
            "change":1
         });
         updateParams.push({
            "target":_loc6_,
            "prop":"y",
            "getValue":_loc15_.getValue,
            "begin":-2 * _loc6_.height,
            "change":this.target.height + 2 * _loc6_.height
         });
         updateParams.push({
            "target":this.target,
            "prop":"alpha",
            "getValue":_loc8_.getValue,
            "begin":0,
            "change":1
         });
         updateParams.push({
            "target":this.effectOwner,
            "prop":"alpha",
            "getValue":this.easeFunc,
            "begin":0,
            "change":1
         });
         this.component.addEventListener(Event.ENTER_FRAME,this.waitAFrame,false,0,true);
      }
   }
}
