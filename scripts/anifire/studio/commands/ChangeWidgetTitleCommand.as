package anifire.studio.commands
{
   import anifire.studio.core.Widget;
   
   public class ChangeWidgetTitleCommand extends ChangeWidgetCommand
   {
       
      
      private var _newTitle:String;
      
      private var _oldTitle:String;
      
      public function ChangeWidgetTitleCommand(param1:Widget, param2:String, param3:Boolean = true)
      {
         super(param1,param3);
         _type = "ChangeWidgetTitleCommand";
         this._newTitle = param2;
         this._oldTitle = param1.title;
      }
      
      public function executeNow(param1:String) : void
      {
         var _loc2_:Widget = null;
         this._newTitle = param1;
         if(this._newTitle != this._oldTitle)
         {
            _loc2_ = this.asset as Widget;
            if(_loc2_)
            {
               this.execute();
               _loc2_.title = this._newTitle;
            }
         }
      }
      
      override public function undo() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            _loc1_.title = this._oldTitle;
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            _loc1_.title = this._newTitle;
         }
         super.redo();
      }
   }
}
