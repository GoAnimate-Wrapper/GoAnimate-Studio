package anifire.studio.components
{
   import anifire.studio.core.Console;
   import anifire.studio.skins.PropertyTabBarSkin;
   import anifire.util.UtilErrorLogger;
   import anifire.util.UtilSite;
   import anifire.util.UtilUser;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.containers.ViewStack;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.Panel;
   import spark.components.SkinnablePopUpContainer;
   import spark.components.TabBar;
   import spark.components.TextArea;
   import spark.components.VGroup;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class LogWindow extends SkinnablePopUpContainer implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _312699062closeButton:Button;
      
      private var _3237038info:TextArea;
      
      private var _100234553movieXml:TextArea;
      
      private var _106426308pages:ViewStack;
      
      private var _106433028panel:Panel;
      
      private var _1276092123panelGroup:Group;
      
      private var _775494677sceneXml:TextArea;
      
      private var _881418178tabBar:TabBar;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _177936123infoText:String;
      
      protected var _718112916movieXmlText:String;
      
      protected var _179613624sceneXmlText:String;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function LogWindow()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._LogWindow_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_LogWindowWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return LogWindow[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._LogWindow_Array1_c);
         this.addEventListener("creationComplete",this.___LogWindow_SkinnablePopUpContainer1_creationComplete);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         LogWindow._watcherSetupUtil = param1;
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
      
      private function init() : void
      {
         try
         {
            this.infoText = "User Type: " + UtilUser.userType + "\n";
            this.infoText = this.infoText + ("UtilSite Site Id: " + UtilSite.siteId + "\n");
            this.infoText = this.infoText + ("Console Site Id: " + Console.getConsole().siteId + "\n");
            this.infoText = this.infoText + ("Team Draft Only: " + Console.getConsole().teamDraftOnly + "\n");
            this.infoText = this.infoText + ("Published on Open: " + Console.getConsole().publishedOnOpen + "\n");
            this.infoText = this.infoText + (UtilErrorLogger.getInstance().systemInfo + "\n");
            this.infoText = this.infoText + (UtilErrorLogger.getInstance().flashPlayerInfo + "\n");
            this.infoText = this.infoText + (UtilErrorLogger.getInstance().browserInfo + "\n");
            this.movieXmlText = Console.getConsole().serialize(false).toXMLString();
            if(Console.getConsole().currentScene)
            {
               this.sceneXmlText = Console.getConsole().currentScene.convertToXml().toString();
            }
            return;
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().appendCustomError("LogWindow:init",e);
            return;
         }
      }
      
      private function _LogWindow_Array1_c() : Array
      {
         var _loc1_:Array = [this._LogWindow_Group1_i()];
         return _loc1_;
      }
      
      private function _LogWindow_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._LogWindow_Panel1_i(),this._LogWindow_Button1_i()];
         _loc1_.id = "panelGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.panelGroup = _loc1_;
         BindingManager.executeBindings(this,"panelGroup",this.panelGroup);
         return _loc1_;
      }
      
      private function _LogWindow_Panel1_i() : Panel
      {
         var _loc1_:Panel = new Panel();
         _loc1_.width = 800;
         _loc1_.height = 500;
         _loc1_.title = "Debug Console";
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._LogWindow_Array3_c);
         _loc1_.id = "panel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.panel = _loc1_;
         BindingManager.executeBindings(this,"panel",this.panel);
         return _loc1_;
      }
      
      private function _LogWindow_Array3_c() : Array
      {
         var _loc1_:Array = [this._LogWindow_VGroup1_c()];
         return _loc1_;
      }
      
      private function _LogWindow_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 0;
         _loc1_.paddingLeft = 1;
         _loc1_.paddingRight = 1;
         _loc1_.mxmlContent = [this._LogWindow_TabBar1_i(),this._LogWindow_Rect1_c(),this._LogWindow_ViewStack1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _LogWindow_TabBar1_i() : TabBar
      {
         var _loc1_:TabBar = new TabBar();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("skinClass",PropertyTabBarSkin);
         _loc1_.id = "tabBar";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.tabBar = _loc1_;
         BindingManager.executeBindings(this,"tabBar",this.tabBar);
         return _loc1_;
      }
      
      private function _LogWindow_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.height = 10;
         _loc1_.fill = this._LogWindow_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _LogWindow_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _LogWindow_ViewStack1_i() : ViewStack
      {
         var temp:ViewStack = new ViewStack();
         temp.percentWidth = 100;
         temp.percentHeight = 100;
         temp.setStyle("paddingTop",0);
         temp.id = "pages";
         if(!temp.document)
         {
            temp.document = this;
         }
         temp.mx_internal::_documentDescriptor = new UIComponentDescriptor({
            "type":ViewStack,
            "id":"pages",
            "stylesFactory":function():void
            {
               this.paddingTop = 0;
            },
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "label":"Scene XML",
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_LogWindow_Array5_c)
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "label":"Movie XML",
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_LogWindow_Array6_c)
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "label":"Info",
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_LogWindow_Array7_c)
                     };
                  }
               })]};
            }
         });
         temp.mx_internal::_documentDescriptor.document = this;
         this.pages = temp;
         BindingManager.executeBindings(this,"pages",this.pages);
         return temp;
      }
      
      private function _LogWindow_Array5_c() : Array
      {
         var _loc1_:Array = [this._LogWindow_TextArea1_i()];
         return _loc1_;
      }
      
      private function _LogWindow_TextArea1_i() : TextArea
      {
         var _loc1_:TextArea = new TextArea();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.editable = false;
         _loc1_.setStyle("fontSize",12);
         _loc1_.id = "sceneXml";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sceneXml = _loc1_;
         BindingManager.executeBindings(this,"sceneXml",this.sceneXml);
         return _loc1_;
      }
      
      private function _LogWindow_Array6_c() : Array
      {
         var _loc1_:Array = [this._LogWindow_TextArea2_i()];
         return _loc1_;
      }
      
      private function _LogWindow_TextArea2_i() : TextArea
      {
         var _loc1_:TextArea = new TextArea();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.editable = false;
         _loc1_.setStyle("fontSize",12);
         _loc1_.id = "movieXml";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.movieXml = _loc1_;
         BindingManager.executeBindings(this,"movieXml",this.movieXml);
         return _loc1_;
      }
      
      private function _LogWindow_Array7_c() : Array
      {
         var _loc1_:Array = [this._LogWindow_TextArea3_i()];
         return _loc1_;
      }
      
      private function _LogWindow_TextArea3_i() : TextArea
      {
         var _loc1_:TextArea = new TextArea();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.editable = false;
         _loc1_.setStyle("fontSize",12);
         _loc1_.id = "info";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.info = _loc1_;
         BindingManager.executeBindings(this,"info",this.info);
         return _loc1_;
      }
      
      private function _LogWindow_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.styleName = "closePopUp";
         _loc1_.buttonMode = true;
         _loc1_.top = 0;
         _loc1_.right = 0;
         _loc1_.width = 50;
         _loc1_.height = 50;
         _loc1_.addEventListener("click",this.__closeButton_click);
         _loc1_.id = "closeButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.closeButton = _loc1_;
         BindingManager.executeBindings(this,"closeButton",this.closeButton);
         return _loc1_;
      }
      
      public function __closeButton_click(param1:MouseEvent) : void
      {
         close();
      }
      
      public function ___LogWindow_SkinnablePopUpContainer1_creationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      private function _LogWindow_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,null,"tabBar.dataProvider","pages");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = sceneXmlText;
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"sceneXml.text");
         result[2] = new Binding(this,function():String
         {
            var _loc1_:* = movieXmlText;
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"movieXml.text");
         result[3] = new Binding(this,function():String
         {
            var _loc1_:* = infoText;
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"info.text");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get closeButton() : Button
      {
         return this._312699062closeButton;
      }
      
      public function set closeButton(param1:Button) : void
      {
         var _loc2_:Object = this._312699062closeButton;
         if(_loc2_ !== param1)
         {
            this._312699062closeButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"closeButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get info() : TextArea
      {
         return this._3237038info;
      }
      
      public function set info(param1:TextArea) : void
      {
         var _loc2_:Object = this._3237038info;
         if(_loc2_ !== param1)
         {
            this._3237038info = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"info",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get movieXml() : TextArea
      {
         return this._100234553movieXml;
      }
      
      public function set movieXml(param1:TextArea) : void
      {
         var _loc2_:Object = this._100234553movieXml;
         if(_loc2_ !== param1)
         {
            this._100234553movieXml = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"movieXml",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get pages() : ViewStack
      {
         return this._106426308pages;
      }
      
      public function set pages(param1:ViewStack) : void
      {
         var _loc2_:Object = this._106426308pages;
         if(_loc2_ !== param1)
         {
            this._106426308pages = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pages",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get panel() : Panel
      {
         return this._106433028panel;
      }
      
      public function set panel(param1:Panel) : void
      {
         var _loc2_:Object = this._106433028panel;
         if(_loc2_ !== param1)
         {
            this._106433028panel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"panel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get panelGroup() : Group
      {
         return this._1276092123panelGroup;
      }
      
      public function set panelGroup(param1:Group) : void
      {
         var _loc2_:Object = this._1276092123panelGroup;
         if(_loc2_ !== param1)
         {
            this._1276092123panelGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"panelGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sceneXml() : TextArea
      {
         return this._775494677sceneXml;
      }
      
      public function set sceneXml(param1:TextArea) : void
      {
         var _loc2_:Object = this._775494677sceneXml;
         if(_loc2_ !== param1)
         {
            this._775494677sceneXml = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sceneXml",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tabBar() : TabBar
      {
         return this._881418178tabBar;
      }
      
      public function set tabBar(param1:TabBar) : void
      {
         var _loc2_:Object = this._881418178tabBar;
         if(_loc2_ !== param1)
         {
            this._881418178tabBar = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tabBar",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get infoText() : String
      {
         return this._177936123infoText;
      }
      
      protected function set infoText(param1:String) : void
      {
         var _loc2_:Object = this._177936123infoText;
         if(_loc2_ !== param1)
         {
            this._177936123infoText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"infoText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get movieXmlText() : String
      {
         return this._718112916movieXmlText;
      }
      
      protected function set movieXmlText(param1:String) : void
      {
         var _loc2_:Object = this._718112916movieXmlText;
         if(_loc2_ !== param1)
         {
            this._718112916movieXmlText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"movieXmlText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get sceneXmlText() : String
      {
         return this._179613624sceneXmlText;
      }
      
      protected function set sceneXmlText(param1:String) : void
      {
         var _loc2_:Object = this._179613624sceneXmlText;
         if(_loc2_ !== param1)
         {
            this._179613624sceneXmlText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sceneXmlText",_loc2_,param1));
            }
         }
      }
   }
}
