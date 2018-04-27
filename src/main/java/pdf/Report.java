package pdf;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.reddy.krjs.supportEnd.Model.Member;
import com.reddy.krjs.supportEnd.dao.MemberDao;





/*class Member {
	String name;
	String memberId;
	String address;
	String phone;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public Member(String name, String memberId, String address, String phone) {
		super();
		this.name = name;
		this.memberId = memberId;
		this.address = address;
		this.phone = phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
}
*/
public class Report {
	public static  Document document ;
	
	public static MemberDao dao;
	 public static void main(String args[]) throws DocumentException, IOException {
		 SimpleDateFormat sdf = new SimpleDateFormat("dd/M/yyyy");
		 List<Member> li = dao.getByMobileNumber("7396880443");
		 printId(li, "idcard","F:\\First\\pro\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\krjs\\webapp\r\n" + 
		    		"/krjs" );
			/*String date = sdf.format(new Date()); 
			
			//System.out.println(date);
			
			
	       
	        Calendar calendar = new GregorianCalendar();
	        int year       = calendar.get(Calendar.YEAR);
	    	int month      = calendar.get(Calendar.MONTH);
	    	int day 		= calendar.get(Calendar.DAY_OF_MONTH);
	    	int hourOfDay  = calendar.get(Calendar.HOUR_OF_DAY); // 24 hour clock
	    	int minute     = calendar.get(Calendar.MINUTE);
	    	int second     = calendar.get(Calendar.SECOND);
	    	System.out.println(""+year+month+day+hourOfDay+minute+second);
	    	System.out.println(month);
	    	System.out.println(day);*/
		  	
		    /*MemberDao dao = new MemberDaoImpl();
		    List<Member> l = dao.getByDistrict("mumbai");
		    memberPrint(l,"voter", "F:\\First\\pro\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\krjs\\webapp\r\n" + 
		    		"/krjs");*/
	 }
	 

