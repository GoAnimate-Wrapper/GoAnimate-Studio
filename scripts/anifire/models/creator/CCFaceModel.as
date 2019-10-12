package anifire.models.creator
{
   public class CCFaceModel
   {
       
      
      public var id:String;
      
      public var name:String;
      
      public var enable:Boolean;
      
      public var componentStates:Object;
      
      public function CCFaceModel()
      {
         super();
         this.componentStates = {};
      }
      
      public function parse(param1:XML) : void
      {
         var _loc5_:String = null;
         var _loc6_:String = null;
         this.id = param1.@id;
         this.name = param1.@name;
         this.enable = param1.@enable == "N"?false:true;
         var _loc2_:XMLList = param1.selection;
         var _loc3_:int = _loc2_.length();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = _loc2_[_loc4_].@type;
            _loc6_ = _loc2_[_loc4_].@state_id;
            this.componentStates[_loc5_] = _loc6_;
            _loc4_++;
         }
      }
      
      public function getStateByComponent(param1:String) : String
      {
         return this.componentStates[param1];
      }
      
      public function get fullId() : String
      {
         return this.id + ".xml";
      }
   }
}
