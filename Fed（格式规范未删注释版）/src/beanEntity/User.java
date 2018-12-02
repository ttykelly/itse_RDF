package beanEntity;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable 
{

	private int id; // �û����
	private String username; // �û�����
	private String password; // �û�����
	private String email; // �û�����
	private String telephone; // �û���ϵ�绰
	private String activeCode; // ������
	private String role; // �û���ɫ
	private int state; // �û�״̬
	//private int state1; // �޸�����״̬
	private String registTime;// ע��ʱ��
	private String user_login_time;// ��¼ʱ��

	public String getRegistTime() 
	{
		return registTime;
	}
	
	public String getLoginTime() 
	{
		return user_login_time;
	}

	public void setRegistTime(String registTime) 
	{
		this.registTime = registTime;
	}
	
	public void setLoginTime(String loginTime) 
	{
		this.user_login_time = loginTime;
	}

	public int getState() 
	{
		return state;
	}

	public void setState(int state) 
	{
		this.state = state;
	}

	/*public int getState1() 
	{
		return state1;
	}

	public void setState1(int state1) 
	{
		this.state1 = state1;
	}*/
	
	public String getActiveCode() 
	{
		return activeCode;
	}

	public void setActiveCode(String activeCode) 
	{
		this.activeCode = activeCode;
	}

	public int getId() 
	{
		return id;
	}

	public void setId(int id) 
	{
		this.id = id;
	}

	public String getUsername() 
	{
		return username;
	}

	public void setUsername(String username) 
	{
		this.username = username;
	}

	public String getPassword() 
	{
		return password;
	}

	public void setPassword(String password) 
	{
		this.password = password;
	}

	public String getEmail() 
	{
		return email;
	}

	public void setEmail(String email) 
	{
		this.email = email;
	}

	public String getTelephone() 
	{
		return telephone;
	}

	public void setTelephone(String telephone) 
	{
		this.telephone = telephone;
	}

	public String getRole() 
	{
		return role;
	}

	public void setRole(String role) 
	{
		this.role = role;
	}

	public String toString() 
	{
		return "User [id=" + id + ", username=" + username + ", password="
				+ password + ", email=" + email+ ", telephone=" + telephone 
				+ ", role=" + role + "]";
	}

}

