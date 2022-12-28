package com.ipms.commons.vo;

import lombok.Data;

import java.util.Date;

@Data
public class Criteria {

    private int pageNum;
    private int amount;

    private String memCode;
    private String keyword;
    private String type;
    private String category;
    private Date searchDate;
    private String[] typeArr;

    private String projId; // issueboard - 박종환 추가
    
    public Criteria() {
        this(1, 8);
    }

    public Criteria(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = 8;
    }

    public String[] getTypeArr() {
        return type == null? new String[] {}: type.split("");
    }

}





