package anifire.models.creator
{
   public class CCBodyComponentModel
   {
       
      
      public var type:String;
      
      public var component_id:String;
      
      public var theme_id:String;
      
      public var x:Number;
      
      public var y:Number;
      
      public var xscale:Number;
      
      public var yscale:Number;
      
      public var offset:Number;
      
      public var rotation:Number;
      
      public var split:Boolean = true;
      
      public var folder:String;
      
      public var id:String;
      
      public function CCBodyComponentModel()
      {
         super();
      }
      
      public function parse(param1:XML) : void
      {
         this.type = param1.@type;
         this.component_id = this.folder = param1.@component_id;
         this.theme_id = param1.@theme_id;
         this.x = param1.@x;
         this.y = param1.@y;
         this.xscale = param1.@xscale;
         this.yscale = param1.@yscale;
         this.offset = param1.@offset;
         this.rotation = param1.@rotation;
         if(param1.hasOwnProperty("@split") && String(param1.@split) == "N")
         {
            this.split = false;
         }
         if(param1.hasOwnProperty("@id"))
         {
            this.id = param1.@id;
         }
      }
      
      public function initDefaultValues() : void
      {
         this.x = 0;
         this.y = 0;
         this.xscale = 1;
         this.yscale = 1;
         this.offset = 0;
         this.rotation = 0;
         this.split = false;
      }
      
      public function serialize() : XML
      {
         var _loc1_:XML = <component/>;
         _loc1_.@type = this.type;
         _loc1_.@component_id = this.component_id;
         _loc1_.@theme_id = this.theme_id;
         _loc1_.@x = this.x;
         _loc1_.@y = this.y;
         _loc1_.@xscale = this.xscale;
         _loc1_.@yscale = this.yscale;
         _loc1_.@offset = this.offset;
         _loc1_.@rotation = this.rotation;
         if(!this.split)
         {
            _loc1_.@split = "N";
         }
         if(this.id)
         {
            _loc1_.@id = this.id;
         }
         return _loc1_;
      }
      
      public function deserialize(param1:XML) : void
      {
         this.parse(param1);
      }
   }
}
