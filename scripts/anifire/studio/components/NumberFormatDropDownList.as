package anifire.studio.components
{
   import anifire.studio.skins.NumberFormatDropDownListSkin;
   import anifire.util.UtilDict;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.collections.ArrayCollection;
   import mx.core.ClassFactory;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import spark.events.IndexChangeEvent;
   
   use namespace mx_internal;
   
   public class NumberFormatDropDownList extends spark.components.DropDownList implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function NumberFormatDropDownList()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         var bindings:Array = this._NumberFormatDropDownList_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_NumberFormatDropDownListWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return NumberFormatDropDownList[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.itemRenderer = this._NumberFormatDropDownList_ClassFactory1_c();
         this.requireSelection = true;
         this.useVirtualLayout = false;
         this.labelFunction = this.numberFormatLabel;
         this.dataProvider = this._NumberFormatDropDownList_ArrayCollection1_c();
         this.addEventListener("changing",this.___NumberFormatDropDownList_DropDownList1_changing);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         NumberFormatDropDownList._watcherSetupUtil = param1;
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
            this.skinClass = NumberFormatDropDownListSkin;
         };
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      protected function numberFormatLabel(param1:Object) : String
      {
         var _loc2_:String = null;
         var _loc3_:int = int(param1);
         switch(_loc3_)
         {
            case 0:
            default:
               _loc2_ = UtilDict.toDisplay("go","No Formatting");
               break;
            case 1:
               _loc2_ = "10,000.00";
               break;
            case 2:
               _loc2_ = "10.000,00";
               break;
            case 3:
               _loc2_ = "10 000,00";
         }
         return _loc2_;
      }
      
      protected function changingHandler(param1:IndexChangeEvent) : void
      {
         if(selectedItem == -1)
         {
            param1.preventDefault();
         }
      }
      
      private function _NumberFormatDropDownList_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = NumberFormatRenderer;
         return _loc1_;
      }
      
      private function _NumberFormatDropDownList_ArrayCollection1_c() : ArrayCollection
      {
         var _loc1_:ArrayCollection = new ArrayCollection();
         _loc1_.source = [0,-1,1,2,3];
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      public function ___NumberFormatDropDownList_DropDownList1_changing(param1:IndexChangeEvent) : void
      {
         this.changingHandler(param1);
      }
      
      private function _NumberFormatDropDownList_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Number Formatting");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"this.toolTip");
         return result;
      }
   }
}
