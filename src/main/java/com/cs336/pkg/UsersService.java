package com.cs336.pkg;


import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.sql.*;

public class UsersService {
    private ApplicationDB db;
    private Connection con;

    public  UsersService() {
        db = new ApplicationDB();
        con = db.getConnection();
    }

    // gets the nav bar for the website
    public String getHeader(String role){
        String header_base = "<ul>\n" +
                "        <li><a href=\"HelloUser.jsp\">Dashboard</a></li>\n" +
                "        <li><a href=\"searchFlight.jsp\">Search Flights</a></li>\n" +
                "        <li><a href=\"questions.jsp\">Questions</a></li>\n";

        if (role.equalsIgnoreCase("admin")){
            header_base +=  "        <li><a href=\"viewUsers.jsp\">View Users</a></li>\n";
        }
        else if (role.equalsIgnoreCase("customer_rep")){
            header_base +=  "        <li><a href=\"viewFlights.jsp\">View All Flights</a></li>\n";
        }
        header_base+=        "    </ul>";
        return header_base;
    }

    public Users getUser(String username){
        String select = ("SELECT * FROM application.users WHERE username = ?");
        //Create a Prepared SQL statement allowing you to introduce the parameters of the query
        try{
            PreparedStatement ps = con.prepareStatement(select);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            rs.next();
            String password = rs.getString(2);
            String firstName = rs.getString(3);
            String lastName = rs.getString(4);
            String email = rs.getString(5);
            String role = rs.getString(6);
            Users user = new Users(username,password,firstName,lastName,email,role);
            return user;
        }
        catch(SQLException e){
            e.printStackTrace();
            return null;

        }
    }

