package study;

import org.springframework.stereotype.Component;

@Component
public class StudyInfoVO {
	
	String member_id;
	int num;
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

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
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
		return ("member_id = " + member_id + 
				", num = " + num + 
				", title = " + title + 
				", study_memo1 = " + study_memo1 + 
				", study_memo2 = " + study_memo2 +
				", study_date = " + study_date) ;
	}
	
}
