package com.ez.jamong.files.model;

import java.util.List;
import java.util.Map;

public interface FilesService {
	public List<FilesVO> selectfileUser(int userno);
	public List<FilesVO> selectfileExpert(int userno);	
}