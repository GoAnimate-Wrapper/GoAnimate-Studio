package com.jumpeye.flashEff2.text.flip
{
   import com.jumpeye.transitions.TweenLite;
   
   public class JFlip
   {
       
      
      private var owner:Object;
      
      public var tweenObject:Object;
      
      private var f;
      
      private var transformMatrix:Array;
      
      public function JFlip(param1:Number, param2:Number)
      {
         owner = {};
         super();
         this.init();
         f = param2 + 7 * param1;
      }
      
      public function clearProperties(param1:*) : *
      {
         TweenLite.killTweensOf(param1,false);
      }
      
      private function motionChagedHorizontal(param1:*) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         var _loc8_:* = undefined;
         var _loc9_:Number = NaN;
         owner.motionChangeBlur(param1);
         this.setTransformMatrix(0,Math.PI * param1.prop - this.tweenObject.transformPosition);
         var _loc10_:Array = this.renderObject(param1);
         this.tweenObject.angleVertical = this.tweenObject.angleVertical + (Math.PI * param1.prop - this.tweenObject.transformPosition);
         this.tweenObject.transformPosition = Math.PI * param1.prop;
         _loc2_ = _loc10_[0].x;
         _loc3_ = _loc10_[0].y;
         _loc4_ = _loc10_[1].x;
         _loc5_ = _loc10_[1].y;
         _loc6_ = _loc10_[2].x;
         _loc7_ = _loc10_[2].y;
         _loc8_ = _loc10_[3].x;
         _loc9_ = _loc10_[3].y;
         param1.distortObject.setTransform(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_);
      }
      
      public function firstDistortion(param1:*, param2:*, param3:*) : *
      {
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         var _loc8_:* = undefined;
         var _loc9_:* = undefined;
         var _loc10_:* = undefined;
         var _loc11_:* = undefined;
         var _loc12_:Number = NaN;
         var _loc4_:* = param1.mc;
         this.setTransformMatrix(param2,param3);
         this.tweenObject.angleVertical = param2;
         this.tweenObject.angleHorizontal = param3;
         var _loc13_:Array = this.renderObject(_loc4_);
         _loc5_ = _loc13_[0].x;
         _loc6_ = _loc13_[0].y;
         _loc7_ = _loc13_[1].x;
         _loc8_ = _loc13_[1].y;
         _loc9_ = _loc13_[2].x;
         _loc10_ = _loc13_[2].y;
         _loc11_ = _loc13_[3].x;
         _loc12_ = _loc13_[3].y;
         _loc4_.distortObject.setTransform(_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_);
      }
      
      private function matrixMatrixMultiply(param1:*, param2:*) : *
      {
         var _loc3_:* = [[],[],[]];
         _loc3_[0][0] = param1[0][0] * param2[0][0] + param1[0][1] * param2[1][0] + param1[0][2] * param2[2][0];
         _loc3_[0][1] = param1[0][0] * param2[0][1] + param1[0][1] * param2[1][1] + param1[0][2] * param2[2][1];
         _loc3_[0][2] = param1[0][0] * param2[0][2] + param1[0][1] * param2[1][2] + param1[0][2] * param2[2][2];
         _loc3_[1][0] = param1[1][0] * param2[0][0] + param1[1][1] * param2[1][0] + param1[1][2] * param2[2][0];
         _loc3_[1][1] = param1[1][0] * param2[0][1] + param1[1][1] * param2[1][1] + param1[1][2] * param2[2][1];
         _loc3_[1][2] = param1[1][0] * param2[0][2] + param1[1][1] * param2[1][2] + param1[1][2] * param2[2][2];
         _loc3_[2][0] = param1[2][0] * param2[0][0] + param1[2][1] * param2[1][0] + param1[2][2] * param2[2][0];
         _loc3_[2][1] = param1[2][0] * param2[0][1] + param1[2][1] * param2[1][1] + param1[2][2] * param2[2][1];
         _loc3_[2][2] = param1[2][0] * param2[0][2] + param1[2][1] * param2[1][2] + param1[2][2] * param2[2][2];
         return _loc3_;
      }
      
      private function motionFinish(param1:*, param2:*) : *
      {
         owner.clearBitmap(param2);
      }
      
      private function matrixVectorMultiply(param1:*, param2:*) : *
      {
         var _loc3_:* = [];
         _loc3_[0] = param1[0][0] * param2[0] + param1[0][1] * param2[1];
         _loc3_[1] = param1[1][0] * param2[0] + param1[1][1] * param2[1];
         _loc3_[2] = param1[2][0] * param2[0] + param1[2][1] * param2[1];
         return _loc3_;
      }
      
      private function init() : *
      {
         transformMatrix = [[1,0,0],[0,1,0],[0,0,1],[0,0,0]];
         f = 300;
         tweenObject = {};
         tweenObject.angleVertical = 0;
         tweenObject.angleHorizontal = 0;
      }
      
      private function setTransformMatrix(param1:*, param2:*) : *
      {
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         var _loc8_:* = undefined;
         var _loc3_:* = Math.sqrt(param1 * param1 + param2 * param2);
         if(_loc3_ > 0.0001)
         {
            param1 = param1 / _loc3_;
            param2 = param2 / _loc3_;
            _loc4_ = _loc3_;
            _loc5_ = Math.cos(_loc4_);
            _loc6_ = Math.sin(_loc4_);
            _loc7_ = 1 - _loc5_;
            _loc8_ = [[],[],[]];
            _loc8_[0][0] = _loc7_ * param1 * param1 + _loc5_;
            _loc8_[0][1] = _loc7_ * param1 * param2;
            _loc8_[0][2] = _loc6_ * param2;
            _loc8_[1][0] = _loc7_ * param1 * param2;
            _loc8_[1][1] = _loc7_ * param2 * param2 + _loc5_;
            _loc8_[1][2] = -_loc6_ * param1;
            _loc8_[2][0] = -_loc6_ * param2;
            _loc8_[2][1] = _loc6_ * param1;
            _loc8_[2][2] = Number(_loc5_);
            transformMatrix = matrixMatrixMultiply(_loc8_,this.transformMatrix);
         }
      }
      
      private function renderObject(param1:*) : Array
      {
         var _loc6_:* = undefined;
         var _loc2_:* = 1;
         var _loc3_:* = 1;
         var _loc4_:Array = [];
         var _loc5_:* = 0;
         while(_loc5_ <= param1.pointArray.length - 1)
         {
            _loc6_ = this.matrixVectorMultiply(transformMatrix,param1.pointArray[_loc5_]);
            _loc4_[_loc5_] = {
               "x":_loc6_[0] / (1 - _loc6_[2] / f),
               "y":_loc6_[1] / (1 - _loc6_[2] / f)
            };
            _loc5_++;
         }
         return _loc4_;
      }
      
      private function motionChagedVertical(param1:*) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         var _loc8_:* = undefined;
         var _loc9_:Number = NaN;
         owner.motionChangeBlur(param1);
         this.setTransformMatrix(Math.PI * param1.prop - this.tweenObject.transformPosition,0);
         var _loc10_:Array = this.renderObject(param1);
         this.tweenObject.angleVertical = this.tweenObject.angleVertical + (Math.PI * param1.prop - this.tweenObject.transformPosition);
         this.tweenObject.transformPosition = Math.PI * param1.prop;
         _loc2_ = _loc10_[0].x;
         _loc3_ = _loc10_[0].y;
         _loc4_ = _loc10_[1].x;
         _loc5_ = _loc10_[1].y;
         _loc6_ = _loc10_[2].x;
         _loc7_ = _loc10_[2].y;
         _loc8_ = _loc10_[3].x;
         _loc9_ = _loc10_[3].y;
         param1.distortObject.setTransform(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_);
      }
      
      public function flipEffect(param1:*, param2:Number, param3:*, param4:*) : *
      {
         var _loc5_:* = param3.mc;
         owner = param1;
         var _loc6_:* = this;
         _loc6_.tweenObject.transformPosition = 0;
         _loc5_.invalidate = false;
         _loc6_.tweenObject.owner = owner;
         _loc6_.tweenObject.prop = 0;
         _loc6_.tweenObject.clip = _loc5_;
         _loc6_.tweenObject.clip.end = param2;
         _loc5_.prop = 0;
         _loc5_.propBlur = param3.propBlur;
         TweenLite.to(_loc5_,owner.groupDuration,{
            "prop":param2,
            "propBlur":param3.endBlur,
            "overwrite":true,
            "delay":_loc5_.myDelay,
            "ease":owner.easeFunc,
            "onComplete":this.motionFinish,
            "onCompleteParams":[_loc5_,param3],
            "onUpdateParams":[_loc5_],
            "onUpdate":this["motionChaged" + param4]
         });
      }
   }
}
