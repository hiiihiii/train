package com.train.modules.entity;

/**
 * Created by Tanli on 2017/4/13 0013.
 */
public class TextBook {

    private int BookId;

    private String BookName;

    private String Author;

    private String Version;

    private String Publisher;

    private String DatePub;

    private double Price;

    public int getBookId() {
        return BookId;
    }

    public void setBookId(int bookId) {
        BookId = bookId;
    }

    public String getBookName() {
        return BookName;
    }

    public void setBookName(String bookName) {
        BookName = bookName;
    }

    public String getAuthor() {
        return Author;
    }

    public void setAuthor(String author) {
        Author = author;
    }

    public String getVersion() {
        return Version;
    }

    public void setVersion(String version) {
        Version = version;
    }

    public String getPublisher() {
        return Publisher;
    }

    public void setPublisher(String publisher) {
        Publisher = publisher;
    }

    public String getDatePub() {
        return DatePub;
    }

    public void setDatePub(String datePub) {
        DatePub = datePub;
    }

    public double getPrice() {
        return Price;
    }

    public void setPrice(double price) {
        Price = price;
    }
}
