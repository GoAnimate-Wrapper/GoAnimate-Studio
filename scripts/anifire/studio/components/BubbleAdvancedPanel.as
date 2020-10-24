package anifire.studio.components
{
	import anifire.util.UtilDict;
	import flash.utils.getDefinitionByName;
	import mx.binding.Binding;
	import mx.binding.BindingManager;
	import mx.binding.IBindingClient;
	import mx.binding.IWatcherSetupUtil2;
	import mx.core.DeferredInstanceFromFunction;
	import mx.core.IFlexModuleFactory;
	import mx.core.mx_internal;
	import mx.events.PropertyChangeEvent;
	import spark.components.Form;
	import spark.components.FormItem;
	import spark.components.VGroup;
	
	use namespace mx_internal;
	
	public class BubbleAdvancedPanel extends spark.components.NavigatorContent implements IBindingClient
	{
		
		private static var _watcherSetupUtil:IWatcherSetupUtil2;
		 
		
		public var _BubbleAdvancedPanel_FormItem1:FormItem;
		
		public var _BubbleAdvancedPanel_HyperLinkPanel1:HyperLinkPanel;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		protected var _target:Object;
		
		mx_internal var _bindings:Array;
		
		mx_internal var _watchers:Array;
		
		mx_internal var _bindingsByDestination:Object;
		
		mx_internal var _bindingsBeginWithWord:Object;
		
		public function BubbleAdvancedPanel()
		{
			var target:Object = null;
			var watcherSetupUtilClass:Object = null;
			this._bindings = [];
			this._watchers = [];
			this._bindingsByDestination = {};
			this._bindingsBeginWithWord = {};
			super();
			mx_internal::_document = this;
			var bindings:Array = this._BubbleAdvancedPanel_bindingsSetup();
			var watchers:Array = [];
			target = this;
			if(_watcherSetupUtil == null)
			{
				watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_BubbleAdvancedPanelWatcherSetupUtil");
				watcherSetupUtilClass["init"](null);
			}
			_watcherSetupUtil.setup(this,function(param1:String):*
			{
				return target[param1];
			},function(param1:String):*
			{
				return BubbleAdvancedPanel[param1];
			},bindings,watchers);
			mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
			mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
			this.percentWidth = 100;
			this.percentHeight = 100;
			this.mxmlContentFactory = new DeferredInstanceFromFunction(this._BubbleAdvancedPanel_Array1_c);
			var i:uint = 0;
			while(i < bindings.length)
			{
				Binding(bindings[i]).execute();
				i++;
			}
		}
		
		public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
		{
			BubbleAdvancedPanel._watcherSetupUtil = param1;
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
		public function get target() : Object
		{
			return this._target;
		}
		
		private function set _880905839target(param1:Object) : void
		{
			this._target = param1;
			createDeferredContent();
		}
		
		private function _BubbleAdvancedPanel_Array1_c() : Array
		{
			var _loc1_:Array = [this._BubbleAdvancedPanel_VGroup1_c()];
			return _loc1_;
		}
		
		private function _BubbleAdvancedPanel_VGroup1_c() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.percentWidth = 100;
			_loc1_.paddingLeft = 14;
			_loc1_.paddingRight = 14;
			_loc1_.paddingTop = 14;
			_loc1_.paddingBottom = 14;
			_loc1_.mxmlContent = [this._BubbleAdvancedPanel_Form1_c()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _BubbleAdvancedPanel_Form1_c() : Form
		{
			var _loc1_:Form = new Form();
			_loc1_.styleName = "compact";
			_loc1_.percentWidth = 100;
			_loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._BubbleAdvancedPanel_Array3_c);
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _BubbleAdvancedPanel_Array3_c() : Array
		{
			var _loc1_:Array = [this._BubbleAdvancedPanel_FormItem1_i()];
			return _loc1_;
		}
		
		private function _BubbleAdvancedPanel_FormItem1_i() : FormItem
		{
			var _loc1_:FormItem = new FormItem();
			_loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._BubbleAdvancedPanel_Array4_c);
			_loc1_.id = "_BubbleAdvancedPanel_FormItem1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._BubbleAdvancedPanel_FormItem1 = _loc1_;
			BindingManager.executeBindings(this,"_BubbleAdvancedPanel_FormItem1",this._BubbleAdvancedPanel_FormItem1);
			return _loc1_;
		}
		
		private function _BubbleAdvancedPanel_Array4_c() : Array
		{
			var _loc1_:Array = [this._BubbleAdvancedPanel_HyperLinkPanel1_i()];
			return _loc1_;
		}
		
		private function _BubbleAdvancedPanel_HyperLinkPanel1_i() : HyperLinkPanel
		{
			var _loc1_:HyperLinkPanel = new HyperLinkPanel();
			_loc1_.percentWidth = 100;
			_loc1_.id = "_BubbleAdvancedPanel_HyperLinkPanel1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._BubbleAdvancedPanel_HyperLinkPanel1 = _loc1_;
			BindingManager.executeBindings(this,"_BubbleAdvancedPanel_HyperLinkPanel1",this._BubbleAdvancedPanel_HyperLinkPanel1);
			return _loc1_;
		}
		
		private function _BubbleAdvancedPanel_bindingsSetup() : Array
		{
			var result:Array = [];
			result[0] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Add link");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_BubbleAdvancedPanel_FormItem1.label");
			result[1] = new Binding(this,null,null,"_BubbleAdvancedPanel_HyperLinkPanel1.target","target");
			return result;
		}
		
		public function set target(param1:Object) : void
		{
			var _loc2_:Object = this.target;
			if(_loc2_ !== param1)
			{
				this._880905839target = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"target",_loc2_,param1));
				}
			}
		}
	}
}
