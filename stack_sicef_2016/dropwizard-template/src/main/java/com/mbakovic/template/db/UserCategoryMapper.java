package com.mbakovic.template.db;

import com.mbakovic.template.model.UserCategory;
import org.skife.jdbi.v2.StatementContext;
import org.skife.jdbi.v2.tweak.ResultSetMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by DuX on 11/5/16.
 */
public class UserCategoryMapper implements ResultSetMapper<UserCategory> {
    @Override
    public UserCategory map(int i, ResultSet resultSet, StatementContext statementContext) throws SQLException {
        UserCategory userCategory = new UserCategory();
        userCategory.setId(resultSet.getInt("id"));
        userCategory.setCategory_id(resultSet.getInt("category_id"));
        userCategory.setUser_id(resultSet.getInt("user_id"));
        userCategory.setScore(resultSet.getFloat("score"));
        return userCategory;
    }
}
