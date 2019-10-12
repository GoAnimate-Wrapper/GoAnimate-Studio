package anifire.studio.components
{
   import anifire.util.UtilUnitConvert;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import spark.components.Group;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   public class SceneTransitionView extends Group
   {
       
      
      private var _1051791169transIcon:SceneTransitionIcon;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _transType:String = "";
      
      private var _transDur:Number = 0;
      
      public function SceneTransitionView()
      {
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._SceneTransitionView_Rect1_c(),this._SceneTransitionView_Line1_c(),this._SceneTransitionView_Group2_c()];
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
      
      public function get transDur() : Number
      {
         return this._transDur;
      }
      
      public function set transDur(param1:Number) : void
      {
         if(this._transDur != param1)
         {
            this._transDur = param1;
            this.updateTransTag();
         }
      }
      
      public function get transType() : String
      {
         return this._transType;
      }
      
      public function set transType(param1:String) : void
      {
         if(this._transType != param1)
         {
            this._transType = param1;
            this.updateTransTag();
         }
      }
      
      public function updateTransTag() : void
      {
         if(this.transType == "" || this.transDur <= 0)
         {
            this.visible = false;
         }
         else
         {
            this.width = UtilUnitConvert.frameToPixel(this.transDur);
            this.transIcon.transitionType = this.transType;
            this.visible = true;
         }
      }
      
      private function _SceneTransitionView_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._SceneTransitionView_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SceneTransitionView_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 0;
         _loc1_.alpha = 0.5;
         return _loc1_;
      }
      
      private function _SceneTransitionView_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._SceneTransitionView_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SceneTransitionView_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _SceneTransitionView_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 0;
         _loc1_.bottom = 0;
         _loc1_.mxmlContent = [this._SceneTransitionView_Rect2_c(),this._SceneTransitionView_SceneTransitionIcon1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SceneTransitionView_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._SceneTransitionView_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SceneTransitionView_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _SceneTransitionView_SceneTransitionIcon1_i() : SceneTransitionIcon
      {
         var _loc1_:SceneTransitionIcon = new SceneTransitionIcon();
         _loc1_.scaleX = 0.5;
         _loc1_.scaleY = 0.5;
         _loc1_.left = 1;
         _loc1_.right = 1;
         _loc1_.top = 1;
         _loc1_.bottom = 1;
         _loc1_.initialized(this,"transIcon");
         this.transIcon = _loc1_;
         BindingManager.executeBindings(this,"transIcon",this.transIcon);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get transIcon() : SceneTransitionIcon
      {
         return this._1051791169transIcon;
      }
      
      public function set transIcon(param1:SceneTransitionIcon) : void
      {
         var _loc2_:Object = this._1051791169transIcon;
         if(_loc2_ !== param1)
         {
            this._1051791169transIcon = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"transIcon",_loc2_,param1));
            }
         }
      }
   }
}
