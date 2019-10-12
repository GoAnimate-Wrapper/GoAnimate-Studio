package com.jumpeye.flashEff2.symbol.brightSquares
{
   public class JFESBrightSquaresPresets
   {
       
      
      private var matrix:Array;
      
      private var tmpArray:Array;
      
      private var counter:Number;
      
      private var l_b:Array;
      
      private var contor:Number;
      
      private var middle:Number;
      
      private var retObj:Object;
      
      private var l_t:Array;
      
      private var r_b:Array;
      
      private var r_t:Array;
      
      private var i;
      
      private var j:Number;
      
      private var middleCol:Number;
      
      private var way:Array;
      
      private var limit:Array;
      
      private var middleLin:Number;
      
      private var direction:String;
      
      public function JFESBrightSquaresPresets()
      {
         matrix = new Array();
         tmpArray = new Array();
         l_t = new Array();
         l_b = new Array();
         r_t = new Array();
         r_b = new Array();
         limit = new Array();
         way = new Array();
         retObj = {
            "arr":Array,
            "max":uint
         };
         super();
         retObj.arr = [];
         retObj.max = 0;
      }
      
      public function getPresetsArray(param1:*, param2:*, param3:*) : Object
      {
         var _loc4_:* = undefined;
         var _loc5_:Number = NaN;
         var _loc6_:Array = null;
         var _loc7_:Array = null;
         var _loc8_:Array = null;
         var _loc9_:Array = null;
         var _loc10_:Array = null;
         var _loc11_:Array = null;
         var _loc12_:String = null;
         var _loc13_:Number = NaN;
         var _loc14_:* = undefined;
         var _loc15_:Number = NaN;
         switch(param1)
         {
            default:
               retObj.max = param2 * param3 - 1;
               _loc4_ = 0;
               while(_loc4_ < param2)
               {
                  matrix[_loc4_] = new Array();
                  _loc5_ = 0;
                  while(_loc5_ < param3)
                  {
                     matrix[_loc4_][_loc5_] = _loc4_ * param3 + _loc5_;
                     _loc5_++;
                  }
                  _loc4_++;
               }
               break;
            case 2:
               retObj.max = param2 * param3 - 1;
               _loc4_ = 0;
               while(_loc4_ < param2)
               {
                  matrix[_loc4_] = new Array();
                  _loc5_ = 0;
                  while(_loc5_ < param3)
                  {
                     matrix[_loc4_][_loc5_] = _loc4_ * param3 + (param3 - _loc5_ - 1);
                     _loc5_++;
                  }
                  _loc4_++;
               }
               break;
            case 3:
               retObj.max = param2 * param3 - 1;
               _loc4_ = 0;
               while(_loc4_ < param2)
               {
                  matrix[_loc4_] = new Array();
                  _loc5_ = 0;
                  while(_loc5_ < param3)
                  {
                     matrix[_loc4_][_loc5_] = _loc5_ * param2 + _loc4_;
                     _loc5_++;
                  }
                  _loc4_++;
               }
               break;
            case 4:
               retObj.max = param2 * param3 - 1;
               _loc4_ = 0;
               while(_loc4_ < param2)
               {
                  matrix[_loc4_] = new Array();
                  _loc5_ = 0;
                  while(_loc5_ < param3)
                  {
                     matrix[_loc4_][_loc5_] = _loc5_ * param2 + (param2 - _loc4_ - 1);
                     _loc5_++;
                  }
                  _loc4_++;
               }
               break;
            case 5:
               if(param3 % 2 == 0)
               {
                  retObj.max = param2 * param3 / 2 - 1;
                  middle = Math.ceil(param3 / 2) - 1;
                  _loc4_ = 0;
                  while(_loc4_ < param2)
                  {
                     tmpArray[_loc4_] = new Array();
                     _loc5_ = 0;
                     while(_loc5_ <= middle)
                     {
                        tmpArray[_loc4_][_loc5_] = _loc4_ * (middle + 1) + _loc5_;
                        _loc5_++;
                     }
                     _loc4_++;
                  }
                  _loc4_ = 0;
                  while(_loc4_ < param2)
                  {
                     matrix[_loc4_] = new Array();
                     _loc5_ = 0;
                     while(_loc5_ <= middle)
                     {
                        matrix[_loc4_][_loc5_] = tmpArray[_loc4_][middle - _loc5_];
                        _loc5_++;
                     }
                     _loc4_++;
                  }
                  _loc4_ = 0;
                  while(_loc4_ < param2)
                  {
                     _loc5_ = middle + 1;
                     while(_loc5_ < param3)
                     {
                        matrix[_loc4_][_loc5_] = tmpArray[_loc4_][_loc5_ - middle - 1];
                        _loc5_++;
                     }
                     _loc4_++;
                  }
               }
               else if(param3 % 2 == 1)
               {
                  retObj.max = param2 * (param3 + 1) / 2 - 1;
                  middle = Math.ceil(param3 / 2) - 1;
                  _loc4_ = 0;
                  while(_loc4_ < param2)
                  {
                     tmpArray[_loc4_] = new Array();
                     _loc5_ = 0;
                     while(_loc5_ <= middle)
                     {
                        tmpArray[_loc4_][_loc5_] = _loc4_ * (middle + 1) + _loc5_;
                        _loc5_++;
                     }
                     _loc4_++;
                  }
                  _loc4_ = 0;
                  while(_loc4_ < param2)
                  {
                     matrix[_loc4_] = new Array();
                     _loc5_ = 0;
                     while(_loc5_ <= middle)
                     {
                        matrix[_loc4_][_loc5_] = tmpArray[_loc4_][middle - _loc5_];
                        _loc5_++;
                     }
                     _loc4_++;
                  }
                  _loc4_ = 0;
                  while(_loc4_ < param2)
                  {
                     _loc5_ = middle + 1;
                     while(_loc5_ < param3)
                     {
                        matrix[_loc4_][_loc5_] = tmpArray[_loc4_][_loc5_ - middle];
                        _loc5_++;
                     }
                     _loc4_++;
                  }
               }
               break;
            case 6:
               if(param3 % 2 == 0)
               {
                  retObj.max = param2 * param3 / 2 - 1;
                  middle = Math.ceil(param3 / 2) - 1;
                  _loc4_ = 0;
                  while(_loc4_ < param2)
                  {
                     tmpArray[_loc4_] = new Array();
                     _loc5_ = 0;
                     while(_loc5_ <= middle)
                     {
                        tmpArray[_loc4_][_loc5_] = _loc4_ * (middle + 1) + _loc5_;
                        _loc5_++;
                     }
                     _loc4_++;
                  }
                  _loc4_ = 0;
                  while(_loc4_ < param2)
                  {
                     matrix[_loc4_] = new Array();
                     _loc5_ = 0;
                     while(_loc5_ <= middle)
                     {
                        matrix[_loc4_][_loc5_] = tmpArray[_loc4_][_loc5_];
                        _loc5_++;
                     }
                     _loc4_++;
                  }
                  _loc4_ = 0;
                  while(_loc4_ < param2)
                  {
                     contor = middle;
                     _loc5_ = middle + 1;
                     while(_loc5_ < param3)
                     {
                        matrix[_loc4_][_loc5_] = tmpArray[_loc4_][contor];
                        contor--;
                        _loc5_++;
                     }
                     _loc4_++;
                  }
               }
               else if(param3 % 2 == 1)
               {
                  retObj.max = param2 * (param3 + 1) / 2 - 1;
                  middle = Math.ceil(param3 / 2) - 1;
                  _loc4_ = 0;
                  while(_loc4_ < param2)
                  {
                     tmpArray[_loc4_] = new Array();
                     _loc5_ = 0;
                     while(_loc5_ <= middle)
                     {
                        tmpArray[_loc4_][_loc5_] = _loc4_ * (middle + 1) + _loc5_;
                        _loc5_++;
                     }
                     _loc4_++;
                  }
                  _loc4_ = 0;
                  while(_loc4_ < param2)
                  {
                     matrix[_loc4_] = new Array();
                     _loc5_ = 0;
                     while(_loc5_ <= middle)
                     {
                        matrix[_loc4_][_loc5_] = tmpArray[_loc4_][_loc5_];
                        _loc5_++;
                     }
                     _loc4_++;
                  }
                  _loc4_ = 0;
                  while(_loc4_ < param2)
                  {
                     contor = middle;
                     _loc5_ = middle + 1;
                     while(_loc5_ < param3)
                     {
                        matrix[_loc4_][_loc5_] = tmpArray[_loc4_][contor - 1];
                        contor--;
                        _loc5_++;
                     }
                     _loc4_++;
                  }
               }
               break;
            case 7:
               if(param2 % 2 == 0)
               {
                  retObj.max = param3 * param2 / 2 - 1;
                  middle = Math.ceil(param2 / 2) - 1;
                  _loc4_ = 0;
                  while(_loc4_ <= middle)
                  {
                     tmpArray[_loc4_] = new Array();
                     _loc5_ = 0;
                     while(_loc5_ < param3)
                     {
                        tmpArray[_loc4_][_loc5_] = _loc5_ * (middle + 1) + _loc4_;
                        _loc5_++;
                     }
                     _loc4_++;
                  }
                  _loc4_ = 0;
                  while(_loc4_ <= middle)
                  {
                     matrix[_loc4_] = new Array();
                     matrix[_loc4_] = tmpArray[_loc4_];
                     _loc4_++;
                  }
                  contor = middle;
                  _loc4_ = middle + 1;
                  while(_loc4_ < param2)
                  {
                     matrix[_loc4_] = new Array();
                     matrix[_loc4_] = tmpArray[contor];
                     contor--;
                     _loc4_++;
                  }
               }
               else if(param2 % 2 == 1)
               {
                  retObj.max = param3 * (param2 + 1) / 2 - 1;
                  middle = Math.ceil(param2 / 2) - 1;
                  _loc4_ = 0;
                  while(_loc4_ <= middle)
                  {
                     tmpArray[_loc4_] = new Array();
                     _loc5_ = 0;
                     while(_loc5_ < param3)
                     {
                        tmpArray[_loc4_][_loc5_] = _loc5_ * (middle + 1) + _loc4_;
                        _loc5_++;
                     }
                     _loc4_++;
                  }
                  _loc4_ = 0;
                  while(_loc4_ <= middle)
                  {
                     matrix[_loc4_] = new Array();
                     matrix[_loc4_] = tmpArray[_loc4_];
                     _loc4_++;
                  }
                  contor = middle;
                  _loc4_ = middle + 1;
                  while(_loc4_ < param2)
                  {
                     matrix[_loc4_] = new Array();
                     matrix[_loc4_] = tmpArray[contor - 1];
                     contor--;
                     _loc4_++;
                  }
               }
               break;
            case 8:
               if(param2 % 2 == 0)
               {
                  retObj.max = param3 * param2 / 2 - 1;
                  middle = Math.ceil(param2 / 2) - 1;
                  _loc4_ = 0;
                  while(_loc4_ <= middle)
                  {
                     tmpArray[_loc4_] = new Array();
                     _loc5_ = 0;
                     while(_loc5_ < param3)
                     {
                        tmpArray[_loc4_][_loc5_] = _loc5_ * (middle + 1) + _loc4_;
                        _loc5_++;
                     }
                     _loc4_++;
                  }
                  contor = middle;
                  _loc4_ = 0;
                  while(_loc4_ <= middle)
                  {
                     matrix[_loc4_] = new Array();
                     matrix[_loc4_] = tmpArray[contor];
                     contor--;
                     _loc4_++;
                  }
                  _loc4_ = middle + 1;
                  while(_loc4_ < param2)
                  {
                     matrix[_loc4_] = new Array();
                     matrix[_loc4_] = tmpArray[_loc4_ - middle - 1];
                     _loc4_++;
                  }
               }
               else if(param2 % 2 == 1)
               {
                  retObj.max = param3 * (param2 + 1) / 2 - 1;
                  middle = Math.ceil(param2 / 2) - 1;
                  _loc4_ = 0;
                  while(_loc4_ <= middle)
                  {
                     tmpArray[_loc4_] = new Array();
                     _loc5_ = 0;
                     while(_loc5_ < param3)
                     {
                        tmpArray[_loc4_][_loc5_] = _loc5_ * (middle + 1) + _loc4_;
                        _loc5_++;
                     }
                     _loc4_++;
                  }
                  contor = middle;
                  _loc4_ = 0;
                  while(_loc4_ <= middle)
                  {
                     matrix[_loc4_] = new Array();
                     matrix[_loc4_] = tmpArray[contor];
                     contor--;
                     _loc4_++;
                  }
                  _loc4_ = middle + 1;
                  while(_loc4_ < param2)
                  {
                     matrix[_loc4_] = new Array();
                     matrix[_loc4_] = tmpArray[_loc4_ - middle];
                     contor--;
                     _loc4_++;
                  }
               }
               break;
            case 9:
               retObj.max = param3 + param2 - 1 - 1;
               _loc4_ = 0;
               while(_loc4_ < param2)
               {
                  matrix[_loc4_] = new Array();
                  _loc5_ = 0;
                  while(_loc5_ < param3)
                  {
                     matrix[_loc4_][_loc5_] = _loc4_ + _loc5_;
                     _loc5_++;
                  }
                  _loc4_++;
               }
               break;
            case 10:
               retObj.max = param3 + param2 - 1 - 1;
               _loc4_ = 0;
               while(_loc4_ < param2)
               {
                  matrix[_loc4_] = new Array();
                  _loc5_ = 0;
                  while(_loc5_ < param3)
                  {
                     matrix[_loc4_][_loc5_] = param3 + param2 - _loc4_ - _loc5_ - 2;
                     _loc5_++;
                  }
                  _loc4_++;
               }
               break;
            case 11:
               retObj.max = param2 + param3 - 1 - 1;
               _loc4_ = 0;
               while(_loc4_ < param2)
               {
                  matrix[_loc4_] = new Array();
                  _loc5_ = 0;
                  while(_loc5_ < param3)
                  {
                     matrix[_loc4_][_loc5_] = param2 + _loc5_ - _loc4_ - 1;
                     _loc5_++;
                  }
                  _loc4_++;
               }
               break;
            case 12:
               retObj.max = param2 + param3 - 1 - 1;
               _loc4_ = 0;
               while(_loc4_ < param2)
               {
                  matrix[_loc4_] = new Array();
                  _loc5_ = 0;
                  while(_loc5_ < param3)
                  {
                     matrix[_loc4_][_loc5_] = param3 - _loc5_ + _loc4_ - 1;
                     _loc5_++;
                  }
                  _loc4_++;
               }
               break;
            case 13:
               middleLin = Math.ceil(param2 / 2) - 1;
               middleCol = Math.ceil(param3 / 2) - 1;
               _loc4_ = 0;
               while(_loc4_ <= middleLin)
               {
                  tmpArray[_loc4_] = new Array();
                  _loc5_ = 0;
                  while(_loc5_ <= middleCol)
                  {
                     tmpArray[_loc4_][_loc5_] = _loc4_ + _loc5_;
                     _loc5_++;
                  }
                  _loc4_++;
               }
               if(param2 % 2 == 0 && param3 % 2 == 0)
               {
                  retObj.max = param3 / 2 + param2 / 2 - 1 - 1;
                  _loc4_ = 0;
                  while(_loc4_ <= middleLin)
                  {
                     matrix[_loc4_] = new Array();
                     _loc5_ = 0;
                     while(_loc5_ <= middleCol)
                     {
                        matrix[_loc4_][_loc5_] = tmpArray[_loc4_][_loc5_];
                        _loc5_++;
                     }
                     _loc4_++;
                  }
                  _loc4_ = 0;
                  while(_loc4_ <= middleLin)
                  {
                     contor = middleCol;
                     _loc5_ = middleCol + 1;
                     while(_loc5_ < param3)
                     {
                        matrix[_loc4_][_loc5_] = tmpArray[_loc4_][contor];
                        contor--;
                        _loc5_++;
                     }
                     _loc4_++;
                  }
                  contor = middleLin;
                  _loc4_ = middleLin + 1;
                  while(_loc4_ < param2)
                  {
                     matrix[_loc4_] = new Array();
                     matrix[_loc4_] = matrix[contor];
                     contor--;
                     _loc4_++;
                  }
               }
               else if(param2 % 2 == 0 && param3 % 2 == 1)
               {
                  retObj.max = (param3 + 1) / 2 + param2 / 2 - 1 - 1;
                  _loc4_ = 0;
                  while(_loc4_ <= middleLin)
                  {
                     matrix[_loc4_] = new Array();
                     _loc5_ = 0;
                     while(_loc5_ <= middleCol)
                     {
                        matrix[_loc4_][_loc5_] = tmpArray[_loc4_][_loc5_];
                        _loc5_++;
                     }
                     _loc4_++;
                  }
                  _loc4_ = 0;
                  while(_loc4_ <= middleLin)
                  {
                     contor = middleCol - 1;
                     _loc5_ = middleCol + 1;
                     while(_loc5_ < param3)
                     {
                        matrix[_loc4_][_loc5_] = tmpArray[_loc4_][contor];
                        contor--;
                        _loc5_++;
                     }
                     _loc4_++;
                  }
                  contor = middleLin;
                  _loc4_ = middleLin + 1;
                  while(_loc4_ < param2)
                  {
                     matrix[_loc4_] = new Array();
                     matrix[_loc4_] = matrix[contor];
                     contor--;
                     _loc4_++;
                  }
               }
               else if(param2 % 2 == 1 && param3 % 2 == 0)
               {
                  retObj.max = (param2 + 1) / 2 + param3 / 2 - 1 - 1;
                  _loc4_ = 0;
                  while(_loc4_ <= middleLin)
                  {
                     matrix[_loc4_] = new Array();
                     _loc5_ = 0;
                     while(_loc5_ <= middleCol)
                     {
                        matrix[_loc4_][_loc5_] = tmpArray[_loc4_][_loc5_];
                        _loc5_++;
                     }
                     _loc4_++;
                  }
                  _loc4_ = 0;
                  while(_loc4_ <= middleLin)
                  {
                     contor = middleCol;
                     _loc5_ = middleCol + 1;
                     while(_loc5_ < param3)
                     {
                        matrix[_loc4_][_loc5_] = tmpArray[_loc4_][contor];
                        contor--;
                        _loc5_++;
                     }
                     _loc4_++;
                  }
                  contor = middleLin - 1;
                  _loc4_ = middleLin + 1;
                  while(_loc4_ < param2)
                  {
                     matrix[_loc4_] = new Array();
                     matrix[_loc4_] = matrix[contor];
                     contor--;
                     _loc4_++;
                  }
               }
               else if(param2 % 2 == 1 && param3 % 2 == 1)
               {
                  retObj.max = (param2 + param3) / 2 - 1;
                  _loc4_ = 0;
                  while(_loc4_ <= middleLin)
                  {
                     matrix[_loc4_] = new Array();
                     _loc5_ = 0;
                     while(_loc5_ <= middleCol)
                     {
                        matrix[_loc4_][_loc5_] = tmpArray[_loc4_][_loc5_];
                        _loc5_++;
                     }
                     _loc4_++;
                  }
                  _loc4_ = 0;
                  while(_loc4_ <= middleLin)
                  {
                     contor = middleCol - 1;
                     _loc5_ = middleCol + 1;
                     while(_loc5_ < param3)
                     {
                        matrix[_loc4_][_loc5_] = tmpArray[_loc4_][contor];
                        contor--;
                        _loc5_++;
                     }
                     _loc4_++;
                  }
                  contor = middleLin - 1;
                  _loc4_ = middleLin + 1;
                  while(_loc4_ < param2)
                  {
                     matrix[_loc4_] = new Array();
                     matrix[_loc4_] = matrix[contor];
                     contor--;
                     _loc4_++;
                  }
               }
               break;
            case 14:
               middleLin = Math.ceil(param2 / 2) - 1;
               middleCol = Math.ceil(param3 / 2) - 1;
               _loc4_ = 0;
               while(_loc4_ <= middleLin)
               {
                  tmpArray[_loc4_] = new Array();
                  _loc5_ = 0;
                  while(_loc5_ <= middleCol)
                  {
                     tmpArray[_loc4_][_loc5_] = _loc4_ + _loc5_;
                     _loc5_++;
                  }
                  _loc4_++;
               }
               if(param2 % 2 == 0 && param3 % 2 == 0)
               {
                  retObj.max = param3 / 2 + param2 / 2 - 1 - 1;
                  _loc4_ = 0;
                  while(_loc4_ <= middleLin)
                  {
                     matrix[_loc4_] = new Array();
                     _loc5_ = 0;
                     while(_loc5_ <= middleCol)
                     {
                        matrix[_loc4_][_loc5_] = tmpArray[middleLin - _loc4_][middleCol - _loc5_];
                        _loc5_++;
                     }
                     _loc4_++;
                  }
                  contor = middleLin;
                  _loc4_ = 0;
                  while(_loc4_ <= middleLin)
                  {
                     _loc5_ = middleCol + 1;
                     while(_loc5_ < param3)
                     {
                        matrix[_loc4_][_loc5_] = tmpArray[contor][_loc5_ - middleCol - 1];
                        _loc5_++;
                     }
                     contor--;
                     _loc4_++;
                  }
                  contor = middleLin;
                  _loc4_ = middleLin + 1;
                  while(_loc4_ < param2)
                  {
                     matrix[_loc4_] = new Array();
                     matrix[_loc4_] = matrix[contor];
                     contor--;
                     _loc4_++;
                  }
               }
               else if(param2 % 2 == 0 && param3 % 2 == 1)
               {
                  retObj.max = (param3 + 1) / 2 + param2 / 2 - 1 - 1;
                  _loc4_ = 0;
                  while(_loc4_ <= middleLin)
                  {
                     matrix[_loc4_] = new Array();
                     _loc5_ = 0;
                     while(_loc5_ <= middleCol)
                     {
                        matrix[_loc4_][_loc5_] = tmpArray[middleLin - _loc4_][middleCol - _loc5_];
                        _loc5_++;
                     }
                     _loc4_++;
                  }
                  contor = middleLin;
                  _loc4_ = 0;
                  while(_loc4_ <= middleLin)
                  {
                     _loc5_ = middleCol + 1;
                     while(_loc5_ < param3)
                     {
                        matrix[_loc4_][_loc5_] = tmpArray[contor][_loc5_ - middleCol];
                        _loc5_++;
                     }
                     contor--;
                     _loc4_++;
                  }
                  contor = middleLin;
                  _loc4_ = middleLin + 1;
                  while(_loc4_ < param2)
                  {
                     matrix[_loc4_] = new Array();
                     matrix[_loc4_] = matrix[contor];
                     contor--;
                     _loc4_++;
                  }
               }
               else if(param2 % 2 == 1 && param3 % 2 == 0)
               {
                  retObj.max = (param2 + 1) / 2 + param3 / 2 - 1 - 1;
                  _loc4_ = 0;
                  while(_loc4_ <= middleLin)
                  {
                     matrix[_loc4_] = new Array();
                     _loc5_ = 0;
                     while(_loc5_ <= middleCol)
                     {
                        matrix[_loc4_][_loc5_] = tmpArray[middleLin - _loc4_][middleCol - _loc5_];
                        _loc5_++;
                     }
                     _loc4_++;
                  }
                  contor = middleLin;
                  _loc4_ = 0;
                  while(_loc4_ <= middleLin)
                  {
                     _loc5_ = middleCol + 1;
                     while(_loc5_ < param3)
                     {
                        matrix[_loc4_][_loc5_] = tmpArray[contor][_loc5_ - middleCol - 1];
                        _loc5_++;
                     }
                     contor--;
                     _loc4_++;
                  }
                  contor = middleLin - 1;
                  _loc4_ = middleLin + 1;
                  while(_loc4_ < param2)
                  {
                     matrix[_loc4_] = new Array();
                     matrix[_loc4_] = matrix[contor];
                     contor--;
                     _loc4_++;
                  }
               }
               else if(param2 % 2 == 1 && param3 % 2 == 1)
               {
                  retObj.max = (param2 + param3) / 2 - 1;
                  _loc4_ = 0;
                  while(_loc4_ <= middleLin)
                  {
                     matrix[_loc4_] = new Array();
                     _loc5_ = 0;
                     while(_loc5_ <= middleCol)
                     {
                        matrix[_loc4_][_loc5_] = tmpArray[middleLin - _loc4_][middleCol - _loc5_];
                        _loc5_++;
                     }
                     _loc4_++;
                  }
                  contor = middleLin;
                  _loc4_ = 0;
                  while(_loc4_ <= middleLin)
                  {
                     _loc5_ = middleCol + 1;
                     while(_loc5_ < param3)
                     {
                        matrix[_loc4_][_loc5_] = tmpArray[contor][_loc5_ - middleCol];
                        _loc5_++;
                     }
                     contor--;
                     _loc4_++;
                  }
                  contor = middleLin - 1;
                  _loc4_ = middleLin + 1;
                  while(_loc4_ < param2)
                  {
                     matrix[_loc4_] = new Array();
                     matrix[_loc4_] = matrix[contor];
                     contor--;
                     _loc4_++;
                  }
               }
               break;
            case 15:
               _loc6_ = [0,1];
               _loc7_ = [param2 - 1,0];
               _loc8_ = [0,param3 - 1];
               _loc9_ = [param2 - 1,param3 - 1];
               _loc10_ = [param2 - 1,0];
               _loc11_ = [];
               _loc12_ = "vertical_down";
               _loc13_ = 0;
               retObj.max = param2 * param3 - 1;
               _loc4_ = 0;
               while(_loc4_ < param2)
               {
                  matrix[_loc4_] = new Array();
                  _loc5_ = 0;
                  while(_loc5_ < param3)
                  {
                     matrix[_loc4_][_loc5_] = 0;
                     _loc5_++;
                  }
                  _loc4_++;
               }
               _loc4_ = 0;
               _loc5_ = 0;
               while(_loc13_ < param2 * param3)
               {
                  if(_loc12_ == "vertical_down")
                  {
                     if(_loc4_ < _loc10_[0])
                     {
                        matrix[_loc4_][_loc5_] = _loc13_++;
                        _loc4_++;
                     }
                     else
                     {
                        matrix[_loc4_][_loc5_] = _loc13_++;
                        _loc5_++;
                        _loc12_ = "horizontal_toRight";
                        _loc10_[0] = _loc9_[0];
                        _loc10_[1] = _loc9_[1];
                        _loc7_[0] = _loc7_[0] - 1;
                        _loc7_[1] = _loc7_[1] + 1;
                     }
                  }
                  else if(_loc12_ == "vertical_up")
                  {
                     if(_loc4_ > _loc10_[0])
                     {
                        matrix[_loc4_][_loc5_] = _loc13_++;
                        _loc4_--;
                     }
                     else
                     {
                        matrix[_loc4_][_loc5_] = _loc13_++;
                        _loc5_--;
                        _loc12_ = "horizontal_toLeft";
                        _loc10_[0] = _loc6_[0];
                        _loc10_[1] = _loc6_[1];
                        _loc8_[0] = _loc8_[0] + 1;
                        _loc8_[1] = _loc8_[1] - 1;
                     }
                  }
                  else if(_loc12_ == "horizontal_toRight")
                  {
                     if(_loc5_ < _loc10_[1])
                     {
                        matrix[_loc4_][_loc5_] = _loc13_++;
                        _loc5_++;
                     }
                     else
                     {
                        matrix[_loc4_][_loc5_] = _loc13_++;
                        _loc4_--;
                        _loc12_ = "vertical_up";
                        _loc10_[0] = _loc8_[0];
                        _loc10_[1] = _loc8_[1];
                        _loc9_[0] = _loc9_[0] - 1;
                        _loc9_[1] = _loc9_[1] - 1;
                     }
                  }
                  else if(_loc12_ == "horizontal_toLeft")
                  {
                     if(_loc5_ > _loc10_[1])
                     {
                        matrix[_loc4_][_loc5_] = _loc13_++;
                        _loc5_--;
                     }
                     else
                     {
                        matrix[_loc4_][_loc5_] = _loc13_++;
                        _loc4_++;
                        _loc12_ = "vertical_down";
                        _loc10_[0] = _loc7_[0];
                        _loc10_[1] = _loc7_[1];
                        _loc6_[0] = _loc6_[0] + 1;
                        _loc6_[1] = _loc6_[1] + 1;
                     }
                  }
               }
               break;
            case 16:
               _loc6_ = [0,1];
               _loc7_ = [param2 - 1,0];
               _loc8_ = [0,param3 - 1];
               _loc9_ = [param2 - 1,param3 - 1];
               _loc10_ = [param2 - 1,0];
               _loc12_ = "vertical_down";
               _loc13_ = 0;
               retObj.max = param2 * param3 - 1;
               _loc4_ = 0;
               while(_loc4_ < param2)
               {
                  matrix[_loc4_] = new Array();
                  _loc5_ = 0;
                  while(_loc5_ < param3)
                  {
                     matrix[_loc4_][_loc5_] = 0;
                     _loc5_++;
                  }
                  _loc4_++;
               }
               _loc4_ = 0;
               _loc5_ = 0;
               while(_loc13_ < param2 * param3)
               {
                  if(_loc12_ == "vertical_down")
                  {
                     if(_loc4_ < _loc10_[0])
                     {
                        matrix[_loc4_][_loc5_] = _loc13_++;
                        _loc4_++;
                     }
                     else
                     {
                        matrix[_loc4_][_loc5_] = _loc13_++;
                        _loc5_++;
                        _loc12_ = "horizontal_toRight";
                        _loc10_[0] = _loc9_[0];
                        _loc10_[1] = _loc9_[1];
                        _loc7_[0] = _loc7_[0] - 1;
                        _loc7_[1] = _loc7_[1] + 1;
                     }
                  }
                  else if(_loc12_ == "vertical_up")
                  {
                     if(_loc4_ > _loc10_[0])
                     {
                        matrix[_loc4_][_loc5_] = _loc13_++;
                        _loc4_--;
                     }
                     else
                     {
                        matrix[_loc4_][_loc5_] = _loc13_++;
                        _loc5_--;
                        _loc12_ = "horizontal_toLeft";
                        _loc10_[0] = _loc6_[0];
                        _loc10_[1] = _loc6_[1];
                        _loc8_[0] = _loc8_[0] + 1;
                        _loc8_[1] = _loc8_[1] - 1;
                     }
                  }
                  else if(_loc12_ == "horizontal_toRight")
                  {
                     if(_loc5_ < _loc10_[1])
                     {
                        matrix[_loc4_][_loc5_] = _loc13_++;
                        _loc5_++;
                     }
                     else
                     {
                        matrix[_loc4_][_loc5_] = _loc13_++;
                        _loc4_--;
                        _loc12_ = "vertical_up";
                        _loc10_[0] = _loc8_[0];
                        _loc10_[1] = _loc8_[1];
                        _loc9_[0] = _loc9_[0] - 1;
                        _loc9_[1] = _loc9_[1] - 1;
                     }
                  }
                  else if(_loc12_ == "horizontal_toLeft")
                  {
                     if(_loc5_ > _loc10_[1])
                     {
                        matrix[_loc4_][_loc5_] = _loc13_++;
                        _loc5_--;
                     }
                     else
                     {
                        matrix[_loc4_][_loc5_] = _loc13_++;
                        _loc4_++;
                        _loc12_ = "vertical_down";
                        _loc10_[0] = _loc7_[0];
                        _loc10_[1] = _loc7_[1];
                        _loc6_[0] = _loc6_[0] + 1;
                        _loc6_[1] = _loc6_[1] + 1;
                     }
                  }
               }
               _loc4_ = 0;
               while(_loc4_ < param2)
               {
                  _loc5_ = 0;
                  while(_loc5_ < param3)
                  {
                     matrix[_loc4_][_loc5_] = Math.abs(param2 * param3 - 1 - matrix[_loc4_][_loc5_]);
                     _loc5_++;
                  }
                  _loc4_++;
               }
               break;
            case 17:
               _loc6_ = [1,0];
               _loc7_ = [param2 - 1,0];
               _loc8_ = [0,param3 - 1];
               _loc9_ = [param2 - 1,param3 - 1];
               _loc10_ = [0,param3 - 1];
               _loc12_ = "horizontal_toRight";
               _loc13_ = 0;
               retObj.max = param2 * param3 - 1;
               _loc4_ = 0;
               while(_loc4_ < param2)
               {
                  matrix[_loc4_] = new Array();
                  _loc5_ = 0;
                  while(_loc5_ < param3)
                  {
                     matrix[_loc4_][_loc5_] = 0;
                     _loc5_++;
                  }
                  _loc4_++;
               }
               _loc4_ = 0;
               _loc5_ = 0;
               while(_loc13_ < param2 * param3)
               {
                  if(_loc12_ == "vertical_down")
                  {
                     if(_loc4_ < _loc10_[0])
                     {
                        matrix[_loc4_][_loc5_] = _loc13_++;
                        _loc4_++;
                     }
                     else
                     {
                        matrix[_loc4_][_loc5_] = _loc13_++;
                        _loc5_--;
                        _loc12_ = "horizontal_toLeft";
                        _loc10_[0] = _loc7_[0];
                        _loc10_[1] = _loc7_[1];
                        _loc9_[0] = _loc9_[0] - 1;
                        _loc9_[1] = _loc9_[1] - 1;
                     }
                  }
                  else if(_loc12_ == "vertical_up")
                  {
                     if(_loc4_ > _loc10_[0])
                     {
                        matrix[_loc4_][_loc5_] = _loc13_++;
                        _loc4_--;
                     }
                     else
                     {
                        matrix[_loc4_][_loc5_] = _loc13_++;
                        _loc5_++;
                        _loc12_ = "horizontal_toRight";
                        _loc10_[0] = _loc8_[0];
                        _loc10_[1] = _loc8_[1];
                        _loc6_[0] = _loc6_[0] + 1;
                        _loc6_[1] = _loc6_[1] + 1;
                     }
                  }
                  else if(_loc12_ == "horizontal_toRight")
                  {
                     if(_loc5_ < _loc10_[1])
                     {
                        matrix[_loc4_][_loc5_] = _loc13_++;
                        _loc5_++;
                     }
                     else
                     {
                        matrix[_loc4_][_loc5_] = _loc13_++;
                        _loc4_++;
                        _loc12_ = "vertical_down";
                        _loc10_[0] = _loc9_[0];
                        _loc10_[1] = _loc9_[1];
                        _loc8_[0] = _loc8_[0] + 1;
                        _loc8_[1] = _loc8_[1] - 1;
                     }
                  }
                  else if(_loc12_ == "horizontal_toLeft")
                  {
                     if(_loc5_ > _loc10_[1])
                     {
                        matrix[_loc4_][_loc5_] = _loc13_++;
                        _loc5_--;
                     }
                     else
                     {
                        matrix[_loc4_][_loc5_] = _loc13_++;
                        _loc4_--;
                        _loc12_ = "vertical_up";
                        _loc10_[0] = _loc6_[0];
                        _loc10_[1] = _loc6_[1];
                        _loc7_[0] = _loc7_[0] - 1;
                        _loc7_[1] = _loc7_[1] + 1;
                     }
                  }
               }
               break;
            case 18:
               _loc6_ = [1,0];
               _loc7_ = [param2 - 1,0];
               _loc8_ = [0,param3 - 1];
               _loc9_ = [param2 - 1,param3 - 1];
               _loc10_ = [0,param3 - 1];
               _loc12_ = "horizontal_toRight";
               _loc13_ = 0;
               retObj.max = param2 * param3 - 1;
               _loc4_ = 0;
               while(_loc4_ < param2)
               {
                  matrix[_loc4_] = new Array();
                  _loc5_ = 0;
                  while(_loc5_ < param3)
                  {
                     matrix[_loc4_][_loc5_] = 0;
                     _loc5_++;
                  }
                  _loc4_++;
               }
               _loc4_ = 0;
               _loc5_ = 0;
               while(_loc13_ < param2 * param3)
               {
                  if(_loc12_ == "vertical_down")
                  {
                     if(_loc4_ < _loc10_[0])
                     {
                        matrix[_loc4_][_loc5_] = _loc13_++;
                        _loc4_++;
                     }
                     else
                     {
                        matrix[_loc4_][_loc5_] = _loc13_++;
                        _loc5_--;
                        _loc12_ = "horizontal_toLeft";
                        _loc10_[0] = _loc7_[0];
                        _loc10_[1] = _loc7_[1];
                        _loc9_[0] = _loc9_[0] - 1;
                        _loc9_[1] = _loc9_[1] - 1;
                     }
                  }
                  else if(_loc12_ == "vertical_up")
                  {
                     if(_loc4_ > _loc10_[0])
                     {
                        matrix[_loc4_][_loc5_] = _loc13_++;
                        _loc4_--;
                     }
                     else
                     {
                        matrix[_loc4_][_loc5_] = _loc13_++;
                        _loc5_++;
                        _loc12_ = "horizontal_toRight";
                        _loc10_[0] = _loc8_[0];
                        _loc10_[1] = _loc8_[1];
                        _loc6_[0] = _loc6_[0] + 1;
                        _loc6_[1] = _loc6_[1] + 1;
                     }
                  }
                  else if(_loc12_ == "horizontal_toRight")
                  {
                     if(_loc5_ < _loc10_[1])
                     {
                        matrix[_loc4_][_loc5_] = _loc13_++;
                        _loc5_++;
                     }
                     else
                     {
                        matrix[_loc4_][_loc5_] = _loc13_++;
                        _loc4_++;
                        _loc12_ = "vertical_down";
                        _loc10_[0] = _loc9_[0];
                        _loc10_[1] = _loc9_[1];
                        _loc8_[0] = _loc8_[0] + 1;
                        _loc8_[1] = _loc8_[1] - 1;
                     }
                  }
                  else if(_loc12_ == "horizontal_toLeft")
                  {
                     if(_loc5_ > _loc10_[1])
                     {
                        matrix[_loc4_][_loc5_] = _loc13_++;
                        _loc5_--;
                     }
                     else
                     {
                        matrix[_loc4_][_loc5_] = _loc13_++;
                        _loc4_--;
                        _loc12_ = "vertical_up";
                        _loc10_[0] = _loc6_[0];
                        _loc10_[1] = _loc6_[1];
                        _loc7_[0] = _loc7_[0] - 1;
                        _loc7_[1] = _loc7_[1] + 1;
                     }
                  }
               }
               _loc4_ = 0;
               while(_loc4_ < param2)
               {
                  _loc5_ = 0;
                  while(_loc5_ < param3)
                  {
                     matrix[_loc4_][_loc5_] = Math.abs(param2 * param3 - 1 - matrix[_loc4_][_loc5_]);
                     _loc5_++;
                  }
                  _loc4_++;
               }
               break;
            case 19:
               _loc14_ = [];
               retObj.max = param2 * param3 - 1;
               _loc4_ = 0;
               while(_loc4_ < param2 * param3)
               {
                  _loc14_[_loc4_] = _loc4_;
                  _loc4_++;
               }
               _loc4_ = 0;
               while(_loc4_ < param2)
               {
                  matrix[_loc4_] = new Array();
                  _loc5_ = 0;
                  while(_loc5_ < param3)
                  {
                     _loc15_ = Math.floor(Math.random() * _loc14_.length);
                     matrix[_loc4_][_loc5_] = _loc14_[_loc15_];
                     _loc14_.splice(_loc15_,1);
                     _loc5_++;
                  }
                  _loc4_++;
               }
               break;
            case 20:
               retObj.max = 1;
               _loc4_ = 0;
               while(_loc4_ < param2)
               {
                  matrix[_loc4_] = new Array();
                  _loc5_ = 0;
                  while(_loc5_ < param3)
                  {
                     matrix[_loc4_][_loc5_] = (_loc4_ + _loc5_) % 2;
                     _loc5_++;
                  }
                  _loc4_++;
               }
         }
         retObj.arr = matrix;
         return retObj;
      }
   }
}
