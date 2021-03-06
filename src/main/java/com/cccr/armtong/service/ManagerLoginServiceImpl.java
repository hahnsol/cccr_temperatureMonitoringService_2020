package com.cccr.armtong.service;

import com.cccr.armtong.mapper.ManagerSQLMapper;
//import com.cccr.armtong.mapper.MemberSQLMapper;
import com.cccr.armtong.vo.ManagerBasicVo;
import com.cccr.armtong.vo.SessionUserDataVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ManagerLoginServiceImpl implements ManagerLoginService{
    
    @Autowired
    private ManagerSQLMapper managerMapper;

    // login logic
    @Override
    public SessionUserDataVo login(ManagerBasicVo vo){

      
        // 사용자가 입력한 id로 해당하는 manager's info  
        ManagerBasicVo managerVo = managerMapper.selectManagerInfoByManagerID(vo.getManager_id());

        // 사용자가 입력한 pw 
        // String password = vo.getManagerPw();

      

        if(managerVo != null && managerVo.getManager_pw().equals(vo.getManager_pw())){
            
            // 로그인 정보 세션에 저장
            SessionUserDataVo sessionUserDataVo = new SessionUserDataVo(managerVo.getManager_idx(), managerVo.getManager_name());

            return sessionUserDataVo;
        } else {
            return null;
        }

        

    }





}
