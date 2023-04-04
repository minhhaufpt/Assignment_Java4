package Entity;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

import lombok.Data;
@Data
@Entity
@Table(name = "Favorite", uniqueConstraints = { @UniqueConstraint(columnNames = { "VideoId", "UserId" }) })
public class Favorite {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	Long id;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "UserId")
	User user; // Kết nối khóa với Entity User
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "VideoId")
	Video video; // Kết nối khóa với Entity video
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "LikeDate")
	Date likeDate = new Date();
}
