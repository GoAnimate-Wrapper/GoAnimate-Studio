package anifire.studio.components
{
   import anifire.studio.events.InfiniteScrollEvent;
   import anifire.studio.skins.DecoratedListSkin;
   import flash.events.Event;
   import mx.events.PropertyChangeEvent;
   import mx.events.ResizeEvent;
   import spark.components.List;
   import spark.components.supportClasses.TextBase;
   import spark.core.NavigationUnit;
   
   public class DecoratedList extends List
   {
       
      
      [SkinPart(required="false")]
      public var promptDisplay:TextBase;
      
      protected var _loading:Boolean = false;
      
      protected var _emptyPrompt:String;
      
      public function DecoratedList()
      {
         super();
         setStyle("skinClass",DecoratedListSkin);
         addEventListener(ResizeEvent.RESIZE,this.onResize);
      }
      
      [Bindable(event="propertyChange")]
      public function get loading() : Boolean
      {
         return this._loading;
      }
      
      private function set _336650556loading(param1:Boolean) : void
      {
         if(this._loading != param1)
         {
            this._loading = param1;
            invalidateSkinState();
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get emptyPrompt() : String
      {
         return this._emptyPrompt;
      }
      
      private function set _1095294225emptyPrompt(param1:String) : void
      {
         if(this._emptyPrompt != param1)
         {
            this._emptyPrompt = param1;
            if(this.promptDisplay)
            {
               this.promptDisplay.text = this._emptyPrompt;
            }
         }
      }
      
      protected function onResize(param1:ResizeEvent) : void
      {
         this.invalidateContentGroup();
      }
      
      protected function onVerticalScroll(param1:Event) : void
      {
         this.invalidateContentGroup();
         if(dataGroup && dataGroup.layout.getVerticalScrollPositionDelta(NavigationUnit.END) == 0)
         {
            dispatchEvent(new InfiniteScrollEvent());
         }
      }
      
      protected function invalidateContentGroup() : void
      {
         dataGroup.invalidateDisplayList();
      }
      
      public function scrollToStart() : void
      {
         callLater(this.scrollToStartImpl);
      }
      
      public function scrollToEnd() : void
      {
         callLater(this.scrollToEndImpl);
      }
      
      protected function scrollToStartImpl() : void
      {
         var _loc1_:Number = dataGroup.layout.getVerticalScrollPositionDelta(NavigationUnit.HOME);
         dataGroup.layout.verticalScrollPosition = dataGroup.layout.verticalScrollPosition + _loc1_;
         this.invalidateContentGroup();
      }
      
      protected function scrollToEndImpl() : void
      {
         var _loc1_:Number = dataGroup.layout.getVerticalScrollPositionDelta(NavigationUnit.END);
         dataGroup.layout.verticalScrollPosition = dataGroup.layout.verticalScrollPosition + _loc1_;
         this.invalidateContentGroup();
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         super.partRemoved(param1,param2);
         if(param2 == scroller)
         {
            if(scroller.verticalScrollBar)
            {
               scroller.verticalScrollBar.removeEventListener(Event.CHANGE,this.onVerticalScroll);
            }
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == scroller)
         {
            if(scroller.verticalScrollBar)
            {
               scroller.verticalScrollBar.addEventListener(Event.CHANGE,this.onVerticalScroll);
            }
         }
         else if(param2 == this.promptDisplay)
         {
            this.promptDisplay.text = this._emptyPrompt;
         }
      }
      
      override protected function getCurrentSkinState() : String
      {
         var _loc1_:String = "disabled";
         if(enabled)
         {
            _loc1_ = !!this.loading?"loading":"normal";
         }
         return _loc1_;
      }
      
      public function set loading(param1:Boolean) : void
      {
         var _loc2_:Object = this.loading;
         if(_loc2_ !== param1)
         {
            this._336650556loading = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"loading",_loc2_,param1));
            }
         }
      }
      
      public function set emptyPrompt(param1:String) : void
      {
         var _loc2_:Object = this.emptyPrompt;
         if(_loc2_ !== param1)
         {
            this._1095294225emptyPrompt = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"emptyPrompt",_loc2_,param1));
            }
         }
      }
   }
}