  public void updateUser(String usernameOriginal, String username, String password, String firstName, String lastName, String email, String role){
        String update = ("UPDATE application.users SET username = ? , password = ?, firstName = ?, lastName = ?, email = ?, role = ? WHERE username = ?");
        try {
            PreparedStatement ps = con.prepareStatement(update);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, firstName);
            ps.setString(4, lastName);
            ps.setString(5, email);
            ps.setString(6, role);
            ps.setString(7, usernameOriginal);
            ps.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
    public List<Questions> getAllQuestions(){
        String select = "SELECT * FROM questions";
        List<Questions> questions = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                int questionId = rs.getInt(1);
                String author = rs.getString(2);
                String messageContent = rs.getString(3);
                Timestamp timestamp = rs.getTimestamp(4);
                Questions question = new Questions(questionId,author,messageContent,timestamp);
                questions.add(question);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        return questions;
    }

    public String getQuestion(int questionId){
        String select = "SELECT * FROM questions WHERE qID = ?";
        try{
            PreparedStatement ps = con.prepareStatement(select);
            ps.setInt(1,questionId);
            ps.executeQuery();
            ResultSet rs = ps.executeQuery();
            rs.next();
            return rs.getString(3);
        }catch (SQLException e){
            e.printStackTrace();
            return null;
        }
    }



    public void addQuestion(String author, String messageContent, String timestamp){
        String insert = ("INSERT INTO application.questions (author, messageContent,messageTimeStamp) VALUES (?,?,?)");
        try {
            PreparedStatement ps = con.prepareStatement(insert);
            ps.setString(1, author);
            ps.setString(2, messageContent);
            ps.setString(3, timestamp);
            ps.executeUpdate();
        }catch (SQLException e){
            System.out.println(e);
        }
    }
    public List<Questions> getAllQuestions(String search){
        String select = "SELECT * FROM questions q LEFT JOIN replies r ON q.qID = r.qID WHERE q.messageContent LIKE ? OR r.messageContent LIKE ?";
        List<Questions> questions = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(select);
            ps.setString(1, "%"+search+"%");
            ps.setString(2, "%"+search+"%");
            System.out.println(ps.toString());
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                int questionId = rs.getInt(1);
                String author = rs.getString(2);
                String messageContent = rs.getString(3);
                Timestamp timestamp = rs.getTimestamp(4);
                Questions question = new Questions(questionId,author,messageContent,timestamp);
                questions.add(question);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        return questions;
    }

    public List<Replies> getReplies(int questionId){
        String select = "SELECT * FROM application.replies WHERE qID = ?";
        List<Replies> replies = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(select);
            ps.setInt(1, questionId);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                int replierId = rs.getInt(1);
                String author = rs.getString(2);
                String messageContent = rs.getString(4);
                Timestamp timestamp = rs.getTimestamp(5);
                Replies reply = new Replies(replierId,author,questionId,messageContent,timestamp);
                replies.add(reply);
            }

        }catch (SQLException e){
            e.printStackTrace();
            return null;
        }
        return replies;
    }

    public void addReply(String author, int qID, String messageContent, String timestamp){
        String insert = "INSERT INTO application.replies (author, qID, messageContent, messageTimestamp) VALUES (?,?,?,?)";
        try{
            PreparedStatement ps = con.prepareStatement(insert);
            ps.setString(1, author);
            ps.setInt(2, qID);
            ps.setString(3, messageContent);
            ps.setString(4, timestamp);
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }

    public void deleteUser(String username){
        String delete = ("DELETE FROM application.users WHERE username = ?");
        try {
            PreparedStatement ps = con.prepareStatement(delete);
            ps.setString(1, username);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void addUser(String username, String password, String firstName, String lastName, String email, String role){
        String insert = ("INSERT INTO application.users VALUES (?,?,?,?,?,?)");
        try {
            PreparedStatement ps = con.prepareStatement(insert);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, firstName);
            ps.setString(4, lastName);
            ps.setString(5, email);
            ps.setString(6, role);
            ps.executeUpdate();
        }catch (SQLException e){
            System.out.println(e);
        }
    }

    public List<Airport>getAirports(){
        String select = ("SELECT * FROM application.airport");
        try {
            PreparedStatement ps = con.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            List<Airport> airports = new ArrayList<>();
            while (rs.next()) {
                String airportId = rs.getString(1);
                String airportName = rs.getString(2);
                String airportCity = rs.getString(3);
                String airportCountry = rs.getString(4);
                Airport airport = new Airport(airportId,airportName,airportCity,airportCountry);
                airports.add(airport);
            }
            return airports;
        }
        catch (SQLException e){
            return null;
        }
    }

    public List<Airline>getAirlines(){
        String select = ("SELECT * FROM application.airline");
        try {
            PreparedStatement ps = con.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            List<Airline> airlines = new ArrayList<>();
            while (rs.next()) {
                String airlineID = rs.getString(1);
                String name = rs.getString(2);
                Airline airline = new Airline(airlineID,name);
                airlines.add(airline);
            }
            return airlines;
        }
        catch (SQLException e){
            return null;
        }
    }
    public List<Users> getAllCustomersAndReps(){
        String select = ("SELECT * FROM application.users WHERE role <> 'admin'");
        List<Users> users = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String username = rs.getString(1);
                String password = rs.getString(2);
                String firstName = rs.getString(3);
                String lastName = rs.getString(4);
                String email = rs.getString(5);
                String role = rs.getString(6);
                Users user = new Users(username,password,firstName,lastName,email,role);
                users.add(user);
            }

        }catch(SQLException e){
            e.printStackTrace();
            return null;
        }
        return users;
    }

    public String getDate(int departureDay, int curDay, LocalDate localDate, int flexibility) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy.MM.dd");

        // Normalize both to 0-based (0 = Sunday, ..., 6 = Saturday)
        int normalizedCur = (curDay - 1) % 7;
        int normalizedDep = (departureDay - 1) % 7;

        // Calculate delta days from selected day to departure day, wrapping around the week
        int forwardDelta = (normalizedDep - normalizedCur + 7) % 7;
        int backwardDelta = (normalizedCur - normalizedDep + 7) % 7;

        // If it's within the flexibility window in either direction, compute the actual date
        if (forwardDelta <= flexibility) {
            return localDate.plusDays(forwardDelta).format(formatter);
        } else if (backwardDelta <= flexibility) {
            return localDate.minusDays(backwardDelta).format(formatter);
        }

        // Otherwise, the flight doesn't fall within the flexibility range
        return null;
    }



    public List<Flight> getAllAirportFlights(String airportID, int dayOfWeek){
//        String search = "SELECT * FROM application.flight f LEFT JOIN application.flightdeparturedays fd USING (airlineID, flightNum, aircraftID) WHERE (f.departureAirport = ?  OR f.arrivalAirport = ?) AND fd.depatureDay = ?";

        String search = "SELECT * FROM application.flight f LEFT JOIN application.flightdeparturedays fd USING (airlineID, flightNum) WHERE (f.departureAirport = ?  OR f.arrivalAirport = ?) AND ((fd.depatureDay = ? AND  f.departureTime < f.arrivalTime) OR (fd.depatureDay = (?-2+7)%7 +1 AND f.departureTime > f.arrivalTime) )";
        List<Flight> flights = new ArrayList<>();
        try{
            PreparedStatement ps = con.prepareStatement(search);
            ps.setString(1, airportID);
            ps.setString(2,airportID);
            ps.setInt(3,dayOfWeek);
            ps.setInt(4,dayOfWeek);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                String airlineID = rs.getString(1);
                int flightNum = rs.getInt(2);
                int aircraftID = rs.getInt(3);
                boolean isDomestic = rs.getBoolean(4);
                String departureAirport = rs.getString(5);
                Time departureTime = rs.getTime(6);
                String arrivalAirport = rs.getString(7);
                Time arrivalTime = rs.getTime(8);
                Double price = rs.getDouble(9);
                int dayOfset = rs.getInt(10);
                int departureDay = rs.getInt(11);
                Flight flight = new Flight(airlineID,flightNum,aircraftID, isDomestic,departureAirport,departureTime,arrivalAirport,arrivalTime,price,dayOfset,departureDay);
                flights.add(flight);
            }
            return flights;
        }catch (SQLException e){
            e.printStackTrace();
            return flights;
        }
    }

    public String getArrivalAirport(String airlineId, int flightNum){
        String search = "SELECT f.arrivalAirport FROM flight f WHERE f.airlineID = ? AND f.flightNum = ?";
        try {
            PreparedStatement ps = con.prepareStatement(search);
            ps.setString(1, airlineId);
            ps.setInt(2, flightNum);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                return rs.getString(1);
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean hasEnoughSeats(Flight f){
        String search = "SELECT a.numSeats - COUNT(t.*) AS seatsLeft FROM application.flight f JOIN application.aircraft a ON f.aircraftID = a.aircraftID LEFT JOIN application.ticketinfo t ON f.airlineID = t.airlineID AND f.flightNum = t.flightNum  AND f.flightDate = t.flightDate WHERE f.flightDate = DATE ?  AND f.airlineID = ? AND f.flightNum = ? GROUP BY f.airlineID, f.flightNum, f.flightDate, a.numSeats";

        try {
            PreparedStatement ps = con.prepareStatement(search);
            ps.setString(1,f.getDepartureDate().toString());
            ps.setString(2,f.getAirlineID());
            ps.setInt(3,f.getFlightNum());
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                return rs.getInt(1) >=1;
            }
        }
        catch (SQLException e){
            e.printStackTrace();
        }
    }

    public List<Flight> getFlights(String previousAirlineID, int previousFlightNum, String airportID, int dayOfWeek,int flexibility,LocalDate localDate, String sort, String maxPrice, String airline, Time departAfter, Time arriveBefore){
        int minDay = ((dayOfWeek - flexibility - 1 + 7) % 7) + 1;
        int maxDay = ((dayOfWeek - 1 + flexibility) % 7) + 1;
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy.MM.dd");
        int paramIndex = 1;
        //sorting flights
        String sortQuery = "";
        if(sort!=null){
            switch(sort){
                case "priceAsc":
                    sortQuery = "ORDER BY price ASC";
                    break;
                case "priceDesc":
                    sortQuery = "ORDER BY price DESC";
                    break;
                case "takeAsc":
                    sortQuery = "ORDER BY departureTime ASC";
                    break;
                case "takeDesc":
                    sortQuery = "ORDER BY departureTime DESC";
                    break;
                case "landingAsc":
                    sortQuery = "ORDER BY arrivalTime ASC";
                    break;
                case "landingDesc":
                    sortQuery = "ORDER BY arrivalTime DESC";
                    break;
                default:
                    sortQuery="";
                    break;
            }
        }
        String search = "SELECT * FROM application.flight f LEFT JOIN application.flightdeparturedays fd USING (airlineID, flightNum) WHERE (f.departureAirport = ?) AND (IF (? <=?,fd.depatureDay BETWEEN ? AND ?,(fd.depatureDay >= ? OR fd.depatureDay <= ?))) "; // fd.departureDay BETWEEN (dayOfWeek - (flexibility+1)%7+1) AND (dayOfWeek + flexibility)%7
        boolean hasMaxPrice = maxPrice!=null && !maxPrice.isEmpty();
        boolean hasAirline = airline!=null && !airline.isEmpty();
        boolean depAfter = departAfter!=null;
        boolean arrBefore = arriveBefore!=null;
        if(hasMaxPrice) search +="AND f.price <= ? ";
        if(hasAirline) search+="AND f.airlineID = ? ";
        if (previousAirlineID != null) search += "AND f.departureTime > (SELECT arrivalTime FROM flight WHERE flight.airlineID = ? AND flight.flightNum =  ?)";
        if(depAfter) search+="AND f.departureTime >= ? ";
        if(arrBefore) search+="AND f.arrivalTime <= ? ";
        search+= " " + sortQuery;
        System.out.println("final query: " + search);
        List<Flight> flights = new ArrayList<>();
        try{
            PreparedStatement ps = con.prepareStatement(search);
            if (previousAirlineID != null) {
                ps.setString(paramIndex++, getArrivalAirport(previousAirlineID,previousFlightNum));
            }
            else {
                ps.setString(paramIndex++, airportID);
            }
//            System.out.println("paramIndex: " + paramIndex + " " + airportID);
            ps.setInt(paramIndex++,minDay);
//            System.out.println("paramIndex: " + paramIndex + " " + minDay);
            ps.setInt(paramIndex++,maxDay);
//            System.out.println("paramIndex: " + paramIndex + " " + maxDay);
            ps.setInt(paramIndex++,minDay);
//            System.out.println("paramIndex: " + paramIndex + " " + minDay);
            ps.setInt(paramIndex++,maxDay);
//            System.out.println("paramIndex: " + paramIndex + " " + maxDay);
            ps.setInt(paramIndex++,minDay);
//            System.out.println("paramIndex: " + paramIndex + " " + minDay);
            ps.setInt(paramIndex++,maxDay);
//            System.out.println("paramIndex: " + paramIndex + " " + maxDay);
            if (hasMaxPrice) ps.setDouble(paramIndex++,Double.parseDouble(maxPrice));
            if (hasAirline) ps.setString(paramIndex++,airline);
            if (previousAirlineID != null) {
                ps.setString(paramIndex++,previousAirlineID);
                ps.setInt(paramIndex++,previousFlightNum);
            }
            if (depAfter) ps.setTime(paramIndex++, departAfter);
            if (arrBefore) ps.setTime(paramIndex++,arriveBefore);
            System.out.println(ps);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                String airlineID = rs.getString(1);
                int flightNum = rs.getInt(2);
                int aircraftID = rs.getInt(3);
                boolean isDomestic = rs.getBoolean(4);
                String departureAirport = rs.getString(5);
                Time departureTime = rs.getTime(6);
                String arrivalAirport = rs.getString(7);
                Time arrivalTime = rs.getTime(8);
                Double price = rs.getDouble(9);
                int dayOfset = rs.getInt(10);
                int departureDay = rs.getInt(11);
                LocalDate departureDate = LocalDate.parse(getDate(departureDay,dayOfWeek,localDate,flexibility),formatter);
                Flight flight = new Flight(airlineID,flightNum,aircraftID,isDomestic,departureAirport,departureTime,arrivalAirport,arrivalTime,price,dayOfset,departureDay,departureDate);
                flights.add(flight);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return flights;
    }


//


}
