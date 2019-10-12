package com.jumpeye.flashEff2.text.fe3D.camDepth
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffText;
   import com.jumpeye.flashEff2.text.FeSeparator;
   import com.jumpeye.flashEff2.text.fe3D.objects.JFE3DObject;
   import com.jumpeye.flashEff2.text.fe3D.spaces.JFE3DSpace;
   import com.jumpeye.flashEff2.text.patternsPresets.JFET3DPreset;
   import com.jumpeye.transitions.TweenLite;
   
   public class FET3DCamDepth extends IFlashEffText
   {
       
      
      private var _preset:Number = 14;
      
      protected var space:JFE3DSpace;
      
      protected var tweenObject:Object;
      
      protected var getZPosition:Function;
      
      private var _cameraFinalDepth:Number = -200;
      
      protected var totalTweens:Number = 2;
      
      private var _alphaPercentage:Number = 50;
      
      protected var showTr:Boolean = true;
      
      private var _backSpace:Number = 100;
      
      protected var focalLength:Number = 500;
      
      protected var finishedTweens:Number = 0;
      
      private var _frontSpace:Number = 100;
      
      public function FET3DCamDepth(param1:JUIComponent = null)
      {
         super();
         this.component = param1;
         init();
      }
      
      public function set frontSpace(param1:Number) : void
      {
         this._frontSpace = param1;
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
      
      protected function init() : void
      {
         _tweenDuration = 1.8;
         _easeType = "easeOut";
         _tweenType = "Strong";
      }
      
      protected function motionChange() : void
      {
         var _loc1_:Number = this.tweenObject.prop;
         space.camZ = (this.cameraFinalDepth - this.focalLength) * _loc1_;
         this.space.update3D();
      }
      
      protected function startTransition(param1:Boolean) : void
      {
         var _loc2_:Array = null;
         var _loc3_:uint = 0;
         var _loc4_:Array = null;
         var _loc5_:Object = null;
         var _loc6_:* = undefined;
         var _loc7_:uint = 0;
         var _loc22_:uint = 0;
         var _loc23_:* = undefined;
         var _loc24_:JFE3DObject = null;
         var _loc25_:Number = NaN;
         var _loc26_:Number = NaN;
         var _loc27_:Number = NaN;
         var _loc28_:Number = NaN;
         var _loc29_:Number = NaN;
         var _loc30_:Array = null;
         var _loc8_:Number = 0;
         var _loc9_:Number = 0;
         var _loc10_:Number = 0;
         var _loc11_:Number = 0;
         showTr = param1;
         var _loc12_:String = "chars";
         var _loc13_:Number = this.preset;
         var _loc14_:Object = {};
         if(_loc13_ > 34)
         {
            _loc13_ = 1;
         }
         if(_loc13_ >= 15)
         {
            if(_loc13_ < 29)
            {
               _loc12_ = "words";
               _loc13_ = _loc13_ - 14;
            }
            else
            {
               if(_loc13_ == 29)
               {
                  _loc13_ = 1;
               }
               else
               {
                  _loc13_ = _loc13_ - 15;
               }
               _loc12_ = "lines";
            }
         }
         this.component.drawTextTable(_loc12_,this.partialGroup,this.partialPercent,this.selectedStrings,this.partialStart,this.partialBlurAmount);
         JFET3DPreset.writePresetFunction(_loc13_,_loc14_,this.component.textOwnerClip);
         _loc2_ = this.component.absMatrix;
         _loc2_ = this.insertSeparator(_loc2_);
         _loc3_ = _loc2_.length;
         var _loc15_:uint = 0;
         var _loc16_:uint = 1;
         var _loc17_:* = 0;
         if(param1 == true)
         {
            _loc15_ = 1;
            _loc16_ = 0;
            _loc17_ = 1;
         }
         this.focalLength = Math.max(this.focalLength,Math.abs(this.backSpace));
         this.focalLength = Math.max(this.focalLength,Math.abs(this.frontSpace));
         this.space = new JFE3DSpace(this.focalLength);
         var _loc18_:* = this.frontSpace + this.backSpace;
         var _loc19_:Number = this.component.textOwnerClip.width;
         var _loc20_:Number = this.component.textOwnerClip.height;
         _loc8_ = this.space.camX = _loc19_ / 2 + this.component.textOwnerClip.getBounds(this.component.textOwnerClip).x;
         _loc9_ = this.space.camY = _loc20_ / 2 + this.component.textOwnerClip.getBounds(this.component.textOwnerClip).y;
         this.getZPosition = _loc14_.getZPosition;
         var _loc21_:Number = _loc14_.teorecticSpace;
         _loc6_ = 0;
         while(_loc6_ < _loc3_)
         {
            _loc22_ = _loc2_[_loc6_].length;
            _loc7_ = 0;
            while(_loc7_ < _loc22_)
            {
               _loc23_ = _loc2_[_loc6_][_loc7_];
               _loc24_ = this.space.pushItem(_loc23_);
               _loc25_ = _loc23_.width;
               _loc26_ = _loc23_.height;
               _loc27_ = _loc23_.x;
               _loc28_ = _loc23_.y;
               _loc29_ = this.getZPosition(_loc27_ + _loc25_ / 2,_loc28_ + _loc26_ / 2,_loc8_,_loc9_,_loc10_) * _loc18_ / _loc21_ + this.frontSpace;
               _loc30_ = [[_loc27_,_loc28_,_loc29_],[_loc27_ + _loc25_,_loc28_,_loc29_],[_loc27_ + _loc25_,_loc28_ + _loc26_,_loc29_],[_loc27_,_loc28_ + _loc26_,_loc29_]];
               _loc24_.corners = this.space.reverseRender(_loc30_);
               _loc7_++;
            }
            _loc6_++;
         }
         tweenObject = {};
         tweenObject.blurAmount = _loc15_;
         tweenObject.prop = _loc15_;
         finishedTweens = 0;
         TweenLite.to(tweenObject,this.tweenDuration,{
            "prop":_loc16_,
            "ease":this.easeFunc,
            "onUpdate":this.motionChange,
            "onComplete":motionFinish
         });
         TweenLite.to(this.component.textOwnerClip,this.tweenDuration * this.alphaPercentage / 100,{
            "alpha":_loc15_,
            "delay":_loc16_ * (this.tweenDuration - this.tweenDuration * this.alphaPercentage / 100),
            "onComplete":motionFinish
         });
         space.camZ = (this.cameraFinalDepth - this.focalLength) * _loc15_;
         this.component.textOwnerClip.alpha = _loc16_;
         space.update3D();
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
      
      public function get frontSpace() : Number
      {
         return this._frontSpace;
      }
      
      public function get preset() : Number
      {
         return this._preset;
      }
      
      public function set cameraFinalDepth(param1:Number) : void
      {
         this._cameraFinalDepth = param1;
      }
      
      public function get backSpace() : Number
      {
         return this._backSpace;
      }
      
      public function get alphaPercentage() : Number
      {
         return this._alphaPercentage;
      }
      
      protected function motionFinish() : void
      {
         finishedTweens++;
         if(finishedTweens == totalTweens)
         {
            if(showTr == false)
            {
               this.component.textOwnerClip.visible = false;
            }
            this.component.targetOwner.alpha = 1;
            this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
         }
      }
      
      protected function insertSeparator(param1:Array) : Array
      {
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:* = undefined;
         var _loc11_:FeSeparator = null;
         var _loc2_:Array = [];
         var _loc3_:Number = 0;
         for(_loc4_ in param1)
         {
            _loc2_[_loc4_] = [];
            for(_loc5_ in param1[_loc4_])
            {
               _loc6_ = param1[_loc4_][_loc5_];
               _loc7_ = param1[_loc4_][_loc5_].parent;
               _loc8_ = _loc6_.x;
               _loc9_ = _loc6_.y;
               _loc10_ = _loc7_.getChildIndex(_loc6_);
               _loc7_.removeChild(_loc6_);
               _loc11_ = new FeSeparator(_loc6_);
               _loc2_[_loc4_][_loc5_] = _loc11_;
               _loc11_.x = _loc8_;
               _loc11_.y = _loc9_;
               _loc7_.addChildAt(_loc11_,_loc10_);
               _loc7_.childs[_loc3_] = _loc11_;
               _loc3_++;
            }
         }
         return _loc2_;
      }
      
      protected function clearProperties() : void
      {
         if(tweenObject is Object)
         {
            TweenLite.killTweensOf(tweenObject,false);
         }
         tweenObject = null;
         if(this.component != null)
         {
            TweenLite.killTweensOf(this.component.textOwnerClip,false);
            this.component.textOwnerClip.alpha = 1;
         }
      }
      
      public function set alphaPercentage(param1:Number) : void
      {
         if(param1 < 0.001)
         {
            param1 = 0.001;
         }
         else if(param1 > 100)
         {
            param1 = 100;
         }
         this._alphaPercentage = param1;
      }
      
      public function set backSpace(param1:Number) : void
      {
         this._backSpace = param1;
      }
      
      public function get cameraFinalDepth() : Number
      {
         return this._cameraFinalDepth;
      }
      
      override public function show() : void
      {
         if(this.component != null)
         {
            this.startTransition(true);
         }
      }
      
      public function set preset(param1:Number) : void
      {
         this._preset = param1;
      }
   }
}
