package anifire.studio.components
{
   import anifire.constant.ServerConstants;
   import anifire.managers.ExternalLinkManager;
   import anifire.managers.ServerConnector;
   import anifire.util.UtilDict;
   import flashx.textLayout.elements.LinkElement;
   import flashx.textLayout.elements.ParagraphElement;
   import flashx.textLayout.elements.SpanElement;
   import flashx.textLayout.elements.TextFlow;
   import flashx.textLayout.events.FlowElementMouseEvent;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import spark.components.Group;
   import spark.components.RichEditableText;
   import spark.primitives.Rect;
   
   public class PreviewSaveGroup extends Group
   {
       
      
      private var _1332194002background:Rect;
      
      private var _1766219762warnLabel:RichEditableText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function PreviewSaveGroup()
      {
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._PreviewSaveGroup_Rect1_i(),this._PreviewSaveGroup_RichEditableText1_i()];
         this.addEventListener("show",this.___PreviewSaveGroup_Group1_show);
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
      
      protected function init() : void
      {
         var _loc8_:SpanElement = null;
         var _loc1_:TextFlow = new TextFlow();
         var _loc2_:String = UtilDict.toDisplay("go","We hope you\'ve enjoyed this preview of Vyond. Please {0} to save your video.");
         var _loc3_:Array = _loc2_.split("{0}");
         var _loc4_:ParagraphElement = new ParagraphElement();
         var _loc5_:SpanElement = new SpanElement();
         _loc5_.text = _loc3_[0];
         _loc4_.addChild(_loc5_);
         var _loc6_:LinkElement = new LinkElement();
         var _loc7_:SpanElement = new SpanElement();
         _loc7_.text = UtilDict.toDisplay("go","subscribe");
         _loc7_.fontWeight = "bold";
         _loc7_.color = 16777215;
         _loc6_.addChild(_loc7_);
         _loc6_.addEventListener(FlowElementMouseEvent.CLICK,this.onUpgradeLinkClick);
         _loc4_.addChild(_loc6_);
         if(_loc3_.length > 1)
         {
            _loc8_ = new SpanElement();
            _loc8_.text = _loc3_[1];
            _loc4_.addChild(_loc8_);
         }
         _loc1_.addChild(_loc4_);
         this.warnLabel.textFlow = _loc1_;
      }
      
      protected function onUpgradeLinkClick(param1:FlowElementMouseEvent) : void
      {
         ExternalLinkManager.instance.navigateWithSession(ServerConstants.BUSINESS_PLAN_PAGE_PATH,"wndbizplan");
         ServerConnector.instance.onUpsellUpgradePending();
      }
      
      private function _PreviewSaveGroup_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.radiusX = 12;
         _loc1_.fill = this._PreviewSaveGroup_SolidColor1_c();
         _loc1_.initialized(this,"background");
         this.background = _loc1_;
         BindingManager.executeBindings(this,"background",this.background);
         return _loc1_;
      }
      
      private function _PreviewSaveGroup_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16711680;
         _loc1_.alpha = 0.4;
         return _loc1_;
      }
      
      private function _PreviewSaveGroup_RichEditableText1_i() : RichEditableText
      {
         var _loc1_:RichEditableText = new RichEditableText();
         _loc1_.multiline = true;
         _loc1_.percentWidth = 100;
         _loc1_.editable = false;
         _loc1_.focusEnabled = false;
         _loc1_.selectable = false;
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("fontSize",13);
         _loc1_.setStyle("color",16777215);
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("paddingLeft",12);
         _loc1_.setStyle("paddingRight",12);
         _loc1_.setStyle("paddingTop",1);
         _loc1_.id = "warnLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.warnLabel = _loc1_;
         BindingManager.executeBindings(this,"warnLabel",this.warnLabel);
         return _loc1_;
      }
      
      public function ___PreviewSaveGroup_Group1_show(param1:FlexEvent) : void
      {
         this.init();
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
      public function get warnLabel() : RichEditableText
      {
         return this._1766219762warnLabel;
      }
      
      public function set warnLabel(param1:RichEditableText) : void
      {
         var _loc2_:Object = this._1766219762warnLabel;
         if(_loc2_ !== param1)
         {
            this._1766219762warnLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"warnLabel",_loc2_,param1));
            }
         }
      }
   }
}
