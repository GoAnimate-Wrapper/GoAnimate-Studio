package
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffButtonEffect;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffCommand;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffFilter;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffSymbol;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffSymbolText;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffText;
   import com.jumpeye.flashEff2.text.FeTable;
   import com.jumpeye.flashEff2.text.defaultFade.FeTDefaultFade;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.geom.Transform;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.text.TextField;
   import flash.utils.Timer;
   import flash.utils.clearInterval;
   import flash.utils.describeType;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   import flash.utils.setInterval;
   
   public dynamic class FlashEff2 extends JUIComponent
   {
      
      public static const SWAP_TYPE_SHOW:String = "show";
      
      public static const SWAP_TYPE_HIDE:String = "hide";
      
      public static const SWAP_TYPE_HIDE_AND_SHOW:String = "hideAndShow";
      
      protected static var REMOVED_FROM_FLASHEFF:Boolean = false;
      
      protected static var eventTypeAsoc:Array = [];
      
      protected static var groupList:Array;
      
      private static var targetPaths:Array;
      
      {
         eventTypeAsoc["rollOver"] = "ROLL_OVER";
         eventTypeAsoc["rollOut"] = "ROLL_OUT";
         eventTypeAsoc["press"] = "MOUSE_DOWN";
         eventTypeAsoc["release"] = "MOUSE_UP";
         eventTypeAsoc["doubleClick"] = "DOUBLE_CLICK";
         eventTypeAsoc["showTransitionStart"] = "";
         eventTypeAsoc["showTransitionEnd"] = "";
         eventTypeAsoc["hideTransitionStart"] = "";
         eventTypeAsoc["hideTransitionEnd"] = "";
      }
      
      protected var tepA:IFlashEffCommand;
      
      protected var tepF:IFlashEffFilter;
      
      protected var tepS:FeTDefaultFade;
      
      protected var showPattern:IFlashEffSymbolText;
      
      protected var hidePattern:IFlashEffSymbolText;
      
      protected var swapPattern:IFlashEffSymbolText;
      
      protected var lastTransitionPattern:IFlashEffSymbolText;
      
      protected var partialPattern:IFlashEffSymbol;
      
      protected var _buttonEffect:IFlashEffButtonEffect;
      
      protected var swapFlashEff2:FlashEff2;
      
      protected var _isTransitioning:Boolean = false;
      
      protected var isButtonEffectApplyed:Boolean = false;
      
      protected var drawCalled:Boolean = false;
      
      protected var isDragOut:Boolean = false;
      
      protected var setNewTarget:Boolean = false;
      
      protected var forceHide:Boolean = false;
      
      protected var _textOwnerClip:Sprite;
      
      protected var _partialTextOwnerClip:Sprite;
      
      protected var firstInDepth:Sprite;
      
      protected var hitAreaClip:Sprite;
      
      protected var tTS:Sprite;
      
      protected var buttonTarget:Sprite;
      
      protected var bDBTO:Sprite;
      
      protected var bDBT:Sprite;
      
      protected var aDBT:Sprite;
      
      protected var aDBTO:Sprite;
      
      protected var nextTarget:DisplayObject;
      
      protected var partialInterval:Number;
      
      protected var maxEndEvents:Number = 0;
      
      protected var eventsDispatched:Number = 0;
      
      protected var transitionType:String = "show";
      
      protected var _buttonEffectName:String;
      
      protected var _cTT:String = "";
      
      protected var showTimer:Timer;
      
      protected var hideTimer:Timer;
      
      protected var filterAsoc:Array;
      
      protected var _xml:XML;
      
      private var forceAutoPlay = null;
      
      protected var tempTarget;
      
      protected var _initialTargetTransform:Transform;
      
      protected var _toggle:Boolean = false;
      
      protected var _groupName:String = "feGroup";
      
      protected var _selected:Boolean = false;
      
      private var _filterList:Array;
      
      private var _rollOverCommands:Array;
      
      private var _rollOutCommands:Array;
      
      private var _pressCommands:Array;
      
      private var _releaseCommands:Array;
      
      private var _doubleClickCommands:Array;
      
      private var _showTransitionStartCommands:Array;
      
      private var _showTransitionEndCommands:Array;
      
      private var _hideTransitionStartCommands:Array;
      
      private var _hideTransitionEndCommands:Array;
      
      private var _absChars:Array;
      
      private var _absWords:Array;
      
      private var _absLines:Array;
      
      private var _absCustom:Array;
      
      private var _absMatrix:Array;
      
      private var _target:DisplayObject;
      
      private var _swapTarget:DisplayObject;
      
      private var _targetOwner:MovieClip;
      
      private var _firstLevelOwner:Sprite;
      
      private var _highestOwner:Sprite;
      
      private var _buttonOwner:Sprite;
      
      private var _textField:TextField;
      
      private var __showDelay:Number = 0;
      
      private var __hideDelay:Number = 2;
      
      private var __swapDelay:Number = 0;
      
      private var __targetInstanceName:String = "";
      
      private var __swapTargetInstanceName:String = "";
      
      private var __swapType:String = "hideAndShow";
      
      private var __xmlPath:String = "";
      
      private var __partialPattern:String = "com.jumpeye.flashEff2.text.defaultFade.FeTDefaultFade";
      
      private var __xmlString:String = "";
      
      private var _hideTransitionName:String;
      
      private var _showTransitionName:String;
      
      private var _swapTransitionName:String;
      
      private var _ideDataHolder:String = "";
      
      private var _textTable:FeTable;
      
      private var _partialTable:FeTable;
      
      private var _isTargetVisibleAtEnd:Boolean = false;
      
      private var _isMouseTriggered:Boolean = true;
      
      private var _drawAfterFilters:Boolean = true;
      
      private var _useHandCursor:Boolean = false;
      
      private var _useSwapInsteadHide:Boolean = false;
      
      private var _clearAfterHide:Boolean = true;
      
      private var __showAutoPlay:Boolean = true;
      
      private var __hideAutoPlay:Boolean = true;
      
      private var __targetVisibility:Boolean = true;
      
      private var __swapTargetVisibility:Boolean = false;
      
      public function FlashEff2()
      {
         super();
         this.init();
      }
      
      protected function init() : void
      {
         this._targetOwner = new MovieClip();
         this._firstLevelOwner = new Sprite();
         this._highestOwner = new Sprite();
         this.bDBTO = new Sprite();
         this.bDBT = new Sprite();
         this.aDBT = new Sprite();
         this.aDBTO = new Sprite();
         this.aDBT.addChild(this.firstLevelOwner);
         this.aDBTO.addChild(this.aDBT);
         this.highestOwner.addChild(this.aDBTO);
         this.addChild(this.highestOwner);
         this.bDBT.addChild(this.targetOwner);
         this.bDBTO.addChild(this.bDBT);
         this.firstLevelOwner.addChild(this.bDBTO);
         this.buttonTarget = this.aDBT;
         this.firstInDepth = this.bDBTO;
         this.hitAreaClip = new Sprite();
         this.addChild(this.hitAreaClip);
         this.highestOwner.hitArea = this.hitAreaClip;
         this.hitAreaClip.mouseEnabled = false;
         this.hitAreaClip.visible = false;
         this.hitAreaClip.graphics.beginFill(0);
         this.hitAreaClip.graphics.drawRect(0,0,1,1);
         this.hitAreaClip.graphics.endFill();
         this.hitAreaClip.height = 0;
         this.hitAreaClip.width = 0;
         this._textOwnerClip = new Sprite();
         this._partialTextOwnerClip = new Sprite();
         this.targetOwner.addChild(this._textOwnerClip);
         this.targetOwner.addChild(this._partialTextOwnerClip);
         this._textTable = new FeTable();
         this._partialTable = new FeTable();
         this._textOwnerClip.addChild(DisplayObject(this.textTable));
         this._partialTextOwnerClip.addChild(DisplayObject(this.partialTable));
         this.tTS = new Sprite();
         this._buttonOwner = new Sprite();
         this.aDBTO.addChild(this.buttonOwner);
         this.resetArrays();
         this._filterList = [];
         this._rollOverCommands = [];
         this._rollOutCommands = [];
         this._pressCommands = [];
         this._releaseCommands = [];
         this._doubleClickCommands = [];
         this._showTransitionStartCommands = [];
         this._showTransitionEndCommands = [];
         this._hideTransitionStartCommands = [];
         this._hideTransitionEndCommands = [];
         this.filterAsoc = [];
         if(FlashEff2.targetPaths == null)
         {
            FlashEff2.targetPaths = [];
         }
         if(groupList == null)
         {
            groupList = [];
         }
         this.showTimer = new Timer(this.showDelay * 1000,1);
         this.hideTimer = new Timer(this.hideDelay * 1000,1);
         this.partialPatternName = this.__partialPattern;
         this.addEventListener(Event.REMOVED_FROM_STAGE,this.removedFromStage);
         this.autoUpdateMeasuredSize = true;
      }
      
      override protected function draw() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:* = undefined;
         var _loc3_:Timer = null;
         var _loc4_:* = undefined;
         var _loc5_:FlashEff2 = null;
         var _loc6_:Point = null;
         if(this.isInvalid("all"))
         {
            super.draw();
            if(this.target != null)
            {
               _loc1_ = false;
               if(this.showPattern != null && this.showAutoPlay == true)
               {
                  this.transitionType = "show";
                  _loc1_ = true;
               }
               else if(this.hidePattern != null)
               {
                  if(this.hideAutoPlay == true)
                  {
                     _loc1_ = true;
                     this.transitionType = "hide";
                  }
               }
               if(this.target.parent != this.targetOwner)
               {
                  if(_loc1_ == true || this.filterList.length > 0 || this.getCommandsNumber() > 0)
                  {
                     this.target = this.target;
                  }
               }
               this.target.visible = this.targetVisibility;
               if(_loc1_)
               {
                  _loc3_ = this[this.transitionType + "Timer"];
                  if(this[this.transitionType + "Delay"] > 0)
                  {
                     _loc3_.reset();
                     _loc3_.start();
                     _loc3_.addEventListener(TimerEvent.TIMER,this[this.transitionType + "Caller"]);
                     if(this.transitionType == "show")
                     {
                        if(this.target != null)
                        {
                           this.target.visible = false;
                        }
                     }
                  }
                  else
                  {
                     this.transitionEffect(this.transitionType);
                  }
               }
               if(this.selected == true)
               {
                  for(_loc4_ in FlashEff2.groupList)
                  {
                     _loc5_ = FlashEff2.groupList[_loc4_] as FlashEff2;
                     if(_loc5_ != this)
                     {
                        if(_loc5_.selected == true)
                        {
                           if(_loc5_.groupName == this.groupName)
                           {
                              _loc5_.selected = false;
                           }
                        }
                     }
                  }
               }
               if(this.buttonEffect != null)
               {
                  _loc6_ = new Point(this.mouseX,this.mouseY);
                  _loc6_ = this.localToGlobal(_loc6_);
                  if(this.highestOwner.hitTestPoint(_loc6_.x,_loc6_.y,true))
                  {
                     this.buttonRollOver();
                  }
                  else
                  {
                     this.buttonRollOut();
                  }
               }
               for(_loc2_ in this.filterList)
               {
                  IFlashEffFilter(this.filterList[_loc2_]).remove();
                  IFlashEffFilter(this.filterList[_loc2_]).apply();
               }
            }
            else if(this.tempTarget != null)
            {
               trace("FLASHEFF2 WARNING: Please add the target to the display list in order to apply an effect.");
            }
            this.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.INIT));
         }
      }
      
      public function setProperties(param1:*) : void
      {
         var child:XML = null;
         var command:IFlashEffCommand = null;
         var filter:IFlashEffFilter = null;
         var me:FlashEff2 = null;
         var urlLdr:URLLoader = null;
         var xmlArg:* = param1;
         if(xmlArg is XML)
         {
            this.invalidate();
            this._xml = xmlArg as XML;
            this.removeEffect(true);
            this.removeAllCommands();
            this.removeAllFilters();
            this.removeButtonEffect();
            if(xmlArg.params.children().length() > 0)
            {
               this.setProp(xmlArg.params,this);
            }
            for each(child in xmlArg.patterns.children())
            {
               switch(String(child.type))
               {
                  case "command":
                     command = this.addCommandByName(String(child.name),String(child.event));
                     this.setProp(child.params,command);
                     continue;
                  case "showCommand":
                     command = this.addCommandByName(String(child.name),String(child.event));
                     this.setProp(child.params,command);
                     continue;
                  case "hideCommand":
                     command = this.addCommandByName(String(child.name),String(child.event));
                     this.setProp(child.params,command);
                     continue;
                  case "filter":
                     filter = this.addFilterByName(String(child.name));
                     this.setProp(child.params,filter);
                     continue;
                  case "buttonEffect":
                     this.buttonEffectName = String(child.name);
                     this.setProp(child.params,this.buttonEffect);
                     continue;
                  case "hide":
                     this.hideTransitionName = String(child.name);
                     this.setProp(child.params,this.hidePattern);
                     continue;
                  case "show":
                     this.showTransitionName = String(child.name);
                     this.setProp(child.params,this.showPattern);
                     continue;
                  case "swap":
                     this.swapTransitionName = String(child.name);
                     this.setProp(child.params,this.swapPattern);
                     continue;
                  default:
                     continue;
               }
            }
            this.drawCalled = false;
            this.setDrawTime();
         }
         else
         {
            me = this;
            urlLdr = new URLLoader();
            urlLdr.dataFormat = "text";
            urlLdr.addEventListener(Event.COMPLETE,function(param1:Event):void
            {
               var _loc2_:FLASHEFFEvents = new FLASHEFFEvents(FLASHEFFEvents.COMPLETE);
               _loc2_.data = urlLdr.data;
               me.dispatchEvent(_loc2_);
               var _loc3_:XML = XML(urlLdr.data);
               if(String(_loc3_.params.xmlPath.value) == xmlArg)
               {
                  _loc3_.params.xmlPath.value = "";
               }
               me.setProperties(_loc3_);
            });
            urlLdr.addEventListener("ioError",function(param1:Event):*
            {
               trace("FLASHEFF2 ERROR: There was an IO_ERROR problem loading the xml. Please check the xmlPath.");
               me.dispatchEvent(param1);
            });
            urlLdr.load(new URLRequest(xmlArg));
         }
      }
      
      override public function dispatchEvent(param1:Event) : Boolean
      {
         var _loc3_:FLASHEFFEvents = null;
         var _loc4_:Boolean = false;
         var _loc5_:Point = null;
         var _loc6_:DisplayObject = null;
         var _loc7_:Timer = null;
         var _loc8_:DisplayObject = null;
         var _loc9_:Boolean = false;
         var _loc10_:Boolean = false;
         var _loc11_:Boolean = false;
         var _loc12_:* = undefined;
         var _loc2_:Boolean = true;
         if(param1.type == FLASHEFFEvents.TRANSITION_END || param1.type == "defaultPatternFinish")
         {
            (param1 as FLASHEFFEvents).currentTransitionType = this.currentTransitionType;
            this.eventsDispatched++;
            if(this.eventsDispatched == this.maxEndEvents)
            {
               this.runCommands(this["_" + this.currentTransitionType + "TransitionEndCommands"]);
               if(this.isTargetVisibleAtEnd == true)
               {
                  if(this.transitionType == "show")
                  {
                     this.target.visible = true;
                  }
                  this._textOwnerClip.visible = false;
                  this._partialTextOwnerClip.visible = false;
               }
               _loc2_ = true;
               this._isTransitioning = false;
               if(this.transitionType == "show")
               {
                  if(this.isButtonEffectApplyed == true)
                  {
                     _loc5_ = new Point(this.mouseX,this.mouseY);
                     _loc5_ = this.localToGlobal(_loc5_);
                     if(this.highestOwner.hitTestPoint(_loc5_.x,_loc5_.y,true))
                     {
                        this.rollOverButtonHandler(null,true);
                     }
                  }
               }
               _loc3_ = new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END);
               _loc3_.currentTransitionType = this.currentTransitionType;
               _loc4_ = false;
               if(this.transitionType == "show")
               {
                  if(this.hidePattern != null)
                  {
                     if(this.hideAutoPlay == true && this.forceAutoPlay != false || this.forceAutoPlay == true)
                     {
                        this.hideTimer.reset();
                        this.hideTimer.start();
                        this.forceAutoPlay = null;
                        this.hideTimer.addEventListener(TimerEvent.TIMER,this.hideCaller);
                     }
                  }
               }
               else
               {
                  if(this.setNewTarget == true)
                  {
                     this.hideTimer.stop();
                     this.showTimer.stop();
                     _loc6_ = this.target;
                     this.target = this.nextTarget;
                     if(_loc6_ != null)
                     {
                        _loc6_.visible = false;
                     }
                     this.setNewTarget = false;
                     this.nextTarget = null;
                     _loc4_ = super.dispatchEvent(_loc3_);
                     _loc7_ = new Timer(this.showDelay,1);
                     if(this.showDelay > 0)
                     {
                        _loc7_.start();
                        _loc7_.addEventListener(TimerEvent.TIMER,this.showCallerWeak);
                     }
                     else
                     {
                        this.show(false);
                     }
                     return _loc4_;
                  }
                  if(this._cTT == "swap")
                  {
                     _loc8_ = this.target;
                     this.removeSwapFlashEff2();
                     this.target = this.swapTarget;
                     this.target.visible = true;
                     this.swapTarget = null;
                     _loc8_.visible = this.targetVisibility;
                     _loc9_ = this.hideAutoPlay;
                     _loc10_ = this.showAutoPlay;
                     _loc11_ = this.targetVisibility;
                     this.__hideAutoPlay = false;
                     this.__showAutoPlay = false;
                     this.targetVisibility = true;
                     this.invalidate();
                     this.drawNow();
                     this.__hideAutoPlay = _loc9_;
                     this.__showAutoPlay = _loc10_;
                     this.targetVisibility = _loc11_;
                     this.target.visible = true;
                  }
                  else if(this._cTT == "hide")
                  {
                     if(this._clearAfterHide == true)
                     {
                        this.removeEffect(true);
                        this.removeButtonEvents();
                        for(_loc12_ in this.filterList)
                        {
                           IFlashEffFilter(this.filterList[_loc12_]).remove();
                        }
                     }
                  }
               }
               _loc4_ = super.dispatchEvent(_loc3_);
               return _loc4_;
            }
            _loc2_ = false;
         }
         else if(param1.type == FLASHEFFEvents.TRANSITION_START)
         {
            this.runCommands(this["_" + this.currentTransitionType + "TransitionStartCommands"]);
            (param1 as FLASHEFFEvents).currentTransitionType = this.currentTransitionType;
         }
         if(_loc2_ == true)
         {
            return super.dispatchEvent(param1);
         }
         return true;
      }
      
      public function transitionEffect(param1:String = "show") : void
      {
         var i:* = undefined;
         var transt:String = param1;
         if(this.isInvalid("all"))
         {
            for(i in this.filterList)
            {
               IFlashEffFilter(this.filterList[i]).remove();
               IFlashEffFilter(this.filterList[i]).apply();
            }
         }
         this.validate();
         this.removeEffect(true);
         this.maxEndEvents = 1;
         this._cTT = transt;
         if(this.target != null)
         {
            if(this.targetOwner.getChildByName(this.target.name) != this.target)
            {
               this.target = this.target;
            }
            try
            {
               this.eventsDispatched = 0;
               this.lastTransitionPattern = this[transt + "Pattern"];
               if(transt == "hide")
               {
                  if(this.useSwapInsteadHide == true)
                  {
                     if(this.forceHide == false)
                     {
                        if(this.swapTarget != null)
                        {
                           this._cTT = "swap";
                           switch(this.swapType)
                           {
                              case FlashEff2.SWAP_TYPE_HIDE:
                                 this.addSwapFlashEff2(0);
                                 break;
                              case FlashEff2.SWAP_TYPE_SHOW:
                                 this.addSwapFlashEff2(this.numChildren);
                                 break;
                              default:
                                 this.addSwapFlashEff2(0);
                           }
                           this.swapFlashEff2.target = this.swapTarget;
                           this.swapFlashEff2.showDelay = Number(this.swapDelay) || Number(0.0001);
                           if(this.swapType != FlashEff2.SWAP_TYPE_HIDE)
                           {
                              if(this.swapPattern != null)
                              {
                                 this.swapFlashEff2.showTransition = this.swapPattern;
                              }
                              else
                              {
                                 this.swapFlashEff2.showTransition = this.clonePattern(this.showPattern) as IFlashEffSymbolText;
                              }
                              if(this.swapType == FlashEff2.SWAP_TYPE_SHOW)
                              {
                                 this.target.visible = true;
                                 this.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
                                 return;
                              }
                              this.maxEndEvents = 2;
                           }
                           else
                           {
                              this.swapTarget.visible = true;
                           }
                        }
                        else
                        {
                           trace("FLASHEFF2 ERROR: The swapTarget property is null, a hide transition will be applied.");
                        }
                     }
                  }
               }
               if(this.lastTransitionPattern != null)
               {
                  if(this.target.parent != this.targetOwner)
                  {
                     this.target = this.target;
                  }
                  this.target.visible = true;
                  this.lastTransitionPattern.component = this;
                  try
                  {
                     this.lastTransitionPattern["target"] = this.target;
                  }
                  catch(e:TypeError)
                  {
                     trace("FLASHEFF2 ERROR: You have placed a text pattern over a symbol. Please use a symbol pattern instead!");
                     return;
                  }
                  this._isTransitioning = true;
                  this.lastTransitionPattern[transt]();
               }
               else
               {
                  trace("FLASHEFF2 WARNING: The " + transt + "Transition pattern is null. The transition will not be applied.");
               }
            }
            catch(e:ReferenceError)
            {
               throw "FLASHEFF2 ERROR: " + e;
            }
         }
         else if(this.tempTarget != null)
         {
            trace("FLASHEFF2 WARNING: Please add the target and the component to the display list before applying an effect.");
         }
         else
         {
            trace("FLASHEFF2 WARNING: Please set the target or _targetInstanceName property before applying an effect.");
         }
         this.forceHide = false;
      }
      
      public function removeEffect(param1:Boolean = false, param2:IFlashEffSymbolText = null) : void
      {
         if(param2 == null)
         {
            param2 = this.lastTransitionPattern;
         }
         if(param2 != null)
         {
            param2.remove();
         }
         if(this.partialPattern != null)
         {
            this.partialPattern.remove();
         }
         if(this.textTable != null)
         {
            this.textTable.removeChilds();
         }
         if(this.partialTable != null)
         {
            this.partialTable.removeChilds();
         }
         if(param1 == false)
         {
            if(this._isTransitioning == true)
            {
               this.eventsDispatched = 0;
               this.maxEndEvents = 1;
               this.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
            }
         }
         if(this.target != null)
         {
            this.target.visible = this._isTargetVisibleAtEnd;
         }
         this.maxEndEvents = 0;
      }
      
      public function removeAll() : void
      {
         this.removeEffect(true,this.showPattern);
         this.removeEffect(true,this.hidePattern);
         this.removeSwapFlashEff2();
         this.removeAllCommands();
         this.removeAllFilters();
         this.removeButtonEffect();
         this.buttonEffect = null;
         this._buttonEffectName = "";
         this.removeShowTransition();
         this.removeHideTransition();
         this.showTimer.stop();
         this.hideTimer.stop();
         this.showTimer.removeEventListener(TimerEvent.TIMER,this.showCaller);
         this.hideTimer.removeEventListener(TimerEvent.TIMER,this.hideCaller);
         if(this.target != null)
         {
            this.removeFromGroupList(this.target);
            this.target.visible = true;
            this.resetChildDisplayList(this.target);
            this.hitAreaClip.width = this.hitAreaClip.height = 0;
         }
      }
      
      public function show(param1:* = null) : void
      {
         this.forceAutoPlay = param1;
         this.showTimer.stop();
         this.hideTimer.stop();
         this.transitionType = "show";
         this.transitionEffect(this.transitionType);
      }
      
      public function hide() : void
      {
         this.showTimer.stop();
         this.hideTimer.stop();
         this.transitionType = "hide";
         this.transitionEffect(this.transitionType);
      }
      
      public function swap(param1:DisplayObject = null, param2:String = "") : void
      {
         if(param1 != null)
         {
            this.swapTarget = param1;
         }
         if(param2 != "")
         {
            this.swapType = param2;
         }
         this.useSwapInsteadHide = true;
         this.hide();
      }
      
      public function drawTextTable(param1:String, param2:String, param3:Number, param4:Array, param5:Number, param6:Number, param7:Array = null) : Boolean
      {
         var _loc9_:Array = null;
         var _loc10_:Array = null;
         var _loc11_:Array = null;
         var _loc14_:* = undefined;
         var _loc15_:* = undefined;
         var _loc16_:uint = 0;
         var _loc19_:uint = 0;
         var _loc28_:Number = NaN;
         var _loc29_:Object = null;
         var _loc30_:* = undefined;
         var _loc31_:Number = NaN;
         var _loc32_:Number = NaN;
         var _loc33_:Number = NaN;
         var _loc34_:Number = NaN;
         this.textTable.removeChilds();
         this.partialTable.removeChilds();
         this.resetArrays();
         var _loc8_:Object = this.textTable;
         var _loc12_:Boolean = false;
         var _loc13_:Boolean = false;
         var _loc17_:uint = 1;
         var _loc18_:uint = 1;
         var _loc20_:uint = 0;
         var _loc21_:String = param1;
         var _loc22_:String = param1;
         _loc10_ = this.linesSplit();
         _loc17_ = _loc10_.length;
         var _loc23_:Array = [];
         var _loc24_:Array = [];
         if(param2 == "lines")
         {
            this.filterArray(_loc10_,param2,param3,param4);
         }
         _loc14_ = 0;
         while(_loc14_ < _loc17_)
         {
            if(_loc22_ == "custom")
            {
               _loc9_ = _loc10_[_loc14_].childs = this.customSplit(_loc10_[_loc14_].text,_loc10_[_loc14_].id,param7[_loc10_[_loc14_].lineId]);
               _loc21_ = param1 = "words";
            }
            else
            {
               _loc9_ = _loc10_[_loc14_].childs = this.wordsSplit(_loc10_[_loc14_].text,_loc10_[_loc14_].id);
            }
            _loc10_[_loc14_].owner = this.textTable;
            _loc18_ = _loc9_.length;
            _loc15_ = 0;
            while(_loc15_ < _loc18_)
            {
               _loc23_.push(_loc9_[_loc15_]);
               _loc9_[_loc15_].passed = _loc10_[_loc14_].passed;
               _loc9_[_loc15_].owner = this.textTable;
               _loc11_ = _loc9_[_loc15_].childs = this.charSplit(_loc9_[_loc15_].text,_loc9_[_loc15_].id);
               _loc19_ = _loc11_.length;
               _loc16_ = 0;
               while(_loc16_ < _loc19_)
               {
                  _loc11_[_loc16_].passed = _loc9_[_loc15_].passed;
                  _loc24_.push(_loc11_[_loc16_]);
                  _loc16_++;
               }
               _loc15_++;
            }
            _loc14_++;
         }
         if(param3 < 100 || param2 == "selectedStrings")
         {
            if(param2 == "words")
            {
               this.filterArray(_loc23_,param2,param3,param4);
            }
            else if(param2 == "letters" || param2 == "selectedStrings")
            {
               this.filterArray(_loc24_,param2,param3,param4);
            }
            _loc28_ = param5 * 10;
            if(this.transitionType == "hide")
            {
               _loc28_ = 0;
               this._partialTextOwnerClip.alpha = 1;
            }
            else
            {
               this._partialTextOwnerClip.alpha = 0;
            }
            clearInterval(this.partialInterval);
            this.partialInterval = setInterval(this.startPartialEffect,_loc28_ * (this.lastTransitionPattern.tweenDuration || 0));
            this.maxEndEvents++;
         }
         switch(param1.toLocaleLowerCase())
         {
            case "lines":
               _loc17_ = _loc10_.length;
               _loc8_ = this.textTable;
               _loc15_ = 0;
               while(_loc15_ < _loc17_)
               {
                  _loc29_ = _loc8_;
                  if(_loc10_[_loc15_].passed == false)
                  {
                     _loc29_ = this.partialTable;
                  }
                  _loc30_ = _loc29_.pushChild({
                     "type":"FeGroup",
                     "x":_loc10_[_loc15_].bounds.x,
                     "y":_loc10_[_loc15_].bounds.y,
                     "text":_loc10_[_loc15_].text,
                     "bounds":_loc10_[_loc15_].bounds,
                     "id":_loc10_[_loc15_].id
                  });
                  _loc10_[_loc15_].owner = _loc30_;
                  this._absLines.push(_loc30_);
                  _loc15_++;
               }
               param1 = "words";
            case "words":
               _loc17_ = _loc10_.length;
               _loc14_ = 0;
               while(_loc14_ < _loc17_)
               {
                  _loc31_ = _loc10_[_loc14_].owner.x;
                  _loc32_ = _loc10_[_loc14_].owner.y;
                  _loc8_ = _loc10_[_loc14_].owner;
                  _loc9_ = _loc10_[_loc14_].childs;
                  _loc18_ = _loc9_.length;
                  _loc15_ = 0;
                  while(_loc15_ < _loc18_)
                  {
                     _loc29_ = _loc8_;
                     _loc33_ = _loc31_;
                     _loc34_ = _loc32_;
                     if(_loc9_[_loc15_].passed == false && (_loc21_ == "words" || param2 == "words"))
                     {
                        _loc29_ = this.partialTable;
                        _loc33_ = 0;
                        _loc34_ = 0;
                     }
                     else if(_loc9_[_loc15_].passed == false)
                     {
                        _loc33_ = 0;
                        _loc34_ = 0;
                     }
                     _loc30_ = _loc29_.pushChild({
                        "type":"FeGroup",
                        "x":_loc9_[_loc15_].bounds.x - _loc33_,
                        "y":_loc9_[_loc15_].bounds.y - _loc34_,
                        "text":_loc9_[_loc15_].text,
                        "bounds":_loc9_[_loc15_].bounds,
                        "id":_loc9_[_loc15_].id
                     });
                     _loc9_[_loc15_].owner = _loc30_;
                     this._absWords.push(_loc30_);
                     if(_loc22_ == "custom")
                     {
                        this._absCustom.push(_loc30_);
                     }
                     _loc15_++;
                  }
                  _loc14_++;
               }
               param1 = "chars";
            case "chars":
               _loc14_ = 0;
               while(_loc14_ < _loc17_)
               {
                  _loc9_ = _loc10_[_loc14_].childs;
                  _loc18_ = _loc9_.length;
                  _loc15_ = 0;
                  while(_loc15_ < _loc18_)
                  {
                     _loc11_ = _loc9_[_loc15_].childs;
                     _loc8_ = _loc9_[_loc15_].owner;
                     _loc31_ = _loc8_.x + _loc10_[_loc14_].owner.x;
                     _loc32_ = _loc8_.y + _loc10_[_loc14_].owner.y;
                     _loc19_ = _loc11_.length;
                     _loc16_ = 0;
                     while(_loc16_ < _loc19_)
                     {
                        _loc29_ = _loc8_;
                        _loc33_ = _loc31_;
                        _loc34_ = _loc32_;
                        if(_loc11_[_loc16_].passed != false)
                        {
                           _loc11_[_loc16_].passed = _loc9_[_loc15_].passed;
                        }
                        if(_loc11_[_loc16_].passed == false)
                        {
                           if(_loc21_ == "chars" || (param2 == "letters" || param2 == "selectedStrings"))
                           {
                              _loc29_ = this.partialTable;
                              _loc33_ = 0;
                              _loc34_ = 0;
                           }
                           else if(param2 == "words")
                           {
                              _loc33_ = _loc8_.x;
                              _loc34_ = _loc8_.y;
                           }
                        }
                        _loc30_ = _loc29_.pushChild({
                           "type":"FeChar",
                           "x":_loc11_[_loc16_].bounds.x - 2 - _loc33_,
                           "y":_loc11_[_loc16_].bounds.y - 2 - _loc34_,
                           "text":_loc11_[_loc16_].text,
                           "bounds":_loc11_[_loc16_].bounds,
                           "id":_loc11_[_loc16_].id
                        });
                        _loc20_ = this.textField.getLineIndexOfChar(_loc30_.id);
                        _loc30_.bottomPosition = this.textField.getLineMetrics(_loc20_).ascent;
                        _loc30_.applyTextFormat(this.textField.getTextFormat(_loc30_.id,_loc30_.id + 1));
                        this._absChars.push(_loc30_);
                        _loc16_++;
                     }
                     _loc15_++;
                  }
                  _loc14_++;
               }
         }
         this.textTable.cleanMe();
         var _loc25_:uint = this.textTable.childs.length;
         _loc20_ = 0;
         var _loc26_:Number = -1;
         var _loc27_:Number = 0;
         if(_loc25_ < 1)
         {
            this.maxEndEvents--;
         }
         else
         {
            this._absMatrix[_loc20_] = [];
         }
         _loc14_ = 0;
         while(_loc14_ < _loc25_)
         {
            _loc30_ = this.textTable.childs[_loc14_];
            _loc20_ = this.textField.getLineIndexOfChar(_loc30_.id);
            if(_loc20_ != _loc26_)
            {
               _loc26_ = _loc20_;
               _loc27_ = this._absMatrix.push([]);
            }
            this._absMatrix[_loc27_ - 1].push(_loc30_);
            _loc14_++;
         }
         _loc14_ = 0;
         while(_loc14_ < this._absMatrix.length)
         {
            if(this._absMatrix[_loc14_].length == 0)
            {
               this._absMatrix.splice(_loc14_,1);
               _loc14_--;
            }
            _loc14_++;
         }
         this._textOwnerClip.visible = true;
         DisplayObject(this.textTable).visible = true;
         DisplayObject(this._partialTextOwnerClip).visible = true;
         this.textField.visible = false;
         return true;
      }
      
      public function addFilterByName(param1:String, param2:Object = null) : IFlashEffFilter
      {
         var filterReference:Class = null;
         var i:* = undefined;
         var filterName:String = param1;
         var initObj:Object = param2;
         try
         {
            filterReference = getDefinitionByName(filterName) as Class;
         }
         catch(e:ReferenceError)
         {
            trace("FLASHEFF2 ERROR: The filter pattern \'" + filterName + "\' is missing from library.");
            return null;
         }
         var filter:IFlashEffFilter = IFlashEffFilter(new filterReference(this));
         if(initObj != null)
         {
            for(i in initObj)
            {
               filter[i] = initObj[i];
            }
         }
         this.addFilter(filter);
         return filter;
      }
      
      public function addFilter(param1:IFlashEffFilter) : void
      {
         var _loc2_:DisplayObject = null;
         var _loc3_:Boolean = false;
         if(param1 != null)
         {
            _loc2_ = this.firstInDepth;
            this.firstInDepth = new Sprite();
            this.firstLevelOwner.addChild(this.firstInDepth);
            this.firstInDepth.addChild(_loc2_);
            param1.component = this;
            param1.target = this.firstInDepth;
            this.filterAsoc[param1.target.name] = _loc2_;
            if(!this.isInvalid("all"))
            {
               if(this.target != null)
               {
                  _loc3_ = this.target.visible;
                  this.target.visible = true;
                  param1.apply();
                  this.target.visible = _loc3_;
               }
            }
            this.filterList.push(param1);
         }
      }
      
      public function removeFilter(param1:IFlashEffFilter) : Boolean
      {
         var _loc2_:* = undefined;
         var _loc3_:uint = 0;
         if(param1 != null)
         {
            param1.remove();
            for(_loc2_ in this.filterList)
            {
               if(this.filterList[_loc2_] == param1)
               {
                  if(param1.target == this.firstInDepth)
                  {
                     this.firstInDepth = this.filterAsoc[param1.target.name];
                  }
                  if(this.filterList.length > _loc2_ + 1)
                  {
                     this.filterAsoc[this.filterList[_loc2_ + 1].target.name] = this.filterAsoc[param1.target.name];
                  }
                  this.filterList.splice(_loc2_,1);
                  _loc3_ = 0;
                  while(_loc2_ < param1.target.numChildren)
                  {
                     param1.target.parent.addChild(param1.target.getChildAt(_loc3_));
                     _loc3_++;
                  }
                  param1.target.parent.removeChild(param1.target);
                  return true;
               }
            }
         }
         return false;
      }
      
      public function getFilter(param1:String) : IFlashEffFilter
      {
         var _loc2_:* = undefined;
         for(_loc2_ in this.filterList)
         {
            if(String(getQualifiedClassName(this.filterList[_loc2_])).replace("::",".") == param1)
            {
               return this.filterList[_loc2_];
            }
         }
         return null;
      }
      
      public function addCommand(param1:IFlashEffCommand, param2:String) : IFlashEffCommand
      {
         var command:IFlashEffCommand = param1;
         var eventType:String = param2;
         if(command != null)
         {
            try
            {
               this["_" + eventType + "Commands"].push(command);
               command.component = this;
               command.target = this.target;
               command.commandEventType = eventType;
               if(FlashEff2.eventTypeAsoc[eventType] != "")
               {
                  this.setCommands(eventType);
               }
            }
            catch(e:Error)
            {
               trace("FLASHEFF2 ERROR: Unknown eventType. Available events  are: rollOver, rollOut, press, release, doubleClick, showTransitionStart, showTransitionEnd, hideTransitionStart and hideTransitionEnd.");
            }
         }
         return command;
      }
      
      public function addCommandByName(param1:String, param2:String, param3:Object = null) : IFlashEffCommand
      {
         var commandRef:Class = null;
         var command:IFlashEffCommand = null;
         var i:* = undefined;
         var commandName:String = param1;
         var eventType:String = param2;
         var initObj:Object = param3;
         try
         {
            commandRef = getDefinitionByName(commandName) as Class;
            command = IFlashEffCommand(new commandRef(this));
            if(initObj != null)
            {
               for(i in initObj)
               {
                  command[i] = initObj[i];
               }
            }
         }
         catch(e:ReferenceError)
         {
            trace("FLASHEFF2 ERROR: The command pattern \'" + commandName + "\' is missing from library.");
            return null;
         }
         return this.addCommand(command,eventType);
      }
      
      public function removeCommandByName(param1:String) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:Array = null;
         var _loc4_:uint = 0;
         for(_loc2_ in FlashEff2.eventTypeAsoc)
         {
            _loc3_ = this["_" + _loc2_ + "Commands"];
            if(_loc3_ != null)
            {
               _loc4_ = 0;
               while(_loc4_ < _loc3_.length)
               {
                  if(String(getQualifiedClassName(_loc3_[_loc4_])).replace("::",".") == param1)
                  {
                     _loc3_.splice(_loc4_,1);
                  }
                  _loc4_++;
               }
               if(FlashEff2.eventTypeAsoc[_loc2_] != "")
               {
                  this.setCommands(_loc2_);
               }
            }
         }
      }
      
      public function removeCommand(param1:IFlashEffCommand) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:Array = null;
         var _loc4_:uint = 0;
         for(_loc2_ in FlashEff2.eventTypeAsoc)
         {
            _loc3_ = this["_" + _loc2_ + "Commands"];
            if(_loc3_ != null)
            {
               _loc4_ = 0;
               while(_loc4_ < _loc3_.length)
               {
                  if(_loc3_[_loc4_] == param1)
                  {
                     _loc3_.splice(_loc4_,1);
                  }
                  _loc4_++;
               }
               if(FlashEff2.eventTypeAsoc[_loc2_] != "")
               {
                  this.setCommands(_loc2_);
               }
            }
         }
      }
      
      public function removeAllCommandsByEventType(param1:String) : void
      {
         var _loc2_:Array = this["_" + param1 + "Commands"];
         if(_loc2_ != null)
         {
            if(_loc2_.length > 0)
            {
               this["_" + param1 + "Commands"] = [];
               if(FlashEff2.eventTypeAsoc[param1] != "")
               {
                  this.setCommands(param1);
               }
            }
         }
      }
      
      public function removeAllCommands() : void
      {
         var _loc1_:* = undefined;
         for(_loc1_ in FlashEff2.eventTypeAsoc)
         {
            this.removeAllCommandsByEventType(_loc1_);
         }
      }
      
      public function getFilterAt(param1:uint) : IFlashEffFilter
      {
         if(param1 < this.filterList.length)
         {
            return this.filterList[param1];
         }
         return null;
      }
      
      public function getShowPattern() : IFlashEffSymbolText
      {
         return this.showPattern;
      }
      
      public function getHidePattern() : IFlashEffSymbolText
      {
         return this.hidePattern;
      }
      
      public function removeHideTransition() : void
      {
         if(this.hidePattern != null)
         {
            this.hidePattern.remove();
            this.hidePattern = null;
            this._hideTransitionName = "";
         }
      }
      
      public function removeShowTransition() : void
      {
         if(this.showPattern != null)
         {
            this.showPattern.remove();
            this.showPattern = null;
            this._showTransitionName = "";
         }
      }
      
      public function removeAllFilters() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:Boolean = false;
         if(this.filterList != null)
         {
            _loc1_ = 0;
            while(_loc1_ < this.filterList.length)
            {
               _loc2_ = this.removeFilter(this.filterList[_loc1_]);
               _loc1_ = _loc1_ - Number(_loc2_);
               _loc1_++;
            }
         }
         this.filterAsoc = [];
      }
      
      public function removeButtonEffect() : void
      {
         if(this.buttonEffect != null)
         {
            this.buttonEffect.remove();
         }
         this.highestOwner.mouseChildren = true;
         this.removeButtonEvents();
         this.isButtonEffectApplyed = false;
      }
      
      public function applyButtonEffect() : void
      {
         this.setButtonEvents();
         this.isButtonEffectApplyed = true;
         this.highestOwner.mouseChildren = false;
      }
      
      public function buttonRollOver() : void
      {
         this.rollOverButtonHandler(null,true);
      }
      
      public function buttonRollOut() : void
      {
         this.rollOutButtonHandler(null,true);
      }
      
      public function buttonPress() : void
      {
         this.pressButtonHandler(null,true);
      }
      
      public function buttonRelease() : void
      {
         this.releaseButtonHandler(null,true);
      }
      
      public function setXML(param1:*) : void
      {
         this.setProperties(param1);
      }
      
      public function getXML() : XML
      {
         return this._xml;
      }
      
      public function changeTarget(param1:DisplayObject) : void
      {
         var _loc2_:Timer = null;
         this.nextTarget = param1;
         if(this.target != null)
         {
            this.setNewTarget = true;
            _loc2_ = this.hideTimer;
            this.forceHide = true;
            if(this.hideDelay > 0)
            {
               _loc2_.reset();
               _loc2_.start();
               _loc2_.addEventListener(TimerEvent.TIMER,this.hideCaller);
            }
            else
            {
               this.hide();
            }
         }
         else
         {
            this.target = param1;
            this.show(false);
         }
      }
      
      protected function getCommandsNumber() : Number
      {
         var _loc2_:* = undefined;
         var _loc1_:Number = 0;
         for(_loc2_ in FlashEff2.eventTypeAsoc)
         {
            _loc1_ = _loc1_ + this["_" + _loc2_ + "Commands"].length;
         }
         return _loc1_;
      }
      
      protected function removedFromStage(param1:Event) : void
      {
         if(FlashEff2.REMOVED_FROM_FLASHEFF == false)
         {
            this.removeEffect(true);
            this.removeAllCommands();
            this.removeAllFilters();
            this.removeButtonEffect();
         }
      }
      
      protected function startPartialEffect() : void
      {
         if(this.partialPattern != null)
         {
            try
            {
               this.partialPattern["partialBlurAmount"] = IFlashEffText(this.lastTransitionPattern).partialBlurAmount;
               this.partialPattern["partialStart"] = IFlashEffText(this.lastTransitionPattern).partialStart;
               this.partialPattern.tweenDuration = this.lastTransitionPattern.tweenDuration;
               this.partialPattern.tweenType = this.lastTransitionPattern.tweenType;
               this.partialPattern.easeType = this.lastTransitionPattern.easeType;
            }
            catch(e:Error)
            {
               trace("FLASHEFF2 ERROR: an error ocured when trying to set partialBlurAmount, partialStart, tweenDuration,tweenType and easeType on the partialPattern.");
            }
            this.partialPattern[this.transitionType]();
         }
         clearInterval(this.partialInterval);
      }
      
      protected function filterArray(param1:Array, param2:String, param3:Number, param4:Array) : void
      {
         var _loc6_:uint = 0;
         var _loc7_:Array = null;
         var _loc8_:* = undefined;
         var _loc9_:uint = 0;
         var _loc10_:Number = NaN;
         var _loc11_:String = null;
         var _loc12_:Object = null;
         var _loc13_:int = 0;
         var _loc14_:String = null;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:RegExp = null;
         var _loc18_:String = null;
         var _loc19_:uint = 0;
         var _loc20_:* = undefined;
         var _loc5_:uint = param1.length;
         if(param2 != "selectedStrings")
         {
            _loc6_ = _loc5_;
            _loc7_ = new Array(_loc5_);
            _loc8_ = 0;
            while(_loc8_ < _loc5_)
            {
               _loc7_[_loc8_] = _loc8_;
               _loc8_++;
            }
            while(_loc6_ / _loc5_ * 100 > param3)
            {
               _loc9_ = Math.floor(Math.random() * _loc7_.length);
               param1[_loc7_[_loc9_]].passed = false;
               _loc6_--;
               _loc7_.splice(_loc9_,1);
            }
         }
         else
         {
            _loc10_ = param4.length;
            _loc11_ = this.textField.text;
            _loc12_ = {};
            _loc8_ = 0;
            while(_loc8_ < _loc5_)
            {
               param1[_loc8_].passed = false;
               _loc12_[param1[_loc8_].id] = _loc8_;
               _loc8_++;
            }
            _loc8_ = 0;
            while(_loc8_ < _loc10_)
            {
               _loc13_ = 0;
               _loc14_ = param4[_loc8_];
               _loc15_ = _loc11_.indexOf(_loc14_,_loc13_);
               _loc16_ = _loc14_.length;
               _loc17_ = / /g;
               _loc18_ = _loc14_.replace(_loc17_,"");
               _loc19_ = _loc18_.length;
               while(_loc15_ != -1)
               {
                  _loc20_ = _loc15_;
                  while(_loc20_ < _loc15_ + _loc16_)
                  {
                     if(_loc12_[_loc20_] != undefined)
                     {
                        param1[_loc12_[_loc20_]].passed = true;
                     }
                     _loc20_++;
                  }
                  _loc13_ = _loc15_ + _loc16_;
                  _loc15_ = _loc11_.indexOf(_loc14_,_loc13_);
               }
               _loc8_++;
            }
         }
      }
      
      protected function charSplit(param1:String, param2:uint) : Array
      {
         var _loc8_:Rectangle = null;
         var _loc3_:Array = String(param1).split("");
         var _loc4_:Array = [];
         var _loc5_:uint = _loc3_.length;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         while(_loc7_ < _loc5_)
         {
            _loc8_ = this.textField.getCharBoundaries(param2 + _loc7_);
            if(_loc3_[_loc7_] != " ")
            {
               if(!isNaN(String(_loc3_[_loc7_]).charCodeAt(0)))
               {
                  if(_loc8_ != null)
                  {
                     _loc4_[_loc7_ - _loc6_] = {
                        "id":param2 + _loc7_,
                        "bounds":_loc8_,
                        "text":_loc3_[_loc7_]
                     };
                  }
                  else
                  {
                     _loc6_++;
                  }
               }
            }
            else
            {
               _loc6_++;
            }
            _loc7_++;
         }
         return _loc4_;
      }
      
      protected function wordsSplit(param1:String, param2:uint) : Array
      {
         var _loc9_:Rectangle = null;
         var _loc10_:Boolean = false;
         var _loc11_:uint = 0;
         var _loc12_:* = undefined;
         var _loc3_:Array = param1.split(" ");
         var _loc4_:Array = [];
         var _loc5_:uint = _loc3_.length;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:* = 0;
         while(_loc8_ < _loc5_)
         {
            _loc9_ = this.textField.getCharBoundaries(param2 + _loc6_ + _loc8_);
            _loc10_ = false;
            if(_loc9_ == null)
            {
               _loc10_ = true;
               _loc11_ = _loc3_[_loc8_].length;
               if(_loc11_ > 0)
               {
                  _loc12_ = 0;
                  while(_loc12_ < _loc11_)
                  {
                     _loc9_ = this.textField.getCharBoundaries(param2 + _loc6_ + _loc8_ + _loc12_);
                     if(_loc9_ != null)
                     {
                        _loc10_ = false;
                        break;
                     }
                     _loc12_++;
                  }
               }
            }
            if(_loc10_ == false)
            {
               _loc4_[_loc7_] = {
                  "id":param2 + _loc8_ + _loc6_,
                  "bounds":_loc9_,
                  "text":_loc3_[_loc8_]
               };
               _loc6_ = _loc6_ + String(_loc4_[_loc7_].text).length;
               _loc7_++;
            }
            else
            {
               _loc6_ = _loc6_ + _loc3_[_loc8_].length;
            }
            _loc8_++;
         }
         return _loc4_;
      }
      
      protected function linesSplit() : Array
      {
         var _loc7_:Rectangle = null;
         var _loc8_:String = null;
         var _loc9_:Boolean = false;
         var _loc10_:uint = 0;
         var _loc11_:* = undefined;
         var _loc1_:Array = [];
         var _loc2_:Array = [];
         var _loc3_:uint = this.textField.numLines;
         var _loc4_:uint = 0;
         var _loc5_:Number = 0;
         var _loc6_:uint = 0;
         while(_loc6_ < _loc3_)
         {
            _loc7_ = this.textField.getCharBoundaries(_loc4_);
            _loc8_ = this.textField.getLineText(_loc6_);
            _loc9_ = false;
            if(_loc7_ == null)
            {
               _loc9_ = true;
               _loc10_ = _loc8_.length;
               if(_loc10_ > 0)
               {
                  _loc11_ = 0;
                  while(_loc11_ < _loc10_)
                  {
                     _loc7_ = this.textField.getCharBoundaries(_loc4_ + _loc11_);
                     if(_loc7_ != null)
                     {
                        _loc9_ = false;
                        break;
                     }
                     _loc11_++;
                  }
               }
            }
            if(_loc9_ == false)
            {
               _loc2_[_loc6_ - _loc5_] = {
                  "id":_loc4_,
                  "bounds":_loc7_,
                  "lineId":_loc6_,
                  "text":_loc8_
               };
               _loc4_ = _loc4_ + String(_loc8_).length;
            }
            else
            {
               _loc5_++;
               _loc4_ = _loc4_ + _loc8_.length;
            }
            _loc6_++;
         }
         return _loc2_;
      }
      
      protected function customSplit(param1:String, param2:uint, param3:Array) : Array
      {
         var _loc9_:String = null;
         var _loc10_:Rectangle = null;
         var _loc11_:Boolean = false;
         var _loc12_:uint = 0;
         var _loc13_:* = undefined;
         var _loc4_:Array = [];
         var _loc5_:uint = param3.length;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:* = 0;
         while(_loc8_ < _loc5_)
         {
            _loc9_ = this.textField.text.substr(param2 + _loc6_,param3[_loc8_]);
            _loc10_ = this.textField.getCharBoundaries(param2 + _loc6_);
            _loc11_ = false;
            if(_loc10_ == null)
            {
               _loc11_ = true;
               _loc12_ = _loc9_.length;
               if(_loc12_ > 0)
               {
                  _loc13_ = 0;
                  while(_loc13_ < _loc12_)
                  {
                     _loc10_ = this.textField.getCharBoundaries(param2 + _loc6_ + _loc13_);
                     if(_loc10_ != null)
                     {
                        _loc11_ = false;
                        break;
                     }
                     _loc13_++;
                  }
               }
            }
            if(_loc11_ == false)
            {
               _loc4_[_loc7_] = {
                  "id":param2 + _loc6_,
                  "bounds":_loc10_,
                  "text":_loc9_
               };
               _loc6_ = _loc6_ + param3[_loc8_];
               _loc7_++;
            }
            else
            {
               _loc6_ = _loc6_ + param3[_loc8_];
            }
            _loc8_++;
         }
         return _loc4_;
      }
      
      protected function setCommands(param1:String) : void
      {
         var eventType:String = param1;
         try
         {
            if(this["_" + eventType + "Commands"] != null && this["_" + eventType + "Commands"].length > 0)
            {
               this.highestOwner.addEventListener(MouseEvent[FlashEff2.eventTypeAsoc[eventType]],this[eventType + "CommandHandler"]);
            }
            else
            {
               this.highestOwner.removeEventListener(MouseEvent[FlashEff2.eventTypeAsoc[eventType]],this[eventType + "CommandHandler"]);
            }
         }
         catch(e:Error)
         {
            trace("FLASHEFF2 ERROR: Unknown eventType. Available events  are: rollOver, rollOut, press, release, doubleClick, showTransitionStart, showTransitionEnd, hideTransitionStart and hideTransitionEnd.");
         }
         if(this.highestOwner.hasEventListener("doubleClick"))
         {
            this.highestOwner.doubleClickEnabled = true;
            this.highestOwner.mouseChildren = false;
         }
         else
         {
            this.highestOwner.doubleClickEnabled = false;
            this.highestOwner.mouseChildren = true;
         }
      }
      
      protected function rollOverCommandHandler(param1:MouseEvent) : void
      {
         this.runCommands(this._rollOverCommands);
      }
      
      protected function rollOutCommandHandler(param1:MouseEvent) : void
      {
         this.runCommands(this._rollOutCommands);
      }
      
      protected function pressCommandHandler(param1:MouseEvent) : void
      {
         this.runCommands(this._pressCommands);
      }
      
      protected function releaseCommandHandler(param1:MouseEvent) : void
      {
         this.runCommands(this._releaseCommands);
      }
      
      protected function doubleClickCommandHandler(param1:MouseEvent) : void
      {
         this.runCommands(this._doubleClickCommands);
         this.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.DOUBLE_CLICK));
      }
      
      protected function runCommands(param1:Array) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:* = undefined;
         if(param1 != null)
         {
            _loc2_ = param1.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               IFlashEffCommand(param1[_loc3_]).run();
               _loc3_++;
            }
         }
      }
      
      protected function setProp(param1:XMLList, param2:Object) : void
      {
         var child:XML = null;
         var propType:String = null;
         var propValue:String = null;
         var propName:String = null;
         var arg:XMLList = param1;
         var refObj:Object = param2;
         if(refObj != null)
         {
            for each(child in arg.children())
            {
               propType = child.type;
               propValue = child.value;
               propName = child.name().localName;
               try
               {
                  switch(propType)
                  {
                     case "String":
                        refObj[propName] = String(propValue);
                        break;
                     case "Number":
                        refObj[propName] = Number(String(propValue));
                        break;
                     case "uint":
                        refObj[propName] = uint(String(propValue));
                        break;
                     case "int":
                        refObj[propName] = int(String(propValue));
                        break;
                     case "Boolean":
                        refObj[propName] = String(propValue) == "true";
                        break;
                     case "Array":
                        refObj[propName] = String(propValue).split(",");
                        break;
                     case "XML":
                        refObj[propName] = XML(String(propValue));
                  }
               }
               catch(e:Error)
               {
                  trace("FLASHEFF2 ERROR: While trying to set the " + propName + " on " + refObj + ",this error came:" + e.message);
                  continue;
               }
            }
         }
      }
      
      protected function resetChildDisplayList(param1:DisplayObject) : void
      {
         var i:* = undefined;
         var pathObj:Object = null;
         var arg:DisplayObject = param1;
         var arr:Array = FlashEff2.targetPaths;
         for(i in arr)
         {
            pathObj = arr[i];
            if(pathObj != null)
            {
               if(pathObj.target == arg)
               {
                  if(pathObj.displayList.getChildByName(arg.name) == null)
                  {
                     try
                     {
                        pathObj.displayList.addChild(arg);
                     }
                     catch(e:Error)
                     {
                        try
                        {
                           arg.parent.removeChild(arg);
                           pathObj.displayList.addChild(arg);
                        }
                        catch(e:Error)
                        {
                           try
                           {
                              arg.parent["removeElement"](arg);
                           }
                           catch(e:Error)
                           {
                              try
                              {
                                 arg["parentChanged"](null);
                                 arg.parent.removeChild(arg);
                                 pathObj.displayList.addChild(arg);
                              }
                              catch(e:Error)
                              {
                              }
                           }
                        }
                        try
                        {
                           pathObj.displayList.addElement(arg);
                        }
                        catch(e:Error)
                        {
                        }
                     }
                     arg.x = pathObj.x;
                     arg.y = pathObj.y;
                     arg.rotation = pathObj.rotation;
                  }
                  FlashEff2.targetPaths[i] = null;
                  return;
               }
            }
         }
      }
      
      protected function getPath(param1:DisplayObject) : String
      {
         var _loc2_:DisplayObject = param1.parent;
         var _loc3_:String = param1.name;
         while(!(_loc2_ is Stage) && _loc2_ != null)
         {
            _loc3_ = _loc2_.name + "." + _loc3_;
            _loc2_ = _loc2_.parent;
         }
         return _loc3_;
      }
      
      protected function showCaller(param1:TimerEvent) : void
      {
         this.show();
      }
      
      protected function showCallerWeak(param1:TimerEvent) : void
      {
         this.show(false);
      }
      
      protected function hideCaller(param1:TimerEvent) : void
      {
         this.hide();
      }
      
      protected function targetOnAdd(param1:Event) : void
      {
         if(this.target.parent is MovieClip)
         {
            if(MovieClip(this.target.parent).currentFrame <= 1)
            {
               this.target.visible = false;
            }
         }
         this.target.removeEventListener(Event.ADDED_TO_STAGE,this.targetOnAdd);
         this.target.stage.invalidate();
         this.invalidate();
         this.firstLevelOwner.addEventListener(Event.RENDER,this.callDraw);
      }
      
      protected function callDraw(param1:Event) : void
      {
         this.draw();
      }
      
      function setDrawTime() : void
      {
         if(this.showAutoPlay == true || this.hideAutoPlay == true)
         {
            if(this.target is DisplayObject)
            {
               if(this.target.stage == null)
               {
                  this.target.addEventListener(Event.ADDED_TO_STAGE,this.targetOnAdd);
               }
               else if(this.drawCalled == false)
               {
                  this.drawCalled = true;
                  this.targetOnAdd(new Event(Event.ADDED_TO_STAGE));
               }
            }
         }
      }
      
      protected function resetArrays() : void
      {
         this._absChars = [];
         this._absWords = [];
         this._absLines = [];
         this._absMatrix = [];
         this._absCustom = [];
      }
      
      protected function setButtonEvents() : void
      {
         this.highestOwner.addEventListener(MouseEvent.ROLL_OVER,this.rollOverButtonHandler);
         this.highestOwner.addEventListener(MouseEvent.ROLL_OUT,this.rollOutButtonHandler);
         this.highestOwner.addEventListener(MouseEvent.MOUSE_DOWN,this.pressButtonHandler);
         this.highestOwner.addEventListener(MouseEvent.MOUSE_UP,this.releaseButtonHandler);
         this.isButtonEffectApplyed = true;
      }
      
      protected function removeButtonEvents() : void
      {
         this.highestOwner.removeEventListener(MouseEvent.ROLL_OVER,this.rollOverButtonHandler);
         this.highestOwner.removeEventListener(MouseEvent.ROLL_OUT,this.rollOutButtonHandler);
         this.highestOwner.removeEventListener(MouseEvent.MOUSE_DOWN,this.pressButtonHandler);
         this.highestOwner.removeEventListener(MouseEvent.MOUSE_UP,this.releaseButtonHandler);
         this.isButtonEffectApplyed = false;
      }
      
      protected function rollOverButtonHandler(param1:MouseEvent = null, param2:Boolean = false) : void
      {
         if(param2 == true || this.isMouseTriggered == true)
         {
            if(this._isTransitioning == false)
            {
               if(this.buttonEffect != null)
               {
                  this.buttonEffect.buttonRollOver();
               }
            }
         }
         if(param1 != null)
         {
            this.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.ROLL_OVER));
         }
      }
      
      protected function rollOutButtonHandler(param1:MouseEvent = null, param2:Boolean = false) : void
      {
         if(param2 == true || this.isMouseTriggered == true)
         {
            if(this._isTransitioning == false)
            {
               if(this.buttonEffect != null)
               {
                  this.buttonEffect.buttonRollOut();
               }
            }
         }
         this.isDragOut = false;
         if(param1 != null)
         {
            this.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.ROLL_OUT));
         }
      }
      
      protected function pressButtonHandler(param1:MouseEvent = null, param2:Boolean = false) : void
      {
         this.isDragOut = true;
         if(param2 == true || this.isMouseTriggered == true)
         {
            if(this._isTransitioning == false)
            {
               if(this.buttonEffect != null)
               {
                  this.buttonEffect.buttonPress();
               }
            }
         }
         if(param1 != null)
         {
            this.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.MOUSE_DOWN));
         }
      }
      
      protected function clickButtonHandler(param1:MouseEvent = null, param2:Boolean = false) : void
      {
         if(this.isDragOut == true)
         {
            if(param2 == true || this.isMouseTriggered == true)
            {
               if(this._isTransitioning == false)
               {
                  if(this.buttonEffect != null)
                  {
                     this.buttonEffect.buttonRelease();
                  }
               }
            }
         }
         if(param1 != null)
         {
            this.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.MOUSE_UP));
         }
      }
      
      protected function releaseButtonHandler(param1:MouseEvent = null, param2:Boolean = false) : void
      {
         if(this._toggle == true)
         {
            if(this.isDragOut == true)
            {
               if(param2 == true || this.isMouseTriggered == true)
               {
                  if(this._isTransitioning == false)
                  {
                     if(this.selected == false)
                     {
                        this.selected = true;
                     }
                     else if(this.getNumGroupButtons() < 2)
                     {
                        this.selected = false;
                     }
                     else
                     {
                        this.clickButtonHandler(param1,param2);
                     }
                  }
               }
            }
            if(param1 != null)
            {
               this.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.MOUSE_UP));
            }
         }
         else
         {
            this.clickButtonHandler(param1,param2);
         }
      }
      
      protected function addSwapFlashEff2(param1:uint = 0) : void
      {
         var _loc2_:* = undefined;
         if(this.swapFlashEff2 != null)
         {
            this.removeSwapFlashEff2();
         }
         this.swapFlashEff2 = new FlashEff2();
         this.swapFlashEff2.addEventListener(FLASHEFFEvents.TRANSITION_END,this.dispatchEvent);
         this.swapFlashEff2.addEventListener(FLASHEFFEvents.DOUBLE_CLICK,this.dispatchEvent);
         this.swapFlashEff2.addEventListener(FLASHEFFEvents.MOUSE_DOWN,this.dispatchEvent);
         this.swapFlashEff2.addEventListener(FLASHEFFEvents.MOUSE_UP,this.dispatchEvent);
         this.swapFlashEff2.addEventListener(FLASHEFFEvents.ROLL_OUT,this.dispatchEvent);
         this.swapFlashEff2.addEventListener(FLASHEFFEvents.ROLL_OVER,this.dispatchEvent);
         this.addChildAt(this.swapFlashEff2,param1);
         for(_loc2_ in this.filterList)
         {
            this.swapFlashEff2.addFilter(this.clonePattern(this.filterList[_loc2_]) as IFlashEffFilter);
         }
         for(_loc2_ in this.commands)
         {
            this.swapFlashEff2.addCommand(this.clonePattern(this.commands[_loc2_]) as IFlashEffCommand,(this.commands[_loc2_] as IFlashEffCommand).commandEventType);
         }
      }
      
      protected function removeSwapFlashEff2() : void
      {
         if(this.swapFlashEff2 != null)
         {
            this.swapFlashEff2.removeAll();
            this.removeChild(this.swapFlashEff2);
            this.swapFlashEff2.removeEventListener(FLASHEFFEvents.TRANSITION_END,this.dispatchEvent);
            this.swapFlashEff2.removeEventListener(FLASHEFFEvents.DOUBLE_CLICK,this.dispatchEvent);
            this.swapFlashEff2.removeEventListener(FLASHEFFEvents.MOUSE_DOWN,this.dispatchEvent);
            this.swapFlashEff2.removeEventListener(FLASHEFFEvents.MOUSE_UP,this.dispatchEvent);
            this.swapFlashEff2.removeEventListener(FLASHEFFEvents.ROLL_OUT,this.dispatchEvent);
            this.swapFlashEff2.removeEventListener(FLASHEFFEvents.ROLL_OVER,this.dispatchEvent);
            this.swapFlashEff2 = null;
         }
      }
      
      protected function clonePattern(param1:Object) : Object
      {
         var _loc2_:XML = null;
         var _loc3_:XMLList = null;
         var _loc4_:String = null;
         var _loc5_:Class = null;
         var _loc6_:Object = null;
         var _loc7_:Number = NaN;
         var _loc8_:* = undefined;
         var _loc9_:XML = null;
         var _loc10_:String = null;
         if(param1 != null)
         {
            _loc2_ = describeType(param1);
            _loc3_ = _loc2_.elements("accessor");
            _loc4_ = String(_loc2_.@name);
            _loc5_ = getDefinitionByName(_loc4_) as Class;
            _loc6_ = new _loc5_();
            _loc7_ = _loc3_.length();
            _loc8_ = 0;
            while(_loc8_ < _loc7_)
            {
               _loc9_ = _loc3_[_loc8_];
               if(_loc9_.@declaredBy == _loc4_)
               {
                  if(_loc9_.@access == "readwrite")
                  {
                     _loc10_ = _loc9_.@name;
                     _loc6_[_loc10_] = param1[_loc10_];
                  }
               }
               _loc8_++;
            }
            return _loc6_;
         }
         return null;
      }
      
      protected function addToGroupList(param1:DisplayObject) : void
      {
         if(param1 != null)
         {
            this.removeFromGroupList(param1);
            if(this.toggle == true)
            {
               groupList.push(this);
            }
         }
      }
      
      protected function displayAdded(param1:Event) : void
      {
         this.removeEventListener(Event.ADDED,this.displayAdded);
         if(this.tempTarget is String)
         {
            this._targetInstanceName = this.tempTarget as String;
         }
         else if(this.tempTarget is DisplayObject)
         {
            (this.tempTarget as DisplayObject).removeEventListener(Event.ADDED,this.displayAdded);
            this.target = this.tempTarget as DisplayObject;
         }
         this.invalidate();
         this.drawCalled = false;
         this.setDrawTime();
         this.tempTarget = null;
      }
      
      public function set _targetInstanceName(param1:String) : void
      {
         var scope:DisplayObjectContainer = null;
         var paths:Array = null;
         var targName:String = null;
         var i:* = undefined;
         var newTarget:DisplayObject = null;
         var strPath:String = null;
         var existObj:Object = null;
         var arg:String = param1;
         if(arg != "")
         {
            if(this.parent is DisplayObject)
            {
               scope = this.parent;
               paths = arg.split(".");
               targName = paths.pop();
               try
               {
                  i = 0;
                  while(i < paths.length)
                  {
                     scope = scope[paths[i]] as DisplayObjectContainer;
                     i++;
                  }
               }
               catch(e:Error)
               {
                  trace("FLASHEFF2 ERROR: The _targetInstanceName path is invalid.");
                  return;
               }
               if(scope != null)
               {
                  newTarget = scope.getChildByName(targName);
                  if(newTarget == null)
                  {
                     strPath = this.getPath(scope);
                     existObj = FlashEff2.targetPaths[strPath + "." + arg];
                     if(existObj != null)
                     {
                        newTarget = existObj.target;
                     }
                  }
                  this.target = newTarget;
               }
            }
            else
            {
               this.tempTarget = arg;
               this.addEventListener(Event.ADDED,this.displayAdded);
            }
            this.__targetInstanceName = arg;
         }
      }
      
      public function get _targetInstanceName() : String
      {
         return this.__targetInstanceName;
      }
      
      public function set target(param1:DisplayObject) : void
      {
         var point:Point = null;
         var bounds:Rectangle = null;
         var arg:DisplayObject = param1;
         if(this._target != null)
         {
            if(this.showPattern != null)
            {
               try
               {
                  this.showPattern.remove();
                  this.showPattern["target"] = null;
               }
               catch(e:Error)
               {
               }
            }
            if(this.hidePattern != null)
            {
               try
               {
                  this.hidePattern.remove();
                  this.hidePattern["target"] = null;
               }
               catch(e:Error)
               {
               }
            }
            this.removeFromGroupList(this.target);
            this._target.visible = true;
            this.resetChildDisplayList(this._target);
         }
         if(arg != null)
         {
            if(this.parent != null)
            {
               if(arg.parent != null)
               {
                  this.resetChildDisplayList(arg);
                  this.addToGroupList(arg);
                  this._target = arg;
                  if(this._targetInstanceName == "")
                  {
                     this.invalidate();
                     this.setDrawTime();
                  }
                  this.__targetInstanceName = arg.name;
                  point = new Point(0,0);
                  bounds = arg.getBounds(arg);
                  if(arg is TextField)
                  {
                     point.x = bounds.x;
                     point.y = bounds.y;
                     this._textField = TextField(arg);
                     this.textField.visible = false;
                     this._partialTextOwnerClip.scaleX = this._textOwnerClip.scaleX = this.textField.scaleX;
                     this._partialTextOwnerClip.scaleY = this._textOwnerClip.scaleY = this.textField.scaleY;
                  }
                  this.hitAreaClip.width = bounds.width * this.target.scaleX;
                  this.hitAreaClip.height = bounds.height * this.target.scaleY;
                  this.hitAreaClip.x = bounds.x * this.target.scaleX - point.x;
                  this.hitAreaClip.y = bounds.y * this.target.scaleY - point.y;
                  point = arg.localToGlobal(point);
                  point = this.parent.globalToLocal(point);
                  FlashEff2.targetPaths[this.getPath(arg)] = {
                     "target":arg,
                     "displayList":this.target.parent,
                     "x":arg.x,
                     "y":arg.y,
                     "rotation":arg.rotation
                  };
                  FlashEff2.REMOVED_FROM_FLASHEFF = true;
                  try
                  {
                  }
                  catch(e:Error)
                  {
                     try
                     {
                        arg.parent["removeElement"](arg);
                     }
                     catch(e:Error)
                     {
                        try
                        {
                           arg["parentChanged"](null);
                           arg.parent.removeChild(arg);
                        }
                        catch(e:Error)
                        {
                        }
                     }
                  }
                  this.targetOwner.addChild(arg);
                  FlashEff2.REMOVED_FROM_FLASHEFF = false;
                  this.x = this.x + (point.x - this.x);
                  this.y = this.y + (point.y - this.y);
                  this.rotation = this.target.rotation;
                  this.target.x = 0;
                  this.target.y = 0;
                  this.target.rotation = 0;
                  this.tTS.transform = arg.transform;
                  this._initialTargetTransform = this.tTS.transform;
               }
               else
               {
                  this.tempTarget = arg;
                  arg.addEventListener(Event.ADDED,this.displayAdded);
               }
            }
            else
            {
               this.tempTarget = arg;
               this.addEventListener(Event.ADDED,this.displayAdded);
            }
         }
         else
         {
            trace("FLASHEFF2 ERROR: Target must be a non-null DisplayObject.");
         }
      }
      
      public function get target() : DisplayObject
      {
         return this._target;
      }
      
      public function set showTransitionName(param1:String) : void
      {
         var patternClass:Class = null;
         var arg:String = param1;
         if(arg != "")
         {
            try
            {
               patternClass = getDefinitionByName(arg) as Class;
               if(this.showPattern != null)
               {
                  this.showPattern.remove();
               }
               this.showPattern = IFlashEffSymbolText(new patternClass(this));
            }
            catch(e:ReferenceError)
            {
               throw "FLASHEFF2 ERROR: The pattern \'" + arg + "\' is missing from library.";
            }
            this._showTransitionName = arg;
         }
      }
      
      public function get showTransitionName() : String
      {
         return this._showTransitionName;
      }
      
      public function set hideTransitionName(param1:String) : void
      {
         var patternClass:Class = null;
         var arg:String = param1;
         if(arg != "")
         {
            try
            {
               patternClass = getDefinitionByName(arg) as Class;
               if(this.hidePattern != null)
               {
                  this.hidePattern.remove();
               }
               this.hidePattern = new patternClass(this);
            }
            catch(e:ReferenceError)
            {
               throw "FLASHEFF2 ERROR: The pattern \'" + arg + "\' is missing from library.";
            }
            this._hideTransitionName = arg;
         }
      }
      
      public function get hideTransitionName() : String
      {
         return this._hideTransitionName;
      }
      
      public function set showTransition(param1:IFlashEffSymbolText) : void
      {
         if(param1 != null)
         {
            if(this.showPattern != null)
            {
               this.showPattern.remove();
            }
            this.showPattern = param1;
            this._showTransitionName = String(getQualifiedClassName(param1)).replace("::",".");
         }
      }
      
      public function get showTransition() : IFlashEffSymbolText
      {
         return this.showPattern;
      }
      
      public function set hideTransition(param1:IFlashEffSymbolText) : void
      {
         if(param1 != null)
         {
            if(this.hidePattern != null)
            {
               this.hidePattern.remove();
            }
            this.hidePattern = param1;
            this._hideTransitionName = String(getQualifiedClassName(param1)).replace("::",".");
         }
      }
      
      public function get hideTransition() : IFlashEffSymbolText
      {
         return this.hidePattern;
      }
      
      public function set xmlPath(param1:String) : void
      {
         if(param1 != "")
         {
            this.__xmlPath = param1;
            this.setProperties(this.__xmlPath);
         }
      }
      
      public function get xmlPath() : String
      {
         return this.__xmlPath;
      }
      
      public function set xmlString(param1:String) : void
      {
         var _loc2_:XML = null;
         if(param1 != "")
         {
            this.__xmlString = param1;
            _loc2_ = new XML(param1);
            this.setProperties(_loc2_);
         }
      }
      
      public function get xmlString() : String
      {
         return this.__xmlString;
      }
      
      public function set showDelay(param1:Number) : void
      {
         if(isNaN(param1))
         {
            param1 = 0;
         }
         else if(param1 <= 0)
         {
            param1 = 0;
         }
         this.__showDelay = param1;
         if(param1 < 1.0e-6)
         {
            param1 = 1.0e-6;
         }
         this.showTimer.delay = param1 * 1000;
      }
      
      public function get showDelay() : Number
      {
         return this.__showDelay;
      }
      
      public function set hideDelay(param1:Number) : void
      {
         if(isNaN(param1))
         {
            param1 = 2;
         }
         else if(param1 < 0)
         {
            param1 = 0;
         }
         this.__hideDelay = param1;
         if(param1 < 1.0e-6)
         {
            param1 = 1.0e-6;
         }
         this.hideTimer.delay = param1 * 1000;
      }
      
      public function get hideDelay() : Number
      {
         return this.__hideDelay;
      }
      
      public function set showAutoPlay(param1:Boolean) : void
      {
         this.__showAutoPlay = param1;
         this.invalidate();
         this.setDrawTime();
      }
      
      public function get showAutoPlay() : Boolean
      {
         return this.__showAutoPlay;
      }
      
      public function set hideAutoPlay(param1:Boolean) : void
      {
         this.__hideAutoPlay = param1;
         this.invalidate();
         this.setDrawTime();
      }
      
      public function get hideAutoPlay() : Boolean
      {
         return this.__hideAutoPlay;
      }
      
      public function set targetVisibility(param1:Boolean) : void
      {
         this.__targetVisibility = param1;
      }
      
      public function get targetVisibility() : Boolean
      {
         return this.__targetVisibility;
      }
      
      public function set partialPatternName(param1:String) : void
      {
         var patternReference:Class = null;
         var arg:String = param1;
         if(arg != "")
         {
            try
            {
               patternReference = getDefinitionByName(arg) as Class;
            }
            catch(e:ReferenceError)
            {
               throw "FLASHEFF2 ERROR: The Pattern:" + arg + " is unavailable.";
            }
         }
         if(patternReference != null)
         {
            this.partialPattern = new patternReference(this);
            this.partialPattern.target = this._partialTextOwnerClip;
         }
         this.__partialPattern = arg;
      }
      
      public function get partialPatternName() : String
      {
         return this.__partialPattern;
      }
      
      public function set filterList(param1:Array) : void
      {
         var _loc2_:* = undefined;
         this.removeAllFilters();
         if(param1 != null)
         {
            for(_loc2_ in param1)
            {
               this.addFilter(param1[_loc2_]);
            }
         }
      }
      
      public function get filterList() : Array
      {
         return this._filterList;
      }
      
      public function get commands() : Array
      {
         return this._rollOverCommands.concat(this._rollOutCommands,this._pressCommands,this._releaseCommands,this._doubleClickCommands,this._showTransitionStartCommands,this._showTransitionEndCommands,this._hideTransitionStartCommands,this._hideTransitionEndCommands);
      }
      
      public function set buttonEffect(param1:IFlashEffButtonEffect) : void
      {
         if(this.buttonEffect != null)
         {
            this.buttonEffect.remove();
         }
         if(param1 != null)
         {
            this.setButtonEvents();
            this._buttonEffect = param1;
            this.buttonEffect["selected"] = this.selected;
            this._buttonEffect.target = this.buttonTarget;
            this._buttonEffect.component = this;
            this._buttonEffect.apply();
            this._buttonEffectName = String(getQualifiedClassName(param1).replace("::","."));
         }
         else
         {
            this.removeButtonEvents();
            this._buttonEffect = null;
         }
      }
      
      public function get buttonEffect() : IFlashEffButtonEffect
      {
         return this._buttonEffect;
      }
      
      public function set buttonEffectName(param1:String) : void
      {
         var _loc2_:Class = null;
         if(param1 != "")
         {
            try
            {
               _loc2_ = getDefinitionByName(param1) as Class;
               this.buttonEffect = IFlashEffButtonEffect(new _loc2_(this));
            }
            catch(e:Error)
            {
            }
            this._buttonEffectName = param1;
         }
      }
      
      public function get buttonEffectName() : String
      {
         return this._buttonEffectName;
      }
      
      public function get absChars() : Array
      {
         return this._absChars.concat();
      }
      
      public function get absWords() : Array
      {
         return this._absWords.concat();
      }
      
      public function get absLines() : Array
      {
         return this._absLines.concat();
      }
      
      public function get absCustom() : Array
      {
         return this._absCustom.concat();
      }
      
      public function get absMatrix() : Array
      {
         return this._absMatrix.concat();
      }
      
      public function get targetOwner() : MovieClip
      {
         return this._targetOwner;
      }
      
      public function get firstLevelOwner() : Sprite
      {
         return this._firstLevelOwner;
      }
      
      public function get highestOwner() : Sprite
      {
         return this._highestOwner;
      }
      
      public function get initialTargetTransform() : Transform
      {
         return this._initialTargetTransform;
      }
      
      public function get partialTextOwnerClip() : Sprite
      {
         return this._partialTextOwnerClip;
      }
      
      public function get textOwnerClip() : Sprite
      {
         return this._textOwnerClip;
      }
      
      public function get textField() : TextField
      {
         return this._textField;
      }
      
      public function get textTable() : FeTable
      {
         return this._textTable;
      }
      
      public function get isTransitioning() : Boolean
      {
         return this._isTransitioning;
      }
      
      public function get partialTable() : FeTable
      {
         return this._partialTable;
      }
      
      public function get buttonOwner() : Sprite
      {
         return this._buttonOwner;
      }
      
      public function set isTargetVisibleAtEnd(param1:Boolean) : void
      {
         this._isTargetVisibleAtEnd = param1;
      }
      
      public function get isTargetVisibleAtEnd() : Boolean
      {
         return this._isTargetVisibleAtEnd;
      }
      
      public function set isMouseTriggered(param1:Boolean) : void
      {
         this._isMouseTriggered = param1;
      }
      
      public function get isMouseTriggered() : Boolean
      {
         return this._isMouseTriggered;
      }
      
      public function set drawAfterFilters(param1:Boolean) : void
      {
         if(param1 != this.drawAfterFilters)
         {
            if(param1 == true)
            {
               this.buttonTarget = this.aDBT;
               this.aDBTO.addChild(this.buttonOwner);
            }
            else
            {
               this.buttonTarget = this.bDBT;
               this.bDBTO.addChild(this.buttonOwner);
            }
            if(this.buttonEffect != null)
            {
               this.buttonEffect.target = this.buttonTarget;
            }
         }
         this._drawAfterFilters = param1;
      }
      
      public function get drawAfterFilters() : Boolean
      {
         return this._drawAfterFilters;
      }
      
      override public function set useHandCursor(param1:Boolean) : void
      {
         this._useHandCursor = param1;
         this.highestOwner.buttonMode = param1;
         this.highestOwner.useHandCursor = param1;
         try
         {
            this.target["mouseEnabled"] = !param1;
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      override public function get useHandCursor() : Boolean
      {
         return this._useHandCursor;
      }
      
      public function set ideDataHolder(param1:String) : *
      {
         this._ideDataHolder = param1;
      }
      
      public function get ideDataHolder() : String
      {
         return this._ideDataHolder;
      }
      
      public function set useSwapInsteadHide(param1:Boolean) : void
      {
         this._useSwapInsteadHide = param1;
      }
      
      public function get useSwapInsteadHide() : Boolean
      {
         return this._useSwapInsteadHide;
      }
      
      public function set swapTargetInstanceName(param1:String) : void
      {
         var scope:DisplayObjectContainer = null;
         var paths:Array = null;
         var targName:String = null;
         var i:* = undefined;
         var newTarget:DisplayObject = null;
         var strPath:String = null;
         var existObj:Object = null;
         var arg:String = param1;
         if(arg != "")
         {
            if(this.parent is DisplayObject)
            {
               scope = this.parent;
               paths = arg.split(".");
               targName = paths.pop();
               try
               {
                  i = 0;
                  while(i < paths.length)
                  {
                     scope = scope[paths[i]] as DisplayObjectContainer;
                     i++;
                  }
               }
               catch(e:Error)
               {
                  trace("FLASHEFF2 ERROR: The swapTargetInstanceName path is invalid.");
                  return;
               }
               if(scope != null)
               {
                  newTarget = scope.getChildByName(targName);
                  if(newTarget == null)
                  {
                     strPath = this.getPath(scope);
                     existObj = FlashEff2.targetPaths[strPath + "." + arg];
                     if(existObj != null)
                     {
                        newTarget = existObj.target;
                     }
                  }
                  this.swapTarget = newTarget;
               }
               else
               {
                  trace("FLASHEFF2 ERROR: The swapTargetInstanceName path is invalid.");
               }
            }
            this.__swapTargetInstanceName = arg;
         }
         else
         {
            this.swapTarget = null;
         }
      }
      
      public function get swapTargetInstanceName() : String
      {
         return this.__swapTargetInstanceName;
      }
      
      public function set swapTarget(param1:DisplayObject) : void
      {
         if(param1 != null)
         {
            this._swapTarget = param1;
            param1.visible = this.swapTargetVisibility;
            this._swapTransitionName = param1.name;
         }
         else
         {
            this._swapTarget = null;
            this._swapTransitionName = "";
         }
      }
      
      public function get swapTarget() : DisplayObject
      {
         return this._swapTarget;
      }
      
      public function set swapDelay(param1:Number) : void
      {
         this.__swapDelay = param1;
      }
      
      public function get swapDelay() : Number
      {
         return this.__swapDelay;
      }
      
      public function set swapType(param1:String) : void
      {
         if(param1 == FlashEff2.SWAP_TYPE_HIDE || param1 == FlashEff2.SWAP_TYPE_SHOW || param1 == FlashEff2.SWAP_TYPE_HIDE_AND_SHOW)
         {
            this.__swapType = param1;
         }
      }
      
      public function get swapType() : String
      {
         return this.__swapType;
      }
      
      public function set swapTargetVisibility(param1:Boolean) : void
      {
         this.__swapTargetVisibility = param1;
         if(this.swapTarget != null)
         {
            this.swapTarget.visible = param1;
         }
      }
      
      public function get swapTargetVisibility() : Boolean
      {
         return this.__swapTargetVisibility;
      }
      
      public function set swapTransitionName(param1:String) : void
      {
         var patternClass:Class = null;
         var arg:String = param1;
         if(arg != "")
         {
            try
            {
               patternClass = getDefinitionByName(arg) as Class;
               if(this.swapPattern != null)
               {
                  this.swapPattern.remove();
               }
               this.swapPattern = new patternClass(this);
            }
            catch(e:ReferenceError)
            {
               throw "FLASHEFF2 ERROR: The pattern \'" + arg + "\' is missing from library.";
            }
            this._swapTransitionName = arg;
         }
      }
      
      public function get swapTransitionName() : String
      {
         return this._swapTransitionName;
      }
      
      public function set swapTransition(param1:IFlashEffSymbolText) : void
      {
         if(param1 != null)
         {
            if(this.swapPattern != null)
            {
               this.swapPattern.remove();
            }
            this.swapPattern = param1;
            this._swapTransitionName = String(getQualifiedClassName(param1)).replace("::",".");
         }
      }
      
      public function get swapTransition() : IFlashEffSymbolText
      {
         return this.swapPattern;
      }
      
      public function get currentTransitionType() : String
      {
         return this._cTT;
      }
      
      public function get clearAfterHide() : Boolean
      {
         return this._clearAfterHide;
      }
      
      public function set clearAfterHide(param1:Boolean) : void
      {
         this._clearAfterHide = param1;
      }
      
      public function set isFree(param1:Boolean) : void
      {
      }
      
      public function get isFree() : Boolean
      {
         return false;
      }
      
      public function set toggle(param1:Boolean) : void
      {
         var _loc2_:Boolean = this._toggle;
         this._toggle = param1;
         if(_loc2_ != param1)
         {
            if(param1 == true)
            {
               this.addToGroupList(this.target);
            }
            else
            {
               this.removeFromGroupList(this.target);
            }
         }
      }
      
      public function get toggle() : Boolean
      {
         return this._toggle;
      }
      
      public function get groupName() : String
      {
         return this._groupName;
      }
      
      public function set groupName(param1:String) : void
      {
         this._groupName = param1;
         this.addToGroupList(this.target);
      }
      
      public function get selected() : Boolean
      {
         return this._selected;
      }
      
      public function set selected(param1:Boolean) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:FlashEff2 = null;
         var _loc4_:Point = null;
         if(!this.isInvalid("all"))
         {
            if(param1 == true)
            {
               for(_loc2_ in FlashEff2.groupList)
               {
                  _loc3_ = FlashEff2.groupList[_loc2_] as FlashEff2;
                  if(_loc3_ != this)
                  {
                     if(_loc3_.selected == true)
                     {
                        if(_loc3_.groupName == this.groupName)
                        {
                           _loc3_.selected = false;
                        }
                     }
                  }
               }
            }
         }
         this._selected = param1;
         if(this.buttonEffect != null)
         {
            this.buttonEffect["selected"] = param1;
         }
         if(!this.isInvalid("all"))
         {
            if(this.buttonEffect != null)
            {
               _loc4_ = new Point(this.mouseX,this.mouseY);
               _loc4_ = this.localToGlobal(_loc4_);
               if(this.highestOwner.hitTestPoint(_loc4_.x,_loc4_.y,true))
               {
                  this.buttonRollOver();
               }
               else
               {
                  this.buttonRollOut();
               }
            }
         }
      }
      
      public function removeFromGroupList(param1:DisplayObject) : void
      {
         var _loc2_:* = undefined;
         for(_loc2_ in groupList)
         {
            if((groupList[_loc2_] as FlashEff2).target == param1)
            {
               groupList.splice(_loc2_,1);
            }
         }
      }
      
      public function getNumGroupButtons(param1:String = "") : uint
      {
         var _loc3_:* = undefined;
         if(param1 == "")
         {
            param1 = this._groupName;
         }
         var _loc2_:uint = 0;
         for(_loc3_ in groupList)
         {
            if((groupList[_loc3_] as FlashEff2).groupName == param1)
            {
               _loc2_++;
            }
         }
         return _loc2_;
      }
   }
}
