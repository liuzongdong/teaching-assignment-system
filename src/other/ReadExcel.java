package other;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Iterator;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import course.assign.Course;

public class ReadExcel 
{
	private static final String EXCEL_XLS = "xls";
    private static final String EXCEL_XLSX = "xlsx";
    
	public static boolean ReadExcelFile(FileInputStream input) throws IOException
    {
		boolean status = false;
		int flag = 0; // Initialize a flag to skip the first row.
    	FileInputStream inputStream = input;
    	Workbook workbook = new XSSFWorkbook(inputStream);
    	Sheet firstSheet = workbook.getSheetAt(0);
    	Iterator<Row> iterator = firstSheet.iterator();
    	while (iterator.hasNext()) 
    	{
            Row nextRow = iterator.next();
            Iterator <Cell> cellIterator = nextRow.cellIterator();
            while (cellIterator.hasNext()) 
            {
                Cell cell = cellIterator.next();
                System.out.print(cell.getStringCellValue());
                System.out.print("\t");
            }
            System.out.println();
            if (flag == 0) 
            {
				if (!(nextRow.getCell(0).getStringCellValue().equals("Course Name") && nextRow.getCell(1).getStringCellValue().equals("Course Category") && nextRow.getCell(2).getStringCellValue().equals("Course Student")))
				{
					status = false;
					break;
				}
			}
            //Ignore the first row.
            if (flag == 1) 
            {
            	Course course = new Course(nextRow.getCell(0).getStringCellValue(), nextRow.getCell(1).getStringCellValue(), nextRow.getCell(2).getStringCellValue());
                course.AddCourse();
                status = true;
			}
            flag = 1;
        }
        workbook.close();
        inputStream.close();
        return status;
    }
	
	public static boolean CheckExcel(String filename)
	{
		boolean status = false;
		if (filename.endsWith(EXCEL_XLS) || filename.endsWith(EXCEL_XLSX)) 
		{
			status = true;
		}
		return status;
	}
}
