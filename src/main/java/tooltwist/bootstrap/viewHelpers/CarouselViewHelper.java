package tooltwist.bootstrap.viewHelpers;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import tooltwist.misc.TtConfig;
import tooltwist.wbd.ViewHelper;
import tooltwist.wbd.WbdCache;

import com.dinaa.data.XData;
import com.dinaa.data.XNodes;
import com.dinaa.ui.UimData;
import com.dinaa.util.DinaaUtilUrls;
import com.dinaa.xpc.Xpc;
import com.dinaa.xpc.XpcLogin;
import com.dinaa.xpc.XpcSecurity;

public class CarouselViewHelper extends ViewHelper
{
	private static final Logger logger = LoggerFactory.getLogger(CarouselViewHelper.class);
	private String navpointId = "";
	private String pageDataSection = "";
	private boolean isNutra = false;

	public CarouselViewHelper(Properties prop)
	{
		super(prop);
		navpointId = prop.getProperty("navpointId");
		pageDataSection = prop.getProperty("pageDataSection");
	}
	
	public List<Carousel> getImageList() {
		ArrayList<Carousel> imageList = null; 
		
		 try {
			  XpcSecurity xpcSecurity = XpcLogin.login(DinaaUtilUrls.USER_TYPE, 
						TtConfig.getInternalLoginName(), TtConfig.getInternalLoginPassword());
			  Xpc xpc = new Xpc(xpcSecurity);
			  xpc.start("tooltwist.wbd.getPagedata", "select");
			  xpc.attrib("pageDataNavPoint", navpointId);
			  xpc.attrib("pageDataSection", pageDataSection);
			  XData pageData = xpc.run();
		      imageList = new ArrayList<Carousel>();
	    	  //XNodes nodes = pageData.getNodes("imagePath");
		      XNodes nodes = pageData.getNodes("banner");
//		      XNodes video = pageData.getNodes("video");
//		      XNodes nodes2 = pageData.getNodes("config");
		      String confOption = null;
//		      for (nodes2.first(); nodes2.next();) {
//			      XNodes config = nodes2.getNodes("option");
//			      confOption = config.getText();
//		      }
		    	  int index = 0;
		    	  
//		    	  if(confOption.equalsIgnoreCase("video")) {
//		    		  for (video.first(); video.next();) {
//			    		  
//			    		  XNodes imageNode = video.getNodes("videoPath");
//			    		  XNodes linkNode = video.getNodes("videoLink");
//			    		 
//			    		    boolean status = false;
//			    		  
//				    		//String imagePath = nodes.getText();
//				    		String imagePath = imageNode.getText();
//				    		String linkPath = linkNode.getText();
//				    		
//				    		Carousel carousel = new Carousel();
//				    		carousel.setImage(imagePath);
//				    		carousel.setUrl(linkPath);
//				    		if (index == 0) {
//				    			status = true;
//				    			carousel.setActive(status);
//				    		} else {
//				    			carousel.setActive(status);
//				    		}
//				    		carousel.setIndex(index);
//				    		index++;
//				    		carousel.setType("video");
//				  				imageList.add(carousel);
//					  }
//		    	  }
//		    	  else {
		    		  for (nodes.first(); nodes.next();) {
			    		  
			    		  XNodes imageNode = nodes.getNodes("imagePath");
			    		  XNodes linkNode = nodes.getNodes("bannerLink");
			    		 
			    		    boolean status = false;
			    		  
				    		//String imagePath = nodes.getText();
				    		String imagePath = imageNode.getText();
				    		String linkPath = linkNode.getText();
				    		
				    		Carousel carousel = new Carousel();
				    		carousel.setImage(imagePath);
				    		carousel.setUrl(linkPath);
				    		if (index == 0) {
				    			status = true;
				    			carousel.setActive(status);
				    		} else {
				    			carousel.setActive(status);
				    		}
				    		carousel.setIndex(index);
				    		index++;
				    		
				  				imageList.add(carousel);
					  }
//		    	  }
	      } catch (Exception ex) {
	    	  logger.error("getImageList() " + ex.fillInStackTrace());
	      }
		
		return imageList;
	}

	@Override
	public XData preFetch(UimData ud) throws Exception {
		
		setIsNutra(WbdCache.getProperty("isNutra").equals("true") ? true : false);
		
		return null;
	}
	
	public boolean getIsNutra() {
		return isNutra;
	}

	public void setIsNutra(boolean isNutra) {
		this.isNutra = isNutra;
	}

	class Carousel {
		
		private String image = "";
		private String url = "";
		private String type="";
		private boolean active = false;
		private int index = 0;
		
		public String getImage() {
			return image;
		}
		public void setImage(String image) {
			this.image = image;
		}
		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
		}
		public String getUrl() {
			return url;
		}
		public void setUrl(String url) {
			this.url = url;
		}
		public boolean isActive() {
			return active;
		}
		public void setActive(boolean active) {
			this.active = active;
		}
		public int getIndex() {
			return index;
		}
		public void setIndex(int index) {
			this.index = index;
		}
		
		
		
	}
	
}
