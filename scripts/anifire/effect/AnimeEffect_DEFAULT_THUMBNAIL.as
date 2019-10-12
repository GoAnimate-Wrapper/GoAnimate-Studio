package anifire.effect
{
   import flash.utils.ByteArray;
   import mx.core.MovieClipLoaderAsset;
   
   public class AnimeEffect_DEFAULT_THUMBNAIL extends MovieClipLoaderAsset
   {
      
      private static var bytes:ByteArray = null;
       
      
      public var dataClass:Class;
      
      public function AnimeEffect_DEFAULT_THUMBNAIL()
      {
         this.dataClass = AnimeEffect_DEFAULT_THUMBNAIL_dataClass;
         super();
         initialWidth = 1000 / 20;
         initialHeight = 1000 / 20;
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
