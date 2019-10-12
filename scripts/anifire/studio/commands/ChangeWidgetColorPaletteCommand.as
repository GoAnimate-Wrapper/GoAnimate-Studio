package anifire.studio.commands
{
   import anifire.studio.core.Widget;
   import anifire.studio.models.ColorPaletteModel;
   
   public class ChangeWidgetColorPaletteCommand extends ChangeWidgetCommand
   {
       
      
      private var _newPalette:ColorPaletteModel;
      
      private var _oldPalette:ColorPaletteModel;
      
      public function ChangeWidgetColorPaletteCommand(param1:Widget, param2:ColorPaletteModel, param3:Boolean = true)
      {
         super(param1,param3);
         _type = "ChangeWidgetColorPaletteCommand";
         this._newPalette = param2;
         this._oldPalette = new ColorPaletteModel();
         this._oldPalette.initByStyleModel(param1.styleModel);
      }
      
      override public function execute() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            super.execute();
            _loc1_.changeColorPalette(this._newPalette);
         }
      }
      
      override public function undo() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            _loc1_.changeColorPalette(this._oldPalette);
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            _loc1_.changeColorPalette(this._newPalette);
         }
         super.redo();
      }
   }
}
