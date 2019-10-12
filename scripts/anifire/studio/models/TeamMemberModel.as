package anifire.studio.models
{
   import anifire.util.UtilDict;
   import flash.events.EventDispatcher;
   import mx.events.PropertyChangeEvent;
   
   public class TeamMemberModel extends EventDispatcher
   {
      
      public static const RESULT_USER_ID:String = "userId";
      
      public static const RESULT_NAME:String = "name";
      
      public static const RESULT_IS_ADMIN:String = "isAdmin";
      
      public static const RESULT_IS_ME:String = "isMe";
      
      public static const LABEL_ADMIN:String = UtilDict.toDisplay(UtilDict.BUNDLE_NAME_GO,"(admin)");
       
      
      protected var _userId:String;
      
      protected var _label:String;
      
      protected var _isDefault:Boolean;
      
      protected var _isEveryone:Boolean;
      
      protected var _isAdmin:Boolean;
      
      protected var _isMe:Boolean;
      
      protected var _selected:Boolean;
      
      public function TeamMemberModel()
      {
         super();
      }
      
      [Bindable(event="propertyChange")]
      public function get selected() : Boolean
      {
         return this._selected;
      }
      
      private function set _1191572123selected(param1:Boolean) : void
      {
         this._selected = param1;
      }
      
      public function get isMe() : Boolean
      {
         return this._isMe;
      }
      
      public function set isMe(param1:Boolean) : void
      {
         this._isMe = param1;
      }
      
      public function get isAdmin() : Boolean
      {
         return this._isAdmin;
      }
      
      public function set isAdmin(param1:Boolean) : void
      {
         this._isAdmin = param1;
      }
      
      public function get isEveryone() : Boolean
      {
         return this._isEveryone;
      }
      
      public function set isEveryone(param1:Boolean) : void
      {
         this._isEveryone = param1;
      }
      
      public function get isDefault() : Boolean
      {
         return this._isDefault;
      }
      
      public function set isDefault(param1:Boolean) : void
      {
         this._isDefault = param1;
      }
      
      public function get label() : String
      {
         if(this.isAdmin)
         {
            return this._label + " " + LABEL_ADMIN;
         }
         return this._label;
      }
      
      public function set label(param1:String) : void
      {
         this._label = param1;
      }
      
      public function get userId() : String
      {
         return this._userId;
      }
      
      public function set userId(param1:String) : void
      {
         this._userId = param1;
      }
      
      public function set selected(param1:Boolean) : void
      {
         var _loc2_:Object = this.selected;
         if(_loc2_ !== param1)
         {
            this._1191572123selected = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"selected",_loc2_,param1));
            }
         }
      }
   }
}
