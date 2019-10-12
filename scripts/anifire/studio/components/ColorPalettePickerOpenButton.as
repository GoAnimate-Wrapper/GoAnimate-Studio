package anifire.studio.components
{
   import anifire.studio.models.ColorPaletteModel;
   import spark.components.Button;
   
   public class ColorPalettePickerOpenButton extends Button
   {
       
      
      [SkinPart(required="false")]
      public var palette:ColorPalette;
      
      private var _colorPaletteModel:ColorPaletteModel;
      
      private var _colorPaletteModelChanged:Boolean;
      
      public function ColorPalettePickerOpenButton()
      {
         super();
      }
      
      override protected function commitProperties() : void
      {
         super.commitProperties();
         if(this._colorPaletteModelChanged && this.palette)
         {
            this._colorPaletteModelChanged = false;
            this.palette.colorPaletteModel = this._colorPaletteModel;
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this.palette)
         {
            this.palette.colorPaletteModel = this._colorPaletteModel;
         }
      }
      
      public function set colorPaletteModel(param1:ColorPaletteModel) : void
      {
         if(this._colorPaletteModel != param1)
         {
            this._colorPaletteModel = param1;
            this._colorPaletteModelChanged = true;
            invalidateProperties();
         }
      }
   }
}
