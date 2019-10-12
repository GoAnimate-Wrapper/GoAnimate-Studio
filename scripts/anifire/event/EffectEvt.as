package anifire.event
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   
   public class EffectEvt extends ExtraDataEvent
   {
      
      public static const LOAD_EFFECT_COMPLETE:String = "load_effect_complete";
      
      public static const LOAD_EFFECT_THUMBNAIL_COMPLETE:String = "load_effect_thumbnail_complete";
       
      
      private var _thumbnail:DisplayObject;
      
      public function EffectEvt(param1:String, param2:Object, param3:Object = null, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param2,param3,param4,param5);
      }
      
      public function get thumbnail() : DisplayObject
      {
         return this._thumbnail;
      }
      
      public function set thumbnail(param1:DisplayObject) : void
      {
         this._thumbnail = param1;
      }
      
      override public function clone() : Event
      {
         var _loc1_:EffectEvt = new EffectEvt(this.type,this.getEventCreater(),this.getData(),this.bubbles,this.cancelable);
         _loc1_.thumbnail = this.thumbnail;
         return _loc1_;
      }
   }
}
