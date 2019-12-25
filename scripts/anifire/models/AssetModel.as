package anifire.models
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import mx.events.PropertyChangeEvent;
	
	public class AssetModel implements IEventDispatcher
	{
		 
		
		private var _3355id:String;
		
		private var _3373707name:String;
		
		private var _1298848381enable:Boolean;
		
		private var _2074885617encAssetId:String;
		
		private var _1073584312signature:String;
		
		private var _bindingEventDispatcher:EventDispatcher;
		
		public function AssetModel()
		{
			this._bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
			super();
		}
		
		public function parse(param1:XML) : void
		{
			this.id = param1.@id;
			this.name = param1.@name;
			this.enable = param1.@enable != "N";
			this.encAssetId = param1.@enc_asset_id;
			this.signature = param1.@signature;
		}
		
		[Bindable(event="propertyChange")]
		public function get id() : String
		{
			return this._3355id;
		}
		
		public function set id(param1:String) : void
		{
			var _loc2_:Object = this._3355id;
			if(_loc2_ !== param1)
			{
				this._3355id = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"id",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get name() : String
		{
			return this._3373707name;
		}
		
		public function set name(param1:String) : void
		{
			var _loc2_:Object = this._3373707name;
			if(_loc2_ !== param1)
			{
				this._3373707name = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"name",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get enable() : Boolean
		{
			return this._1298848381enable;
		}
		
		public function set enable(param1:Boolean) : void
		{
			var _loc2_:Object = this._1298848381enable;
			if(_loc2_ !== param1)
			{
				this._1298848381enable = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"enable",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get encAssetId() : String
		{
			return this._2074885617encAssetId;
		}
		
		public function set encAssetId(param1:String) : void
		{
			var _loc2_:Object = this._2074885617encAssetId;
			if(_loc2_ !== param1)
			{
				this._2074885617encAssetId = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"encAssetId",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get signature() : String
		{
			return this._1073584312signature;
		}
		
		public function set signature(param1:String) : void
		{
			var _loc2_:Object = this._1073584312signature;
			if(_loc2_ !== param1)
			{
				this._1073584312signature = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"signature",_loc2_,param1));
				}
			}
		}
		
		public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
		{
			this._bindingEventDispatcher.addEventListener(param1,param2,param3,param4,param5);
		}
		
		public function dispatchEvent(param1:Event) : Boolean
		{
			return this._bindingEventDispatcher.dispatchEvent(param1);
		}
		
		public function hasEventListener(param1:String) : Boolean
		{
			return this._bindingEventDispatcher.hasEventListener(param1);
		}
		
		public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
		{
			this._bindingEventDispatcher.removeEventListener(param1,param2,param3);
		}
		
		public function willTrigger(param1:String) : Boolean
		{
			return this._bindingEventDispatcher.willTrigger(param1);
		}
	}
}
