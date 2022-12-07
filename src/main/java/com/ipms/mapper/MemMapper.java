package com.ipms.mapper;

import com.ipms.main.vo.MemVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemMapper {
    public int registerCheck(String email);
    public int registerMember(MemVO memVO);
    public  int loginMem(MemVO memvo);
}