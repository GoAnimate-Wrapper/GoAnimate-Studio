package anifire.studio.components
{
   import anifire.studio.core.Console;
   import anifire.util.UtilSite;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.DragSource;
   import mx.core.IFlexDisplayObject;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.managers.DragManager;
   import spark.components.supportClasses.ItemRenderer;
   
   use namespace mx_internal;
   
   public class ThumbRendererBase extends ItemRenderer implements IBindingClient
   {
      
      protected static const LABEL_DELETE_ASSET:String = "Delete imported {0}";
      
      protected static const LABEL_DELETE_ASSET_MESSAGE:String = "You and your team will no longer be able to use this imported {0}.";
      
      protected static const LABEL_TYPE_BACKGROUND:String = "background";
      
      protected static const LABEL_TYPE_STARTER:String = "starter";
      
      protected static const LABEL_TYPE_CHARACTER:String = "character";
      
      protected static const LABEL_TYPE_FONT:String = "font";
      
      protected static const LABEL_TYPE_EFFECT:String = "effect";
      
      protected static const LABEL_TYPE_PROP:String = "prop";
      
      protected static const LABEL_TYPE_SOUND:String = "sound";
      
      protected static const LABEL_TYPE_VIDEO:String = "video";
      
      protected static const LABEL_TYPE_VOICE:String = "voice";
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _isMouseDown:Boolean = false;
      
      protected var _dragSource:DragSource;
      
      protected var _dragProxy:IFlexDisplayObject;
      
      protected var _dragProxyImageAlpha:Number = 0.5;
      
      protected var _1222364469_toolTipContent:String;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ThumbRendererBase()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._ThumbRendererBase_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_ThumbRendererBaseWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ThumbRendererBase[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.autoDrawBackground = false;
         this.addEventListener("creationComplete",this.___ThumbRendererBase_ItemRenderer1_creationComplete);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         ThumbRendererBase._watcherSetupUtil = param1;
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
         this.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownHandler);
         this.addEventListener(MouseEvent.MOUSE_MOVE,this.mouseMoveHandler);
         this.addEventListener(MouseEvent.MOUSE_UP,this.mouseUpHandler);
         this.addEventListener(MouseEvent.MOUSE_OUT,this.mouseOutHandler);
      }
      
      protected function shouldStartDrag(param1:MouseEvent) : Boolean
      {
         return true;
      }
      
      protected function createDragProxy() : IFlexDisplayObject
      {
         return null;
      }
      
      protected function createDragSource(param1:IFlexDisplayObject, param2:MouseEvent) : DragSource
      {
         return new DragSource();
      }
      
      protected function updateConsoleDragSource() : void
      {
         Console.getConsole().currDragSource = this._dragSource;
      }
      
      protected function clearDrag() : void
      {
         this._dragProxy = null;
         this._dragSource = null;
         this._isMouseDown = false;
      }
      
      protected function allowPublish() : Boolean
      {
         if(UtilSite.siteId == UtilSite.SKOLETUBE)
         {
            return Console.getConsole().groupController.isTeacher;
         }
         return false;
      }
      
      protected function mouseDownHandler(param1:MouseEvent) : void
      {
         if(this.shouldStartDrag(param1))
         {
            this._dragProxy = this.createDragProxy();
            this._dragSource = this.createDragSource(this._dragProxy,param1);
            this._isMouseDown = true;
         }
      }
      
      protected function mouseMoveHandler(param1:MouseEvent) : void
      {
         if(this._isMouseDown && this._dragSource)
         {
            DragManager.doDrag(this,this._dragSource,param1,this._dragProxy,this._dragProxy.width * 0.5 * this._dragProxy.scaleX - param1.localX,this._dragProxy.height * 0.5 * this._dragProxy.scaleY - param1.localY,this._dragProxyImageAlpha);
         }
      }
      
      protected function mouseUpHandler(param1:MouseEvent) : void
      {
         if(this._isMouseDown)
         {
            this.updateConsoleDragSource();
            this.clearDrag();
         }
      }
      
      protected function mouseOutHandler(param1:MouseEvent) : void
      {
         this.clearDrag();
      }
      
      public function ___ThumbRendererBase_ItemRenderer1_creationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      private function _ThumbRendererBase_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = _toolTipContent;
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"this.toolTip");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      protected function get _toolTipContent() : String
      {
         return this._1222364469_toolTipContent;
      }
      
      protected function set _toolTipContent(param1:String) : void
      {
         var _loc2_:Object = this._1222364469_toolTipContent;
         if(_loc2_ !== param1)
         {
            this._1222364469_toolTipContent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_toolTipContent",_loc2_,param1));
            }
         }
      }
   }
}
