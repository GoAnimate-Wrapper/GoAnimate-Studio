package anifire.studio.assets.control
{
   import flash.utils.ByteArray;
   import mx.core.MovieClipLoaderAsset;
   
   public class ResizableCameraControl_iconMoveBlue extends MovieClipLoaderAsset
   {
      
      private static var bytes:ByteArray = null;
       
      
      public var dataClass:Class;
      
      public function ResizableCameraControl_iconMoveBlue()
      {
         this.dataClass = ResizableCameraControl_iconMoveBlue_dataClass;
         super();
         initialWidth = 1400 / 20;
         initialHeight = 1400 / 20;
      }
      
      override public function get movieClipData() : ByteArray
      {
         if(bytes == null)
         {
            bytes = ByteArray(new this.dataClass());
         }
         return bytes;
      }
   }
}
