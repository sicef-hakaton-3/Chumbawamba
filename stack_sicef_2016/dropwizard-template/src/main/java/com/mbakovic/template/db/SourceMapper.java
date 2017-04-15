package com.mbakovic.template.db;

import com.mbakovic.template.model.Source;
import org.skife.jdbi.v2.StatementContext;
import org.skife.jdbi.v2.tweak.ResultSetMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by DuX on 11/5/16.
 */
public final class SourceMapper implements ResultSetMapper<Source> {
    @Override
    public Source map(int i, ResultSet resultSet, StatementContext statementContext) throws SQLException {
        Source source = new Source();
        source.setId(resultSet.getInt("id"));
        source.setWebsite(resultSet.getString("website"));
        source.setName(resultSet.getString("name"));
        return source;
    }

}
