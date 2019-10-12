package anifire.studio.components
{
   import anifire.studio.skins.WidgetDataTextInputSkin;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import spark.components.TextInput;
   import spark.components.gridClasses.GridItemEditor;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class WidgetGridValueEditor extends GridItemEditor implements IBindingClient
   {
      
      private static const SELECTED_BG_COLOR:uint = 16772042;
      
      private static const SELECTED_BORDER_COLOR:uint = 16762237;
      
      private static const TEXT_COLOR:uint = 5265775;
      
      private static const FONT_SIZE:Number = 10;
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _WidgetGridValueEditor_SolidColor1:SolidColor;
      
      public var _WidgetGridValueEditor_SolidColorStroke1:SolidColorStroke;
      
      private var _1058056547textInput:TextInput;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _oldValue:String;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function WidgetGridValueEditor()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._WidgetGridValueEditor_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_WidgetGridValueEditorWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return WidgetGridValueEditor[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._WidgetGridValueEditor_Rect1_c(),this._WidgetGridValueEditor_TextInput1_i()];
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         WidgetGridValueEditor._watcherSetupUtil = param1;
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
      
      override public function setFocus() : void
      {
         this.textInput.setFocus();
      }
      
      override public function prepare() : void
      {
         super.prepare();
         if(this.data is WidgetDataGridItem)
         {
            this.textInput.text = String(WidgetDataGridItem(this.data).values[this.columnIndex - 1]);
            this._oldValue = this.textInput.text;
         }
      }
      
      override public function save() : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc1_:ChartDataGrid = dataGrid as ChartDataGrid;
         if(_loc1_)
         {
            _loc1_.contentChanged = false;
         }
         if(this._oldValue == this.textInput.text)
         {
            return true;
         }
         if(this.data is WidgetDataGridItem)
         {
            _loc2_ = this.columnIndex - 1;
            _loc3_ = Number(this.textInput.text);
            if(isNaN(_loc3_))
            {
               this.textInput.text = this._oldValue;
               return true;
            }
            WidgetDataGridItem(this.data).values[_loc2_] = Number(this.textInput.text);
            if(_loc1_)
            {
               _loc1_.contentChanged = true;
            }
         }
         return true;
      }
      
      private function _WidgetGridValueEditor_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.right = 1;
         _loc1_.fill = this._WidgetGridValueEditor_SolidColor1_i();
         _loc1_.stroke = this._WidgetGridValueEditor_SolidColorStroke1_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _WidgetGridValueEditor_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         this._WidgetGridValueEditor_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_WidgetGridValueEditor_SolidColor1",this._WidgetGridValueEditor_SolidColor1);
         return _loc1_;
      }
      
      private function _WidgetGridValueEditor_SolidColorStroke1_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         this._WidgetGridValueEditor_SolidColorStroke1 = _loc1_;
         BindingManager.executeBindings(this,"_WidgetGridValueEditor_SolidColorStroke1",this._WidgetGridValueEditor_SolidColorStroke1);
         return _loc1_;
      }
      
      private function _WidgetGridValueEditor_TextInput1_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.left = 5;
         _loc1_.right = 5;
         _loc1_.verticalCenter = 0;
         _loc1_.restrict = "0-9.\\-";
         _loc1_.setStyle("textAlign","right");
         _loc1_.setStyle("contentBackgroundColor",16772042);
         _loc1_.setStyle("borderVisible",false);
         _loc1_.setStyle("skinClass",WidgetDataTextInputSkin);
         _loc1_.id = "textInput";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.textInput = _loc1_;
         BindingManager.executeBindings(this,"textInput",this.textInput);
         return _loc1_;
      }
      
      private function _WidgetGridValueEditor_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():uint
         {
            return SELECTED_BG_COLOR;
         },null,"_WidgetGridValueEditor_SolidColor1.color");
         result[1] = new Binding(this,function():uint
         {
            return SELECTED_BORDER_COLOR;
         },null,"_WidgetGridValueEditor_SolidColorStroke1.color");
         result[2] = new Binding(this,function():Number
         {
            return FONT_SIZE;
         },function(param1:Number):void
         {
            textInput.setStyle("fontSize",param1);
         },"textInput.fontSize");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get textInput() : TextInput
      {
         return this._1058056547textInput;
      }
      
      public function set textInput(param1:TextInput) : void
      {
         var _loc2_:Object = this._1058056547textInput;
         if(_loc2_ !== param1)
         {
            this._1058056547textInput = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textInput",_loc2_,param1));
            }
         }
      }
   }
}
