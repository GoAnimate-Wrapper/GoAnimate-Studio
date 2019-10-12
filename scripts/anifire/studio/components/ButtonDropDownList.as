package anifire.studio.components
{
   import anifire.studio.events.MenuItemEvent;
   import anifire.studio.interfaces.IMenuItemOwner;
   import anifire.studio.interfaces.IMenuItemRenderer;
   import anifire.studio.models.MenuItemModel;
   import anifire.studio.skins.ButtonDropDownListSkin;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import mx.events.PropertyChangeEvent;
   import spark.components.supportClasses.ButtonBase;
   
   public class ButtonDropDownList extends DropDownList implements IMenuItemOwner
   {
       
      
      [SkinPart(required="false")]
      public var mainButton:ButtonBase;
      
      protected var _label:String;
      
      private var _disableCloseDropDown:Boolean = false;
      
      protected var _activeItem:IMenuItemRenderer;
      
      public function ButtonDropDownList()
      {
         super();
         buttonMode = true;
         setStyle("skinClass",ButtonDropDownListSkin);
      }
      
      [Bindable(event="propertyChange")]
      public function get label() : String
      {
         return this._label;
      }
      
      private function set _102727412label(param1:String) : void
      {
         if(this._label != param1)
         {
            this._label = param1;
            if(this.mainButton)
            {
               this.mainButton.label = this._label;
            }
         }
      }
      
      public function set activeItem(param1:IMenuItemRenderer) : void
      {
         this._activeItem = param1;
      }
      
      public function get activeItem() : IMenuItemRenderer
      {
         return this._activeItem;
      }
      
      public function closeActiveItem() : void
      {
         if(this._activeItem)
         {
            this._activeItem.closeSubMenu();
         }
      }
      
      public function menuItemClicked(param1:MenuItemModel, param2:Boolean, param3:MouseEvent) : void
      {
         if(!param2)
         {
            param1.toggle();
         }
         var _loc4_:MenuItemEvent = new MenuItemEvent(MenuItemEvent.ITEM_CLICK,param1);
         _loc4_.isPropagated = param2;
         _loc4_.mouseEvent = param3;
         dispatchEvent(_loc4_);
      }
      
      protected function openButton_clickHandler(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
      }
      
      override protected function keyDownHandler(param1:KeyboardEvent) : void
      {
      }
      
      override public function closeDropDown(param1:Boolean) : void
      {
         if(!this._disableCloseDropDown)
         {
            super.closeDropDown(param1);
         }
      }
      
      override protected function item_mouseDownHandler(param1:MouseEvent) : void
      {
         this._disableCloseDropDown = true;
         super.item_mouseDownHandler(param1);
         this._disableCloseDropDown = false;
         var _loc2_:MenuItemModel = this.selectedItem as MenuItemModel;
         if(_loc2_ && _loc2_.selectable)
         {
            this.menuItemClicked(_loc2_,false,param1);
            this.closeDropDown(true);
         }
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         super.partRemoved(param1,param2);
         if(param2 == openButton)
         {
            openButton.removeEventListener(MouseEvent.CLICK,this.openButton_clickHandler);
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this.mainButton)
         {
            this.mainButton.label = this._label;
         }
         else if(param2 == openButton)
         {
            openButton.addEventListener(MouseEvent.CLICK,this.openButton_clickHandler);
         }
      }
      
      public function set label(param1:String) : void
      {
         var _loc2_:Object = this.label;
         if(_loc2_ !== param1)
         {
            this._102727412label = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"label",_loc2_,param1));
            }
         }
      }
   }
}
