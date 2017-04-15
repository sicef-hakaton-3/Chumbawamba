package com.mbakovic.template.db;

import com.mbakovic.template.model.Category;
import org.skife.jdbi.v2.StatementContext;
import org.skife.jdbi.v2.tweak.ResultSetMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public final class CategoryMapper implements ResultSetMapper<Category> {
    @Override
    public Category map(int i, ResultSet resultSet, StatementContext statementContext) throws SQLException {
        Category category = new Category();
        category.setId(resultSet.getInt("id"));
        category.setName(resultSet.getString("name"));
        return category;
    }
}