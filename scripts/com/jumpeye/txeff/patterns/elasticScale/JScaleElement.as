package com.jumpeye.txeff.patterns.elasticScale
{
   import flash.display.Sprite;
   
   public dynamic class JScaleElement extends Sprite
   {
       
      
      public var position:String;
      
      public var align:String;
      
      public var isMoving:Boolean = true;
      
      private var axe1;
      
      private var axe2:String;
      
      public var nextChild;
      
      private var dim2;
      
      private var dim1;
      
      public var isLines:Boolean;
      
      public var difX:Number;
      
      public var prevChild;
      
      public var staticElement;
      
      public function JScaleElement()
      {
         super();
      }
      
      public function init() : void
      {
         if(!isLines)
         {
            dim1 = "width";
            dim2 = "height";
            axe1 = "x";
            axe2 = "y";
         }
         else
         {
            dim1 = "height";
            dim2 = "width";
            axe1 = "y";
            axe2 = "x";
         }
      }
      
      public function setPosition() : *
      {
         if(align == "left" || align == "top")
         {
            if(prevChild && isMoving)
            {
               this[axe1] = this.prevChild[axe1] + this.prevChild[dim1] + this.difX;
            }
            if(nextChild)
            {
               nextChild.setPosition();
            }
         }
         if(align == "right" || align == "bottom")
         {
            if(nextChild && isMoving)
            {
               this[axe1] = this.nextChild[axe1] - this.difX - this[dim1];
            }
            if(prevChild)
            {
               prevChild.setPosition();
            }
         }
         if(align == "center" || align == "middle")
         {
            if(position == "right")
            {
               if(prevChild && isMoving)
               {
                  this[axe1] = this.prevChild[axe1] + this.prevChild[dim1] + this.difX;
               }
               if(nextChild)
               {
                  nextChild.setPosition();
               }
            }
            if(position == "left")
            {
               if(nextChild && isMoving)
               {
                  this[axe1] = this.nextChild[axe1] - this.difX - this[dim1];
               }
               if(prevChild)
               {
                  prevChild.setPosition();
               }
            }
         }
      }
   }
}
