package pl.potaczala.bookstore.dao;

import java.util.List;

import pl.potaczala.bookstore.entity.Book;

public interface BookDAO {

	List<Book> getAll();

	Book getBookById(Long id);

	Book add(Book book) throws Exception;

	void delete(Long id);

	void update(Book author);

	void saveOrUpdate(Book author);
}
