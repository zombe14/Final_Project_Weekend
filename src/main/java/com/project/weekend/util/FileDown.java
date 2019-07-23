package com.project.weekend.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import com.project.weekend.file.FileVO;

public class FileDown extends AbstractView{

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		FileVO fileVO = (FileVO)model.get("file");
		String board = (String)model.get("board");
		String realPath = request.getSession().getServletContext().getRealPath("/resources/"+board);
		
		File file = new File(realPath, fileVO.getFname());
		
		// 한글처리;
		response.setCharacterEncoding("UTF-8");
		
		// 파일의 크기;
		response.setContentLength((int)file.length());
		
		// 다운시 파일 이름을 인코딩 처리
		String fileName = URLEncoder.encode(fileVO.getOname(), "UTF-8");
		
		// header 설정;
		response.setHeader("Content-Disposition", "attachment;filename=\""+fileName+"\"");
		response.setHeader("Content-Transfer-Encoding", "binary");
		
		FileInputStream fi = new FileInputStream(file);
		OutputStream os = response.getOutputStream();
		
		FileCopyUtils.copy(fi, os);
		
		os.close();
		fi.close();
	}
}
