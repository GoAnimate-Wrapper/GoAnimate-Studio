package com.jumpeye.flashEff2.text
{
   import flash.display.Sprite;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   public dynamic class FeChar extends Sprite
   {
       
      
      private var _type:String = "FeChar";
      
      private var _textField:TextField;
      
      private var _htmlText:String = "";
      
      private var _bottomPosition:Number;
      
      private var _id:Number;
      
      private var _properties:Object;
      
      public function FeChar(param1:Number, param2:Number, param3:Object)
      {
         super();
         this.init();
         this.text = param3.text || "";
         this.id = param3.id;
         this.x = param1;
         this.y = param2;
         this.properties = param3;
         this.textField.embedFonts = true;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function set textField(param1:TextField) : void
      {
         this._textField = param1;
      }
      
      public function get textField() : TextField
      {
         return this._textField;
      }
      
      public function set text(param1:String) : void
      {
         this.textField.text = param1;
         this._htmlText = param1;
      }
      
      public function get text() : String
      {
         return this.textField.text;
      }
      
      public function set htmlText(param1:String) : void
      {
         this.textField.htmlText = param1;
         this._htmlText = param1;
      }
      
      public function get htmlText() : String
      {
         return this._htmlText;
      }
      
      public function set id(param1:Number) : void
      {
         this._id = param1;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function set properties(param1:Object) : void
      {
         this._properties = param1;
      }
      
      public function get properties() : Object
      {
         return this._properties;
      }
      
      public function set bottomPosition(param1:Number) : void
      {
         this._bottomPosition = param1;
      }
      
      public function get bottomPosition() : Number
      {
         return this._bottomPosition;
      }
      
      private function init() : *
      {
         this.textField = new TextField();
         this.textField.autoSize = TextFieldAutoSize.LEFT;
         this.textField.selectable = false;
         this.addChild(this.textField);
      }
      
      public function applyTextFormat(param1:TextFormat) : void
      {
         param1.leading = 0;
         param1.leftMargin = 0;
         param1.rightMargin = 0;
         param1.letterSpacing = 0;
         param1.indent = 0;
         param1.blockIndent = 0;
         param1.align = "left";
         this.textField.setTextFormat(param1);
         if(this.textField.getTextFormat().italic == true)
         {
            this.textField.autoSize = TextFieldAutoSize.LEFT;
            this.textField.width = this.textField.width + this.textField.height * 0.2125;
            this.textField.autoSize = TextFieldAutoSize.NONE;
         }
         this.renewPositions();
      }
      
      private function renewPositions() : *
      {
         this.y = this.y + this.bottomPosition - this.textField.getLineMetrics(0).ascent;
      }
   }
}
