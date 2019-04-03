package pl.potaczala.books.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import pl.potaczala.books.entity.Author;

@Repository
public interface AuthorRep extends JpaRepository<Author, Long>  {
}
