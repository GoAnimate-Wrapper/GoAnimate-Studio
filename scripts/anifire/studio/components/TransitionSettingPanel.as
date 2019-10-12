package anifire.studio.components
{
   import anifire.assets.transition.AssetTransitionConstants;
   import anifire.component.widgets.FillIconWidget;
   import anifire.component.widgets.RepeatIconWidget;
   import anifire.component.widgets.WidgetConstants;
   import anifire.event.WidgetEvent;
   import anifire.studio.assets.commands.ChangeDelayCommand;
   import anifire.studio.assets.commands.ChangeDestinationCommand;
   import anifire.studio.assets.commands.ChangeDirectionCommand;
   import anifire.studio.assets.commands.ChangeDurationCommand;
   import anifire.studio.assets.commands.ChangeSectionCommand;
   import anifire.studio.assets.commands.ChangeTimingCommand;
   import anifire.studio.assets.commands.ChangeTransitionCollectionDelayCommand;
   import anifire.studio.assets.commands.ChangeTransitionCollectionDestinationCommand;
   import anifire.studio.assets.commands.ChangeTransitionCollectionDurationCommand;
   import anifire.studio.assets.commands.ChangeTransitionCollectionSectionCommand;
   import anifire.studio.assets.commands.ChangeTransitionCollectionTimingCommand;
   import anifire.studio.assets.commands.ChangeTransitionCollectionTypeCommand;
   import anifire.studio.assets.commands.ChangeTypeCommand;
   import anifire.studio.assets.commands.ChangeWhiteboardHandCommand;
   import anifire.studio.assets.interfaces.IDestination;
   import anifire.studio.assets.models.AssetTransition;
   import anifire.studio.assets.models.HandDrawnTransitionSetting;
   import anifire.studio.commands.ChangeMovieWhiteboardHandCommand;
   import anifire.studio.commands.ChangeWidgetIconDirectionCommand;
   import anifire.studio.commands.ICommand;
   import anifire.studio.core.Asset;
   import anifire.studio.core.Console;
   import anifire.studio.core.Widget;
   import anifire.studio.models.MenuItemModel;
   import anifire.studio.skins.AssetTransitionDestinationDropDownListSkin;
   import anifire.studio.skins.CharacterMovementTipButtonSkin;
   import anifire.studio.skins.TransitionStyleListSkin;
   import anifire.studio.skins.WhiteboardHandButtonSkin;
   import anifire.studio.skins.WidgetIconDirectionDropDownListSkin;
   import anifire.studio.utils.WidgetIconDirectionIcons;
   import anifire.util.UtilDict;
   import anifire.util.UtilUnitConvert;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.collections.ArrayCollection;
   import mx.collections.IList;
   import mx.controls.Spacer;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.FlexGlobals;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import spark.components.Button;
   import spark.components.Form;
   import spark.components.FormItem;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.List;
   import spark.components.supportClasses.ItemRenderer;
   import spark.events.IndexChangeEvent;
   import spark.events.ListEvent;
   import spark.events.PopUpEvent;
   import spark.layouts.FormLayout;
   import spark.layouts.HorizontalLayout;
   
   use namespace mx_internal;
   
   public class TransitionSettingPanel extends Group implements IBindingClient
   {
      
      private static const ACTION_NAME_PREFIX:String = "Action:";
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _TransitionSettingPanel_Button1:Button;
      
      public var _TransitionSettingPanel_FormItem2:FormItem;
      
      public var _TransitionSettingPanel_FormItem3:FormItem;
      
      public var _TransitionSettingPanel_HGroup1:HGroup;
      
      public var _TransitionSettingPanel_Label1:Label;
      
      public var _TransitionSettingPanel_Label2:Label;
      
      private var _139615182delayStepper:NumericStepper;
      
      private var _1762807348destinationList:anifire.studio.components.DropDownList;
      
      private var _530164547directionList:spark.components.DropDownList;
      
      private var _45858147durationStepper:NumericStepper;
      
      private var _1686770884iconDirectionList:anifire.studio.components.DropDownList;
      
      private var _383827442optionDelay:FormItem;
      
      private var _953068918optionDirection:FormItem;
      
      private var _86504745optionDuration:HGroup;
      
      private var _1818605159previewContainer:spark.components.PopUpAnchor;
      
      private var _574597411sectionList:spark.components.DropDownList;
      
      private var _502431124settingPanel:Form;
      
      private var _808181768timingList:spark.components.DropDownList;
      
      private var _1283806387transitionPreview:TransitionPreview;
      
      private var _676559112typeList:spark.components.DropDownList;
      
      private var _1452975294whiteboardHandButton:Button;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _transition:AssetTransition;
      
      private var _selectedTransitionCollection:Vector.<AssetTransition>;
      
      private var _command:ICommand;
      
      private var _showAllSections:Boolean;
      
      private var _338926188_typeSource:ArrayCollection;
      
      private var _349435491_typeSourceMovement:ArrayCollection;
      
      private var _562878011_directionSource:ArrayCollection;
      
      private var _1671089892_timingSource:ArrayCollection;
      
      private var _1598020177_timingSourceForEnterExit:ArrayCollection;
      
      private var _1409909996_timingSourceForMovement:ArrayCollection;
      
      private var _1433303575_selectedTimingItem:Object;
      
      private var _1854874977_sectionSource:ArrayCollection;
      
      private var _sectionLookup:Object;
      
      private var _1867333814_destinationSource:ArrayCollection;
      
      private var _timingMenuModel:ArrayCollection;
      
      private var _whiteboardHandPopUp:WhiteboardHandPopUp;
      
      private var _iconDirectionLookup:Object;
      
      private var _fillIconDirectionSource:ArrayCollection;
      
      private var _repeatIconDirectionSource:ArrayCollection;
      
      private var _asset:Asset;
      
      private var _widget:Widget;
      
      private var _1354975360_actionName:String;
      
      private var _634302173_showActionName:Boolean;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function TransitionSettingPanel()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._338926188_typeSource = new ArrayCollection(AssetTransitionConstants.types);
         this._349435491_typeSourceMovement = new ArrayCollection([{
            "id":AssetTransitionConstants.TYPE_MOTION_PATH,
            "label":AssetTransitionConstants.getTypeLabel(AssetTransitionConstants.TYPE_MOTION_PATH)
         }]);
         this._562878011_directionSource = new ArrayCollection(AssetTransitionConstants.directions);
         this._1671089892_timingSource = new ArrayCollection(AssetTransitionConstants.timings);
         this._1598020177_timingSourceForEnterExit = new ArrayCollection(AssetTransitionConstants.timings);
         this._1409909996_timingSourceForMovement = new ArrayCollection(AssetTransitionConstants.timingsForMovement);
         this._sectionLookup = {};
         this._1867333814_destinationSource = getDestinationSource();
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._TransitionSettingPanel_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_TransitionSettingPanelWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return TransitionSettingPanel[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._TransitionSettingPanel_Form1_i(),this._TransitionSettingPanel_PopUpAnchor1_i()];
         this.addEventListener("creationComplete",this.___TransitionSettingPanel_Group1_creationComplete);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      private static function getDestinationSource() : ArrayCollection
      {
         var _loc1_:ArrayCollection = new ArrayCollection();
         _loc1_.addItem(AssetTransitionConstants.DEST_TL);
         _loc1_.addItem(AssetTransitionConstants.DEST_TOP);
         _loc1_.addItem(AssetTransitionConstants.DEST_TR);
         _loc1_.addItem(AssetTransitionConstants.DEST_LEFT);
         _loc1_.addItem(AssetTransitionConstants.DEST_RIGHT);
         _loc1_.addItem(AssetTransitionConstants.DEST_BL);
         _loc1_.addItem(AssetTransitionConstants.DEST_BOTTOM);
         _loc1_.addItem(AssetTransitionConstants.DEST_BR);
         return _loc1_;
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         TransitionSettingPanel._watcherSetupUtil = param1;
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
      
      private function set widget(param1:Widget) : void
      {
         if(this._widget != param1)
         {
            if(this._widget)
            {
               this._widget.removeEventListener(WidgetEvent.WIDGET_SWAP_COMPLETE,this.widget_swapCompleteHandler);
               this._widget.removeEventListener(WidgetEvent.WIDGET_OPTION_CHANGE,this.widget_optionChangeHandler);
            }
            this._widget = param1;
            if(this._widget)
            {
               this._widget.addEventListener(WidgetEvent.WIDGET_SWAP_COMPLETE,this.widget_swapCompleteHandler);
               this._widget.addEventListener(WidgetEvent.WIDGET_OPTION_CHANGE,this.widget_optionChangeHandler);
            }
         }
      }
      
      public function set transition(param1:AssetTransition) : void
      {
         if(param1)
         {
            this._selectedTransitionCollection = null;
         }
         if(this._transition != param1)
         {
            this._asset = null;
            if(this._transition)
            {
               this._transition.removeEventListener(Event.CHANGE,this.transition_changeHandler);
            }
            this._transition = param1;
            if(this._transition)
            {
               this._asset = Console.getConsole().currentScene.getAssetById(this._transition.assetId);
               this.widget = this._asset as Widget;
               this.updateUI();
               this._transition.addEventListener(Event.CHANGE,this.transition_changeHandler);
            }
         }
      }
      
      public function set selectedTransitionCollection(param1:Vector.<AssetTransition>) : void
      {
         if(param1 && param1.length == 1)
         {
            this.transition = param1[0];
            this._selectedTransitionCollection = null;
         }
         else
         {
            this.transition = null;
            this._selectedTransitionCollection = param1;
         }
         this.updateUI();
      }
      
      public function set showAllSections(param1:Boolean) : void
      {
         if(this._showAllSections != param1)
         {
            this._showAllSections = param1;
            this.updateUI();
         }
      }
      
      private function transition_changeHandler(param1:Event) : void
      {
         this.updateUI();
      }
      
      public function set types(param1:Array) : void
      {
         if(param1)
         {
            this._typeSource = new ArrayCollection(param1);
         }
      }
      
      public function set directions(param1:Array) : void
      {
         if(param1)
         {
            this._directionSource = new ArrayCollection(param1);
         }
      }
      
      private function updateUIForTransitionVector() : void
      {
         var _loc1_:uint = 0;
         var _loc2_:AssetTransition = null;
         var _loc3_:String = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:String = null;
         var _loc11_:int = 0;
         var _loc12_:Boolean = false;
         var _loc13_:Boolean = false;
         var _loc14_:Boolean = false;
         var _loc15_:Boolean = false;
         var _loc16_:Boolean = false;
         var _loc17_:Boolean = false;
         var _loc18_:Boolean = false;
         if(this._selectedTransitionCollection && this._selectedTransitionCollection.length > 0)
         {
            _loc1_ = 0;
            _loc3_ = this._selectedTransitionCollection[0].type;
            _loc4_ = this._selectedTransitionCollection[0].timing;
            _loc5_ = this._selectedTransitionCollection[0].direction;
            _loc6_ = this._selectedTransitionCollection[0].duration;
            _loc7_ = this._selectedTransitionCollection[0].delay;
            _loc8_ = -1;
            _loc9_ = this._selectedTransitionCollection[0].section;
            _loc10_ = this._selectedTransitionCollection[0].characterActionName;
            _loc11_ = -1;
            _loc12_ = true;
            _loc13_ = true;
            _loc14_ = true;
            _loc15_ = true;
            _loc17_ = true;
            _loc1_ = 0;
            while(_loc1_ < this._selectedTransitionCollection.length)
            {
               _loc2_ = this._selectedTransitionCollection[_loc1_] as AssetTransition;
               if(_loc3_ && _loc3_ != _loc2_.type)
               {
                  _loc3_ = "";
               }
               if(_loc4_ >= 0 && _loc4_ != _loc2_.timing)
               {
                  _loc4_ = -1;
               }
               if(_loc5_ >= 0 && _loc5_ != _loc2_.direction)
               {
                  _loc5_ = -1;
               }
               if(_loc6_ >= 0 && _loc6_ != _loc2_.duration)
               {
                  _loc6_ = -1;
               }
               if(_loc7_ >= 0 && _loc7_ != _loc2_.delay)
               {
                  _loc7_ = -1;
               }
               if(_loc9_ >= 0 && _loc9_ != _loc2_.section)
               {
                  _loc9_ = -1;
               }
               if(_loc10_ && _loc10_ != _loc2_.characterActionName)
               {
                  _loc10_ = null;
               }
               if(_loc12_ && !_loc2_.supportCustomDuration)
               {
                  _loc12_ = false;
               }
               if(_loc13_)
               {
                  if(_loc2_.setting is IDestination)
                  {
                     _loc11_ = IDestination(_loc2_.setting).destination;
                     if(_loc2_.direction == AssetTransitionConstants.DIRECTION_IN)
                     {
                        _loc11_ = 10 - _loc11_;
                     }
                     if(_loc8_ >= 0)
                     {
                        if(_loc8_ != _loc11_)
                        {
                           _loc8_ = -1;
                        }
                     }
                     else
                     {
                        _loc8_ = _loc11_;
                     }
                  }
                  else
                  {
                     _loc13_ = false;
                     _loc8_ = -1;
                  }
               }
               if(_loc2_.direction == AssetTransitionConstants.DIRECTION_MOVEMENT)
               {
                  _loc16_ = true;
               }
               else
               {
                  _loc14_ = false;
               }
               if(!_loc2_.characterActionName)
               {
                  _loc15_ = false;
               }
               if(_loc2_.section != AssetTransitionConstants.TIMING_WHOLE_SCENE)
               {
                  _loc17_ = false;
               }
               else
               {
                  _loc18_ = true;
               }
               _loc1_++;
            }
            if(_loc18_)
            {
               _loc6_ = -1;
               _loc7_ = -1;
            }
            this._showActionName = false;
            if(_loc16_)
            {
               if(_loc14_)
               {
                  if(_loc15_)
                  {
                     this._showActionName = true;
                     if(_loc10_)
                     {
                        this._actionName = UtilDict.translate(ACTION_NAME_PREFIX) + " " + _loc10_;
                     }
                     else
                     {
                        this._actionName = "";
                     }
                  }
                  else
                  {
                     this.typeList.dataProvider = this._typeSourceMovement;
                     this.typeList.selectedIndex = 0;
                  }
               }
               else
               {
                  this.typeList.selectedIndex = -1;
                  this.typeList.dataProvider = this._typeSource;
               }
               this.typeListEnabled = false;
            }
            else
            {
               this.typeListEnabled = true;
               this.typeList.dataProvider = this._typeSource;
               if(_loc3_)
               {
                  _loc1_ = 0;
                  while(_loc1_ < this._typeSource.length)
                  {
                     if(this._typeSource[_loc1_].id == _loc3_)
                     {
                        this.typeList.selectedIndex = _loc1_;
                        break;
                     }
                     _loc1_++;
                  }
               }
               else
               {
                  this.typeList.selectedIndex = -1;
               }
            }
            if(_loc5_ >= 0)
            {
               _loc1_ = 0;
               while(_loc1_ < this._directionSource.length)
               {
                  if(this._directionSource[_loc1_].id == _loc5_)
                  {
                     this.directionList.selectedIndex = _loc1_;
                     break;
                  }
                  _loc1_++;
               }
            }
            else
            {
               this.directionList.selectedIndex = -1;
            }
            this.directionListEnabled = false;
            this.timingSource = !!_loc14_?this._timingSourceForMovement:this._timingSourceForEnterExit;
            if(_loc18_)
            {
               if(_loc17_)
               {
                  _loc4_ = AssetTransitionConstants.TIMING_WHOLE_SCENE;
               }
               else
               {
                  _loc4_ = -1;
               }
            }
            if(_loc4_ >= 0)
            {
               _loc1_ = 0;
               while(_loc1_ < this._timingSource.length)
               {
                  if(this._timingSource[_loc1_].id == _loc4_)
                  {
                     this._selectedTimingItem = this._timingSource[_loc1_];
                     break;
                  }
                  _loc1_++;
               }
            }
            else
            {
               this._selectedTimingItem = null;
            }
            if(_loc6_ >= 0)
            {
               this.durationStepper.useUndefinedFormat = false;
               this.durationStepper.value = UtilUnitConvert.frameToDuration(_loc6_);
            }
            else
            {
               this.durationStepper.useUndefinedFormat = true;
               this.durationStepper.value = 1;
            }
            this.durationStepper.enabled = _loc12_;
            if(_loc7_ >= 0)
            {
               this.delayStepper.useUndefinedFormat = false;
               this.delayStepper.value = UtilUnitConvert.frameToDuration(_loc7_);
            }
            else
            {
               this.delayStepper.useUndefinedFormat = true;
               this.delayStepper.value = 0;
            }
            this.delayStepper.enabled = !_loc18_;
            if(_loc18_)
            {
               this.sectionList.visible = false;
            }
            else
            {
               if(_loc9_ >= 0)
               {
                  this.sectionList.selectedItem = this._sectionLookup[_loc9_];
               }
               else
               {
                  this.sectionList.selectedItem = -1;
               }
               this.sectionList.visible = this._showAllSections;
            }
            this.iconDirectionList.visible = false;
            this.iconDirectionList.includeInLayout = false;
            this.whiteboardHandButton.visible = false;
            this.whiteboardHandButton.includeInLayout = false;
            if(_loc13_)
            {
               this.destinationList.selectedItem = _loc8_;
               this.destinationList.visible = true;
               this.destinationList.includeInLayout = true;
            }
            else
            {
               this.destinationList.selectedIndex = -1;
               this.destinationList.visible = false;
               this.destinationList.includeInLayout = false;
            }
         }
      }
      
      private function updateIconDirectionList() : void
      {
         if(this._widget.chartType == "fillIcon")
         {
            this.iconDirectionList.dataProvider = this._fillIconDirectionSource;
         }
         else
         {
            this.iconDirectionList.dataProvider = this._repeatIconDirectionSource;
         }
      }
      
      private function updateIconDirectionListSelection() : void
      {
         var _loc1_:String = this._widget.iconDirection;
         if(_loc1_ == null || _loc1_ == "")
         {
            if(this._widget.chartType == WidgetConstants.CHART_TYPE_FILL_ICON)
            {
               _loc1_ = FillIconWidget.DEFAULT_ICON_DIRECTION;
            }
            else
            {
               _loc1_ = RepeatIconWidget.DEFAULT_ICON_DIRECTION;
            }
         }
         this.iconDirectionList.selectedItem = this._iconDirectionLookup[_loc1_];
      }
      
      private function updateUI() : void
      {
         var _loc1_:uint = 0;
         var _loc2_:* = false;
         var _loc3_:* = false;
         if(this._selectedTransitionCollection)
         {
            this.updateUIForTransitionVector();
         }
         else if(this._transition)
         {
            _loc1_ = 0;
            _loc2_ = this._transition.section == AssetTransitionConstants.TIMING_WHOLE_SCENE;
            _loc3_ = this._transition.direction == AssetTransitionConstants.DIRECTION_MOVEMENT;
            if(_loc3_ && this._transition.characterActionName)
            {
               this._showActionName = true;
               this._actionName = UtilDict.translate(ACTION_NAME_PREFIX) + " " + this._transition.characterActionName;
            }
            else
            {
               this._showActionName = false;
               if(_loc3_)
               {
                  this.typeList.dataProvider = this._typeSourceMovement;
                  this.typeList.selectedIndex = 0;
                  this.typeListEnabled = false;
               }
               else
               {
                  this.typeList.dataProvider = this._typeSource;
                  this.typeListEnabled = true;
               }
               _loc1_ = 0;
               while(_loc1_ < this._typeSource.length)
               {
                  if(this._typeSource[_loc1_].id == this._transition.type)
                  {
                     this.typeList.selectedIndex = _loc1_;
                     break;
                  }
                  _loc1_++;
               }
            }
            if(this._widget && this._widget.isIconType && this._transition.isWidgetTransition)
            {
               this.updateIconDirectionList();
               this.updateIconDirectionListSelection();
               this.iconDirectionList.visible = true;
               this.iconDirectionList.includeInLayout = true;
            }
            else
            {
               this.iconDirectionList.visible = false;
               this.iconDirectionList.includeInLayout = false;
            }
            _loc1_ = 0;
            while(_loc1_ < this._directionSource.length)
            {
               if(this._directionSource[_loc1_].id == this._transition.direction)
               {
                  this.directionList.selectedIndex = _loc1_;
                  break;
               }
               _loc1_++;
            }
            this.directionListEnabled = !_loc2_ && this._directionSource.length > 1;
            this.timingSource = !!_loc3_?this._timingSourceForMovement:this._timingSourceForEnterExit;
            if(_loc2_)
            {
               _loc1_ = 0;
               while(_loc1_ < this._timingSource.length)
               {
                  if(this._timingSource[_loc1_].id == this._transition.section)
                  {
                     this._selectedTimingItem = this._timingSource[_loc1_];
                     break;
                  }
                  _loc1_++;
               }
            }
            else
            {
               _loc1_ = 0;
               while(_loc1_ < this._timingSource.length)
               {
                  if(this._timingSource[_loc1_].id == this._transition.timing)
                  {
                     this._selectedTimingItem = this._timingSource[_loc1_];
                     break;
                  }
                  _loc1_++;
               }
            }
            this.sectionList.selectedItem = !!_loc2_?-1:this._sectionLookup[this._transition.section];
            this.sectionList.visible = !_loc2_ && this._showAllSections;
            if(_loc2_)
            {
               this.durationStepper.useUndefinedFormat = true;
               this.durationStepper.enabled = false;
               this.durationStepper.value = 0;
            }
            else
            {
               this.durationStepper.useUndefinedFormat = false;
               this.durationStepper.enabled = this._transition.supportCustomDuration;
               this.durationStepper.value = UtilUnitConvert.frameToDuration(this._transition.duration);
            }
            if(_loc2_)
            {
               this.delayStepper.useUndefinedFormat = true;
               this.delayStepper.value = 0;
               this.delayStepper.enabled = false;
            }
            else
            {
               this.delayStepper.useUndefinedFormat = false;
               this.delayStepper.value = UtilUnitConvert.frameToDuration(this._transition.delay);
               this.delayStepper.enabled = true;
            }
            if(this._transition.setting is IDestination)
            {
               if(this._transition.direction == AssetTransitionConstants.DIRECTION_IN)
               {
                  this.destinationList.selectedItem = 10 - IDestination(this._transition.setting).destination;
               }
               else
               {
                  this.destinationList.selectedItem = IDestination(this._transition.setting).destination;
               }
               this.destinationList.visible = true;
               this.destinationList.includeInLayout = true;
            }
            else
            {
               this.destinationList.visible = false;
               this.destinationList.includeInLayout = false;
            }
            if(this._transition.setting is HandDrawnTransitionSetting)
            {
               this.whiteboardHandButton.visible = true;
               this.whiteboardHandButton.includeInLayout = true;
            }
            else
            {
               this.whiteboardHandButton.visible = false;
               this.whiteboardHandButton.includeInLayout = false;
            }
         }
      }
      
      private function set typeListEnabled(param1:Boolean) : void
      {
         if(this.typeList.enabled != param1)
         {
            this.typeList.enabled = param1;
         }
      }
      
      private function set directionListEnabled(param1:Boolean) : void
      {
         if(this.directionList.enabled != param1)
         {
            this.directionList.enabled = param1;
         }
      }
      
      private function set timingSource(param1:ArrayCollection) : void
      {
         if(this._timingSource != param1)
         {
            this._timingSource = param1;
         }
      }
      
      private function typeList_changeHandler(param1:IndexChangeEvent) : void
      {
         var _loc2_:List = param1.target as List;
         if(_loc2_.selectedItem)
         {
            if(this._selectedTransitionCollection)
            {
               this._command = new ChangeTransitionCollectionTypeCommand(this._selectedTransitionCollection,_loc2_.selectedItem.id);
               this._command.execute();
               this.updateUIForTransitionVector();
            }
            else if(this._transition)
            {
               this._command = new ChangeTypeCommand(this._transition,_loc2_.selectedItem.id);
               this._command.execute();
            }
         }
      }
      
      private function directionList_changeHandler(param1:IndexChangeEvent) : void
      {
         var _loc2_:List = param1.target as List;
         if(_loc2_.selectedItem)
         {
            this._command = new ChangeDirectionCommand(this._transition,_loc2_.selectedItem.id);
            this._command.execute();
         }
      }
      
      private function sectionList_changeHandler(param1:IndexChangeEvent) : void
      {
         var _loc2_:List = param1.target as List;
         var _loc3_:MenuItemModel = this.sectionList.selectedItem as MenuItemModel;
         if(_loc3_)
         {
            if(this._selectedTransitionCollection)
            {
               this._command = new ChangeTransitionCollectionSectionCommand(this._selectedTransitionCollection,_loc3_.value);
               this._command.execute();
            }
            else if(this._transition)
            {
               this._command = new ChangeSectionCommand(this._transition,_loc3_.value);
               this._command.execute();
            }
         }
      }
      
      private function timingList_changeHandler(param1:IndexChangeEvent) : void
      {
         var _loc2_:List = param1.target as List;
         if(_loc2_)
         {
            callLater(this.changeTiming,[_loc2_.selectedItem.id]);
         }
      }
      
      private function changeTiming(param1:uint) : void
      {
         if(this._selectedTransitionCollection)
         {
            this._command = new ChangeTransitionCollectionTimingCommand(this._selectedTransitionCollection,param1);
            this._command.execute();
         }
         else if(this._transition)
         {
            this._command = new ChangeTimingCommand(this._transition,param1);
            this._command.execute();
         }
      }
      
      private function durationStepper_changeHandler(param1:Event) : void
      {
         var _loc2_:ICommand = null;
         var _loc4_:AssetTransition = null;
         this.durationStepper.useUndefinedFormat = false;
         var _loc3_:int = UtilUnitConvert.durationToFrame(this.durationStepper.value);
         if(this._selectedTransitionCollection)
         {
            for each(_loc4_ in this._selectedTransitionCollection)
            {
               _loc4_.duration = _loc3_;
            }
         }
         else if(this._transition)
         {
            this._transition.duration = _loc3_;
         }
      }
      
      private function delayStepper_changeHandler(param1:Event) : void
      {
         var _loc2_:ICommand = null;
         var _loc4_:AssetTransition = null;
         this.delayStepper.useUndefinedFormat = false;
         var _loc3_:int = UtilUnitConvert.durationToFrame(this.delayStepper.value);
         if(this._selectedTransitionCollection)
         {
            for each(_loc4_ in this._selectedTransitionCollection)
            {
               _loc4_.delay = _loc3_;
            }
         }
         else if(this._transition)
         {
            this._transition.delay = _loc3_;
         }
      }
      
      private function destinationList_changeHandler(param1:IndexChangeEvent) : void
      {
         var _loc2_:List = param1.target as List;
         if(_loc2_.selectedItem)
         {
            if(this._selectedTransitionCollection)
            {
               this._command = new ChangeTransitionCollectionDestinationCommand(this._selectedTransitionCollection,_loc2_.selectedItem);
               this._command.execute();
            }
            else if(this._transition)
            {
               this._command = new ChangeDestinationCommand(this._transition,_loc2_.selectedItem);
               this._command.execute();
            }
         }
      }
      
      protected function creationCompleteHandler() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:MenuItemModel = null;
         this._timingMenuModel = new ArrayCollection();
         this._timingMenuModel.addItem(new MenuItemModel(UtilDict.toDisplay("go","whole scene"),"whole scene",MenuItemModel.MENU_TYPE_RADIO));
         this._timingMenuModel.addItem(new MenuItemModel(UtilDict.toDisplay("go","custom duration"),"custom duration",MenuItemModel.MENU_TYPE_RADIO));
         this._sectionSource = new ArrayCollection();
         this._sectionSource.addItem(new MenuItemModel(UtilDict.toDisplay("go","before narration"),AssetTransitionConstants.TIMING_BEFORE_NARRATION));
         this._sectionSource.addItem(new MenuItemModel(UtilDict.toDisplay("go","with narration"),AssetTransitionConstants.TIMING_WITH_NARRATION));
         this._sectionSource.addItem(new MenuItemModel(UtilDict.toDisplay("go","after narration"),AssetTransitionConstants.TIMING_AFTER_NARRATION));
         this._sectionLookup = {};
         _loc2_ = this._sectionSource.length;
         _loc1_ = 0;
         while(_loc1_ < _loc2_)
         {
            _loc3_ = this._sectionSource[_loc1_] as MenuItemModel;
            this._sectionLookup[_loc3_.value] = _loc3_;
            _loc1_++;
         }
         if(this._transition)
         {
            this.sectionList.selectedItem = this._sectionLookup[this._transition.section];
         }
         this._iconDirectionLookup = {};
         this._fillIconDirectionSource = new ArrayCollection();
         this._fillIconDirectionSource.addItem(new MenuItemModel("",FillIconWidget.ICON_DIRECTION_BOTTOM_TOP,MenuItemModel.MENU_TYPE_NORMAL,null,WidgetIconDirectionIcons.BOTTOM_TOP));
         this._fillIconDirectionSource.addItem(new MenuItemModel("",FillIconWidget.ICON_DIRECTION_TOP_BOTTOM,MenuItemModel.MENU_TYPE_NORMAL,null,WidgetIconDirectionIcons.TOP_BOTTOM));
         this._fillIconDirectionSource.addItem(new MenuItemModel("","",MenuItemModel.MENU_TYPE_SEPARATOR));
         this._fillIconDirectionSource.addItem(new MenuItemModel("",FillIconWidget.ICON_DIRECTION_RIGHT_LEFT,MenuItemModel.MENU_TYPE_NORMAL,null,WidgetIconDirectionIcons.RIGHT_LEFT));
         this._fillIconDirectionSource.addItem(new MenuItemModel("",FillIconWidget.ICON_DIRECTION_LEFT_RIGHT,MenuItemModel.MENU_TYPE_NORMAL,null,WidgetIconDirectionIcons.LEFT_RIGHT));
         this._fillIconDirectionSource.addItem(new MenuItemModel("","",MenuItemModel.MENU_TYPE_SEPARATOR));
         this._fillIconDirectionSource.addItem(new MenuItemModel("",FillIconWidget.ICON_DIRECTION_TO_TOP_RIGHT,MenuItemModel.MENU_TYPE_NORMAL,null,WidgetIconDirectionIcons.TO_TOP_RIGHT));
         this._fillIconDirectionSource.addItem(new MenuItemModel("",FillIconWidget.ICON_DIRECTION_TO_BOTTOM_RIGHT,MenuItemModel.MENU_TYPE_NORMAL,null,WidgetIconDirectionIcons.TO_BOTTOM_RIGHT));
         this._fillIconDirectionSource.addItem(new MenuItemModel("","",MenuItemModel.MENU_TYPE_SEPARATOR));
         this._fillIconDirectionSource.addItem(new MenuItemModel("",FillIconWidget.ICON_DIRECTION_TO_BOTTOM_LEFT,MenuItemModel.MENU_TYPE_NORMAL,null,WidgetIconDirectionIcons.TO_BOTTOM_LEFT));
         this._fillIconDirectionSource.addItem(new MenuItemModel("",FillIconWidget.ICON_DIRECTION_TO_TOP_LEFT,MenuItemModel.MENU_TYPE_NORMAL,null,WidgetIconDirectionIcons.TO_TOP_LEFT));
         _loc2_ = this._fillIconDirectionSource.length;
         _loc1_ = 0;
         while(_loc1_ < _loc2_)
         {
            _loc3_ = this._fillIconDirectionSource[_loc1_] as MenuItemModel;
            if(_loc3_.menuType == MenuItemModel.MENU_TYPE_NORMAL)
            {
               this._iconDirectionLookup[_loc3_.value] = _loc3_;
            }
            _loc1_++;
         }
         this._repeatIconDirectionSource = new ArrayCollection();
         this._repeatIconDirectionSource.addItem(new MenuItemModel(UtilDict.toDisplay("go","Top left - right"),RepeatIconWidget.ICON_DIRECTION_TOP_LEFT_RIGHT,MenuItemModel.MENU_TYPE_NORMAL,null,WidgetIconDirectionIcons.TOP_LEFT_RIGHT));
         this._repeatIconDirectionSource.addItem(new MenuItemModel(UtilDict.toDisplay("go","Top left - down"),RepeatIconWidget.ICON_DIRECTION_TOP_LEFT_DOWN,MenuItemModel.MENU_TYPE_NORMAL,null,WidgetIconDirectionIcons.TOP_LEFT_BOTTOM));
         this._repeatIconDirectionSource.addItem(new MenuItemModel(UtilDict.toDisplay("go","Top right - left"),RepeatIconWidget.ICON_DIRECTION_TOP_RIGHT_LEFT,MenuItemModel.MENU_TYPE_NORMAL,null,WidgetIconDirectionIcons.TOP_RIGHT_LEFT));
         this._repeatIconDirectionSource.addItem(new MenuItemModel(UtilDict.toDisplay("go","Top right - down"),RepeatIconWidget.ICON_DIRECTION_TOP_RIGHT_DOWN,MenuItemModel.MENU_TYPE_NORMAL,null,WidgetIconDirectionIcons.TOP_RIGHT_BOTTOM));
         this._repeatIconDirectionSource.addItem(new MenuItemModel(UtilDict.toDisplay("go","Bottom left - up"),RepeatIconWidget.ICON_DIRECTION_BOTTOM_LEFT_UP,MenuItemModel.MENU_TYPE_NORMAL,null,WidgetIconDirectionIcons.BOTTOM_LEFT_UP));
         this._repeatIconDirectionSource.addItem(new MenuItemModel(UtilDict.toDisplay("go","Bottom left - right"),RepeatIconWidget.ICON_DIRECTION_BOTTOM_LEFT_RIGHT,MenuItemModel.MENU_TYPE_NORMAL,null,WidgetIconDirectionIcons.BOTTOM_LEFT_RIGHT));
         this._repeatIconDirectionSource.addItem(new MenuItemModel(UtilDict.toDisplay("go","Bottom right - up"),RepeatIconWidget.ICON_DIRECTION_BOTTOM_RIGHT_UP,MenuItemModel.MENU_TYPE_NORMAL,null,WidgetIconDirectionIcons.BOTTOM_RIGHT_UP));
         this._repeatIconDirectionSource.addItem(new MenuItemModel(UtilDict.toDisplay("go","Bottom right - left"),RepeatIconWidget.ICON_DIRECTION_BOTTOM_RIGHT_LEFT,MenuItemModel.MENU_TYPE_NORMAL,null,WidgetIconDirectionIcons.BOTTOM_RIGHT_LEFT));
         _loc2_ = this._repeatIconDirectionSource.length;
         _loc1_ = 0;
         while(_loc1_ < _loc2_)
         {
            _loc3_ = this._repeatIconDirectionSource[_loc1_] as MenuItemModel;
            if(_loc3_.menuType == MenuItemModel.MENU_TYPE_NORMAL)
            {
               this._iconDirectionLookup[_loc3_.value] = _loc3_;
            }
            _loc1_++;
         }
      }
      
      private function durationStepper_buttonPressHandler(param1:Event) : void
      {
         if(this._selectedTransitionCollection)
         {
            this._command = new ChangeTransitionCollectionDurationCommand(this._selectedTransitionCollection,UtilUnitConvert.durationToFrame(this.durationStepper.value));
         }
         else if(this._transition)
         {
            this._command = new ChangeDurationCommand(this._transition,UtilUnitConvert.durationToFrame(this.durationStepper.value));
         }
      }
      
      private function durationStepper_buttonReleaseHandler(param1:Event) : void
      {
         if(this._command is ChangeTransitionCollectionDurationCommand)
         {
            (this._command as ChangeTransitionCollectionDurationCommand).executeNow(UtilUnitConvert.durationToFrame(this.durationStepper.value));
         }
         else if(this._command is ChangeDurationCommand)
         {
            (this._command as ChangeDurationCommand).executeNow(UtilUnitConvert.durationToFrame(this.durationStepper.value));
         }
      }
      
      private function delayStepper_buttonPressHandler(param1:Event) : void
      {
         if(this._selectedTransitionCollection)
         {
            this._command = new ChangeTransitionCollectionDelayCommand(this._selectedTransitionCollection,UtilUnitConvert.durationToFrame(this.delayStepper.value));
         }
         else if(this._transition)
         {
            this._command = new ChangeDelayCommand(this._transition,UtilUnitConvert.durationToFrame(this.delayStepper.value));
         }
      }
      
      private function delayStepper_buttonReleaseHandler(param1:Event) : void
      {
         if(this._command is ChangeTransitionCollectionDelayCommand)
         {
            (this._command as ChangeTransitionCollectionDelayCommand).executeNow(UtilUnitConvert.durationToFrame(this.delayStepper.value));
         }
         else if(this._command is ChangeDelayCommand)
         {
            (this._command as ChangeDelayCommand).executeNow(UtilUnitConvert.durationToFrame(this.delayStepper.value));
         }
      }
      
      private function onMouseOverEffect(param1:ListEvent) : void
      {
         this.showTransPreview(param1.itemRenderer as ItemRenderer);
      }
      
      private function hideTransPreview() : void
      {
         this.previewContainer.displayPopUp = false;
         this.transitionPreview.visible = false;
      }
      
      private function showTransPreview(param1:ItemRenderer) : void
      {
         var _loc2_:Object = param1.data as Object;
         var _loc3_:String = _loc2_.id as String;
         if(!_loc3_)
         {
            return;
         }
         var _loc4_:Point = param1.localToGlobal(new Point(0,0));
         var _loc5_:Point = globalToLocal(_loc4_);
         this.previewContainer.x = _loc5_.x;
         this.previewContainer.y = _loc5_.y - 3;
         this.previewContainer.width = param1.getLayoutBoundsWidth() + 5;
         this.previewContainer.displayPopUp = true;
         this.transitionPreview.assetEffectId = _loc3_;
         this.transitionPreview.visible = true;
      }
      
      protected function iconDirectionList_changeHandler(param1:IndexChangeEvent) : void
      {
         var _loc2_:MenuItemModel = null;
         var _loc3_:ICommand = null;
         if(this._widget)
         {
            _loc2_ = this.iconDirectionList.selectedItem as MenuItemModel;
            if(_loc2_)
            {
               _loc3_ = new ChangeWidgetIconDirectionCommand(this._widget,_loc2_.value);
               _loc3_.execute();
            }
         }
      }
      
      private function widget_swapCompleteHandler(param1:WidgetEvent) : void
      {
         this.updateIconDirectionList();
         this.updateIconDirectionListSelection();
      }
      
      private function widget_optionChangeHandler(param1:WidgetEvent) : void
      {
         this.updateIconDirectionListSelection();
      }
      
      protected function whiteboardHandButton_clickHandler(param1:MouseEvent) : void
      {
         var _loc2_:HandDrawnTransitionSetting = null;
         if(!this._whiteboardHandPopUp)
         {
            this._whiteboardHandPopUp = new WhiteboardHandPopUp();
            this._whiteboardHandPopUp.addEventListener(PopUpEvent.CLOSE,this.whiteboardHandPopUp_closeHandler);
         }
         this._whiteboardHandPopUp.open(FlexGlobals.topLevelApplication as DisplayObjectContainer,true);
         if(this._transition)
         {
            _loc2_ = this._transition.setting as HandDrawnTransitionSetting;
            if(_loc2_)
            {
               this._whiteboardHandPopUp.setCurrentHand(_loc2_.whiteboardHandStyle);
            }
         }
      }
      
      protected function whiteboardHandPopUp_closeHandler(param1:PopUpEvent) : void
      {
         var _loc2_:ICommand = null;
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         var _loc5_:Array = null;
         var _loc6_:Array = null;
         var _loc7_:int = 0;
         if(param1.commit && param1.data)
         {
            _loc3_ = param1.data[WhiteboardHandPopUp.DATA_APPLY_TO_ALL];
            _loc4_ = param1.data[WhiteboardHandPopUp.DATA_SELECTED_HAND];
            if(_loc3_)
            {
               _loc5_ = [];
               _loc6_ = Console.getConsole().scenes;
               _loc7_ = 0;
               while(_loc7_ < _loc6_.length)
               {
                  _loc5_ = _loc5_.concat(_loc6_[_loc7_].getWhiteboardHandTransitions());
                  _loc7_++;
               }
               _loc2_ = new ChangeMovieWhiteboardHandCommand(_loc5_,_loc4_);
            }
            else
            {
               _loc2_ = new ChangeWhiteboardHandCommand(this._transition,_loc4_);
            }
            _loc2_.execute();
         }
      }
      
      private function _TransitionSettingPanel_Form1_i() : Form
      {
         var _loc1_:Form = new Form();
         _loc1_.left = 10;
         _loc1_.right = 10;
         _loc1_.styleName = "compact";
         _loc1_.layout = this._TransitionSettingPanel_FormLayout1_c();
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._TransitionSettingPanel_Array2_c);
         _loc1_.id = "settingPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.settingPanel = _loc1_;
         BindingManager.executeBindings(this,"settingPanel",this.settingPanel);
         return _loc1_;
      }
      
      private function _TransitionSettingPanel_FormLayout1_c() : FormLayout
      {
         var _loc1_:FormLayout = new FormLayout();
         _loc1_.gap = -1;
         _loc1_.paddingBottom = 10;
         return _loc1_;
      }
      
      private function _TransitionSettingPanel_Array2_c() : Array
      {
         var _loc1_:Array = [this._TransitionSettingPanel_FormItem1_i(),this._TransitionSettingPanel_FormItem2_i(),this._TransitionSettingPanel_FormItem3_i(),this._TransitionSettingPanel_FormItem4_i()];
         return _loc1_;
      }
      
      private function _TransitionSettingPanel_FormItem1_i() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.percentWidth = 100;
         _loc1_.layout = this._TransitionSettingPanel_HorizontalLayout1_c();
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._TransitionSettingPanel_Array3_c);
         _loc1_.id = "optionDirection";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.optionDirection = _loc1_;
         BindingManager.executeBindings(this,"optionDirection",this.optionDirection);
         return _loc1_;
      }
      
      private function _TransitionSettingPanel_HorizontalLayout1_c() : HorizontalLayout
      {
         var _loc1_:HorizontalLayout = new HorizontalLayout();
         _loc1_.verticalAlign = "middle";
         _loc1_.gap = 7;
         return _loc1_;
      }
      
      private function _TransitionSettingPanel_Array3_c() : Array
      {
         var _loc1_:Array = [this._TransitionSettingPanel_DropDownList1_i(),this._TransitionSettingPanel_DropDownList2_i()];
         return _loc1_;
      }
      
      private function _TransitionSettingPanel_DropDownList1_i() : spark.components.DropDownList
      {
         var _loc1_:spark.components.DropDownList = new spark.components.DropDownList();
         _loc1_.width = 100;
         _loc1_.buttonMode = true;
         _loc1_.prompt = "----";
         _loc1_.addEventListener("change",this.__directionList_change);
         _loc1_.id = "directionList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.directionList = _loc1_;
         BindingManager.executeBindings(this,"directionList",this.directionList);
         return _loc1_;
      }
      
      public function __directionList_change(param1:IndexChangeEvent) : void
      {
         this.directionList_changeHandler(param1);
      }
      
      private function _TransitionSettingPanel_DropDownList2_i() : spark.components.DropDownList
      {
         var _loc1_:spark.components.DropDownList = new spark.components.DropDownList();
         _loc1_.percentWidth = 100;
         _loc1_.buttonMode = true;
         _loc1_.prompt = "----";
         _loc1_.addEventListener("change",this.__sectionList_change);
         _loc1_.id = "sectionList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sectionList = _loc1_;
         BindingManager.executeBindings(this,"sectionList",this.sectionList);
         return _loc1_;
      }
      
      public function __sectionList_change(param1:IndexChangeEvent) : void
      {
         this.sectionList_changeHandler(param1);
      }
      
      private function _TransitionSettingPanel_FormItem2_i() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.percentWidth = 100;
         _loc1_.layout = this._TransitionSettingPanel_HorizontalLayout2_c();
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._TransitionSettingPanel_Array4_c);
         _loc1_.id = "_TransitionSettingPanel_FormItem2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._TransitionSettingPanel_FormItem2 = _loc1_;
         BindingManager.executeBindings(this,"_TransitionSettingPanel_FormItem2",this._TransitionSettingPanel_FormItem2);
         return _loc1_;
      }
      
      private function _TransitionSettingPanel_HorizontalLayout2_c() : HorizontalLayout
      {
         var _loc1_:HorizontalLayout = new HorizontalLayout();
         _loc1_.verticalAlign = "middle";
         _loc1_.gap = 7;
         return _loc1_;
      }
      
      private function _TransitionSettingPanel_Array4_c() : Array
      {
         var _loc1_:Array = [this._TransitionSettingPanel_DropDownList3_i(),this._TransitionSettingPanel_HGroup1_i(),this._TransitionSettingPanel_DropDownList4_i(),this._TransitionSettingPanel_DropDownList5_i(),this._TransitionSettingPanel_Button2_i()];
         return _loc1_;
      }
      
      private function _TransitionSettingPanel_DropDownList3_i() : spark.components.DropDownList
      {
         var _loc1_:spark.components.DropDownList = new spark.components.DropDownList();
         _loc1_.percentWidth = 100;
         _loc1_.buttonMode = true;
         _loc1_.prompt = "----";
         _loc1_.setStyle("skinClass",TransitionStyleListSkin);
         _loc1_.addEventListener("change",this.__typeList_change);
         _loc1_.addEventListener("itemRollOver",this.__typeList_itemRollOver);
         _loc1_.addEventListener("itemRollOut",this.__typeList_itemRollOut);
         _loc1_.id = "typeList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.typeList = _loc1_;
         BindingManager.executeBindings(this,"typeList",this.typeList);
         return _loc1_;
      }
      
      public function __typeList_change(param1:IndexChangeEvent) : void
      {
         this.typeList_changeHandler(param1);
      }
      
      public function __typeList_itemRollOver(param1:ListEvent) : void
      {
         this.onMouseOverEffect(param1);
      }
      
      public function __typeList_itemRollOut(param1:ListEvent) : void
      {
         this.hideTransPreview();
      }
      
      private function _TransitionSettingPanel_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.height = 32;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._TransitionSettingPanel_Label1_i(),this._TransitionSettingPanel_Button1_i()];
         _loc1_.id = "_TransitionSettingPanel_HGroup1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._TransitionSettingPanel_HGroup1 = _loc1_;
         BindingManager.executeBindings(this,"_TransitionSettingPanel_HGroup1",this._TransitionSettingPanel_HGroup1);
         return _loc1_;
      }
      
      private function _TransitionSettingPanel_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.maxDisplayedLines = 1;
         _loc1_.showTruncationTip = true;
         _loc1_.maxWidth = 200;
         _loc1_.setStyle("verticalAlign","middle");
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.id = "_TransitionSettingPanel_Label1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._TransitionSettingPanel_Label1 = _loc1_;
         BindingManager.executeBindings(this,"_TransitionSettingPanel_Label1",this._TransitionSettingPanel_Label1);
         return _loc1_;
      }
      
      private function _TransitionSettingPanel_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.setStyle("skinClass",CharacterMovementTipButtonSkin);
         _loc1_.id = "_TransitionSettingPanel_Button1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._TransitionSettingPanel_Button1 = _loc1_;
         BindingManager.executeBindings(this,"_TransitionSettingPanel_Button1",this._TransitionSettingPanel_Button1);
         return _loc1_;
      }
      
      private function _TransitionSettingPanel_DropDownList4_i() : anifire.studio.components.DropDownList
      {
         var _loc1_:anifire.studio.components.DropDownList = new anifire.studio.components.DropDownList();
         _loc1_.width = 60;
         _loc1_.prompt = "----";
         _loc1_.setStyle("skinClass",AssetTransitionDestinationDropDownListSkin);
         _loc1_.addEventListener("change",this.__destinationList_change);
         _loc1_.id = "destinationList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.destinationList = _loc1_;
         BindingManager.executeBindings(this,"destinationList",this.destinationList);
         return _loc1_;
      }
      
      public function __destinationList_change(param1:IndexChangeEvent) : void
      {
         this.destinationList_changeHandler(param1);
      }
      
      private function _TransitionSettingPanel_DropDownList5_i() : anifire.studio.components.DropDownList
      {
         var _loc1_:anifire.studio.components.DropDownList = new anifire.studio.components.DropDownList();
         _loc1_.width = 60;
         _loc1_.useVirtualLayout = false;
         _loc1_.setStyle("skinClass",WidgetIconDirectionDropDownListSkin);
         _loc1_.addEventListener("change",this.__iconDirectionList_change);
         _loc1_.id = "iconDirectionList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.iconDirectionList = _loc1_;
         BindingManager.executeBindings(this,"iconDirectionList",this.iconDirectionList);
         return _loc1_;
      }
      
      public function __iconDirectionList_change(param1:IndexChangeEvent) : void
      {
         this.iconDirectionList_changeHandler(param1);
      }
      
      private function _TransitionSettingPanel_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.width = 32;
         _loc1_.height = 32;
         _loc1_.setStyle("skinClass",WhiteboardHandButtonSkin);
         _loc1_.addEventListener("click",this.__whiteboardHandButton_click);
         _loc1_.id = "whiteboardHandButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.whiteboardHandButton = _loc1_;
         BindingManager.executeBindings(this,"whiteboardHandButton",this.whiteboardHandButton);
         return _loc1_;
      }
      
      public function __whiteboardHandButton_click(param1:MouseEvent) : void
      {
         this.whiteboardHandButton_clickHandler(param1);
      }
      
      private function _TransitionSettingPanel_FormItem3_i() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.percentWidth = 100;
         _loc1_.layout = this._TransitionSettingPanel_HorizontalLayout3_c();
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._TransitionSettingPanel_Array6_c);
         _loc1_.id = "_TransitionSettingPanel_FormItem3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._TransitionSettingPanel_FormItem3 = _loc1_;
         BindingManager.executeBindings(this,"_TransitionSettingPanel_FormItem3",this._TransitionSettingPanel_FormItem3);
         return _loc1_;
      }
      
      private function _TransitionSettingPanel_HorizontalLayout3_c() : HorizontalLayout
      {
         var _loc1_:HorizontalLayout = new HorizontalLayout();
         _loc1_.verticalAlign = "middle";
         _loc1_.gap = 7;
         return _loc1_;
      }
      
      private function _TransitionSettingPanel_Array6_c() : Array
      {
         var _loc1_:Array = [this._TransitionSettingPanel_DropDownList6_i(),this._TransitionSettingPanel_Spacer1_c()];
         return _loc1_;
      }
      
      private function _TransitionSettingPanel_DropDownList6_i() : spark.components.DropDownList
      {
         var _loc1_:spark.components.DropDownList = new spark.components.DropDownList();
         _loc1_.percentWidth = 100;
         _loc1_.buttonMode = true;
         _loc1_.prompt = "----";
         _loc1_.addEventListener("change",this.__timingList_change);
         _loc1_.id = "timingList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.timingList = _loc1_;
         BindingManager.executeBindings(this,"timingList",this.timingList);
         return _loc1_;
      }
      
      public function __timingList_change(param1:IndexChangeEvent) : void
      {
         this.timingList_changeHandler(param1);
      }
      
      private function _TransitionSettingPanel_Spacer1_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.width = 50;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TransitionSettingPanel_FormItem4_i() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.percentWidth = 100;
         _loc1_.layout = this._TransitionSettingPanel_HorizontalLayout4_c();
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._TransitionSettingPanel_Array7_c);
         _loc1_.id = "optionDelay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.optionDelay = _loc1_;
         BindingManager.executeBindings(this,"optionDelay",this.optionDelay);
         return _loc1_;
      }
      
      private function _TransitionSettingPanel_HorizontalLayout4_c() : HorizontalLayout
      {
         var _loc1_:HorizontalLayout = new HorizontalLayout();
         _loc1_.verticalAlign = "baseline";
         _loc1_.gap = 7;
         return _loc1_;
      }
      
      private function _TransitionSettingPanel_Array7_c() : Array
      {
         var _loc1_:Array = [this._TransitionSettingPanel_NumericStepper1_i(),this._TransitionSettingPanel_HGroup2_i()];
         return _loc1_;
      }
      
      private function _TransitionSettingPanel_NumericStepper1_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.stepSize = 0.25;
         _loc1_.minimum = 0;
         _loc1_.maximum = 20;
         _loc1_.addEventListener("incrementButtonPress",this.__delayStepper_incrementButtonPress);
         _loc1_.addEventListener("incrementButtonRelease",this.__delayStepper_incrementButtonRelease);
         _loc1_.addEventListener("decrementButtonPress",this.__delayStepper_decrementButtonPress);
         _loc1_.addEventListener("decrementButtonRelease",this.__delayStepper_decrementButtonRelease);
         _loc1_.addEventListener("change",this.__delayStepper_change);
         _loc1_.id = "delayStepper";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.delayStepper = _loc1_;
         BindingManager.executeBindings(this,"delayStepper",this.delayStepper);
         return _loc1_;
      }
      
      public function __delayStepper_incrementButtonPress(param1:Event) : void
      {
         this.delayStepper_buttonPressHandler(param1);
      }
      
      public function __delayStepper_incrementButtonRelease(param1:Event) : void
      {
         this.delayStepper_buttonReleaseHandler(param1);
      }
      
      public function __delayStepper_decrementButtonPress(param1:Event) : void
      {
         this.delayStepper_buttonPressHandler(param1);
      }
      
      public function __delayStepper_decrementButtonRelease(param1:Event) : void
      {
         this.delayStepper_buttonReleaseHandler(param1);
      }
      
      public function __delayStepper_change(param1:Event) : void
      {
         this.delayStepper_changeHandler(param1);
      }
      
      private function _TransitionSettingPanel_HGroup2_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "baseline";
         _loc1_.gap = 7;
         _loc1_.mxmlContent = [this._TransitionSettingPanel_Label2_i(),this._TransitionSettingPanel_NumericStepper2_i()];
         _loc1_.id = "optionDuration";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.optionDuration = _loc1_;
         BindingManager.executeBindings(this,"optionDuration",this.optionDuration);
         return _loc1_;
      }
      
      private function _TransitionSettingPanel_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.id = "_TransitionSettingPanel_Label2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._TransitionSettingPanel_Label2 = _loc1_;
         BindingManager.executeBindings(this,"_TransitionSettingPanel_Label2",this._TransitionSettingPanel_Label2);
         return _loc1_;
      }
      
      private function _TransitionSettingPanel_NumericStepper2_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.stepSize = 0.25;
         _loc1_.minimum = 0.25;
         _loc1_.maximum = 20;
         _loc1_.addEventListener("incrementButtonPress",this.__durationStepper_incrementButtonPress);
         _loc1_.addEventListener("incrementButtonRelease",this.__durationStepper_incrementButtonRelease);
         _loc1_.addEventListener("decrementButtonPress",this.__durationStepper_decrementButtonPress);
         _loc1_.addEventListener("decrementButtonRelease",this.__durationStepper_decrementButtonRelease);
         _loc1_.addEventListener("change",this.__durationStepper_change);
         _loc1_.id = "durationStepper";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.durationStepper = _loc1_;
         BindingManager.executeBindings(this,"durationStepper",this.durationStepper);
         return _loc1_;
      }
      
      public function __durationStepper_incrementButtonPress(param1:Event) : void
      {
         this.durationStepper_buttonPressHandler(param1);
      }
      
      public function __durationStepper_incrementButtonRelease(param1:Event) : void
      {
         this.durationStepper_buttonReleaseHandler(param1);
      }
      
      public function __durationStepper_decrementButtonPress(param1:Event) : void
      {
         this.durationStepper_buttonPressHandler(param1);
      }
      
      public function __durationStepper_decrementButtonRelease(param1:Event) : void
      {
         this.durationStepper_buttonReleaseHandler(param1);
      }
      
      public function __durationStepper_change(param1:Event) : void
      {
         this.durationStepper_changeHandler(param1);
      }
      
      private function _TransitionSettingPanel_PopUpAnchor1_i() : spark.components.PopUpAnchor
      {
         var _loc1_:spark.components.PopUpAnchor = new spark.components.PopUpAnchor();
         _loc1_.includeInLayout = false;
         _loc1_.popUpPosition = "right";
         _loc1_.popUp = this._TransitionSettingPanel_TransitionPreview1_i();
         _loc1_.id = "previewContainer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.previewContainer = _loc1_;
         BindingManager.executeBindings(this,"previewContainer",this.previewContainer);
         return _loc1_;
      }
      
      private function _TransitionSettingPanel_TransitionPreview1_i() : TransitionPreview
      {
         var _loc1_:TransitionPreview = new TransitionPreview();
         _loc1_.visible = false;
         _loc1_.id = "transitionPreview";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.transitionPreview = _loc1_;
         BindingManager.executeBindings(this,"transitionPreview",this.transitionPreview);
         return _loc1_;
      }
      
      public function ___TransitionSettingPanel_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.creationCompleteHandler();
      }
      
      private function _TransitionSettingPanel_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Motion");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"optionDirection.label");
         result[1] = new Binding(this,function():IList
         {
            return _directionSource;
         },null,"directionList.dataProvider");
         result[2] = new Binding(this,function():IList
         {
            return _sectionSource;
         },null,"sectionList.dataProvider");
         result[3] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Style");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_TransitionSettingPanel_FormItem2.label");
         result[4] = new Binding(this,function():IList
         {
            return _typeSource;
         },null,"typeList.dataProvider");
         result[5] = new Binding(this,function():Boolean
         {
            return !_showActionName;
         },null,"typeList.visible");
         result[6] = new Binding(this,function():Boolean
         {
            return !_showActionName;
         },null,"typeList.includeInLayout");
         result[7] = new Binding(this,function():Boolean
         {
            return _showActionName;
         },null,"_TransitionSettingPanel_HGroup1.visible");
         result[8] = new Binding(this,function():Boolean
         {
            return _showActionName;
         },null,"_TransitionSettingPanel_HGroup1.includeInLayout");
         result[9] = new Binding(this,function():String
         {
            var _loc1_:* = _actionName;
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_TransitionSettingPanel_Label1.text");
         result[10] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("You can change action under the ACTIONS tab.");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_TransitionSettingPanel_Button1.label");
         result[11] = new Binding(this,function():IList
         {
            return _destinationSource;
         },null,"destinationList.dataProvider");
         result[12] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Select a hand");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"whiteboardHandButton.label");
         result[13] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Timing");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_TransitionSettingPanel_FormItem3.label");
         result[14] = new Binding(this,function():*
         {
            return _selectedTimingItem;
         },null,"timingList.selectedItem");
         result[15] = new Binding(this,function():IList
         {
            return _timingSource;
         },null,"timingList.dataProvider");
         result[16] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Delay");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"optionDelay.label");
         result[17] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Duration");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_TransitionSettingPanel_Label2.text");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get delayStepper() : NumericStepper
      {
         return this._139615182delayStepper;
      }
      
      public function set delayStepper(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._139615182delayStepper;
         if(_loc2_ !== param1)
         {
            this._139615182delayStepper = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"delayStepper",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get destinationList() : anifire.studio.components.DropDownList
      {
         return this._1762807348destinationList;
      }
      
      public function set destinationList(param1:anifire.studio.components.DropDownList) : void
      {
         var _loc2_:Object = this._1762807348destinationList;
         if(_loc2_ !== param1)
         {
            this._1762807348destinationList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"destinationList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get directionList() : spark.components.DropDownList
      {
         return this._530164547directionList;
      }
      
      public function set directionList(param1:spark.components.DropDownList) : void
      {
         var _loc2_:Object = this._530164547directionList;
         if(_loc2_ !== param1)
         {
            this._530164547directionList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"directionList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get durationStepper() : NumericStepper
      {
         return this._45858147durationStepper;
      }
      
      public function set durationStepper(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._45858147durationStepper;
         if(_loc2_ !== param1)
         {
            this._45858147durationStepper = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"durationStepper",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get iconDirectionList() : anifire.studio.components.DropDownList
      {
         return this._1686770884iconDirectionList;
      }
      
      public function set iconDirectionList(param1:anifire.studio.components.DropDownList) : void
      {
         var _loc2_:Object = this._1686770884iconDirectionList;
         if(_loc2_ !== param1)
         {
            this._1686770884iconDirectionList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"iconDirectionList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get optionDelay() : FormItem
      {
         return this._383827442optionDelay;
      }
      
      public function set optionDelay(param1:FormItem) : void
      {
         var _loc2_:Object = this._383827442optionDelay;
         if(_loc2_ !== param1)
         {
            this._383827442optionDelay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"optionDelay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get optionDirection() : FormItem
      {
         return this._953068918optionDirection;
      }
      
      public function set optionDirection(param1:FormItem) : void
      {
         var _loc2_:Object = this._953068918optionDirection;
         if(_loc2_ !== param1)
         {
            this._953068918optionDirection = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"optionDirection",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get optionDuration() : HGroup
      {
         return this._86504745optionDuration;
      }
      
      public function set optionDuration(param1:HGroup) : void
      {
         var _loc2_:Object = this._86504745optionDuration;
         if(_loc2_ !== param1)
         {
            this._86504745optionDuration = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"optionDuration",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get previewContainer() : spark.components.PopUpAnchor
      {
         return this._1818605159previewContainer;
      }
      
      public function set previewContainer(param1:spark.components.PopUpAnchor) : void
      {
         var _loc2_:Object = this._1818605159previewContainer;
         if(_loc2_ !== param1)
         {
            this._1818605159previewContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"previewContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sectionList() : spark.components.DropDownList
      {
         return this._574597411sectionList;
      }
      
      public function set sectionList(param1:spark.components.DropDownList) : void
      {
         var _loc2_:Object = this._574597411sectionList;
         if(_loc2_ !== param1)
         {
            this._574597411sectionList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sectionList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get settingPanel() : Form
      {
         return this._502431124settingPanel;
      }
      
      public function set settingPanel(param1:Form) : void
      {
         var _loc2_:Object = this._502431124settingPanel;
         if(_loc2_ !== param1)
         {
            this._502431124settingPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"settingPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get timingList() : spark.components.DropDownList
      {
         return this._808181768timingList;
      }
      
      public function set timingList(param1:spark.components.DropDownList) : void
      {
         var _loc2_:Object = this._808181768timingList;
         if(_loc2_ !== param1)
         {
            this._808181768timingList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"timingList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get transitionPreview() : TransitionPreview
      {
         return this._1283806387transitionPreview;
      }
      
      public function set transitionPreview(param1:TransitionPreview) : void
      {
         var _loc2_:Object = this._1283806387transitionPreview;
         if(_loc2_ !== param1)
         {
            this._1283806387transitionPreview = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"transitionPreview",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get typeList() : spark.components.DropDownList
      {
         return this._676559112typeList;
      }
      
      public function set typeList(param1:spark.components.DropDownList) : void
      {
         var _loc2_:Object = this._676559112typeList;
         if(_loc2_ !== param1)
         {
            this._676559112typeList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"typeList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get whiteboardHandButton() : Button
      {
         return this._1452975294whiteboardHandButton;
      }
      
      public function set whiteboardHandButton(param1:Button) : void
      {
         var _loc2_:Object = this._1452975294whiteboardHandButton;
         if(_loc2_ !== param1)
         {
            this._1452975294whiteboardHandButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"whiteboardHandButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _typeSource() : ArrayCollection
      {
         return this._338926188_typeSource;
      }
      
      private function set _typeSource(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._338926188_typeSource;
         if(_loc2_ !== param1)
         {
            this._338926188_typeSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_typeSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _typeSourceMovement() : ArrayCollection
      {
         return this._349435491_typeSourceMovement;
      }
      
      private function set _typeSourceMovement(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._349435491_typeSourceMovement;
         if(_loc2_ !== param1)
         {
            this._349435491_typeSourceMovement = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_typeSourceMovement",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _directionSource() : ArrayCollection
      {
         return this._562878011_directionSource;
      }
      
      private function set _directionSource(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._562878011_directionSource;
         if(_loc2_ !== param1)
         {
            this._562878011_directionSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_directionSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _timingSource() : ArrayCollection
      {
         return this._1671089892_timingSource;
      }
      
      private function set _timingSource(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1671089892_timingSource;
         if(_loc2_ !== param1)
         {
            this._1671089892_timingSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_timingSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _timingSourceForEnterExit() : ArrayCollection
      {
         return this._1598020177_timingSourceForEnterExit;
      }
      
      private function set _timingSourceForEnterExit(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1598020177_timingSourceForEnterExit;
         if(_loc2_ !== param1)
         {
            this._1598020177_timingSourceForEnterExit = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_timingSourceForEnterExit",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _timingSourceForMovement() : ArrayCollection
      {
         return this._1409909996_timingSourceForMovement;
      }
      
      private function set _timingSourceForMovement(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1409909996_timingSourceForMovement;
         if(_loc2_ !== param1)
         {
            this._1409909996_timingSourceForMovement = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_timingSourceForMovement",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _selectedTimingItem() : Object
      {
         return this._1433303575_selectedTimingItem;
      }
      
      private function set _selectedTimingItem(param1:Object) : void
      {
         var _loc2_:Object = this._1433303575_selectedTimingItem;
         if(_loc2_ !== param1)
         {
            this._1433303575_selectedTimingItem = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_selectedTimingItem",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _sectionSource() : ArrayCollection
      {
         return this._1854874977_sectionSource;
      }
      
      private function set _sectionSource(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1854874977_sectionSource;
         if(_loc2_ !== param1)
         {
            this._1854874977_sectionSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_sectionSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _destinationSource() : ArrayCollection
      {
         return this._1867333814_destinationSource;
      }
      
      private function set _destinationSource(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1867333814_destinationSource;
         if(_loc2_ !== param1)
         {
            this._1867333814_destinationSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_destinationSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _actionName() : String
      {
         return this._1354975360_actionName;
      }
      
      private function set _actionName(param1:String) : void
      {
         var _loc2_:Object = this._1354975360_actionName;
         if(_loc2_ !== param1)
         {
            this._1354975360_actionName = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_actionName",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _showActionName() : Boolean
      {
         return this._634302173_showActionName;
      }
      
      private function set _showActionName(param1:Boolean) : void
      {
         var _loc2_:Object = this._634302173_showActionName;
         if(_loc2_ !== param1)
         {
            this._634302173_showActionName = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_showActionName",_loc2_,param1));
            }
         }
      }
   }
}
