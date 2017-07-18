package com.wjl.bbs;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Controller
@Scope("prototype")
public class DesignAction extends ActionSupport{
	
	private File myfile;
	private String myfileFileName;
	private String myfileContentType;

	public File getMyfile() {
		return myfile;
	}

	public void setMyfile(File myfile) {
		this.myfile = myfile;
	}

	public String getMyfileFileName() {
		return myfileFileName;
	}

	public void setMyfileFileName(String myfileFileName) {
		this.myfileFileName = myfileFileName;
	}

	public String getMyfileContentType() {
		return myfileContentType;
	}

	public void setMyfileContentType(String myfileContentType) {
		this.myfileContentType = myfileContentType;
	}

	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;
	
	public String addText(){
		String text=ServletActionContext.getRequest().getParameter("text");
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("type", "T");
		map.put("content", text);
		
		KeyHolder keyHolder=new GeneratedKeyHolder();
		namedParameterJdbcTemplate.update("insert into resource(type,content) values(:type,:content)",new MapSqlParameterSource(map) , keyHolder);
		Integer id=new Integer(keyHolder.getKey().intValue());
		List<Integer> resIdList=(List<Integer>)ActionContext.getContext().getSession().get("resIdList");
		if(resIdList==null) resIdList=new ArrayList<Integer>();
		resIdList.add(id);
		ActionContext.getContext().getSession().put("resIdList", resIdList);
		return "addText";
	}
	
	public String addPicture() throws IOException{
		InputStream in=new FileInputStream(myfile);
		String uploadPath=ServletActionContext.getRequest().getSession().getServletContext().getRealPath("/")+"upload";
		File file=new File(uploadPath,myfileFileName);
		File parentDir=file.getParentFile();
		if(!parentDir.exists()) parentDir.mkdirs();
		OutputStream out= new FileOutputStream(file);
		byte[] bytes=new byte[1024];
		int length=0;
		while((length=in.read(bytes))!=-1){
			out.write(bytes, 0, length);
		}
		in.close();
		out.close();
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("type", "P");
		map.put("content", "upload/"+myfileFileName);
		KeyHolder keyHolder=new GeneratedKeyHolder();
		namedParameterJdbcTemplate.update("insert into resource(type,content) values(:type,:content)",new MapSqlParameterSource(map),keyHolder);
		Integer id=new Integer(keyHolder.getKey().intValue());
		
		List<Integer> resIdList=(List<Integer>)ActionContext.getContext().getSession().get("resIdList");
		if(resIdList==null) resIdList=new ArrayList<Integer>();
		resIdList.add(id);
		ActionContext.getContext().getSession().put("resIdList", resIdList);
		return "addPicture";
	}

	public String addVideo() throws IOException{
		InputStream in=new FileInputStream(myfile);
		String uploadPath=ServletActionContext.getRequest().getSession().getServletContext().getRealPath("/")+"upload";
		File file=new File(uploadPath,myfileFileName);
		File parentDir=file.getParentFile();
		if(!parentDir.exists()) parentDir.mkdirs();
		OutputStream out= new FileOutputStream(file);
		byte[] bytes=new byte[1024];
		int length=0;
		while((length=in.read(bytes))!=-1){
			out.write(bytes, 0, length);
		}
		in.close();
		out.close();
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("type", "V");
		map.put("content", "upload/"+myfileFileName);
		KeyHolder keyHolder=new GeneratedKeyHolder();
		namedParameterJdbcTemplate.update("insert into resource(type,content) values(:type,:content)",new MapSqlParameterSource(map),keyHolder);
		Integer id=new Integer(keyHolder.getKey().intValue());
		
		List<Integer> resIdList=(List<Integer>)ActionContext.getContext().getSession().get("resIdList");
		if(resIdList==null) resIdList=new ArrayList<Integer>();
		resIdList.add(id);
		ActionContext.getContext().getSession().put("resIdList", resIdList);
		return "addVideo";
	}
	
	public String publish() throws UnsupportedEncodingException{
		String title=ServletActionContext.getRequest().getParameter("title");
		title=new String(title.getBytes("iso-8859-1"),"utf-8");
		List<Integer> resIdList=(List<Integer>)ActionContext.getContext().getSession().get("resIdList");
		Map<String,Object> user=(Map<String,Object>)ActionContext.getContext().getSession().get("user");
		if(title!=null && resIdList!=null){
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("title", title);
			map.put("create_by", user.get("user_id"));
			namedParameterJdbcTemplate.update("insert into subject(title,create_time,create_by) values(:title,CURRENT_TIMESTAMP,:create_by)", map);
			Integer sub_id=namedParameterJdbcTemplate.queryForObject("select last_insert_id()", map, Integer.class);
			map.put("sub_id", sub_id);
			for(int i=0;i<resIdList.size();i++){
				map.put("res_id", resIdList.get(i));
				namedParameterJdbcTemplate.update("insert subject_resource(sub_id,res_id) values(:sub_id, :res_id)",map);
			}
		}
		return "publish";
	}
	
}
