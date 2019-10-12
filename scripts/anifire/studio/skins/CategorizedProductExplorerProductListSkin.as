package anifire.studio.skins
{
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.ClassFactory;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.GradientEntry;
   import mx.graphics.LinearGradient;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.DataGroup;
   import spark.components.List;
   import spark.components.Scroller;
   import spark.layouts.VerticalLayout;
   import spark.primitives.Rect;
   import spark.skins.SparkSkin;
   import spark.skins.spark.DefaultItemRenderer;
   
   use namespace mx_internal;
   
   public class CategorizedProductExplorerProductListSkin extends SparkSkin implements IBindingClient, IStateClient2
   {
      
      private static const focusExclusions:Array = ["scroller"];
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _CategorizedProductExplorerProductListSkin_Rect1:Rect;
      
      private var _385593099dataGroup:DataGroup;
      
      private var _402164678scroller:Scroller;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:List;
      
      public function CategorizedProductExplorerProductListSkin()
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
         bindings = this._CategorizedProductExplorerProductListSkin_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_skins_CategorizedProductExplorerProductListSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return CategorizedProductExplorerProductListSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.minWidth = 112;
         this.blendMode = "normal";
         this.mxmlContent = [this._CategorizedProductExplorerProductListSkin_Scroller1_i(),this._CategorizedProductExplorerProductListSkin_Rect1_i()];
         this.currentState = "normal";
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"disabled",
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
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
         CategorizedProductExplorerProductListSkin._watcherSetupUtil = param1;
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
      
      override public function get focusSkinExclusions() : Array
      {
         return focusExclusions;
      }
      
      private function _CategorizedProductExplorerProductListSkin_Scroller1_i() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.minViewportInset = 0;
         _loc1_.hasFocusableChildren = false;
         _loc1_.viewport = this._CategorizedProductExplorerProductListSkin_DataGroup1_i();
         _loc1_.id = "scroller";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.scroller = _loc1_;
         BindingManager.executeBindings(this,"scroller",this.scroller);
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerProductListSkin_DataGroup1_i() : DataGroup
      {
         var _loc1_:DataGroup = new DataGroup();
         _loc1_.itemRenderer = this._CategorizedProductExplorerProductListSkin_ClassFactory1_c();
         _loc1_.layout = this._CategorizedProductExplorerProductListSkin_VerticalLayout1_c();
         _loc1_.id = "dataGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dataGroup = _loc1_;
         BindingManager.executeBindings(this,"dataGroup",this.dataGroup);
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerProductListSkin_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = DefaultItemRenderer;
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerProductListSkin_VerticalLayout1_c() : VerticalLayout
      {
         var _loc1_:VerticalLayout = new VerticalLayout();
         _loc1_.gap = 8;
         _loc1_.paddingBottom = 8;
         _loc1_.paddingLeft = 8;
         _loc1_.paddingTop = 8;
         _loc1_.paddingRight = 8;
         _loc1_.requestedMinRowCount = 5;
         _loc1_.horizontalAlign = "justify";
         _loc1_.variableRowHeight = false;
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerProductListSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.top = 0;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.height = 12;
         _loc1_.fill = this._CategorizedProductExplorerProductListSkin_LinearGradient1_c();
         _loc1_.initialized(this,"_CategorizedProductExplorerProductListSkin_Rect1");
         this._CategorizedProductExplorerProductListSkin_Rect1 = _loc1_;
         BindingManager.executeBindings(this,"_CategorizedProductExplorerProductListSkin_Rect1",this._CategorizedProductExplorerProductListSkin_Rect1);
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerProductListSkin_LinearGradient1_c() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.rotation = 90;
         _loc1_.entries = [this._CategorizedProductExplorerProductListSkin_GradientEntry1_c(),this._CategorizedProductExplorerProductListSkin_GradientEntry2_c()];
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerProductListSkin_GradientEntry1_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 0;
         _loc1_.alpha = 0.3;
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerProductListSkin_GradientEntry2_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 0;
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerProductListSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Boolean
         {
            return dataGroup.verticalScrollPosition > 0;
         },null,"_CategorizedProductExplorerProductListSkin_Rect1.visible");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get dataGroup() : DataGroup
      {
         return this._385593099dataGroup;
      }
      
      public function set dataGroup(param1:DataGroup) : void
      {
         var _loc2_:Object = this._385593099dataGroup;
         if(_loc2_ !== param1)
         {
            this._385593099dataGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dataGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scroller() : Scroller
      {
         return this._402164678scroller;
      }
      
      public function set scroller(param1:Scroller) : void
      {
         var _loc2_:Object = this._402164678scroller;
         if(_loc2_ !== param1)
         {
            this._402164678scroller = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scroller",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : List
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:List) : void
      {
         var _loc2_:Object = this._213507019hostComponent;
         if(_loc2_ !== param1)
         {
            this._213507019hostComponent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hostComponent",_loc2_,param1));
            }
         }
      }
   }
}
