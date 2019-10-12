package anifire.component.widgets
{
   import anifire.models.widget.WidgetStyleModel;
   import flash.display.Sprite;
   import flash.geom.Rectangle;
   
   public class WidgetPart extends Sprite
   {
       
      
      protected var _invalidateFlag:Boolean;
      
      protected var _style:WidgetStyleModel;
      
      protected var _prevPart:WidgetPart;
      
      protected var _nextPart:WidgetPart;
      
      protected var _loading:Boolean;
      
      protected var _animationFactor:Number;
      
      protected var _widgetMaker:WidgetMaker;
      
      protected var _itemIndex:int;
      
      protected var _bounds:Rectangle;
      
      protected var _label:WidgetLabel;
      
      protected var _valueLabel:WidgetLabel;
      
      protected var _valueLabels:Vector.<WidgetLabel>;
      
      protected var _text:String;
      
      protected var _values:Vector.<Number>;
      
      protected var _numRanges:int;
      
      protected var _cumulatedValue:Number;
      
      protected var _extraData;
      
      public function WidgetPart()
      {
         super();
         this.init();
      }
      
      public function get prevPart() : WidgetPart
      {
         return this._prevPart;
      }
      
      public function set prevPart(param1:WidgetPart) : void
      {
         this._prevPart = param1;
      }
      
      public function get nextPart() : WidgetPart
      {
         return this._nextPart;
      }
      
      public function set nextPart(param1:WidgetPart) : void
      {
         this._nextPart = param1;
      }
      
      public function get loading() : Boolean
      {
         return this._loading;
      }
      
      public function set loading(param1:Boolean) : void
      {
         if(this._loading != param1)
         {
            this._loading = param1;
         }
         this.updateLoadingState();
      }
      
      public function get animationFactor() : Number
      {
         return this._animationFactor;
      }
      
      public function set animationFactor(param1:Number) : void
      {
         this._animationFactor = param1;
         this._invalidateFlag = true;
      }
      
      public function get widgetMaker() : WidgetMaker
      {
         return this._widgetMaker;
      }
      
      public function set widgetMaker(param1:WidgetMaker) : void
      {
         this._widgetMaker = param1;
         if(this._widgetMaker)
         {
            this._style = this._widgetMaker.styleModel;
            this.updateLabelFormat();
         }
      }
      
      public function get itemIndex() : int
      {
         return this._itemIndex;
      }
      
      public function set itemIndex(param1:int) : void
      {
         this._itemIndex = param1;
         this._invalidateFlag = true;
      }
      
      public function get bounds() : Rectangle
      {
         return this._bounds;
      }
      
      public function set bounds(param1:Rectangle) : void
      {
         this._bounds = param1;
         this._invalidateFlag = true;
      }
      
      public function updateBounds(param1:Number, param2:Number, param3:Number, param4:Number) : void
      {
         if(!this._bounds)
         {
            this._bounds = new Rectangle();
         }
         this._bounds.x = param1;
         this._bounds.y = param2;
         this._bounds.width = param3;
         this._bounds.height = param4;
         this._invalidateFlag = true;
      }
      
      public function get text() : String
      {
         return this._text;
      }
      
      public function set text(param1:String) : void
      {
         this._text = param1;
         if(this._label)
         {
            this._label.text = param1;
         }
         this._invalidateFlag = true;
      }
      
      public function get values() : Vector.<Number>
      {
         return this._values;
      }
      
      public function set values(param1:Vector.<Number>) : void
      {
         this._values = param1;
         this._numRanges = this._values.length;
         this._invalidateFlag = true;
      }
      
      public function get value() : Number
      {
         return this._values[0];
      }
      
      public function set value(param1:Number) : void
      {
         this._values[0] = param1;
         this._invalidateFlag = true;
      }
      
      public function getValueByRange(param1:int) : Number
      {
         if(param1 < 0 || param1 >= this._values.length)
         {
            param1 = 0;
         }
         return this._values[param1];
      }
      
      public function get cumulatedValue() : Number
      {
         return this._cumulatedValue;
      }
      
      public function set cumulatedValue(param1:Number) : void
      {
         this._cumulatedValue = param1;
         this._invalidateFlag = true;
      }
      
      public function set extraData(param1:*) : void
      {
         this._extraData = param1;
         this._invalidateFlag = true;
      }
      
      public function get extraData() : *
      {
         return this._extraData;
      }
      
      protected function init() : void
      {
         this._animationFactor = 1;
         this._text = "";
         this._values = new Vector.<Number>();
         this._values.push(0);
         this._numRanges = 1;
         this._style = new WidgetStyleModel();
      }
      
      protected function get drawColor() : uint
      {
         return this._style.getColorByIndex(this._itemIndex);
      }
      
      protected function updateLabelFormat() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:WidgetLabel = null;
         if(this._label)
         {
            this._label.autoUpdate = false;
            this._label.fontFamily = this._style.font;
            this._label.fontSize = this._style.dataSize;
            this._label.color = this._style.dataColor;
            this._label.textBold = this._style.dataBold;
            this._label.autoUpdate = true;
         }
         if(this._valueLabel)
         {
            this._valueLabel.autoUpdate = false;
            this._valueLabel.fontFamily = this._style.font;
            this._valueLabel.fontSize = this._style.valueSize;
            this._valueLabel.color = this._style.valueColor;
            this._valueLabel.textBold = this._style.valueBold;
            this._valueLabel.autoUpdate = true;
         }
         if(this._valueLabels)
         {
            _loc1_ = this._valueLabels.length;
            while(_loc2_ < _loc1_)
            {
               _loc3_ = this._valueLabels[_loc2_];
               _loc3_.autoUpdate = false;
               _loc3_.fontFamily = this._style.font;
               _loc3_.fontSize = this._style.valueSize;
               _loc3_.color = this._style.valueColor;
               _loc3_.textBold = this._style.valueBold;
               _loc3_.autoUpdate = true;
               _loc2_++;
            }
         }
      }
      
      protected function updateLabelLayout() : void
      {
      }
      
      public function invalidate() : void
      {
         this._invalidateFlag = true;
      }
      
      public function validate() : void
      {
         if(this._invalidateFlag)
         {
            this.draw();
            this.updateLabelLayout();
            this._invalidateFlag = false;
         }
      }
      
      public function draw() : void
      {
      }
      
      public function updateStyle() : void
      {
         this._style = this._widgetMaker.styleModel;
         this.updateLabelFormat();
         this._invalidateFlag = true;
      }
      
      protected function getAnimatedLabelText(param1:Number) : String
      {
         return this.getAnimatedLabelTextByRange(0,param1);
      }
      
      protected function getAnimatedLabelTextByRange(param1:int, param2:Number) : String
      {
         var _loc3_:Number = this.getValueByRange(param1) * param2;
         var _loc4_:String = this._widgetMaker.formatValue(_loc3_);
         if(this._widgetMaker.displayPercentageLabel && this._widgetMaker.displayValueLabel)
         {
            return _loc4_ + " (" + this.getPercentageLabelTextByRange(param1) + ")";
         }
         if(this._widgetMaker.displayPercentageLabel)
         {
            return this.getPercentageLabelTextByRange(param1);
         }
         return _loc4_;
      }
      
      protected function getLabelText() : String
      {
         return this.getLabelTextByRange(0);
      }
      
      protected function getLabelTextByRange(param1:int) : String
      {
         return this.getAnimatedLabelTextByRange(param1,this._animationFactor);
      }
      
      protected function getPercentageLabelText() : String
      {
         return this.getPercentageLabelTextByRange(0);
      }
      
      protected function getPercentageLabelTextByRange(param1:int) : String
      {
         var _loc2_:Number = this._animationFactor * this.getValueByRange(param1) / this._widgetMaker.totalValue * 100;
         return this._widgetMaker.formatValue(_loc2_) + "%";
      }
      
      protected function updateLoadingState() : void
      {
         if(this._label)
         {
            this._label.visible = !this._loading;
         }
         if(this._valueLabel)
         {
            this._valueLabel.visible = !this._loading;
         }
      }
   }
}
