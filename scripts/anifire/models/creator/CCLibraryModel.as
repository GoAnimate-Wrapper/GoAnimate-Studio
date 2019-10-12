package anifire.models.creator
{
   public class CCLibraryModel
   {
       
      
      public var type:String;
      
      public var id:String;
      
      public var basePath:String;
      
      protected var _enable:Boolean;
      
      public var tags:Object;
      
      public var bodyShapes:Object;
      
      public var runwayMode:Boolean;
      
      public var localChanged:Boolean;
      
      protected var _localDisplayOrder:Number;
      
      public function CCLibraryModel(param1:Boolean = false)
      {
         super();
         this.runwayMode = param1;
         this._enable = true;
         if(param1)
         {
            this.tags = {};
            this.bodyShapes = {};
         }
      }
      
      public function get enable() : Boolean
      {
         return this._enable;
      }
      
      public function set enable(param1:Boolean) : void
      {
         if(this._enable != param1)
         {
            this._enable = param1;
            this.localChanged = true;
         }
      }
      
      public function get localDisplayOrder() : Number
      {
         return this._localDisplayOrder;
      }
      
      public function set localDisplayOrder(param1:Number) : void
      {
         if(this._localDisplayOrder != param1)
         {
            this._localDisplayOrder = param1;
            this.localChanged = true;
         }
      }
      
      public function parse(param1:XML) : void
      {
         var _loc2_:XMLList = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         this.id = param1.@id;
         this.type = param1.@type;
         this.basePath = param1.@path;
         if(this.runwayMode)
         {
            _loc2_ = param1.tag;
            _loc3_ = _loc2_.length();
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               this.tags[_loc2_[_loc4_]] = true;
               _loc4_++;
            }
            this._enable = param1.@enable != "N";
         }
         if(param1.hasOwnProperty("@display_order"))
         {
            this._localDisplayOrder = param1.@display_order;
         }
         else
         {
            this._localDisplayOrder = 0;
         }
      }
      
      public function restore(param1:CCLibraryModel) : void
      {
         this._enable = param1.enable;
         this.tags = param1.tags;
         this.bodyShapes = param1.bodyShapes;
         this._localDisplayOrder = param1.localDisplayOrder;
         this.localChanged = true;
      }
      
      public function get uniqueId() : String
      {
         return this.type + "/" + this.basePath;
      }
      
      public function getFilename() : String
      {
         return this.basePath + ".swf";
      }
      
      public function getPath() : String
      {
         return this.pathPrefix + this.getFilename();
      }
      
      private function get pathPrefix() : String
      {
         return this.type + "/";
      }
      
      public function hasTag(param1:String) : Boolean
      {
         return this.tags && this.tags[param1];
      }
      
      public function addTag(param1:String) : void
      {
         this.tags[param1] = true;
         this.localChanged = true;
      }
      
      public function removeTag(param1:String) : void
      {
         delete this.tags[param1];
         this.localChanged = true;
      }
      
      protected function shouldIncludeTag(param1:String, param2:String) : Boolean
      {
         switch(param2)
         {
            case "_sticky_filter_guy":
            case "_sticky_filter_girl":
               return param1 == "default";
            case "_sticky_filter_littleboy":
            case "_sticky_filter_littlegirl":
               return param1 == "kid";
            case "_sticky_filter_heavyguy":
            case "_sticky_filter_heavygirl":
               return param1 == "heavy";
            case "_userrole_admin":
               return true;
            default:
               return false;
         }
      }
      
      public function getLocalXMLByBodyShape(param1:String) : XML
      {
         var _loc3_:* = null;
         var _loc4_:XML = null;
         var _loc2_:XML = <library/>;
         _loc2_.@type = this.type;
         _loc2_.@id = this.id;
         _loc2_.@path = this.basePath;
         _loc2_.@name = this.id;
         _loc2_.@thumb = this.basePath + "_thumbnail.swf";
         if(this._localDisplayOrder > 0)
         {
            _loc2_.@display_order = this._localDisplayOrder;
         }
         _loc2_.@enable = !!this.enable?"Y":"N";
         _loc2_.@sharing = "0";
         _loc2_.@money = "0";
         for(_loc3_ in this.tags)
         {
            if(this.tags[_loc3_] && this.shouldIncludeTag(param1,_loc3_))
            {
               _loc4_ = <tag>{_loc3_}</tag>;
               _loc2_.appendChild(_loc4_);
            }
         }
         return _loc2_;
      }
      
      public function hasLocalBodyShape(param1:String) : Boolean
      {
         return this.bodyShapes[param1];
      }
      
      public function addLocalBodyShape(param1:String) : void
      {
         this.bodyShapes[param1] = true;
         this.localChanged = true;
      }
      
      public function removeLocalBodyShape(param1:String) : void
      {
         delete this.bodyShapes[param1];
         this.localChanged = true;
      }
   }
}
