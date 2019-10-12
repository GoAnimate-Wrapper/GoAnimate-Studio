package fl.motion
{
   public interface ITween
   {
       
      
      function get target() : String;
      
      function set target(param1:String) : void;
      
      function getValue(param1:Number, param2:Number, param3:Number, param4:Number) : Number;
   }
}
