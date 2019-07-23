package com.project.weekend.util;

import java.io.File;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class FileSaver {
	// 1. Spring 에서 제공하는 FileCopyUtils 클래스의 copy 메서드 사용;
	// 1-1. 저장경로;
	// 1-2. MultipartFile;
	public String saveFile(String realPath, MultipartFile multipartFile) throws Exception{
		File file = new File(realPath);
		if(!file.exists()) {
			file.mkdirs();
		}
		// a. 저장할 파일명 생성;
		//		- UUID 클래스 사용.(유니버셜 유니크 아이디);
		// 391dd00d-9142-4a19-a200-d192ab17e556 이런식으로 저장;
		String fileSystemName = UUID.randomUUID().toString();
		// 저장될 때 이름;
		String originalName = multipartFile.getOriginalFilename();
		originalName = originalName.substring(originalName.lastIndexOf("."));
		// 이상한 이름 + .확장자;
		fileSystemName = fileSystemName + originalName;
		// 저장;
		file = new File(realPath, fileSystemName);
		FileCopyUtils.copy(multipartFile.getBytes(), file);
		return fileSystemName;
	}
	// save 2, 3  버전이 있으나 1만 사용함;
	
	// 파일 삭제;
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
