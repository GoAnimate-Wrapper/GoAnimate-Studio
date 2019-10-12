package caurina.transitions
{
   public class SpecialPropertySplitter
   {
       
      
      public var parameters:Array;
      
      public var splitValues:Function;
      
      public function SpecialPropertySplitter(param1:Function, param2:Array)
      {
         super();
         this.splitValues = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:* = "";
         _loc1_ = _loc1_ + "[SpecialPropertySplitter ";
         _loc1_ = _loc1_ + ("splitValues:" + String(this.splitValues));
         _loc1_ = _loc1_ + ", ";
         _loc1_ = _loc1_ + ("parameters:" + String(this.parameters));
         _loc1_ = _loc1_ + "]";
         return _loc1_;
      }
   }
}
