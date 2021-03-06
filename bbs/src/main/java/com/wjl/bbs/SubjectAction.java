package com.wjl.bbs;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Controller
@Scope("prototype")
public class SubjectAction extends ActionSupport{
	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;
	
	public String allSubject(){
		List<Map<String,Object>> subjects=namedParameterJdbcTemplate.queryForList("SELECT sub_id,title,user_id,user_name,create_time FROM SUBJECT LEFT JOIN USER ON subject.create_by=user.user_id", new HashMap());
		ActionContext.getContext().put("subjects", subjects);
		return SUCCESS;
	}

	public String detail(){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("sub_id", ServletActionContext.getRequest().getParameter("sub_id"));
		Map<String,Object> subjectDetail=null;
		List<Map<String,Object>> resources=null;
		try {
			subjectDetail=namedParameterJdbcTemplate.queryForMap("SELECT s.sub_id,s.title,s.sub_content,s.create_time,s.create_by,u.user_name FROM SUBJECT s LEFT JOIN USER u ON s.create_by=u.user_id where sub_id=:sub_id", map);
			
			resources=namedParameterJdbcTemplate.queryForList("SELECT sr.sub_id,r.* FROM subject_resource sr LEFT JOIN resource r ON sr.res_id=r.res_id WHERE sr.sub_id=:sub_id ORDER BY r.res_id", map);
		} catch (DataAccessException e) {
		}
		if(subjectDetail!=null && subjectDetail.size()>0){
			List<Map<String,Object>> commentData=new ArrayList(namedParameterJdbcTemplate.queryForList("SELECT * FROM COMMENT WHERE sub_id=:sub_id ", map));
			List<Map<String,Object>> userData=new ArrayList(namedParameterJdbcTemplate.queryForList("select * from user", subjectDetail));
			ActionContext.getContext().put("comment_list_treeview", JSON.toJSONString(Comment.getTreeViewObjectList(Comment.getCommentTreeList(commentData, userData))));
			ActionContext.getContext().put("comment_list", Comment.getCommentTreeList(commentData, userData));
			ActionContext.getContext().put("subject", subjectDetail);
		}
		ActionContext.getContext().put("resources", resources);
		return "subject_detail";
	}
}