package com.test.model;

import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import com.test.servlet.FlightList;





@Entity
public class BookingDetails {
	@Id
	@GeneratedValue
	private int bookingId;
	@OneToOne(targetEntity = FlightList.class)
	@JoinColumn(name = "flightid",referencedColumnName = "flightid")
	private FlightList flightlist;
	@OneToOne(targetEntity = CustomerDetails.class)
	@JoinColumn(name="custid",referencedColumnName = "custid")
	
	private CustomerDetails customerdetails;
	private int totalFare;
	
	private String travelDate;
	
	
	public String getTravelDate() {
		return travelDate;
	}
	public void setTravelDate(String travelDate) {
		this.travelDate = travelDate;
	}
	public int getTotalFare() {
		return totalFare;
	}
	public void setTotalFare(int totalFare) {
		this.totalFare = totalFare;
	}
	public int getBookingId() {
		return bookingId;
	}
	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}
	public FlightList getFlightlist() {
		return flightlist;
	}
	public void setFlightlist(FlightList flightlist) {
		this.flightlist = flightlist;
	}
	public CustomerDetails getCustomerdetails() {
		return customerdetails;
	}
	public void setCustomerdetails(CustomerDetails customerdetails) {
		this.customerdetails = customerdetails;
	}

}
