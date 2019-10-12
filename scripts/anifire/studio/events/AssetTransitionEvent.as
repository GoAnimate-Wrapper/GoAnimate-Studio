package anifire.studio.events
{
   import anifire.studio.assets.models.AssetTransition;
   import flash.events.Event;
   
   public class AssetTransitionEvent extends Event
   {
      
      public static const SECTION_CHANGE:String = "SECTION_CHANGE";
      
      public static const TIMING_CHANGE:String = "TIMING_CHANGE";
      
      public static const DIRECTION_CHANGE:String = "DIRECTION_CHANGE";
      
      public static const TYPE_CHANGE:String = "typeChange";
      
      public static const CONFLICT_CHANGE:String = "CONFLICT_CHANGE";
      
      public static const CONFLICT_WITH_OTHER_HAND_DRAWN_CHANGE:String = "CONFLICT_WITH_OTER_HAND_DRAWN_CHANGE";
      
      public static const CONFLICT_WITH_FONT_FAMILY_CHANGE:String = "conflictWithFontFamilyChange";
       
      
      public var assetTransition:AssetTransition;
      
      public function AssetTransitionEvent(param1:String, param2:AssetTransition = null, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.assetTransition = param2;
      }
      
      override public function clone() : Event
      {
         return new AssetTransitionEvent(type,this.assetTransition,bubbles,cancelable);
      }
   }
}
