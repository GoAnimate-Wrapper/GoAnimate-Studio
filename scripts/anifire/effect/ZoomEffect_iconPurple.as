package anifire.effect
{
   import flash.utils.ByteArray;
   import mx.core.MovieClipLoaderAsset;
   
   public class ZoomEffect_iconPurple extends MovieClipLoaderAsset
   {
      
      private static var bytes:ByteArray = null;
       
      
      public var dataClass:Class;
      
      public function ZoomEffect_iconPurple()
      {
         this.dataClass = ZoomEffect_iconPurple_dataClass;
         super();
         initialWidth = 560 / 20;
         initialHeight = 320 / 20;
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
