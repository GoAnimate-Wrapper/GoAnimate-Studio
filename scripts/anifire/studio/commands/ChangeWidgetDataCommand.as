package anifire.studio.commands
{
   import anifire.studio.core.Widget;
   
   public class ChangeWidgetDataCommand extends ChangeWidgetCommand
   {
       
      
      private var _newData:String;
      
      private var _oldData:String;
      
      public function ChangeWidgetDataCommand(param1:Widget, param2:String, param3:Boolean = true)
      {
         super(param1,param3);
         _type = "ChangeWidgetDataCommand";
         this._newData = param2;
         this._oldData = param1.generateData();
      }
      
      override public function execute() : void
      {
         var _loc1_:Widget = null;
         if(this._newData != this._oldData)
         {
            _loc1_ = this.asset as Widget;
            if(_loc1_)
            {
               super.execute();
               _loc1_.data = this._newData;
            }
         }
      }
      
      public function executeNow(param1:String) : void
      {
         this._newData = param1;
         this.execute();
      }
      
      override public function undo() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            _loc1_.data = this._oldData;
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            _loc1_.data = this._newData;
         }
         super.redo();
      }
   }
}
