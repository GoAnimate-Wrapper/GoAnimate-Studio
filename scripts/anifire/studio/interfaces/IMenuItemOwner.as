package anifire.studio.interfaces
{
   import anifire.studio.models.MenuItemModel;
   import flash.events.MouseEvent;
   
   public interface IMenuItemOwner
   {
       
      
      function get activeItem() : IMenuItemRenderer;
      
      function set activeItem(param1:IMenuItemRenderer) : void;
      
      function closeActiveItem() : void;
      
      function menuItemClicked(param1:MenuItemModel, param2:Boolean, param3:MouseEvent) : void;
   }
}
