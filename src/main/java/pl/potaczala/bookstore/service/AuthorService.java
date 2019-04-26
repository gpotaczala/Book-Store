package pl.potaczala.bookstore.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.dao.DataAccessException;

import pl.potaczala.bookstore.entity.Author;

@Transactional
public interface AuthorService {
	
	Author findById(Long id);
	
	List<Author> findAll();
	
	void saveOrUpdate(Author author) ;
	
	void delete(Long id);
}
