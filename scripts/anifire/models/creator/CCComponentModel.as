package anifire.models.creator
{
   public class CCComponentModel
   {
       
      
      public var type:String;
      
      public var id:String;
      
      public var basePath:String;
      
      public var states:Object;
      
      public var runwayMode:Boolean;
      
      public var tags:Object;
      
      protected var _enable:Boolean;
      
      public var localChanged:Boolean;
      
      public function CCComponentModel(param1:Boolean = false)
      {
         super();
         this.states = {};
         this.runwayMode = param1;
         if(param1)
         {
            this.tags = {};
         }
         else
         {
            this.enable = true;
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
      
      public function parse(param1:XML) : void
      {
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:XMLList = null;
         this.id = param1.@id;
         this.type = param1.@type;
         this.basePath = param1.@path;
         var _loc2_:XMLList = param1.state;
         var _loc3_:int = _loc2_.length();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = _loc2_[_loc4_].@id;
            _loc6_ = _loc2_[_loc4_].@filename;
            this.states[_loc5_] = _loc6_;
            _loc4_++;
         }
         if(this.runwayMode)
         {
            _loc7_ = param1.tag;
            _loc3_ = _loc7_.length();
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               this.tags[_loc7_[_loc4_]] = true;
               _loc4_++;
            }
            this._enable = param1.@enable != "N";
         }
      }
      
      public function getFilenameByState(param1:String) : String
      {
         return this.states[param1];
      }
      
      public function getPathByState(param1:String) : String
      {
         return this.pathPrefix + this.getFilenameByState(param1);
      }
      
      public function get uniqueId() : String
      {
         return this.type + "/" + this.basePath;
      }
      
      private function get pathPrefix() : String
      {
         return this.type + "/" + this.basePath + "/";
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
      
      public function restore(param1:CCComponentModel) : void
      {
         this._enable = param1.enable;
         this.tags = param1.tags;
         this.localChanged = true;
      }
      
      public function toXML() : XML
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:XML = null;
         var _loc5_:XML = null;
         var _loc1_:XML = <component/>;
         _loc1_.@type = this.type;
         _loc1_.@id = this.id;
         _loc1_.@path = this.basePath;
         _loc1_.@name = this.id;
         _loc1_.@thumb = "thumbnail.swf";
         _loc1_.@money = "0";
         _loc1_.@sharing = "0";
         _loc1_.@enable = !!this.enable?"Y":"N";
         _loc1_.@split = "N";
         for(_loc2_ in this.states)
         {
            _loc4_ = <state/>;
            _loc4_.@id = _loc2_;
            _loc4_.@filename = _loc2_ + ".swf";
            _loc1_.appendChild(_loc4_);
         }
         for(_loc3_ in this.tags)
         {
            if(this.tags[_loc3_])
            {
               _loc5_ = <tag>{_loc3_}</tag>;
               _loc1_.appendChild(_loc5_);
            }
         }
         return _loc1_;
      }
   }
}
