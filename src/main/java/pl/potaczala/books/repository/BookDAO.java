package pl.potaczala.books.repository;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import pl.potaczala.books.domain.Book;

@Repository
public class BookDAO {
	List<Book> books = new ArrayList<Book>();
	
	public void addBook(Book book) {
		books.add(book);
	}
	
	public List<Book> getBooks() {
		return books;
	}
	
	public Book getBookById(Integer id) {
		if (id < books.size()) {
			return books.get(id);
		} else {
			return null;
		}
	}
}
