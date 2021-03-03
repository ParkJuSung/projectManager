package org.leedh.process.vo;


import lombok.Data;

@Data
public class ProcVO {
	private int pjtSeq;
	private String procCd;
	private String preStrDay;
	private String preEndDay;
	private String relStrDay;
	private String relEndDay;
	private String currYn;
	private String StatCd;
	private String reamark;
    private String regId;
    private String regDt;
    private String chgId;
    private String chgDt;
}
