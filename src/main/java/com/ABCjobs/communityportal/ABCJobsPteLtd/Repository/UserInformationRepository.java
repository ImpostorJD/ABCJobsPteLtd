package com.ABCjobs.communityportal.ABCJobsPteLtd.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ABCjobs.communityportal.ABCJobsPteLtd.DTO.UserInformation;

/**
 * UserInformationRepository --- Data Access Object that interacts with the user information table from the database
 * @author John Daniel Tejero
 */
public interface UserInformationRepository extends JpaRepository<UserInformation, Integer>{

	/**
	 * Selects user information by means of using user_id as its selector
	 * @param id int type parameter that specify records to collect inside the user_information table
	 */
	@Query("select u from UserInformation u where u.userID = :id")
	public UserInformation userProfile(@Param("id") int id);
	
	/**
	 * Custom query for updation of user_information
	 * @param int userID specifies which record to be updated
	 * @param string contact a new data to be inserted inside the record
	 * @param string job a new data which will overwrite current existing job data
	 * @param string dname a new data which will overwrite current existing display name data
	 * @param string address a new data which will overwrite current existing address data
	 * @param string country a new data which will overwrite current existing country data
	 * @param string city a new data which will overwrite current existing city data
	 * @param string nationality a new data which will overwrite current existing nationality data
	 * @param string bio a new data which will overwrite current existing bio data
	 * @param string company a new data which will overwrite current company data
	 * @Modifying annotation specifies that the query will update the record
	 * 
	 */
	@Modifying
	@Query("update UserInformation u set u.contactNumber = :contact, u.jobPosition = :job, u.displayName = :dname, u.address = :address, "
			+ "u.city = :city, u.country = :country, u.nationality = :nationality, u.company=:company, u.bio = :bio where userID = :uid")
	public void updatePublicInfo(@Param("uid")int userID, @Param("contact")String contact, @Param("job")String job,
			@Param("dname")String dname, @Param("address")String address, @Param("country")String country, @Param("city")String city,
			@Param("nationality")String nationality, @Param("bio")String bio, @Param("company")String company);
	
	/**
	 * JPA method which retrieves user information
	 * @param int id automatically retrieves user_information record by ID
	 */
	public UserInformation findByUserID(int id);
	
	/**
	 * Custom method and custom query used to update image and banner image path for the user_information table
	 * @param String banner a new data which will replace the current record of banner
	 * @param String picture a new data which will replace the current record of image
	 * @param int id specifies which user_information to be updated by means of user_id
	 * @Modifying annotation specifies that there will be changes in the record upon executing
	 */
	@Modifying
	@Query("update UserInformation u set u.banner = :banner, u.displayPicture = :displayPic where userID =:id")
	public void updatePublicImg(@Param("banner")String banner, @Param("displayPic")String picture, @Param("id") int id);
}
