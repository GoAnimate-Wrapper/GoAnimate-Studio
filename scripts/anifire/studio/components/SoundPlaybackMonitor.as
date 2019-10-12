package anifire.studio.components
{
   import anifire.constant.AnimeConstants;
   import anifire.studio.core.AnimeSound;
   import anifire.studio.core.sound.ISoundable;
   import anifire.util.UtilUnitConvert;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import spark.components.Group;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   public class SoundPlaybackMonitor extends Group
   {
      
      private static const CURSOR_LINE_OFFSET:int = 2;
      
      private static const HIGHLIGHT_AREA_WIDTH_INIT:int = 2;
       
      
      private var _87333994cursorLine:Line;
      
      private var _1540284600highlightRect:Rect;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _sound:ISoundable;
      
      private var _timer:Timer;
      
      private var _offset:Number = 0;
      
      protected var _startPixelX:Number;
      
      protected var _displayScale:Number = 1;
      
      protected var _allowSelection:Boolean;
      
      private var _selectedStartTime:Number = 0;
      
      private var _isTrimmed:Boolean;
      
      private var _trimStartFrame:Number;
      
      private var _trimEndFrame:Number;
      
      public function SoundPlaybackMonitor()
      {
         super();
         mx_internal::_document = this;
         this.clipAndEnableScrolling = true;
         this.mxmlContent = [this._SoundPlaybackMonitor_Rect1_i(),this._SoundPlaybackMonitor_Line1_i()];
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
      
      public function get selectedStartTime() : Number
      {
         return this._selectedStartTime;
      }
      
      public function set selectedStartTime(param1:Number) : void
      {
         this._selectedStartTime = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get allowSelection() : Boolean
      {
         return this._allowSelection;
      }
      
      private function set _1581674429allowSelection(param1:Boolean) : void
      {
         if(this._allowSelection != param1)
         {
            this._allowSelection = param1;
            if(this._allowSelection)
            {
               this.addEventListeners();
            }
            else
            {
               this.removeEventListeners();
            }
         }
      }
      
      public function clearSelectedTime() : void
      {
         this.selectedStartTime = 0;
         this.cursorLine.visible = false;
      }
      
      protected function addEventListeners() : void
      {
         addEventListener(MouseEvent.ROLL_OUT,this.rollOutHandler);
         addEventListener(MouseEvent.ROLL_OVER,this.rollOverHandler);
         addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownHandler);
         addEventListener(MouseEvent.MOUSE_MOVE,this.mouseMoveHandler);
      }
      
      protected function removeEventListeners() : void
      {
         removeEventListener(MouseEvent.ROLL_OUT,this.rollOutHandler);
         removeEventListener(MouseEvent.ROLL_OVER,this.rollOverHandler);
         removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownHandler);
         removeEventListener(MouseEvent.MOUSE_MOVE,this.mouseMoveHandler);
      }
      
      public function fitToSound(param1:AnimeSound) : void
      {
         var _loc2_:Number = param1.totalFrame;
         if(param1.isTrimmed)
         {
            _loc2_ = param1.trimEndFrame - param1.trimStartFrame + 1;
         }
         var _loc3_:Number = UtilUnitConvert.frameToPixel(_loc2_);
         this._displayScale = getLayoutBoundsWidth() / _loc3_;
      }
      
      public function startMonitor(param1:Number = 0, param2:ISoundable = null, param3:Boolean = false, param4:Number = 0, param5:Number = 0) : void
      {
         var _loc6_:Number = NaN;
         this.stopMonitor();
         this._sound = param2;
         this._isTrimmed = param3;
         this._trimStartFrame = param4;
         this._trimEndFrame = param5;
         if(this._isTrimmed)
         {
            _loc6_ = UtilUnitConvert.frameToSec(param4) * 1000;
            this._startPixelX = UtilUnitConvert.millisecToPixel(_loc6_ - param1);
         }
         else
         {
            this._startPixelX = UtilUnitConvert.millisecToPixel(param1);
         }
         this.highlightRect.x = (this._startPixelX + this._offset) * this._displayScale;
         this.highlightRect.width = HIGHLIGHT_AREA_WIDTH_INIT;
         this._timer = new Timer(40);
         this._timer.addEventListener(TimerEvent.TIMER,this.onTimer);
         this._timer.start();
      }
      
      public function stopMonitor() : void
      {
         if(this._timer)
         {
            this._timer.stop();
            this._timer.removeEventListener(TimerEvent.TIMER,this.onTimer);
            this._timer = null;
         }
         this.updateRect();
         this.clearSelectedTime();
      }
      
      private function updateRect() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         if(this._sound && this._sound.isPlaying)
         {
            if(this._trimStartFrame > 0)
            {
               _loc1_ = this._sound.playedTime - UtilUnitConvert.frameToSec(this._trimStartFrame) * 1000;
            }
            else
            {
               _loc1_ = this._sound.playedTime;
            }
            _loc2_ = UtilUnitConvert.millisecToPixel(_loc1_) - this._startPixelX + AnimeConstants.PIXEL_PER_FRAME;
            this.highlightRect.width = _loc2_ * this._displayScale;
         }
         else
         {
            this.highlightRect.width = 0;
         }
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         this.updateRect();
      }
      
      public function set offset(param1:Number) : void
      {
         if(this._offset != param1)
         {
            this._offset = param1;
         }
      }
      
      protected function rollOverHandler(param1:MouseEvent) : void
      {
         if(!param1.buttonDown)
         {
            this.cursorLine.visible = true;
         }
      }
      
      protected function rollOutHandler(param1:MouseEvent) : void
      {
         this.cursorLine.visible = false;
      }
      
      protected function mouseMoveHandler(param1:MouseEvent) : void
      {
         this.cursorLine.x = this.mouseX - CURSOR_LINE_OFFSET;
      }
      
      protected function mouseDownHandler(param1:MouseEvent) : void
      {
         this._selectedStartTime = UtilUnitConvert.pixelToSec(this.mouseX - CURSOR_LINE_OFFSET) * 1000 / this._displayScale;
         this.highlightRect.x = this.mouseX - CURSOR_LINE_OFFSET;
         this.highlightRect.width = HIGHLIGHT_AREA_WIDTH_INIT;
      }
      
      private function _SoundPlaybackMonitor_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._SoundPlaybackMonitor_SolidColor1_c();
         _loc1_.initialized(this,"highlightRect");
         this.highlightRect = _loc1_;
         BindingManager.executeBindings(this,"highlightRect",this.highlightRect);
         return _loc1_;
      }
      
      private function _SoundPlaybackMonitor_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 15965202;
         _loc1_.alpha = 0.4;
         return _loc1_;
      }
      
      private function _SoundPlaybackMonitor_Line1_i() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.visible = false;
         _loc1_.stroke = this._SoundPlaybackMonitor_SolidColorStroke1_c();
         _loc1_.initialized(this,"cursorLine");
         this.cursorLine = _loc1_;
         BindingManager.executeBindings(this,"cursorLine",this.cursorLine);
         return _loc1_;
      }
      
      private function _SoundPlaybackMonitor_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 15158332;
         _loc1_.weight = 2;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get cursorLine() : Line
      {
         return this._87333994cursorLine;
      }
      
      public function set cursorLine(param1:Line) : void
      {
         var _loc2_:Object = this._87333994cursorLine;
         if(_loc2_ !== param1)
         {
            this._87333994cursorLine = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cursorLine",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get highlightRect() : Rect
      {
         return this._1540284600highlightRect;
      }
      
      public function set highlightRect(param1:Rect) : void
      {
         var _loc2_:Object = this._1540284600highlightRect;
         if(_loc2_ !== param1)
         {
            this._1540284600highlightRect = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"highlightRect",_loc2_,param1));
            }
         }
      }
      
      public function set allowSelection(param1:Boolean) : void
      {
         var _loc2_:Object = this.allowSelection;
         if(_loc2_ !== param1)
         {
            this._1581674429allowSelection = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"allowSelection",_loc2_,param1));
            }
         }
      }
   }
}
