package anifire.studio.events
{
   import anifire.studio.core.Thumb;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class SceneOptionEvent extends Event
   {
      
      public static const TYPE_CHANGED:String = "transition_type_updated";
      
      public static const DURATION_CHANGED:String = "duration_type_updated";
      
      public static const ADD_NEW_TRANSITION:String = "add_new_transition";
      
      public static const ADD_NEW_EFFECT:String = "add_new_effect";
      
      public static const EFFECT_ADD:String = "effect_add";
      
      public static const BACK:String = "back";
      
      public static const REMOVE_TRANSITION:String = "remove_transition";
       
      
      private var _ttype:String;
      
      private var _duration:Number;
      
      private var _rect:Rectangle;
      
      private var _thumb:Thumb;
      
      public function SceneOptionEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function get rect() : Rectangle
      {
         return this._rect;
      }
      
      public function set rect(param1:Rectangle) : void
      {
         this._rect = param1;
      }
      
      public function get duration() : Number
      {
         return this._duration;
      }
      
      public function set duration(param1:Number) : void
      {
         this._duration = param1;
      }
      
      public function get ttype() : String
      {
         return this._ttype;
      }
      
      public function set ttype(param1:String) : void
      {
         this._ttype = param1;
      }
      
      public function get thumb() : Thumb
      {
         return this._thumb;
      }
      
      public function set thumb(param1:Thumb) : void
      {
         this._thumb = param1;
      }
   }
}
