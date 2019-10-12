package anifire.studio.components
{
   import anifire.constant.AnimeConstants;
   import anifire.studio.core.BackgroundThumb;
   import anifire.studio.managers.ColorManager;
   import anifire.studio.models.ThumbModel;
   import anifire.util.UtilColor;
   import anifire.util.UtilPlain;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
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
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.primitives.BitmapImage;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class BackdropImage extends ThumbImageBase implements IBindingClient, IStateClient2
   {
      
      protected static var __clipRect:Rectangle = new Rectangle(0,0,AnimeConstants.SCREEN_WIDTH,AnimeConstants.SCREEN_HEIGHT);
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _BackdropImage_SolidColor1:SolidColor;
      
      private var _1842425070baseColor:Rect;
      
      private var _2024940825imageDisplay:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _loader:Loader;
      
      protected var _bitmapData:BitmapData;
      
      protected var _displayWidth:Number = 135;
      
      protected var _displayHeight:Number = 90;
      
      protected var _displayMatrix:Matrix;
      
      protected var _963628435_baseColor:uint = 16777215;
      
      public var wideMode:Boolean;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function BackdropImage()
      {
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._loader = new Loader();
         this._displayMatrix = new Matrix();
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._BackdropImage_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_BackdropImageWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return BackdropImage[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.showTransition = false;
         this.mxmlContent = [this._BackdropImage_Rect1_i(),this._BackdropImage_BitmapImage1_i()];
         this.currentState = "normal";
         this.addEventListener("addedToStage",this.___BackdropImage_ThumbImageBase1_addedToStage);
         this.addEventListener("removedFromStage",this.___BackdropImage_ThumbImageBase1_removedFromStage);
         states = [new State({
            "name":"normal",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"baseColor",
               "name":"visible",
               "value":true
            })]
         }),new State({
            "name":"loading",
            "stateGroups":["busyStates"],
            "overrides":[]
         }),new State({
            "name":"processing",
            "stateGroups":["busyStates"],
            "overrides":[]
         }),new State({
            "name":"ready",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"imageDisplay",
               "name":"visible",
               "value":true
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
         BackdropImage._watcherSetupUtil = param1;
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
      
      override public function set model(param1:ThumbModel) : void
      {
         super.model = param1;
         this._baseColor = ColorManager.instance.getSceneColor();
      }
      
      override protected function loadProductImage() : void
      {
         if(_product)
         {
            if(_product.imageData)
            {
               onLoadingComplete();
            }
            else
            {
               super.loadProductImage();
            }
         }
      }
      
      override protected function processProductImage() : void
      {
         if(_product.imageData is ByteArray)
         {
            _processing = true;
            this._loader.contentLoaderInfo.addEventListener(Event.INIT,this.onImageLoaderInit);
            this._loader.loadBytes(ByteArray(_product.imageData));
         }
         else
         {
            this.onImageLoaderInit();
         }
      }
      
      override protected function cancelProcessing() : void
      {
         if(_processing)
         {
            this._loader.contentLoaderInfo.removeEventListener(Event.INIT,this.onImageLoaderInit);
            _processing = false;
         }
      }
      
      protected function onImageLoaderInit(param1:Event = null) : void
      {
         this.cancelProcessing();
         if(_product.themeId != "ugc" && !(this._loader.content is Bitmap))
         {
            UtilPlain.stopFamily(this._loader.content);
            this.createBitmap(this._loader.content);
         }
         else
         {
            this.imageDisplay.source = this._loader.content;
         }
         displayImage();
      }
      
      override protected function removeImage() : void
      {
         if(this._bitmapData)
         {
            this._bitmapData.dispose();
            this._bitmapData = null;
            this.imageDisplay.source = null;
         }
      }
      
      protected function createBitmap(param1:DisplayObject) : void
      {
         var _loc3_:Object = null;
         var _loc4_:Object = null;
         var _loc5_:* = null;
         if(!this._bitmapData)
         {
            if(this.wideMode)
            {
               this._displayWidth = 180;
               this._displayHeight = 99;
            }
            this._bitmapData = new BitmapData(this._displayWidth,this._displayHeight);
         }
         var _loc2_:BackgroundThumb = _product as BackgroundThumb;
         if(_loc2_ && param1)
         {
            _loc3_ = ColorManager.instance.colorMapping;
            _loc4_ = _loc2_.defaultColor;
            for(_loc5_ in _loc4_)
            {
               if(_loc3_.hasOwnProperty(_loc5_))
               {
                  UtilColor.setAssetPartColor(param1,_loc5_,_loc3_[_loc5_] as uint);
               }
            }
            this._displayMatrix.a = this._displayWidth / Math.min(param1.width,__clipRect.width);
            this._displayMatrix.d = this._displayHeight / Math.min(param1.height,__clipRect.height);
            this._bitmapData.draw(param1,this._displayMatrix,new ColorTransform(),null,__clipRect,true);
         }
         this.imageDisplay.source = this._bitmapData;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         if(this._loader && this._loader.content)
         {
            this.createBitmap(this._loader.content);
         }
         super.updateDisplayList(param1,param2);
      }
      
      protected function colorManager_changeHandler(param1:Event) : void
      {
         this._baseColor = ColorManager.instance.getSceneColor();
         invalidateDisplayList();
      }
      
      protected function addedToStageHandler(param1:Event) : void
      {
         ColorManager.instance.addEventListener(Event.CHANGE,this.colorManager_changeHandler);
      }
      
      protected function removedFromStageHandler(param1:Event) : void
      {
         ColorManager.instance.removeEventListener(Event.CHANGE,this.colorManager_changeHandler);
         this.removeImage();
      }
      
      private function _BackdropImage_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.visible = false;
         _loc1_.fill = this._BackdropImage_SolidColor1_i();
         _loc1_.initialized(this,"baseColor");
         this.baseColor = _loc1_;
         BindingManager.executeBindings(this,"baseColor",this.baseColor);
         return _loc1_;
      }
      
      private function _BackdropImage_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         this._BackdropImage_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_BackdropImage_SolidColor1",this._BackdropImage_SolidColor1);
         return _loc1_;
      }
      
      private function _BackdropImage_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.smooth = true;
         _loc1_.scaleMode = "zoom";
         _loc1_.verticalAlign = "middle";
         _loc1_.horizontalAlign = "center";
         _loc1_.visible = false;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.initialized(this,"imageDisplay");
         this.imageDisplay = _loc1_;
         BindingManager.executeBindings(this,"imageDisplay",this.imageDisplay);
         return _loc1_;
      }
      
      public function ___BackdropImage_ThumbImageBase1_addedToStage(param1:Event) : void
      {
         this.addedToStageHandler(param1);
      }
      
      public function ___BackdropImage_ThumbImageBase1_removedFromStage(param1:Event) : void
      {
         this.removedFromStageHandler(param1);
      }
      
      private function _BackdropImage_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():uint
         {
            return _baseColor;
         },null,"_BackdropImage_SolidColor1.color");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get baseColor() : Rect
      {
         return this._1842425070baseColor;
      }
      
      public function set baseColor(param1:Rect) : void
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
      
      [Bindable(event="propertyChange")]
      public function get imageDisplay() : BitmapImage
      {
         return this._2024940825imageDisplay;
      }
      
      public function set imageDisplay(param1:BitmapImage) : void
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
      protected function get _baseColor() : uint
      {
         return this._963628435_baseColor;
      }
      
      protected function set _baseColor(param1:uint) : void
      {
         var _loc2_:Object = this._963628435_baseColor;
         if(_loc2_ !== param1)
         {
            this._963628435_baseColor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_baseColor",_loc2_,param1));
            }
         }
      }
   }
}
