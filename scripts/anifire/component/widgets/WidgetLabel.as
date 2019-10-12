package anifire.component.widgets
{
   import flash.display.Sprite;
   import flash.text.engine.ElementFormat;
   import flash.text.engine.FontDescription;
   import flash.text.engine.FontLookup;
   import flash.text.engine.FontWeight;
   import flash.text.engine.TextBlock;
   import flash.text.engine.TextElement;
   import flash.text.engine.TextLine;
   import flash.text.engine.TextLineCreationResult;
   import flashx.textLayout.compose.TextLineRecycler;
   import mx.events.PropertyChangeEvent;
   
   public class WidgetLabel extends Sprite
   {
      
      public static const DEFAULT_LIMIT:Number = 100000;
      
      public static const MIN_FONT_SIZE:int = 4;
       
      
      protected var _contentWidth:Number;
      
      protected var _contentHeight:Number;
      
      protected var _text:String;
      
      protected var _elementFormat:ElementFormat;
      
      protected var _autoSize:Boolean;
      
      protected var _numLines:int;
      
      protected var _widthLimit:Number;
      
      protected var _heightLimit:Number;
      
      protected var _maxDisplayedLines:int;
      
      protected var _renderedFontSize:int;
      
      protected var _textBold:Boolean;
      
      protected var _fontFamily:String;
      
      protected var _fontSize:Number;
      
      protected var _color:uint;
      
      protected var _extraAscent:Number = 0;
      
      protected var _textBlock:TextBlock;
      
      protected var _textLines:Vector.<TextLine>;
      
      protected var _autoUpdate:Boolean = true;
      
      protected var _updatePending:Boolean;
      
      public function WidgetLabel()
      {
         super();
         this.init();
      }
      
      public function get autoSize() : Boolean
      {
         return this._autoSize;
      }
      
      public function set autoSize(param1:Boolean) : void
      {
         if(this._autoSize != param1)
         {
            this._autoSize = param1;
            this.updateTextLines();
         }
      }
      
      public function get widthLimit() : Number
      {
         return this._widthLimit;
      }
      
      public function set widthLimit(param1:Number) : void
      {
         if(this._widthLimit != param1)
         {
            this._widthLimit = param1;
            this.updateTextLines();
         }
      }
      
      public function get heightLimit() : Number
      {
         return this._heightLimit;
      }
      
      public function set heightLimit(param1:Number) : void
      {
         if(this._heightLimit != param1)
         {
            this._heightLimit = param1;
            this.updateTextLines();
         }
      }
      
      public function get maxDisplayedLines() : int
      {
         return this._maxDisplayedLines;
      }
      
      public function set maxDisplayedLines(param1:int) : void
      {
         if(this._maxDisplayedLines != param1)
         {
            this._maxDisplayedLines = param1;
            this.updateTextLines();
         }
      }
      
      public function get renderedFontSize() : int
      {
         return this._renderedFontSize;
      }
      
      [Bindable(event="propertyChange")]
      public function get text() : String
      {
         return this._text;
      }
      
      private function set _3556653text(param1:String) : void
      {
         if(this._text != param1)
         {
            this._text = param1;
            this.updateTextLines();
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get textBold() : Boolean
      {
         return this._textBold;
      }
      
      private function set _1004169902textBold(param1:Boolean) : void
      {
         if(this._textBold != param1)
         {
            this._textBold = param1;
            this.updateTextLines();
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fontFamily() : String
      {
         return this._fontFamily;
      }
      
      private function set _1224696685fontFamily(param1:String) : void
      {
         if(this._fontFamily != param1)
         {
            this._fontFamily = param1;
            this.updateTextLines();
         }
      }
      
      public function get fontSize() : Number
      {
         return this._fontSize;
      }
      
      public function set fontSize(param1:Number) : void
      {
         if(this._fontSize != param1)
         {
            this._fontSize = param1;
            this.updateTextLines();
         }
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function set color(param1:uint) : void
      {
         if(this._color != param1)
         {
            this._color = param1;
            this.updateTextLines();
         }
      }
      
      public function get extraAscent() : Number
      {
         return this._extraAscent;
      }
      
      public function set extraAscent(param1:Number) : void
      {
         if(this._extraAscent != param1)
         {
            this._extraAscent = param1;
            this.updateTextLines();
         }
      }
      
      public function get autoUpdate() : Boolean
      {
         return this._autoUpdate;
      }
      
      public function set autoUpdate(param1:Boolean) : void
      {
         if(this._autoUpdate != param1)
         {
            this._autoUpdate = param1;
            if(this._autoUpdate && this._updatePending)
            {
               this.updateTextLines();
            }
         }
      }
      
      protected function init() : void
      {
         this._fontFamily = "";
         this._textBlock = new TextBlock();
         this._textLines = new Vector.<TextLine>();
         this._widthLimit = DEFAULT_LIMIT;
         this._heightLimit = DEFAULT_LIMIT;
         this._maxDisplayedLines = 1;
      }
      
      protected function updateTextLines() : void
      {
         var _loc1_:* = false;
         if(this._autoUpdate)
         {
            _loc1_ = !this._autoSize;
            this._renderedFontSize = this._fontSize;
            do
            {
               this.updateElementFormat();
               _loc1_ = Boolean(this.createText());
               if(!_loc1_)
               {
                  this._renderedFontSize--;
               }
            }
            while(!_loc1_);
            
         }
         else
         {
            this._updatePending = true;
         }
      }
      
      protected function updateElementFormat() : void
      {
         this._elementFormat = new ElementFormat();
         var _loc1_:FontDescription = new FontDescription();
         _loc1_.fontName = this._fontFamily + ", _sans";
         _loc1_.fontWeight = !!this._textBold?FontWeight.BOLD:FontWeight.NORMAL;
         _loc1_.fontLookup = FontLookup.EMBEDDED_CFF;
         this._elementFormat.fontDescription = _loc1_;
         this._elementFormat.fontSize = this._renderedFontSize;
         this._elementFormat.color = this._color;
      }
      
      protected function clearText() : void
      {
         var _loc3_:TextLine = null;
         var _loc1_:int = this._textLines.length;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = this._textLines[_loc2_];
            removeChild(_loc3_);
            TextLineRecycler.addLineForReuse(_loc3_);
            _loc2_++;
         }
         this._textLines.length = 0;
      }
      
      protected function createText() : Boolean
      {
         var _loc5_:TextLine = null;
         var _loc1_:Boolean = true;
         this.clearText();
         var _loc2_:TextElement = new TextElement(this._text,this._elementFormat);
         this._textBlock.content = _loc2_;
         this._contentHeight = 0;
         this._contentWidth = 0;
         var _loc3_:TextLine = null;
         this._numLines = 0;
         var _loc4_:Number = this._widthLimit;
         if(this._renderedFontSize == MIN_FONT_SIZE)
         {
            _loc4_ = DEFAULT_LIMIT;
         }
         while(true)
         {
            _loc5_ = TextLineRecycler.getLineForReuse();
            if(_loc5_)
            {
               _loc3_ = this._textBlock.recreateTextLine(_loc5_,_loc3_,_loc4_);
            }
            else
            {
               _loc3_ = this._textBlock.createTextLine(_loc3_,_loc4_);
            }
            if(this._textBlock.textLineCreationResult == TextLineCreationResult.COMPLETE)
            {
               break;
            }
            if(this._textBlock.textLineCreationResult != TextLineCreationResult.SUCCESS)
            {
               this._numLines = this._maxDisplayedLines + 1;
            }
            else
            {
               this._numLines++;
            }
            if(_loc3_)
            {
               _loc3_.x = 0;
               _loc3_.y = this._contentHeight + _loc3_.ascent + this._extraAscent;
               this._contentHeight = this._contentHeight + (_loc3_.textHeight + this._extraAscent);
               if(this._contentWidth < _loc3_.textWidth)
               {
                  this._contentWidth = _loc3_.textWidth;
               }
               this._textLines.push(_loc3_);
               addChild(_loc3_);
            }
            if(this._autoSize && this._renderedFontSize > MIN_FONT_SIZE)
            {
               if(this._contentHeight > this._heightLimit || this._numLines > this._maxDisplayedLines)
               {
                  _loc1_ = false;
                  break;
               }
            }
         }
         this._textBlock.releaseLineCreationData();
         return _loc1_;
      }
      
      private function releaseLinesFromTextBlock() : void
      {
         var _loc1_:TextLine = this._textBlock.firstLine;
         var _loc2_:TextLine = this._textBlock.lastLine;
         if(_loc1_)
         {
            this._textBlock.releaseLines(_loc1_,_loc2_);
         }
      }
      
      public function enableAutoSize(param1:Number, param2:Number = 100000, param3:int = 1) : void
      {
         this._autoSize = true;
         this._widthLimit = param1;
         this._heightLimit = param2;
         this._maxDisplayedLines = param3;
         this.updateTextLines();
      }
      
      public function disableAutoSize() : void
      {
         this._autoSize = false;
         this._widthLimit = DEFAULT_LIMIT;
         this._heightLimit = DEFAULT_LIMIT;
         this.updateTextLines();
      }
      
      override public function get width() : Number
      {
         return this._contentWidth;
      }
      
      override public function get height() : Number
      {
         return this._contentHeight;
      }
      
      public function set text(param1:String) : void
      {
         var _loc2_:Object = this.text;
         if(_loc2_ !== param1)
         {
            this._3556653text = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"text",_loc2_,param1));
            }
         }
      }
      
      public function set fontFamily(param1:String) : void
      {
         var _loc2_:Object = this.fontFamily;
         if(_loc2_ !== param1)
         {
            this._1224696685fontFamily = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fontFamily",_loc2_,param1));
            }
         }
      }
      
      public function set textBold(param1:Boolean) : void
      {
         var _loc2_:Object = this.textBold;
         if(_loc2_ !== param1)
         {
            this._1004169902textBold = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textBold",_loc2_,param1));
            }
         }
      }
   }
}
