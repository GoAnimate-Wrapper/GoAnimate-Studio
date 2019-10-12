package com.jumpeye.flashEff2.text.fe3D.spaces
{
   import com.jumpeye.flashEff2.text.fe3D.objects.JFE3DObject;
   
   public class JFE3DSpace
   {
       
      
      private var transformMatrix:Array;
      
      public var camRX:Number = 0;
      
      public var camRY:Number = 0;
      
      public var camRZ:Number = 0;
      
      public var blurQuality:Number = 1;
      
      private var childrens:Array;
      
      public var blurAmount:Number = 0;
      
      public var rotX:Number = 0;
      
      public var rotY:Number = 0;
      
      public var rotZ:Number = 0;
      
      public var centerY:Number = 0;
      
      private var numChildren:Number = 0;
      
      public var camX:Number = 0;
      
      public var camY:Number = 0;
      
      public var camZ:Number = 0;
      
      public var centerX:Number = 0;
      
      public var centerZ:Number = 0;
      
      private var _focalDistance:Number;
      
      public function JFE3DSpace(param1:Number)
      {
         super();
         childrens = [];
         init3D();
         this.focalDistance = param1;
      }
      
      private function init3D() : void
      {
         transformMatrix = [[1,0,0],[0,1,0],[0,0,1],[0,0,0]];
         focalDistance = 300;
      }
      
      public function set focalDistance(param1:Number) : void
      {
         _focalDistance = param1;
      }
      
      public function update3D() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         var _loc8_:Number = NaN;
         var _loc10_:JFE3DObject = null;
         var _loc11_:Array = null;
         var _loc9_:Number = 0;
         while(_loc9_ < this.numChildren)
         {
            _loc10_ = this.childrens[_loc9_];
            _loc11_ = this.renderObject(_loc10_);
            _loc1_ = _loc11_[0].x + this.camX;
            _loc2_ = _loc11_[0].y + this.camY;
            _loc3_ = _loc11_[1].x + this.camX;
            _loc4_ = _loc11_[1].y + this.camY;
            _loc5_ = _loc11_[2].x + this.camX;
            _loc6_ = _loc11_[2].y + this.camY;
            _loc7_ = _loc11_[3].x + this.camX;
            _loc8_ = _loc11_[3].y + this.camY;
            _loc10_.updateContent(_loc1_,_loc2_,_loc7_,_loc8_,_loc3_,_loc4_);
            _loc9_++;
         }
      }
      
      public function pushItem(param1:*) : JFE3DObject
      {
         var _loc2_:JFE3DObject = new JFE3DObject(param1);
         childrens.push(_loc2_);
         numChildren++;
         return _loc2_;
      }
      
      private function matrixMatrixMultiply(param1:*, param2:*) : *
      {
         var _loc3_:Array = [[],[],[]];
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
      
      public function reverseRender(param1:Array) : Array
      {
         var _loc6_:Array = null;
         var _loc7_:Number = NaN;
         var _loc2_:Array = [];
         var _loc3_:Number = 0;
         var _loc4_:Number = this.focalDistance;
         var _loc5_:Number = param1.length;
         while(_loc3_ <= _loc5_ - 1)
         {
            _loc6_ = projectPoint(param1[_loc3_]);
            _loc7_ = _loc6_[2];
            _loc2_[_loc3_] = this.unProjectPoint([_loc6_[0] * (1 - _loc7_ / _loc4_),_loc6_[1] * (1 - _loc7_ / _loc4_),_loc7_]);
            _loc3_++;
         }
         return _loc2_;
      }
      
      private function matrixVectorMultiply(param1:*, param2:*) : *
      {
         var _loc3_:Array = [];
         _loc3_[0] = param1[0][0] * param2[0] + param1[0][1] * param2[1] + param1[0][2] * param2[2];
         _loc3_[1] = param1[1][0] * param2[0] + param1[1][1] * param2[1] + param1[1][2] * param2[2];
         _loc3_[2] = param1[2][0] * param2[0] + param1[2][1] * param2[1] + param1[2][2] * param2[2];
         return _loc3_;
      }
      
      private function renderObject(param1:Object) : Array
      {
         var _loc6_:Array = null;
         var _loc2_:Array = [];
         var _loc3_:Number = 0;
         var _loc4_:Number = this.focalDistance;
         var _loc5_:Number = param1.corners.length;
         while(_loc3_ <= _loc5_ - 1)
         {
            _loc6_ = this.matrixVectorMultiply(transformMatrix,this.projectPoint(param1.corners[_loc3_]));
            _loc2_[_loc3_] = {
               "x":_loc6_[0] / (1 - _loc6_[2] / _loc4_),
               "y":_loc6_[1] / (1 - _loc6_[2] / _loc4_)
            };
            _loc3_++;
         }
         if(_loc6_[2] / _loc4_ >= 1)
         {
            param1.content.visible = false;
         }
         else
         {
            param1.content.visible = true;
            param1.applyBlur(this.blurAmount,this.blurQuality);
         }
         return _loc2_;
      }
      
      private function projectPoint(param1:Array) : *
      {
         return [param1[0] - this.camX,param1[1] - this.camY,param1[2] - this.camZ];
      }
      
      public function get focalDistance() : Number
      {
         return _focalDistance;
      }
      
      public function rotate(param1:Number, param2:Number, param3:Number) : *
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Array = null;
         var _loc4_:Number = Math.sqrt(param1 * param1 + param2 * param2 + param3 * param3);
         if(_loc4_ > 0.0001)
         {
            param1 = param1 / _loc4_;
            param2 = param2 / _loc4_;
            param3 = param3 / _loc4_;
            _loc5_ = Math.cos(_loc4_);
            _loc6_ = Math.sin(_loc4_);
            _loc7_ = 1 - _loc5_;
            _loc8_ = [[],[],[]];
            _loc8_[0][0] = _loc7_ * param1 * param1 + _loc5_;
            _loc8_[0][1] = _loc7_ * param1 * param2 - _loc6_ * param3;
            _loc8_[0][2] = _loc7_ * param1 * param3 + _loc6_ * param2;
            _loc8_[1][0] = _loc7_ * param1 * param2 + _loc6_ * param3;
            _loc8_[1][1] = _loc7_ * param2 * param2 + _loc5_;
            _loc8_[1][2] = _loc7_ * param2 * param3 - _loc6_ * param1;
            _loc8_[2][0] = _loc7_ * param1 * param3 - _loc6_ * param2;
            _loc8_[2][1] = _loc7_ * param2 * param3 + _loc6_ * param1;
            _loc8_[2][2] = _loc7_ * param3 * param3 + _loc5_;
            transformMatrix = matrixMatrixMultiply(_loc8_,transformMatrix);
         }
      }
      
      private function unProjectPoint(param1:Array) : *
      {
         return [param1[0] + this.camX,param1[1] + this.camY,param1[2] + this.camZ];
      }
   }
}
