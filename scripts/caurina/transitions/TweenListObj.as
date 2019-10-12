package caurina.transitions
{
   public class TweenListObj
   {
       
      
      public var scope:Object;
      
      public var properties:Object;
      
      public var auxProperties:Object;
      
      public var timeStart:Number;
      
      public var timeComplete:Number;
      
      public var useFrames:Boolean;
      
      public var transition:Function;
      
      public var onStart:Function;
      
      public var onUpdate:Function;
      
      public var onComplete:Function;
      
      public var onOverwrite:Function;
      
      public var onError:Function;
      
      public var onStartParams:Array;
      
      public var onUpdateParams:Array;
      
      public var onCompleteParams:Array;
      
      public var onOverwriteParams:Array;
      
      public var rounded:Boolean;
      
      public var isPaused:Boolean;
      
      public var timePaused:Number;
      
      public var isCaller:Boolean;
      
      public var count:Number;
      
      public var timesCalled:Number;
      
      public var waitFrames:Boolean;
      
      public var skipUpdates:Number;
      
      public var updatesSkipped:Number;
      
      public var hasStarted:Boolean;
      
      public function TweenListObj(param1:Object, param2:Number, param3:Number, param4:Boolean, param5:Function)
      {
         super();
         this.scope = param1;
         this.timeStart = param2;
         this.timeComplete = param3;
         this.useFrames = param4;
         this.transition = param5;
         this.auxProperties = new Object();
         this.properties = new Object();
         this.isPaused = false;
         this.timePaused = undefined;
         this.isCaller = false;
         this.updatesSkipped = 0;
         this.timesCalled = 0;
         this.skipUpdates = 0;
         this.hasStarted = false;
      }
      
      public static function makePropertiesChain(param1:Object) : Object
      {
         var _loc3_:Object = null;
         var _loc4_:Object = null;
         var _loc5_:Object = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc2_:Object = param1.base;
         if(_loc2_)
         {
            _loc3_ = {};
            if(_loc2_ is Array)
            {
               _loc4_ = [];
               _loc8_ = 0;
               while(_loc8_ < _loc2_.length)
               {
                  _loc4_.push(_loc2_[_loc8_]);
                  _loc8_++;
               }
            }
            else
            {
               _loc4_ = [_loc2_];
            }
            _loc4_.push(param1);
            _loc6_ = _loc4_.length;
            _loc7_ = 0;
            while(_loc7_ < _loc6_)
            {
               if(_loc4_[_loc7_]["base"])
               {
                  _loc5_ = AuxFunctions.concatObjects(makePropertiesChain(_loc4_[_loc7_]["base"]),_loc4_[_loc7_]);
               }
               else
               {
                  _loc5_ = _loc4_[_loc7_];
               }
               _loc3_ = AuxFunctions.concatObjects(_loc3_,_loc5_);
               _loc7_++;
            }
            if(_loc3_["base"])
            {
               delete _loc3_["base"];
            }
            return _loc3_;
         }
         return param1;
      }
      
      public function clone(param1:Boolean) : TweenListObj
      {
         var _loc3_:* = null;
         var _loc2_:TweenListObj = new TweenListObj(this.scope,this.timeStart,this.timeComplete,this.useFrames,this.transition);
         _loc2_.properties = new Array();
         for(_loc3_ in this.properties)
         {
            _loc2_.properties[_loc3_] = this.properties[_loc3_].clone();
         }
         _loc2_.skipUpdates = this.skipUpdates;
         _loc2_.updatesSkipped = this.updatesSkipped;
         if(!param1)
         {
            _loc2_.onStart = this.onStart;
            _loc2_.onUpdate = this.onUpdate;
            _loc2_.onComplete = this.onComplete;
            _loc2_.onOverwrite = this.onOverwrite;
            _loc2_.onError = this.onError;
            _loc2_.onStartParams = this.onStartParams;
            _loc2_.onUpdateParams = this.onUpdateParams;
            _loc2_.onCompleteParams = this.onCompleteParams;
            _loc2_.onOverwriteParams = this.onOverwriteParams;
         }
         _loc2_.rounded = this.rounded;
         _loc2_.isPaused = this.isPaused;
         _loc2_.timePaused = this.timePaused;
         _loc2_.isCaller = this.isCaller;
         _loc2_.count = this.count;
         _loc2_.timesCalled = this.timesCalled;
         _loc2_.waitFrames = this.waitFrames;
         _loc2_.hasStarted = this.hasStarted;
         return _loc2_;
      }
      
      public function toString() : String
      {
         var _loc1_:* = "\n[TweenListObj ";
         _loc1_ = _loc1_ + ("scope:" + String(this.scope));
         _loc1_ = _loc1_ + ", properties:";
         var _loc2_:uint = 0;
         while(_loc2_ < this.properties.length)
         {
            if(_loc2_ > 0)
            {
               _loc1_ = _loc1_ + ",";
            }
            _loc1_ = _loc1_ + ("[name:" + this.properties[_loc2_].name);
            _loc1_ = _loc1_ + (",valueStart:" + this.properties[_loc2_].valueStart);
            _loc1_ = _loc1_ + (",valueComplete:" + this.properties[_loc2_].valueComplete);
            _loc1_ = _loc1_ + "]";
            _loc2_++;
         }
         _loc1_ = _loc1_ + (", timeStart:" + String(this.timeStart));
         _loc1_ = _loc1_ + (", timeComplete:" + String(this.timeComplete));
         _loc1_ = _loc1_ + (", useFrames:" + String(this.useFrames));
         _loc1_ = _loc1_ + (", transition:" + String(this.transition));
         if(this.skipUpdates)
         {
            _loc1_ = _loc1_ + (", skipUpdates:" + String(this.skipUpdates));
         }
         if(this.updatesSkipped)
         {
            _loc1_ = _loc1_ + (", updatesSkipped:" + String(this.updatesSkipped));
         }
         if(Boolean(this.onStart))
         {
            _loc1_ = _loc1_ + (", onStart:" + String(this.onStart));
         }
         if(Boolean(this.onUpdate))
         {
            _loc1_ = _loc1_ + (", onUpdate:" + String(this.onUpdate));
         }
         if(Boolean(this.onComplete))
         {
            _loc1_ = _loc1_ + (", onComplete:" + String(this.onComplete));
         }
         if(Boolean(this.onOverwrite))
         {
            _loc1_ = _loc1_ + (", onOverwrite:" + String(this.onOverwrite));
         }
         if(Boolean(this.onError))
         {
            _loc1_ = _loc1_ + (", onError:" + String(this.onError));
         }
         if(this.onStartParams)
         {
            _loc1_ = _loc1_ + (", onStartParams:" + String(this.onStartParams));
         }
         if(this.onUpdateParams)
         {
            _loc1_ = _loc1_ + (", onUpdateParams:" + String(this.onUpdateParams));
         }
         if(this.onCompleteParams)
         {
            _loc1_ = _loc1_ + (", onCompleteParams:" + String(this.onCompleteParams));
         }
         if(this.onOverwriteParams)
         {
            _loc1_ = _loc1_ + (", onOverwriteParams:" + String(this.onOverwriteParams));
         }
         if(this.rounded)
         {
            _loc1_ = _loc1_ + (", rounded:" + String(this.rounded));
         }
         if(this.isPaused)
         {
            _loc1_ = _loc1_ + (", isPaused:" + String(this.isPaused));
         }
         if(this.timePaused)
         {
            _loc1_ = _loc1_ + (", timePaused:" + String(this.timePaused));
         }
         if(this.isCaller)
         {
            _loc1_ = _loc1_ + (", isCaller:" + String(this.isCaller));
         }
         if(this.count)
         {
            _loc1_ = _loc1_ + (", count:" + String(this.count));
         }
         if(this.timesCalled)
         {
            _loc1_ = _loc1_ + (", timesCalled:" + String(this.timesCalled));
         }
         if(this.waitFrames)
         {
            _loc1_ = _loc1_ + (", waitFrames:" + String(this.waitFrames));
         }
         if(this.hasStarted)
         {
            _loc1_ = _loc1_ + (", hasStarted:" + String(this.hasStarted));
         }
         _loc1_ = _loc1_ + "]\n";
         return _loc1_;
      }
   }
}
