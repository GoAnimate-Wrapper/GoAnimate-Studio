package anifire.studio.components
{
   import anifire.component.ColorInputPanel;
   import anifire.event.ColorPaletteEvent;
   import anifire.event.EyeDropperEvent;
   import anifire.managers.ColorUtils;
   import anifire.studio.managers.PaletteManager;
   import anifire.studio.managers.StudioDragManager;
   import anifire.studio.models.ColorPaletteItem;
   import anifire.studio.skins.ColorPaletteDropDownSkin;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.geom.Point;
   import mx.core.FlexVersion;
   import mx.core.IUIComponent;
   import mx.core.IVisualElement;
   import mx.events.DragEvent;
   import mx.events.PropertyChangeEvent;
   import mx.managers.DragManager;
   import spark.components.Scroller;
   import spark.components.supportClasses.ButtonBase;
   import spark.components.supportClasses.GroupBase;
   import spark.components.supportClasses.ItemRenderer;
   import spark.events.DropDownEvent;
   import spark.events.RendererExistenceEvent;
   import spark.events.TrackBaseEvent;
   
   public class ColorPaletteDropDown extends spark.components.DropDownList
   {
      
      public static const BG_RESET_COLOR:uint = 16777215;
       
      
      protected const COLOR_NUM_LIMIT:int = 36;
      
      [SkinPart(required="true")]
      public var colorInputPanel:ColorInputPanel;
      
      [SkinPart(required="true")]
      public var colorInputPanelAnchor:GroupBase;
      
      [SkinPart(required="false")]
      public var transparentColorButton:ButtonBase;
      
      [SkinPart(required="true")]
      public var swatchPanel:GroupBase;
      
      [SkinPart(required="true")]
      public var paletteScroller:Scroller;
      
      [SkinPart(required="false")]
      public var opacitySlider:OpacitySlider;
      
      private var _860736679columnCount:int = 20;
      
      private var _1965774595displayedAlpha:Number = 0;
      
      protected var _selectedAlpha:int;
      
      protected var _previewColor:uint = 4.294967295E9;
      
      protected var _draggingSlider:Boolean;
      
      protected var _selectedColor:uint;
      
      protected var _allowTransparent:Boolean;
      
      protected var _allowAddColor:Boolean;
      
      protected var _isEyeDropperActive:Boolean = false;
      
      public function ColorPaletteDropDown()
      {
         super();
         dataProvider = PaletteManager.instance.paletteItems;
         labelFunction = this.colorDetail;
         addEventListener(DropDownEvent.OPEN,this.openHandler);
         addEventListener(Event.REMOVED_FROM_STAGE,this.removeFromStageHandler);
         setStyle("skinClass",ColorPaletteDropDownSkin);
      }
      
      [Bindable(event="propertyChange")]
      public function get selectedAlpha() : int
      {
         return this._selectedAlpha;
      }
      
      private function set _1428633475selectedAlpha(param1:int) : void
      {
         this._selectedAlpha = param1;
         this.displayedAlpha = Math.max(0,Math.min(param1 * 0.01,1));
      }
      
      [Bindable(event="propertyChange")]
      public function get previewColor() : uint
      {
         return this._previewColor;
      }
      
      private function set _1388676997previewColor(param1:uint) : void
      {
         this._previewColor = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get selectedColor() : uint
      {
         return this._selectedColor;
      }
      
      private function set _1430566280selectedColor(param1:uint) : void
      {
         this._selectedColor = param1;
         this.previewColor = param1;
      }
      
      public function notifyColorChange() : void
      {
         var _loc1_:ColorPaletteEvent = new ColorPaletteEvent(ColorPaletteEvent.COLOR_CHANGE);
         _loc1_.colorCode = this.selectedColor;
         dispatchEvent(_loc1_);
      }
      
      [Bindable(event="propertyChange")]
      public function get allowTransparent() : Boolean
      {
         return this._allowTransparent;
      }
      
      private function set _1521440183allowTransparent(param1:Boolean) : void
      {
         if(this._allowTransparent != param1)
         {
            this._allowTransparent = param1;
            if(this.opacitySlider)
            {
               this.opacitySlider.visible = param1;
               this.opacitySlider.includeInLayout = param1;
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get allowAddColor() : Boolean
      {
         return this._allowAddColor;
      }
      
      private function set _10571349allowAddColor(param1:Boolean) : void
      {
         if(this._allowAddColor != param1)
         {
            this._allowAddColor = param1;
         }
      }
      
      protected function updateSelectedItem() : void
      {
         var _loc3_:ColorPaletteItem = null;
         var _loc1_:int = dataProvider.length;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = dataProvider[_loc2_];
            if(!_loc3_.isAddColorButton && _loc3_.color == this._selectedColor)
            {
               selectedItem = _loc3_;
               return;
            }
            _loc2_++;
         }
         selectedItem = null;
      }
      
      public function openColorInputPanel(param1:ItemRenderer) : void
      {
         var _loc2_:Point = param1.localToGlobal(new Point(param1.getLayoutBoundsWidth() * 0.5,0));
         var _loc3_:Point = globalToLocal(_loc2_);
         this.colorInputPanelAnchor.x = _loc3_.x;
         this.colorInputPanelAnchor.y = _loc3_.y;
         this.colorInputPanel.visible = true;
         this.colorInputPanel.currentColor = this._selectedColor;
         var _loc4_:ColorPaletteItem = dataProvider[dataProvider.length - 1] as ColorPaletteItem;
         _loc4_.color = this._selectedColor;
      }
      
      protected function colorInputPanel_eyeDropperActivateHandler(param1:EyeDropperEvent) : void
      {
         dropDown.visible = false;
         this._isEyeDropperActive = true;
      }
      
      protected function colorInputPanel_eyeDropperCompleteHandler(param1:EyeDropperEvent) : void
      {
         dropDown.visible = true;
         this._isEyeDropperActive = false;
         PaletteManager.instance.paletteItems.addItem(new ColorPaletteItem(param1.color));
         PaletteManager.instance.confirmColorAdd();
         callLater(closeDropDown,[true]);
      }
      
      public function closeColorInputPanel() : void
      {
         this.colorInputPanel.visible = false;
      }
      
      protected function colorInputPanel_colorPreviewHandler(param1:ColorPaletteEvent) : void
      {
         this.previewColor = param1.colorCode as uint;
         var _loc2_:ColorPaletteItem = dataProvider[dataProvider.length - 1] as ColorPaletteItem;
         _loc2_.color = param1.colorCode as uint;
         var _loc3_:ColorPaletteEvent = new ColorPaletteEvent(ColorPaletteEvent.COLOR_PREVIEW);
         _loc3_.colorCode = param1.colorCode;
         dispatchEvent(_loc3_);
      }
      
      protected function colorInputPanel_colorChangeHandler(param1:ColorPaletteEvent) : void
      {
         this.selectedColor = param1.colorCode as uint;
         var _loc2_:ColorPaletteEvent = new ColorPaletteEvent(ColorPaletteEvent.COLOR_CHANGE);
         _loc2_.colorCode = param1.colorCode;
         dispatchEvent(_loc2_);
      }
      
      protected function colorInputPanel_alphaPreviewHandler(param1:ColorPaletteEvent) : void
      {
         var _loc2_:ColorPaletteEvent = new ColorPaletteEvent(ColorPaletteEvent.ALPHA_PREVIEW);
         _loc2_.alpha = param1.alpha;
         dispatchEvent(_loc2_);
      }
      
      public function removeColor(param1:uint) : void
      {
         PaletteManager.instance.removeColor(param1);
      }
      
      protected function colorFunction(param1:String) : *
      {
         return uint(param1);
      }
      
      public function colorDetail(param1:Object) : String
      {
         var _loc2_:uint = param1 as uint;
         return ColorUtils.colorToHex(_loc2_);
      }
      
      override public function setFocus() : void
      {
         if(stage)
         {
            stage.focus = this;
         }
      }
      
      override protected function isOurFocus(param1:DisplayObject) : Boolean
      {
         return param1 == this;
      }
      
      override protected function dropDownController_closeHandler(param1:DropDownEvent) : void
      {
         param1.preventDefault();
         super.dropDownController_closeHandler(param1);
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == dropDown)
         {
            dropDown.addEventListener(DragEvent.DRAG_ENTER,this.dropDown_dragEnterHandler);
            dropDown.addEventListener(DragEvent.DRAG_EXIT,this.dropDown_dragExitHandler);
         }
         else if(param2 == this.opacitySlider)
         {
            this.opacitySlider.addEventListener(Event.CHANGE,this.opacitySlider_changeHandler);
            this.opacitySlider.addEventListener(TrackBaseEvent.THUMB_PRESS,this.opacitySlider_thumbPressHandler);
            this.opacitySlider.addEventListener(TrackBaseEvent.THUMB_RELEASE,this.opacitySlider_thumbReleaseHandler);
            this.opacitySlider.visible = this._allowTransparent;
            this.opacitySlider.includeInLayout = this._allowTransparent;
         }
         else if(param2 == this.colorInputPanel)
         {
            this.colorInputPanel.addEventListener(ColorPaletteEvent.COLOR_PREVIEW,this.colorInputPanel_colorPreviewHandler);
            this.colorInputPanel.addEventListener(ColorPaletteEvent.COLOR_CHANGE,this.colorInputPanel_colorChangeHandler);
            this.colorInputPanel.addEventListener(ColorPaletteEvent.ALPHA_PREVIEW,this.colorInputPanel_alphaPreviewHandler);
            this.colorInputPanel.addEventListener(EyeDropperEvent.EYE_DROPPER_ACTIVATE,this.colorInputPanel_eyeDropperActivateHandler);
            this.colorInputPanel.addEventListener(EyeDropperEvent.EYE_DROPPER_COMPLETE,this.colorInputPanel_eyeDropperCompleteHandler);
         }
      }
      
      protected function dropDown_dragEnterHandler(param1:DragEvent) : void
      {
         var _loc2_:ColorPickerSwatchRenderer = null;
         if(param1.dragSource.hasFormat(StudioDragManager.DRAG_FORMAT_COLOR_SWATCH_REMOVE))
         {
            DragManager.acceptDragDrop(param1.target as IUIComponent);
            DragManager.showFeedback(DragManager.MOVE);
            if(param1.dragSource.hasFormat(StudioDragManager.DRAG_IMAGE))
            {
               _loc2_ = param1.dragSource.dataForFormat(StudioDragManager.DRAG_IMAGE) as ColorPickerSwatchRenderer;
               if(_loc2_)
               {
                  _loc2_.hideTips();
               }
            }
         }
      }
      
      protected function dropDown_dragExitHandler(param1:DragEvent) : void
      {
         var _loc2_:ColorPickerSwatchRenderer = null;
         if(param1.dragSource.hasFormat(StudioDragManager.DRAG_IMAGE))
         {
            _loc2_ = param1.dragSource.dataForFormat(StudioDragManager.DRAG_IMAGE) as ColorPickerSwatchRenderer;
            if(_loc2_)
            {
               _loc2_.showTips();
            }
         }
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         super.partRemoved(param1,param2);
         if(param2 == dropDown)
         {
            dropDown.removeEventListener(DragEvent.DRAG_ENTER,this.dropDown_dragEnterHandler);
            dropDown.removeEventListener(DragEvent.DRAG_EXIT,this.dropDown_dragExitHandler);
         }
         else if(param2 == this.opacitySlider)
         {
            this.opacitySlider.removeEventListener(Event.CHANGE,this.opacitySlider_changeHandler);
            this.opacitySlider.removeEventListener(TrackBaseEvent.THUMB_PRESS,this.opacitySlider_thumbPressHandler);
            this.opacitySlider.removeEventListener(TrackBaseEvent.THUMB_RELEASE,this.opacitySlider_thumbReleaseHandler);
         }
         else if(param2 == this.colorInputPanel)
         {
            this.colorInputPanel.removeEventListener(ColorPaletteEvent.COLOR_PREVIEW,this.colorInputPanel_colorPreviewHandler);
            this.colorInputPanel.removeEventListener(ColorPaletteEvent.COLOR_CHANGE,this.colorInputPanel_colorChangeHandler);
            this.colorInputPanel.removeEventListener(ColorPaletteEvent.ALPHA_PREVIEW,this.colorInputPanel_alphaPreviewHandler);
            this.colorInputPanel.removeEventListener(EyeDropperEvent.EYE_DROPPER_ACTIVATE,this.colorInputPanel_eyeDropperActivateHandler);
            this.colorInputPanel.removeEventListener(EyeDropperEvent.EYE_DROPPER_COMPLETE,this.colorInputPanel_eyeDropperCompleteHandler);
            if(this.colorInputPanel.visible)
            {
               PaletteManager.instance.confirmColorAdd();
            }
         }
      }
      
      private function renderer_colorPickerDroppedHandler(param1:ColorPaletteEvent) : void
      {
         var _loc2_:Boolean = this.swatchPanel.hitTestPoint(param1.releasePoint.x,param1.releasePoint.y);
         if(!_loc2_)
         {
            this.removeColor(param1.colorCode as uint);
         }
      }
      
      private function renderer_colorPickerPickedHandler(param1:ColorPaletteEvent) : void
      {
         var _loc2_:uint = param1.colorCode as uint;
         this.selectedColor = _loc2_;
         this.updateSelectedItem();
         this.notifyColorChange();
         this.opacitySlider.baseColor = _loc2_;
      }
      
      private function renderer_addButtonClickedHandler(param1:ColorPaletteEvent) : void
      {
         this.openColorInputPanel(param1.currentTarget as ItemRenderer);
      }
      
      protected function opacitySlider_thumbPressHandler(param1:TrackBaseEvent) : void
      {
         this._draggingSlider = true;
      }
      
      protected function opacitySlider_thumbReleaseHandler(param1:TrackBaseEvent) : void
      {
         this._draggingSlider = false;
         this.notifyAlphaChange();
      }
      
      protected function opacitySlider_changeHandler(param1:Event) : void
      {
         if(this._draggingSlider)
         {
            this.notifyAlphaPreview();
         }
         else
         {
            this.notifyAlphaChange();
         }
      }
      
      protected function notifyAlphaPreview() : void
      {
         var _loc1_:ColorPaletteEvent = new ColorPaletteEvent(ColorPaletteEvent.ALPHA_PREVIEW);
         _loc1_.alpha = this.opacitySlider.value;
         dispatchEvent(_loc1_);
      }
      
      protected function notifyAlphaChange() : void
      {
         var _loc1_:ColorPaletteEvent = new ColorPaletteEvent(ColorPaletteEvent.ALPHA_CHANGE);
         _loc1_.alpha = this.opacitySlider.value;
         dispatchEvent(_loc1_);
      }
      
      override protected function dataGroup_rendererAddHandler(param1:RendererExistenceEvent) : void
      {
         super.dataGroup_rendererAddHandler(param1);
         var _loc2_:IVisualElement = param1.renderer;
         if(_loc2_)
         {
            _loc2_.addEventListener(ColorPaletteEvent.COLOR_PICKER_DROP,this.renderer_colorPickerDroppedHandler);
            _loc2_.addEventListener(ColorPaletteEvent.SWATCH_PICK,this.renderer_colorPickerPickedHandler);
            _loc2_.addEventListener(ColorPaletteEvent.ADD_COLOR_BUTTON_CLICK,this.renderer_addButtonClickedHandler);
         }
      }
      
      override protected function dataGroup_rendererRemoveHandler(param1:RendererExistenceEvent) : void
      {
         super.dataGroup_rendererRemoveHandler(param1);
         var _loc2_:IVisualElement = param1.renderer;
         if(_loc2_)
         {
            _loc2_.removeEventListener(ColorPaletteEvent.COLOR_PICKER_DROP,this.renderer_colorPickerDroppedHandler);
            _loc2_.removeEventListener(ColorPaletteEvent.SWATCH_PICK,this.renderer_colorPickerPickedHandler);
            _loc2_.removeEventListener(ColorPaletteEvent.ADD_COLOR_BUTTON_CLICK,this.renderer_addButtonClickedHandler);
         }
      }
      
      protected function removeFromStageHandler(param1:Event) : void
      {
         if(this.colorInputPanel && this.colorInputPanel.visible)
         {
            PaletteManager.instance.confirmColorAdd();
         }
      }
      
      protected function openHandler(param1:DropDownEvent) : void
      {
         PaletteManager.instance.removeDuplicatedColors();
         this.updateSelectedItem();
      }
      
      override public function get baselinePosition() : Number
      {
         if(FlexVersion.compatibilityVersion < FlexVersion.VERSION_4_5)
         {
            return super.baselinePosition;
         }
         var _loc1_:IVisualElement = labelDisplay as IVisualElement;
         if(_loc1_)
         {
            return _loc1_.baselinePosition + _loc1_.y;
         }
         return super.baselinePosition;
      }
      
      [Bindable(event="propertyChange")]
      public function get columnCount() : int
      {
         return this._860736679columnCount;
      }
      
      public function set columnCount(param1:int) : void
      {
         var _loc2_:Object = this._860736679columnCount;
         if(_loc2_ !== param1)
         {
            this._860736679columnCount = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"columnCount",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get displayedAlpha() : Number
      {
         return this._1965774595displayedAlpha;
      }
      
      public function set displayedAlpha(param1:Number) : void
      {
         var _loc2_:Object = this._1965774595displayedAlpha;
         if(_loc2_ !== param1)
         {
            this._1965774595displayedAlpha = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"displayedAlpha",_loc2_,param1));
            }
         }
      }
      
      public function set selectedAlpha(param1:int) : void
      {
         var _loc2_:Object = this.selectedAlpha;
         if(_loc2_ !== param1)
         {
            this._1428633475selectedAlpha = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"selectedAlpha",_loc2_,param1));
            }
         }
      }
      
      public function set previewColor(param1:uint) : void
      {
         var _loc2_:Object = this.previewColor;
         if(_loc2_ !== param1)
         {
            this._1388676997previewColor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"previewColor",_loc2_,param1));
            }
         }
      }
      
      public function set selectedColor(param1:uint) : void
      {
         var _loc2_:Object = this.selectedColor;
         if(_loc2_ !== param1)
         {
            this._1430566280selectedColor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"selectedColor",_loc2_,param1));
            }
         }
      }
      
      public function set allowTransparent(param1:Boolean) : void
      {
         var _loc2_:Object = this.allowTransparent;
         if(_loc2_ !== param1)
         {
            this._1521440183allowTransparent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"allowTransparent",_loc2_,param1));
            }
         }
      }
      
      public function set allowAddColor(param1:Boolean) : void
      {
         var _loc2_:Object = this.allowAddColor;
         if(_loc2_ !== param1)
         {
            this._10571349allowAddColor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"allowAddColor",_loc2_,param1));
            }
         }
      }
   }
}
