package com.project.weekend.util;

import java.io.File;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class FileSaver {
	// 1-2. MultipartFile;
	public String saveFile(String realPath, MultipartFile multipartFile) throws Exception{
		File file = new File(realPath);
		if(!file.exists()) {
			file.mkdirs();
		}
		String fileSystemName = UUID.randomUUID().toString();
		String originalName = multipartFile.getOriginalFilename();
		originalName = originalName.substring(originalName.lastIndexOf("."));
		fileSystemName = fileSystemName + originalName;
		// ���옣;
		file = new File(realPath, fileSystemName);
		FileCopyUtils.copy(multipartFile.getBytes(), file);
		return fileSystemName;
	}
	
	public int deleteFile(String realPath, String fname) throws Exception{
		File file = new File(realPath, fname);
		boolean result = false;
		int check = 0;
		if(file.exists()) {
			result = file.delete();
		}
		if(result) {
			check=1;
		}
		return check;
	}
}
