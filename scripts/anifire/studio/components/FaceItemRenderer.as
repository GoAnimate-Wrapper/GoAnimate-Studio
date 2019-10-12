package anifire.studio.components
{
   import anifire.studio.models.FacePreviewModel;
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
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.supportClasses.ItemRenderer;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class FaceItemRenderer extends ItemRenderer implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _FaceItemRenderer_HGroup1:HGroup;
      
      public var _FaceItemRenderer_Line1:Line;
      
      public var _FaceItemRenderer_Rect1:Rect;
      
      private var _2024940825imageDisplay:FaceThumbSparkImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _104069929model:MenuItemModel;
      
      protected var _956783549displaySeparator:Boolean = false;
      
      protected var _374000446facePreviewModel:FacePreviewModel;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function FaceItemRenderer()
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
         bindings = this._FaceItemRenderer_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_FaceItemRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return FaceItemRenderer[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.autoDrawBackground = false;
         this.minHeight = 0;
         this.percentWidth = 100;
         this.mxmlContent = [this._FaceItemRenderer_Line1_i(),this._FaceItemRenderer_HGroup1_i()];
         this.currentState = "normal";
         var _FaceItemRenderer_Rect1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._FaceItemRenderer_Rect1_i);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"hovered",
            "stateGroups":["overAndDownStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_FaceItemRenderer_Rect1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new SetStyle().initializeFromObject({
               "target":"labelDisplay",
               "name":"color",
               "value":16777215
            })]
         }),new State({
            "name":"selected",
            "stateGroups":["overAndDownStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_FaceItemRenderer_Rect1_factory,
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
         FaceItemRenderer._watcherSetupUtil = param1;
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
            this.facePreviewModel = this.model.value as FacePreviewModel;
         }
      }
      
      private function _FaceItemRenderer_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 3;
         _loc1_.right = 3;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._FaceItemRenderer_SolidColor1_c();
         _loc1_.initialized(this,"_FaceItemRenderer_Rect1");
         this._FaceItemRenderer_Rect1 = _loc1_;
         BindingManager.executeBindings(this,"_FaceItemRenderer_Rect1",this._FaceItemRenderer_Rect1);
         return _loc1_;
      }
      
      private function _FaceItemRenderer_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 6142119;
         return _loc1_;
      }
      
      private function _FaceItemRenderer_Line1_i() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.top = 4;
         _loc1_.bottom = 3;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.stroke = this._FaceItemRenderer_SolidColorStroke1_c();
         _loc1_.initialized(this,"_FaceItemRenderer_Line1");
         this._FaceItemRenderer_Line1 = _loc1_;
         BindingManager.executeBindings(this,"_FaceItemRenderer_Line1",this._FaceItemRenderer_Line1);
         return _loc1_;
      }
      
      private function _FaceItemRenderer_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 13289672;
         return _loc1_;
      }
      
      private function _FaceItemRenderer_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.paddingLeft = 11;
         _loc1_.paddingRight = 11;
         _loc1_.paddingTop = 4;
         _loc1_.paddingBottom = 4;
         _loc1_.gap = 4;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._FaceItemRenderer_FaceThumbSparkImage1_i(),this._FaceItemRenderer_Label1_i()];
         _loc1_.id = "_FaceItemRenderer_HGroup1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._FaceItemRenderer_HGroup1 = _loc1_;
         BindingManager.executeBindings(this,"_FaceItemRenderer_HGroup1",this._FaceItemRenderer_HGroup1);
         return _loc1_;
      }
      
      private function _FaceItemRenderer_FaceThumbSparkImage1_i() : FaceThumbSparkImage
      {
         var _loc1_:FaceThumbSparkImage = new FaceThumbSparkImage();
         _loc1_.width = 27;
         _loc1_.height = 27;
         _loc1_.id = "imageDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.imageDisplay = _loc1_;
         BindingManager.executeBindings(this,"imageDisplay",this.imageDisplay);
         return _loc1_;
      }
      
      private function _FaceItemRenderer_Label1_i() : Label
      {
         var _loc1_:Label = null;
         _loc1_ = new Label();
         _loc1_.maxDisplayedLines = 1;
         _loc1_.percentWidth = 100;
         _loc1_.minWidth = 120;
         _loc1_.setStyle("paddingTop",1);
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
      
      private function _FaceItemRenderer_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Boolean
         {
            return !displaySeparator;
         },null,"this.buttonMode");
         result[1] = new Binding(this,function():Boolean
         {
            return model.enabled && imageDisplay.enabled;
         },null,"this.enabled");
         result[2] = new Binding(this,function():Boolean
         {
            return model.enabled;
         },null,"this.mouseEnabled");
         result[3] = new Binding(this,function():Boolean
         {
            return !displaySeparator;
         },null,"_FaceItemRenderer_Rect1.visible");
         result[4] = new Binding(this,function():Boolean
         {
            return displaySeparator;
         },null,"_FaceItemRenderer_Line1.visible");
         result[5] = new Binding(this,function():Boolean
         {
            return displaySeparator;
         },null,"_FaceItemRenderer_Line1.includeInLayout");
         result[6] = new Binding(this,function():Boolean
         {
            return !displaySeparator;
         },null,"_FaceItemRenderer_HGroup1.visible");
         result[7] = new Binding(this,function():Boolean
         {
            return !displaySeparator;
         },null,"_FaceItemRenderer_HGroup1.includeInLayout");
         result[8] = new Binding(this,function():FacePreviewModel
         {
            return facePreviewModel;
         },null,"imageDisplay.model");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get imageDisplay() : FaceThumbSparkImage
      {
         return this._2024940825imageDisplay;
      }
      
      public function set imageDisplay(param1:FaceThumbSparkImage) : void
      {
         var _loc2_:Object = this._2024940825imageDisplay;
         if(_loc2_ !== param1)
         {
            this._2024940825imageDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageDisplay",_loc2_,param1));
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
      protected function get facePreviewModel() : FacePreviewModel
      {
         return this._374000446facePreviewModel;
      }
      
      protected function set facePreviewModel(param1:FacePreviewModel) : void
      {
         var _loc2_:Object = this._374000446facePreviewModel;
         if(_loc2_ !== param1)
         {
            this._374000446facePreviewModel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"facePreviewModel",_loc2_,param1));
            }
         }
      }
   }
}
