package anifire.studio.components
{
   import anifire.studio.models.ColorPaletteModel;
   import anifire.studio.skins.ColorPalettePickerSkin;
   import mx.collections.ArrayCollection;
   import mx.collections.IList;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.components.List;
   import spark.events.DropDownEvent;
   import spark.events.IndexChangeEvent;
   
   public class ColorPalettePicker extends spark.components.DropDownList
   {
       
      
      [SkinPart(required="false")]
      public var singleColorList:List;
      
      [SkinPart(required="false")]
      public var singleColorSection:Group;
      
      [SkinPart(required="false")]
      public var nonSingleColorSection:Group;
      
      private var _selectedColorPalette:ColorPaletteModel;
      
      private var _selectedColorPaletteChanged:Boolean;
      
      private var _pickerButton:ColorPalettePickerOpenButton;
      
      private var _164589591_singleColorDataProvider:ArrayCollection;
      
      private var _384042648_nonSingleColorDataProvider:ArrayCollection;
      
      public function ColorPalettePicker()
      {
         super();
         addEventListener(DropDownEvent.OPEN,this.openHandler);
         addEventListener(IndexChangeEvent.CHANGE,this.indexChangeHandler);
         setStyle("skinClass",ColorPalettePickerSkin);
      }
      
      private function openHandler(param1:DropDownEvent) : void
      {
         selectedIndex = -1;
      }
      
      private function indexChangeHandler(param1:IndexChangeEvent) : void
      {
         this.selectedColorPalette = this.selectedItem as ColorPaletteModel;
      }
      
      private function onSingleColorDataGroup_indexChangeHandler(param1:IndexChangeEvent) : void
      {
         this.selectedItem = this.singleColorList.selectedItem as ColorPaletteModel;
         this.closeDropDown(true);
         this.dispatchEvent(new IndexChangeEvent(IndexChangeEvent.CHANGE));
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == openButton)
         {
            this._pickerButton = openButton as ColorPalettePickerOpenButton;
            if(this._pickerButton)
            {
               this._pickerButton.colorPaletteModel = this._selectedColorPalette;
            }
         }
         else if(param2 == this.singleColorList)
         {
            this.singleColorList.dataProvider = this._singleColorDataProvider;
            this.singleColorList.addEventListener(IndexChangeEvent.CHANGE,this.onSingleColorDataGroup_indexChangeHandler);
         }
         else if(param2 == this.singleColorSection)
         {
            if(this._singleColorDataProvider)
            {
               this.singleColorSection.visible = this.singleColorSection.includeInLayout = this._singleColorDataProvider.length > 0;
            }
         }
         else if(param2 == this.nonSingleColorSection)
         {
            if(this.dataProvider)
            {
               this.nonSingleColorSection.visible = this.nonSingleColorSection.includeInLayout = this.dataProvider.length > 0;
            }
         }
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         super.partRemoved(param1,param2);
         if(param2 == openButton)
         {
            if(this._pickerButton)
            {
               this._pickerButton.colorPaletteModel = null;
            }
         }
         else if(param2 == this.singleColorList)
         {
            this.singleColorList.dataProvider = null;
            this.singleColorList.removeEventListener(IndexChangeEvent.CHANGE,this.onSingleColorDataGroup_indexChangeHandler);
         }
      }
      
      override public function set dataProvider(param1:IList) : void
      {
         if(param1 is ArrayCollection)
         {
            this._singleColorDataProvider = new ArrayCollection(param1.toArray());
            this._singleColorDataProvider.filterFunction = this.filterForSingleColor;
            this._singleColorDataProvider.refresh();
            if(this.singleColorList)
            {
               this.singleColorList.dataProvider = this._singleColorDataProvider;
            }
            if(this.singleColorSection)
            {
               this.singleColorSection.visible = this._singleColorDataProvider.length > 0;
            }
            this._nonSingleColorDataProvider = new ArrayCollection(param1.toArray());
            this._nonSingleColorDataProvider.filterFunction = this.filterForNonSingleColor;
            this._nonSingleColorDataProvider.refresh();
            super.dataProvider = this._nonSingleColorDataProvider;
            if(this.nonSingleColorSection)
            {
               this.nonSingleColorSection.visible = this.nonSingleColorSection.includeInLayout = this._nonSingleColorDataProvider.length > 0;
            }
         }
      }
      
      private function filterForNonSingleColor(param1:Object) : Boolean
      {
         var _loc2_:ColorPaletteModel = param1 as ColorPaletteModel;
         return _loc2_ && !_loc2_.isSingle;
      }
      
      private function filterForSingleColor(param1:Object) : Boolean
      {
         var _loc2_:ColorPaletteModel = param1 as ColorPaletteModel;
         return _loc2_ && _loc2_.isSingle;
      }
      
      override protected function commitProperties() : void
      {
         super.commitProperties();
         if(this._selectedColorPaletteChanged && this._pickerButton)
         {
            this._selectedColorPaletteChanged = false;
            this._pickerButton.colorPaletteModel = this._selectedColorPalette;
         }
      }
      
      public function get selectedColorPalette() : ColorPaletteModel
      {
         return this._selectedColorPalette;
      }
      
      public function set selectedColorPalette(param1:ColorPaletteModel) : void
      {
         if(this._selectedColorPalette != param1)
         {
            this._selectedColorPalette = param1;
            this._selectedColorPaletteChanged = true;
            invalidateProperties();
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _singleColorDataProvider() : ArrayCollection
      {
         return this._164589591_singleColorDataProvider;
      }
      
      private function set _singleColorDataProvider(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._164589591_singleColorDataProvider;
         if(_loc2_ !== param1)
         {
            this._164589591_singleColorDataProvider = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_singleColorDataProvider",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _nonSingleColorDataProvider() : ArrayCollection
      {
         return this._384042648_nonSingleColorDataProvider;
      }
      
      private function set _nonSingleColorDataProvider(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._384042648_nonSingleColorDataProvider;
         if(_loc2_ !== param1)
         {
            this._384042648_nonSingleColorDataProvider = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_nonSingleColorDataProvider",_loc2_,param1));
            }
         }
      }
   }
}
