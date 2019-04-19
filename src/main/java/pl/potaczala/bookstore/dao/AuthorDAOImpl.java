package pl.potaczala.bookstore.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import pl.potaczala.bookstore.entity.Author;
import pl.potaczala.bookstore.dao.AuthorDAO;
import pl.potaczala.bookstore.repository.AuthorRep;

@Component
public class AuthorDAOImpl implements AuthorDAO {
	
	@Autowired
	AuthorRep authorRep;
	
    //@PersistenceContext
    //private EntityManager em;
	
	@Override
	public List<Author> getAll() {
		return authorRep.findByOrderBySurnameAsc();	
	};
		
	@Override
	public Author getAuthorById(Long id) {
		return authorRep.findById(id).get();
	};
	
	@Override
	public Author add(Author author) throws Exception {
		return authorRep.save(author);
	};
		
	@Override
	public void delete(Long id) {
		authorRep.deleteById(id);		
	};
	
	@Override
	public void update(Author author) {
		authorRep.save(author);	
	};
	
	@Override
	public void saveOrUpdate(Author author) {
		authorRep.save(author);	
	};
}
