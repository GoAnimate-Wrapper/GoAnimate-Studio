package com.jumpeye.flashEff2.text.fe3D.objects
{
   import com.jumpeye.flashEff2.text.fe3D.Matrix3D;
   import com.jumpeye.flashEff2.text.fe3D.Number3D;
   
   public class JFE3DCamera
   {
      
      private static var UP:Number3D = new Number3D(0,1,0);
      
      private static var _flipY:Matrix3D = Matrix3D.scaleMatrix(-1,1,-1);
       
      
      public var view:Matrix3D;
      
      public var focalLength:Number = 300;
      
      public var transform:Matrix3D;
      
      private var __y:Number = 0;
      
      private var __z:Number = 0;
      
      private var __x:Number = 0;
      
      public function JFE3DCamera()
      {
         super();
         this.transform = Matrix3D.IDENTITY;
         this.view = Matrix3D.IDENTITY;
      }
      
      public function get y() : Number
      {
         return this.__y;
      }
      
      public function set y(param1:Number) : *
      {
         this.__y = param1;
      }
      
      public function lookAt(param1:Number3D) : *
      {
         var _loc4_:Number3D = null;
         var _loc5_:Number3D = null;
         var _loc6_:Matrix3D = null;
         var _loc2_:Number3D = new Number3D(this.x,this.y,this.z);
         var _loc3_:Number3D = Number3D.sub(param1,_loc2_);
         _loc3_.normalize();
         if(_loc3_.modulo > 0.1)
         {
            _loc4_ = Number3D.cross(_loc3_,new Number3D(0,1,0));
            _loc4_.normalize();
            _loc5_ = Number3D.cross(_loc3_,_loc4_);
            _loc5_.normalize();
            _loc6_ = this.transform;
            _loc6_.n11 = _loc4_.x;
            _loc6_.n21 = _loc4_.y;
            _loc6_.n31 = _loc4_.z;
            _loc6_.n12 = -_loc5_.x;
            _loc6_.n22 = -_loc5_.y;
            _loc6_.n32 = -_loc5_.z;
            _loc6_.n13 = _loc3_.x;
            _loc6_.n23 = _loc3_.y;
            _loc6_.n33 = _loc3_.z;
            this.view = Matrix3D.inverse(Matrix3D.multiply(_loc6_,_flipY));
         }
      }
      
      public function get x() : Number
      {
         return this.__x;
      }
      
      public function get z() : Number
      {
         return this.__z;
      }
      
      public function set x(param1:Number) : *
      {
         this.__x = param1;
      }
      
      public function set z(param1:Number) : *
      {
         this.__z = param1;
      }
   }
}
