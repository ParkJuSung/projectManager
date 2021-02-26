package org.leedh.project.vo;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PjtVO {


	private int pjtSeq;
	private String pjtCd;
	private String pjtNm;
	private int	   orgSeq;
	private String preStrDay;
	private String preEndDay;
	private String relStrDay;
	private String relEndDay;
	private String pjtStatCd;
	private String regId;
	private String regDt;
	private String chgId;
	private String chgDt;

}