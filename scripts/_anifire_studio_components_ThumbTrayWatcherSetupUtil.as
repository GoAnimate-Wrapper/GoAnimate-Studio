package
{
   import anifire.studio.components.ThumbTray;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_ThumbTrayWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_ThumbTrayWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ThumbTray.watcherSetupUtil = new _anifire_studio_components_ThumbTrayWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[22] = new PropertyWatcher("_commonSoundCollection",{"propertyChange":true},[param4[29]],param2);
         param5[15] = new PropertyWatcher("_showTextComponentCreationPanel",{"propertyChange":true},[param4[19],param4[20]],param2);
         param5[118] = new PropertyWatcher("_movieBubbleSource",{"propertyChange":true},[param4[131]],param2);
         param5[28] = new PropertyWatcher("_loadingUserStarter",{"propertyChange":true},[param4[34]],param2);
         param5[23] = new PropertyWatcher("userNavigator",{"propertyChange":true},[param4[31]],param2);
         param5[29] = new PropertyWatcher("_userAssetManager",{"propertyChange":true},[param4[35],param4[37],param4[42],param4[46],param4[48],param4[54],param4[60]],param2);
         param5[37] = new PropertyWatcher("propSource",{
            "userPropAdded":true,
            "userPropComplete":true,
            "userPropRemoved":true
         },[param4[42]],null);
         param5[52] = new PropertyWatcher("videoSource",{
            "userVideoAdded":true,
            "userVideoRemoved":true,
            "userVideoComplete":true
         },[param4[60]],null);
         param5[42] = new PropertyWatcher("bubbleSource",{
            "userBubbleAdded":true,
            "userBubbleRemoved":true,
            "userBubbleComplete":true
         },[param4[48]],null);
         param5[40] = new PropertyWatcher("userPropReady",{"userPropComplete":true},[param4[46]],null);
         param5[32] = new PropertyWatcher("characterSource",{"userCharacterComplete":true},[param4[37]],null);
         param5[30] = new PropertyWatcher("backgroundSource",{
            "userBackgroundAdded":true,
            "userBackgroundComplete":true,
            "userBackgroundRemoved":true
         },[param4[35]],null);
         param5[47] = new PropertyWatcher("soundSource",{
            "userSoundAdded":true,
            "userSoundComplete":true,
            "userSoundRemoved":true
         },[param4[54]],null);
         param5[16] = new PropertyWatcher("_showTextComponentList",{"propertyChange":true},[param4[21],param4[22]],param2);
         param5[17] = new PropertyWatcher("_textComponentSource",{"propertyChange":true},[param4[23]],param2);
         param5[20] = new PropertyWatcher("_themeWidgetCollection",{"propertyChange":true},[param4[26]],param2);
         param5[120] = new PropertyWatcher("_movieEffectSource",{"propertyChange":true},[param4[133]],param2);
         param5[38] = new PropertyWatcher("_hasMoreUserProp",{"propertyChange":true},[param4[43],param4[44]],param2);
         param5[44] = new PropertyWatcher("_userBubbleReady",{"propertyChange":true},[param4[51]],param2);
         param5[58] = new PropertyWatcher("_adminTeamAssetManager",{"propertyChange":true},[param4[67],param4[68],param4[71],param4[72],param4[73],param4[75],param4[77],param4[80],param4[83],param4[84],param4[85],param4[87],param4[89],param4[92]],param2);
         param5[64] = new PropertyWatcher("propSource",{"sharedPropComplete":true},[param4[71]],null);
         param5[79] = new PropertyWatcher("videoSource",{"sharedVideoComplete":true},[param4[89]],null);
         param5[77] = new PropertyWatcher("soundReady",{"propertyChange":true},[param4[87]],null);
         param5[75] = new PropertyWatcher("hasMoreSound",{"sharedSoundComplete":true},[param4[84],param4[85]],null);
         param5[67] = new PropertyWatcher("sharedPropReady",{"sharedPropComplete":true},[param4[75]],null);
         param5[69] = new PropertyWatcher("bubbleSource",{"sharedBubbleComplete":true},[param4[77]],null);
         param5[61] = new PropertyWatcher("backgroundSource",{"sharedBackgroundComplete":true},[param4[68]],null);
         param5[59] = new PropertyWatcher("loadingBackground",{"propertyChange":true},[param4[67]],null);
         param5[81] = new PropertyWatcher("videoReady",{"propertyChange":true},[param4[92]],null);
         param5[65] = new PropertyWatcher("hasMoreProp",{"sharedPropComplete":true},[param4[72],param4[73]],null);
         param5[60] = new PropertyWatcher("loadingStarter",{"propertyChange":true},[param4[67]],null);
         param5[74] = new PropertyWatcher("soundSource",{"sharedSoundComplete":true},[param4[83]],null);
         param5[71] = new PropertyWatcher("bubbleReady",{"propertyChange":true},[param4[80]],null);
         param5[55] = new PropertyWatcher("teamNavigator",{"propertyChange":true},[param4[64]],param2);
         param5[50] = new PropertyWatcher("_userSoundReady",{"propertyChange":true},[param4[58]],param2);
         param5[34] = new PropertyWatcher("_gettingAssets",{"propertyChange":true},[param4[39],param4[46],param4[50],param4[51],param4[58],param4[62],param4[63],param4[75],param4[79],param4[80],param4[87],param4[91],param4[92],param4[104],param4[108],param4[109],param4[116],param4[120],param4[121]],param2);
         param5[18] = new PropertyWatcher("_bubbleSource",{"propertyChange":true},[param4[24]],param2);
         param5[54] = new PropertyWatcher("_userVideoReady",{"propertyChange":true},[param4[63]],param2);
         param5[121] = new PropertyWatcher("active",{"propertyChange":true},[param4[134]],param2);
         param5[2] = new PropertyWatcher("themeNavigator",{"propertyChange":true},[param4[1]],param2);
         param5[82] = new PropertyWatcher("sharedNavigator",{"propertyChange":true},[param4[93]],param2);
         param5[13] = new PropertyWatcher("_themePropReady",{"propertyChange":true},[param4[17],param4[27]],param2);
         param5[7] = new PropertyWatcher("_useSearchSuggestion",{"propertyChange":true},[param4[7],param4[12],param4[16],param4[30]],param2);
         param5[12] = new PropertyWatcher("_themePropCollection",{"propertyChange":true},[param4[15]],param2);
         param5[10] = new PropertyWatcher("_loadingThemeCC",{"propertyChange":true},[param4[13]],param2);
         param5[48] = new PropertyWatcher("_hasMoreUserSound",{"propertyChange":true},[param4[55],param4[56]],param2);
         param5[27] = new PropertyWatcher("_loadingUserBackground",{"propertyChange":true},[param4[34]],param2);
         param5[111] = new PropertyWatcher("_movieBackgroundSource",{"propertyChange":true},[param4[124]],param2);
         param5[116] = new PropertyWatcher("_moviePropCollection",{"propertyChange":true},[param4[129]],param2);
         param5[6] = new PropertyWatcher("_useExtraLargeBackgroundThumbnails",{"propertyChange":true},[param4[4],param4[5],param4[8],param4[9]],param2);
         param5[9] = new PropertyWatcher("_themeCharacterCollection",{"propertyChange":true},[param4[11]],param2);
         param5[85] = new PropertyWatcher("_userSharedAssetManager",{"propertyChange":true},[param4[96],param4[97],param4[100],param4[101],param4[102],param4[104],param4[106],param4[109],param4[112],param4[113],param4[114],param4[116],param4[118],param4[121]],param2);
         param5[91] = new PropertyWatcher("propSource",{"sharedPropComplete":true},[param4[100]],null);
         param5[106] = new PropertyWatcher("videoSource",{"sharedVideoComplete":true},[param4[118]],null);
         param5[104] = new PropertyWatcher("soundReady",{"propertyChange":true},[param4[116]],null);
         param5[102] = new PropertyWatcher("hasMoreSound",{"sharedSoundComplete":true},[param4[113],param4[114]],null);
         param5[94] = new PropertyWatcher("sharedPropReady",{"sharedPropComplete":true},[param4[104]],null);
         param5[96] = new PropertyWatcher("bubbleSource",{"sharedBubbleComplete":true},[param4[106]],null);
         param5[88] = new PropertyWatcher("backgroundSource",{"sharedBackgroundComplete":true},[param4[97]],null);
         param5[86] = new PropertyWatcher("loadingBackground",{"propertyChange":true},[param4[96]],null);
         param5[108] = new PropertyWatcher("videoReady",{"propertyChange":true},[param4[121]],null);
         param5[92] = new PropertyWatcher("hasMoreProp",{"sharedPropComplete":true},[param4[101],param4[102]],null);
         param5[87] = new PropertyWatcher("loadingStarter",{"propertyChange":true},[param4[96]],null);
         param5[101] = new PropertyWatcher("soundSource",{"sharedSoundComplete":true},[param4[112]],null);
         param5[98] = new PropertyWatcher("bubbleReady",{"propertyChange":true},[param4[109]],null);
         param5[113] = new PropertyWatcher("_movieCharacterSource",{"propertyChange":true},[param4[126]],param2);
         param5[5] = new PropertyWatcher("_themeBackgroundCollection",{"propertyChange":true},[param4[3],param4[6]],param2);
         param5[109] = new PropertyWatcher("movieNavigator",{"propertyChange":true},[param4[122]],param2);
         param5[22].updateParent(param1);
         param5[15].updateParent(param1);
         param5[118].updateParent(param1);
         param5[28].updateParent(param1);
         param5[23].updateParent(param1);
         param5[29].updateParent(param1);
         param5[29].addChild(param5[37]);
         param5[29].addChild(param5[52]);
         param5[29].addChild(param5[42]);
         param5[29].addChild(param5[40]);
         param5[29].addChild(param5[32]);
         param5[29].addChild(param5[30]);
         param5[29].addChild(param5[47]);
         param5[16].updateParent(param1);
         param5[17].updateParent(param1);
         param5[20].updateParent(param1);
         param5[120].updateParent(param1);
         param5[38].updateParent(param1);
         param5[44].updateParent(param1);
         param5[58].updateParent(param1);
         param5[58].addChild(param5[64]);
         param5[58].addChild(param5[79]);
         param5[58].addChild(param5[77]);
         param5[58].addChild(param5[75]);
         param5[58].addChild(param5[67]);
         param5[58].addChild(param5[69]);
         param5[58].addChild(param5[61]);
         param5[58].addChild(param5[59]);
         param5[58].addChild(param5[81]);
         param5[58].addChild(param5[65]);
         param5[58].addChild(param5[60]);
         param5[58].addChild(param5[74]);
         param5[58].addChild(param5[71]);
         param5[55].updateParent(param1);
         param5[50].updateParent(param1);
         param5[34].updateParent(param1);
         param5[18].updateParent(param1);
         param5[54].updateParent(param1);
         param5[121].updateParent(param1);
         param5[2].updateParent(param1);
         param5[82].updateParent(param1);
         param5[13].updateParent(param1);
         param5[7].updateParent(param1);
         param5[12].updateParent(param1);
         param5[10].updateParent(param1);
         param5[48].updateParent(param1);
         param5[27].updateParent(param1);
         param5[111].updateParent(param1);
         param5[116].updateParent(param1);
         param5[6].updateParent(param1);
         param5[9].updateParent(param1);
         param5[85].updateParent(param1);
         param5[85].addChild(param5[91]);
         param5[85].addChild(param5[106]);
         param5[85].addChild(param5[104]);
         param5[85].addChild(param5[102]);
         param5[85].addChild(param5[94]);
         param5[85].addChild(param5[96]);
         param5[85].addChild(param5[88]);
         param5[85].addChild(param5[86]);
         param5[85].addChild(param5[108]);
         param5[85].addChild(param5[92]);
         param5[85].addChild(param5[87]);
         param5[85].addChild(param5[101]);
         param5[85].addChild(param5[98]);
         param5[113].updateParent(param1);
         param5[5].updateParent(param1);
         param5[109].updateParent(param1);
      }
   }
}
