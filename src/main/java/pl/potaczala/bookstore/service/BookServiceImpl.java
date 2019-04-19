package pl.potaczala.bookstore.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.potaczala.bookstore.dao.BookDAO;
import pl.potaczala.bookstore.entity.Book;

@Service("bookService")
public class BookServiceImpl implements BookService {

	@Autowired
	BookDAO bookDAO;

	@Override
	public void saveOrUpdate(Book book) {
		//Druga walidacja w tym miejscu i zapis wybranych pól?		
		bookDAO.saveOrUpdate(book);
	}

	@Override
	public void delete(Long id) {
		bookDAO.delete(id);
	}

	@Override
	public Book findById(Long id) {
		return bookDAO.getBookById(id);
	}

	@Override
	public List<Book> findAll() {
		return bookDAO.getAll();
	}
}
