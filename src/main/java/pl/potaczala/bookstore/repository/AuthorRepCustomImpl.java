package pl.potaczala.bookstore.repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import pl.potaczala.bookstore.entity.Author;

public class AuthorRepCustomImpl implements AuthorRepCustom {
	@PersistenceContext
	private EntityManager em;

	@Override
	@Transactional
	public void refresh(Author author) {
		em.refresh(author);
	}
}
