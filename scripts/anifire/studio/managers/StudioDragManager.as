package anifire.studio.managers
{
   import mx.core.DragSource;
   import mx.core.FlexGlobals;
   import mx.core.IFlexDisplayObject;
   import mx.core.IUIComponent;
   import mx.core.UIComponent;
   import mx.events.DragEvent;
   import mx.managers.DragManager;
   
   public class StudioDragManager
   {
      
      public static const DRAG_IMAGE:String = "dragImage";
      
      public static const DRAG_FORMAT_COLOR_SWATCH_REMOVE:String = "colorSwatchRemove";
      
      private static var _dragSource:DragSource;
       
      
      public function StudioDragManager()
      {
         super();
      }
      
      public static function get dragSource() : DragSource
      {
         return _dragSource;
      }
      
      public static function set dragSource(param1:DragSource) : void
      {
         _dragSource = param1;
      }
      
      public static function getDragImage(param1:DragSource) : IFlexDisplayObject
      {
         if(param1.hasFormat(StudioDragManager.DRAG_IMAGE))
         {
            return param1.dataForFormat(StudioDragManager.DRAG_IMAGE) as IFlexDisplayObject;
         }
         return null;
      }
      
      public static function startRemoveColor() : void
      {
         var _loc1_:UIComponent = FlexGlobals.topLevelApplication as UIComponent;
         if(_loc1_)
         {
            _loc1_.addEventListener(DragEvent.DRAG_ENTER,application_dragEnterHandler);
            _loc1_.addEventListener(DragEvent.DRAG_DROP,application_dragDropHandler);
         }
      }
      
      public static function finishRemoveColor() : void
      {
         var _loc1_:UIComponent = FlexGlobals.topLevelApplication as UIComponent;
         if(_loc1_)
         {
            _loc1_.removeEventListener(DragEvent.DRAG_ENTER,application_dragEnterHandler);
            _loc1_.removeEventListener(DragEvent.DRAG_DROP,application_dragDropHandler);
         }
      }
      
      private static function application_dragEnterHandler(param1:DragEvent) : void
      {
         if(param1.dragSource.hasFormat(DRAG_FORMAT_COLOR_SWATCH_REMOVE))
         {
            DragManager.acceptDragDrop(param1.target as IUIComponent);
            DragManager.showFeedback(DragManager.MOVE);
         }
      }
      
      private static function application_dragDropHandler(param1:DragEvent) : void
      {
         var _loc2_:uint = 0;
         if(param1.dragSource.hasFormat(DRAG_FORMAT_COLOR_SWATCH_REMOVE))
         {
            _loc2_ = param1.dragSource.dataForFormat(DRAG_FORMAT_COLOR_SWATCH_REMOVE) as uint;
            PaletteManager.instance.removeColor(_loc2_);
         }
      }
   }
}
