package blog.yisheng.bookstore.dao;

import blog.yisheng.bookstore.entity.BaseEntity;


import java.util.ArrayList;

public interface EntityDAO {
    void add(BaseEntity obj);

    void delete(BaseEntity obj);

    void update(BaseEntity obj);

    ArrayList<BaseEntity> listEntities();

    BaseEntity retrieve(String id) throws Exception;
}
