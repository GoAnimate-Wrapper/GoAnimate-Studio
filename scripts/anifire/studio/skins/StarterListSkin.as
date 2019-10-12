package anifire.studio.skins
{
   import anifire.studio.components.BackgroundThumbRenderer;
   import anifire.studio.components.BusyIndicator;
   import anifire.studio.components.DecoratedList;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.controls.Spacer;
   import mx.core.ClassFactory;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.GradientEntry;
   import mx.graphics.LinearGradient;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.DataGroup;
   import spark.components.Group;
   import spark.components.Label;
   import spark.components.Scroller;
   import spark.components.VGroup;
   import spark.layouts.TileLayout;
   import spark.primitives.Rect;
   import spark.skins.SparkSkin;
   
   use namespace mx_internal;
   
   public class StarterListSkin extends SparkSkin implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _StarterListSkin_Rect3:Rect;
      
      private var _385593099dataGroup:DataGroup;
      
      private var _1389660835loadingGroup:Group;
      
      private var _263438014promptDisplay:Label;
      
      private var _1612245883promptGroup:VGroup;
      
      private var _402164678scroller:Scroller;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:DecoratedList;
      
      public function StarterListSkin()
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
         bindings = this._StarterListSkin_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_skins_StarterListSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return StarterListSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.clipAndEnableScrolling = true;
         this.mxmlContent = [this._StarterListSkin_Rect1_c(),this._StarterListSkin_Scroller1_i(),this._StarterListSkin_Rect2_c(),this._StarterListSkin_Rect3_i()];
         this.currentState = "normal";
         var _StarterListSkin_Group1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._StarterListSkin_Group1_i);
         var _StarterListSkin_VGroup1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._StarterListSkin_VGroup1_i);
         states = [new State({
            "name":"normal",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_StarterListSkin_VGroup1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_StarterListSkin_Rect3"]
            })]
         }),new State({
            "name":"loading",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_StarterListSkin_Group1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_StarterListSkin_Rect3"]
            })]
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
         StarterListSkin._watcherSetupUtil = param1;
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
      
      private function _StarterListSkin_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._StarterListSkin_SolidColorStroke1_c();
         _loc1_.fill = this._StarterListSkin_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _StarterListSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 14737632;
         return _loc1_;
      }
      
      private function _StarterListSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 15594230;
         return _loc1_;
      }
      
      private function _StarterListSkin_Scroller1_i() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.left = 0;
         _loc1_.top = 1;
         _loc1_.right = 0;
         _loc1_.bottom = 1;
         _loc1_.hasFocusableChildren = false;
         _loc1_.minViewportInset = 1;
         _loc1_.viewport = this._StarterListSkin_DataGroup1_i();
         _loc1_.setStyle("horizontalScrollPolicy","off");
         _loc1_.setStyle("verticalScrollPolicy","on");
         _loc1_.id = "scroller";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.scroller = _loc1_;
         BindingManager.executeBindings(this,"scroller",this.scroller);
         return _loc1_;
      }
      
      private function _StarterListSkin_DataGroup1_i() : DataGroup
      {
         var _loc1_:DataGroup = new DataGroup();
         _loc1_.itemRenderer = this._StarterListSkin_ClassFactory1_c();
         _loc1_.layout = this._StarterListSkin_TileLayout1_c();
         _loc1_.id = "dataGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dataGroup = _loc1_;
         BindingManager.executeBindings(this,"dataGroup",this.dataGroup);
         return _loc1_;
      }
      
      private function _StarterListSkin_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = BackgroundThumbRenderer;
         return _loc1_;
      }
      
      private function _StarterListSkin_TileLayout1_c() : TileLayout
      {
         var _loc1_:TileLayout = new TileLayout();
         _loc1_.columnAlign = "justifyUsingWidth";
         _loc1_.horizontalAlign = "center";
         _loc1_.paddingTop = 6;
         _loc1_.paddingBottom = 6;
         _loc1_.paddingLeft = 6;
         _loc1_.paddingRight = 6;
         _loc1_.useVirtualLayout = true;
         _loc1_.requestedColumnCount = 2;
         _loc1_.orientation = "rows";
         return _loc1_;
      }
      
      private function _StarterListSkin_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.top = 1;
         _loc1_.left = 0;
         _loc1_.right = 16;
         _loc1_.height = 10;
         _loc1_.fill = this._StarterListSkin_LinearGradient1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _StarterListSkin_LinearGradient1_c() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.rotation = 90;
         _loc1_.entries = [this._StarterListSkin_GradientEntry1_c(),this._StarterListSkin_GradientEntry2_c()];
         return _loc1_;
      }
      
      private function _StarterListSkin_GradientEntry1_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 3355443;
         _loc1_.alpha = 0.1;
         return _loc1_;
      }
      
      private function _StarterListSkin_GradientEntry2_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 3355443;
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      private function _StarterListSkin_Rect3_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.bottom = 1;
         _loc1_.left = 0;
         _loc1_.right = 16;
         _loc1_.height = 10;
         _loc1_.fill = this._StarterListSkin_LinearGradient2_c();
         _loc1_.initialized(this,"_StarterListSkin_Rect3");
         this._StarterListSkin_Rect3 = _loc1_;
         BindingManager.executeBindings(this,"_StarterListSkin_Rect3",this._StarterListSkin_Rect3);
         return _loc1_;
      }
      
      private function _StarterListSkin_LinearGradient2_c() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.rotation = 90;
         _loc1_.entries = [this._StarterListSkin_GradientEntry3_c(),this._StarterListSkin_GradientEntry4_c()];
         return _loc1_;
      }
      
      private function _StarterListSkin_GradientEntry3_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 3355443;
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      private function _StarterListSkin_GradientEntry4_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 3355443;
         _loc1_.alpha = 0.1;
         return _loc1_;
      }
      
      private function _StarterListSkin_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.mxmlContent = [this._StarterListSkin_Spacer1_c(),this._StarterListSkin_Label1_i(),this._StarterListSkin_Spacer2_c()];
         _loc1_.id = "promptGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.promptGroup = _loc1_;
         BindingManager.executeBindings(this,"promptGroup",this.promptGroup);
         return _loc1_;
      }
      
      private function _StarterListSkin_Spacer1_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.percentHeight = 30;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _StarterListSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("paddingLeft",10);
         _loc1_.setStyle("paddingRight",26);
         _loc1_.id = "promptDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.promptDisplay = _loc1_;
         BindingManager.executeBindings(this,"promptDisplay",this.promptDisplay);
         return _loc1_;
      }
      
      private function _StarterListSkin_Spacer2_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.percentHeight = 70;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _StarterListSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 0;
         _loc1_.top = 1;
         _loc1_.right = 0;
         _loc1_.bottom = 1;
         _loc1_.mxmlContent = [this._StarterListSkin_Rect4_c(),this._StarterListSkin_BusyIndicator1_c()];
         _loc1_.id = "loadingGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.loadingGroup = _loc1_;
         BindingManager.executeBindings(this,"loadingGroup",this.loadingGroup);
         return _loc1_;
      }
      
      private function _StarterListSkin_Rect4_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._StarterListSkin_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _StarterListSkin_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.alpha = 0.5;
         return _loc1_;
      }
      
      private function _StarterListSkin_BusyIndicator1_c() : BusyIndicator
      {
         var _loc1_:BusyIndicator = new BusyIndicator();
         _loc1_.width = 60;
         _loc1_.height = 60;
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _StarterListSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Boolean
         {
            return hostComponent.dataProvider.length == 0;
         },null,"promptGroup.visible");
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
      public function get loadingGroup() : Group
      {
         return this._1389660835loadingGroup;
      }
      
      public function set loadingGroup(param1:Group) : void
      {
         var _loc2_:Object = this._1389660835loadingGroup;
         if(_loc2_ !== param1)
         {
            this._1389660835loadingGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"loadingGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get promptDisplay() : Label
      {
         return this._263438014promptDisplay;
      }
      
      public function set promptDisplay(param1:Label) : void
      {
         var _loc2_:Object = this._263438014promptDisplay;
         if(_loc2_ !== param1)
         {
            this._263438014promptDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"promptDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get promptGroup() : VGroup
      {
         return this._1612245883promptGroup;
      }
      
      public function set promptGroup(param1:VGroup) : void
      {
         var _loc2_:Object = this._1612245883promptGroup;
         if(_loc2_ !== param1)
         {
            this._1612245883promptGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"promptGroup",_loc2_,param1));
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
      public function get hostComponent() : DecoratedList
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:DecoratedList) : void
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
