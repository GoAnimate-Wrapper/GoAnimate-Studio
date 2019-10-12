package anifire.studio.components
{
   import flash.display.CapsStyle;
   import flash.display.Graphics;
   import flash.display.LineScaleMode;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   import mx.core.DPIClassification;
   import mx.core.DesignLayer;
   import mx.core.FlexGlobals;
   import mx.core.IUIComponent;
   import mx.core.IVisualElement;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   
   use namespace mx_internal;
   
   public class BusyIndicator extends UIComponent
   {
      
      private static const DEFAULT_ROTATION_INTERVAL:Number = 200;
      
      private static const DEFAULT_MINIMUM_SIZE:Number = 14;
      
      private static const DEFAULT_SIZE:Number = 20;
      
      private static const RADIANS_PER_DEGREE:Number = Math.PI / 180;
       
      
      private var effectiveVisibility:Boolean = false;
      
      private var effectiveVisibilityChanged:Boolean = true;
      
      private var oldUnscaledHeight:Number;
      
      private var oldUnscaledWidth:Number;
      
      private var rotationTimer:Timer;
      
      private var currentRotation:Number = 0;
      
      private var spinnerDiameter:int;
      
      private var spokeColor:uint;
      
      private var _applicationDPI:Number;
      
      private var _insidePoint:Point;
      
      private var _outsidePoint:Point;
      
      public function BusyIndicator()
      {
         super();
         alpha = 0.6;
         this._insidePoint = new Point();
         this._outsidePoint = new Point();
         addEventListener(Event.ADDED_TO_STAGE,this.addedToStageHandler);
         addEventListener(Event.REMOVED_FROM_STAGE,this.removedFromStageHandler);
      }
      
      private function get applicationDPI() : Number
      {
         if(this._applicationDPI)
         {
            return this._applicationDPI;
         }
         var _loc1_:Object = FlexGlobals.topLevelApplication;
         if("applicationDPI" in _loc1_)
         {
            this._applicationDPI = _loc1_["applicationDPI"];
         }
         return this._applicationDPI;
      }
      
      override public function set designLayer(param1:DesignLayer) : void
      {
         super.designLayer = param1;
         this.effectiveVisibilityChanged = true;
         invalidateProperties();
      }
      
      override protected function commitProperties() : void
      {
         super.commitProperties();
         if(this.effectiveVisibilityChanged)
         {
            this.computeEffectiveVisibility();
            if(this.canRotate())
            {
               this.startRotation();
            }
            else
            {
               this.stopRotation();
            }
            this.effectiveVisibilityChanged = false;
         }
      }
      
      override protected function measure() : void
      {
         super.measure();
         if(this.applicationDPI == DPIClassification.DPI_320)
         {
            measuredWidth = 52;
            measuredHeight = 52;
         }
         else if(this.applicationDPI == DPIClassification.DPI_240)
         {
            measuredWidth = 40;
            measuredHeight = 40;
         }
         else if(this.applicationDPI == DPIClassification.DPI_160)
         {
            measuredWidth = 26;
            measuredHeight = 26;
         }
         else
         {
            measuredWidth = DEFAULT_SIZE;
            measuredHeight = DEFAULT_SIZE;
         }
         measuredMinWidth = DEFAULT_SIZE;
         measuredMinHeight = DEFAULT_SIZE;
      }
      
      override public function setVisible(param1:Boolean, param2:Boolean = false) : void
      {
         super.setVisible(param1,param2);
         this.effectiveVisibilityChanged = true;
         invalidateProperties();
      }
      
      override public function styleChanged(param1:String) : void
      {
         super.styleChanged(param1);
         var _loc2_:Boolean = !styleName || styleName == "styleName";
         if(_loc2_ || styleName == "rotationInterval")
         {
            if(this.isRotating())
            {
               this.stopRotation();
               this.startRotation();
            }
         }
         if(_loc2_ || styleName == "symbolColor")
         {
            this.updateSpinner(this.spinnerDiameter);
         }
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc3_:Number = NaN;
         super.updateDisplayList(param1,param2);
         if(this.oldUnscaledWidth != param1 || this.oldUnscaledHeight != param2)
         {
            _loc3_ = this.calculateSpinnerDiameter(param1,param2);
            this.updateSpinner(_loc3_);
            this.oldUnscaledWidth = param1;
            this.oldUnscaledHeight = param2;
         }
      }
      
      private function calculateSpinnerDiameter(param1:Number, param2:Number) : Number
      {
         var _loc3_:Number = Math.min(param1,param2);
         _loc3_ = Math.max(DEFAULT_MINIMUM_SIZE,_loc3_);
         if(_loc3_ % 2 != 0)
         {
            _loc3_--;
         }
         return _loc3_;
      }
      
      private function updateSpinner(param1:Number) : void
      {
         var _loc2_:Boolean = this.isRotating();
         if(_loc2_)
         {
            this.stopRotation();
         }
         this.spinnerDiameter = param1;
         this.spokeColor = getStyle("symbolColor");
         this.drawSpinner();
         if(_loc2_)
         {
            this.startRotation();
         }
      }
      
      mx_internal function drawSpinner() : void
      {
         var _loc1_:Graphics = graphics;
         var _loc2_:int = this.spinnerDiameter / 2;
         var _loc3_:int = this.spinnerDiameter;
         var _loc4_:Number = this.spinnerDiameter / 3.7;
         var _loc5_:Number = this.spinnerDiameter - _loc4_ * 2;
         var _loc6_:Number = _loc5_ / 5;
         var _loc7_:Number = _loc6_ / 2;
         var _loc8_:Number = 0;
         _loc1_.clear();
         this.drawSpoke(0.2,this.currentRotation + 300,_loc6_,_loc4_,this.spokeColor,_loc2_,_loc7_,_loc8_);
         this.drawSpoke(0.25,this.currentRotation + 330,_loc6_,_loc4_,this.spokeColor,_loc2_,_loc7_,_loc8_);
         this.drawSpoke(0.3,this.currentRotation,_loc6_,_loc4_,this.spokeColor,_loc2_,_loc7_,_loc8_);
         this.drawSpoke(0.35,this.currentRotation + 30,_loc6_,_loc4_,this.spokeColor,_loc2_,_loc7_,_loc8_);
         this.drawSpoke(0.4,this.currentRotation + 60,_loc6_,_loc4_,this.spokeColor,_loc2_,_loc7_,_loc8_);
         this.drawSpoke(0.45,this.currentRotation + 90,_loc6_,_loc4_,this.spokeColor,_loc2_,_loc7_,_loc8_);
         this.drawSpoke(0.5,this.currentRotation + 120,_loc6_,_loc4_,this.spokeColor,_loc2_,_loc7_,_loc8_);
         this.drawSpoke(0.6,this.currentRotation + 150,_loc6_,_loc4_,this.spokeColor,_loc2_,_loc7_,_loc8_);
         this.drawSpoke(0.7,this.currentRotation + 180,_loc6_,_loc4_,this.spokeColor,_loc2_,_loc7_,_loc8_);
         this.drawSpoke(0.8,this.currentRotation + 210,_loc6_,_loc4_,this.spokeColor,_loc2_,_loc7_,_loc8_);
         this.drawSpoke(0.9,this.currentRotation + 240,_loc6_,_loc4_,this.spokeColor,_loc2_,_loc7_,_loc8_);
         this.drawSpoke(1,this.currentRotation + 270,_loc6_,_loc4_,this.spokeColor,_loc2_,_loc7_,_loc8_);
      }
      
      private function drawSpoke(param1:Number, param2:int, param3:Number, param4:Number, param5:uint, param6:Number, param7:Number, param8:Number) : void
      {
         var _loc9_:Graphics = graphics;
         _loc9_.lineStyle(param3,param5,param1,false,LineScaleMode.NORMAL,CapsStyle.ROUND);
         this.calculatePointOnCircle(this._outsidePoint,param6,param6 - param7 - param8,param2);
         this.calculatePointOnCircle(this._insidePoint,param6,param6 - param4 + param7 - param8,param2);
         _loc9_.moveTo(this._outsidePoint.x,this._outsidePoint.y);
         _loc9_.lineTo(this._insidePoint.x,this._insidePoint.y);
      }
      
      private function calculatePointOnCircle(param1:Point, param2:Number, param3:Number, param4:Number) : void
      {
         var _loc5_:Number = param4 * RADIANS_PER_DEGREE;
         param1.x = param2 + param3 * Math.cos(_loc5_);
         param1.y = param2 + param3 * Math.sin(_loc5_);
      }
      
      private function startRotation() : void
      {
         var _loc1_:Number = NaN;
         if(!this.rotationTimer)
         {
            _loc1_ = getStyle("rotationInterval");
            if(isNaN(_loc1_))
            {
               _loc1_ = DEFAULT_ROTATION_INTERVAL;
            }
            if(_loc1_ < 16.6)
            {
               _loc1_ = 16.6;
            }
            this.rotationTimer = new Timer(_loc1_);
         }
         if(!this.rotationTimer.hasEventListener(TimerEvent.TIMER))
         {
            this.rotationTimer.addEventListener(TimerEvent.TIMER,this.timerHandler);
            this.rotationTimer.reset();
            this.rotationTimer.start();
         }
      }
      
      private function stopRotation() : void
      {
         if(this.rotationTimer)
         {
            this.rotationTimer.removeEventListener(TimerEvent.TIMER,this.timerHandler);
            this.rotationTimer.stop();
         }
      }
      
      private function isRotating() : Boolean
      {
         return this.rotationTimer && this.rotationTimer.running;
      }
      
      private function canRotate() : Boolean
      {
         if(this.effectiveVisibility && stage != null)
         {
            return true;
         }
         return false;
      }
      
      private function computeEffectiveVisibility() : void
      {
         if(designLayer && !designLayer.effectiveVisibility)
         {
            this.effectiveVisibility = false;
            return;
         }
         this.effectiveVisibility = true;
         var _loc1_:IVisualElement = this;
         while(_loc1_)
         {
            if(!_loc1_.visible)
            {
               if(!(_loc1_ is IUIComponent) || !IUIComponent(_loc1_).isPopUp)
               {
                  this.effectiveVisibility = false;
                  break;
               }
            }
            _loc1_ = _loc1_.parent as IVisualElement;
         }
      }
      
      private function addVisibilityListeners() : void
      {
         var _loc1_:IVisualElement = this.parent as IVisualElement;
         while(_loc1_)
         {
            _loc1_.addEventListener(FlexEvent.HIDE,this.visibilityChangedHandler,false,0,true);
            _loc1_.addEventListener(FlexEvent.SHOW,this.visibilityChangedHandler,false,0,true);
            _loc1_ = _loc1_.parent as IVisualElement;
         }
      }
      
      private function removeVisibilityListeners() : void
      {
         var _loc1_:IVisualElement = this;
         while(_loc1_)
         {
            _loc1_.removeEventListener(FlexEvent.HIDE,this.visibilityChangedHandler,false);
            _loc1_.removeEventListener(FlexEvent.SHOW,this.visibilityChangedHandler,false);
            _loc1_ = _loc1_.parent as IVisualElement;
         }
      }
      
      override protected function layer_PropertyChange(param1:PropertyChangeEvent) : void
      {
         super.layer_PropertyChange(param1);
         if(param1.property == "effectiveVisibility")
         {
            this.effectiveVisibilityChanged = true;
            invalidateProperties();
         }
      }
      
      private function addedToStageHandler(param1:Event) : void
      {
         this.computeEffectiveVisibility();
         if(this.canRotate())
         {
            this.startRotation();
         }
         this.addVisibilityListeners();
      }
      
      private function removedFromStageHandler(param1:Event) : void
      {
         this.stopRotation();
         this.removeVisibilityListeners();
      }
      
      private function visibilityChangedHandler(param1:FlexEvent) : void
      {
         this.effectiveVisibilityChanged = true;
         invalidateProperties();
      }
      
      private function timerHandler(param1:TimerEvent) : void
      {
         this.currentRotation = this.currentRotation + 30;
         if(this.currentRotation >= 360)
         {
            this.currentRotation = 0;
         }
         this.drawSpinner();
         param1.updateAfterEvent();
      }
   }
}
