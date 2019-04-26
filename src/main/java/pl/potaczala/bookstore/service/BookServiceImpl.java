package pl.potaczala.bookstore.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.potaczala.bookstore.entity.Author;
import pl.potaczala.bookstore.entity.Book;
import pl.potaczala.bookstore.repository.BookRep;

@Service("bookService")
public class BookServiceImpl implements BookService {

	@Autowired
	BookRep bookRep;

	@Autowired
	AuthorService authorService;

	@Override
	public void saveOrUpdate(Book book) {
		// Druga walidacja w tym miejscu i zapis wybranych pól?
		bookRep.save(book);
	}

	@Override
	public void delete(Long id) {
		bookRep.deleteById(id);
	}

	@Override
	public Book findById(Long id) {
		return bookRep.findById(id).get();
	}

	@Override
	public List<Book> findAll() {
		return bookRep.findByOrderByTitleAsc();
	}

	@Override
	public void deleteBookFromAuthorObj(Long id) {
		Author author = authorService.findById(findById(id).getAuthor().getId());
		author.deleteBook(findById(id));
		try {
			authorService.saveOrUpdate(author);
		} catch (Exception e) {
			//
		}
	}
}
