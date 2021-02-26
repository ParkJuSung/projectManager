package org.leedh.organization.service;

import java.util.List;

import org.leedh.organization.vo.OrgVO;

public interface OrgService {
	List<OrgVO> orgShow() throws Exception;
}
