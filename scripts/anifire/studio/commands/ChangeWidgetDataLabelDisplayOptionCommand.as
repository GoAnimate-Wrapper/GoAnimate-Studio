package anifire.studio.commands
{
   import anifire.studio.core.Widget;
   
   public class ChangeWidgetDataLabelDisplayOptionCommand extends ChangeWidgetCommand
   {
       
      
      private var _isNewVisible:Boolean;
      
      private var _isOldVisible:Boolean;
      
      public function ChangeWidgetDataLabelDisplayOptionCommand(param1:Widget, param2:Boolean, param3:Boolean = true)
      {
         super(param1,param3);
         _type = "ChangeWidgetDataLabelDisplayOptionCommand";
         this._isNewVisible = param2;
         this._isOldVisible = param1.displayDataLabel;
      }
      
      override public function execute() : void
      {
         var _loc1_:Widget = null;
         if(this._isNewVisible != this._isOldVisible)
         {
            _loc1_ = this.asset as Widget;
            if(_loc1_)
            {
               super.execute();
               _loc1_.displayDataLabel = this._isNewVisible;
            }
         }
      }
      
      override public function undo() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            _loc1_.displayDataLabel = this._isOldVisible;
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            _loc1_.displayDataLabel = this._isNewVisible;
         }
         super.redo();
      }
   }
}
