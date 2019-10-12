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
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class SceneTransitionItemRenderer extends ItemRenderer implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _SceneTransitionItemRenderer_Rect1:Rect;
      
      private var _1031744009iconDisplay:SceneTransitionIcon;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SceneTransitionItemRenderer()
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
         bindings = this._SceneTransitionItemRenderer_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_SceneTransitionItemRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SceneTransitionItemRenderer[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.autoDrawBackground = false;
         this.buttonMode = true;
         this.minHeight = 28;
         this.mxmlContent = [this._SceneTransitionItemRenderer_HGroup1_c(),this._SceneTransitionItemRenderer_Line1_c()];
         this.currentState = "normal";
         var _SceneTransitionItemRenderer_Rect1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._SceneTransitionItemRenderer_Rect1_i);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"hovered",
            "stateGroups":["hoveredStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_SceneTransitionItemRenderer_Rect1_factory,
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
               "itemsFactory":_SceneTransitionItemRenderer_Rect1_factory,
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
         SceneTransitionItemRenderer._watcherSetupUtil = param1;
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
      
      protected function getTransitionType(param1:Object) : String
      {
         if(param1 is MenuItemModel)
         {
            return param1.value;
         }
         return "";
      }
      
      private function _SceneTransitionItemRenderer_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 10;
         _loc1_.right = 8;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._SceneTransitionItemRenderer_SolidColor1_c();
         _loc1_.initialized(this,"_SceneTransitionItemRenderer_Rect1");
         this._SceneTransitionItemRenderer_Rect1 = _loc1_;
         BindingManager.executeBindings(this,"_SceneTransitionItemRenderer_Rect1",this._SceneTransitionItemRenderer_Rect1);
         return _loc1_;
      }
      
      private function _SceneTransitionItemRenderer_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 7192496;
         return _loc1_;
      }
      
      private function _SceneTransitionItemRenderer_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.height = 34;
         _loc1_.verticalAlign = "middle";
         _loc1_.paddingLeft = 18;
         _loc1_.paddingRight = 18;
         _loc1_.paddingTop = 5;
         _loc1_.paddingBottom = 5;
         _loc1_.mxmlContent = [this._SceneTransitionItemRenderer_Group1_c(),this._SceneTransitionItemRenderer_Label1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SceneTransitionItemRenderer_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._SceneTransitionItemRenderer_Rect2_c(),this._SceneTransitionItemRenderer_SceneTransitionIcon1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SceneTransitionItemRenderer_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._SceneTransitionItemRenderer_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SceneTransitionItemRenderer_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _SceneTransitionItemRenderer_SceneTransitionIcon1_i() : SceneTransitionIcon
      {
         var _loc1_:SceneTransitionIcon = new SceneTransitionIcon();
         _loc1_.width = 30;
         _loc1_.height = 22;
         _loc1_.left = 2;
         _loc1_.right = 2;
         _loc1_.top = 2;
         _loc1_.bottom = 2;
         _loc1_.initialized(this,"iconDisplay");
         this.iconDisplay = _loc1_;
         BindingManager.executeBindings(this,"iconDisplay",this.iconDisplay);
         return _loc1_;
      }
      
      private function _SceneTransitionItemRenderer_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("fontSize",13);
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("color",5724523);
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",labelDisplay);
         return _loc1_;
      }
      
      private function _SceneTransitionItemRenderer_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.bottom = -1;
         _loc1_.percentWidth = 100;
         _loc1_.left = 10;
         _loc1_.right = 8;
         _loc1_.stroke = this._SceneTransitionItemRenderer_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SceneTransitionItemRenderer_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 15658734;
         return _loc1_;
      }
      
      private function _SceneTransitionItemRenderer_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = getTransitionType(data);
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"iconDisplay.transitionType");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get iconDisplay() : SceneTransitionIcon
      {
         return this._1031744009iconDisplay;
      }
      
      public function set iconDisplay(param1:SceneTransitionIcon) : void
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
   }
}
