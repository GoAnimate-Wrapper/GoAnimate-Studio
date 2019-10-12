package anifire.studio.components
{
   import anifire.constant.ServerConstants;
   import anifire.managers.AppConfigManager;
   import anifire.studio.models.WidgetStyleVariantModel;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColorStroke;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.supportClasses.ItemRenderer;
   import spark.primitives.BitmapImage;
   import spark.primitives.Rect;
   
   public class WidgetStyleThumbRenderer extends ItemRenderer implements IStateClient2
   {
      
      public static const WIDGET_THUMBNAIL_PATH_PREFIX:String = "go/img/widgets/styles/";
      
      public static var __pathPrefix:String;
      
      public static var __pathRegExp:RegExp;
       
      
      private var _1645529709_WidgetStyleThumbRenderer_SolidColorStroke1:SolidColorStroke;
      
      private var _100313435image:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function WidgetStyleThumbRenderer()
      {
         super();
         mx_internal::_document = this;
         this.autoDrawBackground = true;
         this.width = 85;
         this.height = 85;
         this.buttonMode = true;
         this.mxmlContent = [this._WidgetStyleThumbRenderer_BitmapImage1_i(),this._WidgetStyleThumbRenderer_Rect1_c()];
         this.currentState = "normal";
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"hovered",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_WidgetStyleThumbRenderer_SolidColorStroke1",
               "name":"color",
               "value":5093288
            })]
         }),new State({
            "name":"selected",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_WidgetStyleThumbRenderer_SolidColorStroke1",
               "name":"color",
               "value":5093288
            })]
         })];
      }
      
      public static function get pathPrefix() : String
      {
         if(!__pathPrefix)
         {
            __pathPrefix = AppConfigManager.instance.getValue(ServerConstants.FLASHVAR_CLIENT_THEME_PATH);
         }
         return __pathPrefix;
      }
      
      public static function get pathRegExp() : RegExp
      {
         if(!__pathRegExp)
         {
            __pathRegExp = new RegExp(ServerConstants.FLASHVAR_CLIENT_THEME_PLACEHOLDER,"g");
         }
         return __pathRegExp;
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
         var _loc2_:WidgetStyleVariantModel = param1 as WidgetStyleVariantModel;
         if(_loc2_)
         {
            this.image.source = pathPrefix.replace(pathRegExp,WIDGET_THUMBNAIL_PATH_PREFIX + _loc2_.imageName);
         }
      }
      
      private function _WidgetStyleThumbRenderer_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.initialized(this,"image");
         this.image = _loc1_;
         BindingManager.executeBindings(this,"image",this.image);
         return _loc1_;
      }
      
      private function _WidgetStyleThumbRenderer_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._WidgetStyleThumbRenderer_SolidColorStroke1_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _WidgetStyleThumbRenderer_SolidColorStroke1_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 14540253;
         this._WidgetStyleThumbRenderer_SolidColorStroke1 = _loc1_;
         BindingManager.executeBindings(this,"_WidgetStyleThumbRenderer_SolidColorStroke1",this._WidgetStyleThumbRenderer_SolidColorStroke1);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _WidgetStyleThumbRenderer_SolidColorStroke1() : SolidColorStroke
      {
         return this._1645529709_WidgetStyleThumbRenderer_SolidColorStroke1;
      }
      
      public function set _WidgetStyleThumbRenderer_SolidColorStroke1(param1:SolidColorStroke) : void
      {
         var _loc2_:Object = this._1645529709_WidgetStyleThumbRenderer_SolidColorStroke1;
         if(_loc2_ !== param1)
         {
            this._1645529709_WidgetStyleThumbRenderer_SolidColorStroke1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_WidgetStyleThumbRenderer_SolidColorStroke1",_loc2_,param1));
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
   }
}
