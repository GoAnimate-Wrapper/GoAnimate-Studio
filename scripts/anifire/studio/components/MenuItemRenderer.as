package anifire.studio.components
{
   import anifire.studio.events.MenuItemEvent;
   import anifire.studio.interfaces.IMenuItemOwner;
   import anifire.studio.interfaces.IMenuItemRenderer;
   import anifire.studio.models.MenuItemModel;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.collections.IList;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.SetStyle;
   import mx.states.State;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.supportClasses.ItemRenderer;
   import spark.primitives.BitmapImage;
   import spark.primitives.Line;
   import spark.primitives.Path;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class MenuItemRenderer extends ItemRenderer implements IMenuItemRenderer, IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _MenuItemRenderer_BitmapImage1:BitmapImage;
      
      public var _MenuItemRenderer_Group2:Group;
      
      public var _MenuItemRenderer_Group3:Group;
      
      public var _MenuItemRenderer_HGroup1:HGroup;
      
      public var _MenuItemRenderer_Line1:Line;
      
      public var _MenuItemRenderer_Rect1:Rect;
      
      private var _63492407_MenuItemRenderer_SolidColorStroke2:SolidColorStroke;
      
      private var _63492408_MenuItemRenderer_SolidColorStroke3:SolidColorStroke;
      
      private var _1896065460selectedIndicator:Group;
      
      private var _1868748865subMenu:MenuItemList;
      
      private var _1971903485subMenuDisplay:spark.components.PopUpAnchor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _104069929model:MenuItemModel;
      
      protected var _893353837displayIndicator:Boolean = false;
      
      protected var _956783549displaySeparator:Boolean = false;
      
      protected var _532727086displayOverlay:Boolean = true;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function MenuItemRenderer()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._MenuItemRenderer_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_MenuItemRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return MenuItemRenderer[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.autoDrawBackground = false;
         this.minHeight = 0;
         this.mxmlContent = [this._MenuItemRenderer_Line1_i(),this._MenuItemRenderer_HGroup1_i(),this._MenuItemRenderer_PopUpAnchor1_i()];
         this.currentState = "normal";
         this.addEventListener("mouseOver",this.___MenuItemRenderer_ItemRenderer1_mouseOver);
         this.addEventListener("removedFromStage",this.___MenuItemRenderer_ItemRenderer1_removedFromStage);
         var _MenuItemRenderer_Rect1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._MenuItemRenderer_Rect1_i);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"hovered",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_MenuItemRenderer_Rect1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new SetProperty().initializeFromObject({
               "target":"_MenuItemRenderer_SolidColorStroke2",
               "name":"color",
               "value":16777215
            }),new SetStyle().initializeFromObject({
               "target":"labelDisplay",
               "name":"color",
               "value":16777215
            }),new SetProperty().initializeFromObject({
               "target":"_MenuItemRenderer_SolidColorStroke3",
               "name":"color",
               "value":16777215
            })]
         })];
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         MenuItemRenderer._watcherSetupUtil = param1;
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
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         this.model = data as MenuItemModel;
         if(this.model)
         {
            labelDisplay.text = this.model.label;
            this.displaySeparator = this.model.menuType == MenuItemModel.MENU_TYPE_SEPARATOR;
            this.displayIndicator = this.model.menuType == MenuItemModel.MENU_TYPE_RADIO || this.model.menuType == MenuItemModel.MENU_TYPE_CHECKBOX;
            this.displayOverlay = !this.displaySeparator && this.model.enabled;
         }
      }
      
      public function closeSubMenu() : void
      {
         this.subMenuDisplay.displayPopUp = false;
      }
      
      protected function onMouseOver(param1:MouseEvent) : void
      {
         var _loc2_:IMenuItemOwner = owner as IMenuItemOwner;
         if(_loc2_)
         {
            _loc2_.closeActiveItem();
            _loc2_.activeItem = this;
         }
         this.subMenuDisplay.displayPopUp = true;
      }
      
      protected function onItemClick(param1:MenuItemEvent) : void
      {
         var _loc2_:IMenuItemOwner = owner as IMenuItemOwner;
         if(_loc2_)
         {
            _loc2_.menuItemClicked(param1.item,true,param1.mouseEvent);
         }
      }
      
      protected function onRemove() : void
      {
         this.subMenuDisplay.displayPopUp = false;
      }
      
      private function _MenuItemRenderer_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 3;
         _loc1_.right = 3;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._MenuItemRenderer_SolidColor1_c();
         _loc1_.initialized(this,"_MenuItemRenderer_Rect1");
         this._MenuItemRenderer_Rect1 = _loc1_;
         BindingManager.executeBindings(this,"_MenuItemRenderer_Rect1",this._MenuItemRenderer_Rect1);
         return _loc1_;
      }
      
      private function _MenuItemRenderer_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 6142119;
         return _loc1_;
      }
      
      private function _MenuItemRenderer_Line1_i() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.top = 5;
         _loc1_.bottom = 5;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.stroke = this._MenuItemRenderer_SolidColorStroke1_c();
         _loc1_.initialized(this,"_MenuItemRenderer_Line1");
         this._MenuItemRenderer_Line1 = _loc1_;
         BindingManager.executeBindings(this,"_MenuItemRenderer_Line1",this._MenuItemRenderer_Line1);
         return _loc1_;
      }
      
      private function _MenuItemRenderer_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 0;
         return _loc1_;
      }
      
      private function _MenuItemRenderer_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.left = 5;
         _loc1_.right = 5;
         _loc1_.top = 5;
         _loc1_.bottom = 5;
         _loc1_.verticalAlign = "middle";
         _loc1_.gap = -4;
         _loc1_.mxmlContent = [this._MenuItemRenderer_Group1_i(),this._MenuItemRenderer_Group2_i(),this._MenuItemRenderer_Label1_i(),this._MenuItemRenderer_Group3_i()];
         _loc1_.id = "_MenuItemRenderer_HGroup1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._MenuItemRenderer_HGroup1 = _loc1_;
         BindingManager.executeBindings(this,"_MenuItemRenderer_HGroup1",this._MenuItemRenderer_HGroup1);
         return _loc1_;
      }
      
      private function _MenuItemRenderer_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 20;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._MenuItemRenderer_Path1_c()];
         _loc1_.id = "selectedIndicator";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.selectedIndicator = _loc1_;
         BindingManager.executeBindings(this,"selectedIndicator",this.selectedIndicator);
         return _loc1_;
      }
      
      private function _MenuItemRenderer_Path1_c() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.data = "M 0 5 l 4 3 l 4 -8";
         _loc1_.stroke = this._MenuItemRenderer_SolidColorStroke2_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _MenuItemRenderer_SolidColorStroke2_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.weight = 2;
         _loc1_.caps = "square";
         _loc1_.color = 5486248;
         this._MenuItemRenderer_SolidColorStroke2 = _loc1_;
         BindingManager.executeBindings(this,"_MenuItemRenderer_SolidColorStroke2",this._MenuItemRenderer_SolidColorStroke2);
         return _loc1_;
      }
      
      private function _MenuItemRenderer_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 30;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._MenuItemRenderer_BitmapImage1_i()];
         _loc1_.id = "_MenuItemRenderer_Group2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._MenuItemRenderer_Group2 = _loc1_;
         BindingManager.executeBindings(this,"_MenuItemRenderer_Group2",this._MenuItemRenderer_Group2);
         return _loc1_;
      }
      
      private function _MenuItemRenderer_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.smooth = true;
         _loc1_.initialized(this,"_MenuItemRenderer_BitmapImage1");
         this._MenuItemRenderer_BitmapImage1 = _loc1_;
         BindingManager.executeBindings(this,"_MenuItemRenderer_BitmapImage1",this._MenuItemRenderer_BitmapImage1);
         return _loc1_;
      }
      
      private function _MenuItemRenderer_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("paddingLeft",10);
         _loc1_.setStyle("paddingRight",10);
         _loc1_.setStyle("textAlign","left");
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",labelDisplay);
         return _loc1_;
      }
      
      private function _MenuItemRenderer_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.width = 20;
         _loc1_.mxmlContent = [this._MenuItemRenderer_Path2_c()];
         _loc1_.id = "_MenuItemRenderer_Group3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._MenuItemRenderer_Group3 = _loc1_;
         BindingManager.executeBindings(this,"_MenuItemRenderer_Group3",this._MenuItemRenderer_Group3);
         return _loc1_;
      }
      
      private function _MenuItemRenderer_Path2_c() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.verticalCenter = -0.5;
         _loc1_.horizontalCenter = 0;
         _loc1_.data = "M 0 0 l 5 4 l -5 4";
         _loc1_.stroke = this._MenuItemRenderer_SolidColorStroke3_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _MenuItemRenderer_SolidColorStroke3_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.weight = 2;
         _loc1_.caps = "square";
         _loc1_.color = 5486248;
         this._MenuItemRenderer_SolidColorStroke3 = _loc1_;
         BindingManager.executeBindings(this,"_MenuItemRenderer_SolidColorStroke3",this._MenuItemRenderer_SolidColorStroke3);
         return _loc1_;
      }
      
      private function _MenuItemRenderer_PopUpAnchor1_i() : spark.components.PopUpAnchor
      {
         var _loc1_:spark.components.PopUpAnchor = new spark.components.PopUpAnchor();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.popUpWidthMatchesAnchorWidth = false;
         _loc1_.popUpHeightMatchesAnchorHeight = false;
         _loc1_.displayPopUp = false;
         _loc1_.popUpPosition = "right";
         _loc1_.popUp = this._MenuItemRenderer_MenuItemList1_i();
         _loc1_.id = "subMenuDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.subMenuDisplay = _loc1_;
         BindingManager.executeBindings(this,"subMenuDisplay",this.subMenuDisplay);
         return _loc1_;
      }
      
      private function _MenuItemRenderer_MenuItemList1_i() : MenuItemList
      {
         var _loc1_:MenuItemList = new MenuItemList();
         _loc1_.addEventListener("itemClick",this.__subMenu_itemClick);
         _loc1_.id = "subMenu";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.subMenu = _loc1_;
         BindingManager.executeBindings(this,"subMenu",this.subMenu);
         return _loc1_;
      }
      
      public function __subMenu_itemClick(param1:MenuItemEvent) : void
      {
         this.onItemClick(param1);
      }
      
      public function ___MenuItemRenderer_ItemRenderer1_mouseOver(param1:MouseEvent) : void
      {
         this.onMouseOver(param1);
      }
      
      public function ___MenuItemRenderer_ItemRenderer1_removedFromStage(param1:Event) : void
      {
         this.onRemove();
      }
      
      private function _MenuItemRenderer_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Boolean
         {
            return displayOverlay;
         },null,"this.buttonMode");
         result[1] = new Binding(this,function():Boolean
         {
            return model.enabled;
         },null,"this.enabled");
         result[2] = new Binding(this,function():Boolean
         {
            return model.enabled;
         },null,"this.mouseEnabled");
         result[3] = new Binding(this,function():Boolean
         {
            return displayOverlay;
         },null,"_MenuItemRenderer_Rect1.visible");
         result[4] = new Binding(this,function():Boolean
         {
            return displaySeparator;
         },null,"_MenuItemRenderer_Line1.visible");
         result[5] = new Binding(this,function():Boolean
         {
            return displaySeparator;
         },null,"_MenuItemRenderer_Line1.includeInLayout");
         result[6] = new Binding(this,function():Boolean
         {
            return !displaySeparator;
         },null,"_MenuItemRenderer_HGroup1.visible");
         result[7] = new Binding(this,function():Boolean
         {
            return !displaySeparator;
         },null,"_MenuItemRenderer_HGroup1.includeInLayout");
         result[8] = new Binding(this,function():Boolean
         {
            return model.selected && model.selectable;
         },null,"selectedIndicator.visible");
         result[9] = new Binding(this,function():Boolean
         {
            return displayIndicator;
         },null,"selectedIndicator.includeInLayout");
         result[10] = new Binding(this,function():Boolean
         {
            return model.icon != null;
         },null,"_MenuItemRenderer_Group2.visible");
         result[11] = new Binding(this,function():Boolean
         {
            return model.icon != null;
         },null,"_MenuItemRenderer_Group2.includeInLayout");
         result[12] = new Binding(this,function():Object
         {
            return model.icon;
         },null,"_MenuItemRenderer_BitmapImage1.source");
         result[13] = new Binding(this,function():Boolean
         {
            return model.hasSubMenu();
         },null,"_MenuItemRenderer_Group3.visible");
         result[14] = new Binding(this,function():Boolean
         {
            return model.hasSubMenu();
         },null,"subMenu.includeInLayout");
         result[15] = new Binding(this,function():Boolean
         {
            return model.hasSubMenu();
         },null,"subMenu.visible");
         result[16] = new Binding(this,function():IList
         {
            return model.subMenu;
         },null,"subMenu.dataProvider");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _MenuItemRenderer_SolidColorStroke2() : SolidColorStroke
      {
         return this._63492407_MenuItemRenderer_SolidColorStroke2;
      }
      
      public function set _MenuItemRenderer_SolidColorStroke2(param1:SolidColorStroke) : void
      {
         var _loc2_:Object = this._63492407_MenuItemRenderer_SolidColorStroke2;
         if(_loc2_ !== param1)
         {
            this._63492407_MenuItemRenderer_SolidColorStroke2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_MenuItemRenderer_SolidColorStroke2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _MenuItemRenderer_SolidColorStroke3() : SolidColorStroke
      {
         return this._63492408_MenuItemRenderer_SolidColorStroke3;
      }
      
      public function set _MenuItemRenderer_SolidColorStroke3(param1:SolidColorStroke) : void
      {
         var _loc2_:Object = this._63492408_MenuItemRenderer_SolidColorStroke3;
         if(_loc2_ !== param1)
         {
            this._63492408_MenuItemRenderer_SolidColorStroke3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_MenuItemRenderer_SolidColorStroke3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get selectedIndicator() : Group
      {
         return this._1896065460selectedIndicator;
      }
      
      public function set selectedIndicator(param1:Group) : void
      {
         var _loc2_:Object = this._1896065460selectedIndicator;
         if(_loc2_ !== param1)
         {
            this._1896065460selectedIndicator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"selectedIndicator",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get subMenu() : MenuItemList
      {
         return this._1868748865subMenu;
      }
      
      public function set subMenu(param1:MenuItemList) : void
      {
         var _loc2_:Object = this._1868748865subMenu;
         if(_loc2_ !== param1)
         {
            this._1868748865subMenu = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"subMenu",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get subMenuDisplay() : spark.components.PopUpAnchor
      {
         return this._1971903485subMenuDisplay;
      }
      
      public function set subMenuDisplay(param1:spark.components.PopUpAnchor) : void
      {
         var _loc2_:Object = this._1971903485subMenuDisplay;
         if(_loc2_ !== param1)
         {
            this._1971903485subMenuDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"subMenuDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get model() : MenuItemModel
      {
         return this._104069929model;
      }
      
      protected function set model(param1:MenuItemModel) : void
      {
         var _loc2_:Object = this._104069929model;
         if(_loc2_ !== param1)
         {
            this._104069929model = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"model",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get displayIndicator() : Boolean
      {
         return this._893353837displayIndicator;
      }
      
      protected function set displayIndicator(param1:Boolean) : void
      {
         var _loc2_:Object = this._893353837displayIndicator;
         if(_loc2_ !== param1)
         {
            this._893353837displayIndicator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"displayIndicator",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get displaySeparator() : Boolean
      {
         return this._956783549displaySeparator;
      }
      
      protected function set displaySeparator(param1:Boolean) : void
      {
         var _loc2_:Object = this._956783549displaySeparator;
         if(_loc2_ !== param1)
         {
            this._956783549displaySeparator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"displaySeparator",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get displayOverlay() : Boolean
      {
         return this._532727086displayOverlay;
      }
      
      protected function set displayOverlay(param1:Boolean) : void
      {
         var _loc2_:Object = this._532727086displayOverlay;
         if(_loc2_ !== param1)
         {
            this._532727086displayOverlay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"displayOverlay",_loc2_,param1));
            }
         }
      }
   }
}
