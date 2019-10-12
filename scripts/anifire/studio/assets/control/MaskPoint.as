package anifire.studio.assets.control
{
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import mx.core.DragSource;
   import mx.core.UIComponent;
   import mx.managers.DragManager;
   
   public class MaskPoint extends UIComponent
   {
       
      
      private var _oPos:Point;
      
      public function MaskPoint()
      {
         this._oPos = new Point();
         super();
         graphics.beginFill(16777215,1);
         graphics.lineStyle(1,0);
         graphics.drawCircle(0,0,6);
         cacheAsBitmap = true;
         buttonMode = true;
         useHandCursor = true;
         addEventListener(MouseEvent.MOUSE_DOWN,this.doDrag);
         addEventListener(MouseEvent.MOUSE_UP,this.doMouseUp);
      }
      
      public function set oPos(param1:Point) : void
      {
         this._oPos = param1;
      }
      
      public function get oPos() : Point
      {
         return this._oPos;
      }
      
      public function initializeDrag(param1:MouseEvent) : void
      {
         var _loc2_:UIComponent = UIComponent(param1.currentTarget);
         var _loc3_:Object = new Object();
         _loc3_.target = _loc2_;
         var _loc4_:DragSource = new DragSource();
         _loc4_.addData(_loc3_,"sourceObject");
         DragManager.doDrag(_loc2_,_loc4_,param1,null,0,0,0.5,true);
      }
      
      public function doDrag(param1:MouseEvent) : void
      {
         this.startDrag();
      }
      
      public function doMouseUp(param1:MouseEvent) : void
      {
         this.stopDrag();
      }
   }
}
