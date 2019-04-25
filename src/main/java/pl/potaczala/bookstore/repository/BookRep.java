package pl.potaczala.bookstore.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import pl.potaczala.bookstore.entity.Book;

@Repository
public interface BookRep extends JpaRepository<Book, Long> {
	
	public List<Book> findByOrderByTitleAsc();
}
