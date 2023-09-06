
package com.test.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.test.model.AdminLogin;
import com.test.model.AirlinesList;
import com.test.model.BookingDetails;
import com.test.model.CustomerDetails;
import com.test.model.PlacesList;
import com.test.servlet.FlightList;

public class DBUtil {
	private static EntityManager getEntityManager() {
		EntityManagerFactory entitymangerFactory = Persistence.createEntityManagerFactory("FlightBooking");
		EntityManager entityManager = entitymangerFactory.createEntityManager();
		return entityManager;
	}

	public static List<FlightList> getFlightList() {
		EntityManager entityManager = getEntityManager();
		entityManager.getTransaction().begin();
		javax.persistence.Query query = entityManager.createQuery("SELECT u FROM FlightList u");
		List<FlightList> flightList = query.getResultList();
		entityManager.getTransaction().commit();
		System.out.println(flightList);

		return flightList;
	}

	public static List<String> getAirLinesList() {
		EntityManager entityManager = getEntityManager();

		entityManager.getTransaction().begin();
		javax.persistence.Query query = entityManager.createNativeQuery("select distinct airlinesname from airlineslist");
		List<String> airList = query.getResultList();
		entityManager.getTransaction().commit();
		System.out.println(airList);

		return airList;

	}
    public static PlacesList getPlaceByName(String name) {
    	EntityManager entityManager = getEntityManager();

		entityManager.getTransaction().begin();
		TypedQuery<PlacesList> query=entityManager.createQuery("select e from PlacesList e where e.placeName=:name", PlacesList.class).setParameter("name", name);
		PlacesList placeList = query.getSingleResult();
		//System.out.println(placeList);
		entityManager.getTransaction().commit();
		return placeList;
    }
    public static AirlinesList getAirLinesByName(String name) {
    	EntityManager entityManager = getEntityManager();

		entityManager.getTransaction().begin();
		TypedQuery<AirlinesList> query=entityManager.createQuery("select e from AirlinesList e where e.airlinesName=:name", AirlinesList.class).setParameter("name", name);
		AirlinesList airlines = query.getSingleResult();
		//System.out.println(placeList);
		entityManager.getTransaction().commit();
		return airlines;
    }
	
	public static List<String> getPlacesList(){
		EntityManager entityManager = getEntityManager();

		entityManager.getTransaction().begin();
		javax.persistence.Query query = entityManager.createNativeQuery("select distinct placename from placeslist");
		List<String> placeList = query.getResultList();
		System.out.println(placeList);
		entityManager.getTransaction().commit();
		return placeList;
	}

	public static List<String> getSourcePlaces() {
		EntityManager entityManager = getEntityManager();

		entityManager.getTransaction().begin();
		javax.persistence.Query query = entityManager.createNativeQuery("select distinct source from flightlist");
		List<String> placeList = query.getResultList();
		System.out.println(placeList);
		entityManager.getTransaction().commit();
		return placeList;

	}

	public static void addFlightList(FlightList flightList) {
		EntityManager entityManager = getEntityManager();

		entityManager.getTransaction().begin();
		entityManager.persist(flightList);
		entityManager.getTransaction().commit();
		
		
	}
	
	public static List<String> getDestinationPlaces() {
		EntityManager entityManager = getEntityManager();

		entityManager.getTransaction().begin();
		javax.persistence.Query query = entityManager.createNativeQuery("select distinct destination from flightlist");
		List<String> placeList = query.getResultList();
		System.out.println(placeList);
		entityManager.getTransaction().commit();
		return placeList;

	}

	public static List<FlightList> getAvailableFlights(Map<String, String> filterMap) {
		System.out.println(filterMap);
		EntityManager entityManager = getEntityManager();

		entityManager.getTransaction().begin();

		TypedQuery<FlightList> query = entityManager
				.createQuery("SELECT e FROM FlightList e WHERE e.source.placeName = :source "
						+ "and e.destination.placeName=:destination and e.weekdays like :weekday", FlightList.class)
				.setParameter("source", filterMap.get("source"))
				.setParameter("destination", filterMap.get("destination"))
				.setParameter("weekday", "%" + filterMap.get("weekday") + "%");

		List<FlightList> flightList = query.getResultList();
		entityManager.getTransaction().commit();
		System.out.println(query);
		System.out.println(flightList);

		return flightList;

	}
    public static String getAdminPasswordByName(String name) {
    	EntityManager entityManager = getEntityManager();

		entityManager.getTransaction().begin();

		TypedQuery<AdminLogin> query = entityManager.
				createQuery("select e from AdminLogin e "
						+ "where e.username=:name", AdminLogin.class)
				.setParameter("name", name);
		return query.getSingleResult().getPassword();
    }
	public static void saveCustomerDetails(CustomerDetails custDetails) {
		EntityManager entityManager = getEntityManager();

		entityManager.getTransaction().begin();
		entityManager.persist(custDetails);
		entityManager.getTransaction().commit();

	}

	public static boolean validateLogin(String email, String password) {
		EntityManager entityManager = getEntityManager();

		entityManager.getTransaction().begin();
		TypedQuery<CustomerDetails> query = entityManager
				.createQuery("SELECT e FROM CustomerDetails e WHERE e.custEmail = :custEmail",
             	CustomerDetails.class)
				.setParameter("custEmail", email);
		CustomerDetails cust = query.getSingleResult();

		entityManager.getTransaction().commit();
		if (cust != null) {
			if (cust.getCustPassword().equals(password)) {
				return true;
			}
		}
		return false;

	}
	public static CustomerDetails getCustomerByUserEmail(String email) {
		EntityManager entityManager = getEntityManager();

		entityManager.getTransaction().begin();
		TypedQuery<CustomerDetails> query = entityManager
				.createQuery("SELECT e FROM CustomerDetails e WHERE e.custEmail = :custEmail",
             	CustomerDetails.class)
				.setParameter("custEmail", email);
		CustomerDetails cust = query.getSingleResult();

		entityManager.getTransaction().commit();
		return cust;
	}

	public static FlightList getFlightById(int id) {
		EntityManager entityManager = getEntityManager();

		entityManager.getTransaction().begin();
		TypedQuery<FlightList> query = entityManager
				.createQuery("SELECT e FROM FlightList e WHERE e.id = :id",
             	FlightList.class)
				.setParameter("id", id);
		FlightList flight = query.getSingleResult();

		entityManager.getTransaction().commit();
		return flight;
		
	}
	public static void addBookingDetails(BookingDetails bookDetails) {
		System.out.println("BookingDetails:"+bookDetails);
		EntityManager entityManager = getEntityManager();

		entityManager.getTransaction().begin();
		entityManager.persist(bookDetails);

		entityManager.getTransaction().commit();
		
		
	}
	public static boolean changePassword(String password) {
		EntityManager entityManager = getEntityManager();

		entityManager.getTransaction().begin();
	javax.persistence.Query query = entityManager.
				createQuery("update AdminLogin "
						+ "set password=:password where "
						+ "username='admin'")
				.setParameter("password", password);
		int val=query.executeUpdate();

		entityManager.getTransaction().commit();
		
		return (val==1)?true:false;
	}
	public static List<BookingDetails> getBookingDetailsByUserId(int id) {
		//System.out.println("BookingDetails:"+bookDetails);
		EntityManager entityManager = getEntityManager();

		entityManager.getTransaction().begin();
		List<BookingDetails> bookDetails=entityManager.
				createQuery("select e from BookingDetails e where e.customerdetails.custId=:id",BookingDetails.class).
				setParameter("id", id).getResultList();

		entityManager.getTransaction().commit();
		return bookDetails;
		
		
	}
}
