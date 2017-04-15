package com.mbakovic.template.model;

/**
 * Created by hakaton on 11/5/16.
 */
public final class UserCategory {
    private int id;
    private int user_id;
    private int category_id;
    private float score;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public float getScore() { return score; }

    public void setScore(float score) {
        this.score = score;
    }
}
