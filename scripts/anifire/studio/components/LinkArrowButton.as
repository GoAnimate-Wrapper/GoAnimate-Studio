package anifire.studio.components
{
   import anifire.studio.skins.LinkArrowButtonSkin;
   import spark.components.Button;
   import spark.primitives.Path;
   
   public class LinkArrowButton extends Button
   {
      
      public static const ARROW_DIRECTION_STYLE:String = "arrowDirection";
      
      public static const ARROW_POSITION_STYLE:String = "arrowPosition";
       
      
      [SkinPart(required="false")]
      public var leftArrow:Path;
      
      [SkinPart(required="false")]
      public var rightArrow:Path;
      
      protected var _arrowData:String;
      
      public function LinkArrowButton()
      {
         super();
         buttonMode = true;
         setStyle("skinClass",LinkArrowButtonSkin);
         setStyle(ARROW_DIRECTION_STYLE,"right");
         setStyle(ARROW_POSITION_STYLE,"right");
      }
      
      override public function styleChanged(param1:String) : void
      {
         super.styleChanged(param1);
         if(!param1 || param1 == ARROW_DIRECTION_STYLE)
         {
            this.updateArrowData();
         }
         if(!param1 || param1 == ARROW_POSITION_STYLE)
         {
            this.updateArrowPosition();
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this.leftArrow || param2 == this.rightArrow)
         {
            this.updateArrowData();
            this.updateArrowPosition();
         }
      }
      
      protected function updateArrowData() : void
      {
         switch(getStyle(ARROW_DIRECTION_STYLE))
         {
            case "up":
               this._arrowData = "M 0 0 l 4 -4 l 4 4";
               break;
            case "down":
               this._arrowData = "M 0 0 l 4 4 l 4 -4";
               break;
            case "left":
               this._arrowData = "M 0 0 l -4 4 l 4 4";
               break;
            case "right":
               this._arrowData = "M 0 0 l 4 4 l -4 4";
         }
         if(this.leftArrow)
         {
            this.leftArrow.data = this._arrowData;
         }
         if(this.rightArrow)
         {
            this.rightArrow.data = this._arrowData;
         }
      }
      
      protected function updateArrowPosition() : void
      {
         var _loc1_:String = getStyle(ARROW_POSITION_STYLE);
         if(this.leftArrow)
         {
            this.leftArrow.visible = this.leftArrow.includeInLayout = _loc1_ == "left";
         }
         if(this.rightArrow)
         {
            this.rightArrow.visible = this.rightArrow.includeInLayout = _loc1_ == "right";
         }
      }
   }
}
