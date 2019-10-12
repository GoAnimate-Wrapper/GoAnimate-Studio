package anifire.studio.components
{
   import anifire.studio.models.MenuItemModel;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.SetStyle;
   import mx.states.State;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.supportClasses.ItemRenderer;
   import spark.primitives.BitmapImage;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class WidgetIconDirectionRenderer extends ItemRenderer implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _WidgetIconDirectionRenderer_BitmapImage1:BitmapImage;
      
      public var _WidgetIconDirectionRenderer_Group1:Group;
      
      public var _WidgetIconDirectionRenderer_HGroup1:HGroup;
      
      public var _WidgetIconDirectionRenderer_Line1:Line;
      
      public var _WidgetIconDirectionRenderer_Rect1:Rect;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _104069929model:MenuItemModel;
      
      protected var _956783549displaySeparator:Boolean = false;
      
      protected var _532727086displayOverlay:Boolean = true;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function WidgetIconDirectionRenderer()
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
         bindings = this._WidgetIconDirectionRenderer_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_WidgetIconDirectionRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return WidgetIconDirectionRenderer[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.autoDrawBackground = false;
         this.minHeight = 0;
         this.mxmlContent = [this._WidgetIconDirectionRenderer_Line1_i(),this._WidgetIconDirectionRenderer_HGroup1_i()];
         this.currentState = "normal";
         var _WidgetIconDirectionRenderer_Rect1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._WidgetIconDirectionRenderer_Rect1_i);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"hovered",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_WidgetIconDirectionRenderer_Rect1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
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
         WidgetIconDirectionRenderer._watcherSetupUtil = param1;
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
            this.displayOverlay = !this.displaySeparator && this.model.enabled;
         }
      }
      
      private function _WidgetIconDirectionRenderer_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 3;
         _loc1_.right = 3;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._WidgetIconDirectionRenderer_SolidColor1_c();
         _loc1_.initialized(this,"_WidgetIconDirectionRenderer_Rect1");
         this._WidgetIconDirectionRenderer_Rect1 = _loc1_;
         BindingManager.executeBindings(this,"_WidgetIconDirectionRenderer_Rect1",this._WidgetIconDirectionRenderer_Rect1);
         return _loc1_;
      }
      
      private function _WidgetIconDirectionRenderer_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 6142119;
         return _loc1_;
      }
      
      private function _WidgetIconDirectionRenderer_Line1_i() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.top = 5;
         _loc1_.bottom = 5;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.stroke = this._WidgetIconDirectionRenderer_SolidColorStroke1_c();
         _loc1_.initialized(this,"_WidgetIconDirectionRenderer_Line1");
         this._WidgetIconDirectionRenderer_Line1 = _loc1_;
         BindingManager.executeBindings(this,"_WidgetIconDirectionRenderer_Line1",this._WidgetIconDirectionRenderer_Line1);
         return _loc1_;
      }
      
      private function _WidgetIconDirectionRenderer_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 0;
         return _loc1_;
      }
      
      private function _WidgetIconDirectionRenderer_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.left = 5;
         _loc1_.right = 5;
         _loc1_.top = 5;
         _loc1_.bottom = 5;
         _loc1_.verticalAlign = "middle";
         _loc1_.gap = -4;
         _loc1_.mxmlContent = [this._WidgetIconDirectionRenderer_Group1_i(),this._WidgetIconDirectionRenderer_Label1_i()];
         _loc1_.id = "_WidgetIconDirectionRenderer_HGroup1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._WidgetIconDirectionRenderer_HGroup1 = _loc1_;
         BindingManager.executeBindings(this,"_WidgetIconDirectionRenderer_HGroup1",this._WidgetIconDirectionRenderer_HGroup1);
         return _loc1_;
      }
      
      private function _WidgetIconDirectionRenderer_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 30;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._WidgetIconDirectionRenderer_BitmapImage1_i()];
         _loc1_.id = "_WidgetIconDirectionRenderer_Group1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._WidgetIconDirectionRenderer_Group1 = _loc1_;
         BindingManager.executeBindings(this,"_WidgetIconDirectionRenderer_Group1",this._WidgetIconDirectionRenderer_Group1);
         return _loc1_;
      }
      
      private function _WidgetIconDirectionRenderer_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.smooth = true;
         _loc1_.initialized(this,"_WidgetIconDirectionRenderer_BitmapImage1");
         this._WidgetIconDirectionRenderer_BitmapImage1 = _loc1_;
         BindingManager.executeBindings(this,"_WidgetIconDirectionRenderer_BitmapImage1",this._WidgetIconDirectionRenderer_BitmapImage1);
         return _loc1_;
      }
      
      private function _WidgetIconDirectionRenderer_Label1_i() : Label
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
      
      private function _WidgetIconDirectionRenderer_bindingsSetup() : Array
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
         },null,"_WidgetIconDirectionRenderer_Rect1.visible");
         result[4] = new Binding(this,function():Boolean
         {
            return displaySeparator;
         },null,"_WidgetIconDirectionRenderer_Line1.visible");
         result[5] = new Binding(this,function():Boolean
         {
            return displaySeparator;
         },null,"_WidgetIconDirectionRenderer_Line1.includeInLayout");
         result[6] = new Binding(this,function():Boolean
         {
            return !displaySeparator;
         },null,"_WidgetIconDirectionRenderer_HGroup1.visible");
         result[7] = new Binding(this,function():Boolean
         {
            return !displaySeparator;
         },null,"_WidgetIconDirectionRenderer_HGroup1.includeInLayout");
         result[8] = new Binding(this,function():Boolean
         {
            return model.icon != null;
         },null,"_WidgetIconDirectionRenderer_Group1.visible");
         result[9] = new Binding(this,function():Boolean
         {
            return model.icon != null;
         },null,"_WidgetIconDirectionRenderer_Group1.includeInLayout");
         result[10] = new Binding(this,function():Object
         {
            return model.icon;
         },null,"_WidgetIconDirectionRenderer_BitmapImage1.source");
         return result;
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
