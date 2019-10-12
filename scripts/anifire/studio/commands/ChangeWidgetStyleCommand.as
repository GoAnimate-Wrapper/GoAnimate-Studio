package anifire.studio.commands
{
   import anifire.models.widget.WidgetStyleModel;
   import anifire.studio.core.Widget;
   
   public class ChangeWidgetStyleCommand extends ChangeWidgetCommand
   {
       
      
      private var _newStyleName:String;
      
      private var _oldStyleName:String;
      
      private var _oldStyleModel:WidgetStyleModel;
      
      public function ChangeWidgetStyleCommand(param1:Widget, param2:String, param3:Boolean = true)
      {
         super(param1,param3);
         _type = "ChangeWidgetStyleCommand";
         this._newStyleName = param2;
      }
      
      override public function execute() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            super.execute();
            this._oldStyleName = _loc1_.layoutStyleName;
            this._oldStyleModel = _loc1_.styleModel.clone();
            _loc1_.changeLayoutProperties(this._newStyleName);
         }
      }
      
      override public function undo() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            _loc1_.styleModel = this._oldStyleModel;
            _loc1_.layoutStyleName = this._oldStyleName;
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            this._oldStyleName = _loc1_.layoutStyleName;
            this._oldStyleModel = _loc1_.styleModel.clone();
            _loc1_.changeLayoutProperties(this._newStyleName);
         }
         super.redo();
      }
   }
}
