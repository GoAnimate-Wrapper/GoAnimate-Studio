package anifire.studio.components
{
   import anifire.event.StudioEvent;
   import anifire.studio.events.SearchSuggestionEvent;
   import anifire.studio.managers.SearchManager;
   import anifire.studio.managers.StudioManager;
   import anifire.studio.managers.ThemeManager;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.ui.Keyboard;
   import mx.collections.ArrayCollection;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.events.SandboxMouseEvent;
   import spark.events.IndexChangeEvent;
   import spark.events.TextOperationEvent;
   
   public class SearchSuggestionInput extends FocusTextInput
   {
       
      
      [SkinPart(required="true")]
      public var popUp:PopUpAnchor;
      
      [SkinPart(required="true")]
      public var suggestionList:SearchSuggestionList;
      
      public var suggestionSource:ArrayCollection;
      
      private var _suggestionListMaxHeight:Number = 500;
      
      private var _userInput:String;
      
      private var _searchManager:SearchManager;
      
      public var themeId:String;
      
      public function SearchSuggestionInput()
      {
         super();
         this.suggestionSource = new ArrayCollection();
         this._searchManager = SearchManager.instance;
         StudioManager.instance.addEventListener(StudioEvent.CLOSE_SUGGESTION_POP_UP,this.studioManager_closeSuggestionPopUpHandler);
      }
      
      override public function set suggestionEnabled(param1:Boolean) : void
      {
         super.suggestionEnabled = param1;
         if(param1)
         {
            addEventListener(TextOperationEvent.CHANGE,this.textChangeHandler);
         }
         else
         {
            removeEventListener(TextOperationEvent.CHANGE,this.textChangeHandler);
            this.closeSuggestionList();
         }
      }
      
      protected function textChangeHandler(param1:TextOperationEvent) : void
      {
         this.updateSuggestions();
      }
      
      override protected function keyDownHandler(param1:KeyboardEvent) : void
      {
         super.keyDownHandler(param1);
         if(this.popUp.displayPopUp)
         {
            switch(param1.keyCode)
            {
               case Keyboard.TAB:
               case Keyboard.DOWN:
                  this._userInput = text;
                  this.suggestionList.selectFirstItem();
                  break;
               case Keyboard.UP:
                  this._userInput = text;
                  this.suggestionList.selectLastItem();
                  break;
               case Keyboard.ESCAPE:
                  this.closeSuggestionList();
            }
         }
      }
      
      protected function openSuggestionList() : void
      {
         if(this.popUp)
         {
            this.popUp.displayPopUp = true;
            systemManager.getSandboxRoot().addEventListener(MouseEvent.MOUSE_DOWN,this.systemManager_mouseDownHandler);
            systemManager.getSandboxRoot().addEventListener(SandboxMouseEvent.MOUSE_DOWN_SOMEWHERE,this.systemManager_mouseDownHandler);
         }
      }
      
      protected function closeSuggestionList() : void
      {
         if(this.popUp)
         {
            this.popUp.displayPopUp = false;
            systemManager.getSandboxRoot().removeEventListener(MouseEvent.MOUSE_DOWN,this.systemManager_mouseDownHandler);
            systemManager.getSandboxRoot().removeEventListener(SandboxMouseEvent.MOUSE_DOWN_SOMEWHERE,this.systemManager_mouseDownHandler);
         }
      }
      
      protected function systemManager_mouseDownHandler(param1:Event) : void
      {
         if(this.suggestionList && !this.suggestionList.contains(DisplayObject(param1.target)))
         {
            this.closeSuggestionList();
         }
      }
      
      override protected function cancelButton_clickHandler(param1:MouseEvent) : void
      {
         this.closeSuggestionList();
         super.cancelButton_clickHandler(param1);
      }
      
      protected function updateSuggestions() : void
      {
         var _loc1_:String = null;
         var _loc2_:String = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc3_:int = text.lastIndexOf(" ");
         if(_loc3_ > -1)
         {
            _loc1_ = text.substr(_loc3_ + 1);
            _loc2_ = text.substr(0,_loc3_ + 1);
         }
         else
         {
            _loc1_ = text;
            _loc2_ = "";
         }
         var _loc4_:Array = this._searchManager.getSuggestions(_loc1_);
         if(_loc4_ && _loc2_ != "")
         {
            _loc6_ = _loc4_.length;
            _loc7_ = 0;
            while(_loc7_ < _loc6_)
            {
               _loc4_[_loc7_] = _loc2_ + _loc4_[_loc7_];
               _loc7_++;
            }
         }
         var _loc5_:Array = _loc4_.filter(this.hasResult);
         this.suggestionSource.source = _loc5_;
         if(this.suggestionSource.length > 0)
         {
            this.openSuggestionList();
         }
         else
         {
            this.closeSuggestionList();
         }
      }
      
      private function hasResult(param1:*, param2:int, param3:Array) : Boolean
      {
         return this._searchManager.hasResult(!!this.themeId?this.themeId:ThemeManager.instance.currentTheme.id,assetType,param1);
      }
      
      override public function set isSearching(param1:Boolean) : void
      {
         super.isSearching = param1;
         if(param1)
         {
            this.closeSuggestionList();
         }
         _searchFromList = false;
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this.suggestionList)
         {
            this.suggestionList.maxHeight = this._suggestionListMaxHeight;
            this.suggestionList.dataProvider = this.suggestionSource;
            this.suggestionList.addEventListener(SearchSuggestionEvent.LEAVE,this.suggestionList_leaveHandler);
            this.suggestionList.addEventListener(SearchSuggestionEvent.SEARCH,this.suggestionList_searchHandler);
            this.suggestionList.addEventListener(IndexChangeEvent.CHANGE,this.suggestionList_indexChangeHandler);
         }
         else if(param2 == this.popUp)
         {
            this.popUp.autoClose = false;
         }
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         super.partRemoved(param1,param2);
         if(param2 == this.suggestionList)
         {
            this.suggestionList.removeEventListener(SearchSuggestionEvent.LEAVE,this.suggestionList_leaveHandler);
            this.suggestionList.removeEventListener(SearchSuggestionEvent.SEARCH,this.suggestionList_searchHandler);
            this.suggestionList.removeEventListener(IndexChangeEvent.CHANGE,this.suggestionList_indexChangeHandler);
         }
      }
      
      protected function suggestionList_leaveHandler(param1:SearchSuggestionEvent) : void
      {
         setFocus();
         text = this._userInput;
         var _loc2_:int = text.length;
         selectRange(_loc2_,_loc2_);
      }
      
      protected function suggestionList_searchHandler(param1:SearchSuggestionEvent) : void
      {
         this.text = param1.keyword;
         _searchFromList = true;
         dispatchEvent(new FlexEvent(FlexEvent.ENTER));
      }
      
      protected function suggestionList_indexChangeHandler(param1:IndexChangeEvent) : void
      {
         var _loc2_:String = this.suggestionList.selectedItem as String;
         if(_loc2_)
         {
            text = _loc2_;
         }
      }
      
      protected function studioManager_closeSuggestionPopUpHandler(param1:StudioEvent) : void
      {
         this.closeSuggestionList();
      }
      
      [Bindable(event="propertyChange")]
      public function get suggestionListMaxHeight() : Number
      {
         return this._suggestionListMaxHeight;
      }
      
      private function set _1715639561suggestionListMaxHeight(param1:Number) : void
      {
         this._suggestionListMaxHeight = param1;
         if(this.suggestionList)
         {
            this.suggestionList.maxHeight = param1;
         }
      }
      
      public function set suggestionListMaxHeight(param1:Number) : void
      {
         var _loc2_:Object = this.suggestionListMaxHeight;
         if(_loc2_ !== param1)
         {
            this._1715639561suggestionListMaxHeight = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"suggestionListMaxHeight",_loc2_,param1));
            }
         }
      }
   }
}
