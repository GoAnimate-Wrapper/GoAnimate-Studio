package anifire.studio.events
{
   import flash.events.Event;
   
   public class ThemeChangeEvent extends Event
   {
      
      public static const THEME_CHANGE:String = "themeChange";
       
      
      public var themeId:String;
      
      public function ThemeChangeEvent(param1:String, param2:String)
      {
         super(param1);
         this.themeId = param2;
      }
   }
}
