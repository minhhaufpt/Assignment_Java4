package Entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedStoredProcedureQueries;
import javax.persistence.NamedStoredProcedureQuery;
import javax.persistence.ParameterMode;
import javax.persistence.StoredProcedureParameter;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NamedStoredProcedureQueries({
		@NamedStoredProcedureQuery(name = "Report.favoriteByYear", procedureName = "spFavoriteByYear", resultClasses = { Report.class }, parameters = {
				@StoredProcedureParameter(mode = ParameterMode.IN,name = "year", type = Integer.class) } ) 
})
@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Report {
	@Id
	String group;
	Long likes;
	@Temporal(TemporalType.TIMESTAMP)
	Date newest;
	@Temporal(TemporalType.TIMESTAMP)
	Date oldest;
}
