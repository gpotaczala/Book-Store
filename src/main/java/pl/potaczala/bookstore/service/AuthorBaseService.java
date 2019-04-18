package pl.potaczala.bookstore.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.potaczala.bookstore.entity.Author;
import pl.potaczala.bookstore.repository.AuthorRep;

@Service("authorService")
public class AuthorBaseService implements AuthorService {

	AuthorRep authorRep;
	
    //@PersistenceContext
    //private EntityManager em;

	@Autowired
	public void setAuthorRep(AuthorRep authorRep) {
		this.authorRep = authorRep;
	}

	@Override
	public void addOrUpdate(Author author) {
		authorRep.save(author);
//		if (findById(author.getId())==null) {
//			authorRep.save(author);
//		} else {
//			authorRep.update(author);
//		}
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
	
	@Override
	public boolean isAuthorNew(Author author) {		
		//long authorId = (long) em.getEntityManagerFactory().getPersistenceUnitUtil().getIdentifier(author);
		return (author.getId() == null);
	}

}
