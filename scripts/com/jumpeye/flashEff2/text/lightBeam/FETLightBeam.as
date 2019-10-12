package com.jumpeye.flashEff2.text.lightBeam
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffText;
   import com.jumpeye.transitions.TweenLite;
   import flash.display.Shader;
   import flash.display.Sprite;
   import flash.filters.ShaderFilter;
   import flash.geom.Matrix;
   import flash.utils.ByteArray;
   
   public class FETLightBeam extends IFlashEffText
   {
       
      
      private var maskee:Sprite;
      
      protected var lightBeam:Class;
      
      private var _radius:Number = 150;
      
      private var _offset:Number = 0;
      
      protected var lightTween:Object;
      
      protected var finishedTweens:Number = 0;
      
      protected var maskeeTween:Object;
      
      public function FETLightBeam(param1:JUIComponent = null)
      {
         this.lightBeam = FETLightBeam_lightBeam;
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
      
      override public function remove() : void
      {
         this.clearProperties();
      }
      
      protected function motionChange(param1:Object) : void
      {
         param1.shader.data.center.value = [-this._radius + (param1.target.width + 2 * this._radius) * param1.pos,param1.target.height / 2 + this.offset];
         param1.target.filters = [new ShaderFilter(param1.shader)];
      }
      
      protected function drawMask(param1:Object) : void
      {
         var tweenObj:Object = param1;
         var w:Number = this.target.width;
         var h:Number = this.target.height;
         var r1:Number = tweenObj.r1 / (w + 2 * this._radius) * 255;
         var r2:Number = tweenObj.r2 / (w + 2 * this._radius) * 255;
         if(r1 < 0)
         {
            r1 = 0;
         }
         if(r2 > 255)
         {
            r2 = 255;
         }
         var matr:Matrix = new Matrix();
         matr.createGradientBox(w + 2 * this._radius,h,0,-this._radius);
         with(this.maskeeTween.maskee.graphics)
         {
            
            clear();
            beginGradientFill("linear",[255,255],[tweenObj.a1,tweenObj.a2],[r1,r2],matr);
            drawRect(-15,-15,w + 30,h + 30);
         }
      }
      
      public function get radius() : Number
      {
         return this._radius;
      }
      
      public function get offset() : Number
      {
         return this._offset;
      }
      
      protected function init() : void
      {
         _tweenDuration = 2;
         _tweenType = "Quadratic";
         _easeType = "easeOut";
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
         this.maskeeTween = {
            "r1":-this._radius / 2,
            "r2":this._radius,
            "a1":_loc3_,
            "a2":_loc2_
         };
         this.maskee = new Sprite();
         this.component.targetOwner.addChild(this.maskee);
         this.maskeeTween.maskee = this.maskee;
         this.target.mask = this.maskee;
         this.target.cacheAsBitmap = this.maskee.cacheAsBitmap = true;
         this.finishedTweens = 0;
         var _loc4_:Number = this.target.width;
         var _loc5_:Object = {
            "r1":_loc4_ + 3 * this._radius / 2,
            "r2":_loc4_ + 2 * this._radius,
            "ease":this.easeFunc,
            "onUpdate":this.drawMask,
            "onUpdateParams":[this.maskeeTween],
            "onComplete":this.motionFinish
         };
         this.drawMask(this.maskeeTween);
         TweenLite.to(this.maskeeTween,this.tweenDuration,_loc5_);
         var _loc6_:Shader = new Shader();
         _loc6_.byteCode = ByteArray(new this.lightBeam());
         _loc6_.data.radius.value = [this._radius];
         _loc6_.data.intensity.value = [0.85];
         this.lightTween = {
            "pos":0,
            "target":this.component.targetOwner,
            "shader":_loc6_
         };
         TweenLite.to(this.lightTween,this.tweenDuration,{
            "pos":1,
            "ease":this.easeFunc,
            "onUpdate":this.motionChange,
            "onUpdateParams":[this.lightTween],
            "onComplete":this.motionFinish
         });
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
      
      protected function clearProperties() : void
      {
         if(this.component != null)
         {
            this.component.targetOwner.filters = [];
            if(this.maskee != null)
            {
               if(this.component.targetOwner.contains(this.maskee))
               {
                  this.component.targetOwner.removeChild(this.maskee);
               }
            }
            this.maskee = null;
            if(this.lightTween != null)
            {
               TweenLite.killTweensOf(this.lightTween,false);
            }
            this.lightTween = null;
            if(this.maskeeTween != null)
            {
               TweenLite.killTweensOf(this.maskeeTween,false);
            }
            this.maskeeTween = null;
         }
         if(this.target != null)
         {
            this.target.mask = null;
         }
      }
      
      public function set offset(param1:Number) : void
      {
         this._offset = param1;
      }
      
      protected function motionFinish() : void
      {
         this.finishedTweens++;
         if(this.finishedTweens == 2)
         {
            this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
         }
      }
      
      public function set radius(param1:Number) : void
      {
         if(param1 < 1)
         {
            param1 = 1;
         }
         this._radius = Number(Number(param1)) || Number(1);
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
