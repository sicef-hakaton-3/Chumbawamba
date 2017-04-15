package com.mbakovic.template.model;

import java.util.Comparator;
import java.util.Date;

/**
 * Created by hakaton on 11/5/16.
 */
public class News {
    private int id;
    private String title;
    private String summary;
    private Date date;
    private int category_id;
    private int count;

    public News(){}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

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

    public int getCount() { return count; }

    public void setCount(int count) { this.count = count; }
}
