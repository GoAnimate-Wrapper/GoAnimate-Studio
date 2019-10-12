package anifire.studio.components
{
   import anifire.studio.models.ColorPaletteModel;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.VGroup;
   import spark.components.supportClasses.ItemRenderer;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class ColorPalettePickerItemRenderer extends ItemRenderer implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _ColorPalettePickerItemRenderer_SolidColor1:SolidColor;
      
      private var _1776545891_ColorPalettePickerItemRenderer_SolidColorStroke1:SolidColorStroke;
      
      private var _798910853palette:ColorPalette;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _1842425070baseColor:uint;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ColorPalettePickerItemRenderer()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._ColorPalettePickerItemRenderer_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_ColorPalettePickerItemRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ColorPalettePickerItemRenderer[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.autoDrawBackground = false;
         this.buttonMode = true;
         this.mxmlContent = [this._ColorPalettePickerItemRenderer_Rect1_c(),this._ColorPalettePickerItemRenderer_VGroup1_c()];
         this.currentState = "normal";
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"hovered",
            "overrides":[new SetProperty().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"_ColorPalettePickerItemRenderer_SolidColorStroke1",
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
         ColorPalettePickerItemRenderer._watcherSetupUtil = param1;
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
         this.palette.colorPaletteModel = param1 as ColorPaletteModel;
      }
      
      override public function set itemIndex(param1:int) : void
      {
         super.itemIndex = param1;
         this.baseColor = param1 % 2 == 0?uint(16777215):uint(0);
      }
      
      private function _ColorPalettePickerItemRenderer_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._ColorPalettePickerItemRenderer_SolidColor1_i();
         _loc1_.stroke = this._ColorPalettePickerItemRenderer_SolidColorStroke1_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ColorPalettePickerItemRenderer_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         this._ColorPalettePickerItemRenderer_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_ColorPalettePickerItemRenderer_SolidColor1",this._ColorPalettePickerItemRenderer_SolidColor1);
         return _loc1_;
      }
      
      private function _ColorPalettePickerItemRenderer_SolidColorStroke1_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         this._ColorPalettePickerItemRenderer_SolidColorStroke1 = _loc1_;
         BindingManager.executeBindings(this,"_ColorPalettePickerItemRenderer_SolidColorStroke1",this._ColorPalettePickerItemRenderer_SolidColorStroke1);
         return _loc1_;
      }
      
      private function _ColorPalettePickerItemRenderer_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.paddingBottom = 5;
         _loc1_.paddingLeft = 5;
         _loc1_.paddingRight = 5;
         _loc1_.paddingTop = 5;
         _loc1_.mxmlContent = [this._ColorPalettePickerItemRenderer_ColorPalette1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ColorPalettePickerItemRenderer_ColorPalette1_i() : ColorPalette
      {
         var _loc1_:ColorPalette = new ColorPalette();
         _loc1_.id = "palette";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.palette = _loc1_;
         BindingManager.executeBindings(this,"palette",this.palette);
         return _loc1_;
      }
      
      private function _ColorPalettePickerItemRenderer_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():uint
         {
            return baseColor;
         },null,"_ColorPalettePickerItemRenderer_SolidColor1.color");
         result[1] = new Binding(this,function():uint
         {
            return baseColor;
         },null,"_ColorPalettePickerItemRenderer_SolidColorStroke1.color");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _ColorPalettePickerItemRenderer_SolidColorStroke1() : SolidColorStroke
      {
         return this._1776545891_ColorPalettePickerItemRenderer_SolidColorStroke1;
      }
      
      public function set _ColorPalettePickerItemRenderer_SolidColorStroke1(param1:SolidColorStroke) : void
      {
         var _loc2_:Object = this._1776545891_ColorPalettePickerItemRenderer_SolidColorStroke1;
         if(_loc2_ !== param1)
         {
            this._1776545891_ColorPalettePickerItemRenderer_SolidColorStroke1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ColorPalettePickerItemRenderer_SolidColorStroke1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get palette() : ColorPalette
      {
         return this._798910853palette;
      }
      
      public function set palette(param1:ColorPalette) : void
      {
         var _loc2_:Object = this._798910853palette;
         if(_loc2_ !== param1)
         {
            this._798910853palette = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"palette",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get baseColor() : uint
      {
         return this._1842425070baseColor;
      }
      
      private function set baseColor(param1:uint) : void
      {
         var _loc2_:Object = this._1842425070baseColor;
         if(_loc2_ !== param1)
         {
            this._1842425070baseColor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"baseColor",_loc2_,param1));
            }
         }
      }
   }
}
