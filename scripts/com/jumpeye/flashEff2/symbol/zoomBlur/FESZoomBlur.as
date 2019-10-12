package com.jumpeye.flashEff2.symbol.zoomBlur
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffSymbol;
   import com.jumpeye.transitions.TweenLite;
   import flash.display.Shader;
   import flash.filters.ShaderFilter;
   import flash.geom.Point;
   import flash.utils.ByteArray;
   
   public class FESZoomBlur extends IFlashEffSymbol
   {
       
      
      protected var tweenObject:Object;
      
      var percPosY:Number;
      
      private var _positionX:Number = 50;
      
      var percPosX:Number;
      
      private var _positionY:Number = 50;
      
      private var _blurQuality:Number = 2;
      
      protected var zoomBlur:Class;
      
      var shader:Shader;
      
      private var _zoom:Number = 1;
      
      public function FESZoomBlur(param1:JUIComponent = null)
      {
         this.shader = new Shader();
         this.zoomBlur = FESZoomBlur_zoomBlur;
         super();
         this.component = param1;
         this.init();
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
         this.blurEffect(_loc3_,this.blurQuality);
         this.target.alpha = 1 - _loc2_;
      }
      
      public function get positionX() : Number
      {
         return this._positionX;
      }
      
      public function get zoom() : Number
      {
         return this._zoom;
      }
      
      public function get positionY() : Number
      {
         return this._positionY;
      }
      
      public function set positionX(param1:Number) : void
      {
         this._positionX = param1;
      }
      
      public function get blurQuality() : Number
      {
         return this._blurQuality;
      }
      
      public function set zoom(param1:Number) : void
      {
         this._zoom = param1;
      }
      
      public function set positionY(param1:Number) : void
      {
         this._positionY = param1;
      }
      
      protected function init() : void
      {
         _tweenDuration = 2;
         _easeType = "easeOut";
         _tweenType = "Quadratic";
      }
      
      protected function motionFinish() : void
      {
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
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
         this.shader.byteCode = ByteArray(new this.zoomBlur());
         var _loc2_:Point = new Point(0,0);
         var _loc3_:* = target.localToGlobal(_loc2_);
         var _loc4_:* = target.parent.localToGlobal(new Point(this.target.width,this.target.height));
         var _loc5_:* = _loc3_.x;
         var _loc6_:* = _loc4_.x;
         var _loc7_:* = _loc3_.y;
         var _loc8_:* = _loc4_.y;
         this.percPosX = (_loc6_ - _loc5_) * this.positionX / 100;
         this.percPosY = (_loc8_ - _loc7_) * this.positionY / 100;
         if(param1 == true)
         {
            this.target.visible = false;
            this.shader.data.amount.value = [0];
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
            this.shader.data.amount.value = [this.zoom];
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
      
      protected function blurEffect(param1:*, param2:*) : void
      {
         this.shader.data.center.value = [this.percPosX,this.percPosY];
         this.shader.data.amount.value = [param1];
         this.target.filters = [new ShaderFilter(this.shader)];
      }
      
      override public function show() : void
      {
         this.startTransition(true);
      }
   }
}
