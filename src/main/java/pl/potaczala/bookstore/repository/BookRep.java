package pl.potaczala.bookstore.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import pl.potaczala.bookstore.entity.Book;

@Repository
public interface BookRep extends JpaRepository<Book, Long> {
}
