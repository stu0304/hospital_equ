package com.equip.model;

public class VOUserPerson {
    private String tUserId;

    private String tUserName;

    private String tUserPwd;

    private String tRole;

    private String tStatus;
    
    private String tDicId;

    private String tGender;

    private String tMobile;

    private String tEmail;

    private String tCname;
    
    private String tRoleDicID;

    public String gettRoleDicID() {
		return tRoleDicID;
	}

	public void settRoleDicID(String tRoleDicID) {
		this.tRoleDicID = tRoleDicID;
	}

	public String gettUserId() {
        return tUserId;
    }

    public void settUserId(String tUserId) {
        this.tUserId = tUserId == null ? null : tUserId.trim();
    }

    public String gettUserName() {
        return tUserName;
    }

    public void settUserName(String tUserName) {
        this.tUserName = tUserName == null ? null : tUserName.trim();
    }

    public String gettUserPwd() {
        return tUserPwd;
    }

    public void settUserPwd(String tUserPwd) {
        this.tUserPwd = tUserPwd == null ? null : tUserPwd.trim();
    }

    public String gettRole() {
        return tRole;
    }

    public void settRole(String tRole) {
        this.tRole = tRole == null ? null : tRole.trim();
    }

    public String gettStatus() {
        return tStatus;
    }

    public void settStatus(String tStatus) {
        this.tStatus = tStatus == null ? null : tStatus.trim();
    }

	public String gettDicId() {
		return tDicId;
	}

	public void settDicId(String tDicId) {
		this.tDicId = tDicId;
	}

	public String gettGender() {
		return tGender;
	}

	public void settGender(String tGender) {
		this.tGender = tGender;
	}

	public String gettMobile() {
		return tMobile;
	}

	public void settMobile(String tMobile) {
		this.tMobile = tMobile;
	}

	public String gettEmail() {
		return tEmail;
	}

	public void settEmail(String tEmail) {
		this.tEmail = tEmail;
	}

	public String gettCname() {
		return tCname;
	}

	public void settCname(String tCname) {
		this.tCname = tCname;
	}
    
    
}