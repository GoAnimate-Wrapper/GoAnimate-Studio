package com.jumpeye.flashEff2.symbol.scale
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffSymbol;
   import com.jumpeye.transitions.TweenLite;
   import flash.filters.BlurFilter;
   
   public class FESScale extends IFlashEffSymbol
   {
       
      
      private var _preset:Number = 1;
      
      private var positionIntermediarX;
      
      private var isShow:Boolean;
      
      private var _scale:Number = 0;
      
      private var blurX;
      
      private var blurY:Number;
      
      private var _h:Number;
      
      private var _maxBlur:Number = 20;
      
      private var owner:Object;
      
      private var _w;
      
      private var positionIntermediarY:Number;
      
      public function FESScale(param1:JUIComponent = null)
      {
         super();
         this.component = param1;
         this.init();
      }
      
      private function motionFinish(param1:*) : *
      {
         this.remove();
         if(isShow == false)
         {
            this.target.visible = false;
         }
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
      }
      
      override public function hide() : void
      {
         this.startTransition(false);
      }
      
      override public function remove() : void
      {
         if(this.target != null)
         {
            if(this.owner.positions is Object)
            {
               this.target.transform.matrix = owner.positions.matrix;
               this.target.filters = [];
               this.owner.positions = null;
            }
         }
         if(this.owner.tweenObject is Object)
         {
            TweenLite.killTweensOf(this.owner.tweenObject,false);
            this.owner.tweenObject = null;
         }
      }
      
      protected function init() : void
      {
         _tweenDuration = 1.1;
         _tweenType = "Strong";
         _easeType = "easeInOut";
         owner = {};
      }
      
      protected function startTransition(param1:Boolean) : void
      {
         isShow = param1;
         _w = this.target.scaleX;
         _h = this.target.scaleY;
         var _loc2_:* = this.target.getBounds(this.target);
         owner.positions = {
            "x":this.target.x,
            "y":this.target.y,
            "scaleX":this.target.scaleX,
            "scaleY":this.target.scaleY,
            "width":_loc2_.width * this.target.scaleX,
            "height":_loc2_.height * this.target.scaleY,
            "xMin":_loc2_.x,
            "yMin":_loc2_.y,
            "matrix":this.target.transform.matrix
         };
         blurX = 1;
         blurY = 0;
         owner.tweenObject = {};
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
         this.preset = Number(Number(this.preset)) || Number(1);
         switch(this.preset)
         {
            default:
               blurY = 1;
               owner.tweenedProps = ["x","y","scaleX","scaleY"];
               owner.startPositions = [owner.positions.x + owner.positions.width * (1 - this._scale) / 2 + owner.positions.xMin * (1 - this._scale),owner.positions.y - (owner.positions.height * this._scale - owner.positions.height) / 2 + owner.positions.yMin,this._scale,this._scale];
               owner.endPositions = [owner.positions.x,owner.positions.y,owner.positions.scaleX,owner.positions.scaleY];
               break;
            case 2:
               owner.tweenedProps = ["x","scaleX"];
               owner.startPositions = [owner.positions.x - owner.positions.xMin * (-owner.positions.scaleX + this._scale),this._scale];
               owner.endPositions = [owner.positions.x,owner.positions.scaleX];
               break;
            case 3:
               owner.tweenedProps = ["x","scaleX"];
               owner.startPositions = [owner.positions.x + owner.positions.width * (owner.positions.scaleX - this._scale) / owner.positions.scaleX + owner.positions.xMin * (owner.positions.scaleX - this._scale),this._scale];
               owner.endPositions = [owner.positions.x,owner.positions.scaleX];
               break;
            case 4:
               blurY = 1;
               blurX = 0;
               owner.tweenedProps = ["y","scaleY"];
               owner.startPositions = [owner.positions.y - owner.positions.yMin * (-owner.positions.scaleY + this._scale),this._scale];
               owner.endPositions = [owner.positions.y,owner.positions.scaleY];
               break;
            case 5:
               blurY = 1;
               blurX = 0;
               owner.tweenedProps = ["y","scaleY"];
               owner.startPositions = [owner.positions.y + owner.positions.height * (owner.positions.scaleY - this._scale) / owner.positions.scaleY + owner.positions.yMin * (owner.positions.scaleY - this._scale),this._scale];
               owner.endPositions = [owner.positions.y,owner.positions.scaleY];
         }
         if(param1 == true)
         {
            doTransBlur(1,0);
            startMoving(owner.tweenedProps,owner.startPositions,owner.endPositions);
         }
         else
         {
            doTransBlur(0,1);
            startMoving(owner.tweenedProps,owner.endPositions,owner.startPositions);
         }
      }
      
      public function set maxBlur(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 > 100)
         {
            param1 = 100;
         }
         this._maxBlur = param1;
      }
      
      private function motionChanged(param1:*) : *
      {
         var _loc2_:* = undefined;
         for(_loc2_ in param1.props)
         {
            this.target[param1.props[_loc2_]] = param1.start[_loc2_] + (param1.end[_loc2_] - param1.start[_loc2_]) * param1.prop;
         }
         positionIntermediarX = this.target.scaleX;
         positionIntermediarY = this.target.scaleY;
      }
      
      public function get preset() : Number
      {
         return this._preset;
      }
      
      private function onMotionChanged(param1:*) : *
      {
         var _loc2_:* = param1.pos;
         var _loc3_:Number = this.maxBlur * _loc2_;
         var _loc4_:Number = this.maxBlur * _loc2_;
         blurEffect(_loc3_,_loc4_);
      }
      
      private function blurEffect(param1:*, param2:*) : *
      {
         var _loc3_:BlurFilter = new BlurFilter(param1,param2,1);
         this.target.filters = [_loc3_];
      }
      
      protected function startMoving(param1:Array, param2:Array, param3:Array) : *
      {
         var _loc5_:* = undefined;
         positionIntermediarX = param2[arraySearch("scaleX",param1)];
         positionIntermediarY = param2[arraySearch("scaleY",param1)];
         owner.tweenObject.start = param2;
         owner.tweenObject.end = param3;
         owner.tweenObject.props = param1;
         var _loc4_:Object = owner.tweenObject;
         for(_loc5_ in _loc4_.props)
         {
            this.target[_loc4_.props[_loc5_]] = _loc4_.start[_loc5_];
         }
         owner.tweenObject.prop = 0;
         TweenLite.to(owner.tweenObject,this.tweenDuration,{
            "prop":1,
            "delay":0,
            "overwrite":false,
            "ease":this.easeFunc,
            "onComplete":motionFinish,
            "onCompleteParams":[owner.tweenObject],
            "onUpdate":motionChanged,
            "onUpdateParams":[owner.tweenObject]
         });
      }
      
      private function doTransBlur(param1:Number, param2:Number) : *
      {
         owner.tweenObject.pos = param1;
         TweenLite.to(owner.tweenObject,this.tweenDuration,{
            "pos":param2,
            "delay":0,
            "overwrite":false,
            "ease":this.easeFunc,
            "onUpdate":onMotionChanged,
            "onUpdateParams":[owner.tweenObject]
         });
      }
      
      public function get maxBlur() : *
      {
         return this._maxBlur;
      }
      
      private function arraySearch(param1:String, param2:Array) : *
      {
         var _loc3_:* = param2.length;
         var _loc4_:Number = 0;
         while(_loc4_ < param2.length)
         {
            if(param2[_loc4_] == param1)
            {
               return _loc4_;
            }
            _loc4_++;
         }
         return 0;
      }
      
      override public function show() : void
      {
         this.startTransition(true);
      }
      
      public function set preset(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 1;
         }
         if(param1 > 5)
         {
            param1 = 5;
         }
         this._preset = param1;
      }
   }
}
