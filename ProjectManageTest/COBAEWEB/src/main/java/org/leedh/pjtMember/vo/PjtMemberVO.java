package org.leedh.pjtMember.vo;

import lombok.Data;

@Data
public class PjtMemberVO {
	private int pjtSeq;
	private int empSeq;
	private String bizDivCd;
	private String preStrDay;
	private String preEndDay;
	private String preMm;
	private String relStrDay;
	private String relEndDay;
	private String skillCd;
	private String posCd;
	private String statCd;
    private String regId;
    private String regDt;
    private String chgId;
    private String chgDt;
}
