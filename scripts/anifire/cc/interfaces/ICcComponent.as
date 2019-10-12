package anifire.cc.interfaces
{
   public interface ICcComponent
   {
       
      
      function get themeId() : String;
      
      function get type() : String;
      
      function get url() : String;
      
      function get x() : Number;
      
      function get y() : Number;
      
      function get xscale() : Number;
      
      function get yscale() : Number;
      
      function get rotation() : Number;
      
      function get id() : String;
      
      function get colors() : Array;
      
      function set x(param1:Number) : void;
      
      function set y(param1:Number) : void;
      
      function set xscale(param1:Number) : void;
      
      function set yscale(param1:Number) : void;
      
      function set rotation(param1:Number) : void;
   }
}
