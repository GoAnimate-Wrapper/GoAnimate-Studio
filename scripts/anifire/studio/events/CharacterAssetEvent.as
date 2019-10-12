package anifire.studio.events
{
   import anifire.studio.core.Character;
   import flash.events.Event;
   
   public class CharacterAssetEvent extends Event
   {
      
      public static const FACIAL_CHANGE:String = "FACIAL_CHANGE";
      
      public static const HANDHELD_CHANGE:String = "HANDHELD_CHANGE";
      
      public static const WEAR_CHANGE:String = "WEAR_CHANGE";
      
      public static const MOUTH_CHANGE:String = "MOUTH_CHANGE";
       
      
      public var asset:Character;
      
      public function CharacterAssetEvent(param1:String, param2:Character, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.asset = param2;
      }
   }
}
