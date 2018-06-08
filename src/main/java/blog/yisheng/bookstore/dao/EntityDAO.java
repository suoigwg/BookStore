package blog.yisheng.bookstore.dao;

import blog.yisheng.bookstore.entity.BaseEntity;

public interface EntityDAO {


    void add(BaseEntity obj);

    void delete(BaseEntity obj);

    void update(BaseEntity obj);

    BaseEntity retrieve(String id) throws Exception;
}
