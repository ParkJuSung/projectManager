package org.leedh.organization.vo;

import lombok.Data;

@Data
public class OrgVO {
	private int orgSeq;
	private String orgCd;
	private String orgNm;
	private String orgDivCd;
	private String bizNo;
	private String ceoNm;
	private String orgTellNo;
	private String orgFaxNo;
	private String orgZip;
	private String orgAddr1;
	private String orgAddr2;
	private String orgSailNm;
	private String orgSailPhone;
    private String regId;
    private String regDt;
    private String chgId;
    private String chgDt;
}
