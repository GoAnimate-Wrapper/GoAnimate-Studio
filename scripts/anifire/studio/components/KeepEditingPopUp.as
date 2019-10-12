package anifire.studio.components
{
   import anifire.constant.ServerConstants;
   import anifire.util.UtilDict;
   import anifire.util.UtilSite;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.utils.getDefinitionByName;
   import flashx.textLayout.elements.LinkElement;
   import flashx.textLayout.elements.ParagraphElement;
   import flashx.textLayout.elements.SpanElement;
   import flashx.textLayout.elements.TextFlow;
   import flashx.textLayout.events.FlowElementMouseEvent;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.Panel;
   import spark.components.RichEditableText;
   import spark.components.VGroup;
   
   use namespace mx_internal;
   
   public class KeepEditingPopUp extends DefaultPopUpContainer implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _1361128838chrome:Group;
      
      private var _312699062closeButton:Button;
      
      private var _236983790confirmButton:Button;
      
      private var _1304200403messageLabel:RichEditableText;
      
      private var _106433028panel:Panel;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function KeepEditingPopUp()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._KeepEditingPopUp_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_KeepEditingPopUpWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return KeepEditingPopUp[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._KeepEditingPopUp_Array1_c);
         this.addEventListener("creationComplete",this.___KeepEditingPopUp_DefaultPopUpContainer1_creationComplete);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         KeepEditingPopUp._watcherSetupUtil = param1;
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
      
      override protected function init() : void
      {
         var _loc8_:SpanElement = null;
         var _loc1_:TextFlow = new TextFlow();
         var _loc2_:String = UtilDict.toDisplay("go","If you want to go back to the video you previously worked on, please visit the {0} page. This will close the Video Maker.");
         var _loc3_:Array = _loc2_.split("{0}");
         var _loc4_:ParagraphElement = new ParagraphElement();
         var _loc5_:SpanElement = new SpanElement();
         _loc5_.text = _loc3_[0];
         _loc4_.addChild(_loc5_);
         var _loc6_:LinkElement = new LinkElement();
         var _loc7_:SpanElement = new SpanElement();
         _loc7_.text = UtilDict.toDisplay("go","\"Your Videos\"");
         _loc7_.fontWeight = "bold";
         _loc7_.textDecoration = "none";
         _loc7_.color = 4439205;
         _loc6_.addChild(_loc7_);
         _loc6_.addEventListener(FlowElementMouseEvent.CLICK,this.link_clickHandler);
         _loc4_.addChild(_loc6_);
         if(_loc3_.length > 1)
         {
            _loc8_ = new SpanElement();
            _loc8_.text = _loc3_[1];
            _loc4_.addChild(_loc8_);
         }
         _loc1_.addChild(_loc4_);
         this.messageLabel.textFlow = _loc1_;
      }
      
      protected function link_clickHandler(param1:FlowElementMouseEvent) : void
      {
         var _loc2_:String = null;
         ExternalInterface.call("exitStudio","1");
         if(UtilSite.siteId == UtilSite.SCHOOL)
         {
            _loc2_ = ServerConstants.SCHOOL_VIDEOS_PATH;
         }
         else if(ServerConstants.IS_WIX)
         {
            _loc2_ = ServerConstants.WIX_VIDEOS_PATH;
         }
         else
         {
            _loc2_ = ServerConstants.YOUR_VIDEOS_PATH;
         }
         navigateToURL(new URLRequest(_loc2_),"_self");
      }
      
      private function _KeepEditingPopUp_Array1_c() : Array
      {
         var _loc1_:Array = [this._KeepEditingPopUp_Group1_i()];
         return _loc1_;
      }
      
      private function _KeepEditingPopUp_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._KeepEditingPopUp_Panel1_i(),this._KeepEditingPopUp_Button2_i()];
         _loc1_.id = "chrome";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.chrome = _loc1_;
         BindingManager.executeBindings(this,"chrome",this.chrome);
         return _loc1_;
      }
      
      private function _KeepEditingPopUp_Panel1_i() : Panel
      {
         var _loc1_:Panel = new Panel();
         _loc1_.width = 400;
         _loc1_.controlBarContent = [this._KeepEditingPopUp_Button1_i()];
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._KeepEditingPopUp_Array4_c);
         _loc1_.id = "panel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.panel = _loc1_;
         BindingManager.executeBindings(this,"panel",this.panel);
         return _loc1_;
      }
      
      private function _KeepEditingPopUp_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.styleName = "primary";
         _loc1_.addEventListener("click",this.__confirmButton_click);
         _loc1_.id = "confirmButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.confirmButton = _loc1_;
         BindingManager.executeBindings(this,"confirmButton",this.confirmButton);
         return _loc1_;
      }
      
      public function __confirmButton_click(param1:MouseEvent) : void
      {
         confirm();
      }
      
      private function _KeepEditingPopUp_Array4_c() : Array
      {
         var _loc1_:Array = [this._KeepEditingPopUp_VGroup1_c()];
         return _loc1_;
      }
      
      private function _KeepEditingPopUp_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.paddingTop = 15;
         _loc1_.paddingBottom = 10;
         _loc1_.paddingLeft = 28;
         _loc1_.paddingRight = 28;
         _loc1_.mxmlContent = [this._KeepEditingPopUp_RichEditableText1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _KeepEditingPopUp_RichEditableText1_i() : RichEditableText
      {
         var _loc1_:RichEditableText = new RichEditableText();
         _loc1_.multiline = true;
         _loc1_.percentWidth = 100;
         _loc1_.editable = false;
         _loc1_.focusEnabled = false;
         _loc1_.selectable = false;
         _loc1_.setStyle("fontSize",13);
         _loc1_.setStyle("color",3355443);
         _loc1_.setStyle("textAlign","left");
         _loc1_.id = "messageLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.messageLabel = _loc1_;
         BindingManager.executeBindings(this,"messageLabel",this.messageLabel);
         return _loc1_;
      }
      
      private function _KeepEditingPopUp_Button2_i() : Button
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
         cancel();
      }
      
      public function ___KeepEditingPopUp_DefaultPopUpContainer1_creationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      private function _KeepEditingPopUp_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Keep Editing This Video?");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"panel.title");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Continue Editing");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"confirmButton.label");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get chrome() : Group
      {
         return this._1361128838chrome;
      }
      
      public function set chrome(param1:Group) : void
      {
         var _loc2_:Object = this._1361128838chrome;
         if(_loc2_ !== param1)
         {
            this._1361128838chrome = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"chrome",_loc2_,param1));
            }
         }
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
      public function get confirmButton() : Button
      {
         return this._236983790confirmButton;
      }
      
      public function set confirmButton(param1:Button) : void
      {
         var _loc2_:Object = this._236983790confirmButton;
         if(_loc2_ !== param1)
         {
            this._236983790confirmButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"confirmButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get messageLabel() : RichEditableText
      {
         return this._1304200403messageLabel;
      }
      
      public function set messageLabel(param1:RichEditableText) : void
      {
         var _loc2_:Object = this._1304200403messageLabel;
         if(_loc2_ !== param1)
         {
            this._1304200403messageLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"messageLabel",_loc2_,param1));
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
   }
}
