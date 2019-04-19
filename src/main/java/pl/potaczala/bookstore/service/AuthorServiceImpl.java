package pl.potaczala.bookstore.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.potaczala.bookstore.entity.Author;
import pl.potaczala.bookstore.dao.AuthorDAO;

@Service("authorService")
public class AuthorServiceImpl implements AuthorService {

	@Autowired
	AuthorDAO authorDAO;

	@Override
	public void saveOrUpdate(Author author) {
		//Druga walidacja w tym miejscu i zapis wybranych pól?
		
		authorDAO.saveOrUpdate(author);
	}

	@Override
	public void delete(Long id) {
		authorDAO.delete(id);
	}

	@Override
	public Author findById(Long id) {
		return authorDAO.getAuthorById(id);
	}

	@Override
	public List<Author> findAll() {
		return authorDAO.getAll();
	}
}