	public static void memberPrint(List<Member> p,String name,String path)
			throws DocumentException,IOException {
		document = new Document();
		
		 PdfWriter.getInstance(document,
		            new FileOutputStream(path+"/"+name+".pdf"));

		 
		    document.open();
		
		    	System.out.println("hello welcome ");
		Iterator<Member> list = p.iterator();
		int count = 0;
		while(list.hasNext()) {
			Member m = list.next();
			System.out.println(m.getMemberId());
			count+=1;
			PdfPTable table1 = new PdfPTable(1);
			table1.setWidthPercentage(33);
			table1.setSpacingBefore(3);
			table1.setSpacingAfter(-108);
	
	
	
			int rem = count%3;
			switch(rem) {
			case 1 :
				 table1.setHorizontalAlignment(Element.ALIGN_LEFT);
				break;
			case 2 :
				 table1.setHorizontalAlignment(Element.ALIGN_MIDDLE);
				break;
			default :
				table1.setSpacingAfter(0);
			    table1.setHorizontalAlignment(Element.ALIGN_RIGHT);
				
			}
	      
			Font font3 = new Font(Font.FontFamily.TIMES_ROMAN, 6.5f);
			Font fontcolor = new Font(Font.FontFamily.TIMES_ROMAN, 6.5f, Font.BOLD);
			fontcolor.setColor(BaseColor.ORANGE);
	
	
			PdfPCell cell1 = new PdfPCell();
			cell1.setFixedHeight(104.87f);
			cell1.setPaddingRight(0);
			cell1.setBorderWidth(1);
			PdfPTable nesttable = new PdfPTable(3);
	
			nesttable.setWidths(new float[]{1, 2, 1});
			nesttable.setWidthPercentage(100);
			PdfPCell cellmemid = new PdfPCell();
			cellmemid.setColspan(2);
			cellmemid.setPaddingLeft(3);
			cellmemid.setPaddingTop(-2);
			cellmemid.setBorder(Rectangle.NO_BORDER);
			cellmemid.addElement(new Phrase("Membership No." + m.getMemberId(), font3));
			cell1.addElement(nesttable);
			nesttable.addCell(cellmemid);
	
			Image image = null;
			try {
				image = Image.getInstance(path+"/images/"+m.getMemberId()+".jpg");
			} catch(FileNotFoundException e) {
				image = Image.getInstance(path+"/images/"+"nophoto"+".png");
			}
			PdfPCell cellimg = new PdfPCell(image, true);
			cellimg.setRowspan(2);
			cellimg.setHorizontalAlignment(Element.ALIGN_CENTER);
			cellimg.setBorder(Rectangle.NO_BORDER);
			//cellimg.setPaddingLeft(7);
			//cellimg.setPaddingRight(4);
			cellimg.setFixedHeight(12);
	
			nesttable.addCell(cellimg);
			nesttable.completeRow();
	
			PdfPCell celldets = new PdfPCell();
			//celldets.setColspan(2);
			celldets.setPaddingLeft(3);
			celldets.setFixedHeight(38);
			celldets.setBorder(Rectangle.NO_BORDER);
			celldets.addElement(new Phrase("Name", font3));
			celldets.addElement(new Phrase("Father/\nHusband", font3));
			nesttable.addCell(celldets);
	
			PdfPCell celldetails = new PdfPCell();
			celldetails.addElement(new Phrase(m.getName(),font3));
			celldetails.addElement(new Phrase(m.getFhname(),font3));
			celldetails.setVerticalAlignment(Element.ALIGN_CENTER);
			celldetails.setBorder(Rectangle.NO_BORDER);
			nesttable.addCell(celldetails);
			
	
			PdfPCell celladd = new PdfPCell();
			//celladd.setColspan(3);
			celladd.setPaddingLeft(3);
			celladd.setPaddingTop(1);
			celladd.setFixedHeight(35);
			celladd.setBorder(Rectangle.NO_BORDER);
			celladd.addElement(new Phrase("Address", font3));
			nesttable.addCell(celladd);
	
	
	
			PdfPCell celladdDeatils = new PdfPCell();
			celladdDeatils.setColspan(2);
			celladdDeatils.addElement(new Phrase(m.getAddress().toString(),font3));
			celladdDeatils.setBorder(Rectangle.NO_BORDER);
			nesttable.addCell(celladdDeatils);
			nesttable.completeRow();
	
	
			PdfPCell cellphn = new PdfPCell();
			//cellphn.setColspan(3);
			cellphn.setPaddingLeft(3);
			cellphn.setPaddingBottom(6);
			cellphn.setBorder(Rectangle.NO_BORDER);
			cellphn.addElement(new Phrase("Phone", font3));
			nesttable.addCell(cellphn);
	
			PdfPCell cellphnDeatils = new PdfPCell();
			cellphnDeatils.setColspan(2);
			cellphnDeatils.addElement(new Phrase(m.getDetails().getPhone(),font3));
			cellphnDeatils.setBorder(Rectangle.NO_BORDER);
			nesttable.addCell(cellphnDeatils);
			nesttable.completeRow();
	
	     
	
	
			table1.addCell(cell1);
	     
	
			document.add(table1);
		}
		
			 document.close();
			
	}

