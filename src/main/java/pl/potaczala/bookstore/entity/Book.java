package pl.potaczala.bookstore.entity;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="book")
public class Book {
	@Id
	@Column(name = "bk_id", unique = true, nullable = false)
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(name = "bk_title")
	private String title;
	
	@ManyToOne
	@JoinColumn(name = "ath_id")	
	private Author author;

	@Column(name = "bk_number_of_pages")
	private Integer numberOfPages;
	
	@Column(name = "bk_release_date")	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date releaseDate;
	
	public Author getAuthor() {
		return author;
	}

	public void setAuthor(Author author) {
		this.author = author;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getNumberOfPages() {
		return numberOfPages;
	}

	public void setNumberOfPages(Integer numberOfPages) {
		this.numberOfPages = numberOfPages;
	}

	public Date getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}

	public boolean isNew() {		
		return (this.id == null);
	}		
	
	public boolean equals(Object obj) {
	boolean result;
    if (obj == null) return false;
	    if (obj == this) return true;
	    if (!(obj instanceof Book)) return false;
	    Book b = (Book) obj;
	    result = (b.getTitle().equalsIgnoreCase(this.getTitle()));
	    return result;
	}	
}
