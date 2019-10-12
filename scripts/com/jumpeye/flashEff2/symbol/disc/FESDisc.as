package com.jumpeye.flashEff2.symbol.disc
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffSymbol;
   import com.jumpeye.transitions.TweenLite;
   import com.jumpeye.utils.JDraw;
   import flash.display.Shape;
   import flash.geom.Rectangle;
   
   public class FESDisc extends IFlashEffSymbol
   {
       
      
      private var tweenable:Object;
      
      private var discRadius:Number;
      
      private var tweenObj:TweenLite;
      
      private var discShape:Shape;
      
      private var _rotateClockwise:Boolean = true;
      
      private var _startAngle:int = 0;
      
      public function FESDisc(param1:JUIComponent = null)
      {
         super();
         this._component = param1;
         init();
      }
      
      override public function hide() : void
      {
         if(this.discShape == null)
         {
            createDisc(false);
         }
         startTransition(false);
      }
      
      override public function remove() : void
      {
         stopTransition();
      }
      
      private function stopTransition() : void
      {
         TweenLite.removeTween(this.tweenObj);
         transitionComplete(false);
      }
      
      private function init() : void
      {
         this.tweenable = new Object();
         this.tweenable.angle = 0;
         this.tweenable.show = true;
         _easeType = "easeInOut";
         _tweenType = "Strong";
         _tweenDuration = 2;
      }
      
      public function get startAngle() : int
      {
         return _startAngle;
      }
      
      private function startTransition(param1:Boolean) : void
      {
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
         var _loc2_:Object = new Object();
         if(param1)
         {
            _loc2_.angle = 360;
            this.tweenable.angle = 0;
            this.tweenable.show = true;
         }
         else
         {
            _loc2_.angle = 1;
            this.tweenable.angle = 360;
            this.tweenable.show = false;
         }
         _loc2_.ease = easeFunc;
         _loc2_.onUpdate = updateDisc;
         _loc2_.onUpdateParams = [this.tweenable];
         _loc2_.onComplete = transitionComplete;
         this.tweenObj = TweenLite.to(this.tweenable,this._tweenDuration,_loc2_);
      }
      
      public function get rotateClockwise() : Boolean
      {
         return _rotateClockwise;
      }
      
      public function set startAngle(param1:int) : void
      {
         _startAngle = param1;
      }
      
      private function transitionComplete(param1:Boolean = true) : void
      {
         if(this._target != null)
         {
            if(this.tweenable.show)
            {
               this._target.visible = true;
            }
            else
            {
               this._target.visible = false;
            }
            this._target.mask = null;
         }
         if(this.discShape != null)
         {
            this.discShape.graphics.clear();
            this._component.targetOwner.removeChild(this.discShape);
            this.discShape = null;
         }
         if(param1)
         {
            this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
         }
      }
      
      private function createDisc(param1:Boolean) : void
      {
         this.discShape = new Shape();
         this._component.targetOwner.addChild(this.discShape);
         this._target.mask = this.discShape;
         var _loc2_:Rectangle = new Rectangle();
         _loc2_ = this.target.getBounds(this._component.targetOwner);
         this.discShape.x = this.target.width / 2 + _loc2_.x;
         this.discShape.y = this.target.height / 2 + _loc2_.y;
         this.discRadius = Math.sqrt(this.target.width * this.target.width + this.target.height * this.target.height) / 2;
         if(!param1)
         {
            this.discShape.graphics.beginFill(0);
            JDraw.pie(this.discShape.graphics,0,0,0,360,this.discRadius);
            this.discShape.graphics.endFill();
         }
      }
      
      public function set rotateClockwise(param1:Boolean) : void
      {
         _rotateClockwise = param1;
      }
      
      override public function show() : void
      {
         if(this.discShape == null)
         {
            createDisc(true);
         }
         startTransition(true);
      }
      
      private function updateDisc(param1:Object) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:Number = NaN;
         this.discShape.rotation = 0;
         if(this._rotateClockwise)
         {
            _loc2_ = 0;
            _loc3_ = -param1.angle;
         }
         else
         {
            _loc2_ = 0;
            _loc3_ = param1.angle;
         }
         if(!param1.show)
         {
            _loc3_ = -_loc3_;
         }
         this.discShape.graphics.clear();
         this.discShape.graphics.beginFill(0);
         JDraw.pie(this.discShape.graphics,0,0,_loc2_,_loc3_,this.discRadius);
         this.discShape.graphics.endFill();
         this.discShape.rotation = this._startAngle - 90 - this._component["rotation"];
      }
   }
}
