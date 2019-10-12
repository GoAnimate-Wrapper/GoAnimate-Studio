package anifire.studio.events
{
   import anifire.studio.core.BubbleAsset;
   import flash.events.Event;
   
   public class BubbleAssetEvent extends Event
   {
      
      public static const TEXT_CHANGE:String = "TEXT_CHANGE";
      
      public static const TEXT_TYPING:String = "TEXT_TYPING";
      
      public static const TEXT_COLOR_CHANGE:String = "TEXT_COLOR_CHANGE";
      
      public static const TEXT_FONT_CHANGE:String = "TEXT_FONT_CHANGE";
      
      public static const TEXT_ALIGN_CHANGE:String = "TEXT_ALIGN_CHANGE";
      
      public static const TEXT_BOLD_CHANGE:String = "TEXT_BOLD_CHANGE";
      
      public static const TEXT_EMBED_CHANGE:String = "TEXT_EMBED_CHANGE";
      
      public static const TEXT_STYLE_CHANGE:String = "TEXT_STYLE_CHANGE";
      
      public static const TEXT_SIZE_CHANGE:String = "TEXT_SIZE_CHANGE";
      
      public static const AUTO_TEXT_RESIZE_CHANGE:String = "AUTO_TEXT_RESIZE_CHANGE";
      
      public static const BG_COLOR_CHANGE:String = "BG_COLOR_CHANGE";
      
      public static const TAIL_MOVED:String = "TAIL_MOVED";
      
      public static const BUBBLE_RESIZED:String = "BUBBLE_RESIZED";
       
      
      public var asset:BubbleAsset;
      
      public function BubbleAssetEvent(param1:String, param2:BubbleAsset, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.asset = param2;
      }
   }
}
