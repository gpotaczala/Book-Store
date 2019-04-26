package pl.potaczala.bookstore.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.potaczala.bookstore.entity.Author;
import pl.potaczala.bookstore.repository.AuthorRep;

@Service("authorService")
public class AuthorServiceImpl implements AuthorService {

	@Autowired
	AuthorRep authorRep;

	@Override
	public void saveOrUpdate(Author author)  {
		//Druga walidacja w tym miejscu i zapis wybranych pól?
		authorRep.save(author);
	    //Test transakcyjnoœci....   sif (true) {throw new RuntimeException(); }
	}

	@Override
	public void delete(Long id) {
		authorRep.deleteById(id);
	}

	@Override
	public Author findById(Long id) {
		return authorRep.findById(id).get();
	}

	@Override
	public List<Author> findAll() {
		return authorRep.findByOrderBySurnameAsc();
	}
}
