package com.project.weekend.board.festi.dates;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

@Service
public class DatesService {

	@Inject
	private DatesDAO datesDAO;
	
	public int setWrite(DatesDTO datesDTO, HttpSession session) throws Exception{
		int res = 0;
		res = datesDAO.setWrite(datesDTO);
		return res;
	}
	
	public int setSeatUpdate(DatesDTO datesDTO, HttpSession session) throws Exception{
		int res = 0;
		res= datesDAO.setSeatUpdate(datesDTO);
		return res;
	}
	
	public int setDelete(int dnum, HttpSession session) throws Exception{
		int res = 0;
		res = datesDAO.setDelete(dnum);
		return res;
	}
	
	public int setUpdate(DatesDTO datesDTO, HttpSession session) throws Exception{
		int res = 0;
		res = datesDAO.setUpdate(datesDTO);
		return res;
	}
	
	public DatesDTO getSelect(int dnum, HttpSession session) throws Exception{
		DatesDTO datesDTO = new DatesDTO();
		datesDTO = datesDAO.getSelect(dnum);
		return datesDTO;
	}
	
	public List<DatesDTO> getList(String num) throws Exception{
		List<DatesDTO> list = new ArrayList<DatesDTO>();
		list = datesDAO.getList(num);
		return list;
	}
	
	public List<DatesDTO> getOptions(DatesDTO datesDTO) throws Exception{
		List<DatesDTO> list = datesDAO.getOptions(datesDTO);
		return list;
	}
}
