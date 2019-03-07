package com.nousinfo.dao;

import com.nousinfo.bean.Visitor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
@Repository
@Transactional
public interface VisitorDao extends JpaRepository<Visitor, Integer> {


}
