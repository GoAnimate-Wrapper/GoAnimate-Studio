package anifire.studio.models
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import mx.collections.ArrayCollection;
   import mx.events.PropertyChangeEvent;
   
   public class MenuItemModel implements IEventDispatcher
   {
      
      public static const MENU_TYPE_NORMAL:int = 0;
      
      public static const MENU_TYPE_RADIO:int = 1;
      
      public static const MENU_TYPE_CHECKBOX:int = 2;
      
      public static const MENU_TYPE_SEPARATOR:int = 3;
      
      public static const MENU_TYPE_BANNER:int = 4;
      
      public static const MENU_TYPE_UPLOAD:int = 5;
       
      
      private var _102727412label:String;
      
      private var _111972721value;
      
      private var _3226745icon:Class;
      
      private var _100313435image:Class;
      
      private var _859610604imageUrl:String;
      
      private var _244896471parentMenu:MenuItemModel;
      
      protected var _subMenu:ArrayCollection;
      
      protected var _selectable:Boolean = true;
      
      private var _1436069623selectedIndex:int;
      
      private var _603762375menuType:int;
      
      private var _1609594047enabled:Boolean = true;
      
      private var _26774448sortOrder:int;
      
      protected var _selected:Boolean;
      
      private var _bindingEventDispatcher:EventDispatcher;
      
      public function MenuItemModel(param1:String, param2:*, param3:int = 0, param4:ArrayCollection = null, param5:Class = null)
      {
         this._bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
         super();
         this.menuType = param3;
         this.label = param1;
         this.value = param2;
         this.subMenu = param4;
         this.icon = param5;
         if(param3 == MENU_TYPE_SEPARATOR)
         {
            this.enabled = false;
         }
      }
      
      public function get subMenu() : ArrayCollection
      {
         return this._subMenu;
      }
      
      private function set _1868748865subMenu(param1:ArrayCollection) : void
      {
         var _loc2_:int = 0;
         var _loc3_:MenuItemModel = null;
         if(this._subMenu != param1)
         {
            this._subMenu = param1;
            if(this._subMenu)
            {
               _loc2_ = 0;
               while(_loc2_ < this._subMenu.length)
               {
                  _loc3_ = this._subMenu.getItemAt(_loc2_) as MenuItemModel;
                  _loc3_.parentMenu = this;
                  _loc2_++;
               }
            }
         }
      }
      
      public function hasSubMenu() : Boolean
      {
         return this._subMenu && this._subMenu.length > 0;
      }
      
      private function set _1655575466selectable(param1:Boolean) : void
      {
         if(this._selectable != param1)
         {
            this._selectable = param1;
         }
      }
      
      public function get selectable() : Boolean
      {
         return this._selectable && !this.subMenu;
      }
      
      public function get selectedItem() : *
      {
         if(this.subMenu)
         {
            if(this.selectedIndex > 0 && this.selectedIndex < this.subMenu.length)
            {
               return this.subMenu.getItemAt(this.selectedIndex);
            }
         }
         return null;
      }
      
      public function get selected() : Boolean
      {
         return this._selected;
      }
      
      private function set _1191572123selected(param1:Boolean) : void
      {
         if(this._selected != param1)
         {
            this._selected = param1;
         }
      }
      
      public function toggle() : void
      {
         var _loc1_:ArrayCollection = null;
         var _loc2_:int = 0;
         var _loc3_:MenuItemModel = null;
         switch(this.menuType)
         {
            case MENU_TYPE_NORMAL:
               break;
            case MENU_TYPE_RADIO:
               this.selected = true;
               if(this.parentMenu)
               {
                  _loc1_ = this.parentMenu.subMenu;
                  _loc2_ = 0;
                  while(_loc2_ < _loc1_.length)
                  {
                     _loc3_ = _loc1_.getItemAt(_loc2_) as MenuItemModel;
                     if(_loc3_ && _loc3_ != this)
                     {
                        _loc3_.selected = false;
                     }
                     _loc2_++;
                  }
               }
               break;
            case MENU_TYPE_CHECKBOX:
               this.selected = !this.selected;
         }
      }
      
      public function get imageSource() : Object
      {
         if(this.imageUrl)
         {
            return this.imageUrl;
         }
         return this.image;
      }
      
      [Bindable(event="propertyChange")]
      public function get label() : String
      {
         return this._102727412label;
      }
      
      public function set label(param1:String) : void
      {
         var _loc2_:Object = this._102727412label;
         if(_loc2_ !== param1)
         {
            this._102727412label = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"label",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get value() : *
      {
         return this._111972721value;
      }
      
      public function set value(param1:*) : void
      {
         var _loc2_:Object = this._111972721value;
         if(_loc2_ !== param1)
         {
            this._111972721value = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"value",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get icon() : Class
      {
         return this._3226745icon;
      }
      
      public function set icon(param1:Class) : void
      {
         var _loc2_:Object = this._3226745icon;
         if(_loc2_ !== param1)
         {
            this._3226745icon = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"icon",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get image() : Class
      {
         return this._100313435image;
      }
      
      public function set image(param1:Class) : void
      {
         var _loc2_:Object = this._100313435image;
         if(_loc2_ !== param1)
         {
            this._100313435image = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"image",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get imageUrl() : String
      {
         return this._859610604imageUrl;
      }
      
      public function set imageUrl(param1:String) : void
      {
         var _loc2_:Object = this._859610604imageUrl;
         if(_loc2_ !== param1)
         {
            this._859610604imageUrl = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageUrl",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get parentMenu() : MenuItemModel
      {
         return this._244896471parentMenu;
      }
      
      public function set parentMenu(param1:MenuItemModel) : void
      {
         var _loc2_:Object = this._244896471parentMenu;
         if(_loc2_ !== param1)
         {
            this._244896471parentMenu = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"parentMenu",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get selectedIndex() : int
      {
         return this._1436069623selectedIndex;
      }
      
      public function set selectedIndex(param1:int) : void
      {
         var _loc2_:Object = this._1436069623selectedIndex;
         if(_loc2_ !== param1)
         {
            this._1436069623selectedIndex = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"selectedIndex",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get menuType() : int
      {
         return this._603762375menuType;
      }
      
      public function set menuType(param1:int) : void
      {
         var _loc2_:Object = this._603762375menuType;
         if(_loc2_ !== param1)
         {
            this._603762375menuType = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"menuType",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get enabled() : Boolean
      {
         return this._1609594047enabled;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         var _loc2_:Object = this._1609594047enabled;
         if(_loc2_ !== param1)
         {
            this._1609594047enabled = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"enabled",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sortOrder() : int
      {
         return this._26774448sortOrder;
      }
      
      public function set sortOrder(param1:int) : void
      {
         var _loc2_:Object = this._26774448sortOrder;
         if(_loc2_ !== param1)
         {
            this._26774448sortOrder = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sortOrder",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set subMenu(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this.subMenu;
         if(_loc2_ !== param1)
         {
            this._1868748865subMenu = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"subMenu",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set selectable(param1:Boolean) : void
      {
         var _loc2_:Object = this.selectable;
         if(_loc2_ !== param1)
         {
            this._1655575466selectable = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"selectable",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set selected(param1:Boolean) : void
      {
         var _loc2_:Object = this.selected;
         if(_loc2_ !== param1)
         {
            this._1191572123selected = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"selected",_loc2_,param1));
            }
         }
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         this._bindingEventDispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return this._bindingEventDispatcher.dispatchEvent(param1);
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.hasEventListener(param1);
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         this._bindingEventDispatcher.removeEventListener(param1,param2,param3);
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.willTrigger(param1);
      }
   }
}
