package com.jumpeye.flashEff2.text.fe3D.camMatrix
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
   import fl.motion.CustomEase;
   import flash.geom.Point;
   
   public class FET3DCamMatrix extends IFlashEffText
   {
       
      
      protected var col:Number = 300;
      
      private var _cameraFinalX:Number = -30;
      
      private var _cameraFinalZ:Number = 50;
      
      protected var tweenObject:Object;
      
      protected var scene:JFE3DScene;
      
      protected var getZPosition:Function;
      
      protected var lin:Number = 300;
      
      private var _cameraFinalY:Number = 75;
      
      public var blurQuality:Number = 2;
      
      protected var camera:JFE3DCamera;
      
      protected var totalSpace:Number = 300;
      
      protected var focalLength:Number = 300;
      
      private var _blurCoeficient:Number = 50;
      
      protected var isShow:Boolean = true;
      
      protected var iPosObj:Object;
      
      private var _alphaPercentage:Number = 50;
      
      private var _backSpace:Number = 100;
      
      protected var elements:Array;
      
      protected var tweensFinished:Number = 0;
      
      protected var middlePoint:Number3D;
      
      private var _frontSpace:Number = 100;
      
      private var _preset:Number = 28;
      
      public function FET3DCamMatrix(param1:JUIComponent = null)
      {
         super();
         this.component = param1;
         init();
      }
      
      override public function remove() : void
      {
         this.clearProperties();
      }
      
      private function init() : *
      {
         _partialGroup = "words";
         _tweenDuration = 1.6;
         _tweenType = "Quadratic";
         _easeType = "easeOut";
      }
      
      protected function motionChange() : void
      {
         var _loc7_:Object = null;
         var _loc9_:Array = null;
         var _loc1_:Number = this.tweenObject.prop;
         var _loc2_:Number = this.tweenObject.lastProp;
         var _loc3_:Number = this.camera.x = iPosObj.x + (this.cameraFinalX - iPosObj.x) * _loc1_;
         var _loc4_:Number = this.camera.y = iPosObj.y + (this.cameraFinalY - iPosObj.y) * _loc1_;
         var _loc5_:Number = this.camera.z = iPosObj.z + (this.cameraFinalZ - iPosObj.z) * _loc1_;
         this.camera.lookAt(this.middlePoint);
         var _loc6_:Number = 0;
         var _loc8_:Number = Math.abs(_loc1_ - _loc2_) * this.blurCoeficient;
         while(_loc7_ = this.elements[_loc6_])
         {
            _loc9_ = _loc7_.virtualObject.corners;
            _loc9_[0][2] = _loc9_[1][2] = _loc9_[2][2] = _loc9_[3][2] = _loc7_.startZ * Math.abs(_loc1_);
            _loc7_.virtualObject.blurAmount = _loc8_;
            _loc6_++;
         }
         this.tweenObject.lastProp = _loc1_;
         this.scene.renderCamera();
      }
      
      public function set blurCoeficient(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         this._blurCoeficient = param1;
      }
      
      public function get cameraFinalY() : Number
      {
         return this._cameraFinalY;
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
      
      public function get cameraFinalX() : Number
      {
         return this._cameraFinalX;
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
      
      public function get cameraFinalZ() : Number
      {
         return this._cameraFinalZ;
      }
      
      public function set frontSpace(param1:Number) : void
      {
         this._frontSpace = param1;
      }
      
      public function get blurCoeficient() : Number
      {
         return this._blurCoeficient;
      }
      
      public function set backSpace(param1:Number) : void
      {
         this._backSpace = param1;
      }
      
      override public function hide() : void
      {
         this.startTransition(false);
      }
      
      public function get alphaPercentage() : Number
      {
         return this._alphaPercentage;
      }
      
      public function set preset(param1:Number) : void
      {
         this._preset = param1;
      }
      
      public function set cameraFinalX(param1:Number) : void
      {
         this._cameraFinalX = param1;
      }
      
      public function set cameraFinalY(param1:Number) : void
      {
         this._cameraFinalY = param1;
      }
      
      public function set cameraFinalZ(param1:Number) : void
      {
         this._cameraFinalZ = param1;
      }
      
      protected function startTransition(param1:Boolean = true) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Array = null;
         var _loc4_:Object = null;
         var _loc5_:* = undefined;
         var _loc6_:uint = 0;
         var _loc19_:uint = 0;
         var _loc20_:Object = null;
         var _loc21_:JFE3DDisplayObject = null;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc24_:Number = NaN;
         var _loc25_:Number = NaN;
         var _loc26_:Number = NaN;
         var _loc7_:Number = 0;
         var _loc8_:Number = 0;
         var _loc9_:Number = 0;
         var _loc10_:Number = 0;
         this.isShow = param1;
         this.focalLength = 300;
         this.focalLength = Math.max(this.focalLength,this.frontSpace);
         this.focalLength = Math.max(this.focalLength,this.backSpace);
         var _loc11_:Object = {};
         var _loc12_:Number = this.preset;
         var _loc13_:String = "chars";
         if(_loc12_ > 34)
         {
            _loc12_ = 1;
         }
         if(_loc12_ >= 15)
         {
            if(_loc12_ < 29)
            {
               _loc13_ = "words";
               _loc12_ = _loc12_ - 14;
            }
            else
            {
               if(_loc12_ == 29)
               {
                  _loc12_ = 1;
               }
               else
               {
                  _loc12_ = _loc12_ - 15;
               }
               _loc13_ = "lines";
            }
         }
         this.component.drawTextTable(_loc13_,this.partialGroup,this.partialPercent,this.selectedStrings,this.partialStart,this.partialBlurAmount);
         JFET3DPreset.writePresetFunction(_loc12_,_loc11_,this.component.textOwnerClip);
         _loc2_ = this.component.absMatrix;
         _loc2_ = this.insertSeparator(_loc2_);
         this.getZPosition = _loc11_.getZPosition;
         this.tweensFinished = 0;
         this.lin = _loc2_.length;
         var _loc14_:uint = 0;
         var _loc15_:uint = 1;
         var _loc16_:Number = this.tweenDuration - this.tweenDuration * this.alphaPercentage / 100;
         if(param1 == true)
         {
            _loc14_ = 1;
            _loc15_ = 0;
            _loc16_ = 0;
         }
         this.elements = [];
         this.scene = new JFE3DScene();
         this.camera = new JFE3DCamera();
         this.camera.focalLength = this.focalLength;
         this.totalSpace = this.frontSpace + this.backSpace;
         var _loc17_:Number = this.component.targetOwner.width;
         var _loc18_:Number = this.component.targetOwner.height;
         _loc7_ = this.camera.x = _loc17_ / 2 + this.component.targetOwner.getBounds(this.component.targetOwner).x;
         _loc8_ = this.camera.y = _loc18_ / 2 + this.component.targetOwner.getBounds(this.component.targetOwner).y;
         _loc9_ = this.camera.z = this.focalLength;
         this.iPosObj = {
            "x":_loc7_,
            "y":_loc8_,
            "z":_loc9_
         };
         this.scene.middleX = _loc7_;
         this.scene.middleY = _loc8_;
         this.scene.middleZ = (this.totalSpace - this.frontSpace) / 2;
         this.middlePoint = new Number3D(this.scene.middleX,this.scene.middleY,this.scene.middleZ);
         _loc5_ = 0;
         while(_loc5_ < this.lin)
         {
            _loc19_ = _loc2_[_loc5_].length;
            _loc6_ = 0;
            while(_loc6_ < _loc19_)
            {
               _loc20_ = {};
               this.elements.push(_loc20_);
               _loc20_.clip = _loc2_[_loc5_][_loc6_];
               _loc21_ = new JFE3DDisplayObject(_loc20_.clip,this.camera);
               this.scene.pushItem(_loc21_);
               _loc20_.virtualObject = _loc21_;
               _loc21_.blurQuality = this.blurQuality;
               _loc22_ = _loc20_.clip.width;
               _loc23_ = _loc20_.clip.height;
               _loc24_ = _loc20_.clip.x;
               _loc25_ = _loc20_.clip.y;
               _loc26_ = 0;
               _loc20_.startZ = this.getZPosition(_loc24_ + _loc22_ / 2,_loc25_ + _loc23_ / 2,_loc7_,_loc8_,_loc9_) * this.totalSpace / _loc11_.teorecticSpace + this.frontSpace;
               _loc20_.corners = [[_loc24_,_loc25_,_loc26_],[_loc24_ + _loc22_,_loc25_,_loc26_],[_loc24_ + _loc22_,_loc25_ + _loc23_,_loc26_],[_loc24_,_loc25_ + _loc23_,_loc26_]];
               _loc21_.corners = _loc21_.reverseRender(_loc20_.corners);
               _loc6_++;
            }
            _loc5_++;
         }
         this.camera.x = _loc7_ + (this.cameraFinalX - _loc8_) * _loc14_;
         this.camera.y = _loc8_ + (this.cameraFinalY - _loc8_) * _loc14_;
         this.camera.z = _loc9_ + (this.cameraFinalZ - _loc9_) * _loc14_;
         this.tweenObject = {};
         this.tweenObject.customEase = new CustomEase();
         if(this.isShow == false)
         {
            this.tweenObject.customEase.points = [new Point(0.0627906976744186,0),new Point(0.180372168819625,0.727412370045063),new Point(0.190697674418605,0.739583333333333),new Point(0.367441860465116,0.947916666666667),new Point(0.886363636363637,1)];
         }
         else
         {
            this.tweenObject.customEase.points = [new Point(0.158139534883721,0),new Point(0.644186046511628,0.0694444444444444),new Point(0.802325581395349,0.260416666666667),new Point(0.820407234233116,0.282252404494138),new Point(0.932558139534884,1)];
         }
         this.tweenObject.cameraEase = new CustomEase();
         this.tweenObject.lastProp = _loc14_;
         this.tweenObject.prop = _loc14_;
         TweenLite.to(this.tweenObject,this.tweenDuration,{
            "prop":_loc15_,
            "ease":this.tweenObject.customEase.getValue,
            "onUpdate":this.motionChange,
            "onComplete":this.motionFinish
         });
         TweenLite.to(this.component.targetOwner,this.tweenDuration * this.alphaPercentage / 100,{
            "alpha":_loc14_,
            "ease":this.tweenObject.customEase.getValue,
            "delay":_loc16_,
            "onComplete":this.motionFinish
         });
         this.component.targetOwner.alpha = _loc15_;
         this.camera.lookAt(this.middlePoint);
         this.scene.renderCamera();
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
      
      public function get frontSpace() : Number
      {
         return this._frontSpace;
      }
      
      public function get backSpace() : Number
      {
         return this._backSpace;
      }
      
      public function get preset() : Number
      {
         return this._preset;
      }
      
      protected function clearProperties() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         if(this.tweenObject is Object)
         {
            TweenLite.killTweensOf(this.tweenObject,false);
         }
         this.tweenObject = null;
         this.middlePoint = null;
         if(this.scene != null)
         {
            this.scene = null;
         }
         if(this.camera != null)
         {
            this.camera = null;
         }
         if(this.elements is Array)
         {
            _loc1_ = this.elements.length;
            _loc2_ = 0;
            while(_loc2_ < this.lin)
            {
               _loc3_ = this.elements[_loc2_].clip;
               _loc3_.visible = true;
               _loc3_.filters = [];
               _loc2_++;
            }
            this.elements = null;
         }
         if(this.component != null)
         {
            TweenLite.killTweensOf(this.component.targetOwner,false);
            this.component.targetOwner.alpha = 1;
         }
      }
      
      protected function motionFinish() : void
      {
         var _loc1_:Object = null;
         var _loc2_:Number = NaN;
         tweensFinished++;
         if(tweensFinished == 2)
         {
            if(this.isShow == false)
            {
               this.visible = false;
            }
            this.alpha = 1;
            _loc2_ = 0;
            while(_loc1_ = this.elements[_loc2_])
            {
               _loc1_.virtualObject.blurAmount = 0;
               _loc2_++;
            }
            this.scene.renderCamera();
            this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
         }
      }
      
      override public function show() : void
      {
         this.startTransition(true);
      }
   }
}
