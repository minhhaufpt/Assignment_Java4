package Entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import javax.persistence.NamedQuery;
import javax.persistence.NamedQueries;
import lombok.Data;

@NamedQueries({
		@NamedQuery(name = "Video.findByKeyword", query = "SELECT DISTINCT o.video FROM Favorite o WHERE o.video.title LIKE :keyword"),
		@NamedQuery(name = "Video.findByUser", query = "SELECT o.video FROM Favorite o WHERE o.user.username=:us"),
		@NamedQuery(name = "Video.findInRange", query = "SELECT DISTINCT o.video FROM Favorite o WHERE o.likeDate BETWEEN :min AND :max")
})
@NamedNativeQueries({
		@NamedNativeQuery(name = "Report.random10", query = "SELECT TOP 10 * FROM Video ORDER BY newid()", resultClass = Video.class) 
})
@Data
@Entity
@Table(name = "Video")
public class Video {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	Integer id;

	@Column(name = "Link")
	String link;

	@Column(name = "Tittle")
	String title;

	@Column(name = "Poster")
	String poster;

	@Column(name = "Description")
	String description;

	@Column(name = "Views")
	Integer views = 0;

	@Column(name = "Active")
	Boolean active = true;

	@OneToMany(mappedBy = "video", fetch = FetchType.EAGER) // kết nối 2 chiều với class Favorite
	List<Favorite> favorites;

}
