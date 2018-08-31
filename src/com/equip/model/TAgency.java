package com.equip.model;

public class TAgency {
    private String tAgencyId;

    private String tLicense;

    private String tPermitNo;

    private String tAgencyName;

    public String gettAgencyId() {
        return tAgencyId;
    }

    public void settAgencyId(String tAgencyId) {
        this.tAgencyId = tAgencyId == null ? null : tAgencyId.trim();
    }

    public String gettLicense() {
        return tLicense;
    }

    public void settLicense(String tLicense) {
        this.tLicense = tLicense == null ? null : tLicense.trim();
    }

    public String gettPermitNo() {
        return tPermitNo;
    }

    public void settPermitNo(String tPermitNo) {
        this.tPermitNo = tPermitNo == null ? null : tPermitNo.trim();
    }

    public String gettAgencyName() {
        return tAgencyName;
    }

    public void settAgencyName(String tAgencyName) {
        this.tAgencyName = tAgencyName == null ? null : tAgencyName.trim();
    }
}