package pl.potaczala.books.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import pl.potaczala.books.domain.Book;

@Repository
public interface BookRep extends JpaRepository<Book, Long> {
}
