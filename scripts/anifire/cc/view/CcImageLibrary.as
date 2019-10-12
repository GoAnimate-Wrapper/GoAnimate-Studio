package anifire.cc.view
{
   import anifire.assets.AssetImageLibrary;
   
   public class CcImageLibrary
   {
      
      private static var _library:AssetImageLibrary;
       
      
      public function CcImageLibrary()
      {
         super();
      }
      
      public static function get library() : AssetImageLibrary
      {
         if(!_library)
         {
            _library = new AssetImageLibrary();
         }
         return _library;
      }
   }
}
