package anifire.studio.commands
{
   import anifire.studio.core.Widget;
   
   public class ChangeChartDataCommand extends ChangeWidgetCommand
   {
       
      
      private var _newData:String;
      
      private var _oldData:String;
      
      private var _colorCommand:ChangeWidgetColorSetCommand;
      
      public function ChangeChartDataCommand(param1:Widget, param2:String, param3:Array = null, param4:Boolean = true)
      {
         super(param1,param4);
         _type = "ChangeChartDataCommand";
         this._newData = param2;
         this._oldData = param1.generateData();
         if(param3)
         {
            this._colorCommand = new ChangeWidgetColorSetCommand(param1,param3,false);
         }
      }
      
      override public function execute() : void
      {
         var _loc1_:Widget = null;
         if(this._newData != this._oldData || this._colorCommand)
         {
            _loc1_ = this.asset as Widget;
            if(_loc1_)
            {
               super.execute();
               if(this._newData != this._oldData)
               {
                  _loc1_.data = this._newData;
               }
            }
            if(this._colorCommand)
            {
               this._colorCommand.execute();
            }
         }
      }
      
      public function executeNow(param1:String, param2:Array = null) : void
      {
         this._newData = param1;
         var _loc3_:Widget = this.asset as Widget;
         if(_loc3_ && param2)
         {
            this._colorCommand = new ChangeWidgetColorSetCommand(_loc3_,param2,false);
         }
         this.execute();
      }
      
      override public function undo() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            _loc1_.data = this._oldData;
         }
         if(this._colorCommand)
         {
            this._colorCommand.undo();
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
         if(this._colorCommand)
         {
            this._colorCommand.redo();
         }
         super.redo();
      }
   }
}
