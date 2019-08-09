package com.ez.jamong.files.model;

import java.util.List;
import java.util.Map;

public interface FilesService {
	public List<Map<String, Object>> selectfileUser(int userno);
	public List<Map<String, Object>> selectfileExpert(int userno);
	public int insertFiles(FilesVO vo);
}