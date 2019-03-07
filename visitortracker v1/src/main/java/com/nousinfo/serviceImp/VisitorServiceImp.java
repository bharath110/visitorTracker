package com.nousinfo.serviceImp;

import com.nousinfo.bean.Visitor;
import com.nousinfo.dao.VisitorDao;
import com.nousinfo.service.VisitorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;


@Service
public class VisitorServiceImp implements VisitorService{

    @Autowired
    VisitorDao visitorDao;

    @Override
    public Visitor saveVisitor(Visitor visitorDetails) {
        System.out.println( " Visitor :"+visitorDetails);
        Visitor saveVisitor =null;
        try{
            saveVisitor = visitorDao.save(visitorDetails);
            System.out.println("in Imp:"+saveVisitor);

            return saveVisitor;

        }catch(Exception e){
            return saveVisitor;
        }

    }
    @Override
    public Visitor deleteVisitor(Visitor visitorDetails) {
        Visitor deleteVisitor =null;
        try{
            deleteVisitor = visitorDao.save(visitorDetails);
            System.out.println("in Imp:"+deleteVisitor);

            return deleteVisitor;

        }catch(Exception e){
            return deleteVisitor;
        }

    }
    @Override
    public Visitor updateVisitor(Visitor visitorDetails) {
        System.out.println( " Visitor :"+visitorDetails);
        Visitor saveVisitor =null;
        try{
            saveVisitor = visitorDao.save(visitorDetails);
            System.out.println("in Imp:"+saveVisitor);

            return saveVisitor;

        }catch(Exception e){
            return saveVisitor;
        }

    }
    @Override
    public List<Visitor> getAllVisitor() {
    	try{
            return visitorDao.findAll();

        }catch(Exception e){
            return visitorDao.findAll();
        }

    }
    @Override
    public Visitor getVisitor(int visitorId) {
        System.out.println( " Visitor Id :"+visitorId);
        Visitor saveVisitor = null;
        try{
        	saveVisitor = visitorDao.getOne(visitorId);
            System.out.println("in Imp:"+saveVisitor);

            return saveVisitor;

        }catch(Exception e){
            return saveVisitor;
        }

    }

}
