package com.jumpeye.flashEff2.text.fe3D.motion
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffText;
   import com.jumpeye.flashEff2.text.FeSeparator;
   import com.jumpeye.flashEff2.text.fe3D.objects.JFE3DObject;
   import com.jumpeye.flashEff2.text.fe3D.spaces.JFE3DSpace;
   import com.jumpeye.transitions.TweenLite;
   import flash.filters.BitmapFilter;
   import flash.filters.BlurFilter;
   
   public class FET3DMotion extends IFlashEffText
   {
       
      
      protected var tweenObject:Object;
      
      private var _finalDepth:Number = 0;
      
      protected var startPos:Number;
      
      private var _finalAngle:Number = 80;
      
      protected var transitionsNumber:Number = 0;
      
      protected var focalLength:Number = 300;
      
      protected var spaces:Object;
      
      private var _blurCoeficient:Number = 3;
      
      private var _radius:Number = 100;
      
      protected var finishPos:Number;
      
      protected var isShow:Boolean = true;
      
      protected var timeDirection:Number;
      
      protected var totalTweens:Number = 2;
      
      protected var tweensNumber:Number = 0;
      
      protected var spacesNumber:Number;
      
      private var _blurQuality:Number = 2;
      
      protected var getSpaceAlias:Function;
      
      private var _zoomDuration:Number = 1;
      
      private var _alphaPercentage:Number = 50;
      
      protected var currentRadius:Number;
      
      protected var getSpaceRotation:Function;
      
      protected var elements:Array;
      
      protected var finishedTweens:Number = 0;
      
      private var _preset:Number = 28;
      
      public function FET3DMotion(param1:JUIComponent = null)
      {
         super();
         this.component = param1;
         init();
      }
      
      public function set finalAngle(param1:Number) : void
      {
         this._finalAngle = param1;
      }
      
      override public function remove() : void
      {
         this.clearProperties();
      }
      
      protected function motionChange() : void
      {
         var _loc3_:Object = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc1_:Number = this.tweenObject.prop;
         var _loc2_:* = 0;
         while(_loc2_ < this.spacesNumber)
         {
            _loc3_ = this.spaces["space" + _loc2_];
            _loc4_ = _loc3_.rotation.x * _loc1_;
            _loc5_ = _loc3_.rotation.y * _loc1_;
            _loc3_.space.rotate(_loc4_ - _loc3_.currentRotation.x,_loc5_ - _loc3_.currentRotation.y,0);
            _loc3_.currentRotation.x = _loc4_;
            _loc3_.currentRotation.y = _loc5_;
            _loc3_.space.blurAmount = Math.abs(_loc1_ * this.blurCoeficient - _loc3_.blurAmount);
            _loc3_.blurAmount = _loc1_ * this.blurCoeficient;
            _loc3_.space.update3D();
            _loc2_++;
         }
      }
      
      public function get zoomDuration() : Number
      {
         return this._zoomDuration;
      }
      
      protected function applyBlur(param1:Number, param2:Number, param3:Number = 1) : void
      {
         var _loc4_:BitmapFilter = new BlurFilter(param1,param2,param3);
         var _loc5_:Array = new Array();
         _loc5_.push(_loc4_);
         this.filters = _loc5_;
      }
      
      private function init() : *
      {
         _tweenDuration = 2;
         _tweenType = "Strong";
         _easeType = "easeInOut";
      }
      
      public function set zoomDuration(param1:Number) : void
      {
         if(param1 < 0.001)
         {
            param1 = 0.001;
         }
         this._zoomDuration = param1;
      }
      
      public function get blurCoeficient() : Number
      {
         return this._blurCoeficient;
      }
      
      public function get radius() : Number
      {
         return this._radius;
      }
      
      public function set blurCoeficient(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         this._blurCoeficient = param1;
      }
      
      protected function cameraPositionFinish() : void
      {
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
      }
      
      public function get finalAngle() : Number
      {
         return this._finalAngle;
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
      
      public function get alphaPercentage() : Number
      {
         return this._alphaPercentage;
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
      
      public function set radius(param1:Number) : void
      {
         this._radius = param1;
      }
      
      protected function cameraPositionChange() : void
      {
         var _loc2_:Object = null;
         var _loc1_:* = 0;
         while(_loc1_ < this.spacesNumber)
         {
            _loc2_ = this.spaces["space" + _loc1_];
            _loc2_.space.camZ = _loc2_.finalDepth * this.tweenObject.z;
            _loc2_.space.update3D();
            _loc2_.space.blurAmount = 0;
            _loc1_++;
         }
      }
      
      override public function hide() : void
      {
         this.startTransition(false);
      }
      
      public function set preset(param1:Number) : void
      {
         this._preset = param1;
      }
      
      protected function startTransition(param1:Boolean) : void
      {
         var objMatrix:Array = null;
         var lin:uint = 0;
         var timeMatrix:Array = null;
         var presetObject:Object = null;
         var i:* = undefined;
         var j:uint = 0;
         var mx:Number = NaN;
         var direction:* = undefined;
         var angle:* = undefined;
         var spaceObject:Object = null;
         var space:JFE3DSpace = null;
         var col:uint = 0;
         var elementObject:Object = null;
         var x:Number = NaN;
         var y:Number = NaN;
         var w:Number = NaN;
         var h:Number = NaN;
         var z:Number = NaN;
         var spaceAlias:Number = NaN;
         var child:JFE3DObject = null;
         var points:Array = null;
         var iss:Boolean = param1;
         mx = 0;
         var my:Number = 0;
         var mz:Number = 0;
         var r:Number = 0;
         this.transitionsNumber = 0;
         this.isShow = iss;
         this.focalLength = 500;
         this.focalLength = Math.max(this.focalLength,this.radius) + 100;
         this.component.drawTextTable("chars",this.partialGroup,this.partialPercent,this.selectedStrings,this.partialStart,this.partialBlurAmount);
         objMatrix = this.component.absMatrix;
         objMatrix = this.insertSeparator(objMatrix);
         lin = objMatrix.length;
         this.startPos = 0;
         this.finishPos = 1;
         this.timeDirection = 0;
         var currentRadius:Number = this.radius;
         if(iss == true)
         {
            this.startPos = 1;
            this.finishPos = 0;
            this.timeDirection = 1;
            this.currentRadius = this.currentRadius - -this.finalDepth;
         }
         this.tweensNumber = this.component.textTable.childs.length;
         this.elements = [];
         var ow:Number = this.component.targetOwner.width;
         var oh:Number = this.component.targetOwner.height;
         mx = ow / 2 + this.component.targetOwner.getBounds(this.component.targetOwner).x;
         my = oh / 2 + this.component.targetOwner.getBounds(this.component.targetOwner).y;
         direction = Number(iss) * 2 - 1;
         angle = this.finalAngle / 180 * Math.PI;
         switch(this.preset)
         {
            default:
               this.getSpaceAlias = function(... rest):Number
               {
                  return rest[0];
               };
               this.getSpaceRotation = function(... rest):Object
               {
                  return {
                     "x":0,
                     "y":-angle * (rest[0] % 2 * 2 - 1) * direction
                  };
               };
               this.spacesNumber = lin;
               break;
            case 2:
               this.getSpaceAlias = function(... rest):Number
               {
                  return rest[0];
               };
               this.getSpaceRotation = function(... rest):Object
               {
                  return {
                     "x":0,
                     "y":angle * (rest[0] % 2 * 2 - 1) * direction
                  };
               };
               this.spacesNumber = lin;
               break;
            case 3:
               this.getSpaceAlias = function(... rest):Number
               {
                  return rest[0];
               };
               this.getSpaceRotation = function(... rest):Object
               {
                  return {
                     "x":0,
                     "y":angle * direction
                  };
               };
               this.spacesNumber = lin;
               break;
            case 4:
               this.getSpaceAlias = function(... rest):Number
               {
                  return rest[0];
               };
               this.getSpaceRotation = function(... rest):Object
               {
                  return {
                     "x":0,
                     "y":-angle * direction
                  };
               };
               this.spacesNumber = lin;
               break;
            case 5:
               this.getSpaceAlias = function(... rest):Number
               {
                  return rest[0] * 2 + Number(mx < rest[2]);
               };
               this.getSpaceRotation = function(... rest):Object
               {
                  return {
                     "x":0,
                     "y":angle * (Number(mx < rest[2]) * 2 - 1)
                  };
               };
               this.spacesNumber = lin * 2;
         }
         this.spaces = {};
         i = 0;
         while(i < this.spacesNumber)
         {
            spaceObject = this.spaces["space" + i] = {};
            space = spaceObject.space = new JFE3DSpace(this.focalLength);
            space.camX = mx;
            spaceObject.finalDepth = this.finalDepth;
            spaceObject.currentRotation = {
               "x":0,
               "y":0
            };
            spaceObject.rotation = {
               "x":0,
               "y":0
            };
            spaceObject.blurQuality = 2;
            i++;
         }
         i = 0;
         while(i < lin)
         {
            col = objMatrix[i].length;
            this.elements[i] = [];
            j = 0;
            while(j < col)
            {
               elementObject = this.elements[i][j] = {};
               elementObject.clip = objMatrix[i][j];
               x = elementObject.clip.x;
               y = elementObject.clip.y;
               w = elementObject.clip.width;
               h = elementObject.clip.height;
               z = this.radius;
               spaceAlias = this.getSpaceAlias(i,j,x,y);
               space = this.spaces["space" + spaceAlias].space;
               this.spaces["space" + spaceAlias].rotation = this.getSpaceRotation(i,j,x,y);
               space.camY = Math.max(space.camY,y + h / 2);
               child = space.pushItem(elementObject.clip);
               elementObject.virtualObject = child;
               points = [[x,y,z],[x + w,y,z],[x + w,y + h,z],[x,y + h,z]];
               child.corners = space.reverseRender(points);
               j++;
            }
            i++;
         }
         this.tweenObject = {};
         if(this.isShow == true)
         {
            i = 0;
            while(i < this.spacesNumber)
            {
               spaceObject = this.spaces["space" + i];
               spaceObject.space.camZ = spaceObject.finalDepth;
               i++;
            }
         }
         tweenObject.prop = this.startPos;
         TweenLite.to(this.tweenObject,this.tweenDuration,{
            "prop":this.finishPos,
            "delay":this.easeFunc,
            "onUpdate":this.motionChange,
            "onComplete":this.motionFinish
         });
         TweenLite.to(this.component.targetOwner,this.tweenDuration * this.alphaPercentage / 100,{
            "alpha":startPos,
            "delay":finishPos * (this.tweenDuration - this.tweenDuration * this.alphaPercentage / 100),
            "onComplete":motionFinish
         });
         this.alpha = this.finishPos;
         this.motionChange();
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
      
      public function get preset() : Number
      {
         return this._preset;
      }
      
      public function set finalDepth(param1:Number) : void
      {
         this._finalDepth = param1;
      }
      
      protected function clearProperties() : void
      {
         if(this.tweenObject is Object)
         {
            TweenLite.killTweensOf(this.tweenObject,false);
         }
         this.tweenObject = null;
         this.spaces = null;
         this.elements = null;
         if(this.component != null)
         {
            TweenLite.killTweensOf(this.component.targetOwner,false);
            this.component.targetOwner.alpha = 1;
         }
      }
      
      protected function motionFinish() : void
      {
         this.transitionsNumber++;
         if(transitionsNumber == 2)
         {
            if(this.isShow == false)
            {
               this.component.textOwnerClip.visible = false;
               this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
            }
            else
            {
               tweenObject.z = this.startPos;
               TweenLite.to(this.tweenObject,this._zoomDuration,{
                  "z":this.finishPos,
                  "ease":this.easeFunc,
                  "onUpdate":this.cameraPositionChange,
                  "onComplete":this.cameraPositionFinish
               });
            }
            this.component.targetOwner.alpha = 1;
         }
      }
      
      public function get finalDepth() : Number
      {
         return this._finalDepth;
      }
      
      override public function show() : void
      {
         this.startTransition(true);
      }
   }
}
