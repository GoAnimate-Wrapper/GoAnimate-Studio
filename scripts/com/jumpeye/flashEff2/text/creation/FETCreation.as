package com.jumpeye.flashEff2.text.creation
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffText;
   import com.jumpeye.flashEff2.text.patternsPresets.JFETPreset;
   import com.jumpeye.transitions.TweenLite;
   import flash.display.Sprite;
   import flash.filters.BlurFilter;
   import flash.geom.Point;
   
   public class FETCreation extends IFlashEffText
   {
       
      
      private var _maxRotation:Number = 800;
      
      protected var isShow:Boolean = true;
      
      protected var totalTweens:uint = 0;
      
      private var _moveToRight:Boolean = true;
      
      private var objMatrix:Array;
      
      private var _maxBlur:Number = 20;
      
      private var _yOffset:Number = -12;
      
      protected var tweensFinished:uint = 0;
      
      private var _groupDuration:Number = 1;
      
      private var _preset:Number = 1;
      
      public function FETCreation(param1:JUIComponent = null)
      {
         super();
         this.component = param1;
         init();
      }
      
      override public function hide() : void
      {
         this.startTransition(false);
      }
      
      override public function remove() : void
      {
         var _loc1_:uint = 0;
         var _loc2_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:Object = null;
         if(objMatrix != null)
         {
            _loc1_ = objMatrix.length;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               _loc3_ = objMatrix[_loc2_].length;
               _loc4_ = 0;
               while(_loc4_ < _loc3_)
               {
                  _loc5_ = objMatrix[_loc2_][_loc4_];
                  TweenLite.killTweensOf(_loc5_,false);
                  _loc5_.filters = [];
                  _loc4_++;
               }
               _loc2_++;
            }
            objMatrix = null;
         }
      }
      
      public function set yOffset(param1:Number) : void
      {
         _yOffset = param1;
      }
      
      public function get maxRotation() : Number
      {
         return _maxRotation;
      }
      
      public function get groupDuration() : Number
      {
         return _groupDuration;
      }
      
      protected function motionChange(param1:*) : void
      {
         var _loc2_:Number = param1.prop;
         param1.x = this.getBezier(_loc2_,param1.sp.x,param1.mp.x,param1.ep.x);
         param1.y = this.getBezier(_loc2_,param1.sp.y,param1.mp.y,param1.ep.y);
         param1.rotation = this.getBezier(_loc2_,param1.sr,param1.mr,param1.er);
         param1.scaleX = param1.scaleY = this.getBezier(_loc2_,param1.ss,param1.ms,param1.es);
         var _loc3_:Number = this.getBezier(_loc2_,param1.sb,param1.mb,param1.eb);
         this.filterEffect(param1,_loc3_,_loc3_);
      }
      
      private function init() : void
      {
         _tweenDuration = 1.6;
         _tweenType = "Strong";
         _easeType = "easeOut";
      }
      
      public function set maxRotation(param1:Number) : void
      {
         _maxRotation = param1;
      }
      
      protected function getBezier(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         return (1 - param1) * (1 - param1) * param2 + 2 * param1 * (1 - param1) * param3 + param1 * param1 * param4;
      }
      
      public function set maxBlur(param1:Number) : void
      {
         _maxBlur = param1;
      }
      
      protected function startTransition(param1:Boolean = true) : void
      {
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:uint = 0;
         var _loc14_:uint = 0;
         var _loc15_:Object = null;
         var _loc2_:String = "chars";
         this.component.drawTextTable(_loc2_,this.partialGroup,this.partialPercent,this.selectedStrings,this.partialStart,this.partialBlurAmount);
         objMatrix = this.component.absMatrix;
         var _loc3_:Object = JFETPreset.getPresetsArray(preset,objMatrix);
         var _loc4_:Array = _loc3_.timeMatrix;
         var _loc5_:uint = objMatrix.length;
         var _loc6_:Number = _loc3_.maxItems;
         var _loc7_:Number = 0;
         var _loc8_:Number = 1;
         if(param1 == false)
         {
            _loc7_ = 1;
            _loc8_ = 0;
         }
         if(moveToRight == param1)
         {
            _loc10_ = this.target.width / 3;
            _loc11_ = -this.target.width / 3;
         }
         else
         {
            _loc10_ = 2 * this.target.width / 3;
            _loc11_ = 4 * this.target.width / 3;
         }
         if(_loc6_ > 1)
         {
            _loc12_ = Math.max((this._tweenDuration - this._groupDuration) / (_loc6_ - 1),0);
         }
         else
         {
            _loc12_ = 0;
         }
         tweensFinished = 0;
         totalTweens = 0;
         var _loc9_:uint = 0;
         while(_loc9_ < _loc5_)
         {
            _loc13_ = objMatrix[_loc9_].length;
            _loc14_ = 0;
            while(_loc14_ < _loc13_)
            {
               _loc15_ = objMatrix[_loc9_][_loc14_];
               _loc15_.alpha = _loc7_;
               _loc15_.prop = _loc7_;
               _loc15_.ep = new Point(_loc15_.x,_loc15_.y);
               _loc15_.sp = new Point(_loc10_,_loc15_.y + this._yOffset);
               _loc15_.mp = new Point(_loc11_,_loc15_.y);
               _loc15_.sr = this._maxRotation;
               _loc15_.er = 0;
               _loc15_.mr = 0;
               _loc15_.ss = 0.7;
               _loc15_.es = 1;
               _loc15_.ms = 1;
               _loc15_.sb = this._maxBlur;
               _loc15_.eb = 0;
               _loc15_.mb = this._maxBlur / 10;
               totalTweens++;
               this.motionChange(_loc15_);
               TweenLite.to(_loc15_,this._groupDuration,{
                  "prop":_loc8_,
                  "delay":_loc4_[_loc9_][_loc14_] * _loc12_,
                  "ease":this.easeFunc,
                  "onUpdate":this.motionChange,
                  "onUpdateParams":[_loc15_],
                  "onComplete":this.motionFinish
               });
               TweenLite.to(_loc15_,this._groupDuration,{
                  "alpha":_loc8_,
                  "delay":_loc4_[_loc9_][_loc14_] * _loc12_,
                  "onComplete":this.motionFinish,
                  "overwrite":false
               });
               _loc14_++;
            }
            _loc9_++;
         }
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
      
      public function get yOffset() : Number
      {
         return _yOffset;
      }
      
      public function set moveToRight(param1:Boolean) : void
      {
         _moveToRight = param1;
      }
      
      public function set groupDuration(param1:Number) : void
      {
         _groupDuration = param1;
      }
      
      protected function motionFinish() : void
      {
         this.tweensFinished++;
         if(2 * totalTweens == this.tweensFinished)
         {
            this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
         }
      }
      
      public function get maxBlur() : Number
      {
         return _maxBlur;
      }
      
      public function get preset() : uint
      {
         return _preset;
      }
      
      public function get moveToRight() : Boolean
      {
         return _moveToRight;
      }
      
      public function set preset(param1:uint) : void
      {
         if(param1 > 25)
         {
            param1 = 25;
         }
         _preset = param1;
      }
      
      protected function filterEffect(param1:Sprite, param2:Number, param3:Number, param4:uint = 2) : void
      {
         var _loc5_:BlurFilter = new BlurFilter(param2,param3,param4);
         var _loc6_:Array = new Array();
         _loc6_.push(_loc5_);
         param1.filters = _loc6_;
      }
      
      override public function show() : void
      {
         this.startTransition(true);
      }
   }
}
