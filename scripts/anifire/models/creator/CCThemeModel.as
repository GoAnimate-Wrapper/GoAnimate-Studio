package anifire.models.creator
{
	import anifire.constant.CcLibConstant;
	import anifire.models.AssetModel;
	import anifire.util.UtilNetwork;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.URLLoader;
	
	public class CCThemeModel extends EventDispatcher
	{
		 
		
		public var runwayMode:Boolean;
		
		public var themeId:String;
		
		public var defaultBodyShape:CCBodyShapeModel;
		
		public var bodyShapes:Object;
		
		public var components:Object;
		
		public var faces:Object;
		
		public var props:Object;
		
		public var backgrounds:Object;
		
		public var sounds:Object;
		
		public var completed:Boolean = false;
		
		protected var loader:URLLoader;
		
		private var _actionModels:Object;
		
		public function CCThemeModel(param1:String)
		{
			super();
			this.themeId = param1;
			this.bodyShapes = {};
			this.faces = {};
			this.components = {};
			this._actionModels = {};
			this.props = {};
			this.backgrounds = {};
			this.sounds = {};
		}
		
		public function load() : void
		{
			if(!this.loader)
			{
				this.loader = new URLLoader();
				this.loader.addEventListener(Event.COMPLETE,this.onLoaderComplete);
				this.loader.load(UtilNetwork.getGetCcThemeRequest(this.themeId));
			}
		}
		
		protected function onLoaderComplete(param1:Event) : void
		{
			this.loader.removeEventListener(Event.COMPLETE,this.onLoaderComplete);
			this.parse(XML(this.loader.data));
		}
		
		public function parseThemeXML(param1:XML) : void
		{
			var _loc4_:XML = null;
			var _loc6_:AssetModel = null;
			var _loc7_:String = null;
			var _loc2_:XMLList = param1.children();
			var _loc3_:int = _loc2_.length();
			var _loc5_:int = 0;
			while(_loc5_ < _loc3_)
			{
				_loc4_ = _loc2_[_loc5_];
				_loc6_ = new AssetModel();
				_loc6_.parse(_loc4_);
				_loc7_ = _loc4_.localName() as String;
				switch(_loc7_)
				{
					case "prop":
						this.props[_loc6_.id] = _loc6_;
						break;
					case "background":
						this.backgrounds[_loc6_.id] = _loc6_;
						break;
					case "sound":
						this.sounds[_loc6_.id] = _loc6_;
				}
				_loc5_++;
			}
		}
		
		public function parse(param1:XML) : void
		{
			var _loc4_:XML = null;
			var _loc6_:String = null;
			var _loc7_:CCFaceModel = null;
			var _loc8_:CCBodyShapeModel = null;
			var _loc9_:CCComponentModel = null;
			var _loc2_:XMLList = param1.children();
			var _loc3_:int = _loc2_.length();
			var _loc5_:int = 0;
			while(_loc5_ < _loc3_)
			{
				_loc4_ = _loc2_[_loc5_];
				_loc6_ = _loc4_.localName() as String;
				switch(_loc6_)
				{
					case "facial":
						_loc7_ = new CCFaceModel();
						_loc7_.parse(_loc4_);
						this.faces[_loc7_.id] = _loc7_;
						break;
					case "bodyshape":
						_loc8_ = new CCBodyShapeModel(this);
						_loc8_.parse(_loc4_);
						if(!this.defaultBodyShape)
						{
							this.defaultBodyShape = _loc8_;
						}
						this.bodyShapes[_loc8_.bodyShapeId] = _loc8_;
						break;
					case "component":
						_loc9_ = new CCComponentModel(this.runwayMode);
						_loc9_.parse(_loc4_);
						this.storeSharedComponent(_loc9_);
				}
				_loc5_++;
			}
			this.completed = true;
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
		public function getActions(param1:String) : Object
		{
			var _loc2_:CCBodyShapeModel = this.bodyShapes[param1];
			if(_loc2_)
			{
				return _loc2_.actions;
			}
			return null;
		}
		
		protected function componentUniqueId(param1:String, param2:String) : String
		{
			return param1 + ":" + param2;
		}
		
		protected function storeSharedComponent(param1:CCComponentModel) : void
		{
			var _loc2_:String = this.componentUniqueId(param1.type,param1.id);
			this.components[_loc2_] = param1;
		}
		
		protected function getSharedComponent(param1:String, param2:String) : CCComponentModel
		{
			var _loc3_:String = this.componentUniqueId(param1,param2);
			return this.components[_loc3_];
		}
		
		protected function getComponent(param1:CCBodyShapeModel, param2:String, param3:String) : CCComponentModel
		{
			var _loc4_:CCComponentModel = param1.getComponent(param2,param3);
			if(!_loc4_)
			{
				_loc4_ = this.getSharedComponent(param2,param3);
			}
			return _loc4_;
		}
		
		public function createCharacterActionModel(param1:CCBodyModel, param2:CCActionModel) : CCCharacterActionModel
		{
			var _loc6_:String = null;
			var _loc8_:* = null;
			var _loc9_:Object = null;
			var _loc10_:* = null;
			var _loc11_:Object = null;
			var _loc12_:* = null;
			var _loc13_:Object = null;
			var _loc14_:CCCharacterActionModel = null;
			var _loc15_:CCBodyComponentModel = null;
			var _loc16_:CCComponentModel = null;
			var _loc17_:String = null;
			var _loc18_:CCComponentModel = null;
			var _loc19_:Object = null;
			var _loc20_:* = null;
			var _loc21_:String = null;
			var _loc22_:CCLibraryModel = null;
			var _loc3_:CCBodyShapeModel = this.bodyShapes[param1.bodyShapeId];
			if(!this.runwayMode)
			{
				_loc13_ = this._actionModels[param1.assetId];
				if(_loc13_)
				{
					_loc14_ = _loc13_[_loc6_];
					if(_loc14_)
					{
						return _loc14_;
					}
				}
			}
			var _loc4_:CCBodyShapeModel = this.bodyShapes[param1.bodyShapeId];
			if(!_loc4_)
			{
				return null;
			}
			var _loc5_:CCCharacterActionModel = new CCCharacterActionModel();
			_loc5_.actionModel = param2;
			_loc5_.enabled = param2.enabled;
			_loc6_ = param2.shortId;
			var _loc7_:Object = param2.componentStates;
			for(_loc8_ in _loc7_)
			{
				if(_loc8_ == "freeaction")
				{
					_loc16_ = this.getComponent(_loc3_,"freeaction",_loc6_);
					if(_loc16_)
					{
						_loc15_ = param1.getComponentId("freeaction") as CCBodyComponentModel;
						_loc5_.addComponent(_loc15_,_loc6_ + ".swf",this.themeId + "/freeaction/" + _loc15_.folder + "/" + _loc6_ + ".swf");
						_loc5_.freeactionFolderName = _loc15_.folder;
					}
				}
				else if(CcLibConstant.ALL_MULTIPLE_COMPONENT_TYPES.indexOf(_loc8_) > -1)
				{
					_loc19_ = param1.getComponentId(_loc8_);
					for(_loc20_ in _loc19_)
					{
						_loc15_ = _loc19_[_loc20_] as CCBodyComponentModel;
						if(_loc15_)
						{
							_loc17_ = _loc15_.component_id;
							_loc18_ = this.getComponent(_loc3_,_loc8_,_loc17_);
							if(_loc18_)
							{
								_loc5_.addComponent(_loc15_,_loc18_.getFilenameByState(_loc7_[_loc8_]),this.themeId + "/" + _loc18_.getPathByState(_loc7_[_loc8_]));
							}
						}
					}
				}
				else
				{
					_loc15_ = param1.getComponentId(_loc8_) as CCBodyComponentModel;
					if(_loc15_)
					{
						_loc17_ = _loc15_.component_id;
						_loc18_ = this.getComponent(_loc3_,_loc8_,_loc17_);
						if(_loc18_)
						{
							_loc5_.addComponent(_loc15_,_loc18_.getFilenameByState(_loc7_[_loc8_]),this.themeId + "/" + _loc18_.getPathByState(_loc7_[_loc8_]));
						}
					}
				}
			}
			_loc9_ = param1.libraries;
			for(_loc10_ in _loc9_)
			{
				_loc21_ = param1.getLibraryId(_loc10_);
				_loc22_ = _loc3_.getLibrary(_loc10_,_loc21_);
				if(_loc22_)
				{
					_loc5_.addLibrary(_loc10_,this.themeId + "/" + _loc22_.getPath());
				}
			}
			_loc11_ = param1.colors;
			for(_loc12_ in _loc11_)
			{
				_loc5_.addColor(_loc12_,_loc11_[_loc12_]);
			}
			_loc5_.bodyScale.scalex = param1.bodyScale.scalex;
			_loc5_.bodyScale.scaley = param1.bodyScale.scalex;
			_loc5_.headScale.scalex = param1.headScale.scalex;
			_loc5_.headScale.scaley = param1.headScale.scaley;
			_loc5_.headPos.dx = param1.headPos.dx;
			_loc5_.headPos.dy = param1.headPos.dy;
			_loc5_.version = param1.version;
			if(!_loc5_.propXML)
			{
				_loc5_.propXML = param2.propXML;
			}
			_loc5_.themeId = this.themeId;
			_loc5_.defaultActionId = _loc3_.defaultActionId;
			return _loc5_;
		}
		
		protected function getCache(param1:String, param2:String) : CCCharacterActionModel
		{
			var _loc3_:Object = this._actionModels[param1];
			if(_loc3_)
			{
				return _loc3_[param2];
			}
			return null;
		}
		
		protected function putCache(param1:String, param2:String, param3:CCCharacterActionModel) : void
		{
			if(!this._actionModels[param1])
			{
				this._actionModels[param1] = {};
			}
			this._actionModels[param1][param2] = param3;
		}
		
		public function getCharacterActionModel(param1:CCBodyModel, param2:String) : CCCharacterActionModel
		{
			var _loc3_:CCCharacterActionModel = this.getCache(param1.assetId,param2);
			if(_loc3_)
			{
				return _loc3_;
			}
			var _loc4_:CCBodyShapeModel = this.bodyShapes[param1.bodyShapeId];
			if(!_loc4_)
			{
				return null;
			}
			var _loc5_:CCActionModel = _loc4_.actions[param2];
			if(_loc5_)
			{
				_loc3_ = this.createCharacterActionModel(param1,_loc5_);
			}
			this.putCache(param1.assetId,param2,_loc3_);
			return _loc3_;
		}
		
		public function getCharacterFacialModel(param1:CCBodyModel, param2:String) : CCCharacterActionModel
		{
			var _loc6_:Object = null;
			var _loc7_:* = null;
			var _loc8_:Object = null;
			var _loc9_:* = null;
			var _loc10_:CCBodyComponentModel = null;
			var _loc11_:String = null;
			var _loc12_:CCComponentModel = null;
			var _loc13_:Object = null;
			var _loc14_:* = null;
			var _loc3_:CCCharacterActionModel = this.getCache(param1.assetId,param2);
			if(_loc3_)
			{
				return _loc3_;
			}
			var _loc4_:CCBodyShapeModel = this.bodyShapes[param1.bodyShapeId];
			if(!_loc4_)
			{
				return null;
			}
			_loc3_ = new CCCharacterActionModel();
			param2 = param2.split(".")[0];
			var _loc5_:CCFaceModel = this.faces[param2];
			if(_loc5_)
			{
				_loc6_ = _loc5_.componentStates;
				for(_loc7_ in _loc6_)
				{
					if(CcLibConstant.ALL_MULTIPLE_COMPONENT_TYPES.indexOf(_loc7_) > -1)
					{
						_loc13_ = param1.getComponentId(_loc7_);
						for(_loc14_ in _loc13_)
						{
							_loc10_ = _loc13_[_loc14_] as CCBodyComponentModel;
							if(_loc10_)
							{
								_loc11_ = _loc10_.component_id;
								_loc12_ = this.getComponent(_loc4_,_loc7_,_loc11_);
								if(_loc12_)
								{
									_loc3_.addComponent(_loc10_,_loc12_.getFilenameByState(_loc6_[_loc7_]),this.themeId + "/" + _loc12_.getPathByState(_loc6_[_loc7_]));
								}
							}
						}
					}
					else
					{
						_loc10_ = param1.getComponentId(_loc7_) as CCBodyComponentModel;
						if(_loc10_)
						{
							_loc11_ = _loc10_.component_id;
							_loc12_ = this.getComponent(_loc4_,_loc7_,_loc11_);
							if(_loc12_)
							{
								_loc3_.addComponent(_loc10_,_loc12_.getFilenameByState(_loc6_[_loc7_]),this.themeId + "/" + _loc12_.getPathByState(_loc6_[_loc7_]));
							}
						}
					}
				}
				_loc8_ = param1.colors;
				for(_loc9_ in _loc8_)
				{
					_loc3_.addColor(_loc9_,_loc8_[_loc9_]);
				}
				_loc3_.version = param1.version;
				_loc3_.themeId = this.themeId;
			}
			this.putCache(param1.assetId,param2,_loc3_);
			return _loc3_;
		}
		
		public function getCharacterDefaultActionId(param1:String) : String
		{
			var _loc2_:CCBodyShapeModel = this.bodyShapes[param1];
			return _loc2_.defaultActionId;
		}
		
		public function getCharacterDefaultMotionId(param1:String) : String
		{
			var _loc2_:CCBodyShapeModel = this.bodyShapes[param1];
			return _loc2_.defaultMotionId;
		}
		
		public function getPropModel(param1:String) : AssetModel
		{
			return this.props[param1];
		}
		
		public function getBackgroundModel(param1:String) : AssetModel
		{
			return this.backgrounds[param1];
		}
		
		public function getSoundModel(param1:String) : AssetModel
		{
			return this.sounds[param1];
		}
	}
}
