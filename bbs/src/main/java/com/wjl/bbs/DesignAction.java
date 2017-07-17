package com.wjl.bbs;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Controller
@Scope("prototype")
public class DesignAction extends ActionSupport{
	
	private File picture;
	private String pictureFileName;
	private String pictureContentType;
	
	public File getPicture() {
		return picture;
	}

	public void setPicture(File picture) {
		this.picture = picture;
	}

	public String getPictureFileName() {
		return pictureFileName;
	}

	public void setPictureFileName(String pictureFileName) {
		this.pictureFileName = pictureFileName;
	}

	public String getPictureContentType() {
		return pictureContentType;
	}

	public void setPictureContentType(String pictureContentType) {
		this.pictureContentType = pictureContentType;
	}

	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;
	
	public String addPicture() throws IOException{
		InputStream in=new FileInputStream(picture);
		String uploadPath=ServletActionContext.getRequest().getSession().getServletContext().getRealPath("/")+"upload";
		File file=new File(uploadPath,pictureFileName);
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
		map.put("content", "upload/"+pictureFileName);
		namedParameterJdbcTemplate.update("insert into resource(type,content) values(:type,:content)",map);
		Integer id=namedParameterJdbcTemplate.queryForObject("select last_insert_id()", map, Integer.class);
		
		List<Integer> resIdList=(List<Integer>)ActionContext.getContext().getSession().get("resIdList");
		if(resIdList==null) resIdList=new ArrayList<Integer>();
		resIdList.add(id);
		return "addPicture";
	}

}
