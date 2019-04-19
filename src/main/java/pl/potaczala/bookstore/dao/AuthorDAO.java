package pl.potaczala.bookstore.dao;

import java.util.List;

import pl.potaczala.bookstore.entity.Author;

public interface AuthorDAO {
		List<Author> getAll();
		Author getAuthorById(Long id);
		Author add(Author author) throws Exception;
		void delete(Long id);
		void update(Author author);
		void saveOrUpdate(Author author);
}
