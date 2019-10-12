package anifire.studio.components
{
   import anifire.studio.skins.ArrowTipContainerSkin;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.components.supportClasses.SkinnableComponent;
   
   use namespace mx_internal;
   
   public class ArrowTipContainer extends SkinnableComponent
   {
       
      
      [SkinPart(required="true")]
      public var contentGroup:Group;
      
      protected var contentMXML:Array;
      
      private var _1019779949offset:Number = 10;
      
      private var _2092294475targetWidth:Number = 40;
      
      protected var _tipPosition:String = "above";
      
      public function ArrowTipContainer()
      {
         super();
         setStyle("skinClass",ArrowTipContainerSkin);
      }
      
      [Bindable(event="propertyChange")]
      public function get tipPosition() : String
      {
         return this._tipPosition;
      }
      
      private function set _1205996828tipPosition(param1:String) : void
      {
         if(this._tipPosition != param1)
         {
            this._tipPosition = param1;
            invalidateSkinState();
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get content() : Array
      {
         if(this.contentGroup)
         {
            return this.contentGroup.getMXMLContent();
         }
         return this.contentMXML;
      }
      
      private function set _951530617content(param1:Array) : void
      {
         if(this.contentGroup)
         {
            this.contentGroup.mxmlContent = param1;
         }
         else
         {
            this.contentMXML = param1;
         }
      }
      
      override protected function getCurrentSkinState() : String
      {
         switch(this.tipPosition)
         {
            case "below":
               return "below";
            case "above":
            default:
               return "above";
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this.contentGroup)
         {
            this.contentGroup.mxmlContent = this.contentMXML;
            this.contentMXML = null;
         }
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         super.partRemoved(param1,param2);
         if(param2 == this.contentGroup)
         {
            this.contentMXML = this.contentGroup.getMXMLContent();
            this.contentGroup.mxmlContent = null;
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get offset() : Number
      {
         return this._1019779949offset;
      }
      
      public function set offset(param1:Number) : void
      {
         var _loc2_:Object = this._1019779949offset;
         if(_loc2_ !== param1)
         {
            this._1019779949offset = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"offset",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get targetWidth() : Number
      {
         return this._2092294475targetWidth;
      }
      
      public function set targetWidth(param1:Number) : void
      {
         var _loc2_:Object = this._2092294475targetWidth;
         if(_loc2_ !== param1)
         {
            this._2092294475targetWidth = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"targetWidth",_loc2_,param1));
            }
         }
      }
      
      public function set tipPosition(param1:String) : void
      {
         var _loc2_:Object = this.tipPosition;
         if(_loc2_ !== param1)
         {
            this._1205996828tipPosition = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tipPosition",_loc2_,param1));
            }
         }
      }
      
      public function set content(param1:Array) : void
      {
         var _loc2_:Object = this.content;
         if(_loc2_ !== param1)
         {
            this._951530617content = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"content",_loc2_,param1));
            }
         }
      }
   }
}
