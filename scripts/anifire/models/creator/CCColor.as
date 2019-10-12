package anifire.models.creator
{
   public class CCColor
   {
       
      
      public var type:String;
      
      public var dest:uint;
      
      public var oc:uint = 4.294967295E9;
      
      public var targetComponent:String = "";
      
      public function CCColor()
      {
         super();
      }
      
      public function parse(param1:XML) : void
      {
         this.type = param1.@r;
         this.dest = uint(param1);
         this.oc = param1.attribute("oc").length() == 0?uint(uint.MAX_VALUE):uint(param1.@oc);
         if(param1.attribute("targetComponent").length() != 0)
         {
            this.targetComponent = param1.@targetComponent;
         }
      }
      
      public function serialize() : XML
      {
         var _loc1_:XML = <color>{this.dest.toString()}</color>;
         _loc1_.@r = this.type;
         if(this.oc != uint.MAX_VALUE)
         {
            _loc1_.@oc = this.oc.toString();
         }
         if(this.targetComponent)
         {
            _loc1_.@targetComponent = this.targetComponent;
         }
         return _loc1_;
      }
      
      public function deserialize(param1:XML) : void
      {
         this.parse(param1);
      }
   }
}
