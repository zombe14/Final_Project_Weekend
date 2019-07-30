package com.project.weekend.validator;

import java.util.regex.Pattern;


import javax.inject.Inject;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.project.weekend.member.MemberDAO;
import com.project.weekend.member.MemberDTO;


public class MemberValidate implements Validator{
	@Inject
	private MemberDAO memberDAO;

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return MemberDTO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		MemberDTO memberDTO = (MemberDTO)target;
		String id=memberDTO.getId();
		String pw=memberDTO.getPw();
		String pw2 = memberDTO.getPwCheck();
		String name = memberDTO.getName();
		String email = memberDTO.getEmail();
		String ex1 = "\\w{6,12}";
		String ex2 = "([a-z]+[A-Z]+){6,}";
		String ex3 = "[A-Z]+";
		boolean check=Pattern.matches(ex2, id);
		boolean check2=Pattern.matches(ex3, id);
		System.out.println(check);
		System.out.println(check2);
		
		
		if(id==null || id.length()==0) {
			errors.rejectValue("id", "member.id");
		}else {
			try {
				MemberDTO chekId = memberDAO.getId(memberDTO);
				if(chekId != null) {
					errors.rejectValue("id", "member.id.duplicate");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if(pw==null || pw.length()==0) {
			errors.rejectValue("pw2", "member.pw");
		}else {
			if(!pw.equals(pw2)) {
				errors.rejectValue("pw2", "member.pw.equal");
			}
		}
		
		if(name==null||name.length()==0) {
			errors.rejectValue("name", "member.name");
		}
		
		if(email==null||email.length()==0) {
			errors.rejectValue("email", "member.email");
		}
	}
}
