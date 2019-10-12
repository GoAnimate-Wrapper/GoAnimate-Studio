package anifire.studio.components
{
   import anifire.studio.models.AssetSharingCollection;
   import anifire.studio.models.AssetSharingModel;
   import flash.events.MouseEvent;
   import mx.core.mx_internal;
   import spark.components.supportClasses.ItemRenderer;
   import spark.events.DropDownEvent;
   
   public class MultiSelectionDropDown extends spark.components.DropDownList
   {
       
      
      public function MultiSelectionDropDown()
      {
         super();
         requireSelection = false;
      }
      
      override protected function item_mouseDownHandler(param1:MouseEvent) : void
      {
         var _loc2_:MultiSelectItemRenderer = param1.currentTarget as MultiSelectItemRenderer;
         this.updateItemRendererSelection(_loc2_);
      }
      
      override protected function dropDownController_closeHandler(param1:DropDownEvent) : void
      {
         selectedIndex = -1;
         super.dropDownController_closeHandler(param1);
      }
      
      protected function updateItemRendererSelection(param1:ItemRenderer) : void
      {
         var _loc2_:AssetSharingCollection = dataProvider as AssetSharingCollection;
         var _loc3_:AssetSharingModel = param1.data as AssetSharingModel;
         if(_loc3_)
         {
            if(_loc3_.sharingNone)
            {
               _loc2_.selectOwnerItem();
            }
            else
            {
               if(_loc3_.sharingTeam)
               {
                  if(!_loc3_.selected)
                  {
                     _loc2_.selectTeamItem();
                  }
                  else
                  {
                     _loc3_.selected = false;
                  }
               }
               else
               {
                  _loc3_.selected = !_loc3_.selected;
                  _loc2_.teamItem.selected = _loc2_.properItemCount > 0 && _loc2_.selectedProperItemCount >= _loc2_.properItemCount;
               }
               _loc2_.updateDefaultItems();
            }
         }
      }
      
      override mx_internal function updateLabelDisplay(param1:* = undefined) : void
      {
         var _loc2_:AssetSharingCollection = null;
         if(labelDisplay)
         {
            _loc2_ = dataProvider as AssetSharingCollection;
            if(_loc2_)
            {
               labelDisplay.text = _loc2_.collectionLabel;
            }
         }
      }
   }
}
