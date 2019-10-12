package anifire.managers
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   import flash.ui.MouseCursorData;
   
   public class NativeCursorManager
   {
      
      private static var _instance:NativeCursorManager;
      
      private static const imgCursor1:Class = NativeCursorManager_imgCursor1;
      
      private static const imgCursor2:Class = NativeCursorManager_imgCursor2;
      
      private static const imgCursor3:Class = NativeCursorManager_imgCursor3;
      
      private static const imgCursor4:Class = NativeCursorManager_imgCursor4;
       
      
      public function NativeCursorManager()
      {
         super();
         var _loc1_:MouseCursorData = new MouseCursorData();
         _loc1_.frameRate = 8;
         var _loc2_:Vector.<BitmapData> = new Vector.<BitmapData>();
         _loc2_.push((new imgCursor1() as Bitmap).bitmapData);
         _loc2_.push((new imgCursor2() as Bitmap).bitmapData);
         _loc2_.push((new imgCursor3() as Bitmap).bitmapData);
         _loc2_.push((new imgCursor4() as Bitmap).bitmapData);
         _loc1_.data = _loc2_;
         Mouse.registerCursor("busyCursor",_loc1_);
      }
      
      public static function get instance() : NativeCursorManager
      {
         if(!_instance)
         {
            _instance = new NativeCursorManager();
         }
         return _instance;
      }
      
      public function setBusyCursor() : void
      {
         Mouse.cursor = "busyCursor";
      }
      
      public function removeBusyCursor() : void
      {
         Mouse.cursor = MouseCursor.AUTO;
      }
   }
}
