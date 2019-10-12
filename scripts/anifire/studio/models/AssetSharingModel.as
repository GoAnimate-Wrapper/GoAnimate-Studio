package anifire.studio.models
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import mx.events.PropertyChangeEvent;
   
   public class AssetSharingModel implements IEventDispatcher
   {
       
      
      private var _1191572123selected:Boolean;
      
      public var sharingNone:Boolean;
      
      public var sharingTeam:Boolean;
      
      public var userId:String;
      
      private var _266666762userName:String;
      
      private var _203898126teamAdmin:Boolean;
      
      private var _102727412label:String;
      
      private var _bindingEventDispatcher:EventDispatcher;
      
      public function AssetSharingModel()
      {
         this._bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
         super();
      }
      
      [Bindable(event="propertyChange")]
      public function get selected() : Boolean
      {
         return this._1191572123selected;
      }
      
      public function set selected(param1:Boolean) : void
      {
         var _loc2_:Object = this._1191572123selected;
         if(_loc2_ !== param1)
         {
            this._1191572123selected = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"selected",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get userName() : String
      {
         return this._266666762userName;
      }
      
      public function set userName(param1:String) : void
      {
         var _loc2_:Object = this._266666762userName;
         if(_loc2_ !== param1)
         {
            this._266666762userName = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userName",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get teamAdmin() : Boolean
      {
         return this._203898126teamAdmin;
      }
      
      public function set teamAdmin(param1:Boolean) : void
      {
         var _loc2_:Object = this._203898126teamAdmin;
         if(_loc2_ !== param1)
         {
            this._203898126teamAdmin = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"teamAdmin",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get label() : String
      {
         return this._102727412label;
      }
      
      public function set label(param1:String) : void
      {
         var _loc2_:Object = this._102727412label;
         if(_loc2_ !== param1)
         {
            this._102727412label = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"label",_loc2_,param1));
            }
         }
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         this._bindingEventDispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return this._bindingEventDispatcher.dispatchEvent(param1);
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.hasEventListener(param1);
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         this._bindingEventDispatcher.removeEventListener(param1,param2,param3);
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.willTrigger(param1);
      }
   }
}
