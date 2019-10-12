package anifire.component.widgets
{
   public class CinematicChartPart extends WidgetPart
   {
       
      
      protected var _rangeIndex:int;
      
      public function CinematicChartPart()
      {
         super();
      }
      
      public function get rangeIndex() : int
      {
         return this._rangeIndex;
      }
      
      public function set rangeIndex(param1:int) : void
      {
         if(this._rangeIndex != param1)
         {
            this._rangeIndex = param1;
            _invalidateFlag = true;
         }
      }
   }
}
