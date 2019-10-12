package anifire.studio.components
{
   import anifire.studio.core.PropThumb;
   import anifire.studio.models.ThumbModel;
   import anifire.util.UtilDict;
   import anifire.util.UtilUser;
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
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.State;
   import spark.primitives.BitmapImage;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class SwapPropRenderer extends ThumbRendererBase implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _SwapPropRenderer_BitmapImage1:BitmapImage;
      
      public var _SwapPropRenderer_BitmapImage2:BitmapImage;
      
      public var _SwapPropRenderer_Rect1:Rect;
      
      private var _2024940825imageDisplay:ProductThumbSparkImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _model:ThumbModel;
      
      protected var _dataSource:PropThumb;
      
      protected var _colorSetId:String = "";
      
      private var _1407438669_showAddNewButton:Boolean;
      
      private var _1287624402_showRemoveButton:Boolean;
      
      private var _embed_mxml__styles_images_tray_button_flow_frame_remove_image_png_349686251:Class;
      
      private var _embed_mxml__styles_images_tray_add_cc_png_1007439909:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SwapPropRenderer()
      {
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__styles_images_tray_button_flow_frame_remove_image_png_349686251 = SwapPropRenderer__embed_mxml__styles_images_tray_button_flow_frame_remove_image_png_349686251;
         this._embed_mxml__styles_images_tray_add_cc_png_1007439909 = SwapPropRenderer__embed_mxml__styles_images_tray_add_cc_png_1007439909;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._SwapPropRenderer_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_SwapPropRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SwapPropRenderer[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 60;
         this.height = 80;
         this.clipAndEnableScrolling = true;
         this.buttonMode = true;
         this.mxmlContent = [this._SwapPropRenderer_ProductThumbSparkImage1_i(),this._SwapPropRenderer_BitmapImage1_i(),this._SwapPropRenderer_BitmapImage2_i()];
         this.currentState = "normal";
         var _SwapPropRenderer_Rect1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._SwapPropRenderer_Rect1_i);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"hovered",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_SwapPropRenderer_Rect1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_SwapPropRenderer_BitmapImage2"]
            })]
         }),new State({
            "name":"dragging",
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
         SwapPropRenderer._watcherSetupUtil = param1;
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
         this._model = data as ThumbModel;
         _toolTipContent = "";
         if(this._model)
         {
            this._dataSource = this._model.thumb as PropThumb;
            this._colorSetId = this._model.colorSetId;
            if(this._model.isPlaceHolder)
            {
               this.updatePlaceHolderData();
            }
            else
            {
               this._showAddNewButton = false;
               this._showRemoveButton = false;
            }
         }
         else
         {
            this._dataSource = null;
            this._colorSetId = "";
         }
         if(this._dataSource)
         {
            this.updateThumbData();
         }
         this.imageDisplay.model = this._model;
      }
      
      protected function updatePlaceHolderData() : void
      {
         switch(this._model.placeHolderValue)
         {
            case ThumbModel.PLACE_HOLDER_ADD_INNER_IMAGE:
               this._showAddNewButton = true;
               this._showRemoveButton = false;
               _toolTipContent = UtilDict.translate("Add Image");
               break;
            case ThumbModel.PLACE_HOLDER_REMOVE_INNER_IMAGE:
               this._showAddNewButton = false;
               this._showRemoveButton = true;
               _toolTipContent = UtilDict.translate("Clear Image");
         }
      }
      
      protected function updateThumbData() : void
      {
         if(UtilUser.hasAdminFeatures)
         {
            _toolTipContent = this._dataSource.toString();
         }
         else
         {
            _toolTipContent = this._dataSource.name;
         }
      }
      
      override protected function shouldStartDrag(param1:MouseEvent) : Boolean
      {
         return false;
      }
      
      private function _SwapPropRenderer_ProductThumbSparkImage1_i() : ProductThumbSparkImage
      {
         var _loc1_:ProductThumbSparkImage = new ProductThumbSparkImage();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.id = "imageDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.imageDisplay = _loc1_;
         BindingManager.executeBindings(this,"imageDisplay",this.imageDisplay);
         return _loc1_;
      }
      
      private function _SwapPropRenderer_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__styles_images_tray_add_cc_png_1007439909;
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.initialized(this,"_SwapPropRenderer_BitmapImage1");
         this._SwapPropRenderer_BitmapImage1 = _loc1_;
         BindingManager.executeBindings(this,"_SwapPropRenderer_BitmapImage1",this._SwapPropRenderer_BitmapImage1);
         return _loc1_;
      }
      
      private function _SwapPropRenderer_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__styles_images_tray_button_flow_frame_remove_image_png_349686251;
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.initialized(this,"_SwapPropRenderer_BitmapImage2");
         this._SwapPropRenderer_BitmapImage2 = _loc1_;
         BindingManager.executeBindings(this,"_SwapPropRenderer_BitmapImage2",this._SwapPropRenderer_BitmapImage2);
         return _loc1_;
      }
      
      private function _SwapPropRenderer_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._SwapPropRenderer_SolidColorStroke1_c();
         _loc1_.initialized(this,"_SwapPropRenderer_Rect1");
         this._SwapPropRenderer_Rect1 = _loc1_;
         BindingManager.executeBindings(this,"_SwapPropRenderer_Rect1",this._SwapPropRenderer_Rect1);
         return _loc1_;
      }
      
      private function _SwapPropRenderer_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 5093288;
         return _loc1_;
      }
      
      private function _SwapPropRenderer_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Boolean
         {
            return _showAddNewButton;
         },null,"_SwapPropRenderer_BitmapImage1.visible");
         result[1] = new Binding(this,function():Boolean
         {
            return _showAddNewButton;
         },null,"_SwapPropRenderer_BitmapImage1.includeInLayout");
         result[2] = new Binding(this,function():Boolean
         {
            return _showRemoveButton;
         },null,"_SwapPropRenderer_BitmapImage2.visible");
         result[3] = new Binding(this,function():Boolean
         {
            return _showRemoveButton;
         },null,"_SwapPropRenderer_BitmapImage2.includeInLayout");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get imageDisplay() : ProductThumbSparkImage
      {
         return this._2024940825imageDisplay;
      }
      
      public function set imageDisplay(param1:ProductThumbSparkImage) : void
      {
         var _loc2_:Object = this._2024940825imageDisplay;
         if(_loc2_ !== param1)
         {
            this._2024940825imageDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _showAddNewButton() : Boolean
      {
         return this._1407438669_showAddNewButton;
      }
      
      private function set _showAddNewButton(param1:Boolean) : void
      {
         var _loc2_:Object = this._1407438669_showAddNewButton;
         if(_loc2_ !== param1)
         {
            this._1407438669_showAddNewButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_showAddNewButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _showRemoveButton() : Boolean
      {
         return this._1287624402_showRemoveButton;
      }
      
      private function set _showRemoveButton(param1:Boolean) : void
      {
         var _loc2_:Object = this._1287624402_showRemoveButton;
         if(_loc2_ !== param1)
         {
            this._1287624402_showRemoveButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_showRemoveButton",_loc2_,param1));
            }
         }
      }
   }
}
