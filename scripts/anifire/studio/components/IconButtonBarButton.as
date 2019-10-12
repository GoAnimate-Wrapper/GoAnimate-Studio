package anifire.studio.components
{
   import flash.events.Event;
   import mx.events.PropertyChangeEvent;
   import spark.components.ButtonBarButton;
   import spark.components.Group;
   import spark.components.supportClasses.TextBase;
   
   public class IconButtonBarButton extends ButtonBarButton
   {
       
      
      [SkinPart(required="false")]
      public var notificationGroup:Group;
      
      [SkinPart(required="false")]
      public var notificationLabel:TextBase;
      
      protected var _notificationCount:int;
      
      protected var _hasLabel:Boolean;
      
      public function IconButtonBarButton()
      {
         super();
         buttonMode = true;
      }
      
      [Bindable(event="propertyChange")]
      public function get notificationCount() : int
      {
         return this._notificationCount;
      }
      
      private function set _1597918492notificationCount(param1:int) : void
      {
         if(param1 > 99)
         {
            param1 = 99;
         }
         this._notificationCount = param1;
         if(this._notificationCount > 0)
         {
            this.updateNotificationLabel();
         }
         this.updateNotificationGroup();
      }
      
      protected function updateNotificationGroup() : void
      {
         var _loc1_:* = this._notificationCount > 0;
         if(this.notificationGroup)
         {
            this.notificationGroup.visible = _loc1_;
            this.notificationGroup.includeInLayout = _loc1_;
         }
      }
      
      protected function updateNotificationLabel() : void
      {
         if(this.notificationLabel)
         {
            this.notificationLabel.text = String(this._notificationCount);
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hasLabel() : Boolean
      {
         return this._hasLabel;
      }
      
      private function set _122719354hasLabel(param1:Boolean) : void
      {
         this._hasLabel = param1;
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == iconDisplay)
         {
            this.updateIcon();
         }
         else if(param2 == this.notificationGroup)
         {
            this.updateNotificationGroup();
         }
         else if(param2 == this.notificationLabel)
         {
            this.updateNotificationLabel();
         }
      }
      
      override public function styleChanged(param1:String) : void
      {
         super.styleChanged(param1);
         if(!param1 || param1 == "styleName" || param1 == "iconNormal" || param1 == "iconOver")
         {
            this.updateIcon();
         }
      }
      
      override protected function stateChanged(param1:String, param2:String, param3:Boolean) : void
      {
         super.stateChanged(param1,param2,param3);
         this.updateIcon();
      }
      
      override public function set data(param1:Object) : void
      {
         this.removeNotificationListener();
         super.data = param1;
         this.styleName = data.styleName;
         this.label = data.label;
         this.addNotificationListener();
         this.updateNavigatorNotification();
      }
      
      protected function addNotificationListener() : void
      {
         var _loc1_:NavigatorContent = data as NavigatorContent;
         if(_loc1_)
         {
            _loc1_.addEventListener("notificationChange",this.onNotificationChange);
         }
      }
      
      protected function removeNotificationListener() : void
      {
         var _loc1_:NavigatorContent = data as NavigatorContent;
         if(_loc1_)
         {
            _loc1_.removeEventListener("notificationChange",this.onNotificationChange);
         }
      }
      
      protected function updateNavigatorNotification() : void
      {
         var _loc1_:NavigatorContent = data as NavigatorContent;
         if(_loc1_)
         {
            this.notificationCount = _loc1_.notificationCount;
         }
      }
      
      protected function onNotificationChange(param1:Event) : void
      {
         this.updateNavigatorNotification();
      }
      
      override public function set label(param1:String) : void
      {
         super.label = param1;
         this.hasLabel = param1 && param1.length > 0;
      }
      
      protected function updateIcon() : void
      {
         var _loc1_:String = null;
         var _loc2_:Class = null;
         var _loc3_:Class = null;
         if(iconDisplay)
         {
            _loc1_ = getCurrentSkinState();
            _loc2_ = getStyle("iconNormal");
            _loc3_ = getStyle("iconOver");
            switch(_loc1_)
            {
               case "up":
               case "disabled":
               case "disabledAndSelected":
                  iconDisplay.source = _loc2_;
                  break;
               default:
                  iconDisplay.source = !!_loc3_?_loc3_:_loc2_;
            }
         }
      }
      
      public function set hasLabel(param1:Boolean) : void
      {
         var _loc2_:Object = this.hasLabel;
         if(_loc2_ !== param1)
         {
            this._122719354hasLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hasLabel",_loc2_,param1));
            }
         }
      }
      
      public function set notificationCount(param1:int) : void
      {
         var _loc2_:Object = this.notificationCount;
         if(_loc2_ !== param1)
         {
            this._1597918492notificationCount = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"notificationCount",_loc2_,param1));
            }
         }
      }
   }
}
