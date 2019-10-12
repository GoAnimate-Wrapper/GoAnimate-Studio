package anifire.studio.components
{
   import anifire.util.UtilDict;
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
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.State;
   import spark.components.supportClasses.ItemRenderer;
   import spark.primitives.Rect;
   import spark.primitives.RectangularDropShadow;
   
   use namespace mx_internal;
   
   public class ThemeItemRenderer extends ItemRenderer implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _ThemeItemRenderer_Rect1:Rect;
      
      public var _ThemeItemRenderer_RectangularDropShadow1:RectangularDropShadow;
      
      private var _17045986themeIcon:ThemeIcon;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _1222364469_toolTipContent:String;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ThemeItemRenderer()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._ThemeItemRenderer_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_ThemeItemRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ThemeItemRenderer[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 38;
         this.height = 38;
         this.buttonMode = true;
         this.autoDrawBackground = false;
         this.mxmlContent = [this._ThemeItemRenderer_ThemeIcon1_i()];
         this.currentState = "normal";
         var _ThemeItemRenderer_Rect1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ThemeItemRenderer_Rect1_i);
         var _ThemeItemRenderer_RectangularDropShadow1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ThemeItemRenderer_RectangularDropShadow1_i);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"hovered",
            "stateGroups":["hoveredAndSelected"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_ThemeItemRenderer_Rect1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"selected",
            "stateGroups":["hoveredAndSelected"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_ThemeItemRenderer_RectangularDropShadow1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_ThemeItemRenderer_Rect1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
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
         ThemeItemRenderer._watcherSetupUtil = param1;
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
         if(data)
         {
            this.themeIcon.themeId = data.id;
            this._toolTipContent = UtilDict.toDisplay("store",data.label);
         }
      }
      
      private function _ThemeItemRenderer_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._ThemeItemRenderer_SolidColorStroke1_c();
         _loc1_.initialized(this,"_ThemeItemRenderer_Rect1");
         this._ThemeItemRenderer_Rect1 = _loc1_;
         BindingManager.executeBindings(this,"_ThemeItemRenderer_Rect1",this._ThemeItemRenderer_Rect1);
         return _loc1_;
      }
      
      private function _ThemeItemRenderer_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 4439205;
         return _loc1_;
      }
      
      private function _ThemeItemRenderer_RectangularDropShadow1_i() : RectangularDropShadow
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
         _loc1_.id = "_ThemeItemRenderer_RectangularDropShadow1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ThemeItemRenderer_RectangularDropShadow1 = _loc1_;
         BindingManager.executeBindings(this,"_ThemeItemRenderer_RectangularDropShadow1",this._ThemeItemRenderer_RectangularDropShadow1);
         return _loc1_;
      }
      
      private function _ThemeItemRenderer_ThemeIcon1_i() : ThemeIcon
      {
         var _loc1_:ThemeIcon = new ThemeIcon();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.id = "themeIcon";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.themeIcon = _loc1_;
         BindingManager.executeBindings(this,"themeIcon",this.themeIcon);
         return _loc1_;
      }
      
      private function _ThemeItemRenderer_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = _toolTipContent;
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"this.toolTip");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get themeIcon() : ThemeIcon
      {
         return this._17045986themeIcon;
      }
      
      public function set themeIcon(param1:ThemeIcon) : void
      {
         var _loc2_:Object = this._17045986themeIcon;
         if(_loc2_ !== param1)
         {
            this._17045986themeIcon = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"themeIcon",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _toolTipContent() : String
      {
         return this._1222364469_toolTipContent;
      }
      
      protected function set _toolTipContent(param1:String) : void
      {
         var _loc2_:Object = this._1222364469_toolTipContent;
         if(_loc2_ !== param1)
         {
            this._1222364469_toolTipContent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_toolTipContent",_loc2_,param1));
            }
         }
      }
   }
}
