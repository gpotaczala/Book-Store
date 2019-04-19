package pl.potaczala.bookstore.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import pl.potaczala.bookstore.entity.Book;
import pl.potaczala.bookstore.repository.BookRep;

@Component
public class BookDAOImpl implements BookDAO {
	
	@Autowired
	BookRep bookRep;
	
	@Override
	public List<Book> getAll() {
		return bookRep.findByOrderByTitleAsc();	
	};
		
	@Override
	public Book getBookById(Long id) {
		return bookRep.findById(id).get();
	};
	
	@Override
	public Book add(Book book) throws Exception {
		return bookRep.save(book);
	};
		
	@Override
	public void delete(Long id) {
		bookRep.deleteById(id);		
	};
	
	@Override
	public void update(Book book) {
		bookRep.save(book);	
	};
	
	@Override
	public void saveOrUpdate(Book book) {
		bookRep.save(book);	
	};
}
