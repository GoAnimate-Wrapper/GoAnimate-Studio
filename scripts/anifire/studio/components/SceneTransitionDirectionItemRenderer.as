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
   import mx.states.AddItems;
   import mx.states.SetStyle;
   import mx.states.State;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.supportClasses.ItemRenderer;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class SceneTransitionDirectionItemRenderer extends ItemRenderer implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _SceneTransitionDirectionItemRenderer_Rect1:Rect;
      
      private var _2024940825imageDisplay:DestinationImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SceneTransitionDirectionItemRenderer()
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
         bindings = this._SceneTransitionDirectionItemRenderer_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_SceneTransitionDirectionItemRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SceneTransitionDirectionItemRenderer[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.autoDrawBackground = false;
         this.buttonMode = true;
         this.minHeight = 24;
         this.minWidth = 50;
         this.mxmlContent = [this._SceneTransitionDirectionItemRenderer_HGroup1_c()];
         this.currentState = "normal";
         var _SceneTransitionDirectionItemRenderer_Rect1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._SceneTransitionDirectionItemRenderer_Rect1_i);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"hovered",
            "stateGroups":["hoveredStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_SceneTransitionDirectionItemRenderer_Rect1_factory,
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
               "itemsFactory":_SceneTransitionDirectionItemRenderer_Rect1_factory,
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
         SceneTransitionDirectionItemRenderer._watcherSetupUtil = param1;
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
      
      private function _SceneTransitionDirectionItemRenderer_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 3;
         _loc1_.right = 3;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._SceneTransitionDirectionItemRenderer_SolidColor1_c();
         _loc1_.initialized(this,"_SceneTransitionDirectionItemRenderer_Rect1");
         this._SceneTransitionDirectionItemRenderer_Rect1 = _loc1_;
         BindingManager.executeBindings(this,"_SceneTransitionDirectionItemRenderer_Rect1",this._SceneTransitionDirectionItemRenderer_Rect1);
         return _loc1_;
      }
      
      private function _SceneTransitionDirectionItemRenderer_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 6142119;
         return _loc1_;
      }
      
      private function _SceneTransitionDirectionItemRenderer_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.verticalAlign = "baseline";
         _loc1_.gap = 2;
         _loc1_.paddingRight = 5;
         _loc1_.mxmlContent = [this._SceneTransitionDirectionItemRenderer_DestinationImage1_i(),this._SceneTransitionDirectionItemRenderer_Label1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SceneTransitionDirectionItemRenderer_DestinationImage1_i() : DestinationImage
      {
         var _loc1_:DestinationImage = new DestinationImage();
         _loc1_.id = "imageDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.imageDisplay = _loc1_;
         BindingManager.executeBindings(this,"imageDisplay",this.imageDisplay);
         return _loc1_;
      }
      
      private function _SceneTransitionDirectionItemRenderer_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
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
      
      private function _SceneTransitionDirectionItemRenderer_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Boolean
         {
            return data.enabled;
         },null,"this.enabled");
         result[1] = new Binding(this,function():Boolean
         {
            return data.enabled;
         },null,"this.mouseEnabled");
         result[2] = new Binding(this,function():int
         {
            return data.value;
         },null,"imageDisplay.destination");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get imageDisplay() : DestinationImage
      {
         return this._2024940825imageDisplay;
      }
      
      public function set imageDisplay(param1:DestinationImage) : void
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
   }
}
