package com.jumpeye.flashEff2.symbol.mystery
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffSymbol;
   import com.jumpeye.transitions.TweenLite;
   import flash.display.Shader;
   import flash.filters.ShaderFilter;
   import flash.geom.Point;
   import flash.utils.ByteArray;
   
   public class FESMystery extends IFlashEffSymbol
   {
       
      
      private var _preset:Number = 1;
      
      protected var tweenObject:Object;
      
      private var _positionX:Number = 100;
      
      private var _blurY:Number = 100;
      
      private var _positionY:Number = 0;
      
      private var _blurQuality:Number = 2;
      
      var shader:Shader;
      
      protected var selfDisplace:Class;
      
      private var finalAmount:Number = 1;
      
      private var _amount:Number = 5000;
      
      private var _zoom:Number = 1;
      
      public function FESMystery(param1:JUIComponent = null)
      {
         this.shader = new Shader();
         this.selfDisplace = FESMystery_selfDisplace;
         super();
         this.component = param1;
         this.init();
      }
      
      public function get preset() : Number
      {
         return this._preset;
      }
      
      override public function hide() : void
      {
         this.startTransition(false);
      }
      
      override public function remove() : void
      {
         if(this.tweenObject is Object)
         {
            TweenLite.killTweensOf(this.tweenObject);
            this.tweenObject = null;
         }
         if(this.target != null)
         {
            this.target.filters = [];
            this.target.alpha = 1;
         }
      }
      
      protected function motionChange() : void
      {
         var _loc1_:Object = this.tweenObject;
         var _loc2_:Number = _loc1_.position;
         var _loc3_:* = _loc2_ / _loc1_.initialPosition * this.zoom + _loc1_.startPositionX;
         this.target.alpha = 1 - _loc2_;
         this.shader.data.stretch.value = [this.amount * _loc2_,this.amount * _loc2_];
         this.target.filters = [new ShaderFilter(this.shader)];
      }
      
      public function get positionX() : Number
      {
         return this._positionX;
      }
      
      public function get positionY() : Number
      {
         return this._positionY;
      }
      
      public function get zoom() : Number
      {
         return this._zoom;
      }
      
      public function set positionX(param1:Number) : void
      {
         this._positionX = param1;
      }
      
      public function get amount() : Number
      {
         return this._amount;
      }
      
      public function set positionY(param1:Number) : void
      {
         this._positionY = param1;
      }
      
      protected function init() : void
      {
         _tweenDuration = 1.5;
         _tweenType = "Quadratic";
         _easeType = "easeOut";
      }
      
      protected function motionFinish() : void
      {
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
      }
      
      public function set zoom(param1:Number) : void
      {
         this._zoom = param1;
      }
      
      protected function startTransition(param1:Boolean) : void
      {
         if(param1 == true)
         {
            this.target.visible = false;
         }
         this.tweenObject = {"position":Math.max(Math.max(this.zoom,this.zoom),0.001)};
         this.tweenObject.initialPosition = this.tweenObject.position;
         this.tweenObject.startPositionX = 0;
         this.tweenObject.startPositionY = 0;
         var _loc2_:Point = new Point(this.target.x,this.target.y);
         var _loc3_:Point = this.target.localToGlobal(_loc2_);
         var _loc4_:Point = new Point(this.target.x + this.target.width,this.target.y + this.target.height);
         var _loc5_:Point = this.target.parent.localToGlobal(_loc4_);
         var _loc6_:* = _loc5_.x - _loc3_.x;
         var _loc7_:* = _loc5_.y - _loc3_.y;
         switch(Number(this.preset))
         {
            default:
               this.positionX = _loc6_ / 2;
               this.positionY = _loc7_ / 2;
               break;
            case 2:
               this.positionX = 0;
               this.positionY = _loc7_ / 2;
               break;
            case 3:
               this.positionX = _loc6_;
               this.positionY = _loc7_ / 2;
               break;
            case 4:
               this.positionX = _loc6_ / 2;
               this.positionY = 0;
               break;
            case 5:
               this.positionX = _loc6_ / 2;
               this.positionY = _loc7_;
         }
         this.shader.byteCode = ByteArray(new this.selfDisplace());
         this.shader.data.center.value = [this.positionX,this.positionY];
         if(param1 == true)
         {
            this.target.visible = false;
            this.tweenObject.position = this.tweenObject.initialPosition;
            TweenLite.to(this.tweenObject,this.tweenDuration,{
               "position":0,
               "ease":this.easeFunc,
               "onUpdate":this.motionChange,
               "onComplete":this.motionFinish
            });
         }
         else
         {
            this.tweenObject.position = 0;
            TweenLite.to(this.tweenObject,this.tweenDuration,{
               "position":this.tweenObject.initialPosition,
               "ease":this.easeFunc,
               "onUpdate":this.motionChange,
               "onComplete":this.motionFinish
            });
         }
         this.target.visible = true;
         this.motionChange();
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
      
      public function set amount(param1:Number) : void
      {
         this._amount = param1;
      }
      
      public function get blurQuality() : Number
      {
         return this._blurQuality;
      }
      
      override public function show() : void
      {
         this.startTransition(true);
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
         else if(param1 > 15)
         {
            param1 = 15;
         }
         this._blurQuality = param1;
      }
   }
}
