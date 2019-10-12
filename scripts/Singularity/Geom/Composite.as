package Singularity.Geom
{
   import Singularity.Events.SingularityEvent;
   import Singularity.Numeric.Consts;
   import Singularity.Numeric.Gauss;
   import flash.display.Sprite;
   import flash.events.EventDispatcher;
   
   public class Composite extends EventDispatcher
   {
       
      
      protected var __count:uint;
      
      protected var __invalidate:Boolean;
      
      protected var __error:SingularityEvent;
      
      protected var __container:Sprite;
      
      protected var __consts:Consts;
      
      protected var __color:Number;
      
      protected var __thickness:Number;
      
      protected var __param:String;
      
      protected var __integral:Gauss;
      
      protected var __arcLength:Number;
      
      protected var __spline:FastCubicSpline;
      
      public function Composite()
      {
         super();
         this.__color = 13421772;
         this.__thickness = 3;
         this.__count = 0;
         this.__invalidate = true;
         this.__container = null;
         this.__arcLength = -1;
         this.__error = new SingularityEvent(SingularityEvent.ERROR);
         this.__error.classname = "Composite";
         this.__consts = new Consts();
         this.__spline = new FastCubicSpline();
         this.__integral = new Gauss();
      }
      
      public function set color(param1:uint) : void
      {
         this.__color = param1;
      }
      
      public function set thickness(param1:uint) : void
      {
         this.__thickness = Math.round(param1);
      }
      
      public function set container(param1:Sprite) : void
      {
         this.__container = param1;
      }
      
      public function set parameterize(param1:String) : void
      {
         if(param1 == Consts.ARC_LENGTH || param1 == Consts.UNIFORM)
         {
            this.__param = param1;
            this.__invalidate = true;
         }
      }
      
      public function reColor(param1:Number) : void
      {
      }
      
      public function reDraw() : void
      {
      }
      
      public function __integrand(param1:Number) : Number
      {
         throw new Error("Composite::__integrand() must be overriden");
      }
      
      public function arcLength() : Number
      {
         throw new Error("Composite::arcLength() must be overriden");
      }
      
      public function arcLengthAt(param1:Number) : Number
      {
         throw new Error("Composite::arcLengthAt() must be overriden");
      }
      
      public function addControlPoint(param1:Number, param2:Number) : void
      {
         throw new Error("Composite::addControlPoint() must be overriden");
      }
      
      public function moveControlPoint(param1:uint, param2:Number, param3:Number) : void
      {
         throw new Error("Composite::addControlPoint() must be overriden");
      }
      
      public function draw(param1:Number = 1.0, param2:Number = 3, param3:Number = 3, param4:Number = 15) : void
      {
         throw new Error("Composite::draw() must be overriden");
      }
      
      public function reset() : void
      {
         throw new Error("Composite::reset() must be overriden");
      }
      
      public function getX(param1:Number) : Number
      {
         throw new Error("Composite::getX() must be overriden");
      }
      
      public function getY(param1:Number) : Number
      {
         throw new Error("Composite::getY() must be overriden");
      }
   }
}
