package com.equip.model;

public class TDevice {
    private String tEquipId;

    private String tAgencyId;

    private String tDicCode;

    private String tDeviceName;

    private String tDtype;

    private String tFactory;

    private String tDnumber;

    private String tBuyDate;

    private String tCheckDate;

    private String tSid;

    private String tCheckCircle;
    
    private String leftDay;
    
	public String getLeftDay() {
		return leftDay;
	}

	public void setLeftDay(String leftDay) {
		this.leftDay = leftDay;
	}

	public String gettEquipId() {
        return tEquipId;
    }

    public void settEquipId(String tEquipId) {
        this.tEquipId = tEquipId == null ? null : tEquipId.trim();
    }

    public String gettAgencyId() {
        return tAgencyId;
    }

    public void settAgencyId(String tAgencyId) {
        this.tAgencyId = tAgencyId == null ? null : tAgencyId.trim();
    }

    public String gettDicCode() {
        return tDicCode;
    }

    public void settDicCode(String tDicCode) {
        this.tDicCode = tDicCode == null ? null : tDicCode.trim();
    }

    public String gettDeviceName() {
        return tDeviceName;
    }

    public void settDeviceName(String tDeviceName) {
        this.tDeviceName = tDeviceName == null ? null : tDeviceName.trim();
    }

    public String gettDtype() {
        return tDtype;
    }

    public void settDtype(String tDtype) {
        this.tDtype = tDtype == null ? null : tDtype.trim();
    }

    public String gettFactory() {
        return tFactory;
    }

    public void settFactory(String tFactory) {
        this.tFactory = tFactory == null ? null : tFactory.trim();
    }

    public String gettDnumber() {
        return tDnumber;
    }

    public void settDnumber(String tDnumber) {
        this.tDnumber = tDnumber == null ? null : tDnumber.trim();
    }

    public String gettBuyDate() {
        return tBuyDate;
    }

    public void settBuyDate(String tBuyDate) {
        this.tBuyDate = tBuyDate == null ? null : tBuyDate.trim();
    }

    public String gettCheckDate() {
        return tCheckDate;
    }

    public void settCheckDate(String tCheckDate) {
        this.tCheckDate = tCheckDate == null ? null : tCheckDate.trim();
    }

    public String gettSid() {
        return tSid;
    }

    public void settSid(String tSid) {
        this.tSid = tSid == null ? null : tSid.trim();
    }

    public String gettCheckCircle() {
        return tCheckCircle;
    }

    public void settCheckCircle(String tCheckCircle) {
        this.tCheckCircle = tCheckCircle == null ? null : tCheckCircle.trim();
    }
}