	public static void printId(List<Member> p,String name,String path) {
		 Document document = new Document();

	        try {
	            PdfWriter.getInstance(document,
	            		new FileOutputStream(path+"/"+name+".pdf"));
	            
	            document.open();
	            Iterator<Member> list = p.iterator();
	            int n = 1;
	            int count = -1;
	            while(list.hasNext()) {
	            	n++;
	            	count += 1;
	            	Member m = (Member)list.next();
	                PdfPTable table1 = new PdfPTable(1);
	                table1.setWidthPercentage(42);
	                //table1.setSpacingAfter(-150);
	               // table1.setHorizontalAlignment(Element.ALIGN_LEFT);

	                switch(count%2) {
	                case 0 : 
	                	table1.setSpacingAfter(-150);
		                table1.setHorizontalAlignment(Element.ALIGN_LEFT);
		                break;
	                case 1:
	                	table1.setSpacingBefore(3);
		                table1.setSpacingAfter(3);
		                table1.setHorizontalAlignment(Element.ALIGN_RIGHT);
		                break;
	                	
	                }
	               /* PdfPTable table2 = new PdfPTable(1);
	                table2.setWidthPercentage(42);
	                table2.setSpacingBefore(3);
	                table2.setSpacingAfter(3);
	                table2.setHorizontalAlignment(Element.ALIGN_RIGHT);*/

	               

	               
	                PdfPCell cell1 = new PdfPCell();
	                cell1.setFixedHeight(150);
	                PdfPTable nesttable = new PdfPTable(3);
	                cell1.setBorder(Rectangle.NO_BORDER);

	                nesttable.setWidths(new float[]{1,2, 1});
	                nesttable.setWidthPercentage(100);

	                PdfPCell cell11 = new PdfPCell();
	                Image header = Image.getInstance(path+"/images/"+"header"+".jpg");
	                cell11 = new PdfPCell(header);
	                cell11.setBorder(Rectangle.NO_BORDER);
	                cell11.setColspan(3);
	                nesttable.addCell(cell11);
	                nesttable.completeRow();

	                Font font3 = new Font(Font.FontFamily.TIMES_ROMAN, 6.5f);
	                Font fontcolor = new Font(Font.FontFamily.TIMES_ROMAN, 6.5f,Font.BOLD);
	                fontcolor.setColor(BaseColor.ORANGE);

	                PdfPCell cell23=new PdfPCell();
	                cell23.addElement(new Phrase("Membership No."+"                                 "+m.getMemberId(),fontcolor));
	                cell23.setPaddingTop(0);
	                cell23.setPaddingLeft(65);
	                cell23.setColspan(3);
	                cell23.setBorder(Rectangle.NO_BORDER);
	                nesttable.addCell(cell23);
	                nesttable.completeRow();

	                PdfPCell cell21 = new PdfPCell();
	                cell21.setBorder(Rectangle.NO_BORDER);
	                cell21.addElement(new Phrase("Name",fontcolor));
	                cell21.addElement(new Phrase("Father/\nHusband",fontcolor));
	                cell21.addElement(new Phrase("Address",fontcolor));
	                nesttable.addCell(cell21);


	                PdfPCell cellcontent = new PdfPCell();
	                cellcontent.setBorder(Rectangle.NO_BORDER);
	                cellcontent.addElement(new Phrase(m.getName(),font3));
	                cellcontent.addElement(new Phrase(m.getFhname(),font3));
	                cellcontent.addElement(new Phrase("\n"+m.getAddress().toString(),font3));
	                nesttable.addCell(cellcontent);


	                Image image = Image.getInstance(path+"/images/"+m.getMemberId()+".jpg");
	                PdfPCell cell22 = new PdfPCell(image);
	                cell22.setPaddingTop(3);
	                cell22.setPaddingRight(2);
	                cell22.setBorder(Rectangle.NO_BORDER);
	                nesttable.addCell(cell22);
	                cell1.addElement(nesttable);
	                nesttable.completeRow();


	                Image imagesign =Image.getInstance(path+"/images/sign.jpg");
	                PdfPCell cellsig = new PdfPCell(imagesign,true);
	                cellsig.setColspan(2);
	                cellsig.setPaddingTop(10);
	                cellsig.setBorder(Rectangle.NO_BORDER);

	                Image pressign =Image.getInstance(path+"/images/princsign.jpg");
	                PdfPCell cellsig2 = new PdfPCell(pressign,true);
	                cellsig2.setPaddingTop(10);
	                cellsig2.setBorder(Rectangle.NO_BORDER);

	                nesttable.addCell(cellsig);
	                nesttable.addCell(cellsig2);


	               
	    
	               


	                table1.addCell(cell1);
	                //table2.addCell(cell2);
	               

	                document.add(table1);
	               // document.add(table2);
	               
	                //document.newPage();

	            }

	            document.close();
	        } catch(Exception e){
	            e.printStackTrace();

	        }
	}
}
