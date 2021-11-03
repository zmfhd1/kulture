package contents;

import java.util.List; 
import org.springframework.stereotype.Component;


@Component
public class ContentsVO {
	int content_id;
	String content_title;
	String content_quotes;
	String content_quotes_ko;
	String content_name;
	String content_description;
	String content_description_ko;
	String content_characters;
	String content_slang;
	String content_slang_desc;
	String content_slang_desc_ko;
	List<ContentsVO> titlelist;
	List<ContentsVO> contentlist;
	String content_url;
	String content_quotesurl;
	String content_link;
	String content_link_desc;
	
	public int getContent_id() {
		return content_id;
	}
	public void setContent_id(int content_id) {
		this.content_id = content_id;
	}
	public String getContent_title() {
		return content_title;
	}
	public void setContent_title(String content_title) {
		this.content_title = content_title;
	}
	public String getContent_quotes() {
		return content_quotes;
	}
	public void setContent_quotes(String content_quotes) {
		this.content_quotes = content_quotes;
	}
	public String getContent_quotes_ko() {
		return content_quotes_ko;
	}
	public void setContent_quotes_ko(String content_quotes_ko) {
		this.content_quotes_ko = content_quotes_ko;
	}
	public String getContent_name() {
		return content_name;
	}
	public void setContent_name(String content_name) {
		this.content_name = content_name;
	}
	public String getContent_description() {
		return content_description;
	}
	public void setContent_description(String content_description) {
		this.content_description = content_description;
	}
	public String getContent_description_ko() {
		return content_description_ko;
	}
	public void setContent_description_ko(String content_description_ko) {
		this.content_description_ko = content_description_ko;
	}
	public String getContent_characters() {
		return content_characters;
	}
	public void setContent_characters(String content_characters) {
		this.content_characters = content_characters;
	}
	public String getContent_slang() {
		return content_slang;
	}
	public void setContent_slang(String content_slang) {
		this.content_slang = content_slang;
	}
	public String getContent_slang_desc() {
		return content_slang_desc;
	}
	public void setContent_slang_desc(String content_slang_desc) {
		this.content_slang_desc = content_slang_desc;
	}
	public String getContent_slang_desc_ko() {
		return content_slang_desc_ko;
	}
	public void setContent_slang_desc_ko(String content_slang_desc_ko) {
		this.content_slang_desc_ko = content_slang_desc_ko;
	}
	public List<ContentsVO> getTitlelist() {
		return titlelist;
	}
	public void setTitlelist(List<ContentsVO> titlelist) {
		this.titlelist = titlelist;
	}
	public List<ContentsVO> getContentlist() {
		return contentlist;
	}
	public void setContentlist(List<ContentsVO> contentlist) {
		this.contentlist = contentlist;
	}
	public String getContent_url() {
		return content_url;
	}
	public void setContent_url(String content_url) {
		this.content_url = content_url;
	}
	public String getContent_quotesurl() {
		return content_quotesurl;
	}
	public void setContent_quotesurl(String content_quotesurl) {
		this.content_quotesurl = content_quotesurl;
	}
	public String getContent_link() {
		return content_link;
	}
	public void setContent_link(String content_link) {
		this.content_link = content_link;
	}
	public String getContent_link_desc() {
		return content_link_desc;
	}
	public void setContent_link_desc(String content_link_desc) {
		this.content_link_desc = content_link_desc;
	}
	
		
	}
	
	


