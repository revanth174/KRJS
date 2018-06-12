package extra;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class FileUploadUtility {

	private static final String ABS_PATH = "F:/First/pro/krjs/src/main/webapp/assets/images/";
	private static String REAL_PATH = "";

	
	
	public static void main(String args[]) throws IOException {
	
	}
	public static void uploadFile(HttpServletRequest request, MultipartFile file, int memberId) {

		REAL_PATH = request.getSession().getServletContext().getRealPath("/assets/images/");
		System.out.println(REAL_PATH);
		// to make sure all directory exists
		// if doesnot it will create dir for us

		if (!new File(ABS_PATH).exists()) {

			// CREATE DIRECTORY	
			new File(ABS_PATH).mkdirs();
		}

		if (!new File(REAL_PATH).exists()) {

			new File(REAL_PATH).mkdirs();
		}
		
		
		try {
			MultipartFile file2  = file;
			
			
			
			file.transferTo(new File(ABS_PATH+memberId+ ".jpg"));
			//file.transferTo(new File(REAL_PATH+memberId+ ".jpg"));
			System.out.println("all file are successfully trasferred");
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public static BufferedImage readFile(int id) throws IOException {
		System.out.println(new File(ABS_PATH+id+".jpg").exists());
		System.out.println(new File(ABS_PATH+id+".jpg").getName());
		BufferedImage i = new BufferedImage(350,450,BufferedImage.TYPE_INT_ARGB);
		i = ImageIO.read(new File(ABS_PATH+id+".jpg"));
		
		System.out.println("reading complered");
		return i;
		
	}

	public static void writeFile(BufferedImage i,int id) throws IOException {
		/*System.out.println(new File(ABS_PATH+"103.jpg").exists());
		System.out.println(new File(ABS_PATH+"103.jpg").getName());
		BufferedImage i = new BufferedImage(350,450,BufferedImage.TYPE_INT_ARGB);*/
		
		//i = ImageIO.read(new File(ABS_PATH+"103.jpg"));
		ImageIO.write(i, "jpg",new File( ABS_PATH+id+".jpg"));
		
		System.out.println("writing complered");
		
	}
}
