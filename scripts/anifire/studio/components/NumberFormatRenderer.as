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
   import spark.components.Label;
   import spark.components.supportClasses.ItemRenderer;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class NumberFormatRenderer extends ItemRenderer implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _NumberFormatRenderer_Line1:Line;
      
      public var _NumberFormatRenderer_Rect1:Rect;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _1110499025validItem:Boolean;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function NumberFormatRenderer()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._NumberFormatRenderer_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_NumberFormatRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return NumberFormatRenderer[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.autoDrawBackground = false;
         this.minHeight = 0;
         this.mxmlContent = [this._NumberFormatRenderer_Line1_i(),this._NumberFormatRenderer_Label1_i()];
         this.currentState = "normal";
         var _NumberFormatRenderer_Rect1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._NumberFormatRenderer_Rect1_i);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"hovered",
            "stateGroups":["hoveredAndSelected"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_NumberFormatRenderer_Rect1_factory,
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
            "stateGroups":["hoveredAndSelected"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_NumberFormatRenderer_Rect1_factory,
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
         NumberFormatRenderer._watcherSetupUtil = param1;
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
         this.validItem = param1 != -1;
      }
      
      private function _NumberFormatRenderer_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 3;
         _loc1_.right = 3;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._NumberFormatRenderer_SolidColor1_c();
         _loc1_.initialized(this,"_NumberFormatRenderer_Rect1");
         this._NumberFormatRenderer_Rect1 = _loc1_;
         BindingManager.executeBindings(this,"_NumberFormatRenderer_Rect1",this._NumberFormatRenderer_Rect1);
         return _loc1_;
      }
      
      private function _NumberFormatRenderer_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 6142119;
         return _loc1_;
      }
      
      private function _NumberFormatRenderer_Line1_i() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.top = 5;
         _loc1_.bottom = 5;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.stroke = this._NumberFormatRenderer_SolidColorStroke1_c();
         _loc1_.initialized(this,"_NumberFormatRenderer_Line1");
         this._NumberFormatRenderer_Line1 = _loc1_;
         BindingManager.executeBindings(this,"_NumberFormatRenderer_Line1",this._NumberFormatRenderer_Line1);
         return _loc1_;
      }
      
      private function _NumberFormatRenderer_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 0;
         return _loc1_;
      }
      
      private function _NumberFormatRenderer_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("paddingLeft",10);
         _loc1_.setStyle("paddingRight",10);
         _loc1_.setStyle("paddingTop",5);
         _loc1_.setStyle("paddingBottom",5);
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
      
      private function _NumberFormatRenderer_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Boolean
         {
            return validItem;
         },null,"this.buttonMode");
         result[1] = new Binding(this,function():Boolean
         {
            return validItem;
         },null,"this.enabled");
         result[2] = new Binding(this,function():Boolean
         {
            return validItem;
         },null,"this.mouseEnabled");
         result[3] = new Binding(this,function():Boolean
         {
            return validItem;
         },null,"_NumberFormatRenderer_Rect1.visible");
         result[4] = new Binding(this,function():Boolean
         {
            return !validItem;
         },null,"_NumberFormatRenderer_Line1.visible");
         result[5] = new Binding(this,function():Boolean
         {
            return !validItem;
         },null,"_NumberFormatRenderer_Line1.includeInLayout");
         result[6] = new Binding(this,function():Boolean
         {
            return validItem;
         },null,"labelDisplay.visible");
         result[7] = new Binding(this,function():Boolean
         {
            return validItem;
         },null,"labelDisplay.includeInLayout");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      protected function get validItem() : Boolean
      {
         return this._1110499025validItem;
      }
      
      protected function set validItem(param1:Boolean) : void
      {
         var _loc2_:Object = this._1110499025validItem;
         if(_loc2_ !== param1)
         {
            this._1110499025validItem = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"validItem",_loc2_,param1));
            }
         }
      }
   }
}
