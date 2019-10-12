package anifire.studio.components
{
   import anifire.event.ColorPaletteEvent;
   import anifire.studio.events.ChartDataGridEvent;
   import anifire.studio.skins.DataGridHeaderToggleButtonSkin;
   import anifire.studio.skins.MiniColorPaletteDropDownSkin;
   import anifire.studio.skins.WidgetDataTextInputSkin;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.TextInput;
   import spark.components.ToggleButton;
   import spark.components.VGroup;
   import spark.components.gridClasses.GridColumn;
   import spark.components.gridClasses.GridItemRenderer;
   import spark.events.DropDownEvent;
   import spark.events.GridItemEditorEvent;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class WidgetGridHeaderRenderer extends GridItemRenderer implements IBindingClient
   {
      
      private static const STATE_NORMAL:String = "normal";
      
      private static const STATE_EDITING:String = "editing";
      
      private static const BG_COLOR:uint = 16777215;
      
      private static const SELECTED_BG_COLOR:uint = 16772042;
      
      private static const SELECTED_BORDER_COLOR:uint = 16762237;
      
      private static const TEXT_COLOR:uint = 5265775;
      
      private static const FONT_SIZE:Number = 10;
      
      private static const COLOR_DISPLAY_WIDTH:Number = 7;
      
      private static const COLOR_DISPLAY_WIDTH_ON_ROLL_OVER:Number = 10;
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _WidgetGridHeaderRenderer_Rect2:Rect;
      
      public var _WidgetGridHeaderRenderer_SolidColor1:SolidColor;
      
      public var _WidgetGridHeaderRenderer_SolidColor2:SolidColor;
      
      public var _WidgetGridHeaderRenderer_SolidColor3:SolidColor;
      
      public var _WidgetGridHeaderRenderer_SolidColorStroke1:SolidColorStroke;
      
      private var _358089761colorDisplay:ColorDisplayGroup;
      
      private var _885706193colorPicker:ColorPaletteDropDown;
      
      private var _1307827859editor:Group;
      
      private var _494845757renderer:Group;
      
      private var _2117038804selectionHandle:ToggleButton;
      
      private var _1058056547textInput:TextInput;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _state:String = "normal";
      
      private var _1282089978_selected:Boolean;
      
      private var _oldValue:String;
      
      protected var _chartDataGrid:ChartDataGrid;
      
      private var _1480355228_color:uint;
      
      private var _oldColor:uint;
      
      private var _1526791168_colorPickerVisible:Boolean;
      
      private var _openColorPicker:Boolean;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function WidgetGridHeaderRenderer()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._WidgetGridHeaderRenderer_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_WidgetGridHeaderRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return WidgetGridHeaderRenderer[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._WidgetGridHeaderRenderer_VGroup1_c()];
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         WidgetGridHeaderRenderer._watcherSetupUtil = param1;
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
      
      public function setSelected(param1:Boolean) : void
      {
         this._selected = param1;
      }
      
      public function hideColorPicker() : void
      {
         this._colorPickerVisible = false;
      }
      
      protected function get chartDataGrid() : ChartDataGrid
      {
         return this._chartDataGrid;
      }
      
      protected function set chartDataGrid(param1:ChartDataGrid) : void
      {
         if(this._chartDataGrid != param1)
         {
            if(this._chartDataGrid)
            {
               this._chartDataGrid.removeEventListener(ChartDataGridEvent.COLUMN_SELECTION_CHANGE,this.dataGrid_columnSelectionChangeHandler);
               this._chartDataGrid.removeEventListener(GridItemEditorEvent.GRID_ITEM_EDITOR_SESSION_START,this.dataGrid_gridItemEditorSessionStartHandler);
            }
            this._chartDataGrid = param1;
            if(this._chartDataGrid)
            {
               this._chartDataGrid.addEventListener(ChartDataGridEvent.COLUMN_SELECTION_CHANGE,this.dataGrid_columnSelectionChangeHandler);
               this._chartDataGrid.addEventListener(GridItemEditorEvent.GRID_ITEM_EDITOR_SESSION_START,this.dataGrid_gridItemEditorSessionStartHandler);
            }
         }
      }
      
      override public function set column(param1:GridColumn) : void
      {
         super.column = param1;
         if(param1 && param1.grid)
         {
            this.chartDataGrid = column.grid.dataGrid as ChartDataGrid;
         }
         else
         {
            this.chartDataGrid = null;
         }
         if(param1 is WidgetRangeGridColumn)
         {
            this._color = WidgetRangeGridColumn(param1).color;
            this._oldColor = this._color;
            this._colorPickerVisible = WidgetRangeGridColumn(param1).colorPickerVisible;
         }
      }
      
      protected function startEditing() : void
      {
         if(this._state == STATE_NORMAL)
         {
            this.textInput.text = labelDisplay.text;
            this._oldValue = labelDisplay.text;
            callLater(this.setFocusToText);
            this.colorPicker.selectedColor = this._color;
            this._oldColor = this._color;
            if(this._openColorPicker)
            {
               this.colorPicker.openDropDown();
            }
            this.editor.visible = true;
            this.renderer.visible = false;
            this._state = STATE_EDITING;
         }
      }
      
      private function setFocusToText() : void
      {
         this.textInput.setFocus();
      }
      
      protected function endEditing() : void
      {
         if(this._state == STATE_EDITING)
         {
            this.save();
            this.editor.visible = false;
            this.renderer.visible = true;
            this._openColorPicker = false;
            this._state = STATE_NORMAL;
         }
      }
      
      private function save() : Boolean
      {
         if(this._oldValue == this.textInput.text && this._oldColor == this.colorPicker.selectedColor)
         {
            return false;
         }
         this.column.headerText = this.textInput.text;
         if(this.grid.dataGrid is ChartDataGrid)
         {
            ChartDataGrid(this.grid.dataGrid).endColumnHeaderEditorSession(this.columnIndex,this.textInput.text,!!this._colorPickerVisible?uint(this.colorPicker.selectedColor):uint(uint.MAX_VALUE));
            return true;
         }
         return false;
      }
      
      protected function editor_focusOutHandler(param1:FocusEvent) : void
      {
         if(!this._openColorPicker)
         {
            this.endEditing();
         }
      }
      
      protected function textInput_enterHandler(param1:FlexEvent) : void
      {
         this.endEditing();
      }
      
      private function selectColumn() : void
      {
         if(this.grid && this.grid.dataGrid is ChartDataGrid)
         {
            ChartDataGrid(this.grid.dataGrid).updateSelectedColumnIndex(this.columnIndex);
         }
      }
      
      private function deselectColumn() : void
      {
         if(this.grid && this.grid.dataGrid is ChartDataGrid)
         {
            ChartDataGrid(this.grid.dataGrid).updateSelectedColumnIndex(-1);
         }
      }
      
      protected function renderer_clickHandler(param1:MouseEvent) : void
      {
         this.deselectColumn();
         this.startEditing();
      }
      
      private function dataGrid_columnSelectionChangeHandler(param1:ChartDataGridEvent) : void
      {
         if(param1.columnIndex == this.columnIndex)
         {
            if(!this._selected)
            {
               this._selected = true;
            }
         }
         else if(this._selected)
         {
            this._selected = false;
         }
      }
      
      private function dataGrid_gridItemEditorSessionStartHandler(param1:GridItemEditorEvent) : void
      {
         this.deselectColumn();
      }
      
      protected function selectionHandle_clickHandler(param1:MouseEvent) : void
      {
         if(this._selected)
         {
            this.deselectColumn();
         }
         else
         {
            this.selectColumn();
         }
      }
      
      protected function colorPicker_colorChangeHandler(param1:ColorPaletteEvent) : void
      {
         if(this._oldColor == this.colorPicker.selectedColor)
         {
            return;
         }
         var _loc2_:ChartDataGrid = grid.dataGrid as ChartDataGrid;
         if(_loc2_)
         {
            _loc2_.changeColumnColor(this.columnIndex,!!this._colorPickerVisible?uint(this.colorPicker.selectedColor):uint(uint.MAX_VALUE));
         }
      }
      
      protected function colorPicker_colorPreviewHandler(param1:ColorPaletteEvent) : void
      {
         if(this._oldColor == this.colorPicker.previewColor)
         {
            return;
         }
         var _loc2_:ChartDataGrid = grid.dataGrid as ChartDataGrid;
         if(_loc2_)
         {
            _loc2_.previewColumnColor(this.columnIndex,!!this._colorPickerVisible?uint(this.colorPicker.previewColor):uint(uint.MAX_VALUE));
         }
      }
      
      protected function colorDisplay_clickHandler(param1:MouseEvent) : void
      {
         this._openColorPicker = true;
      }
      
      protected function colorPicker_closeHandler(param1:DropDownEvent) : void
      {
         this._openColorPicker = false;
         this.setFocusToText();
      }
      
      protected function colorDisplay_rollOverHandler(param1:MouseEvent) : void
      {
         this.colorDisplay.width = COLOR_DISPLAY_WIDTH_ON_ROLL_OVER;
      }
      
      protected function colorDisplay_rollOutHandler(param1:MouseEvent) : void
      {
         this.colorDisplay.width = COLOR_DISPLAY_WIDTH;
      }
      
      protected function colorPicker_mouseDownHandler(param1:MouseEvent) : void
      {
         this._openColorPicker = true;
      }
      
      private function _WidgetGridHeaderRenderer_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.top = 0;
         _loc1_.bottom = 1;
         _loc1_.left = 1;
         _loc1_.right = 0;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._WidgetGridHeaderRenderer_ToggleButton1_i(),this._WidgetGridHeaderRenderer_Group1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _WidgetGridHeaderRenderer_ToggleButton1_i() : ToggleButton
      {
         var _loc1_:ToggleButton = new ToggleButton();
         _loc1_.percentWidth = 100;
         _loc1_.height = 10;
         _loc1_.buttonMode = true;
         _loc1_.setStyle("skinClass",DataGridHeaderToggleButtonSkin);
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
      
      private function _WidgetGridHeaderRenderer_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._WidgetGridHeaderRenderer_Group2_i(),this._WidgetGridHeaderRenderer_Group3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _WidgetGridHeaderRenderer_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.mxmlContent = [this._WidgetGridHeaderRenderer_Rect1_c(),this._WidgetGridHeaderRenderer_Rect2_i(),this._WidgetGridHeaderRenderer_HGroup1_c()];
         _loc1_.addEventListener("click",this.__renderer_click);
         _loc1_.id = "renderer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.renderer = _loc1_;
         BindingManager.executeBindings(this,"renderer",this.renderer);
         return _loc1_;
      }
      
      private function _WidgetGridHeaderRenderer_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.fill = this._WidgetGridHeaderRenderer_SolidColor1_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _WidgetGridHeaderRenderer_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         this._WidgetGridHeaderRenderer_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_WidgetGridHeaderRenderer_SolidColor1",this._WidgetGridHeaderRenderer_SolidColor1);
         return _loc1_;
      }
      
      private function _WidgetGridHeaderRenderer_Rect2_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.fill = this._WidgetGridHeaderRenderer_SolidColor2_i();
         _loc1_.initialized(this,"_WidgetGridHeaderRenderer_Rect2");
         this._WidgetGridHeaderRenderer_Rect2 = _loc1_;
         BindingManager.executeBindings(this,"_WidgetGridHeaderRenderer_Rect2",this._WidgetGridHeaderRenderer_Rect2);
         return _loc1_;
      }
      
      private function _WidgetGridHeaderRenderer_SolidColor2_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         this._WidgetGridHeaderRenderer_SolidColor2 = _loc1_;
         BindingManager.executeBindings(this,"_WidgetGridHeaderRenderer_SolidColor2",this._WidgetGridHeaderRenderer_SolidColor2);
         return _loc1_;
      }
      
      private function _WidgetGridHeaderRenderer_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.left = 5;
         _loc1_.right = 5;
         _loc1_.verticalAlign = "middle";
         _loc1_.gap = 2;
         _loc1_.mxmlContent = [this._WidgetGridHeaderRenderer_Label1_i(),this._WidgetGridHeaderRenderer_ColorDisplayGroup1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _WidgetGridHeaderRenderer_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.maxDisplayedLines = 1;
         _loc1_.showTruncationTip = true;
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",labelDisplay);
         return _loc1_;
      }
      
      private function _WidgetGridHeaderRenderer_ColorDisplayGroup1_i() : ColorDisplayGroup
      {
         var _loc1_:ColorDisplayGroup = new ColorDisplayGroup();
         _loc1_.height = 10;
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("click",this.__colorDisplay_click);
         _loc1_.addEventListener("rollOver",this.__colorDisplay_rollOver);
         _loc1_.addEventListener("rollOut",this.__colorDisplay_rollOut);
         _loc1_.id = "colorDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.colorDisplay = _loc1_;
         BindingManager.executeBindings(this,"colorDisplay",this.colorDisplay);
         return _loc1_;
      }
      
      public function __colorDisplay_click(param1:MouseEvent) : void
      {
         this.colorDisplay_clickHandler(param1);
      }
      
      public function __colorDisplay_rollOver(param1:MouseEvent) : void
      {
         this.colorDisplay_rollOverHandler(param1);
      }
      
      public function __colorDisplay_rollOut(param1:MouseEvent) : void
      {
         this.colorDisplay_rollOutHandler(param1);
      }
      
      public function __renderer_click(param1:MouseEvent) : void
      {
         this.renderer_clickHandler(param1);
      }
      
      private function _WidgetGridHeaderRenderer_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.visible = false;
         _loc1_.mxmlContent = [this._WidgetGridHeaderRenderer_Rect3_c(),this._WidgetGridHeaderRenderer_HGroup2_c(),this._WidgetGridHeaderRenderer_Rect4_c()];
         _loc1_.addEventListener("focusOut",this.__editor_focusOut);
         _loc1_.id = "editor";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.editor = _loc1_;
         BindingManager.executeBindings(this,"editor",this.editor);
         return _loc1_;
      }
      
      private function _WidgetGridHeaderRenderer_Rect3_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.fill = this._WidgetGridHeaderRenderer_SolidColor3_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _WidgetGridHeaderRenderer_SolidColor3_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         this._WidgetGridHeaderRenderer_SolidColor3 = _loc1_;
         BindingManager.executeBindings(this,"_WidgetGridHeaderRenderer_SolidColor3",this._WidgetGridHeaderRenderer_SolidColor3);
         return _loc1_;
      }
      
      private function _WidgetGridHeaderRenderer_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.left = 0;
         _loc1_.right = 5;
         _loc1_.verticalAlign = "middle";
         _loc1_.gap = 2;
         _loc1_.mxmlContent = [this._WidgetGridHeaderRenderer_TextInput1_i(),this._WidgetGridHeaderRenderer_ColorPaletteDropDown1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _WidgetGridHeaderRenderer_TextInput1_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.percentHeight = 100;
         _loc1_.percentWidth = 100;
         _loc1_.maxChars = 500;
         _loc1_.setStyle("skinClass",WidgetDataTextInputSkin);
         _loc1_.setStyle("borderVisible",false);
         _loc1_.addEventListener("enter",this.__textInput_enter);
         _loc1_.id = "textInput";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.textInput = _loc1_;
         BindingManager.executeBindings(this,"textInput",this.textInput);
         return _loc1_;
      }
      
      public function __textInput_enter(param1:FlexEvent) : void
      {
         this.textInput_enterHandler(param1);
      }
      
      private function _WidgetGridHeaderRenderer_ColorPaletteDropDown1_i() : ColorPaletteDropDown
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
      
      private function _WidgetGridHeaderRenderer_Rect4_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.stroke = this._WidgetGridHeaderRenderer_SolidColorStroke1_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _WidgetGridHeaderRenderer_SolidColorStroke1_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         this._WidgetGridHeaderRenderer_SolidColorStroke1 = _loc1_;
         BindingManager.executeBindings(this,"_WidgetGridHeaderRenderer_SolidColorStroke1",this._WidgetGridHeaderRenderer_SolidColorStroke1);
         return _loc1_;
      }
      
      public function __editor_focusOut(param1:FocusEvent) : void
      {
         this.editor_focusOutHandler(param1);
      }
      
      private function _WidgetGridHeaderRenderer_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Boolean
         {
            return _selected;
         },null,"selectionHandle.selected");
         result[1] = new Binding(this,function():uint
         {
            return BG_COLOR;
         },null,"_WidgetGridHeaderRenderer_SolidColor1.color");
         result[2] = new Binding(this,function():Boolean
         {
            return _selected;
         },null,"_WidgetGridHeaderRenderer_Rect2.visible");
         result[3] = new Binding(this,function():uint
         {
            return SELECTED_BG_COLOR;
         },null,"_WidgetGridHeaderRenderer_SolidColor2.color");
         result[4] = new Binding(this,function():uint
         {
            return TEXT_COLOR;
         },function(param1:uint):void
         {
            labelDisplay.setStyle("color",param1);
         },"labelDisplay.color");
         result[5] = new Binding(this,function():Number
         {
            return FONT_SIZE;
         },function(param1:Number):void
         {
            labelDisplay.setStyle("fontSize",param1);
         },"labelDisplay.fontSize");
         result[6] = new Binding(this,function():Number
         {
            return COLOR_DISPLAY_WIDTH;
         },null,"colorDisplay.width");
         result[7] = new Binding(this,function():uint
         {
            return _color;
         },null,"colorDisplay.color");
         result[8] = new Binding(this,function():Boolean
         {
            return _colorPickerVisible;
         },null,"colorDisplay.visible");
         result[9] = new Binding(this,function():Boolean
         {
            return _colorPickerVisible;
         },null,"colorDisplay.includeInLayout");
         result[10] = new Binding(this,function():uint
         {
            return SELECTED_BG_COLOR;
         },null,"_WidgetGridHeaderRenderer_SolidColor3.color");
         result[11] = new Binding(this,function():uint
         {
            return TEXT_COLOR;
         },function(param1:uint):void
         {
            textInput.setStyle("color",param1);
         },"textInput.color");
         result[12] = new Binding(this,function():Number
         {
            return FONT_SIZE;
         },function(param1:Number):void
         {
            textInput.setStyle("fontSize",param1);
         },"textInput.fontSize");
         result[13] = new Binding(this,function():uint
         {
            return SELECTED_BG_COLOR;
         },function(param1:uint):void
         {
            textInput.setStyle("contentBackgroundColor",param1);
         },"textInput.contentBackgroundColor");
         result[14] = new Binding(this,function():Boolean
         {
            return _colorPickerVisible;
         },null,"colorPicker.visible");
         result[15] = new Binding(this,function():Boolean
         {
            return _colorPickerVisible;
         },null,"colorPicker.includeInLayout");
         result[16] = new Binding(this,function():uint
         {
            return SELECTED_BORDER_COLOR;
         },null,"_WidgetGridHeaderRenderer_SolidColorStroke1.color");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get colorDisplay() : ColorDisplayGroup
      {
         return this._358089761colorDisplay;
      }
      
      public function set colorDisplay(param1:ColorDisplayGroup) : void
      {
         var _loc2_:Object = this._358089761colorDisplay;
         if(_loc2_ !== param1)
         {
            this._358089761colorDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"colorDisplay",_loc2_,param1));
            }
         }
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
      public function get editor() : Group
      {
         return this._1307827859editor;
      }
      
      public function set editor(param1:Group) : void
      {
         var _loc2_:Object = this._1307827859editor;
         if(_loc2_ !== param1)
         {
            this._1307827859editor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"editor",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get renderer() : Group
      {
         return this._494845757renderer;
      }
      
      public function set renderer(param1:Group) : void
      {
         var _loc2_:Object = this._494845757renderer;
         if(_loc2_ !== param1)
         {
            this._494845757renderer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"renderer",_loc2_,param1));
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
      private function get _selected() : Boolean
      {
         return this._1282089978_selected;
      }
      
      private function set _selected(param1:Boolean) : void
      {
         var _loc2_:Object = this._1282089978_selected;
         if(_loc2_ !== param1)
         {
            this._1282089978_selected = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_selected",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _color() : uint
      {
         return this._1480355228_color;
      }
      
      private function set _color(param1:uint) : void
      {
         var _loc2_:Object = this._1480355228_color;
         if(_loc2_ !== param1)
         {
            this._1480355228_color = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_color",_loc2_,param1));
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
