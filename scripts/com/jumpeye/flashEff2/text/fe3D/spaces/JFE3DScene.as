package com.jumpeye.flashEff2.text.fe3D.spaces
{
   import com.jumpeye.flashEff2.text.fe3D.Matrix3D;
   import com.jumpeye.flashEff2.text.fe3D.objects.JFE3DCamera;
   import com.jumpeye.flashEff2.text.fe3D.objects.JFE3DDisplayObject;
   
   public class JFE3DScene
   {
       
      
      protected var items:Array;
      
      public var middleX:Number = 0;
      
      public var middleY:Number = 0;
      
      public var middleZ:Number = 0;
      
      protected var totalItems:Number = 0;
      
      public function JFE3DScene()
      {
         super();
         this.items = [];
      }
      
      public function pushItem(param1:JFE3DDisplayObject) : JFE3DDisplayObject
      {
         this.items.push(param1);
         this.totalItems++;
         return this.items[this.totalItems - 1];
      }
      
      public function rotateScene(param1:JFE3DCamera, param2:Number = 0, param3:Number = 0, param4:Number = 0) : void
      {
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Matrix3D = null;
         var _loc5_:Number = Math.sqrt(param2 * param2 + param3 * param3 + param4 * param4);
         if(_loc5_ > 0.001)
         {
            param2 = param2 / _loc5_;
            param3 = param3 / _loc5_;
            param4 = param4 / _loc5_;
            _loc6_ = Math.cos(_loc5_);
            _loc7_ = Math.sin(_loc5_);
            _loc8_ = 1 - _loc6_;
            _loc9_ = new Matrix3D();
            _loc9_.n11 = _loc8_ * param2 * param2 + _loc6_;
            _loc9_.n12 = _loc8_ * param2 * param3 - _loc7_ * param4;
            _loc9_.n13 = _loc8_ * param2 * param4 + _loc7_ * param3;
            _loc9_.n21 = _loc8_ * param2 * param3 + _loc7_ * param4;
            _loc9_.n22 = _loc8_ * param3 * param3 + _loc6_;
            _loc9_.n23 = _loc8_ * param3 * param4 - _loc7_ * param2;
            _loc9_.n31 = _loc8_ * param2 * param4 - _loc7_ * param3;
            _loc9_.n32 = _loc8_ * param3 * param4 + _loc7_ * param2;
            _loc9_.n33 = _loc8_ * param4 * param4 + _loc6_;
            param1.transform = Matrix3D.multiply(param1.transform,_loc9_);
            param1.view = Matrix3D.inverse(param1.transform);
         }
      }
      
      public function get childrens() : Array
      {
         return this.items;
      }
      
      public function renderCamera() : void
      {
         this.renderObjects();
      }
      
      public function renderObjects() : void
      {
         var _loc3_:JFE3DDisplayObject = null;
         var _loc1_:Array = this.items;
         var _loc2_:Number = this.totalItems;
         while(_loc3_ = _loc1_[--_loc2_])
         {
            _loc3_.render(this);
         }
      }
      
      public function clearScene() : void
      {
         this.items = [];
      }
   }
}
