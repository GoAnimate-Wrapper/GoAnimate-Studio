package anifire.studio.components
{
   import anifire.constant.ThemeConstants;
   import anifire.event.ColorPaletteEvent;
   import anifire.event.WidgetEvent;
   import anifire.models.FontModel;
   import anifire.studio.commands.ChangeWidgetColorCommand;
   import anifire.studio.commands.ChangeWidgetStyleCommand;
   import anifire.studio.commands.ICommand;
   import anifire.studio.core.Widget;
   import anifire.studio.core.WidgetStyleFactory;
   import anifire.studio.events.MenuItemEvent;
   import anifire.studio.managers.StudioFontManager;
   import anifire.studio.skins.CompactFormSkin;
   import anifire.studio.skins.WidgetStyleListSkin;
   import anifire.util.FontManager;
   import anifire.util.UtilDict;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.collections.ArrayCollection;
   import mx.collections.IList;
   import mx.core.ClassFactory;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import spark.components.Form;
   import spark.components.HGroup;
   import spark.components.List;
   import spark.components.Scroller;
   import spark.components.VGroup;
   import spark.events.IndexChangeEvent;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class CalendarStylePanel extends WidgetPanelBase implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _885706193colorPicker:ColorPaletteDropDown;
      
      private var _1923333726fontDropDownList:FontDropDownList;
      
      private var _1279411131fontOptionFormItem:WidgetFormItem;
      
      private var _341408488layoutList:List;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _command:ICommand;
      
      private var _1429721223_layoutList:ArrayCollection;
      
      private var _changeWidgetColorCommand:ChangeWidgetColorCommand;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function CalendarStylePanel()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._1429721223_layoutList = new ArrayCollection();
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._CalendarStylePanel_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_CalendarStylePanelWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return CalendarStylePanel[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._CalendarStylePanel_Array1_c);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         CalendarStylePanel._watcherSetupUtil = param1;
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
      
      override public function set widget(param1:Widget) : void
      {
         super.widget = param1;
         if(_widget)
         {
            this.updateLayoutList();
         }
      }
      
      override protected function onWidgetStyleChange(param1:WidgetEvent) : void
      {
         this.updateFont();
      }
      
      override protected function onWidgetOptionChange(param1:WidgetEvent) : void
      {
         this.updateUI();
      }
      
      private function updateFont() : void
      {
         this.fontDropDownList.selectCffFont(_widget.styleModel.font);
         this.colorPicker.selectedColor = _widget.styleModel.color;
      }
      
      override protected function updateUI() : void
      {
         this.updateFont();
      }
      
      protected function layoutList_changeHandler(param1:IndexChangeEvent) : void
      {
         var _loc2_:ICommand = null;
         if(_widget)
         {
            _loc2_ = new ChangeWidgetStyleCommand(_widget,this.layoutList.selectedItem.id);
            _loc2_.execute();
         }
      }
      
      protected function colorPicker_colorChangeHandler(param1:ColorPaletteEvent) : void
      {
         if(_widget)
         {
            this.startChangingWidgetColor(param1.colorCode as uint);
            _widget.changeWidgetColor(param1.colorCode as uint);
            this._changeWidgetColorCommand = null;
         }
      }
      
      protected function colorPicker_colorPreviewHandler(param1:ColorPaletteEvent) : void
      {
         if(_widget)
         {
            this.startChangingWidgetColor(param1.colorCode as uint);
            _widget.changeWidgetColor(param1.colorCode as uint);
         }
      }
      
      protected function startChangingWidgetColor(param1:uint) : void
      {
         if(!this._changeWidgetColorCommand)
         {
            this._changeWidgetColorCommand = new ChangeWidgetColorCommand(_widget,param1);
            this._changeWidgetColorCommand.execute();
         }
         else
         {
            this._changeWidgetColorCommand.newColor = param1;
         }
      }
      
      protected function fontDropDown_changeHandler(param1:IndexChangeEvent) : void
      {
         var _loc2_:FontModel = this.fontDropDownList.selectedItem as FontModel;
         this.changeFont(_loc2_);
      }
      
      protected function fontDropDownList_itemClickHandler(param1:MenuItemEvent) : void
      {
         var _loc2_:FontModel = param1.item.value as FontModel;
         this.changeFont(_loc2_);
      }
      
      private function changeFont(param1:FontModel) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc2_:String = param1.cffValue;
         _widget.changeFont(_loc2_);
         StudioFontManager.instance.addRecentFont(_loc2_,param1.source == FontManager.FONT_TYPE_USER?ThemeConstants.UGC_THEME_ID:null);
      }
      
      protected function updateLayoutList() : void
      {
         this._layoutList = WidgetStyleFactory.instance.getStyleVariants(_widget.chartType);
      }
      
      private function _CalendarStylePanel_Array1_c() : Array
      {
         var _loc1_:Array = [this._CalendarStylePanel_Rect1_c(),this._CalendarStylePanel_VGroup1_c()];
         return _loc1_;
      }
      
      private function _CalendarStylePanel_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._CalendarStylePanel_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _CalendarStylePanel_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _CalendarStylePanel_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.paddingTop = 10;
         _loc1_.mxmlContent = [this._CalendarStylePanel_Scroller1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CalendarStylePanel_Scroller1_c() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.viewport = this._CalendarStylePanel_VGroup2_c();
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CalendarStylePanel_VGroup2_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._CalendarStylePanel_Form1_c(),this._CalendarStylePanel_VGroup3_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CalendarStylePanel_Form1_c() : Form
      {
         var _loc1_:Form = new Form();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._CalendarStylePanel_Array4_c);
         _loc1_.setStyle("skinClass",CompactFormSkin);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CalendarStylePanel_Array4_c() : Array
      {
         var _loc1_:Array = [this._CalendarStylePanel_WidgetFormItem1_i()];
         return _loc1_;
      }
      
      private function _CalendarStylePanel_WidgetFormItem1_i() : WidgetFormItem
      {
         var _loc1_:WidgetFormItem = new WidgetFormItem();
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._CalendarStylePanel_Array5_c);
         _loc1_.id = "fontOptionFormItem";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.fontOptionFormItem = _loc1_;
         BindingManager.executeBindings(this,"fontOptionFormItem",this.fontOptionFormItem);
         return _loc1_;
      }
      
      private function _CalendarStylePanel_Array5_c() : Array
      {
         var _loc1_:Array = [this._CalendarStylePanel_HGroup1_c()];
         return _loc1_;
      }
      
      private function _CalendarStylePanel_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._CalendarStylePanel_FontDropDownList1_i(),this._CalendarStylePanel_ColorPaletteDropDown1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CalendarStylePanel_FontDropDownList1_i() : FontDropDownList
      {
         var _loc1_:FontDropDownList = new FontDropDownList();
         _loc1_.percentWidth = 100;
         _loc1_.height = 30;
         _loc1_.cffMode = true;
         _loc1_.addEventListener("change",this.__fontDropDownList_change);
         _loc1_.addEventListener("itemClick",this.__fontDropDownList_itemClick);
         _loc1_.id = "fontDropDownList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.fontDropDownList = _loc1_;
         BindingManager.executeBindings(this,"fontDropDownList",this.fontDropDownList);
         return _loc1_;
      }
      
      public function __fontDropDownList_change(param1:IndexChangeEvent) : void
      {
         this.fontDropDown_changeHandler(param1);
      }
      
      public function __fontDropDownList_itemClick(param1:MenuItemEvent) : void
      {
         this.fontDropDownList_itemClickHandler(param1);
      }
      
      private function _CalendarStylePanel_ColorPaletteDropDown1_i() : ColorPaletteDropDown
      {
         var _loc1_:ColorPaletteDropDown = new ColorPaletteDropDown();
         _loc1_.addEventListener("colorChange",this.__colorPicker_colorChange);
         _loc1_.addEventListener("colorPreview",this.__colorPicker_colorPreview);
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
      
      private function _CalendarStylePanel_VGroup3_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.paddingLeft = 15;
         _loc1_.paddingRight = 0;
         _loc1_.paddingTop = 15;
         _loc1_.paddingBottom = 15;
         _loc1_.gap = 10;
         _loc1_.mxmlContent = [this._CalendarStylePanel_List1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CalendarStylePanel_List1_i() : List
      {
         var _loc1_:List = new List();
         _loc1_.percentWidth = 100;
         _loc1_.itemRenderer = this._CalendarStylePanel_ClassFactory1_c();
         _loc1_.setStyle("verticalScrollPolicy","off");
         _loc1_.setStyle("skinClass",WidgetStyleListSkin);
         _loc1_.addEventListener("change",this.__layoutList_change);
         _loc1_.id = "layoutList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.layoutList = _loc1_;
         BindingManager.executeBindings(this,"layoutList",this.layoutList);
         return _loc1_;
      }
      
      private function _CalendarStylePanel_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = WidgetStyleThumbRenderer;
         return _loc1_;
      }
      
      public function __layoutList_change(param1:IndexChangeEvent) : void
      {
         this.layoutList_changeHandler(param1);
      }
      
      private function _CalendarStylePanel_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Text");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"fontOptionFormItem.label");
         result[1] = new Binding(this,function():IList
         {
            return _layoutList;
         },null,"layoutList.dataProvider");
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
      public function get fontDropDownList() : FontDropDownList
      {
         return this._1923333726fontDropDownList;
      }
      
      public function set fontDropDownList(param1:FontDropDownList) : void
      {
         var _loc2_:Object = this._1923333726fontDropDownList;
         if(_loc2_ !== param1)
         {
            this._1923333726fontDropDownList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fontDropDownList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fontOptionFormItem() : WidgetFormItem
      {
         return this._1279411131fontOptionFormItem;
      }
      
      public function set fontOptionFormItem(param1:WidgetFormItem) : void
      {
         var _loc2_:Object = this._1279411131fontOptionFormItem;
         if(_loc2_ !== param1)
         {
            this._1279411131fontOptionFormItem = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fontOptionFormItem",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get layoutList() : List
      {
         return this._341408488layoutList;
      }
      
      public function set layoutList(param1:List) : void
      {
         var _loc2_:Object = this._341408488layoutList;
         if(_loc2_ !== param1)
         {
            this._341408488layoutList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"layoutList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _layoutList() : ArrayCollection
      {
         return this._1429721223_layoutList;
      }
      
      private function set _layoutList(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1429721223_layoutList;
         if(_loc2_ !== param1)
         {
            this._1429721223_layoutList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_layoutList",_loc2_,param1));
            }
         }
      }
   }
}
