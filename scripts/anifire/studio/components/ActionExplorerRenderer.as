package anifire.studio.components
{
   import anifire.studio.models.ActionThumbModel;
   import anifire.util.UtilDict;
   import anifire.util.UtilUser;
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
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.supportClasses.ItemRenderer;
   import spark.primitives.Rect;
   import spark.primitives.RectangularDropShadow;
   
   use namespace mx_internal;
   
   public class ActionExplorerRenderer extends ItemRenderer implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _ActionExplorerRenderer_Rect1:Rect;
      
      public var _ActionExplorerRenderer_RectangularDropShadow1:RectangularDropShadow;
      
      private var _1281441721_ActionExplorerRenderer_SolidColorStroke1:SolidColorStroke;
      
      private var _2024940825imageDisplay:ActionThumbSparkImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _model:ActionThumbModel;
      
      protected var _261136618toolTipContent:String;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ActionExplorerRenderer()
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
         bindings = this._ActionExplorerRenderer_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_ActionExplorerRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ActionExplorerRenderer[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.autoDrawBackground = false;
         this.buttonMode = true;
         this.width = 62;
         this.height = 90;
         this.mxmlContent = [this._ActionExplorerRenderer_Rect1_i(),this._ActionExplorerRenderer_ActionThumbSparkImage1_i()];
         this.currentState = "normal";
         var _ActionExplorerRenderer_RectangularDropShadow1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ActionExplorerRenderer_RectangularDropShadow1_i);
         states = [new State({
            "name":"normal",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_ActionExplorerRenderer_SolidColorStroke1",
               "name":"alpha",
               "value":0
            })]
         }),new State({
            "name":"hovered",
            "stateGroups":["hoveredAndSelected"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_ActionExplorerRenderer_SolidColorStroke1",
               "name":"color",
               "value":5093288
            })]
         }),new State({
            "name":"selected",
            "stateGroups":["hoveredAndSelected"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_ActionExplorerRenderer_RectangularDropShadow1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_ActionExplorerRenderer_Rect1"]
            }),new SetProperty().initializeFromObject({
               "target":"_ActionExplorerRenderer_SolidColorStroke1",
               "name":"color",
               "value":5093288
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
         ActionExplorerRenderer._watcherSetupUtil = param1;
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
         this._model = data as ActionThumbModel;
         if(this._model)
         {
            this.toolTipContent = UtilDict.toDisplay("store",this._model.name);
            if(UtilUser.hasAdminFeatures)
            {
               this.toolTipContent = this.toolTipContent + ("\n" + this._model.actionId);
            }
         }
         this.imageDisplay.model = this._model;
      }
      
      private function _ActionExplorerRenderer_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._ActionExplorerRenderer_SolidColorStroke1_i();
         _loc1_.fill = this._ActionExplorerRenderer_SolidColor1_c();
         _loc1_.initialized(this,"_ActionExplorerRenderer_Rect1");
         this._ActionExplorerRenderer_Rect1 = _loc1_;
         BindingManager.executeBindings(this,"_ActionExplorerRenderer_Rect1",this._ActionExplorerRenderer_Rect1);
         return _loc1_;
      }
      
      private function _ActionExplorerRenderer_SolidColorStroke1_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         this._ActionExplorerRenderer_SolidColorStroke1 = _loc1_;
         BindingManager.executeBindings(this,"_ActionExplorerRenderer_SolidColorStroke1",this._ActionExplorerRenderer_SolidColorStroke1);
         return _loc1_;
      }
      
      private function _ActionExplorerRenderer_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      private function _ActionExplorerRenderer_RectangularDropShadow1_i() : RectangularDropShadow
      {
         var _loc1_:RectangularDropShadow = new RectangularDropShadow();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.alpha = 0.5;
         _loc1_.distance = 0;
         _loc1_.blurX = 4;
         _loc1_.blurY = 4;
         _loc1_.id = "_ActionExplorerRenderer_RectangularDropShadow1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ActionExplorerRenderer_RectangularDropShadow1 = _loc1_;
         BindingManager.executeBindings(this,"_ActionExplorerRenderer_RectangularDropShadow1",this._ActionExplorerRenderer_RectangularDropShadow1);
         return _loc1_;
      }
      
      private function _ActionExplorerRenderer_ActionThumbSparkImage1_i() : ActionThumbSparkImage
      {
         var _loc1_:ActionThumbSparkImage = new ActionThumbSparkImage();
         _loc1_.left = 7;
         _loc1_.right = 7;
         _loc1_.top = 7;
         _loc1_.bottom = 7;
         _loc1_.id = "imageDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.imageDisplay = _loc1_;
         BindingManager.executeBindings(this,"imageDisplay",this.imageDisplay);
         return _loc1_;
      }
      
      private function _ActionExplorerRenderer_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = toolTipContent;
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"this.toolTip");
         result[1] = new Binding(this,function():Boolean
         {
            return imageDisplay.enabled;
         },null,"this.enabled");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _ActionExplorerRenderer_SolidColorStroke1() : SolidColorStroke
      {
         return this._1281441721_ActionExplorerRenderer_SolidColorStroke1;
      }
      
      public function set _ActionExplorerRenderer_SolidColorStroke1(param1:SolidColorStroke) : void
      {
         var _loc2_:Object = this._1281441721_ActionExplorerRenderer_SolidColorStroke1;
         if(_loc2_ !== param1)
         {
            this._1281441721_ActionExplorerRenderer_SolidColorStroke1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ActionExplorerRenderer_SolidColorStroke1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get imageDisplay() : ActionThumbSparkImage
      {
         return this._2024940825imageDisplay;
      }
      
      public function set imageDisplay(param1:ActionThumbSparkImage) : void
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
      protected function get toolTipContent() : String
      {
         return this._261136618toolTipContent;
      }
      
      protected function set toolTipContent(param1:String) : void
      {
         var _loc2_:Object = this._261136618toolTipContent;
         if(_loc2_ !== param1)
         {
            this._261136618toolTipContent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"toolTipContent",_loc2_,param1));
            }
         }
      }
   }
}
