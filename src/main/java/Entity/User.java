package Entity;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Data;
/**
 * @author haung
 *
 */
@Data
@Entity
@Table(name = "Users")
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id") // nếu tham số giống trong column trong database ko cần thêm
	Integer id;
	
	@Column(name = "Username")
	String username;
	
	@Column(name = "Passwords")
	String passwords;
	
	@Column(name = "Fullname")
	String fullname;
	
	@Column(name = "Email")
	String email;
	
	@Column(name = "isAdmin")
	Boolean admin = false;

	@OneToMany(mappedBy = "user",fetch = FetchType.EAGER)  // 
	List<Favorite> favorites;

}
