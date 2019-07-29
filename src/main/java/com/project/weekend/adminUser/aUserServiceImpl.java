package com.project.weekend.adminUser;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.weekend.file.MemberFileDAO;
import com.project.weekend.member.MemberDTO;
import com.project.weekend.util.FileSaver;
import com.project.weekend.util.PageMaker;

public class aUserServiceImpl {
	@Inject
	private MemberDTO memberDTO;
	@Inject
	private FileSaver fileSaver;
	@Inject
	private MemberFileDAO memberFileDAO;
	
	// list
	// select
	// update
	// delete
}
