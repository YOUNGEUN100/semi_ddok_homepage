package com.example.mini.model;

public class Sample {
	//---랜선마켓 게시판용 모델 시작---
	private int boardNo;
	private String userId;
	private String title;
	private String content;
	private int hits;
	private String boardKind;
	private String finishYn;
	private int category;
	private String cdatetime;
	private String udatetime;
	private String deleteYn;
	private String secretYn;
	private String answerYn;
	private String addr; //게시판용
	private String nick; //게시판용
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
	private String fundingPrice; // 세자리수 마다 ,찍기 위해서 String 으로 바꿈
	private int cnt;
	private String dDay;
	//---펀딩용 모델 끝---
	
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
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
	public String getFundingPrice() {
		return fundingPrice;
	}
	public void setFundingPrice(String fundingPrice) {
		this.fundingPrice = fundingPrice;
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
	//---펀딩용 게터세터 끝---
	
}
