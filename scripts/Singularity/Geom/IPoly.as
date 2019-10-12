package Singularity.Geom
{
   public interface IPoly
   {
       
      
      function addCoef(param1:Number, param2:Number) : void;
      
      function getCoef(param1:uint) : Object;
      
      function reset() : void;
      
      function getX(param1:Number) : Number;
      
      function getY(param1:Number) : Number;
      
      function getXPrime(param1:Number) : Number;
      
      function getYPrime(param1:Number) : Number;
      
      function getDeriv(param1:Number) : Number;
      
      function toString() : String;
   }
}
