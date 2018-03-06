package com.train.modules.dao;

import com.train.modules.entity.TextBook;
import org.springframework.stereotype.Repository;

/**
 * Created by Tanli on 2017/5/8 0008.
 */
@Repository
public interface TextBookDao {

    /**
     * 增加教材
     * @param textBook
     * @return
     */
    public int insertBook(TextBook textBook);

    /**
     * 按照id删除教材
     * @param bookid
     * @return
     */
    public int deleteById(int bookid);

    /**
     * 按照编号修改教材信息
     * @param textBook
     * @return
     */
    public int updateBook(TextBook textBook);

    /**
     * 获取某一本教材
     * @param bookid
     * @return
     */
    public TextBook getByBookid(int bookid);
}
