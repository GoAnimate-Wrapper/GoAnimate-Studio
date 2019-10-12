package anifire.studio.assets.image
{
   import anifire.component.widgets.IconWidget;
   import anifire.component.widgets.RepeatIconWidget;
   import anifire.component.widgets.WidgetFactory;
   import anifire.component.widgets.WidgetMaker;
   import anifire.event.WidgetEvent;
   import anifire.interfaces.IDateRangeWidget;
   import anifire.interfaces.IDateWidget;
   import anifire.models.widget.WidgetPartModel;
   import anifire.models.widget.WidgetStyleModel;
   import anifire.studio.assets.image.library.IReusableObject;
   import anifire.studio.core.Asset;
   import anifire.studio.core.Widget;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class WidgetAssetImage extends AssetImageBase implements IReusableObject
   {
       
      
      private var _reusable:Boolean;
      
      private var _widgetMaker:WidgetMaker;
      
      public function WidgetAssetImage()
      {
         super();
      }
      
      override public function set asset(param1:Asset) : void
      {
         super.asset = param1;
         var _loc2_:Widget = param1 as Widget;
         if(_loc2_ && !this._widgetMaker)
         {
            this._widgetMaker = WidgetFactory.createWidgetMaker(_loc2_.chartType);
            this._widgetMaker.addEventListener(WidgetEvent.WIDGET_ICON_LOAD_COMPLETE,this.onWidgetIconLoadComplete);
            this._widgetMaker.validate();
            addChild(this._widgetMaker);
         }
         this.updateBound();
         this.dispatchImageReady();
      }
      
      private function onWidgetIconLoadComplete(param1:WidgetEvent) : void
      {
         dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_ICON_LOAD_COMPLETE));
      }
      
      private function updateBound() : void
      {
         var _loc2_:Point = null;
         var _loc1_:Rectangle = this._widgetMaker.bounds;
         if(_loc1_)
         {
            this.rect.x = _loc1_.x;
            this.rect.y = _loc1_.y;
            this.rect.width = _loc1_.width;
            this.rect.height = _loc1_.height;
            _loc2_ = new Point(_loc1_.x + _loc1_.width / 2,_loc1_.y + _loc1_.height / 2);
         }
      }
      
      override public function destroy(param1:String = "rip") : void
      {
         if(this._reusable)
         {
            return;
         }
         super.destroy(param1);
      }
      
      public function doBeforeReuse() : void
      {
         this._reusable = true;
      }
      
      public function releaseResource() : void
      {
         this._reusable = false;
         this.destroy();
      }
      
      public function set data(param1:String) : void
      {
      }
      
      public function updateRangesAndRows(param1:Vector.<String>, param2:Vector.<WidgetPartModel>) : void
      {
         this._widgetMaker.updateRanges(param1);
         this._widgetMaker.updateModel(param2);
         this._widgetMaker.validate();
      }
      
      public function set dataRows(param1:Vector.<WidgetPartModel>) : void
      {
         this._widgetMaker.updateModel(param1);
         this._widgetMaker.validate();
      }
      
      public function set dataRanges(param1:Vector.<String>) : void
      {
         this._widgetMaker.updateRanges(param1);
         this._widgetMaker.validate();
      }
      
      public function set styleModel(param1:WidgetStyleModel) : void
      {
         if(param1)
         {
            this._widgetMaker.styleModel = param1;
            this._widgetMaker.styleModel.colorSet = param1.colorSet;
            this._widgetMaker.validate();
            this.updateBound();
         }
      }
      
      public function set title(param1:String) : void
      {
         this._widgetMaker.title = param1;
         this._widgetMaker.validate();
      }
      
      public function setDateValues(param1:Date, param2:int, param3:int) : void
      {
         var _loc4_:IDateWidget = this._widgetMaker as IDateWidget;
         if(_loc4_)
         {
            _loc4_.currentDate = param1;
            _loc4_.selectedDate = param2;
         }
         var _loc5_:IDateRangeWidget = this._widgetMaker as IDateRangeWidget;
         if(_loc5_)
         {
            _loc5_.selectedDateEnd = param3;
         }
         this._widgetMaker.validate();
      }
      
      public function set displayInPercentage(param1:Boolean) : void
      {
         this._widgetMaker.displayPercentageLabel = param1;
         this._widgetMaker.validate();
      }
      
      public function set displayValueLabel(param1:Boolean) : void
      {
         this._widgetMaker.displayValueLabel = param1;
         this._widgetMaker.validate();
      }
      
      public function set displayDataLabel(param1:Boolean) : void
      {
         this._widgetMaker.displayDataLabel = param1;
         this._widgetMaker.validate();
      }
      
      public function set displayAxis(param1:Boolean) : void
      {
         this._widgetMaker.displayAxis = param1;
         this._widgetMaker.validate();
      }
      
      public function set displayLegend(param1:Boolean) : void
      {
         this._widgetMaker.displayLegend = param1;
         this._widgetMaker.validate();
      }
      
      public function set swapAxis(param1:Boolean) : void
      {
         this._widgetMaker.swapAxis = param1;
         this._widgetMaker.validate();
      }
      
      public function set iconDirection(param1:String) : void
      {
         this._widgetMaker.iconDirection = param1;
         this._widgetMaker.validate();
      }
      
      public function set numberFormatType(param1:int) : void
      {
         this._widgetMaker.numberFormatType = param1;
         this._widgetMaker.validate();
      }
      
      public function set propId(param1:String) : void
      {
         var _loc2_:int = 0;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         if(this._widgetMaker is IconWidget && param1)
         {
            _loc2_ = param1.indexOf(".");
            if(_loc2_ > 0)
            {
               _loc3_ = param1.substring(0,_loc2_);
               _loc4_ = param1.substring(_loc2_ + 1);
               _loc2_ = _loc4_.indexOf(".");
               if(_loc3_ == "ugc")
               {
                  _loc4_ = _loc4_.substring(0,_loc2_);
               }
               if(_loc2_ > 0 && _loc2_ != _loc4_.length - 4)
               {
                  _loc5_ = _loc4_.substring(_loc2_ + 1);
                  _loc4_ = _loc4_.substring(0,_loc2_);
               }
               (this._widgetMaker as IconWidget).updateIconImage(_loc3_,_loc4_,_loc5_);
               this._widgetMaker.validate();
            }
         }
      }
      
      public function setAutoGrid() : void
      {
         var _loc1_:RepeatIconWidget = this._widgetMaker as RepeatIconWidget;
         if(_loc1_)
         {
            _loc1_.autoGrid = true;
            _loc1_.validate();
         }
      }
      
      public function setManualGrid(param1:int, param2:int) : void
      {
         var _loc3_:RepeatIconWidget = this._widgetMaker as RepeatIconWidget;
         if(_loc3_)
         {
            _loc3_.autoGrid = false;
            _loc3_.rows = param1;
            _loc3_.columns = param2;
            _loc3_.validate();
         }
      }
      
      override public function pause() : void
      {
      }
      
      override public function resume() : void
      {
      }
      
      override public function get thumbnailRect() : Rectangle
      {
         return this._widgetMaker.bounds;
      }
      
      public function resizeWidget(param1:Rectangle) : void
      {
         if(this._widgetMaker)
         {
            this._widgetMaker.bounds = param1;
            this._widgetMaker.validate();
         }
      }
   }
}
