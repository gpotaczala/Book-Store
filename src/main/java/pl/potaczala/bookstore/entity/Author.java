package pl.potaczala.bookstore.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "author")
public class Author {
	@Id
	@Column(name = "ath_id", unique = true, nullable = false)
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@Column(name = "ath_surname")
	private String surname;

	@Column(name = "ath_name")
	private String name;

	private String surnameName;

	//@OneToMany(cascade = {CascadeType.PERSIST}, orphanRemoval = true, fetch = FetchType.EAGER, mappedBy = "author")
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "author")
	private List<Book> authorBooks = new ArrayList<Book>();

	public Long getId() {
		return id;
	}

	public List<Book> getAuthorBooks() {
		return authorBooks;
	}

	public void setAuthorBooks(List<Book> authorBooks) {
		this.authorBooks = authorBooks;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurnameName() {
		return surname + ' ' + name;
	}

	public boolean isNew() {
		return (this.id == null);
	}
	
	public boolean deleteBook(Book book) {
		boolean result;
		result = authorBooks.remove(book);
		return result;
	}
}
