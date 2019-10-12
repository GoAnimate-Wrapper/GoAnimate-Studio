package anifire.component.widgets
{
   import flash.geom.Rectangle;
   
   public class WidgetBasePart extends WidgetPart
   {
       
      
      protected var _contentBounds:Rectangle;
      
      protected var _legendPart:WidgetLegendPart;
      
      public function WidgetBasePart()
      {
         super();
      }
      
      public function get legendPart() : WidgetLegendPart
      {
         return this._legendPart;
      }
      
      public function get contentBounds() : Rectangle
      {
         return this._contentBounds;
      }
      
      public function set contentBounds(param1:Rectangle) : void
      {
         this._contentBounds = param1;
         if(this._legendPart)
         {
            this._legendPart.updateLayout();
         }
         _invalidateFlag = true;
      }
      
      override public function set text(param1:String) : void
      {
         super.text = param1;
         _invalidateFlag = true;
      }
      
      override protected function init() : void
      {
         super.init();
         _label = new WidgetLabel();
         addChild(_label);
         _invalidateFlag = true;
      }
      
      override protected function updateLabelFormat() : void
      {
         _label.autoUpdate = false;
         _label.fontFamily = _style.font;
         _label.fontSize = _style.titleSize;
         _label.color = _style.titleColor;
         _label.textBold = _style.titleBold;
         _label.autoUpdate = true;
      }
      
      public function updateLegend(param1:Vector.<String>) : void
      {
         if(this._legendPart)
         {
            this._legendPart.rangeNames = param1;
            _invalidateFlag = true;
         }
      }
      
      override public function set widgetMaker(param1:WidgetMaker) : void
      {
         super.widgetMaker = param1;
         if(this._legendPart)
         {
            this._legendPart.widgetMaker = _widgetMaker;
         }
      }
      
      override public function validate() : void
      {
         super.validate();
         if(this._legendPart)
         {
            this._legendPart.validate();
         }
      }
      
      override public function updateStyle() : void
      {
         super.updateStyle();
         if(this._legendPart)
         {
            this._legendPart.updateStyle();
         }
      }
      
      override public function set animationFactor(param1:Number) : void
      {
         super.animationFactor = param1;
         if(this._legendPart)
         {
            this._legendPart.animationFactor = param1;
         }
      }
   }
}
