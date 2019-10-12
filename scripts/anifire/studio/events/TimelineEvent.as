package anifire.studio.events
{
   import anifire.studio.components.SoundContainer;
   import flash.events.Event;
   
   public class TimelineEvent extends Event
   {
      
      public static const NEXT_CLICK:String = "nextClick";
      
      public static const PREV_CLICK:String = "prevClick";
      
      public static const CONTROL_LEFT_MOVE:String = "controlLeftMove";
      
      public static const CONTROL_RIGHT_MOVE:String = "controlRightMove";
      
      public static const SCENE_MOUSE_DOWN:String = "sceneMouseDown";
      
      public static const SCENE_MOUSE_UP:String = "sceneMouseUp";
      
      public static const SCENE_RESIZE_START:String = "sceneResizeStart";
      
      public static const SCENE_RESIZE:String = "sceneResize";
      
      public static const SCENE_RESIZE_COMPLETE:String = "sceneResizeComplete";
      
      public static const SCENE_DURATION_CHANGE:String = "sceneDurationChange";
      
      public static const SCENE_UPDATED:String = "sceneUpdated";
      
      public static const SOUND_CLICK:String = "soundClick";
      
      public static const SOUND_MOUSE_DOWN:String = "soundMouseDown";
      
      public static const SOUND_MOUSE_UP:String = "soundMouseUp";
      
      public static const SOUND_MOVE:String = "soundMove";
      
      public static const SOUND_RESIZE_START:String = "soundResizeStart";
      
      public static const SOUND_RESIZE:String = "soundResize";
      
      public static const SOUND_RESIZE_COMPLETE:String = "soundResizeComplete";
      
      public static const SOUND_REMOVED:String = "soundRemoved";
      
      public static const SOUND_UPDATED:String = "soundUpdated";
      
      public static const DISPLAY_MODE_CHANGE:String = "displayModeChange";
       
      
      private var _index:int;
      
      private var _id:String;
      
      private var _soundContainer:SoundContainer;
      
      private var _shiftKey:Boolean = false;
      
      public function TimelineEvent(param1:String, param2:Number = -1, param3:String = null, param4:SoundContainer = null, param5:Boolean = false, param6:Boolean = false)
      {
         super(param1,param5,param6);
         this._index = param2;
         this._id = param3;
         this.soundContainer = param4;
      }
      
      public function set shiftKey(param1:Boolean) : void
      {
         this._shiftKey = param1;
      }
      
      public function get shiftKey() : Boolean
      {
         return this._shiftKey;
      }
      
      public function set index(param1:int) : void
      {
         this._index = param1;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function set id(param1:String) : void
      {
         this._id = param1;
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function set soundContainer(param1:SoundContainer) : void
      {
         this._soundContainer = param1;
      }
      
      public function get soundContainer() : SoundContainer
      {
         return this._soundContainer;
      }
      
      override public function clone() : Event
      {
         return new TimelineEvent(type,this._index,this._id,this.soundContainer,this.bubbles,this.cancelable);
      }
   }
}
