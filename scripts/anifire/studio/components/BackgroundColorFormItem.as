package anifire.studio.components
{
   import anifire.event.ColorPaletteEvent;
   import anifire.studio.models.ColorPartModel;
   import anifire.util.UtilDict;
   import flash.events.MouseEvent;
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
   import mx.states.State;
   import spark.components.FormItem;
   
   use namespace mx_internal;
   
   public class BackgroundColorFormItem extends FormItem implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _885706193colorPicker:ColorPaletteDropDown;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _model:ColorPartModel;
      
      private var _1271563601colorLabel:String;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function BackgroundColorFormItem()
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
         bindings = this._BackgroundColorFormItem_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_BackgroundColorFormItemWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return BackgroundColorFormItem[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._BackgroundColorFormItem_Array2_c);
         this.currentState = "disabled";
         states = [new State({
            "name":"disabled",
            "overrides":[]
         }),new State({
            "name":"down",
            "overrides":[]
         }),new State({
            "name":"over",
            "overrides":[]
         }),new State({
            "name":"normal",
            "overrides":[]
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
         BackgroundColorFormItem._watcherSetupUtil = param1;
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
      
      [Bindable(event="propertyChange")]
      public function get model() : ColorPartModel
      {
         return this._model;
      }
      
      private function set _104069929model(param1:ColorPartModel) : void
      {
         var _loc2_:String = null;
         if(this._model != param1)
         {
            this._model = param1;
            if(this._model && this._model.partId)
            {
               _loc2_ = this._model.partId;
               _loc2_ = _loc2_.replace("_"," ");
               label = UtilDict.toDisplay("store",_loc2_);
            }
         }
      }
      
      protected function colorPicker_colorChangeHandler(param1:ColorPaletteEvent) : void
      {
         this._model.color = param1.colorCode as uint;
         dispatchEvent(new ColorPaletteEvent(ColorPaletteEvent.COLOR_CHANGE));
      }
      
      protected function colorPicker_previewColorHandler(param1:ColorPaletteEvent) : void
      {
         this._model.color = param1.colorCode as uint;
         dispatchEvent(new ColorPaletteEvent(ColorPaletteEvent.COLOR_PREVIEW));
      }
      
      protected function colorPicker_mouseOverHandler(param1:MouseEvent) : void
      {
         currentState = "over";
      }
      
      protected function colorPicker_mouseOutHandler(param1:MouseEvent) : void
      {
         currentState = "normal";
      }
      
      private function _BackgroundColorFormItem_Array2_c() : Array
      {
         var _loc1_:Array = [this._BackgroundColorFormItem_ColorPaletteDropDown1_i()];
         return _loc1_;
      }
      
      private function _BackgroundColorFormItem_ColorPaletteDropDown1_i() : ColorPaletteDropDown
      {
         var _loc1_:ColorPaletteDropDown = new ColorPaletteDropDown();
         _loc1_.addEventListener("colorChange",this.__colorPicker_colorChange);
         _loc1_.addEventListener("colorPreview",this.__colorPicker_colorPreview);
         _loc1_.addEventListener("mouseOver",this.__colorPicker_mouseOver);
         _loc1_.addEventListener("mouseOut",this.__colorPicker_mouseOut);
         _loc1_.id = "colorPicker";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.colorPicker = _loc1_;
         BindingManager.executeBindings(this,"colorPicker",this.colorPicker);
         return _loc1_;
      }
      
      public function __colorPicker_colorChange(param1:ColorPaletteEvent) : void
      {
         this.colorPicker_colorChangeHandler(param1);
      }
      
      public function __colorPicker_colorPreview(param1:ColorPaletteEvent) : void
      {
         this.colorPicker_previewColorHandler(param1);
      }
      
      public function __colorPicker_mouseOver(param1:MouseEvent) : void
      {
         this.colorPicker_mouseOverHandler(param1);
      }
      
      public function __colorPicker_mouseOut(param1:MouseEvent) : void
      {
         this.colorPicker_mouseOutHandler(param1);
      }
      
      private function _BackgroundColorFormItem_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Boolean
         {
            return model.allowTransparent;
         },null,"colorPicker.allowTransparent");
         result[1] = new Binding(this,function():uint
         {
            return model.color;
         },null,"colorPicker.selectedColor");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get colorPicker() : ColorPaletteDropDown
      {
         return this._885706193colorPicker;
      }
      
      public function set colorPicker(param1:ColorPaletteDropDown) : void
      {
         var _loc2_:Object = this._885706193colorPicker;
         if(_loc2_ !== param1)
         {
            this._885706193colorPicker = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"colorPicker",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get colorLabel() : String
      {
         return this._1271563601colorLabel;
      }
      
      private function set colorLabel(param1:String) : void
      {
         var _loc2_:Object = this._1271563601colorLabel;
         if(_loc2_ !== param1)
         {
            this._1271563601colorLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"colorLabel",_loc2_,param1));
            }
         }
      }
      
      public function set model(param1:ColorPartModel) : void
      {
         var _loc2_:Object = this.model;
         if(_loc2_ !== param1)
         {
            this._104069929model = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"model",_loc2_,param1));
            }
         }
      }
   }
}
