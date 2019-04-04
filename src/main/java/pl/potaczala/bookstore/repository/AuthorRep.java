package pl.potaczala.bookstore.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import pl.potaczala.bookstore.entity.Author;

@Repository
public interface AuthorRep extends JpaRepository<Author, Long>  {
	
	public List<Author> findByOrderBySurnameAsc();
}
