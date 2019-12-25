package anifire.utils
{
	import flash.system.Security;
	
	public class SecurityUtils
	{
		 
		
		public function SecurityUtils()
		{
			super();
		}
		
		public static function init() : void
		{
			Security.allowDomain("staging-cdn.org","godevstorage.s3.amazonaws.com","*.amazonaws.com","*.s3.amazonaws.com","*.goanimate.org","*.goanimate.com","goanimate.com","demo.cdn.goanimate.com","demo.goanimate.com","es.goanimate.com","fr.goanimate.com","de.goanimate.com","br.goanimate.com","ga.vyond.com","*.vyond.com","tooncreator.cartoonnetworkhq.com","prelaunch.tooncreator.cartoonnetworkhq.com","staging.goanimate.org","staging.goanimate.com","ga.staging.vyond.org","cn.goanimate.com","goanimate.cartoonnetworkhq.org","lightspeed.goanimate.com","staging.school.goanimate.org","*.goanimate4schools.com","goanimate4schools.com","lightspeed.goanimate4schools.com","staging-school-cdn.com","lightspeed.youtube.goanimate.com","youtube.goanimate.org","youtube.goanimate.com","demo.youtube.goanimate.com","demo.cdn.youtube.goanimate.com","skoletube.goanimate.org","skoletube.goanimate.com","demo.skoletube.goanimate.com","lightspeed.edplatform.goanimate.com","edplatform.goanimate.com","edplatform.goanimate.org","sandbox.edplatform.goanimate.com","sandbox.edplatform.goanimate.org","sandbox.schoology.goanimate.com","schoology.goanimate4schools.com","*.wix.com","d3v4eglovri8yt.cloudfront.net","*.wix.goanimate.com","wix.goanimate.com","wix.goanimate.org","wix-cdn.goanimate.org");
		}
	}
}
