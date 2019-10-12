package anifire.studio.components
{
   import anifire.studio.models.ColorPaletteModel;
   import anifire.studio.skins.ColorPaletteSkin;
   import mx.collections.ArrayCollection;
   import spark.components.DataGroup;
   import spark.components.supportClasses.SkinnableComponent;
   
   public class ColorPalette extends SkinnableComponent
   {
       
      
      [SkinPart(required="true")]
      public var dataGroup:DataGroup;
      
      private var _colorList:ArrayCollection;
      
      private var _colorPaletteModel:ColorPaletteModel;
      
      private var _colorPaletteModelChanged:Boolean;
      
      private var _maxColor:uint = 12;
      
      public function ColorPalette()
      {
         this._colorList = new ArrayCollection();
         super();
         setStyle("skinClass",ColorPaletteSkin);
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this.dataGroup)
         {
            this.dataGroup.dataProvider = this._colorList;
         }
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         super.partRemoved(param1,param2);
         if(param2 == this.dataGroup)
         {
            this.dataGroup.dataProvider = null;
         }
      }
      
      override protected function commitProperties() : void
      {
         var _loc1_:uint = 0;
         super.commitProperties();
         if(this._colorPaletteModelChanged && this.dataGroup)
         {
            this._colorPaletteModelChanged = false;
            this._colorList.removeAll();
            if(this._colorPaletteModel)
            {
               _loc1_ = 0;
               while(_loc1_ < this._maxColor)
               {
                  this._colorList.addItem(this._colorPaletteModel.getDisplayedColorAt(_loc1_));
                  _loc1_++;
               }
            }
            this.dataGroup.dataProvider = this._colorList;
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
      
      public function set maxColor(param1:uint) : void
      {
         if(this._maxColor != param1)
         {
            this._maxColor = param1;
            this._colorPaletteModelChanged = true;
            invalidateProperties();
         }
      }
   }
}
