package anifire.studio.components
{
   import anifire.event.ColorPaletteEvent;
   import anifire.studio.skins.DataGridRowToggleButtonSkin;
   import anifire.studio.skins.MiniColorPaletteDropDownSkin;
   import anifire.studio.skins.WidgetDataTextInputSkin;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import spark.components.HGroup;
   import spark.components.TextInput;
   import spark.components.ToggleButton;
   import spark.components.gridClasses.GridItemEditor;
   import spark.events.DropDownEvent;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class WidgetGridLabelEditor extends GridItemEditor implements IBindingClient
   {
      
      private static const SELECTED_BG_COLOR:uint = 16772042;
      
      private static const SELECTED_BORDER_COLOR:uint = 16762237;
      
      private static const TEXT_COLOR:uint = 5265775;
      
      private static const FONT_SIZE:Number = 10;
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _WidgetGridLabelEditor_SolidColor1:SolidColor;
      
      public var _WidgetGridLabelEditor_SolidColorStroke1:SolidColorStroke;
      
      private var _885706193colorPicker:ColorPaletteDropDown;
      
      private var _2117038804selectionHandle:ToggleButton;
      
      private var _1058056547textInput:TextInput;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _oldText:String;
      
      private var _oldColor:uint;
      
      private var _1526791168_colorPickerVisible:Boolean;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function WidgetGridLabelEditor()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._WidgetGridLabelEditor_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_WidgetGridLabelEditorWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return WidgetGridLabelEditor[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.clipAndEnableScrolling = true;
         this.mxmlContent = [this._WidgetGridLabelEditor_Rect1_c(),this._WidgetGridLabelEditor_HGroup1_c()];
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         WidgetGridLabelEditor._watcherSetupUtil = param1;
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      override public function setFocus() : void
      {
         this.textInput.setFocus();
      }
      
      protected function colorPicker_colorChangeHandler(param1:ColorPaletteEvent) : void
      {
         var _loc3_:ChartDataGrid = null;
         if(this._oldColor == this.colorPicker.selectedColor)
         {
            return;
         }
         var _loc2_:WidgetDataGridItem = data as WidgetDataGridItem;
         if(_loc2_)
         {
            _loc2_.color = this.colorPicker.selectedColor;
            _loc3_ = dataGrid as ChartDataGrid;
            if(_loc3_)
            {
               _loc3_.changeRowHeaderColor(rowIndex,!!this._colorPickerVisible?uint(this.colorPicker.selectedColor):uint(uint.MAX_VALUE));
            }
         }
      }
      
      protected function colorPicker_colorPreviewHandler(param1:ColorPaletteEvent) : void
      {
         var _loc3_:ChartDataGrid = null;
         if(this._oldColor == this.colorPicker.previewColor)
         {
            return;
         }
         var _loc2_:WidgetDataGridItem = data as WidgetDataGridItem;
         if(_loc2_)
         {
            _loc2_.color = this.colorPicker.previewColor;
            _loc3_ = dataGrid as ChartDataGrid;
            if(_loc3_)
            {
               _loc3_.previewRowHeaderColor(rowIndex,!!this._colorPickerVisible?uint(this.colorPicker.previewColor):uint(uint.MAX_VALUE));
            }
         }
      }
      
      override public function prepare() : void
      {
         super.prepare();
         this.textInput.text = this.value as String;
         this._oldText = this.textInput.text;
         if(this.data is WidgetDataGridItem)
         {
            this.colorPicker.selectedColor = WidgetDataGridItem(this.data).color;
            this._oldColor = WidgetDataGridItem(this.data).color;
            this._colorPickerVisible = WidgetDataGridItem(this.data).colorPickerVisible;
         }
         if(this.dataGrid is ChartDataGrid && ChartDataGrid(this.dataGrid).shouldOpenColorPicker)
         {
            this.colorPicker.openDropDown();
         }
      }
      
      override public function discard() : void
      {
         super.discard();
         if(this.dataGrid is ChartDataGrid)
         {
            ChartDataGrid(this.dataGrid).shouldOpenColorPicker = false;
         }
      }
      
      override public function save() : Boolean
      {
         var _loc1_:ChartDataGrid = dataGrid as ChartDataGrid;
         if(_loc1_)
         {
            _loc1_.contentChanged = false;
         }
         if(this._oldText == this.textInput.text && this._oldColor == this.colorPicker.selectedColor)
         {
            return true;
         }
         if(this.data is WidgetDataGridItem)
         {
            WidgetDataGridItem(this.data).label = this.textInput.text;
            WidgetDataGridItem(this.data).color = this.colorPicker.selectedColor;
            if(_loc1_)
            {
               _loc1_.contentChanged = true;
            }
         }
         return true;
      }
      
      protected function selectionHandle_clickHandler(param1:MouseEvent) : void
      {
         if(this.dataGrid)
         {
            this.dataGrid.endItemEditorSession(this._oldText == this.textInput.text && this._oldColor == this.colorPicker.selectedColor);
         }
         this.selectRow();
      }
      
      private function selectRow() : void
      {
         if(this.dataGrid is ChartDataGrid)
         {
            ChartDataGrid(this.dataGrid).updateSelectedRowIndex(this.rowIndex);
         }
      }
      
      protected function colorPicker_closeHandler(param1:DropDownEvent) : void
      {
         this.textInput.setFocus();
      }
      
      protected function colorPicker_mouseDownHandler(param1:MouseEvent) : void
      {
         ChartDataGrid(this.dataGrid).shouldOpenColorPicker = true;
      }
      
      private function _WidgetGridLabelEditor_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 10;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.right = 0;
         _loc1_.fill = this._WidgetGridLabelEditor_SolidColor1_i();
         _loc1_.stroke = this._WidgetGridLabelEditor_SolidColorStroke1_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _WidgetGridLabelEditor_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         this._WidgetGridLabelEditor_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_WidgetGridLabelEditor_SolidColor1",this._WidgetGridLabelEditor_SolidColor1);
         return _loc1_;
      }
      
      private function _WidgetGridLabelEditor_SolidColorStroke1_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         this._WidgetGridLabelEditor_SolidColorStroke1 = _loc1_;
         BindingManager.executeBindings(this,"_WidgetGridLabelEditor_SolidColorStroke1",this._WidgetGridLabelEditor_SolidColorStroke1);
         return _loc1_;
      }
      
      private function _WidgetGridLabelEditor_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.left = 0;
         _loc1_.right = 5;
         _loc1_.gap = 5;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._WidgetGridLabelEditor_ToggleButton1_i(),this._WidgetGridLabelEditor_TextInput1_i(),this._WidgetGridLabelEditor_ColorPaletteDropDown1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _WidgetGridLabelEditor_ToggleButton1_i() : ToggleButton
      {
         var _loc1_:ToggleButton = new ToggleButton();
         _loc1_.percentHeight = 100;
         _loc1_.width = 10;
         _loc1_.buttonMode = true;
         _loc1_.setStyle("skinClass",DataGridRowToggleButtonSkin);
         _loc1_.addEventListener("click",this.__selectionHandle_click);
         _loc1_.id = "selectionHandle";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.selectionHandle = _loc1_;
         BindingManager.executeBindings(this,"selectionHandle",this.selectionHandle);
         return _loc1_;
      }
      
      public function __selectionHandle_click(param1:MouseEvent) : void
      {
         this.selectionHandle_clickHandler(param1);
      }
      
      private function _WidgetGridLabelEditor_TextInput1_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.percentWidth = 100;
         _loc1_.maxChars = 500;
         _loc1_.setStyle("borderVisible",false);
         _loc1_.setStyle("skinClass",WidgetDataTextInputSkin);
         _loc1_.id = "textInput";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.textInput = _loc1_;
         BindingManager.executeBindings(this,"textInput",this.textInput);
         return _loc1_;
      }
      
      private function _WidgetGridLabelEditor_ColorPaletteDropDown1_i() : ColorPaletteDropDown
      {
         var _loc1_:ColorPaletteDropDown = new ColorPaletteDropDown();
         _loc1_.width = 10;
         _loc1_.height = 10;
         _loc1_.setStyle("skinClass",MiniColorPaletteDropDownSkin);
         _loc1_.addEventListener("colorChange",this.__colorPicker_colorChange);
         _loc1_.addEventListener("colorPreview",this.__colorPicker_colorPreview);
         _loc1_.addEventListener("close",this.__colorPicker_close);
         _loc1_.addEventListener("mouseDown",this.__colorPicker_mouseDown);
         _loc1_.id = "colorPicker";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.colorPicker = _loc1_;
         BindingManager.executeBindings(this,"colorPicker",this.colorPicker);
         return _loc1_;
      }
      
      public function __colorPicker_colorChange(param1:ColorPaletteEvent) : void
      {
         this.colorPicker_colorChangeHandler(param1);
      }
      
      public function __colorPicker_colorPreview(param1:ColorPaletteEvent) : void
      {
         this.colorPicker_colorPreviewHandler(param1);
      }
      
      public function __colorPicker_close(param1:DropDownEvent) : void
      {
         this.colorPicker_closeHandler(param1);
      }
      
      public function __colorPicker_mouseDown(param1:MouseEvent) : void
      {
         this.colorPicker_mouseDownHandler(param1);
      }
      
      private function _WidgetGridLabelEditor_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():uint
         {
            return SELECTED_BG_COLOR;
         },null,"_WidgetGridLabelEditor_SolidColor1.color");
         result[1] = new Binding(this,function():uint
         {
            return SELECTED_BORDER_COLOR;
         },null,"_WidgetGridLabelEditor_SolidColorStroke1.color");
         result[2] = new Binding(this,function():uint
         {
            return TEXT_COLOR;
         },function(param1:uint):void
         {
            textInput.setStyle("color",param1);
         },"textInput.color");
         result[3] = new Binding(this,function():Number
         {
            return FONT_SIZE;
         },function(param1:Number):void
         {
            textInput.setStyle("fontSize",param1);
         },"textInput.fontSize");
         result[4] = new Binding(this,function():uint
         {
            return SELECTED_BG_COLOR;
         },function(param1:uint):void
         {
            textInput.setStyle("contentBackgroundColor",param1);
         },"textInput.contentBackgroundColor");
         result[5] = new Binding(this,function():Boolean
         {
            return _colorPickerVisible;
         },null,"colorPicker.visible");
         result[6] = new Binding(this,function():Boolean
         {
            return _colorPickerVisible;
         },null,"colorPicker.includeInLayout");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get colorPicker() : ColorPaletteDropDown
      {
         return this._885706193colorPicker;
      }
      
      public function set colorPicker(param1:ColorPaletteDropDown) : void
      {
         var _loc2_:Object = this._885706193colorPicker;
         if(_loc2_ !== param1)
         {
            this._885706193colorPicker = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"colorPicker",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get selectionHandle() : ToggleButton
      {
         return this._2117038804selectionHandle;
      }
      
      public function set selectionHandle(param1:ToggleButton) : void
      {
         var _loc2_:Object = this._2117038804selectionHandle;
         if(_loc2_ !== param1)
         {
            this._2117038804selectionHandle = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"selectionHandle",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get textInput() : TextInput
      {
         return this._1058056547textInput;
      }
      
      public function set textInput(param1:TextInput) : void
      {
         var _loc2_:Object = this._1058056547textInput;
         if(_loc2_ !== param1)
         {
            this._1058056547textInput = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textInput",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _colorPickerVisible() : Boolean
      {
         return this._1526791168_colorPickerVisible;
      }
      
      private function set _colorPickerVisible(param1:Boolean) : void
      {
         var _loc2_:Object = this._1526791168_colorPickerVisible;
         if(_loc2_ !== param1)
         {
            this._1526791168_colorPickerVisible = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_colorPickerVisible",_loc2_,param1));
            }
         }
      }
   }
}
