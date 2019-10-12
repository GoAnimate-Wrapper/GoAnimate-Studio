package anifire.studio.commands
{
   import anifire.studio.core.Widget;
   
   public class ChangeWidgetSelectedYearCommand extends ChangeWidgetCommand
   {
       
      
      private var _newYear:int;
      
      private var _oldYear:int;
      
      public function ChangeWidgetSelectedYearCommand(param1:Widget, param2:int, param3:Boolean = true)
      {
         super(param1,param3);
         _type = "ChangeWidgetSelectedYearCommand";
         this._newYear = param2;
         this._oldYear = param1.selectedYear;
      }
      
      override public function execute() : void
      {
         var _loc1_:Widget = null;
         if(this._newYear != this._oldYear)
         {
            _loc1_ = this.asset as Widget;
            if(_loc1_)
            {
               super.execute();
               _loc1_.selectedYear = this._newYear;
            }
         }
      }
      
      override public function undo() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            _loc1_.selectedYear = this._oldYear;
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            _loc1_.selectedYear = this._newYear;
         }
         super.redo();
      }
   }
}
