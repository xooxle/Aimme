package com.huqiao.smartadmin.sys.entity.propertyeditor;

import java.beans.PropertyEditorSupport;

import com.huqiao.smartadmin.sys.entity.User;
import com.huqiao.smartadmin.sys.service.IUserService;
/**
 * 用户编辑器
 * @author NOVOTS
 * @version Version 1.0
 */
public class UserEditor extends PropertyEditorSupport {
	private IUserService userService;

	public UserEditor(IUserService userService) {
		this.userService = userService;
	}

	public String getAsText() {
		User user = (User) getValue();
		if (user == null)
			return "";
		return String.valueOf(user.getUsername());
	}

	public void setAsText(String id) throws IllegalArgumentException {
		User user = new User();
		user = userService.getById(User.class, id);
		setValue(user);
	}
}