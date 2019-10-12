package anifire.studio.commands
{
   import anifire.studio.core.Widget;
   
   public class ChangeWidgetValueLabelDisplayOptionCommand extends ChangeWidgetCommand
   {
       
      
      private var _isNewVisible:Boolean;
      
      private var _isOldVisible:Boolean;
      
      private var _isRadio:Boolean;
      
      public function ChangeWidgetValueLabelDisplayOptionCommand(param1:Widget, param2:Boolean, param3:Boolean = true, param4:Boolean = false)
      {
         super(param1,param3);
         _type = "ChangeWidgetValueLabelDisplayOptionCommand";
         this._isNewVisible = param2;
         this._isRadio = param4;
         this._isOldVisible = param1.displayValueLabel;
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
               _loc1_.displayValueLabel = this._isNewVisible;
               if(this._isRadio)
               {
                  _loc1_.displayInPercentage = !this._isNewVisible;
               }
            }
         }
      }
      
      override public function undo() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            _loc1_.displayValueLabel = this._isOldVisible;
            if(this._isRadio)
            {
               _loc1_.displayInPercentage = !this._isOldVisible;
            }
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            _loc1_.displayValueLabel = this._isNewVisible;
            if(this._isRadio)
            {
               _loc1_.displayInPercentage = !this._isNewVisible;
            }
         }
         super.redo();
      }
   }
}
