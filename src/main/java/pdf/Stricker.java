package pdf;

import com.itextpdf.text.*;
//import com.itextpdf.text.*;
//import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.FileOutputStream;

public class Stricker {
    public static void main(String[] args) {
        Document document = new Document();

        try {
            PdfWriter.getInstance(document,
                    new FileOutputStream("strickergen.pdf"));

            document.open();

            int count =0;
           
                PdfPTable table1 = new PdfPTable(1);
                table1.setWidthPercentage(33);
                table1.setSpacingBefore(3);
                table1.setSpacingAfter(-108);


                //table1.set
                table1.setHorizontalAlignment(table1.ALIGN_LEFT);

                PdfPTable table2 = new PdfPTable(1);
                table2.setWidthPercentage(33);
                table2.setSpacingBefore(3);
                table2.setSpacingAfter(-108);
                table2.setHorizontalAlignment(table2.ALIGN_MIDDLE);

                PdfPTable table3 = new PdfPTable(1);
                table3.setWidthPercentage(33);
                table3.setSpacingBefore(3);
                //table3.setSpacingAfter(0);
                table3.setHorizontalAlignment(table3.ALIGN_RIGHT);

                /*PdfPTable table4 = new PdfPTable(1);
                table4.setWidthPercentage(33);
                table4.setSpacingBefore(3);
                table4.setSpacingAfter(-106);
                table4.setHorizontalAlignment(table4.ALIGN_LEFT);

                PdfPTable table5 = new PdfPTable(1);
                table5.setWidthPercentage(33);
                table5.setSpacingBefore(1);
                table5.setSpacingAfter(-106);
                table5.setHorizontalAlignment(table5.ALIGN_MIDDLE);

                PdfPTable table6 = new PdfPTable(1);
                table6.setWidthPercentage(33);
                table6.setSpacingBefore(1);
                table6.setSpacingAfter(-106);
                table6.setHorizontalAlignment(table6.ALIGN_RIGHT);
*/
                /*PdfPTable table7 = new PdfPTable(1);
                table7.setWidthPercentage(33);
                table7.setSpacingBefore(109);
                table7.setSpacingAfter(-106);
                table7.setHorizontalAlignment(table7.ALIGN_LEFT);

                PdfPTable table8 = new PdfPTable(1);
                table8.setWidthPercentage(33);
                table8.setSpacingBefore(1);
                table8.setSpacingAfter(-106);
                table8.setHorizontalAlignment(table8.ALIGN_MIDDLE);

                PdfPTable table9 = new PdfPTable(1);
                table9.setWidthPercentage(33);
                table9.setSpacingBefore(1);
                table9.setSpacingAfter(-106);
                table9.setHorizontalAlignment(table9.ALIGN_RIGHT);

                PdfPTable table10 = new PdfPTable(1);
                table10.setWidthPercentage(33);
                table10.setSpacingBefore(109);
                table10.setSpacingAfter(-106);
                table10.setHorizontalAlignment(table10.ALIGN_LEFT);

                PdfPTable table11 = new PdfPTable(1);
                table11.setWidthPercentage(33);
                table11.setSpacingBefore(1);
                table11.setSpacingAfter(-106);
                table11.setHorizontalAlignment(table11.ALIGN_MIDDLE);

                PdfPTable table12 = new PdfPTable(1);
                table12.setWidthPercentage(33);
                table12.setSpacingBefore(1);
                table12.setSpacingAfter(-106);
                table12.setHorizontalAlignment(table12.ALIGN_RIGHT);

                PdfPTable table13 = new PdfPTable(1);
                table13.setWidthPercentage(33);
                table13.setSpacingBefore(109);
                table13.setSpacingAfter(-106);
                table13.setHorizontalAlignment(table13.ALIGN_LEFT);

                PdfPTable table14 = new PdfPTable(1);
                table14.setWidthPercentage(33);
                table14.setSpacingBefore(1);
                table14.setSpacingAfter(-106);
                table14.setHorizontalAlignment(table14.ALIGN_MIDDLE);

                PdfPTable table15 = new PdfPTable(1);
                table15.setWidthPercentage(33);
                table15.setSpacingBefore(1);
                table15.setSpacingAfter(-106);
                table15.setHorizontalAlignment(table15.ALIGN_RIGHT);

                PdfPTable table16 = new PdfPTable(1);
                table16.setWidthPercentage(33);
                table16.setSpacingBefore(109);
                table16.setSpacingAfter(-106);
                table16.setHorizontalAlignment(table16.ALIGN_LEFT);

                PdfPTable table17 = new PdfPTable(1);
                table17.setWidthPercentage(33);
                table17.setSpacingBefore(1);
                table17.setSpacingAfter(-106);
                table17.setHorizontalAlignment(table17.ALIGN_MIDDLE);

                PdfPTable table18 = new PdfPTable(1);
                table18.setWidthPercentage(33);
                table18.setSpacingBefore(1);
                table18.setSpacingAfter(-106);
                table18.setHorizontalAlignment(table18.ALIGN_RIGHT);

                PdfPTable table19 = new PdfPTable(1);
                table19.setWidthPercentage(33);
                table19.setSpacingBefore(109);
                table19.setSpacingAfter(-106);
                table19.setHorizontalAlignment(table19.ALIGN_LEFT);

                PdfPTable table20 = new PdfPTable(1);
                table20.setWidthPercentage(33);
                table20.setSpacingBefore(1);
                table20.setSpacingAfter(-106);
                table20.setHorizontalAlignment(table20.ALIGN_MIDDLE);

                PdfPTable table21 = new PdfPTable(1);
                table21.setWidthPercentage(33);
                table21.setSpacingBefore(1);
                table21.setSpacingAfter(-106);
                table21.setHorizontalAlignment(table21.ALIGN_RIGHT);*/

                Font font3 = new Font(Font.FontFamily.TIMES_ROMAN, 6.5f);
                Font fontcolor = new Font(Font.FontFamily.TIMES_ROMAN, 6.5f, Font.BOLD);
                fontcolor.setColor(BaseColor.ORANGE);


                PdfPCell cell1 = new PdfPCell();
                cell1.setFixedHeight(90.87f);
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
                
                cell1.addElement(nesttable);
                nesttable.addCell(cellmemid);

               
                PdfPCell cellimg = new PdfPCell();
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
                celldetails.addElement(new Phrase("Balakrishna Reddy P",font3));
                celldetails.addElement(new Phrase("Venkataramana Reddy R",font3));
                celldetails.setVerticalAlignment(Element.ALIGN_CENTER);
                celldetails.setBorder(Rectangle.NO_BORDER);
                nesttable.addCell(celldetails);
                /*Image image = Image.getInstance("images/second.jpg");
                PdfPCell cellimg = new PdfPCell(image, true);
                cellimg.setRowspan(2);
                //cellimg.setBorder(Rectangle.NO_BORDER);
                *//*cellimg.setPaddingLeft(7);
                cellimg.setPaddingRight(4);*//*
                cellimg.setFixedHeight(10);
                nesttable.addCell(cellimg);
                nesttable.completeRow();*/

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
                celladdDeatils.addElement(new Phrase("H No 8-2-269 /s/81 Sagar socity Road\n" +
                        "No 2 Banjara Hills Hyderabad Andhra\n" +
                        "Pradesh-500001",font3));
                celladdDeatils.setBorder(Rectangle.NO_BORDER);
                nesttable.addCell(celladdDeatils);
                nesttable.completeRow();


                PdfPCell cellphn = new PdfPCell();
                //cellphn.setColspan(3);
                cellphn.setPaddingLeft(3);
                cellphn.setPaddingBottom(6);
                cellphn.setBorder(Rectangle.NO_BORDER);
                
                nesttable.addCell(cellphn);

                PdfPCell cellphnDeatils = new PdfPCell();
                cellphnDeatils.setColspan(2);
                
                cellphnDeatils.setBorder(Rectangle.NO_BORDER);
                nesttable.addCell(cellphnDeatils);
                nesttable.completeRow();

                PdfPCell cell2 = new PdfPCell();
                cell2.setFixedHeight(104.87f);
                cell2.setPaddingRight(0);
                cell2.setBorderWidth(1);
                //cell2.setBorder(Rectangle.NO_BORDER);
                cell2.addElement(nesttable);

                PdfPCell cell3 = new PdfPCell();
                cell3.setFixedHeight(104.87f);
                cell3.setPaddingRight(0);
                cell3.setBorderWidth(1);
                //cell3.setBorder(Rectangle.NO_BORDER);
                cell3.addElement(nesttable);

                /*PdfPCell cell4 = new PdfPCell();
                cell4.setFixedHeight(104.87f);
                cell4.setPaddingRight(0);
                cell4.setBorder(Rectangle.NO_BORDER);
                cell4.addElement(nesttable);

                PdfPCell cell5 = new PdfPCell();
                cell5.setFixedHeight(104.87f);
                cell5.setPaddingRight(0);
                cell5.setBorder(Rectangle.NO_BORDER);
                cell5.addElement(nesttable);

                PdfPCell cell6 = new PdfPCell();
                cell6.setFixedHeight(104.87f);
                cell6.setPaddingRight(0);
                cell6.setBorder(Rectangle.NO_BORDER);
                cell6.addElement(nesttable);

                PdfPCell cell7 = new PdfPCell();
                cell7.setFixedHeight(104.87f);
                cell7.setPaddingRight(0);
                cell7.setBorder(Rectangle.NO_BORDER);
                cell7.addElement(nesttable);

                PdfPCell cell8 = new PdfPCell();
                cell8.setFixedHeight(104.87f);
                cell8.setPaddingRight(0);
                cell8.setBorder(Rectangle.NO_BORDER);
                cell8.addElement(nesttable);

                PdfPCell cell9 = new PdfPCell();
                cell9.setFixedHeight(104.87f);
                cell9.setPaddingRight(0);
                cell9.setBorder(Rectangle.NO_BORDER);
                cell9.addElement(nesttable);

                PdfPCell cell10 = new PdfPCell();
                cell10.setFixedHeight(104.87f);
                cell10.setPaddingRight(0);
                cell10.setBorder(Rectangle.NO_BORDER);
                cell10.addElement(nesttable);

                PdfPCell cell11 = new PdfPCell();
                cell11.setFixedHeight(104.87f);
                cell11.setPaddingRight(0);
                cell11.setBorder(Rectangle.NO_BORDER);
                cell11.addElement(nesttable);

                PdfPCell cell12 = new PdfPCell();
                cell12.setFixedHeight(104.87f);
                cell12.setPaddingRight(0);
                cell12.setBorder(Rectangle.NO_BORDER);
                cell12.addElement(nesttable);

                PdfPCell cell13 = new PdfPCell();
                cell13.setFixedHeight(104.87f);
                cell13.setPaddingRight(0);
                cell13.setBorder(Rectangle.NO_BORDER);
                cell13.addElement(nesttable);

                PdfPCell cell14 = new PdfPCell();
                cell14.setFixedHeight(104.87f);
                cell14.setPaddingRight(0);
                cell14.setBorder(Rectangle.NO_BORDER);
                cell14.addElement(nesttable);

                PdfPCell cell15 = new PdfPCell();
                cell15.setFixedHeight(104.87f);
                cell15.setPaddingRight(0);
                cell15.setBorder(Rectangle.NO_BORDER);
                cell15.addElement(nesttable);

                PdfPCell cell16 = new PdfPCell();
                cell16.setFixedHeight(104.87f);
                cell16.setPaddingRight(0);
                cell16.setBorder(Rectangle.NO_BORDER);
                cell16.addElement(nesttable);

                PdfPCell cell17 = new PdfPCell();
                cell17.setFixedHeight(104.87f);
                cell17.setPaddingRight(0);
                cell17.setBorder(Rectangle.NO_BORDER);
                cell17.addElement(nesttable);

                PdfPCell cell18 = new PdfPCell();
                cell18.setFixedHeight(104.87f);
                cell18.setPaddingRight(0);
                cell18.setBorder(Rectangle.NO_BORDER);
                cell18.addElement(nesttable);

                PdfPCell cell19 = new PdfPCell();
                cell19.setFixedHeight(104.87f);
                cell19.setPaddingRight(0);
                cell19.setBorder(Rectangle.NO_BORDER);
                cell19.addElement(nesttable);

                PdfPCell cell20 = new PdfPCell();
                cell20.setFixedHeight(104.87f);
                cell20.setPaddingRight(0);
                cell20.setBorder(Rectangle.NO_BORDER);
                cell20.addElement(nesttable);

                PdfPCell cell21 = new PdfPCell();
                cell21.setFixedHeight(104.87f);
                cell21.setPaddingRight(0);
                cell21.setBorder(Rectangle.NO_BORDER);
                cell21.addElement(nesttable);
*/


                table1.addCell(cell1);
                table2.addCell(cell2);
                table3.addCell(cell3);
                /*table4.addCell(cell4);
                table5.addCell(cell5);
                table6.addCell(cell6);*/
               /* table7.addCell(cell7);
                table8.addCell(cell8);
                table9.addCell(cell9);
                table10.addCell(cell10);
                table11.addCell(cell11);
                table12.addCell(cell12);
                table13.addCell(cell13);
                table14.addCell(cell14);
                table15.addCell(cell15);
                table16.addCell(cell16);
                table17.addCell(cell17);
                table18.addCell(cell18);
                table19.addCell(cell19);
                table20.addCell(cell20);
                table21.addCell(cell21);*/

                document.add(table1);
                document.add(table2);
                document.add(table3);
               /* document.add(table4);
                document.add(table5);
                document.add(table6);*/
                /*document.add(table7);
                document.add(table8);
                document.add(table9);
                document.add(table10);
                document.add(table11);
                document.add(table12);
                document.add(table13);
                document.add(table14);
                document.add(table15);
                document.add(table16);
                document.add(table17);
                document.add(table18);
                document.add(table19);
                document.add(table20);
                document.add(table21);*/
               
            

            document.close();
            } catch(Exception e){
                e.printStackTrace();

            }
        }
    }

