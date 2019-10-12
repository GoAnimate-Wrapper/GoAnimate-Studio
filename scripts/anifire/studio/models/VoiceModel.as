package anifire.studio.models
{
   import anifire.studio.interfaces.ILanguageModel;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import mx.events.PropertyChangeEvent;
   
   public class VoiceModel implements ILanguageModel, IEventDispatcher
   {
      
      private static const SHORT_DESC_REGEX:RegExp = /\s*\([a-zA-Z ]+\)$/;
       
      
      private var _3355id:String;
      
      protected var _desc:String;
      
      private var _2028512979shortDesc:String;
      
      private var _1477067101countryCode:String;
      
      private var _176478573languageId:String;
      
      private var _1249512767gender:String;
      
      private var _3444122plus:Boolean;
      
      private var _suffix:String;
      
      private var _bindingEventDispatcher:EventDispatcher;
      
      public function VoiceModel(param1:XML, param2:String)
      {
         this._bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
         super();
         this.id = param1.@id;
         this._desc = param1.@desc;
         this.shortDesc = this._desc.replace(SHORT_DESC_REGEX,"");
         this.countryCode = param1.@country;
         this.languageId = param2;
         this.gender = param1.@sex;
      }
      
      public function get iconName() : String
      {
         return this.countryCode != ""?this.countryCode:this.languageId;
      }
      
      public function get desc() : String
      {
         return this._desc;
      }
      
      public function toString() : String
      {
         return this.shortDesc;
      }
      
      [Bindable(event="propertyChange")]
      public function get id() : String
      {
         return this._3355id;
      }
      
      public function set id(param1:String) : void
      {
         var _loc2_:Object = this._3355id;
         if(_loc2_ !== param1)
         {
            this._3355id = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"id",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get shortDesc() : String
      {
         return this._2028512979shortDesc;
      }
      
      public function set shortDesc(param1:String) : void
      {
         var _loc2_:Object = this._2028512979shortDesc;
         if(_loc2_ !== param1)
         {
            this._2028512979shortDesc = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"shortDesc",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get countryCode() : String
      {
         return this._1477067101countryCode;
      }
      
      public function set countryCode(param1:String) : void
      {
         var _loc2_:Object = this._1477067101countryCode;
         if(_loc2_ !== param1)
         {
            this._1477067101countryCode = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"countryCode",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get languageId() : String
      {
         return this._176478573languageId;
      }
      
      public function set languageId(param1:String) : void
      {
         var _loc2_:Object = this._176478573languageId;
         if(_loc2_ !== param1)
         {
            this._176478573languageId = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"languageId",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get gender() : String
      {
         return this._1249512767gender;
      }
      
      public function set gender(param1:String) : void
      {
         var _loc2_:Object = this._1249512767gender;
         if(_loc2_ !== param1)
         {
            this._1249512767gender = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"gender",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get plus() : Boolean
      {
         return this._3444122plus;
      }
      
      public function set plus(param1:Boolean) : void
      {
         var _loc2_:Object = this._3444122plus;
         if(_loc2_ !== param1)
         {
            this._3444122plus = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"plus",_loc2_,param1));
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
