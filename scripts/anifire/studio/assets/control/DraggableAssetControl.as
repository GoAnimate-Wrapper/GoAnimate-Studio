package anifire.studio.assets.control
{
   import anifire.studio.events.AssetEvent;
   import anifire.studio.interfaces.IAssetControl;
   import anifire.studio.interfaces.IMovable;
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   
   public class DraggableAssetControl extends AbstractAssetControlDecorator implements IAssetControl
   {
       
      
      public function DraggableAssetControl(param1:IAssetControl)
      {
         super(param1);
         this.moveControl();
         this.addAssetEventListeners(param1.asset);
      }
      
      private function addAssetEventListeners(param1:IEventDispatcher) : void
      {
         if(param1)
         {
            param1.addEventListener(AssetEvent.ASSET_MOVED,this.onAssetMoved);
         }
      }
      
      override public function destroy(param1:String = "rip") : void
      {
         this.stage.removeEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUp);
         this.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onStageMouseMove);
         decorated.border.removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this.removeAssetEventListeners(super.asset);
         super.destroy(param1);
      }
      
      override public function set asset(param1:IEventDispatcher) : void
      {
         this.removeAssetEventListeners(super.asset);
         super.asset = param1;
         this.moveControl();
         this.addAssetEventListeners(decorated.asset);
      }
      
      private function removeAssetEventListeners(param1:IEventDispatcher) : void
      {
         if(param1)
         {
            param1.removeEventListener(AssetEvent.ASSET_MOVED,this.onAssetMoved);
         }
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         this.stage.addEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUp);
         this.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onStageMouseMove);
         this.startDrag();
      }
      
      private function onStageMouseMove(param1:MouseEvent) : void
      {
         this.moveAsset();
      }
      
      private function onStageMouseUp(param1:MouseEvent) : void
      {
         this.stage.removeEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUp);
         this.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onStageMouseMove);
         this.stopDrag();
         this.moveAsset();
      }
      
      private function moveAsset() : void
      {
         if(super.asset is IMovable)
         {
            IMovable(super.asset).move(this.x,this.y);
         }
      }
      
      private function onAssetMoved(param1:AssetEvent) : void
      {
         this.moveControl();
      }
      
      private function moveControl() : void
      {
         if(super.asset is IMovable)
         {
            this.move(IMovable(super.asset).x,IMovable(super.asset).y);
         }
      }
   }
}
