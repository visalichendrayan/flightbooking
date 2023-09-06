package com.test.servlet;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.test.model.AirlinesList;
import com.test.model.PlacesList;

@Entity
@Table(name = "flightlist")
//@NamedQueries(  
//	    {  
//	        @NamedQuery(  
//	        name = "findFlightBySource",  
//	        query = "from FlightList e where e.source = ?0"  
//	        )  
//	    }  
//	)  
public class FlightList {
	@Id
	@GeneratedValue
	@Column(name = "flightid")
	private int id;
	private String name;
    @OneToOne
	@JoinColumn(name = "sourceid", referencedColumnName = "placeid")
	private PlacesList source;
    @OneToOne
	@JoinColumn(name = "destinationid", referencedColumnName = "placeid")
	private PlacesList destination;
    @OneToOne
	@JoinColumn(name = "airlinesid", referencedColumnName = "airlinesid")
	private AirlinesList airLines;
	private int ticketPrice;
	private String weekdays;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public PlacesList getSource() {
		return source;
	}

	public void setSource(PlacesList source) {
		this.source = source;
	}

	public PlacesList getDestination() {
		return destination;
	}

	public void setDestination(PlacesList destination) {
		this.destination = destination;
	}

	public AirlinesList getAirLines() {
		return airLines;
	}

	public void setAirLines(AirlinesList airLines) {
		this.airLines = airLines;
	}

	public int getTicketPrice() {
		return ticketPrice;
	}

	public void setTicketPrice(int ticketPrice) {
		this.ticketPrice = ticketPrice;
	}

	public String getWeekdays() {
		return weekdays;
	}

	public void setWeekdays(String weekdays) {
		this.weekdays = weekdays;
	}

	@Override
	public String toString() {
		return "FlightList [id=" + id + ", name=" + name + ", source=" + source + ", destination=" + destination
				+ ", airLines=" + airLines + ", ticketPrice=" + ticketPrice + ", weekdays=" + weekdays + "]";
	}

}
