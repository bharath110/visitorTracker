package com.nousinfo.serviceImp;


import com.nousinfo.bean.Item;
import com.nousinfo.dao.ItemDao;
import com.nousinfo.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ItemServiceImp implements ItemService {

    @Autowired
    ItemDao itemDao;

    @Override
    public Item saveItem(Item itemDetails) {
        System.out.println( " item :"+itemDetails);
        Item itemAdded = null;
        try{

            itemAdded =  itemDao.saveAndFlush(itemDetails);
            System.out.println(itemAdded);

            return itemAdded;

        }catch(Exception e){
            return  itemAdded;
        }

    }

}

