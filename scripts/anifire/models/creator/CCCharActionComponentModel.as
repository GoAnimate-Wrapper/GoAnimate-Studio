package anifire.models.creator
{
   public class CCCharActionComponentModel extends CCBodyComponentModel
   {
       
      
      public var path:String;
      
      public var file:String;
      
      public function CCCharActionComponentModel()
      {
         super();
      }
      
      override public function serialize() : XML
      {
         var _loc1_:XML = super.serialize();
         _loc1_.@path = this.path;
         _loc1_.@file = this.file;
         return _loc1_;
      }
      
      override public function deserialize(param1:XML) : void
      {
         this.path = param1.@path;
         this.file = param1.@file;
         super.deserialize(param1);
      }
   }
}
