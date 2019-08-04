package com.ez.jamong.categorym.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ez.jamong.common.ExcelUtil;

@Service
public class CategoryMServiceImpl implements CategoryMService{
	private Logger logger = LoggerFactory.getLogger(CategoryMServiceImpl.class);
	@Autowired
	private CategoryMDAO categoryDao;

	@Override
	public int categorymAdd(CategoryMVO vo) {
		return categoryDao.categorymAdd(vo);
	}

	@Override
	public List<CategoryMVO> selectCategorymAll() {
		return categoryDao.selectCategorymAll();
	}

	@Override
	public CategoryMVO selectCategorymByNo(int categoryNoM) {
		return categoryDao.selectCategorymByNo(categoryNoM);
	}

	@Override
	public int updateCategorym(CategoryMVO vo) {
		return categoryDao.updateCategorym(vo);
	}

	@Override
	public int deleteCategorym(int categoryNoM) {
		return categoryDao.deleteCategorym(categoryNoM);
	}

	@Override
	public Map<String, Object> selectCategoryView(int categoryNoM) {
		return categoryDao.selectCategoryView(categoryNoM);
	}

	@Override
	public List<Map<String, Object>> selectCategoryAllView() {
		return categoryDao.selectCategoryAllView();
	}

	@Override
	public List<CategoryMVO> selectCategoryM(int categoryNoL) {
		return categoryDao.selectCategoryM(categoryNoL);
	}

	@Override
	public int getExcelUpload(String excelFile) {
        int cnt = 0;
        Map<String, String> map = new HashMap<String, String>();
        logger.info("getExcelUpload서비스 진입");
        try {
//            Workbook wbs = WorkbookFactory.create(new FileInputStream(excelFile));
            Workbook wbs = ExcelUtil.getWorkbook(excelFile);
            
            Sheet sheet = (Sheet) wbs.getSheetAt(0);
 
            //excel file 두번쨰줄부터 시작
            for (int i = sheet.getFirstRowNum() + 1; i <= sheet.getLastRowNum(); i++) {
                
                logger.info("map i={} : ",i);
                
                Row row = sheet.getRow(i);
                
                map.put("categoryNoL", ""+ExcelUtil.cellValue(row.getCell(0)));
                map.put("categoryName", ""+ExcelUtil.cellValue(row.getCell(1)));
                map.put("categoryDesc", ""+ExcelUtil.cellValue(row.getCell(2)));
                map.put("imgName", ""+ExcelUtil.cellValue(row.getCell(3)));
                map.put("imgOriginalName", ""+ExcelUtil.cellValue(row.getCell(4)));
                //신규삽입 
                logger.info("map 출력={}",map);
                categoryDao.categorymInsertDB(map);
                
                cnt++;
            }
 
        }catch(Exception e){
        	e.printStackTrace();
        }
        
        return cnt;
	}
}