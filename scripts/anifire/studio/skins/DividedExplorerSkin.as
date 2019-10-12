package anifire.studio.skins
{
   import anifire.studio.components.DividedExplorer;
   import anifire.util.UtilDict;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.controls.Spacer;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.GradientEntry;
   import mx.graphics.LinearGradient;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import spark.components.Label;
   import spark.components.List;
   import spark.components.Scroller;
   import spark.components.VGroup;
   import spark.components.supportClasses.Skin;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class DividedExplorerSkin extends Skin implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _1332194002background:Rect;
      
      private var _1391998104bgFill:SolidColor;
      
      private var _867802688primaryList:List;
      
      private var _805323225primaryListMessage:Label;
      
      private var _1040062344primaryListTitle:Label;
      
      private var _402164678scroller:Scroller;
      
      private var _869614542secondaryList:List;
      
      private var _1403527029secondaryListMessage:Label;
      
      private var _1733182790secondaryListTitle:Label;
      
      private var _1196685478viewport:VGroup;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:DividedExplorer;
      
      public function DividedExplorerSkin()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._DividedExplorerSkin_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_skins_DividedExplorerSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return DividedExplorerSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._DividedExplorerSkin_Rect1_i(),this._DividedExplorerSkin_Rect2_c(),this._DividedExplorerSkin_Scroller1_i()];
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         DividedExplorerSkin._watcherSetupUtil = param1;
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
      
      private function _DividedExplorerSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._DividedExplorerSkin_SolidColor1_i();
         _loc1_.initialized(this,"background");
         this.background = _loc1_;
         BindingManager.executeBindings(this,"background",this.background);
         return _loc1_;
      }
      
      private function _DividedExplorerSkin_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 15594230;
         this.bgFill = _loc1_;
         BindingManager.executeBindings(this,"bgFill",this.bgFill);
         return _loc1_;
      }
      
      private function _DividedExplorerSkin_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.top = 0;
         _loc1_.left = -1;
         _loc1_.right = 0;
         _loc1_.height = 10;
         _loc1_.fill = this._DividedExplorerSkin_LinearGradient1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _DividedExplorerSkin_LinearGradient1_c() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.rotation = 90;
         _loc1_.entries = [this._DividedExplorerSkin_GradientEntry1_c(),this._DividedExplorerSkin_GradientEntry2_c()];
         return _loc1_;
      }
      
      private function _DividedExplorerSkin_GradientEntry1_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 3355443;
         _loc1_.alpha = 0.1;
         return _loc1_;
      }
      
      private function _DividedExplorerSkin_GradientEntry2_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 3355443;
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      private function _DividedExplorerSkin_Scroller1_i() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.left = 0;
         _loc1_.top = 10;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.viewport = this._DividedExplorerSkin_VGroup1_i();
         _loc1_.id = "scroller";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.scroller = _loc1_;
         BindingManager.executeBindings(this,"scroller",this.scroller);
         return _loc1_;
      }
      
      private function _DividedExplorerSkin_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.paddingTop = 14;
         _loc1_.paddingBottom = 14;
         _loc1_.mxmlContent = [this._DividedExplorerSkin_Label1_i(),this._DividedExplorerSkin_Label2_i(),this._DividedExplorerSkin_List1_i(),this._DividedExplorerSkin_Line1_c(),this._DividedExplorerSkin_Spacer1_c(),this._DividedExplorerSkin_Label3_i(),this._DividedExplorerSkin_Label4_i(),this._DividedExplorerSkin_List2_i(),this._DividedExplorerSkin_Spacer2_c()];
         _loc1_.id = "viewport";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.viewport = _loc1_;
         BindingManager.executeBindings(this,"viewport",this.viewport);
         return _loc1_;
      }
      
      private function _DividedExplorerSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("paddingLeft",7);
         _loc1_.id = "primaryListTitle";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.primaryListTitle = _loc1_;
         BindingManager.executeBindings(this,"primaryListTitle",this.primaryListTitle);
         return _loc1_;
      }
      
      private function _DividedExplorerSkin_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("paddingLeft",7);
         _loc1_.setStyle("color",3355443);
         _loc1_.setStyle("fontSize",12);
         _loc1_.id = "primaryListMessage";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.primaryListMessage = _loc1_;
         BindingManager.executeBindings(this,"primaryListMessage",this.primaryListMessage);
         return _loc1_;
      }
      
      private function _DividedExplorerSkin_List1_i() : List
      {
         var _loc1_:List = new List();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("skinClass",DividedExplorerProductListSkin);
         _loc1_.id = "primaryList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.primaryList = _loc1_;
         BindingManager.executeBindings(this,"primaryList",this.primaryList);
         return _loc1_;
      }
      
      private function _DividedExplorerSkin_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.stroke = this._DividedExplorerSkin_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _DividedExplorerSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 14606046;
         return _loc1_;
      }
      
      private function _DividedExplorerSkin_Spacer1_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.height = 7;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _DividedExplorerSkin_Label3_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("paddingLeft",7);
         _loc1_.id = "secondaryListTitle";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.secondaryListTitle = _loc1_;
         BindingManager.executeBindings(this,"secondaryListTitle",this.secondaryListTitle);
         return _loc1_;
      }
      
      private function _DividedExplorerSkin_Label4_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("paddingLeft",7);
         _loc1_.setStyle("color",3355443);
         _loc1_.setStyle("fontSize",12);
         _loc1_.id = "secondaryListMessage";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.secondaryListMessage = _loc1_;
         BindingManager.executeBindings(this,"secondaryListMessage",this.secondaryListMessage);
         return _loc1_;
      }
      
      private function _DividedExplorerSkin_List2_i() : List
      {
         var _loc1_:List = new List();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("skinClass",DividedExplorerProductListSkin);
         _loc1_.id = "secondaryList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.secondaryList = _loc1_;
         BindingManager.executeBindings(this,"secondaryList",this.secondaryList);
         return _loc1_;
      }
      
      private function _DividedExplorerSkin_Spacer2_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.percentHeight = 100;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _DividedExplorerSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Compatible Vidgets");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"primaryListTitle.text");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Data you entered will be retained after the swap");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"primaryListMessage.text");
         result[2] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Other Vidgets");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"secondaryListTitle.text");
         result[3] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Swapping with the below vidgets will reset the data and styling of the vidget.");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"secondaryListMessage.text");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get background() : Rect
      {
         return this._1332194002background;
      }
      
      public function set background(param1:Rect) : void
      {
         var _loc2_:Object = this._1332194002background;
         if(_loc2_ !== param1)
         {
            this._1332194002background = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"background",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bgFill() : SolidColor
      {
         return this._1391998104bgFill;
      }
      
      public function set bgFill(param1:SolidColor) : void
      {
         var _loc2_:Object = this._1391998104bgFill;
         if(_loc2_ !== param1)
         {
            this._1391998104bgFill = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bgFill",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get primaryList() : List
      {
         return this._867802688primaryList;
      }
      
      public function set primaryList(param1:List) : void
      {
         var _loc2_:Object = this._867802688primaryList;
         if(_loc2_ !== param1)
         {
            this._867802688primaryList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"primaryList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get primaryListMessage() : Label
      {
         return this._805323225primaryListMessage;
      }
      
      public function set primaryListMessage(param1:Label) : void
      {
         var _loc2_:Object = this._805323225primaryListMessage;
         if(_loc2_ !== param1)
         {
            this._805323225primaryListMessage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"primaryListMessage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get primaryListTitle() : Label
      {
         return this._1040062344primaryListTitle;
      }
      
      public function set primaryListTitle(param1:Label) : void
      {
         var _loc2_:Object = this._1040062344primaryListTitle;
         if(_loc2_ !== param1)
         {
            this._1040062344primaryListTitle = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"primaryListTitle",_loc2_,param1));
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
      public function get secondaryList() : List
      {
         return this._869614542secondaryList;
      }
      
      public function set secondaryList(param1:List) : void
      {
         var _loc2_:Object = this._869614542secondaryList;
         if(_loc2_ !== param1)
         {
            this._869614542secondaryList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"secondaryList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get secondaryListMessage() : Label
      {
         return this._1403527029secondaryListMessage;
      }
      
      public function set secondaryListMessage(param1:Label) : void
      {
         var _loc2_:Object = this._1403527029secondaryListMessage;
         if(_loc2_ !== param1)
         {
            this._1403527029secondaryListMessage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"secondaryListMessage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get secondaryListTitle() : Label
      {
         return this._1733182790secondaryListTitle;
      }
      
      public function set secondaryListTitle(param1:Label) : void
      {
         var _loc2_:Object = this._1733182790secondaryListTitle;
         if(_loc2_ !== param1)
         {
            this._1733182790secondaryListTitle = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"secondaryListTitle",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get viewport() : VGroup
      {
         return this._1196685478viewport;
      }
      
      public function set viewport(param1:VGroup) : void
      {
         var _loc2_:Object = this._1196685478viewport;
         if(_loc2_ !== param1)
         {
            this._1196685478viewport = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"viewport",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : DividedExplorer
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:DividedExplorer) : void
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
