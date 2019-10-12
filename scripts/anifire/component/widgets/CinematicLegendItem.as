package anifire.component.widgets
{
   import flash.display.Graphics;
   
   public class CinematicLegendItem extends WidgetLegendItem
   {
      
      public static const LEGEND_BULLET_RADIUS:Number = 4;
      
      public static const LEGEND_LABEL_OFFSET:Number = 4;
      
      public static const LEGEND_LINE_OFFSET:Number = 25;
       
      
      protected var _halfWidth:Number;
      
      public function CinematicLegendItem()
      {
         super();
      }
      
      public function get halfWidth() : Number
      {
         return this._halfWidth;
      }
      
      override protected function init() : void
      {
         super.init();
         _label.disableAutoSize();
      }
      
      override protected function updateLabelLayout() : void
      {
         this._halfWidth = Math.max(LEGEND_BULLET_RADIUS,_label.width * 0.5);
         _label.x = -this._halfWidth;
         _label.y = LEGEND_LABEL_OFFSET;
      }
      
      override public function draw() : void
      {
         var _loc1_:Graphics = graphics;
         _loc1_.clear();
         _loc1_.beginFill(_style.lineColor);
         _loc1_.drawCircle(0,LEGEND_LINE_OFFSET,LEGEND_BULLET_RADIUS);
         _loc1_.endFill();
      }
   }
}
