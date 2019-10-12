package anifire.studio.components
{
   import anifire.event.ExtraDataEvent;
   import anifire.studio.core.Console;
   import anifire.studio.interfaces.ITimelineContainer;
   import anifire.studio.interfaces.ITimelineElement;
   import anifire.util.UtilMath;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import mx.collections.ArrayCollection;
   import mx.collections.Sort;
   import mx.collections.SortField;
   import spark.components.HScrollBar;
   
   public class TimelineHScrollBar extends HScrollBar
   {
       
      
      private const EXTRA_SPACE_AT_END:uint = 200;
      
      private const EXTRA_SOUND_SPACE:uint = 50;
      
      private var _maxWidthContainer:ITimelineContainer;
      
      private var _containerArr:ArrayCollection;
      
      private var _mySort:Sort;
      
      private var _changeType:String;
      
      private var _currItem:ITimelineElement;
      
      private var _currContainer:ITimelineContainer;
      
      private var _viewportWidth:Number = 0;
      
      public function TimelineHScrollBar()
      {
         super();
         minimum = 0;
         maximum = 0;
         this._containerArr = new ArrayCollection();
         var _loc1_:SortField = new SortField();
         _loc1_.name = "Width";
         _loc1_.numeric = true;
         this._mySort = new Sort();
         this._mySort.fields = [_loc1_];
         this._containerArr.sort = this._mySort;
         this._containerArr.refresh();
         addEventListener(Event.CHANGE,this.onScroll);
      }
      
      public function addContainerToScrollBar(param1:ITimelineContainer) : void
      {
         if(param1)
         {
            this._currContainer = param1;
            this._currItem = this._currContainer.getCurrItem();
            this._containerArr.addItem({
               "Container":param1,
               "Width":this.getChildTotalWidth(param1)
            });
            this._containerArr.sort = this._mySort;
            this._containerArr.refresh();
            if(this._currContainer is SoundContainer)
            {
               this.updateScrollBar();
            }
            param1.addEventListener("TIMELINE_CHANGE",this.onViewChange);
         }
      }
      
      private function onViewChange(param1:ExtraDataEvent) : void
      {
         var _loc3_:DisplayObject = null;
         var _loc4_:Number = NaN;
         this.updateScrollBar();
         this._changeType = param1.getData() as String;
         var _loc2_:SceneContainer = param1.target as SceneContainer;
         if(_loc2_ && this._changeType == "AddScene")
         {
            if(!_loc2_.isSceneVisible(_loc2_.getCurrIndex()))
            {
               _loc3_ = _loc2_.getCurrItem() as DisplayObject;
               if(_loc3_)
               {
                  _loc4_ = _loc3_.x + _loc3_.width + this.EXTRA_SPACE_AT_END - getLayoutBoundsWidth();
                  this.scroll(_loc4_);
               }
            }
         }
      }
      
      public function updateScrollBar() : void
      {
         var _loc1_:Number = getLayoutBoundsWidth();
         this._viewportWidth = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this._containerArr.length)
         {
            this._viewportWidth = Math.max(this._viewportWidth,this.getChildTotalWidth(this._containerArr.getItemAt(_loc2_).Container as ITimelineContainer));
            _loc2_++;
         }
         if(this._viewportWidth > getLayoutBoundsWidth())
         {
            maximum = this._viewportWidth - _loc1_;
            pageSize = _loc1_;
            stepSize = this._viewportWidth * 0.01;
            enabled = true;
         }
         else
         {
            maximum = 0;
            enabled = false;
         }
         this.scrollView();
      }
      
      private function onScroll(param1:Event) : void
      {
         this.scrollView();
      }
      
      private function scrollView() : void
      {
         if(Console.initialized)
         {
            value = UtilMath.boundaryCheck(value,minimum,maximum);
            Console.getConsole().timeline.scroll(value);
         }
      }
      
      private function getChildTotalWidth(param1:ITimelineContainer) : Number
      {
         var _loc3_:SoundContainer = null;
         var _loc2_:Number = 0;
         if(param1 is SoundContainer)
         {
            _loc3_ = param1 as SoundContainer;
            _loc2_ = _loc3_.x + _loc3_.width + this.EXTRA_SOUND_SPACE;
         }
         else if(param1 is SceneContainer)
         {
            _loc2_ = (param1 as SceneContainer).getAllSceneTotalWidth() + this.EXTRA_SPACE_AT_END;
         }
         return _loc2_;
      }
      
      public function removeSoundBar(param1:String, param2:Boolean = false) : void
      {
         var _loc3_:int = this._containerArr.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(this._containerArr.getItemAt(_loc4_).Container is SoundContainer)
            {
               if(param2 || (this._containerArr.getItemAt(_loc4_).Container as SoundContainer).id == param1)
               {
                  this._containerArr.removeItemAt(_loc4_);
                  _loc3_--;
               }
            }
            _loc4_++;
         }
         this._containerArr.sort = this._mySort;
         this._containerArr.refresh();
         this.updateScrollBar();
      }
      
      public function scroll(param1:Number) : void
      {
         value = param1;
         this.scrollView();
      }
   }
}
