package anifire.component.widgets
{
   import flash.display.Graphics;
   
   public class WidgetLegendItem extends WidgetPart
   {
      
      public static const LEGEND_ITEM_BLOCK_SIZE:Number = 15;
      
      public static const LEGEND_ITEM_BLOCK_CORNER_RADIUS:Number = 2;
      
      public static const LEGEND_ITEM_TEXT_PADDING:Number = 20;
      
      public static const LEGEND_ITEM_TEXT_LAYOUT_WIDTH:Number = 40;
      
      public static const LEGEND_ITEM_HEIGHT:Number = 20;
      
      public static const ANIMATION_OFFSET:Number = -5;
       
      
      protected var _labelOffset:Number;
      
      public function WidgetLegendItem()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         _label = new WidgetLabel();
         _label.enableAutoSize(LEGEND_ITEM_TEXT_LAYOUT_WIDTH);
         addChild(_label);
      }
      
      override protected function updateLabelLayout() : void
      {
         var _loc1_:Number = ANIMATION_OFFSET * (1 - _widgetMaker.easeOutBack(_animationFactor));
         _label.x = _bounds.x + LEGEND_ITEM_TEXT_PADDING + _loc1_;
         _label.y = _bounds.y + (_bounds.height - _label.height) * 0.5;
         _label.alpha = _animationFactor;
      }
      
      override public function draw() : void
      {
         var _loc1_:Graphics = graphics;
         _loc1_.clear();
         _loc1_.beginFill(_style.getColorByIndex(_itemIndex));
         _loc1_.drawRoundRect(_bounds.x,_bounds.y + (_bounds.height - LEGEND_ITEM_BLOCK_SIZE) * 0.5,LEGEND_ITEM_BLOCK_SIZE,LEGEND_ITEM_BLOCK_SIZE,LEGEND_ITEM_BLOCK_CORNER_RADIUS,LEGEND_ITEM_BLOCK_CORNER_RADIUS);
         _loc1_.endFill();
      }
   }
}
