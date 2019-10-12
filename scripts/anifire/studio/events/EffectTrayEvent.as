package anifire.studio.events
{
   import anifire.studio.core.EffectAsset;
   import flash.events.Event;
   
   public class EffectTrayEvent extends Event
   {
      
      public static const EFFECT_TRAY_ACTION:String = "effectTrayAction";
      
      public static const SHOW_EFFECT:String = "showEffect";
      
      public static const HIDE_EFFECT:String = "hideEffect";
      
      public static const DELETE_EFFECT:String = "deleteEffect";
      
      public static const EDIT_EFFECT:String = "editEffect";
      
      public static const TIMING_PRESS:String = "timingPress";
      
      public static const TIMING_RELEASE:String = "timingRelease";
       
      
      private var _effectAsset:EffectAsset;
      
      private var _subType:String;
      
      public function EffectTrayEvent(param1:String, param2:String, param3:EffectAsset)
      {
         super(param1);
         this._effectAsset = param3;
         this._subType = param2;
      }
      
      public function get effectAsset() : EffectAsset
      {
         return this._effectAsset;
      }
      
      public function get subType() : String
      {
         return this._subType;
      }
   }
}
