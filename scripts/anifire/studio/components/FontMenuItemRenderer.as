package anifire.studio.components
{
   import anifire.models.FontModel;
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
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.states.SetProperty;
   import mx.states.SetStyle;
   import mx.states.State;
   import spark.components.Label;
   import spark.components.supportClasses.ItemRenderer;
   import spark.primitives.BitmapImage;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class FontMenuItemRenderer extends ItemRenderer implements IMenuItemRenderer, IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _1378111698_FontMenuItemRenderer_Rect2:Rect;
      
      private var _1712165942_FontMenuItemRenderer_SetProperty1:SetProperty;
      
      private var _100313435image:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _104069929model:MenuItemModel;
      
      private var _font:FontModel;
      
      protected var _893353837displayIndicator:Boolean;
      
      protected var _956783549displaySeparator:Boolean;
      
      protected var _532727086displayOverlay:Boolean = true;
      
      protected var _1594739129displayImage:Boolean;
      
      private var _1548790679_imageSource:Object;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function FontMenuItemRenderer()
      {
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._FontMenuItemRenderer_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_FontMenuItemRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return FontMenuItemRenderer[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.autoDrawBackground = false;
         this.height = 34;
         this.width = 225;
         this.mxmlContent = [this._FontMenuItemRenderer_Rect1_c(),this._FontMenuItemRenderer_Rect2_i(),this._FontMenuItemRenderer_Label1_i(),this._FontMenuItemRenderer_BitmapImage1_i()];
         this.currentState = "normal";
         this.addEventListener("mouseOver",this.___FontMenuItemRenderer_ItemRenderer1_mouseOver);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"hovered",
            "overrides":[this._FontMenuItemRenderer_SetProperty1 = SetProperty(new SetProperty().initializeFromObject({
               "target":"_FontMenuItemRenderer_Rect2",
               "name":"visible",
               "value":undefined
            })),new SetStyle().initializeFromObject({
               "target":"labelDisplay",
               "name":"color",
               "value":16777215
            })]
         })];
         BindingManager.executeBindings(this,"_FontMenuItemRenderer_SetProperty1",this._FontMenuItemRenderer_SetProperty1);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         FontMenuItemRenderer._watcherSetupUtil = param1;
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
            this.displaySeparator = this.model.menuType == MenuItemModel.MENU_TYPE_SEPARATOR;
            this.displayIndicator = this.model.menuType == MenuItemModel.MENU_TYPE_RADIO || this.model.menuType == MenuItemModel.MENU_TYPE_CHECKBOX;
            this.displayOverlay = !this.displaySeparator && this.model.enabled;
            this._font = this.model.value as FontModel;
            if(this._font)
            {
               this._imageSource = this._font.imageSource;
            }
            else
            {
               this._imageSource = null;
            }
            this.displayImage = this._imageSource != null;
         }
      }
      
      public function closeSubMenu() : void
      {
      }
      
      protected function onMouseOver(param1:MouseEvent) : void
      {
         var _loc2_:IMenuItemOwner = owner as IMenuItemOwner;
         if(_loc2_)
         {
            _loc2_.closeActiveItem();
            _loc2_.activeItem = this;
         }
      }
      
      protected function onItemClick(param1:MenuItemEvent) : void
      {
         var _loc2_:IMenuItemOwner = owner as IMenuItemOwner;
         if(_loc2_)
         {
            _loc2_.menuItemClicked(param1.item,true,param1.mouseEvent);
         }
      }
      
      private function image_readyHandler(param1:Event) : void
      {
         if(this._font && !this._font.listBitmapData)
         {
            this._font.listBitmapData = this.image.bitmapData;
         }
      }
      
      private function _FontMenuItemRenderer_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._FontMenuItemRenderer_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FontMenuItemRenderer_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _FontMenuItemRenderer_Rect2_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.visible = false;
         _loc1_.fill = this._FontMenuItemRenderer_SolidColor2_c();
         _loc1_.initialized(this,"_FontMenuItemRenderer_Rect2");
         this._FontMenuItemRenderer_Rect2 = _loc1_;
         BindingManager.executeBindings(this,"_FontMenuItemRenderer_Rect2",this._FontMenuItemRenderer_Rect2);
         return _loc1_;
      }
      
      private function _FontMenuItemRenderer_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 6142119;
         return _loc1_;
      }
      
      private function _FontMenuItemRenderer_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.left = 5;
         _loc1_.right = 5;
         _loc1_.verticalCenter = 0;
         _loc1_.maxDisplayedLines = 1;
         _loc1_.showTruncationTip = true;
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
      
      private function _FontMenuItemRenderer_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.horizontalAlign = "left";
         _loc1_.left = 5;
         _loc1_.top = 2;
         _loc1_.bottom = 2;
         _loc1_.right = 5;
         _loc1_.scaleMode = "letterbox";
         _loc1_.smooth = true;
         _loc1_.addEventListener("ready",this.__image_ready);
         _loc1_.initialized(this,"image");
         this.image = _loc1_;
         BindingManager.executeBindings(this,"image",this.image);
         return _loc1_;
      }
      
      public function __image_ready(param1:FlexEvent) : void
      {
         this.image_readyHandler(param1);
      }
      
      public function ___FontMenuItemRenderer_ItemRenderer1_mouseOver(param1:MouseEvent) : void
      {
         this.onMouseOver(param1);
      }
      
      private function _FontMenuItemRenderer_bindingsSetup() : Array
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
         result[3] = new Binding(this,function():*
         {
            return displayOverlay;
         },null,"_FontMenuItemRenderer_SetProperty1.value");
         result[4] = new Binding(this,function():Boolean
         {
            return !displayImage;
         },null,"labelDisplay.visible");
         result[5] = new Binding(this,function():Object
         {
            return _imageSource;
         },null,"image.source");
         result[6] = new Binding(this,function():Boolean
         {
            return displayImage;
         },null,"image.visible");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _FontMenuItemRenderer_Rect2() : Rect
      {
         return this._1378111698_FontMenuItemRenderer_Rect2;
      }
      
      public function set _FontMenuItemRenderer_Rect2(param1:Rect) : void
      {
         var _loc2_:Object = this._1378111698_FontMenuItemRenderer_Rect2;
         if(_loc2_ !== param1)
         {
            this._1378111698_FontMenuItemRenderer_Rect2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_FontMenuItemRenderer_Rect2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _FontMenuItemRenderer_SetProperty1() : SetProperty
      {
         return this._1712165942_FontMenuItemRenderer_SetProperty1;
      }
      
      public function set _FontMenuItemRenderer_SetProperty1(param1:SetProperty) : void
      {
         var _loc2_:Object = this._1712165942_FontMenuItemRenderer_SetProperty1;
         if(_loc2_ !== param1)
         {
            this._1712165942_FontMenuItemRenderer_SetProperty1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_FontMenuItemRenderer_SetProperty1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get image() : BitmapImage
      {
         return this._100313435image;
      }
      
      public function set image(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._100313435image;
         if(_loc2_ !== param1)
         {
            this._100313435image = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"image",_loc2_,param1));
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
      
      [Bindable(event="propertyChange")]
      protected function get displayImage() : Boolean
      {
         return this._1594739129displayImage;
      }
      
      protected function set displayImage(param1:Boolean) : void
      {
         var _loc2_:Object = this._1594739129displayImage;
         if(_loc2_ !== param1)
         {
            this._1594739129displayImage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"displayImage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _imageSource() : Object
      {
         return this._1548790679_imageSource;
      }
      
      private function set _imageSource(param1:Object) : void
      {
         var _loc2_:Object = this._1548790679_imageSource;
         if(_loc2_ !== param1)
         {
            this._1548790679_imageSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_imageSource",_loc2_,param1));
            }
         }
      }
   }
}
