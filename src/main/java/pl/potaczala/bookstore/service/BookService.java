package pl.potaczala.bookstore.service;

import java.util.List;

import pl.potaczala.bookstore.entity.Book;

public interface BookService {
	
	Book findById(Long id);
	
	List<Book> findAll();
	
	void saveOrUpdate(Book book);
	
	void delete(Long id);
	
	void deleteBookFromAuthorObj(Long id);
}
