package anifire.models.creator
{
   public class CCActionModel
   {
       
      
      public var id:String;
      
      protected var _name:String;
      
      protected var _isMotion:Boolean;
      
      public var componentStates:Object;
      
      protected var _category:String;
      
      protected var _defaultFacialId:String;
      
      public var isLoop:Boolean;
      
      public var totalframe:Number;
      
      public var propXML:XMLList;
      
      public var nextActionId:String;
      
      protected var _enabled:Boolean;
      
      public var localChanged:Boolean;
      
      public var bodyShapeId:String;
      
      public function CCActionModel()
      {
         super();
         this.componentStates = {};
         this._enabled = true;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         if(this._name != param1)
         {
            this._name = param1;
            this.localChanged = true;
         }
      }
      
      public function get isMotion() : Boolean
      {
         return this._isMotion;
      }
      
      public function set isMotion(param1:Boolean) : void
      {
         if(this._isMotion != param1)
         {
            this._isMotion = param1;
            this.localChanged = true;
         }
      }
      
      public function get category() : String
      {
         return this._category;
      }
      
      public function set category(param1:String) : void
      {
         if(this._category != param1)
         {
            this._category = param1;
            this.localChanged = true;
         }
      }
      
      public function get defaultFacialId() : String
      {
         return this._defaultFacialId;
      }
      
      public function set defaultFacialId(param1:String) : void
      {
         if(this._defaultFacialId != param1)
         {
            this._defaultFacialId = param1;
            this.localChanged = true;
         }
      }
      
      public function get enabled() : Boolean
      {
         return this._enabled;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         if(this._enabled != param1)
         {
            this._enabled = param1;
            this.localChanged = true;
         }
      }
      
      public function addComponent(param1:String, param2:String) : void
      {
         this.componentStates[param1] = param2;
      }
      
      public function createPlaceHolder(param1:String) : void
      {
         this.id = param1;
         this._name = param1;
         this.totalframe = 60;
         this._enabled = false;
         this._isMotion = false;
         this.isLoop = true;
         this._category = "Unassigned";
      }
      
      public function get shortId() : String
      {
         if(this.id)
         {
            return this.id.replace(/\.xml$/,"");
         }
         return "";
      }
      
      public function toXML() : XML
      {
         var _loc1_:XML = <action/>;
         _loc1_.@id = this.shortId;
         _loc1_.@name = this.name;
         _loc1_.@loop = !!this.isLoop?"Y":"N";
         _loc1_.@totalframe = this.totalframe;
         _loc1_.@enable = !!this.enabled?"Y":"N";
         _loc1_.@is_motion = !!this.isMotion?"Y":"N";
         _loc1_.@category = this.category;
         var _loc2_:XML = <selection type="facial"/>;
         _loc2_.@facial_id = this.defaultFacialId.replace(/\.xml$/,"");
         _loc1_.appendChild(_loc2_);
         return _loc1_;
      }
      
      public function restore(param1:CCActionModel) : void
      {
         this._name = param1.name;
         this._enabled = param1.enabled;
         this._isMotion = param1.isMotion;
         this._category = param1.category;
         this._defaultFacialId = param1.defaultFacialId;
         this.localChanged = true;
      }
   }
}
