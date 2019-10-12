package anifire.studio.managers
{
   import anifire.event.FontEvent;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import mx.collections.ArrayCollection;
   
   public class StudioFontManager extends EventDispatcher
   {
      
      private static var _instance:StudioFontManager;
       
      
      private var _recentFonts:ArrayCollection;
      
      public function StudioFontManager(param1:IEventDispatcher = null)
      {
         super(param1);
         this._recentFonts = new ArrayCollection();
      }
      
      public static function get instance() : StudioFontManager
      {
         if(!_instance)
         {
            _instance = new StudioFontManager();
         }
         return _instance;
      }
      
      public function addRecentFont(param1:String, param2:String = null) : void
      {
         var _loc3_:int = this._recentFonts.getItemIndex(param1);
         if(_loc3_ >= 0)
         {
            this._recentFonts.removeItemAt(_loc3_);
         }
         this._recentFonts.addItemAt(param1,0);
         this.dispatchEvent(new FontEvent(FontEvent.FONT_FAMILY_USED,param1,param2));
      }
      
      public function get recentFonts() : ArrayCollection
      {
         return this._recentFonts;
      }
   }
}
