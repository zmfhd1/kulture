package users;

import java.util.Date;

public class StudyInfoVO {
	String member_id;
	int study_id;
	String title;
	String study_memo1;
	String study_memo2;
	String study_date;
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getStudy_id() {
		return study_id;
	}
	public void setStudy_id(int study_id) {
		this.study_id = study_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStudy_memo1() {
		return study_memo1;
	}
	public void setStudy_memo1(String study_memo1) {
		this.study_memo1 = study_memo1;
	}
	public String getStudy_memo2() {
		return study_memo2;
	}
	public void setStudy_memo2(String study_memo2) {
		this.study_memo2 = study_memo2;
	}
	public String getStudy_date() {
		return study_date;
	}
	public void setStudy_date(String study_date) {
		this.study_date = study_date;
	}
	@Override
	public String toString() {
		return "StudyinfoVO [id="+ member_id +"<br>study_memo1=" + study_memo1 + "<br>study_memo1=" + study_memo2 + 
				"<br>study_date=" + study_date;
	}
	
	

}
