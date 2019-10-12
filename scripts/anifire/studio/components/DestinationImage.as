package anifire.studio.components
{
   import anifire.assets.transition.AssetTransitionConstants;
   import anifire.studio.utils.DirectionIcons;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.primitives.BitmapImage;
   
   use namespace mx_internal;
   
   public class DestinationImage extends Group implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _1031744009iconDisplay:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _1429847026destination:int;
      
      private var _1099846370reverse:Boolean;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function DestinationImage()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._DestinationImage_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_DestinationImageWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return DestinationImage[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 25;
         this.height = 25;
         this.mxmlContent = [this._DestinationImage_BitmapImage1_i()];
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         DestinationImage._watcherSetupUtil = param1;
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
      
      protected function getIcon(param1:int, param2:Boolean) : Class
      {
         if(param2)
         {
            switch(param1)
            {
               case AssetTransitionConstants.DEST_TL:
                  return DirectionIcons.BOTTOM_RIGHT;
               case AssetTransitionConstants.DEST_TOP:
                  return DirectionIcons.BOTTOM;
               case AssetTransitionConstants.DEST_TR:
                  return DirectionIcons.BOTTOM_LEFT;
               case AssetTransitionConstants.DEST_LEFT:
                  return DirectionIcons.RIGHT;
               case AssetTransitionConstants.DEST_CENTER:
                  return DirectionIcons.CENTER;
               case AssetTransitionConstants.DEST_RIGHT:
                  return DirectionIcons.LEFT;
               case AssetTransitionConstants.DEST_BL:
                  return DirectionIcons.TOP_RIGHT;
               case AssetTransitionConstants.DEST_BOTTOM:
                  return DirectionIcons.TOP;
               case AssetTransitionConstants.DEST_BR:
                  return DirectionIcons.TOP_LEFT;
            }
         }
         else
         {
            switch(param1)
            {
               case AssetTransitionConstants.DEST_TL:
                  return DirectionIcons.TOP_LEFT;
               case AssetTransitionConstants.DEST_TOP:
                  return DirectionIcons.TOP;
               case AssetTransitionConstants.DEST_TR:
                  return DirectionIcons.TOP_RIGHT;
               case AssetTransitionConstants.DEST_LEFT:
                  return DirectionIcons.LEFT;
               case AssetTransitionConstants.DEST_CENTER:
                  return DirectionIcons.CENTER;
               case AssetTransitionConstants.DEST_RIGHT:
                  return DirectionIcons.RIGHT;
               case AssetTransitionConstants.DEST_BL:
                  return DirectionIcons.BOTTOM_LEFT;
               case AssetTransitionConstants.DEST_BOTTOM:
                  return DirectionIcons.BOTTOM;
               case AssetTransitionConstants.DEST_BR:
                  return DirectionIcons.BOTTOM_RIGHT;
            }
         }
         return DirectionIcons.ALL;
      }
      
      private function _DestinationImage_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.initialized(this,"iconDisplay");
         this.iconDisplay = _loc1_;
         BindingManager.executeBindings(this,"iconDisplay",this.iconDisplay);
         return _loc1_;
      }
      
      private function _DestinationImage_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Object
         {
            return getIcon(destination,reverse);
         },null,"iconDisplay.source");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get iconDisplay() : BitmapImage
      {
         return this._1031744009iconDisplay;
      }
      
      public function set iconDisplay(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1031744009iconDisplay;
         if(_loc2_ !== param1)
         {
            this._1031744009iconDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"iconDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get destination() : int
      {
         return this._1429847026destination;
      }
      
      public function set destination(param1:int) : void
      {
         var _loc2_:Object = this._1429847026destination;
         if(_loc2_ !== param1)
         {
            this._1429847026destination = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"destination",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get reverse() : Boolean
      {
         return this._1099846370reverse;
      }
      
      public function set reverse(param1:Boolean) : void
      {
         var _loc2_:Object = this._1099846370reverse;
         if(_loc2_ !== param1)
         {
            this._1099846370reverse = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"reverse",_loc2_,param1));
            }
         }
      }
   }
}
