package anifire.studio.components
{
   import anifire.studio.events.SearchSuggestionEvent;
   import anifire.studio.skins.SearchSuggestionListSkin;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.ui.Keyboard;
   import mx.core.IVisualElement;
   import spark.components.List;
   import spark.components.supportClasses.ItemRenderer;
   import spark.events.IndexChangeEvent;
   import spark.events.RendererExistenceEvent;
   
   public class SearchSuggestionList extends List
   {
       
      
      public function SearchSuggestionList()
      {
         super();
         setStyle("skinClass",SearchSuggestionListSkin);
         addEventListener(RendererExistenceEvent.RENDERER_ADD,this.rendererAddHandler);
         addEventListener(RendererExistenceEvent.RENDERER_REMOVE,this.rendererRemoveHandler);
      }
      
      public function selectFirstItem() : void
      {
         selectedIndex = 0;
         this.ensureIndexIsVisible(selectedIndex);
         setFocus();
         dispatchEvent(new IndexChangeEvent(IndexChangeEvent.CHANGE));
      }
      
      public function selectLastItem() : void
      {
         selectedIndex = dataProvider.length - 1;
         this.ensureIndexIsVisible(selectedIndex);
         setFocus();
         dispatchEvent(new IndexChangeEvent(IndexChangeEvent.CHANGE));
      }
      
      override protected function keyDownHandler(param1:KeyboardEvent) : void
      {
         var _loc3_:Boolean = false;
         var _loc2_:int = param1.keyCode;
         switch(_loc2_)
         {
            case Keyboard.UP:
               if(selectedIndex == 0)
               {
                  _loc3_ = true;
               }
               break;
            case Keyboard.DOWN:
               if(selectedIndex == dataProvider.length - 1)
               {
                  _loc3_ = true;
               }
               break;
            case Keyboard.ENTER:
               if(selectedItem != null)
               {
                  this.performSearch(selectedItem as String);
                  return;
               }
         }
         if(_loc3_)
         {
            selectedIndex = -1;
            dispatchEvent(new SearchSuggestionEvent(SearchSuggestionEvent.LEAVE));
            param1.preventDefault();
         }
         super.keyDownHandler(param1);
      }
      
      protected function rendererAddHandler(param1:RendererExistenceEvent) : void
      {
         var _loc2_:IVisualElement = param1.renderer;
         _loc2_.addEventListener(MouseEvent.CLICK,this.renderer_clickHandler);
      }
      
      protected function rendererRemoveHandler(param1:RendererExistenceEvent) : void
      {
         var _loc2_:IVisualElement = param1.renderer;
         _loc2_.removeEventListener(MouseEvent.CLICK,this.renderer_clickHandler);
      }
      
      protected function renderer_clickHandler(param1:MouseEvent) : void
      {
         var _loc2_:ItemRenderer = param1.currentTarget as ItemRenderer;
         if(_loc2_)
         {
            this.performSearch(_loc2_.data as String);
         }
      }
      
      protected function performSearch(param1:String) : void
      {
         var _loc2_:SearchSuggestionEvent = new SearchSuggestionEvent(SearchSuggestionEvent.SEARCH);
         _loc2_.keyword = param1;
         dispatchEvent(_loc2_);
      }
   }
}
