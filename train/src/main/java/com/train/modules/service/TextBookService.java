package com.train.modules.service;

import com.train.modules.dao.TextBookDao;
import com.train.modules.entity.TextBook;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Tanli on 2017/5/8 0008.
 */
@Service
public class TextBookService {

    @Resource
    private TextBookDao textBookDao;

    /**
     * 增加教材
     * @param textBook
     * @return
     */
    public int insertBook(TextBook textBook)
    {
        return textBookDao.insertBook(textBook);
    }

    /**
     * 按照id删除教材
     * @param bookid
     * @return
     */
    public int deleteById(int bookid)
    {
        return textBookDao.deleteById(bookid);
    }

    /**
     * 按照编号修改教材信息
     * @param textBook
     * @return
     */
    public int updateBook(TextBook textBook)
    {
        return textBookDao.updateBook(textBook);
    }

    /**
     * 获取某一本教材
     * @param bookid
     * @return
     */
    public TextBook getByBookid(int bookid)
    {
        return textBookDao.getByBookid(bookid);
    }
}
