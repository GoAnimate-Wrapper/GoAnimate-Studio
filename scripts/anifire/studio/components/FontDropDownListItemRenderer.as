package anifire.studio.components
{
   import anifire.models.FontModel;
   import flash.events.Event;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.states.SetProperty;
   import mx.states.SetStyle;
   import mx.states.State;
   import spark.components.Label;
   import spark.components.supportClasses.ItemRenderer;
   import spark.primitives.BitmapImage;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class FontDropDownListItemRenderer extends ItemRenderer implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _250742733_FontDropDownListItemRenderer_SolidColor1:SolidColor;
      
      private var _100313435image:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _1548790679_imageSource:Object;
      
      private var _508742760_displayImage:Boolean;
      
      private var _font:FontModel;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function FontDropDownListItemRenderer()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._FontDropDownListItemRenderer_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_FontDropDownListItemRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return FontDropDownListItemRenderer[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.buttonMode = true;
         this.height = 34;
         this.width = 225;
         this.mxmlContent = [this._FontDropDownListItemRenderer_Rect1_c(),this._FontDropDownListItemRenderer_Label1_i(),this._FontDropDownListItemRenderer_BitmapImage1_i()];
         this.currentState = "normal";
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"hovered",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_FontDropDownListItemRenderer_SolidColor1",
               "name":"color",
               "value":6142119
            }),new SetStyle().initializeFromObject({
               "target":"labelDisplay",
               "name":"color",
               "value":16777215
            })]
         }),new State({
            "name":"selected",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_FontDropDownListItemRenderer_SolidColor1",
               "name":"color",
               "value":6142119
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
         FontDropDownListItemRenderer._watcherSetupUtil = param1;
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
         this._font = data as FontModel;
         if(this._font)
         {
            this._imageSource = this._font.imageSource;
         }
         else
         {
            this._imageSource = null;
         }
         this._displayImage = this._imageSource != null;
      }
      
      private function image_readyHandler(param1:Event) : void
      {
         if(this._font && !this._font.listBitmapData)
         {
            this._font.listBitmapData = this.image.bitmapData;
         }
      }
      
      private function _FontDropDownListItemRenderer_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._FontDropDownListItemRenderer_SolidColor1_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FontDropDownListItemRenderer_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         this._FontDropDownListItemRenderer_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_FontDropDownListItemRenderer_SolidColor1",this._FontDropDownListItemRenderer_SolidColor1);
         return _loc1_;
      }
      
      private function _FontDropDownListItemRenderer_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.left = 5;
         _loc1_.right = 5;
         _loc1_.verticalCenter = 0;
         _loc1_.maxDisplayedLines = 1;
         _loc1_.showTruncationTip = true;
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
      
      private function _FontDropDownListItemRenderer_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.horizontalAlign = "left";
         _loc1_.left = 5;
         _loc1_.top = 2;
         _loc1_.bottom = 2;
         _loc1_.right = 5;
         _loc1_.scaleMode = "letterbox";
         _loc1_.addEventListener("ready",this.__image_ready);
         _loc1_.initialized(this,"image");
         this.image = _loc1_;
         BindingManager.executeBindings(this,"image",this.image);
         return _loc1_;
      }
      
      public function __image_ready(param1:FlexEvent) : void
      {
         this.image_readyHandler(param1);
      }
      
      private function _FontDropDownListItemRenderer_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Boolean
         {
            return !_displayImage;
         },null,"labelDisplay.visible");
         result[1] = new Binding(this,function():Object
         {
            return _imageSource;
         },null,"image.source");
         result[2] = new Binding(this,function():Boolean
         {
            return _displayImage;
         },null,"image.visible");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _FontDropDownListItemRenderer_SolidColor1() : SolidColor
      {
         return this._250742733_FontDropDownListItemRenderer_SolidColor1;
      }
      
      public function set _FontDropDownListItemRenderer_SolidColor1(param1:SolidColor) : void
      {
         var _loc2_:Object = this._250742733_FontDropDownListItemRenderer_SolidColor1;
         if(_loc2_ !== param1)
         {
            this._250742733_FontDropDownListItemRenderer_SolidColor1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_FontDropDownListItemRenderer_SolidColor1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get image() : BitmapImage
      {
         return this._100313435image;
      }
      
      public function set image(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._100313435image;
         if(_loc2_ !== param1)
         {
            this._100313435image = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"image",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _imageSource() : Object
      {
         return this._1548790679_imageSource;
      }
      
      private function set _imageSource(param1:Object) : void
      {
         var _loc2_:Object = this._1548790679_imageSource;
         if(_loc2_ !== param1)
         {
            this._1548790679_imageSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_imageSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _displayImage() : Boolean
      {
         return this._508742760_displayImage;
      }
      
      private function set _displayImage(param1:Boolean) : void
      {
         var _loc2_:Object = this._508742760_displayImage;
         if(_loc2_ !== param1)
         {
            this._508742760_displayImage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_displayImage",_loc2_,param1));
            }
         }
      }
   }
}
