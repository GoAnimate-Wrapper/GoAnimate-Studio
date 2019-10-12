package com.jumpeye.flashEff2.text.fe3D.camFocus
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffText;
   import com.jumpeye.flashEff2.text.FeSeparator;
   import com.jumpeye.flashEff2.text.fe3D.Number3D;
   import com.jumpeye.flashEff2.text.fe3D.objects.JFE3DCamera;
   import com.jumpeye.flashEff2.text.fe3D.objects.JFE3DDisplayObject;
   import com.jumpeye.flashEff2.text.fe3D.spaces.JFE3DScene;
   import com.jumpeye.flashEff2.text.patternsPresets.JFET3DPreset;
   import com.jumpeye.transitions.TweenLite;
   import flash.geom.Rectangle;
   
   public class FET3DCamFocus extends IFlashEffText
   {
       
      
      protected var tweenObject:Object;
      
      protected var scene:JFE3DScene;
      
      protected var getZPosition:Function;
      
      protected var camera:JFE3DCamera;
      
      protected var allItems:Array;
      
      protected var cameraFinalX:Number = 0;
      
      protected var cameraFinalY:Number = 0;
      
      protected var cameraFinalZ:Number = 0;
      
      protected var focalLength:Number = 300;
      
      protected var targetObject:JFE3DDisplayObject;
      
      protected var anchorX:Number = 300;
      
      protected var ail:Number = 0;
      
      protected var anchorY:Number = -300;
      
      protected var totalTweens:Number = 2;
      
      protected var cameraInitialX:Number = 0;
      
      protected var cameraInitialY:Number = 0;
      
      protected var showTr:Boolean = true;
      
      protected var cameraInitialZ:Number = 0;
      
      private var _backSpace:Number = 150;
      
      private var _alphaPercentage:Number = 50;
      
      private var _blurQuality:Number = 2;
      
      private var _blurCoef:Number = 3;
      
      private var _focusIndex:Number = 0;
      
      protected var finishedTweens:Number = 0;
      
      protected var middlePoint:Number3D;
      
      private var _frontSpace:Number = 150;
      
      private var _preset:Number = 28;
      
      public function FET3DCamFocus(param1:JUIComponent = null)
      {
         super();
         this.component = param1;
         init();
      }
      
      override public function remove() : void
      {
         this.clearProperties();
      }
      
      protected function init() : void
      {
         _tweenDuration = 1.5;
         _easeType = "easeInOut";
         _tweenType = "Strong";
      }
      
      protected function motionChange() : void
      {
         var _loc9_:JFE3DDisplayObject = null;
         var _loc10_:Array = null;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc1_:Number = this.tweenObject.prop;
         var _loc2_:Number = this.camera.x = this.getBezier(_loc1_,this.cameraInitialX,(this.cameraInitialX + this.cameraFinalX) / 2 + this.anchorX,this.cameraFinalX);
         var _loc3_:Number = this.camera.y = this.getBezier(_loc1_,this.cameraInitialY,(this.cameraInitialY + this.cameraFinalY) / 2 + this.anchorY,this.cameraFinalY);
         var _loc4_:Number = this.camera.z = this.cameraInitialZ + (this.cameraFinalZ - this.cameraInitialZ) * _loc1_;
         var _loc5_:Number = this.getBezier(_loc1_,this.middlePoint.x,(this.middlePoint.x + this.targetObject.x) / 2 + this.anchorX,this.targetObject.x);
         var _loc6_:Number = this.getBezier(_loc1_,this.middlePoint.y,(this.middlePoint.y + this.targetObject.y) / 2 - this.anchorY,this.targetObject.y);
         var _loc7_:Number = this.middlePoint.z + (this.targetObject.z - this.middlePoint.z) * _loc1_;
         var _loc8_:* = 0;
         while(_loc8_ < this.ail)
         {
            _loc9_ = this.allItems[_loc8_];
            _loc10_ = _loc9_.corners[0];
            _loc11_ = _loc2_ - _loc10_[0];
            _loc12_ = _loc3_ - _loc10_[1];
            _loc13_ = _loc4_ - _loc10_[2];
            _loc9_.blurAmount = Math.sqrt(_loc11_ * _loc11_ + _loc12_ * _loc12_ + _loc13_ * _loc13_) / 40 * _loc1_ * this.blurCoef;
            _loc8_++;
         }
         this.camera.lookAt(new Number3D(_loc5_,_loc6_,_loc7_));
         this.scene.renderCamera();
      }
      
      public function get blurCoef() : Number
      {
         return this._blurCoef;
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
      
      public function set blurCoef(param1:Number) : void
      {
         if(param1 > 20)
         {
            param1 = 20;
         }
         else if(param1 < 0)
         {
            param1 = 0;
         }
         this._blurCoef = param1;
      }
      
      public function set blurQuality(param1:Number) : void
      {
         if(param1 > 10)
         {
            param1 = 10;
         }
         else if(param1 < 0)
         {
            param1 = 0;
         }
         this._blurQuality = param1;
      }
      
      public function set frontSpace(param1:Number) : void
      {
         this._frontSpace = param1;
      }
      
      public function set focusIndex(param1:Number) : void
      {
         this._focusIndex = param1;
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
      
      override public function hide() : void
      {
         if(this.component != null)
         {
            this.startTransition(false);
         }
      }
      
      public function set preset(param1:Number) : void
      {
         this._preset = param1;
      }
      
      public function set backSpace(param1:Number) : void
      {
         this._backSpace = param1;
      }
      
      public function get blurQuality() : Number
      {
         return this._blurQuality;
      }
      
      protected function getBezier(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         return (1 - param1) * (1 - param1) * param2 + 2 * param1 * (1 - param1) * param3 + param1 * param1 * param4;
      }
      
      protected function startTransition(param1:Boolean) : void
      {
         var _loc2_:Array = null;
         var _loc3_:uint = 0;
         var _loc4_:Array = null;
         var _loc5_:Object = null;
         var _loc6_:* = undefined;
         var _loc7_:uint = 0;
         var _loc24_:Array = null;
         var _loc25_:uint = 0;
         var _loc26_:* = undefined;
         var _loc27_:JFE3DDisplayObject = null;
         var _loc28_:Number = NaN;
         var _loc29_:Number = NaN;
         var _loc30_:Number = NaN;
         var _loc31_:Number = NaN;
         var _loc32_:Number = NaN;
         var _loc33_:Array = null;
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
         this.focalLength = Math.max(this.focalLength,Math.abs(this.frontSpace));
         this.focalLength = Math.max(this.focalLength,Math.abs(this.backSpace));
         this.scene = new JFE3DScene();
         this.camera = new JFE3DCamera();
         this.camera.focalLength = this.focalLength;
         var _loc18_:* = this.frontSpace + this.backSpace;
         var _loc19_:Number = this.component.textOwnerClip.width;
         var _loc20_:Number = this.component.textOwnerClip.height;
         var _loc21_:Rectangle = this.component.textOwnerClip.getBounds(this.component.textOwnerClip);
         this.cameraInitialX = this.camera.x = _loc8_ = _loc19_ / 2 + _loc21_.x;
         this.cameraInitialY = this.camera.y = _loc9_ = _loc20_ / 2 + _loc21_.y;
         this.cameraInitialZ = this.camera.z = this.focalLength;
         this.middlePoint = new Number3D(_loc8_,_loc9_,(_loc18_ - this.frontSpace) / 2);
         this.scene.middleX = _loc8_;
         this.scene.middleY = _loc9_;
         this.scene.middleZ = (_loc18_ - this.frontSpace) / 2;
         this.getZPosition = _loc14_.getZPosition;
         var _loc22_:Number = _loc14_.teorecticSpace;
         _loc6_ = 0;
         while(_loc6_ < _loc3_)
         {
            _loc25_ = _loc2_[_loc6_].length;
            _loc7_ = 0;
            while(_loc7_ < _loc25_)
            {
               _loc26_ = _loc2_[_loc6_][_loc7_];
               _loc27_ = new JFE3DDisplayObject(_loc26_,this.camera);
               this.scene.pushItem(_loc27_);
               _loc27_.blurQuality = this.blurQuality;
               _loc28_ = _loc26_.width;
               _loc29_ = _loc26_.height;
               _loc30_ = _loc26_.x;
               _loc31_ = _loc26_.y;
               _loc32_ = this.getZPosition(_loc30_ + _loc28_ / 2,_loc31_ + _loc29_ / 2,_loc8_,_loc9_,_loc10_) * _loc18_ / _loc22_ + this.frontSpace;
               _loc33_ = [[_loc30_,_loc31_,_loc32_],[_loc30_ + _loc28_,_loc31_,_loc32_],[_loc30_ + _loc28_,_loc31_ + _loc29_,_loc32_],[_loc30_,_loc31_ + _loc29_,_loc32_]];
               _loc27_.corners = _loc27_.reverseRender(_loc33_);
               _loc7_++;
            }
            _loc6_++;
         }
         var _loc23_:Number = this.focusIndex;
         this.allItems = this.scene.childrens;
         this.ail = allItems.length;
         if(this.focusIndex > this.ail)
         {
            _loc23_ = this.ail - 1;
         }
         if(allItems[_loc23_] != null)
         {
            targetObject = allItems[_loc23_];
            _loc24_ = targetObject.corners[0];
         }
         else if(allItems[0] != null)
         {
            targetObject = allItems[0];
            _loc24_ = targetObject.corners[0];
         }
         else
         {
            targetObject = new JFE3DDisplayObject(null,null);
            targetObject.x = this.middlePoint.x;
            targetObject.y = this.middlePoint.y;
            targetObject.z = this.middlePoint.z;
            _loc24_ = [this.middlePoint.x,this.middlePoint.y,this.middlePoint.z];
         }
         this.cameraFinalX = _loc24_[0];
         this.cameraFinalY = _loc24_[1];
         this.cameraFinalZ = _loc24_[2];
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
         this.camera.x = this.cameraInitialX + (this.cameraFinalX - this.cameraInitialX) * _loc15_;
         this.camera.y = this.cameraInitialY + (this.cameraFinalY - this.cameraInitialY) * _loc15_;
         this.camera.z = this.cameraInitialZ + (this.cameraFinalZ - this.cameraInitialZ) * _loc15_;
         this.camera.lookAt(this.middlePoint);
         scene.renderCamera();
         this.component.textOwnerClip.alpha = _loc16_;
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
      
      public function get frontSpace() : Number
      {
         return this._frontSpace;
      }
      
      public function get alphaPercentage() : Number
      {
         return this._alphaPercentage;
      }
      
      public function get preset() : Number
      {
         return this._preset;
      }
      
      public function get focusIndex() : Number
      {
         return this._focusIndex;
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
      
      public function get backSpace() : Number
      {
         return this._backSpace;
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
      
      override public function show() : void
      {
         if(this.component != null)
         {
            this.startTransition(true);
         }
      }
   }
}
