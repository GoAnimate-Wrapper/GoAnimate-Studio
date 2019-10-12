package anifire.studio.components
{
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
   import spark.primitives.BitmapImage;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class DefaultDropDownListItemRenderer extends ItemRenderer implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _DefaultDropDownListItemRenderer_HGroup1:HGroup;
      
      public var _DefaultDropDownListItemRenderer_Line1:Line;
      
      public var _DefaultDropDownListItemRenderer_Rect1:Rect;
      
      private var _1031744009iconDisplay:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _956783549displaySeparator:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function DefaultDropDownListItemRenderer()
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
         bindings = this._DefaultDropDownListItemRenderer_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_DefaultDropDownListItemRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return DefaultDropDownListItemRenderer[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.autoDrawBackground = false;
         this.minHeight = 0;
         this.percentWidth = 100;
         this.mxmlContent = [this._DefaultDropDownListItemRenderer_Line1_i(),this._DefaultDropDownListItemRenderer_HGroup1_i()];
         this.currentState = "normal";
         var _DefaultDropDownListItemRenderer_Rect1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._DefaultDropDownListItemRenderer_Rect1_i);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"hovered",
            "stateGroups":["hoveredStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_DefaultDropDownListItemRenderer_Rect1_factory,
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
            "stateGroups":["hoveredStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_DefaultDropDownListItemRenderer_Rect1_factory,
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
         DefaultDropDownListItemRenderer._watcherSetupUtil = param1;
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
      
      protected function getIcon(param1:Object) : Class
      {
         if(param1)
         {
            return param1.icon;
         }
         return null;
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         if(param1 && param1.hasOwnProperty("id") && param1.id == "separator")
         {
            this.displaySeparator = true;
            this.enabled = false;
            this.mouseEnabled = false;
            this.buttonMode = false;
         }
         else
         {
            this.displaySeparator = false;
            this.enabled = true;
            this.mouseEnabled = true;
            this.buttonMode = true;
         }
      }
      
      private function _DefaultDropDownListItemRenderer_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 3;
         _loc1_.right = 3;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._DefaultDropDownListItemRenderer_SolidColor1_c();
         _loc1_.initialized(this,"_DefaultDropDownListItemRenderer_Rect1");
         this._DefaultDropDownListItemRenderer_Rect1 = _loc1_;
         BindingManager.executeBindings(this,"_DefaultDropDownListItemRenderer_Rect1",this._DefaultDropDownListItemRenderer_Rect1);
         return _loc1_;
      }
      
      private function _DefaultDropDownListItemRenderer_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 6142119;
         return _loc1_;
      }
      
      private function _DefaultDropDownListItemRenderer_Line1_i() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.top = 4;
         _loc1_.bottom = 3;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.stroke = this._DefaultDropDownListItemRenderer_SolidColorStroke1_c();
         _loc1_.initialized(this,"_DefaultDropDownListItemRenderer_Line1");
         this._DefaultDropDownListItemRenderer_Line1 = _loc1_;
         BindingManager.executeBindings(this,"_DefaultDropDownListItemRenderer_Line1",this._DefaultDropDownListItemRenderer_Line1);
         return _loc1_;
      }
      
      private function _DefaultDropDownListItemRenderer_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 13289672;
         return _loc1_;
      }
      
      private function _DefaultDropDownListItemRenderer_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.paddingLeft = 8;
         _loc1_.paddingRight = 8;
         _loc1_.paddingTop = 5;
         _loc1_.paddingBottom = 5;
         _loc1_.mxmlContent = [this._DefaultDropDownListItemRenderer_BitmapImage1_i(),this._DefaultDropDownListItemRenderer_Label1_i()];
         _loc1_.id = "_DefaultDropDownListItemRenderer_HGroup1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._DefaultDropDownListItemRenderer_HGroup1 = _loc1_;
         BindingManager.executeBindings(this,"_DefaultDropDownListItemRenderer_HGroup1",this._DefaultDropDownListItemRenderer_HGroup1);
         return _loc1_;
      }
      
      private function _DefaultDropDownListItemRenderer_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.scaleMode = "letterbox";
         _loc1_.initialized(this,"iconDisplay");
         this.iconDisplay = _loc1_;
         BindingManager.executeBindings(this,"iconDisplay",this.iconDisplay);
         return _loc1_;
      }
      
      private function _DefaultDropDownListItemRenderer_Label1_i() : Label
      {
         var _loc1_:Label = null;
         _loc1_ = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.height = 18;
         _loc1_.setStyle("paddingTop",1);
         _loc1_.setStyle("verticalAlign","middle");
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
      
      private function _DefaultDropDownListItemRenderer_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Boolean
         {
            return !displaySeparator;
         },null,"_DefaultDropDownListItemRenderer_Rect1.visible");
         result[1] = new Binding(this,function():Boolean
         {
            return displaySeparator;
         },null,"_DefaultDropDownListItemRenderer_Line1.visible");
         result[2] = new Binding(this,function():Boolean
         {
            return displaySeparator;
         },null,"_DefaultDropDownListItemRenderer_Line1.includeInLayout");
         result[3] = new Binding(this,function():Boolean
         {
            return !displaySeparator;
         },null,"_DefaultDropDownListItemRenderer_HGroup1.visible");
         result[4] = new Binding(this,function():Boolean
         {
            return !displaySeparator;
         },null,"_DefaultDropDownListItemRenderer_HGroup1.includeInLayout");
         result[5] = new Binding(this,function():Object
         {
            return getIcon(data);
         },null,"iconDisplay.source");
         result[6] = new Binding(this,function():Boolean
         {
            return getIcon(data) != null;
         },null,"iconDisplay.includeInLayout");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get iconDisplay() : BitmapImage
      {
         return this._1031744009iconDisplay;
      }
      
      public function set iconDisplay(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1031744009iconDisplay;
         if(_loc2_ !== param1)
         {
            this._1031744009iconDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"iconDisplay",_loc2_,param1));
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
   }
}
