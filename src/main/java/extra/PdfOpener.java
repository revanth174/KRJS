package extra;

import java.awt.Desktop;
import java.io.File;
import java.io.IOException;

public class PdfOpener {
	
	
		
		public void openPdf(String name,String path) throws IOException {
        File file = new File(path+"/pdf/"+name+".pdf");
        
        //first check if Desktop is supported by Platform or not
        if(!Desktop.isDesktopSupported()){
            System.out.println("Desktop is not supported");
            return;
        }
        
        Desktop desktop = Desktop.getDesktop();
        if(file.exists()) desktop.open(file);
        
        
        
    }

}
