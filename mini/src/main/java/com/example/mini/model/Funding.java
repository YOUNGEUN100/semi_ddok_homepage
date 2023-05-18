package com.example.mini.model;

public class Funding {
	//---랜선마켓 게시판용 모델 시작---
	private int boardNo;
	private String userId;
	private String title;
	private String content;
	private int hits;
	private String boardKind;
	private String boardKind2;
	private String finishYn;
	private int category;
	private String cdatetime;
	private String udatetime;
	private String cdatetime2;
	private String udatetime2;
	private String deleteYn;
	private String secretYn;
	private String answerYn;
	private String addr; //게시판용
	private String nick; //게시판용
	private int commentNo;
	private int reCommentNo;
	private int commentReno;
	private String filePath;
	private String orlgName;
	private String saveName;
	private String fileSize;
	private String fileKind;
	//---랜선마켓 게시판 모델 끝---
	
	//---펀딩용 모델 시작---
	private int fundingNo;
	private String fundingName;
	private String fundingSummary;
	private String fundingScript;
	private String fundingStartDt;
	private String fundingEndDt;
	private String fundingCloseYn;
	private int fundingGoalCnt;
	private int fundingPrice; 
	private String fundingPrice2;// 세자리수 마다 ,찍기 위한 값
	private int cnt;
	private String dDay;
	private String dow;
	private String sDay;
	private String sTime;
	private String imgPath;
	private String imgPath2;
	private String imgPathDetail;
	private String imgPathDetail2;
	private String startDate;
	private String endTime;
	private int imgNo;
	private String imgOrgName;
	private String imgName;
	private int imgSize;
	private String thumbnailYn;
	private int fundingIndex;	
	
	//---펀딩용 모델 끝---
	
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getCommentReno() {
		return commentReno;
	}
	public void setCommentReno(int commentReno) {
		this.commentReno = commentReno;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public String getBoardKind() {
		return boardKind;
	}
	public void setBoardKind(String boardKind) {
		this.boardKind = boardKind;
	}
	public String getBoardKind2() {
		return boardKind2;
	}
	public void setBoardKind2(String boardKind2) {
		this.boardKind2 = boardKind2;
	}
	public String getFinishYn() {
		return finishYn;
	}
	public void setFinishYn(String finishYn) {
		this.finishYn = finishYn;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public String getCdatetime() {
		return cdatetime;
	}
	public void setCdatetime(String cdatetime) {
		this.cdatetime = cdatetime;
	}
	public String getUdatetime() {
		return udatetime;
	}
	public void setUdatetime(String udatetime) {
		this.udatetime = udatetime;
	}
	public String getCdatetime2() {
		return cdatetime2;
	}
	public void setCdatetime2(String cdatetime2) {
		this.cdatetime2 = cdatetime2;
	}
	public String getUdatetime2() {
		return udatetime2;
	}
	public void setUdatetime2(String udatetime2) {
		this.udatetime2 = udatetime2;
	}
	public String getDeleteYn() {
		return deleteYn;
	}
	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}
	public String getSecretYn() {
		return secretYn;
	}
	public void setSecretYn(String secretYn) {
		this.secretYn = secretYn;
	}
	public String getAnswerYn() {
		return answerYn;
	}
	public void setAnswerYn(String answerYn) {
		this.answerYn = answerYn;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getReCommentNo() {
		return reCommentNo;
	}
	public void setReCommentNo(int reCommentNo) {
		this.reCommentNo = reCommentNo;
	}
	//---펀딩용 게터세터 시작---
	public int getFundingNo() {
		return fundingNo;
	}
	public void setFundingNo(int fundingNo) {
		this.fundingNo = fundingNo;
	}
	public String getFundingName() {
		return fundingName;
	}
	public void setFundingName(String fundingName) {
		this.fundingName = fundingName;
	}
	public String getFundingSummary() {
		return fundingSummary;
	}
	public void setFundingSummary(String fundingSummary) {
		this.fundingSummary = fundingSummary;
	}
	public String getFundingScript() {
		return fundingScript;
	}
	public void setFundingScript(String fundingScript) {
		this.fundingScript = fundingScript;
	}
	public String getFundingStartDt() {
		return fundingStartDt;
	}
	public void setFundingStartDt(String fundingStartDt) {
		this.fundingStartDt = fundingStartDt;
	}
	public String getFundingEndDt() {
		return fundingEndDt;
	}
	public void setFundingEndDt(String fundingEndDt) {
		this.fundingEndDt = fundingEndDt;
	}
	public String getFundingCloseYn() {
		return fundingCloseYn;
	}
	public void setFundingCloseYn(String fundingCloseYn) {
		this.fundingCloseYn = fundingCloseYn;
	}
	public int getFundingGoalCnt() {
		return fundingGoalCnt;
	}
	public void setFundingGoalCnt(int fundingGoalCnt) {
		this.fundingGoalCnt = fundingGoalCnt;
	}
	
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getdDay() {
		return dDay;
	}
	public void setdDay(String dDay) {
		this.dDay = dDay;
	}
	public String getDow() {
		return dow;
	}
	public void setDow(String dow) {
		this.dow = dow;
	}
	public String getsDay() {
		return sDay;
	}
	public void setsDay(String sDay) {
		this.sDay = sDay;
	}
	public String getsTime() {
		return sTime;
	}
	public void setsTime(String sTime) {
		this.sTime = sTime;
	}
	public int getFundingPrice() {
		return fundingPrice;
	}
	public void setFundingPrice(int fundingPrice) {
		this.fundingPrice = fundingPrice;
	}
	public String getFundingPrice2() {
		return fundingPrice2;
	}
	public void setFundingPrice2(String fundingPrice2) {
		this.fundingPrice2 = fundingPrice2;
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	public String getImgPathDetail() {
		return imgPathDetail;
	}
	public void setImgPathDetail(String imgPathDetail) {
		this.imgPathDetail = imgPathDetail;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	//---펀딩용 게터세터 끝---
	public int getImgNo() {
		return imgNo;
	}
	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}
	public String getImgOrgName() {
		return imgOrgName;
	}
	public void setImgOrgName(String imgOrgName) {
		this.imgOrgName = imgOrgName;
	}
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	public int getImgSize() {
		return imgSize;
	}
	public void setImgSize(int imgSize) {
		this.imgSize = imgSize;
	}
	public String getThumbnailYn() {
		return thumbnailYn;
	}
	public void setThumbnailYn(String thumbnailYn) {
		this.thumbnailYn = thumbnailYn;
	}
	public int getFundingIndex() {
		return fundingIndex;
	}
	public void setFundingIndex(int fundingIndex) {
		this.fundingIndex = fundingIndex;
	}
	public String getImgPath2() {
		return imgPath2;
	}
	public void setImgPath2(String imgPath2) {
		this.imgPath2 = imgPath2;
	}
	public String getImgPathDetail2() {
		return imgPathDetail2;
	}
	public void setImgPathDetail2(String imgPathDetail2) {
		this.imgPathDetail2 = imgPathDetail2;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getOrlgName() {
		return orlgName;
	}
	public void setOrlgName(String orlgName) {
		this.orlgName = orlgName;
	}
	public String getSaveName() {
		return saveName;
	}
	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}
	public String getFileSize() {
		return fileSize;
	}
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	public String getFileKind() {
		return fileKind;
	}
	public void setFileKind(String fileKind) {
		this.fileKind = fileKind;
	}
	
	
	
	
	

	
	
	
}
