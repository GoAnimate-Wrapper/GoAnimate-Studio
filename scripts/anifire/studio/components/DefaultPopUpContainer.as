package anifire.studio.components
{
   import anifire.studio.managers.StudioStatusManager;
   import anifire.studio.skins.DefaultPopUpContainerSkin;
   import flash.display.DisplayObjectContainer;
   import mx.core.IFlexModuleFactory;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.managers.PopUpManager;
   import spark.components.SkinnablePopUpContainer;
   
   public class DefaultPopUpContainer extends SkinnablePopUpContainer
   {
       
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _title:String;
      
      protected var _message:String;
      
      protected var _confirmText:String;
      
      protected var _cancelText:String;
      
      protected var _subMessage:String;
      
      protected var _data:Object;
      
      protected var _isModal:Boolean;
      
      public function DefaultPopUpContainer()
      {
         super();
         mx_internal::_document = this;
         this.addEventListener("creationComplete",this.___DefaultPopUpContainer_SkinnablePopUpContainer1_creationComplete);
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         var factory:IFlexModuleFactory = param1;
         super.moduleFactory = factory;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
         if(!this.styleDeclaration)
         {
            this.styleDeclaration = new CSSStyleDeclaration(null,styleManager);
         }
         this.styleDeclaration.defaultFactory = function():void
         {
            this.skinClass = DefaultPopUpContainerSkin;
         };
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      public function set data(param1:Object) : void
      {
         this._data = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get title() : String
      {
         return this._title;
      }
      
      private function set _110371416title(param1:String) : void
      {
         if(this._title != param1)
         {
            this._title = param1;
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get message() : String
      {
         return this._message;
      }
      
      private function set _954925063message(param1:String) : void
      {
         if(this._message != param1)
         {
            this._message = param1;
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get subMessage() : String
      {
         return this._subMessage;
      }
      
      private function set _526691929subMessage(param1:String) : void
      {
         if(this._subMessage != param1)
         {
            this._subMessage = param1;
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get confirmText() : String
      {
         return this._confirmText;
      }
      
      private function set _344408077confirmText(param1:String) : void
      {
         if(this._confirmText != param1)
         {
            this._confirmText = param1;
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get cancelText() : String
      {
         return this._cancelText;
      }
      
      private function set _1888623303cancelText(param1:String) : void
      {
         if(this._cancelText != param1)
         {
            this._cancelText = param1;
         }
      }
      
      protected function confirm() : void
      {
         this.close(true,this._data);
      }
      
      protected function cancel() : void
      {
         this.close(false,this._data);
      }
      
      protected function init() : void
      {
      }
      
      override public function open(param1:DisplayObjectContainer, param2:Boolean = false) : void
      {
         super.open(param1,param2);
         PopUpManager.centerPopUp(this);
         if(param2)
         {
            this._isModal = true;
            StudioStatusManager.instance.increaseModalCounter();
         }
      }
      
      override public function close(param1:Boolean = false, param2:* = null) : void
      {
         super.close(param1,param2);
         if(this._isModal)
         {
            StudioStatusManager.instance.decreaseModalCounter();
            this._isModal = false;
         }
      }
      
      public function ___DefaultPopUpContainer_SkinnablePopUpContainer1_creationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      public function set confirmText(param1:String) : void
      {
         var _loc2_:Object = this.confirmText;
         if(_loc2_ !== param1)
         {
            this._344408077confirmText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"confirmText",_loc2_,param1));
            }
         }
      }
      
      public function set message(param1:String) : void
      {
         var _loc2_:Object = this.message;
         if(_loc2_ !== param1)
         {
            this._954925063message = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"message",_loc2_,param1));
            }
         }
      }
      
      public function set title(param1:String) : void
      {
         var _loc2_:Object = this.title;
         if(_loc2_ !== param1)
         {
            this._110371416title = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"title",_loc2_,param1));
            }
         }
      }
      
      public function set subMessage(param1:String) : void
      {
         var _loc2_:Object = this.subMessage;
         if(_loc2_ !== param1)
         {
            this._526691929subMessage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"subMessage",_loc2_,param1));
            }
         }
      }
      
      public function set cancelText(param1:String) : void
      {
         var _loc2_:Object = this.cancelText;
         if(_loc2_ !== param1)
         {
            this._1888623303cancelText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cancelText",_loc2_,param1));
            }
         }
      }
   }
}
