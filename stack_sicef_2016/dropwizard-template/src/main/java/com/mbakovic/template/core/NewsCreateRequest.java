package com.mbakovic.template.core;

import java.util.Date;

/**
 * Created by hakaton on 11/5/16.
 */
public class NewsCreateRequest {
    private String title;
    private String summary;
    private Date date;
    private int category_id;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }
}
