package com.ez.jamong.files.model;

import java.util.List;
import java.util.Map;

public interface FilesDAO {
	public List<Map<String, Object>> selectfileUser(int userno);
	public List<Map<String, Object>> selectfileExpert(int userno);
}
