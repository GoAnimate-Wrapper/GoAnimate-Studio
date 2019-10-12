package fl.transitions
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.geom.Rectangle;
   
   public class TransitionManager extends EventDispatcher
   {
      
      private static var IDCount:int = 0;
       
      
      public var type:Object;
      
      public var className:String = "TransitionManager";
      
      private var _content:MovieClip;
      
      private var _transitions:Object;
      
      public var _innerBounds:Rectangle;
      
      public var _outerBounds:Rectangle;
      
      public var _width:Number = NaN;
      
      public var _height:Number = NaN;
      
      private var _contentAppearance:Object;
      
      private var _visualPropList:Object;
      
      private var _triggerEvent:String;
      
      public function TransitionManager(param1:MovieClip)
      {
         this.type = TransitionManager;
         this._visualPropList = {
            "x":null,
            "y":null,
            "scaleX":null,
            "scaleY":null,
            "alpha":null,
            "rotation":null
         };
         super();
         this.content = param1;
         this._transitions = {};
      }
      
      public static function start(param1:MovieClip, param2:Object) : Transition
      {
         if(!param1.__transitionManager)
         {
            param1.__transitionManager = new TransitionManager(param1);
         }
         if(param2.direction == 1)
         {
            param1.__transitionManager._triggerEvent = "hide";
         }
         else
         {
            param1.__transitionManager._triggerEvent = "reveal";
         }
         return param1.__transitionManager.startTransition(param2);
      }
      
      public function get content() : MovieClip
      {
         return this._content;
      }
      
      public function set content(param1:MovieClip) : void
      {
         this._content = param1;
         this.saveContentAppearance();
      }
      
      public function get transitionsList() : Object
      {
         return this._transitions;
      }
      
      public function get numTransitions() : Number
      {
         var _loc2_:Transition = null;
         var _loc1_:Number = 0;
         for each(_loc2_ in this._transitions)
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      public function get numInTransitions() : Number
      {
         var _loc3_:Transition = null;
         var _loc1_:Number = 0;
         var _loc2_:Object = this._transitions;
         for each(_loc3_ in _loc2_)
         {
            if(!_loc3_.direction)
            {
               _loc1_++;
            }
         }
         return _loc1_;
      }
      
      public function get numOutTransitions() : Number
      {
         var _loc3_:Transition = null;
         var _loc1_:Number = 0;
         var _loc2_:Object = this._transitions;
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_.direction)
            {
               _loc1_++;
            }
         }
         return _loc1_;
      }
      
      public function get contentAppearance() : Object
      {
         return this._contentAppearance;
      }
      
      public function startTransition(param1:Object) : Transition
      {
         this.removeTransition(this.findTransition(param1));
         var _loc2_:Class = param1.type;
         var _loc3_:Transition = new _loc2_(this._content,param1,this);
         this.addTransition(_loc3_);
         _loc3_.start();
         return _loc3_;
      }
      
      public function addTransition(param1:Transition) : Transition
      {
         param1.ID = ++TransitionManager.IDCount;
         this._transitions[param1.ID] = param1;
         return param1;
      }
      
      public function removeTransition(param1:Transition) : Boolean
      {
         if(!param1 || !this._transitions || !this._transitions[param1.ID])
         {
            return false;
         }
         param1.cleanUp();
         return delete this._transitions[param1.ID];
      }
      
      public function findTransition(param1:Object) : Transition
      {
         var _loc2_:Transition = null;
         for each(_loc2_ in this._transitions)
         {
            if(_loc2_.type == param1.type)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function removeAllTransitions() : void
      {
         var _loc1_:Transition = null;
         for each(_loc1_ in this._transitions)
         {
            _loc1_.cleanUp();
            this.removeTransition(_loc1_);
         }
      }
      
      public function saveContentAppearance() : void
      {
         var _loc2_:Object = null;
         var _loc3_:* = null;
         var _loc1_:MovieClip = this._content;
         if(!this._contentAppearance)
         {
            _loc2_ = this._contentAppearance = {};
            for(_loc3_ in this._visualPropList)
            {
               _loc2_[_loc3_] = _loc1_[_loc3_];
            }
            _loc2_.colorTransform = _loc1_.transform.colorTransform;
         }
         this._innerBounds = _loc1_.getBounds(_loc1_);
         this._outerBounds = _loc1_.getBounds(_loc1_.parent);
         this._width = _loc1_.width;
         this._height = _loc1_.height;
      }
      
      public function restoreContentAppearance() : void
      {
         var _loc3_:* = null;
         var _loc1_:MovieClip = this._content;
         var _loc2_:Object = this._contentAppearance;
         for(_loc3_ in this._visualPropList)
         {
            _loc1_[_loc3_] = _loc2_[_loc3_];
         }
         _loc1_.transform.colorTransform = _loc2_.colorTransform;
      }
      
      function transitionInDone(param1:Object) : void
      {
         var _loc2_:Boolean = false;
         this.removeTransition(param1.target);
         if(this.numInTransitions == 0)
         {
            _loc2_ = this._content.visible;
            if(this._triggerEvent == "hide" || this._triggerEvent == "hideChild")
            {
               this._content.visible = false;
            }
            if(_loc2_)
            {
               this.dispatchEvent(new Event("allTransitionsInDone"));
            }
         }
      }
      
      function transitionOutDone(param1:Object) : void
      {
         var _loc2_:Boolean = false;
         this.removeTransition(param1.target);
         if(this.numOutTransitions == 0)
         {
            this.restoreContentAppearance();
            _loc2_ = this._content.visible;
            if(_loc2_ && (this._triggerEvent == "hide" || this._triggerEvent == "hideChild"))
            {
               this._content.visible = false;
            }
            if(_loc2_)
            {
               this.dispatchEvent(new Event("allTransitionsOutDone"));
            }
         }
      }
   }
}
