package caurina.transitions
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.utils.getTimer;
   
   public class Tweener
   {
      
      private static var __tweener_controller__:MovieClip;
      
      private static var _engineExists:Boolean = false;
      
      private static var _inited:Boolean = false;
      
      private static var _currentTime:Number;
      
      private static var _tweenList:Array;
      
      private static var _timeScale:Number = 1;
      
      private static var _transitionList:Object;
      
      private static var _specialPropertyList:Object;
      
      private static var _specialPropertyModifierList:Object;
      
      private static var _specialPropertySplitterList:Object;
       
      
      public function Tweener()
      {
         super();
      }
      
      public static function addTween(param1:Object = null, param2:Object = null) : Boolean
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:* = null;
         var _loc8_:String = null;
         var _loc15_:Function = null;
         var _loc16_:Object = null;
         var _loc17_:TweenListObj = null;
         var _loc18_:Number = NaN;
         var _loc19_:Array = null;
         var _loc20_:Array = null;
         var _loc21_:String = null;
         if(arguments.length < 2 || arguments[0] == undefined)
         {
            return false;
         }
         var _loc4_:Array = new Array();
         if(arguments[0] is Array)
         {
            _loc5_ = 0;
            while(_loc5_ < arguments[0].length)
            {
               _loc4_.push(arguments[0][_loc5_]);
               _loc5_++;
            }
         }
         else
         {
            _loc5_ = 0;
            while(_loc5_ < arguments.length - 1)
            {
               _loc4_.push(arguments[_loc5_]);
               _loc5_++;
            }
         }
         var _loc9_:Object = TweenListObj.makePropertiesChain(arguments[arguments.length - 1]);
         if(!_inited)
         {
            init();
         }
         if(!_engineExists || !Boolean(__tweener_controller__))
         {
            startEngine();
         }
         var _loc10_:Number = !!isNaN(_loc9_.time)?Number(0):Number(_loc9_.time);
         var _loc11_:Number = !!isNaN(_loc9_.delay)?Number(0):Number(_loc9_.delay);
         var _loc12_:Array = new Array();
         var _loc13_:Object = {
            "time":true,
            "delay":true,
            "useFrames":true,
            "skipUpdates":true,
            "transition":true,
            "onStart":true,
            "onUpdate":true,
            "onComplete":true,
            "onOverwrite":true,
            "rounded":true,
            "onStartParams":true,
            "onUpdateParams":true,
            "onCompleteParams":true,
            "onOverwriteParams":true
         };
         var _loc14_:Object = new Object();
         for(_loc7_ in _loc9_)
         {
            if(!_loc13_[_loc7_])
            {
               if(_specialPropertySplitterList[_loc7_])
               {
                  _loc19_ = _specialPropertySplitterList[_loc7_].splitValues(_loc9_[_loc7_],_specialPropertySplitterList[_loc7_].parameters);
                  _loc5_ = 0;
                  while(_loc5_ < _loc19_.length)
                  {
                     _loc12_[_loc19_[_loc5_].name] = {
                        "valueStart":undefined,
                        "valueComplete":_loc19_[_loc5_].value
                     };
                     _loc5_++;
                  }
               }
               else if(_specialPropertyModifierList[_loc7_] != undefined)
               {
                  _loc20_ = _specialPropertyModifierList[_loc7_].modifyValues(_loc9_[_loc7_]);
                  _loc5_ = 0;
                  while(_loc5_ < _loc20_.length)
                  {
                     _loc14_[_loc20_[_loc5_].name] = {
                        "modifierParameters":_loc20_[_loc5_].parameters,
                        "modifierFunction":_specialPropertyModifierList[_loc7_].getValue
                     };
                     _loc5_++;
                  }
               }
               else
               {
                  _loc12_[_loc7_] = {
                     "valueStart":undefined,
                     "valueComplete":_loc9_[_loc7_]
                  };
               }
            }
         }
         for(_loc7_ in _loc14_)
         {
            if(_loc12_[_loc7_] != undefined)
            {
               _loc12_[_loc7_].modifierParameters = _loc14_[_loc7_].modifierParameters;
               _loc12_[_loc7_].modifierFunction = _loc14_[_loc7_].modifierFunction;
            }
         }
         if(typeof _loc9_.transition == "string")
         {
            _loc21_ = _loc9_.transition.toLowerCase();
            _loc15_ = _transitionList[_loc21_];
         }
         else
         {
            _loc15_ = _loc9_.transition;
         }
         if(!Boolean(_loc15_))
         {
            _loc15_ = _transitionList["easeoutexpo"];
         }
         _loc5_ = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc16_ = new Object();
            for(_loc7_ in _loc12_)
            {
               _loc16_[_loc7_] = new PropertyInfoObj(_loc12_[_loc7_].valueStart,_loc12_[_loc7_].valueComplete,_loc12_[_loc7_].modifierFunction,_loc12_[_loc7_].modifierParameters);
            }
            _loc17_ = new TweenListObj(_loc4_[_loc5_],_currentTime + _loc11_ * 1000 / _timeScale,_currentTime + (_loc11_ * 1000 + _loc10_ * 1000) / _timeScale,_loc9_.useFrames == true,_loc15_);
            _loc17_.properties = _loc16_;
            _loc17_.onStart = _loc9_.onStart;
            _loc17_.onUpdate = _loc9_.onUpdate;
            _loc17_.onComplete = _loc9_.onComplete;
            _loc17_.onOverwrite = _loc9_.onOverwrite;
            _loc17_.onError = _loc9_.onError;
            _loc17_.onStartParams = _loc9_.onStartParams;
            _loc17_.onUpdateParams = _loc9_.onUpdateParams;
            _loc17_.onCompleteParams = _loc9_.onCompleteParams;
            _loc17_.onOverwriteParams = _loc9_.onOverwriteParams;
            _loc17_.rounded = _loc9_.rounded;
            _loc17_.skipUpdates = _loc9_.skipUpdates;
            removeTweensByTime(_loc17_.scope,_loc17_.properties,_loc17_.timeStart,_loc17_.timeComplete);
            _tweenList.push(_loc17_);
            if(_loc10_ == 0 && _loc11_ == 0)
            {
               _loc18_ = _tweenList.length - 1;
               updateTweenByIndex(_loc18_);
               removeTweenByIndex(_loc18_);
            }
            _loc5_++;
         }
         return true;
      }
      
      public static function addCaller(param1:Object = null, param2:Object = null) : Boolean
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc10_:Function = null;
         var _loc11_:TweenListObj = null;
         var _loc12_:Number = NaN;
         var _loc13_:String = null;
         if(arguments.length < 2 || arguments[0] == undefined)
         {
            return false;
         }
         var _loc4_:Array = new Array();
         if(arguments[0] is Array)
         {
            _loc5_ = 0;
            while(_loc5_ < arguments[0].length)
            {
               _loc4_.push(arguments[0][_loc5_]);
               _loc5_++;
            }
         }
         else
         {
            _loc5_ = 0;
            while(_loc5_ < arguments.length - 1)
            {
               _loc4_.push(arguments[_loc5_]);
               _loc5_++;
            }
         }
         var _loc7_:Object = arguments[arguments.length - 1];
         if(!_inited)
         {
            init();
         }
         if(!_engineExists || !Boolean(__tweener_controller__))
         {
            startEngine();
         }
         var _loc8_:Number = !!isNaN(_loc7_.time)?Number(0):Number(_loc7_.time);
         var _loc9_:Number = !!isNaN(_loc7_.delay)?Number(0):Number(_loc7_.delay);
         if(typeof _loc7_.transition == "string")
         {
            _loc13_ = _loc7_.transition.toLowerCase();
            _loc10_ = _transitionList[_loc13_];
         }
         else
         {
            _loc10_ = _loc7_.transition;
         }
         if(!Boolean(_loc10_))
         {
            _loc10_ = _transitionList["easeoutexpo"];
         }
         _loc5_ = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc11_ = new TweenListObj(_loc4_[_loc5_],_currentTime + _loc9_ * 1000 / _timeScale,_currentTime + (_loc9_ * 1000 + _loc8_ * 1000) / _timeScale,_loc7_.useFrames == true,_loc10_);
            _loc11_.properties = null;
            _loc11_.onStart = _loc7_.onStart;
            _loc11_.onUpdate = _loc7_.onUpdate;
            _loc11_.onComplete = _loc7_.onComplete;
            _loc11_.onOverwrite = _loc7_.onOverwrite;
            _loc11_.onStartParams = _loc7_.onStartParams;
            _loc11_.onUpdateParams = _loc7_.onUpdateParams;
            _loc11_.onCompleteParams = _loc7_.onCompleteParams;
            _loc11_.onOverwriteParams = _loc7_.onOverwriteParams;
            _loc11_.isCaller = true;
            _loc11_.count = _loc7_.count;
            _loc11_.waitFrames = _loc7_.waitFrames;
            _tweenList.push(_loc11_);
            if(_loc8_ == 0 && _loc9_ == 0)
            {
               _loc12_ = _tweenList.length - 1;
               updateTweenByIndex(_loc12_);
               removeTweenByIndex(_loc12_);
            }
            _loc5_++;
         }
         return true;
      }
      
      public static function removeTweensByTime(param1:Object, param2:Object, param3:Number, param4:Number) : Boolean
      {
         var removedLocally:Boolean = false;
         var i:uint = 0;
         var pName:String = null;
         var p_scope:Object = param1;
         var p_properties:Object = param2;
         var p_timeStart:Number = param3;
         var p_timeComplete:Number = param4;
         var removed:Boolean = false;
         var tl:uint = _tweenList.length;
         i = 0;
         while(i < tl)
         {
            if(Boolean(_tweenList[i]) && p_scope == _tweenList[i].scope)
            {
               if(p_timeComplete > _tweenList[i].timeStart && p_timeStart < _tweenList[i].timeComplete)
               {
                  removedLocally = false;
                  for(pName in _tweenList[i].properties)
                  {
                     if(Boolean(p_properties[pName]))
                     {
                        if(Boolean(_tweenList[i].onOverwrite))
                        {
                           try
                           {
                              _tweenList[i].onOverwrite.apply(_tweenList[i].scope,_tweenList[i].onOverwriteParams);
                           }
                           catch(e:Error)
                           {
                              handleError(_tweenList[i],e,"onOverwrite");
                           }
                        }
                        _tweenList[i].properties[pName] = undefined;
                        delete _tweenList[i].properties[pName];
                        removedLocally = true;
                        removed = true;
                     }
                  }
                  if(removedLocally)
                  {
                     if(AuxFunctions.getObjectLength(_tweenList[i].properties) == 0)
                     {
                        removeTweenByIndex(i);
                     }
                  }
               }
            }
            i++;
         }
         return removed;
      }
      
      public static function removeTweens(param1:Object, ... rest) : Boolean
      {
         var _loc4_:uint = 0;
         var _loc3_:Array = new Array();
         _loc4_ = 0;
         while(_loc4_ < rest.length)
         {
            if(typeof rest[_loc4_] == "string" && !AuxFunctions.isInArray(rest[_loc4_],_loc3_))
            {
               _loc3_.push(rest[_loc4_]);
            }
            _loc4_++;
         }
         return affectTweens(removeTweenByIndex,param1,_loc3_);
      }
      
      public static function removeAllTweens() : Boolean
      {
         var _loc2_:uint = 0;
         if(!Boolean(_tweenList))
         {
            return false;
         }
         var _loc1_:Boolean = false;
         _loc2_ = 0;
         while(_loc2_ < _tweenList.length)
         {
            removeTweenByIndex(_loc2_);
            _loc1_ = true;
            _loc2_++;
         }
         return _loc1_;
      }
      
      public static function pauseTweens(param1:Object, ... rest) : Boolean
      {
         var _loc4_:uint = 0;
         var _loc3_:Array = new Array();
         _loc4_ = 0;
         while(_loc4_ < rest.length)
         {
            if(typeof rest[_loc4_] == "string" && !AuxFunctions.isInArray(rest[_loc4_],_loc3_))
            {
               _loc3_.push(rest[_loc4_]);
            }
            _loc4_++;
         }
         return affectTweens(pauseTweenByIndex,param1,_loc3_);
      }
      
      public static function pauseAllTweens() : Boolean
      {
         var _loc2_:uint = 0;
         if(!Boolean(_tweenList))
         {
            return false;
         }
         var _loc1_:Boolean = false;
         _loc2_ = 0;
         while(_loc2_ < _tweenList.length)
         {
            pauseTweenByIndex(_loc2_);
            _loc1_ = true;
            _loc2_++;
         }
         return _loc1_;
      }
      
      public static function resumeTweens(param1:Object, ... rest) : Boolean
      {
         var _loc4_:uint = 0;
         var _loc3_:Array = new Array();
         _loc4_ = 0;
         while(_loc4_ < rest.length)
         {
            if(typeof rest[_loc4_] == "string" && !AuxFunctions.isInArray(rest[_loc4_],_loc3_))
            {
               _loc3_.push(rest[_loc4_]);
            }
            _loc4_++;
         }
         return affectTweens(resumeTweenByIndex,param1,_loc3_);
      }
      
      public static function resumeAllTweens() : Boolean
      {
         var _loc2_:uint = 0;
         if(!Boolean(_tweenList))
         {
            return false;
         }
         var _loc1_:Boolean = false;
         _loc2_ = 0;
         while(_loc2_ < _tweenList.length)
         {
            resumeTweenByIndex(_loc2_);
            _loc1_ = true;
            _loc2_++;
         }
         return _loc1_;
      }
      
      private static function affectTweens(param1:Function, param2:Object, param3:Array) : Boolean
      {
         var _loc5_:uint = 0;
         var _loc6_:Array = null;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         var _loc4_:Boolean = false;
         if(!Boolean(_tweenList))
         {
            return false;
         }
         _loc5_ = 0;
         while(_loc5_ < _tweenList.length)
         {
            if(_tweenList[_loc5_] && _tweenList[_loc5_].scope == param2)
            {
               if(param3.length == 0)
               {
                  param1(_loc5_);
                  _loc4_ = true;
               }
               else
               {
                  _loc6_ = new Array();
                  _loc7_ = 0;
                  while(_loc7_ < param3.length)
                  {
                     if(Boolean(_tweenList[_loc5_].properties[param3[_loc7_]]))
                     {
                        _loc6_.push(param3[_loc7_]);
                     }
                     _loc7_++;
                  }
                  if(_loc6_.length > 0)
                  {
                     _loc8_ = AuxFunctions.getObjectLength(_tweenList[_loc5_].properties);
                     if(_loc8_ == _loc6_.length)
                     {
                        param1(_loc5_);
                        _loc4_ = true;
                     }
                     else
                     {
                        _loc9_ = splitTweens(_loc5_,_loc6_);
                        param1(_loc9_);
                        _loc4_ = true;
                     }
                  }
               }
            }
            _loc5_++;
         }
         return _loc4_;
      }
      
      public static function splitTweens(param1:Number, param2:Array) : uint
      {
         var _loc5_:uint = 0;
         var _loc6_:* = null;
         var _loc7_:Boolean = false;
         var _loc3_:TweenListObj = _tweenList[param1];
         var _loc4_:TweenListObj = _loc3_.clone(false);
         _loc5_ = 0;
         while(_loc5_ < param2.length)
         {
            _loc6_ = param2[_loc5_];
            if(Boolean(_loc3_.properties[_loc6_]))
            {
               _loc3_.properties[_loc6_] = undefined;
               delete _loc3_.properties[_loc6_];
            }
            _loc5_++;
         }
         for(_loc6_ in _loc4_.properties)
         {
            _loc7_ = false;
            _loc5_ = 0;
            while(_loc5_ < param2.length)
            {
               if(param2[_loc5_] == _loc6_)
               {
                  _loc7_ = true;
                  break;
               }
               _loc5_++;
            }
            if(!_loc7_)
            {
               _loc4_.properties[_loc6_] = undefined;
               delete _loc4_.properties[_loc6_];
            }
         }
         _tweenList.push(_loc4_);
         return _tweenList.length - 1;
      }
      
      private static function updateTweens() : Boolean
      {
         var _loc1_:int = 0;
         if(_tweenList.length == 0)
         {
            return false;
         }
         _loc1_ = 0;
         while(_loc1_ < _tweenList.length)
         {
            if(_tweenList[_loc1_] == undefined || !_tweenList[_loc1_].isPaused)
            {
               if(!updateTweenByIndex(_loc1_))
               {
                  removeTweenByIndex(_loc1_);
               }
               if(_tweenList[_loc1_] == null)
               {
                  removeTweenByIndex(_loc1_,true);
                  _loc1_--;
               }
            }
            _loc1_++;
         }
         return true;
      }
      
      public static function removeTweenByIndex(param1:Number, param2:Boolean = false) : Boolean
      {
         _tweenList[param1] = null;
         if(param2)
         {
            _tweenList.splice(param1,1);
         }
         return true;
      }
      
      public static function pauseTweenByIndex(param1:Number) : Boolean
      {
         var _loc2_:TweenListObj = _tweenList[param1];
         if(_loc2_ == null || _loc2_.isPaused)
         {
            return false;
         }
         _loc2_.timePaused = _currentTime;
         _loc2_.isPaused = true;
         return true;
      }
      
      public static function resumeTweenByIndex(param1:Number) : Boolean
      {
         var _loc2_:TweenListObj = _tweenList[param1];
         if(_loc2_ == null || !_loc2_.isPaused)
         {
            return false;
         }
         _loc2_.timeStart = _loc2_.timeStart + (_currentTime - _loc2_.timePaused);
         _loc2_.timeComplete = _loc2_.timeComplete + (_currentTime - _loc2_.timePaused);
         _loc2_.timePaused = undefined;
         _loc2_.isPaused = false;
         return true;
      }
      
      private static function updateTweenByIndex(param1:Number) : Boolean
      {
         var tTweening:TweenListObj = null;
         var mustUpdate:Boolean = false;
         var nv:Number = NaN;
         var t:Number = NaN;
         var b:Number = NaN;
         var c:Number = NaN;
         var d:Number = NaN;
         var pName:String = null;
         var tScope:Object = null;
         var tProperty:Object = null;
         var pv:Number = NaN;
         var i:Number = param1;
         tTweening = _tweenList[i];
         if(tTweening == null || !Boolean(tTweening.scope))
         {
            return false;
         }
         var isOver:Boolean = false;
         if(_currentTime >= tTweening.timeStart)
         {
            tScope = tTweening.scope;
            if(tTweening.isCaller)
            {
               do
               {
                  t = (tTweening.timeComplete - tTweening.timeStart) / tTweening.count * (tTweening.timesCalled + 1);
                  b = tTweening.timeStart;
                  c = tTweening.timeComplete - tTweening.timeStart;
                  d = tTweening.timeComplete - tTweening.timeStart;
                  nv = tTweening.transition(t,b,c,d);
                  if(_currentTime >= nv)
                  {
                     if(Boolean(tTweening.onUpdate))
                     {
                        try
                        {
                           tTweening.onUpdate.apply(tScope,tTweening.onUpdateParams);
                        }
                        catch(e:Error)
                        {
                           handleError(tTweening,e,"onUpdate");
                        }
                     }
                     tTweening.timesCalled++;
                     if(tTweening.timesCalled >= tTweening.count)
                     {
                        isOver = true;
                        break;
                     }
                     if(tTweening.waitFrames)
                     {
                        break;
                     }
                  }
               }
               while(_currentTime >= nv);
               
            }
            else
            {
               mustUpdate = tTweening.skipUpdates < 1 || !tTweening.skipUpdates || tTweening.updatesSkipped >= tTweening.skipUpdates;
               if(_currentTime >= tTweening.timeComplete)
               {
                  isOver = true;
                  mustUpdate = true;
               }
               if(!tTweening.hasStarted)
               {
                  if(Boolean(tTweening.onStart))
                  {
                     try
                     {
                        tTweening.onStart.apply(tScope,tTweening.onStartParams);
                     }
                     catch(e:Error)
                     {
                        handleError(tTweening,e,"onStart");
                     }
                  }
                  for(pName in tTweening.properties)
                  {
                     pv = getPropertyValue(tScope,pName);
                     tTweening.properties[pName].valueStart = !!isNaN(pv)?tTweening.properties[pName].valueComplete:pv;
                  }
                  mustUpdate = true;
                  tTweening.hasStarted = true;
               }
               if(mustUpdate)
               {
                  for(pName in tTweening.properties)
                  {
                     tProperty = tTweening.properties[pName];
                     if(isOver)
                     {
                        nv = tProperty.valueComplete;
                     }
                     else if(tProperty.hasModifier)
                     {
                        t = _currentTime - tTweening.timeStart;
                        d = tTweening.timeComplete - tTweening.timeStart;
                        nv = tTweening.transition(t,0,1,d);
                        nv = tProperty.modifierFunction(tProperty.valueStart,tProperty.valueComplete,nv,tProperty.modifierParameters);
                     }
                     else
                     {
                        t = _currentTime - tTweening.timeStart;
                        b = tProperty.valueStart;
                        c = tProperty.valueComplete - tProperty.valueStart;
                        d = tTweening.timeComplete - tTweening.timeStart;
                        nv = tTweening.transition(t,b,c,d);
                     }
                     if(tTweening.rounded)
                     {
                        nv = Math.round(nv);
                     }
                     setPropertyValue(tScope,pName,nv);
                  }
                  tTweening.updatesSkipped = 0;
                  if(Boolean(tTweening.onUpdate))
                  {
                     try
                     {
                        tTweening.onUpdate.apply(tScope,tTweening.onUpdateParams);
                     }
                     catch(e:Error)
                     {
                        handleError(tTweening,e,"onUpdate");
                     }
                  }
               }
               else
               {
                  tTweening.updatesSkipped++;
               }
            }
            if(isOver && Boolean(tTweening.onComplete))
            {
               try
               {
                  tTweening.onComplete.apply(tScope,tTweening.onCompleteParams);
               }
               catch(e:Error)
               {
                  handleError(tTweening,e,"onComplete");
               }
            }
            return !isOver;
         }
         return true;
      }
      
      public static function init(param1:* = null) : void
      {
         _inited = true;
         _transitionList = new Object();
         Equations.init();
         _specialPropertyList = new Object();
         _specialPropertyModifierList = new Object();
         _specialPropertySplitterList = new Object();
         SpecialPropertiesDefault.init();
      }
      
      public static function registerTransition(param1:String, param2:Function) : void
      {
         if(!_inited)
         {
            init();
         }
         _transitionList[param1] = param2;
      }
      
      public static function registerSpecialProperty(param1:String, param2:Function, param3:Function, param4:Array = null) : void
      {
         if(!_inited)
         {
            init();
         }
         var _loc5_:SpecialProperty = new SpecialProperty(param2,param3,param4);
         _specialPropertyList[param1] = _loc5_;
      }
      
      public static function registerSpecialPropertyModifier(param1:String, param2:Function, param3:Function) : void
      {
         if(!_inited)
         {
            init();
         }
         var _loc4_:SpecialPropertyModifier = new SpecialPropertyModifier(param2,param3);
         _specialPropertyModifierList[param1] = _loc4_;
      }
      
      public static function registerSpecialPropertySplitter(param1:String, param2:Function, param3:Array = null) : void
      {
         if(!_inited)
         {
            init();
         }
         var _loc4_:SpecialPropertySplitter = new SpecialPropertySplitter(param2,param3);
         _specialPropertySplitterList[param1] = _loc4_;
      }
      
      private static function startEngine() : void
      {
         _engineExists = true;
         _tweenList = new Array();
         __tweener_controller__ = new MovieClip();
         __tweener_controller__.addEventListener(Event.ENTER_FRAME,Tweener.onEnterFrame);
         updateTime();
      }
      
      private static function stopEngine() : void
      {
         _engineExists = false;
         _tweenList = null;
         _currentTime = 0;
         __tweener_controller__.removeEventListener(Event.ENTER_FRAME,Tweener.onEnterFrame);
         __tweener_controller__ = null;
      }
      
      private static function getPropertyValue(param1:Object, param2:String) : Number
      {
         if(_specialPropertyList[param2] != undefined)
         {
            if(Boolean(_specialPropertyList[param2].parameters))
            {
               return _specialPropertyList[param2].getValue(param1,_specialPropertyList[param2].parameters);
            }
            return _specialPropertyList[param2].getValue(param1);
         }
         return param1[param2];
      }
      
      private static function setPropertyValue(param1:Object, param2:String, param3:Number) : void
      {
         if(_specialPropertyList[param2] != undefined)
         {
            if(Boolean(_specialPropertyList[param2].parameters))
            {
               _specialPropertyList[param2].setValue(param1,param3,_specialPropertyList[param2].parameters);
            }
            else
            {
               _specialPropertyList[param2].setValue(param1,param3);
            }
         }
         else
         {
            param1[param2] = param3;
         }
      }
      
      public static function updateTime() : void
      {
         _currentTime = getTimer();
      }
      
      public static function onEnterFrame(param1:Event) : void
      {
         updateTime();
         var _loc2_:Boolean = false;
         _loc2_ = updateTweens();
         if(!_loc2_)
         {
            stopEngine();
         }
      }
      
      public static function setTimeScale(param1:Number) : void
      {
         var _loc2_:Number = NaN;
         if(isNaN(param1))
         {
            param1 = 1;
         }
         if(param1 < 0.00001)
         {
            param1 = 0.00001;
         }
         if(param1 != _timeScale)
         {
            if(_tweenList != null)
            {
               _loc2_ = 0;
               while(_loc2_ < _tweenList.length)
               {
                  _tweenList[_loc2_].timeStart = _currentTime - (_currentTime - _tweenList[_loc2_].timeStart) * _timeScale / param1;
                  _tweenList[_loc2_].timeComplete = _currentTime - (_currentTime - _tweenList[_loc2_].timeComplete) * _timeScale / param1;
                  if(_tweenList[_loc2_].timePaused != undefined)
                  {
                     _tweenList[_loc2_].timePaused = _currentTime - (_currentTime - _tweenList[_loc2_].timePaused) * _timeScale / param1;
                  }
                  _loc2_++;
               }
            }
            _timeScale = param1;
         }
      }
      
      public static function isTweening(param1:Object) : Boolean
      {
         var _loc2_:uint = 0;
         if(!Boolean(_tweenList))
         {
            return false;
         }
         _loc2_ = 0;
         while(_loc2_ < _tweenList.length)
         {
            if(_tweenList[_loc2_].scope == param1)
            {
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      public static function getTweens(param1:Object) : Array
      {
         var _loc2_:uint = 0;
         var _loc3_:* = null;
         if(!Boolean(_tweenList))
         {
            return [];
         }
         var _loc4_:Array = new Array();
         _loc2_ = 0;
         while(_loc2_ < _tweenList.length)
         {
            if(_tweenList[_loc2_].scope == param1)
            {
               for(_loc3_ in _tweenList[_loc2_].properties)
               {
                  _loc4_.push(_loc3_);
               }
            }
            _loc2_++;
         }
         return _loc4_;
      }
      
      public static function getTweenCount(param1:Object) : Number
      {
         var _loc2_:uint = 0;
         if(!Boolean(_tweenList))
         {
            return 0;
         }
         var _loc3_:Number = 0;
         _loc2_ = 0;
         while(_loc2_ < _tweenList.length)
         {
            if(_tweenList[_loc2_].scope == param1)
            {
               _loc3_ = _loc3_ + AuxFunctions.getObjectLength(_tweenList[_loc2_].properties);
            }
            _loc2_++;
         }
         return _loc3_;
      }
      
      private static function handleError(param1:TweenListObj, param2:Error, param3:String) : void
      {
         var pTweening:TweenListObj = param1;
         var pError:Error = param2;
         var pCallBackName:String = param3;
         if(Boolean(pTweening.onError) && pTweening.onError is Function)
         {
            try
            {
               pTweening.onError.apply(pTweening.scope,[pTweening.scope,pError]);
            }
            catch(metaError:Error)
            {
            }
         }
         else if(Boolean(pTweening.onError))
         {
         }
      }
      
      public static function getVersion() : String
      {
         return "AS3 1.26.62";
      }
      
      public static function debug_getList() : String
      {
         var _loc2_:uint = 0;
         var _loc3_:uint = 0;
         var _loc1_:String = "";
         _loc2_ = 0;
         while(_loc2_ < _tweenList.length)
         {
            _loc1_ = _loc1_ + ("[" + _loc2_ + "] ::\n");
            _loc3_ = 0;
            while(_loc3_ < _tweenList[_loc2_].properties.length)
            {
               _loc1_ = _loc1_ + ("  " + _tweenList[_loc2_].properties[_loc3_].name + " -> " + _tweenList[_loc2_].properties[_loc3_].valueComplete + "\n");
               _loc3_++;
            }
            _loc2_++;
         }
         return _loc1_;
      }
   }
}
