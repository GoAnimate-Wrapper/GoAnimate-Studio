package anifire.event
{
   import flash.events.Event;
   
   public class FontEvent extends Event
   {
      
      public static const FONT_FAMILY_USED:String = "fontFamilyUsed";
      
      public static const USER_FONT_ADDED:String = "userFontAdded";
      
      public static const USER_FONT_REMOVED:String = "userFontRemoved";
      
      public static const USER_FONT_LIST_LOADED:String = "userFontListLoaded";
       
      
      public var fontId:String;
      
      public var themeId:String;
      
      public function FontEvent(param1:String, param2:String = null, param3:String = null, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param4,param5);
         this.fontId = param2;
         this.themeId = param3;
      }
   }
}
