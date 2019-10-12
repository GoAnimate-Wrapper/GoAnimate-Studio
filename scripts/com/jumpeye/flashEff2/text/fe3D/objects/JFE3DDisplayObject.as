package com.jumpeye.flashEff2.text.fe3D.objects
{
   import com.jumpeye.flashEff2.text.fe3D.Matrix3D;
   import com.jumpeye.flashEff2.text.fe3D.Number3D;
   import com.jumpeye.flashEff2.text.fe3D.spaces.JFE3DScene;
   
   public class JFE3DDisplayObject extends JFE3DObject
   {
       
      
      private var camera:JFE3DCamera;
      
      public var blurAmount:Number = 0;
      
      private var transform:Matrix3D;
      
      public var blurQuality:Number = 1;
      
      public function JFE3DDisplayObject(param1:*, param2:JFE3DCamera)
      {
         camera = param2;
         transform = Matrix3D.IDENTITY;
         super(param1);
      }
      
      public function get visible() : Boolean
      {
         return this.content.visible;
      }
      
      public function set visible(param1:Boolean) : void
      {
         this.content.visible = param1;
      }
      
      public function unProjectPoint(param1:Number3D) : Number3D
      {
         return Number3D.add(param1,new Number3D(this.camera.x,this.camera.y,this.camera.z));
      }
      
      public function projectPoint(param1:Number3D) : Number3D
      {
         return Number3D.sub(param1,new Number3D(this.camera.x,this.camera.y,this.camera.z));
      }
      
      public function reverseRender(param1:Array) : Array
      {
         var _loc6_:Number3D = null;
         var _loc7_:Number = NaN;
         var _loc8_:Number3D = null;
         var _loc2_:Array = [];
         var _loc3_:Number = 0;
         var _loc4_:Number = this.camera.focalLength;
         var _loc5_:Number = param1.length;
         while(_loc3_ <= _loc5_ - 1)
         {
            _loc6_ = projectPoint(new Number3D(param1[_loc3_][0],param1[_loc3_][1],param1[_loc3_][2]));
            _loc7_ = _loc6_.z;
            _loc8_ = this.unProjectPoint(new Number3D(_loc6_.x * (1 - _loc7_ / _loc4_),_loc6_.y * (1 - _loc7_ / _loc4_),_loc7_));
            _loc2_[_loc3_] = [_loc8_.x,_loc8_.y,_loc8_.z];
            _loc3_++;
         }
         return _loc2_;
      }
      
      override public function set y(param1:Number) : void
      {
         this.transform.n24 = param1;
      }
      
      override public function set z(param1:Number) : void
      {
         this.transform.n34 = param1;
      }
      
      public function render(param1:JFE3DScene) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         var _loc8_:* = undefined;
         var _loc9_:Number = NaN;
         var _loc10_:Object = this.calculateCorner(this.corners[0]);
         var _loc11_:Object = this.calculateCorner(this.corners[1]);
         var _loc12_:Object = this.calculateCorner(this.corners[3]);
         _loc2_ = _loc10_.x;
         _loc3_ = _loc10_.y;
         _loc4_ = _loc11_.x;
         _loc5_ = _loc11_.y;
         _loc8_ = _loc12_.x;
         _loc9_ = _loc12_.y;
         if(this.visible)
         {
            this.updateContent(_loc2_ + param1.middleX,_loc3_ + param1.middleY,_loc8_ + param1.middleX,_loc9_ + param1.middleY,_loc4_ + param1.middleX,_loc5_ + param1.middleY);
            this.applyBlur(this.blurAmount,this.blurQuality);
         }
      }
      
      override public function set x(param1:Number) : void
      {
         this.transform.n14 = param1;
      }
      
      override public function get x() : Number
      {
         return this.transform.n14;
      }
      
      override public function get y() : Number
      {
         return this.transform.n24;
      }
      
      override public function get z() : Number
      {
         return this.transform.n34;
      }
      
      private function calculateCorner(param1:Array) : Object
      {
         var _loc2_:Number = this.camera.focalLength;
         var _loc3_:Number3D = this.transfromView(this.projectPoint(new Number3D(param1[0],param1[1],param1[2])));
         if(_loc3_.z / _loc2_ >= 0.8)
         {
            this.visible = false;
         }
         else
         {
            this.visible = true;
         }
         return {
            "x":_loc3_.x / (1 - _loc3_.z / _loc2_),
            "y":_loc3_.y / (1 - _loc3_.z / _loc2_)
         };
      }
      
      private function transfromView(param1:Number3D) : Number3D
      {
         Matrix3D.multiplyVector(this.camera.view,param1);
         return param1;
      }
   }
}
