package anifire.studio.components
{
   import anifire.models.FontModel;
   import anifire.studio.interfaces.IMenuItemOwner;
   import anifire.studio.interfaces.IMenuItemRenderer;
   import anifire.studio.models.MenuItemModel;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.states.SetProperty;
   import mx.states.SetStyle;
   import mx.states.State;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.supportClasses.ItemRenderer;
   import spark.primitives.BitmapImage;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class UploadFontMenuItemRenderer extends ItemRenderer implements IMenuItemRenderer, IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _UploadFontMenuItemRenderer_BitmapImage1:BitmapImage;
      
      private var _306482786_UploadFontMenuItemRenderer_SolidColor1:SolidColor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _104069929model:MenuItemModel;
      
      private var _font:FontModel;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function UploadFontMenuItemRenderer()
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
         bindings = this._UploadFontMenuItemRenderer_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_UploadFontMenuItemRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return UploadFontMenuItemRenderer[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.height = 34;
         this.width = 225;
         this.buttonMode = true;
         this.mxmlContent = [this._UploadFontMenuItemRenderer_Rect1_c(),this._UploadFontMenuItemRenderer_HGroup1_c()];
         this.currentState = "normal";
         this.addEventListener("mouseOver",this.___UploadFontMenuItemRenderer_ItemRenderer1_mouseOver);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"hovered",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_UploadFontMenuItemRenderer_SolidColor1",
               "name":"color",
               "value":5158568
            }),new SetStyle().initializeFromObject({
               "target":"labelDisplay",
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
         UploadFontMenuItemRenderer._watcherSetupUtil = param1;
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
      
      private function _UploadFontMenuItemRenderer_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._UploadFontMenuItemRenderer_SolidColor1_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _UploadFontMenuItemRenderer_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         this._UploadFontMenuItemRenderer_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_UploadFontMenuItemRenderer_SolidColor1",this._UploadFontMenuItemRenderer_SolidColor1);
         return _loc1_;
      }
      
      private function _UploadFontMenuItemRenderer_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.left = 0;
         _loc1_.right = 10;
         _loc1_.top = 5;
         _loc1_.bottom = 5;
         _loc1_.verticalAlign = "middle";
         _loc1_.gap = -4;
         _loc1_.mxmlContent = [this._UploadFontMenuItemRenderer_Label1_i(),this._UploadFontMenuItemRenderer_Group1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _UploadFontMenuItemRenderer_Label1_i() : Label
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
      
      private function _UploadFontMenuItemRenderer_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 30;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._UploadFontMenuItemRenderer_BitmapImage1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _UploadFontMenuItemRenderer_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.smooth = true;
         _loc1_.initialized(this,"_UploadFontMenuItemRenderer_BitmapImage1");
         this._UploadFontMenuItemRenderer_BitmapImage1 = _loc1_;
         BindingManager.executeBindings(this,"_UploadFontMenuItemRenderer_BitmapImage1",this._UploadFontMenuItemRenderer_BitmapImage1);
         return _loc1_;
      }
      
      public function ___UploadFontMenuItemRenderer_ItemRenderer1_mouseOver(param1:MouseEvent) : void
      {
         this.onMouseOver(param1);
      }
      
      private function _UploadFontMenuItemRenderer_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Boolean
         {
            return model.enabled;
         },null,"this.enabled");
         result[1] = new Binding(this,function():Boolean
         {
            return model.enabled;
         },null,"this.mouseEnabled");
         result[2] = new Binding(this,function():Object
         {
            return model.icon;
         },null,"_UploadFontMenuItemRenderer_BitmapImage1.source");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _UploadFontMenuItemRenderer_SolidColor1() : SolidColor
      {
         return this._306482786_UploadFontMenuItemRenderer_SolidColor1;
      }
      
      public function set _UploadFontMenuItemRenderer_SolidColor1(param1:SolidColor) : void
      {
         var _loc2_:Object = this._306482786_UploadFontMenuItemRenderer_SolidColor1;
         if(_loc2_ !== param1)
         {
            this._306482786_UploadFontMenuItemRenderer_SolidColor1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_UploadFontMenuItemRenderer_SolidColor1",_loc2_,param1));
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
   }
}
