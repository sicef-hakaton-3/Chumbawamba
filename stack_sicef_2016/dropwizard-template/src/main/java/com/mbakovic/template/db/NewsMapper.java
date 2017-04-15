package com.mbakovic.template.db;

import com.mbakovic.template.model.News;
import org.skife.jdbi.v2.StatementContext;
import org.skife.jdbi.v2.tweak.ResultSetMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public final class NewsMapper implements ResultSetMapper<News> {
    @Override
    public News map(int i, ResultSet resultSet, StatementContext statementContext) throws SQLException {
        News news = new News();
        news.setId(resultSet.getInt("id"));
        news.setTitle(resultSet.getString("title"));
        news.setSummary(resultSet.getString("summary"));
        news.setDate(resultSet.getDate("date"));
        news.setCategory_id(resultSet.getInt("category_id"));
        news.setCount(resultSet.getInt("count"));
        return news;
    }
}