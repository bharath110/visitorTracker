package com.nousinfo.service;

import com.nousinfo.bean.Visitor;

import java.util.List;

public interface VisitorService {

    Visitor saveVisitor(Visitor visitorDetails);
    Visitor deleteVisitor(Visitor visitorDetails);
    Visitor updateVisitor(Visitor visitorDetails);
    List<Visitor> getAllVisitor();
    Visitor getVisitor(int visitorId);
}
