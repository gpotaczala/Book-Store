package pl.potaczala.bookstore.service;

import java.util.List;

import pl.potaczala.bookstore.entity.Author;

public interface AuthorService {
	
	Author findById(Long id);
	
	List<Author> findAll();
	
	void addOrUpdate(Author author);
	
	void delete(Long id);
	
	public boolean isAuthorNew(Author author);
}
