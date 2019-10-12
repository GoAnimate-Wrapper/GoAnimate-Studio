package com.jumpeye.flashEff2.symbol.stripes
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffSymbol;
   import com.jumpeye.transitions.TweenLite;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.filters.BitmapFilter;
   import flash.filters.BlurFilter;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   
   public class FESLightStripes extends IFlashEffSymbol
   {
       
      
      private var _stripeMaxThickness:Number = 20;
      
      protected var outputOwner:Sprite;
      
      private var _groupDuration:Number = 0.7;
      
      private var _blurAmount:Number = 150;
      
      protected var tempDelayMatr:Array;
      
      protected var isShow:Boolean = false;
      
      protected var tweensComplete:uint = 0;
      
      protected var getProps:Function;
      
      protected var getDelay:Function;
      
      protected var blurX:uint = 0;
      
      protected var blurY:uint = 1;
      
      private var _alphaPercentage:Number = 30;
      
      protected var tweensMax:uint = 0;
      
      protected var stripesRef:Array;
      
      protected var ease:Function;
      
      private var _preset:Number = 1;
      
      public function FESLightStripes(param1:JUIComponent = null)
      {
         super();
         this.component = param1;
         this.init();
      }
      
      override public function remove() : void
      {
         var _loc1_:uint = 0;
         if(this.outputOwner != null)
         {
            if(this.component.targetOwner.contains(this.outputOwner))
            {
               this.component.targetOwner.removeChild(this.outputOwner);
            }
            this.outputOwner = null;
            TweenLite.killTweensOf();
         }
         if(stripesRef != null)
         {
            _loc1_ = this.stripesRef.length;
            while(--_loc1_ >= 0)
            {
               TweenLite.killTweensOf(this.stripesRef[_loc1_],false);
               TweenLite.killTweensOf(this.stripesRef[_loc1_].stripe,false);
            }
         }
         stripesRef = null;
      }
      
      protected function onUpdate(param1:Object) : void
      {
         var _loc2_:Number = param1.prop;
         param1.stripe[param1.scale] = param1.startScale + (param1.endScale - param1.startScale) * _loc2_;
         param1.stripe[param1.pos] = param1.startPos + (param1.endPos - param1.startPos) * _loc2_;
      }
      
      protected function init() : void
      {
         _tweenDuration = 1.5;
         _easeType = "easeInOut";
         _tweenType = "Strong";
      }
      
      public function get alphaPercentage() : Number
      {
         return this._alphaPercentage;
      }
      
      public function get blurAmount() : Number
      {
         return _blurAmount;
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
      
      protected function complete(param1:Object = null) : void
      {
         tweensComplete++;
         if(param1 != null)
         {
            param1.stripe.filters = [];
         }
         if(tweensComplete == tweensMax)
         {
            this.remove();
            this.target.visible = this.isShow;
            this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
         }
      }
      
      public function set stripeMaxThickness(param1:Number) : void
      {
         if(param1 < 1)
         {
            param1 = 1;
         }
         this._stripeMaxThickness = param1;
      }
      
      override public function hide() : void
      {
         this.startTransition(false);
      }
      
      public function set preset(param1:Number) : void
      {
         this._preset = param1;
      }
      
      protected function updateBlur(param1:Object) : void
      {
         var _loc2_:Number = param1.prop;
         this.blurEffect(param1.stripe,this.blurAmount * _loc2_ * this.blurX,this.blurAmount * _loc2_ * this.blurY);
      }
      
      public function set blurAmount(param1:Number) : void
      {
         _blurAmount = param1;
      }
      
      protected function startTransition(param1:Boolean = true) : void
      {
         var stripeThickness:Number = NaN;
         var matr:Matrix = null;
         var props:Object = null;
         var stripe:Sprite = null;
         var stripeBD:BitmapData = null;
         var stripeObj:Object = null;
         var delay:Number = NaN;
         var show:Boolean = param1;
         var bounds:Rectangle = this.target.getBounds(this.target);
         this.outputOwner = new Sprite();
         this.component.targetOwner.addChild(this.outputOwner);
         var twoPixels:uint = 0;
         if(this.target is TextField)
         {
            twoPixels = 2;
         }
         this.outputOwner.x = Math.round(bounds.x + twoPixels);
         this.outputOwner.y = Math.round(bounds.y + twoPixels);
         this.isShow = show;
         var stripesNr:Number = 0;
         var startMatrix:Matrix = new Matrix();
         startMatrix.translate(-bounds.x,-bounds.y);
         startMatrix.scale(this.target.scaleX,this.target.scaleY);
         var targetBD:BitmapData = new BitmapData(int(this.target.width) || 1,int(this.target.height) || 1,true,0);
         targetBD.draw(this.target,startMatrix);
         var targetBmp:Bitmap = new Bitmap(targetBD);
         var targetBmpContainer:Sprite = new Sprite();
         targetBmpContainer.addChild(targetBmp);
         var timeMatrix:Array = [];
         var dim1:String = "width";
         var dim2:String = "height";
         var scale:String = "scaleY";
         var fixPos:String = "x";
         var dynamicPos:String = "y";
         var targetDim1:Number = this.target.width;
         var targetDim2:Number = this.target.height;
         var start:uint = 0;
         var end:uint = 1;
         if(show == false)
         {
            start = 1;
            end = 0;
         }
         var preset:Number = Number(this.preset) || Number(1);
         tweensComplete = 0;
         if(preset < 4)
         {
            this.getProps = function(param1:Number, param2:Number, param3:Matrix):Object
            {
               return {
                  "width":param1,
                  "height":param2,
                  "matrix":param3
               };
            };
         }
         else
         {
            dim1 = dim2;
            dim2 = "width";
            scale = "scaleX";
            fixPos = "y";
            dynamicPos = "x";
            targetDim1 = Math.ceil(this.target.height);
            targetDim2 = Math.ceil(this.target.width);
            blurX = 1;
            blurY = 0;
            this.getProps = function(param1:Number, param2:Number, param3:Matrix):Object
            {
               var _loc4_:Number = param3.tx;
               param3.tx = param3.ty;
               param3.ty = _loc4_;
               return {
                  "width":param2,
                  "height":param1,
                  "matrix":param3
               };
            };
         }
         var targetDim:Number = Math.ceil(targetDim2);
         var currentPos:Number = Math.ceil(targetDim1);
         switch(this.preset)
         {
            default:
               this.getDelay = function(param1:Number, param2:Number):*
               {
                  return param1;
               };
               break;
            case 2:
               this.getDelay = function(param1:Number, param2:Number):*
               {
                  return param2 - param1;
               };
               break;
            case 3:
               this.getDelay = function(param1:Number, param2:Number):*
               {
                  return Math.floor(Math.random() * param2);
               };
               break;
            case 4:
               this.getDelay = function(param1:Number, param2:Number):*
               {
                  return param1;
               };
               break;
            case 5:
               this.getDelay = function(param1:Number, param2:Number):*
               {
                  return param2 - param1;
               };
               break;
            case 6:
               this.getDelay = function(param1:Number, param2:Number):*
               {
                  return Math.floor(Math.random() * param2);
               };
         }
         stripesRef = [];
         while(currentPos > 0)
         {
            stripeThickness = Math.floor(Math.random() * (this._stripeMaxThickness - 1) + 1);
            if(stripeThickness > currentPos)
            {
               stripeThickness = currentPos;
            }
            matr = new Matrix();
            matr.translate(-(targetDim1 - currentPos),0);
            props = this.getProps(stripeThickness,targetDim,matr);
            stripe = new Sprite();
            stripeBD = new BitmapData(props.width,props.height,true,16711935);
            stripeBD.draw(targetBmpContainer,props.matrix);
            stripe.addChild(new Bitmap(stripeBD));
            this.outputOwner.addChild(stripe);
            stripe[fixPos] = targetDim1 - currentPos;
            stripe[scale] = 1 + Math.random() - 0.5;
            stripe[dynamicPos] = stripe[dynamicPos] + (targetDim2 - stripe[dim2]) / 2;
            stripeObj = {
               "stripe":stripe,
               "prop":end,
               "scale":scale,
               "pos":dynamicPos,
               "startPos":0,
               "endPos":stripe[dynamicPos],
               "endScale":stripe[scale],
               "startScale":1
            };
            stripesRef[stripesNr] = stripeObj;
            currentPos = currentPos - stripeThickness;
            stripesNr++;
         }
         this.ease = this.easeFunc || TweenLite.defaultEase;
         var stripeDelay:Number = Math.max((this.tweenDuration - this.groupDuration) / (stripesNr - 1),0);
         var i:uint = stripesRef.length;
         this.tweensMax = 3 * stripesNr;
         while(--i >= 0)
         {
            stripeObj = stripesRef[i];
            stripeObj.stripe.alpha = start;
            delay = this.getDelay(i,stripesNr) * stripeDelay;
            TweenLite.to(stripeObj,this.groupDuration,{
               "prop":start,
               "delay":delay,
               "ease":this.easeFunc,
               "onUpdate":this.onUpdate,
               "onUpdateParams":[stripeObj],
               "onComplete":this.complete,
               "onCompleteParams":[stripeObj]
            });
            TweenLite.to(stripeObj,this.groupDuration,{
               "prop":start,
               "delay":delay,
               "onUpdate":this.updateBlur,
               "onUpdateParams":[stripeObj],
               "overwrite":false,
               "onComplete":this.complete,
               "onCompleteParams":[stripeObj]
            });
            TweenLite.to(stripeObj.stripe,this.groupDuration * this._alphaPercentage / 100,{
               "alpha":end,
               "delay":delay + start * this.groupDuration * (100 - this._alphaPercentage) / 100,
               "onComplete":this.complete
            });
            this.onUpdate(stripeObj);
         }
         this.target.visible = false;
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
      
      protected function blurEffect(param1:DisplayObject, param2:*, param3:*, param4:* = 2) : void
      {
         var _loc5_:BitmapFilter = new BlurFilter(param2,param3,param4);
         param1.filters = [_loc5_];
      }
      
      public function get stripeMaxThickness() : Number
      {
         return this._stripeMaxThickness;
      }
      
      public function get preset() : Number
      {
         return this._preset;
      }
      
      public function set groupDuration(param1:Number) : void
      {
         this._groupDuration = param1;
      }
      
      override public function show() : void
      {
         this.startTransition(true);
      }
   }
}
