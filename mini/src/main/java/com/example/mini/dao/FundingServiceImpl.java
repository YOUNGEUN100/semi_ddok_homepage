package com.example.mini.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mini.mapper.FundingMapper;
import com.example.mini.model.Funding;

@Service
public class FundingServiceImpl implements FundingService {

	@Autowired // Mapper와 연결
	private FundingMapper fundingMapper;

	@Override // 랜선장터 거래 리스트
	public HashMap<String, Object> searchTradeFleaList(HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("cnt", fundingMapper.fleaPagingCnt(map));
		resultMap.put("list",fundingMapper.selectTradeFleaList(map));
		return resultMap;
	}
	
	@Override // 랜선장터 나눔 리스트
	public HashMap<String, Object> searchDonateFleaList(HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("cnt2", fundingMapper.fleaPagingCnt2(map));
		resultMap.put("list",fundingMapper.selectDonateFleaList(map));
		return resultMap;
	}
	
	@Override // 랜선장터 글보기
	public HashMap<String, Object> searchFleaInfo(HashMap<String, Object>map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Funding info  = fundingMapper.selectFleaInfo(map);
		int commentCnt = fundingMapper.commentCnt(map);
		if (info != null) {
			fundingMapper.updateCnt(map);
		}
		
		resultMap.put("info", info);
		resultMap.put("commentCnt", commentCnt);
		return resultMap;
	}
	
	@Override // 랜선장터 이미지
	public List<Funding> searchFleaImg(HashMap<String, Object> map) {
		List<Funding> imgList = fundingMapper.selectFleaImg(map);
		return imgList;
	}
	
	@Override // 랜선장터 게시글 등록
	public void addFlea(HashMap<String, Object> map) {
		fundingMapper.insertFlea(map);
	}
	
	@Override // 랜선장터 댓글 리스트
	public List<Funding> searchFleaComment(HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Funding> list = fundingMapper.selectFleaComment(map);
		
		return list;
	}
	
	@Override // 랜선장터 댓글 입력
	public void addFleaComment(HashMap<String, Object> map) {
		fundingMapper.insertFleaComment(map);		
	}
	
	@Override // 댓글 입력시 reno업데이트
	public void editReno(HashMap<String, Object> map) {
		fundingMapper.updateReno(map);		
	}
	
	@Override // 랜선장터 대댓글 입력
	public void addFleaReComment(HashMap<String, Object> map) {
		fundingMapper.insertFleaReComment(map);		
	}
	
	@Override // 랜선장터 대댓글 삭제
	public void removeReComment(HashMap<String, Object> map) {
		fundingMapper.deleteReComment(map);	
	}
	
	@Override // 랜선장터 댓글 삭제
	public void removeComment(HashMap<String, Object> map) {
		fundingMapper.deleteComment(map);
		
	}
	
	@Override // 랜선장터 댓글 수정
	public void modifyComment(HashMap<String, Object> map) {
		fundingMapper.editComment(map);
		
	}
	
	@Override // 랜선장터 거래완료
	public void endTrade(HashMap<String, Object> map) {
		fundingMapper.finishTrade(map);		
	}
	
	@Override // 랜선장터 게시글 삭제
	public void removeFlea(HashMap<String, Object> map) {
		fundingMapper.deleteFlea(map);
		
	}
	
	@Override // 랜선장터 게시글 수정
	public void modifyFlea(HashMap<String, Object> map) {
		fundingMapper.editFlea(map);
		
	}

	@Override // 오픈중 펀딩 리스트
	public List<Funding> searchOpenFundingList(HashMap<String, Object> map) throws Exception {
		List<Funding> list = fundingMapper.selectOpenFundingList(map);
		fundingMapper.checkFundingDate(map);
		fundingMapper.checkFundingDate2(map);
		return list;
	}

	@Override // 준비중 펀딩 리스트
	public List<Funding> searchPlannedFundingList(HashMap<String, Object> map) throws Exception {
		List<Funding> list = fundingMapper.selectPlannedFundingList(map);
		return list;
	}

	@Override // 오픈중 펀딩 상세
	public Funding searchOpenFundingInfo(HashMap<String, Object> map) {
		Funding info = fundingMapper.selectOpenFundingInfo(map);
		return info;
	}

	@Override // 준비중 펀딩 상세
	public Funding searchPlannedFundingInfo(HashMap<String, Object> map) {
		Funding info = fundingMapper.selectPlannedFundingInfo(map);
		return info;
	}
	
	@Override // 펀딩 상세 이미지
	public List<Funding> fundingImgDetail2(HashMap<String, Object> map) {
		List<Funding> info = fundingMapper.fundingImgDetail(map);
		return info;
	}

	@Override // 펀딩 신청
	public HashMap<String, Object> insertFunding(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int cnt = fundingMapper.checkFundingMember(map);

		if (cnt > 0) {
			resultMap.put("result", "fail");
			resultMap.put("message", "이미 신청한 펀딩입니다.");

		} else {			
			fundingMapper.applyFunding(map);			
			resultMap.put("result", "success");
			resultMap.put("message", "펀딩이 신청되었습니다.");

		}
		return resultMap;
	}

	@Override // 중복신청 필터링용 카운트 잘 넘어가는지 확인용
	public int checkFundingMember2(HashMap<String, Object> map) {
		int cnt = fundingMapper.checkFundingMember(map);
		return cnt;
	}

	@Override // 펀딩 등록
	public void addFunding(HashMap<String, Object> map) {
		fundingMapper.insertFunding(map);		
	}
	
	@Override // 펀딩 수정
	public void modifyFunding(HashMap<String, Object> map) {
		fundingMapper.editFunding(map);		
	}
	
	@Override // 펀딩 삭제
	public void removeFunding(HashMap<String, Object> map) {
		fundingMapper.deletefunding(map);
		
	}
	
	@Override // 펀딩 이미지 리스트
	public List<Funding> searchFundingImg(HashMap<String, Object> map) {
		List<Funding> imgList = fundingMapper.selectFundingImg(map);
		return imgList;
	}
	
	@Override // 펀딩 썸네일 이미지 등록
	public void addFundingImg(HashMap<String, Object> map) {
		fundingMapper.insertFundingImg(map);
	}
	
	@Override // 펀딩 상세 이미지 등록
	public void addFundingImg2(HashMap<String, Object> map) {
		fundingMapper.insertFundingImg2(map);
	}
	
	@Override // 펀딩 이미지 삭제
	public void removeFundingImg(HashMap<String, Object> map) {
		fundingMapper.deleteFundingImg(map);
	}

	@Override// 랜선마켓 첨부파일 등록
	public void addFleaFile(HashMap<String, Object> map) {
		fundingMapper.insertFleaFile(map);
		
	}



	

	

	

}
