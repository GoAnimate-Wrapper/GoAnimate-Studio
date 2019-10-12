package anifire.studio.interfaces
{
   public interface IBubbleText
   {
       
      
      function get text() : String;
      
      function set text(param1:String) : void;
      
      function get textAlpha() : uint;
      
      function set textAlpha(param1:uint) : void;
      
      function get textColor() : uint;
      
      function set textColor(param1:uint) : void;
      
      function get textFont() : String;
      
      function set textFont(param1:String) : void;
      
      function get textAlign() : String;
      
      function set textAlign(param1:String) : void;
      
      function get textBold() : Boolean;
      
      function set textBold(param1:Boolean) : void;
      
      function get textEmbed() : Boolean;
      
      function set textEmbed(param1:Boolean) : void;
      
      function get textItalic() : Boolean;
      
      function set textItalic(param1:Boolean) : void;
      
      function get textSize() : Number;
      
      function set textSize(param1:Number) : void;
      
      function get autoTextResize() : Boolean;
      
      function set autoTextResize(param1:Boolean) : void;
      
      function get horizontalPadding() : int;
      
      function set horizontalPadding(param1:int) : void;
      
      function get verticalPadding() : int;
      
      function set verticalPadding(param1:int) : void;
   }
}
