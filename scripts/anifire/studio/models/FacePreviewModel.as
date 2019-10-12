package anifire.studio.models
{
   import anifire.studio.core.Character;
   import anifire.studio.core.PropThumb;
   import anifire.studio.core.State;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   public class FacePreviewModel extends EventDispatcher
   {
       
      
      protected var _character:Character;
      
      protected var _stateId:String;
      
      protected var _autoStateId:String;
      
      protected var _propThumb:PropThumb;
      
      public function FacePreviewModel(param1:Character, param2:String)
      {
         super();
         this._character = param1;
         this._stateId = param2;
         if(this._character)
         {
            this._propThumb = this._character.getHeadPropThumb();
         }
      }
      
      public function get character() : Character
      {
         return this._character;
      }
      
      public function get propThumb() : PropThumb
      {
         return this._propThumb;
      }
      
      public function get stateId() : String
      {
         return this._stateId;
      }
      
      public function get autoStateId() : String
      {
         return this._autoStateId;
      }
      
      public function get state() : State
      {
         if(!this._propThumb)
         {
            return null;
         }
         if(this._stateId == Character.AUTO_FACIAL_EXPRESSION)
         {
            return !!this._autoStateId?this._propThumb.getStateById(this._autoStateId):this._propThumb.defaultState;
         }
         return this._propThumb.getStateById(this._stateId);
      }
      
      public function get cacheId() : String
      {
         return this._propThumb.id + ":" + this.state.id;
      }
      
      public function updateAutoState(param1:String) : void
      {
         this._autoStateId = param1;
         dispatchEvent(new Event(Event.CHANGE));
      }
   }
}
