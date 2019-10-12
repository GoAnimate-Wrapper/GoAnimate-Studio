package anifire.studio.skins
{
   import anifire.studio.components.BusyIndicator;
   import anifire.studio.components.DecoratedList;
   import anifire.studio.components.TextComponentThumbRenderer;
   import anifire.util.UtilDict;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.ClassFactory;
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
   import spark.components.DataGroup;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.Scroller;
   import spark.components.VGroup;
   import spark.layouts.TileLayout;
   import spark.primitives.BitmapImage;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   import spark.skins.SparkSkin;
   
   use namespace mx_internal;
   
   public class TextComponentListSkin extends SparkSkin implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _TextComponentListSkin_Label1:Label;
      
      public var _TextComponentListSkin_VGroup1:VGroup;
      
      private var _385593099dataGroup:DataGroup;
      
      private var _1419185120dropIndicator:ClassFactory;
      
      private var _1389660835loadingGroup:Group;
      
      private var _402164678scroller:Scroller;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__styles_images_tray_icon_text_component_png_2107923369:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:DecoratedList;
      
      public function TextComponentListSkin()
      {
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__styles_images_tray_icon_text_component_png_2107923369 = TextComponentListSkin__embed_mxml__styles_images_tray_icon_text_component_png_2107923369;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._TextComponentListSkin_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_skins_TextComponentListSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return TextComponentListSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.minWidth = 112;
         this.blendMode = "normal";
         this.mxmlContent = [this._TextComponentListSkin_VGroup1_i()];
         this.currentState = "normal";
         this._TextComponentListSkin_ClassFactory1_i();
         var _TextComponentListSkin_Group1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._TextComponentListSkin_Group1_i);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"loading",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_TextComponentListSkin_Group1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_TextComponentListSkin_VGroup1"]
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
         TextComponentListSkin._watcherSetupUtil = param1;
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
      
      private function _TextComponentListSkin_ClassFactory1_i() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = TextComponentListSkinInnerClass0;
         _loc1_.properties = {"outerDocument":this};
         this.dropIndicator = _loc1_;
         BindingManager.executeBindings(this,"dropIndicator",this.dropIndicator);
         return _loc1_;
      }
      
      private function _TextComponentListSkin_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 0;
         _loc1_.paddingLeft = 0;
         _loc1_.paddingRight = 0;
         _loc1_.paddingTop = 20;
         _loc1_.paddingBottom = 20;
         _loc1_.mxmlContent = [this._TextComponentListSkin_VGroup2_c(),this._TextComponentListSkin_Line1_c()];
         _loc1_.id = "_TextComponentListSkin_VGroup1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._TextComponentListSkin_VGroup1 = _loc1_;
         BindingManager.executeBindings(this,"_TextComponentListSkin_VGroup1",this._TextComponentListSkin_VGroup1);
         return _loc1_;
      }
      
      private function _TextComponentListSkin_VGroup2_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 8;
         _loc1_.paddingLeft = 8;
         _loc1_.paddingRight = 8;
         _loc1_.paddingTop = 0;
         _loc1_.paddingBottom = 20;
         _loc1_.mxmlContent = [this._TextComponentListSkin_HGroup1_c(),this._TextComponentListSkin_Scroller1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TextComponentListSkin_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._TextComponentListSkin_BitmapImage1_c(),this._TextComponentListSkin_Label1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TextComponentListSkin_BitmapImage1_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__styles_images_tray_icon_text_component_png_2107923369;
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TextComponentListSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("fontSize",12);
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.id = "_TextComponentListSkin_Label1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._TextComponentListSkin_Label1 = _loc1_;
         BindingManager.executeBindings(this,"_TextComponentListSkin_Label1",this._TextComponentListSkin_Label1);
         return _loc1_;
      }
      
      private function _TextComponentListSkin_Scroller1_i() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.hasFocusableChildren = false;
         _loc1_.minViewportInset = 1;
         _loc1_.viewport = this._TextComponentListSkin_DataGroup1_i();
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
      
      private function _TextComponentListSkin_DataGroup1_i() : DataGroup
      {
         var _loc1_:DataGroup = new DataGroup();
         _loc1_.itemRenderer = this._TextComponentListSkin_ClassFactory2_c();
         _loc1_.layout = this._TextComponentListSkin_TileLayout1_c();
         _loc1_.id = "dataGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dataGroup = _loc1_;
         BindingManager.executeBindings(this,"dataGroup",this.dataGroup);
         return _loc1_;
      }
      
      private function _TextComponentListSkin_ClassFactory2_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = TextComponentThumbRenderer;
         return _loc1_;
      }
      
      private function _TextComponentListSkin_TileLayout1_c() : TileLayout
      {
         var _loc1_:TileLayout = new TileLayout();
         _loc1_.columnAlign = "justifyUsingWidth";
         _loc1_.horizontalAlign = "center";
         _loc1_.useVirtualLayout = true;
         _loc1_.requestedColumnCount = 2;
         _loc1_.orientation = "rows";
         return _loc1_;
      }
      
      private function _TextComponentListSkin_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.stroke = this._TextComponentListSkin_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TextComponentListSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 14870509;
         return _loc1_;
      }
      
      private function _TextComponentListSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.mxmlContent = [this._TextComponentListSkin_Rect1_c(),this._TextComponentListSkin_BusyIndicator1_c()];
         _loc1_.id = "loadingGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.loadingGroup = _loc1_;
         BindingManager.executeBindings(this,"loadingGroup",this.loadingGroup);
         return _loc1_;
      }
      
      private function _TextComponentListSkin_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._TextComponentListSkin_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TextComponentListSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.alpha = 0.5;
         return _loc1_;
      }
      
      private function _TextComponentListSkin_BusyIndicator1_c() : BusyIndicator
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
      
      private function _TextComponentListSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Text Components");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_TextComponentListSkin_Label1.text");
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
      public function get dropIndicator() : ClassFactory
      {
         return this._1419185120dropIndicator;
      }
      
      public function set dropIndicator(param1:ClassFactory) : void
      {
         var _loc2_:Object = this._1419185120dropIndicator;
         if(_loc2_ !== param1)
         {
            this._1419185120dropIndicator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dropIndicator",_loc2_,param1));
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
