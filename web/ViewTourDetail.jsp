<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="includes/header.jsp" %>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tour Detail</title>
        <style>
            .info-container {
                margin-bottom: 20px;
            }
            table {
                margin-left: 3%;
                width: calc(100% - 5%); /* Chiều rộng của bảng sẽ bằng 100% trừ đi khoảng cách từ lề trái và lề phải */
                border-collapse: collapse;
            }
            h2, h3{
                margin-left: 3%;
            }
            a{
                margin-left: 3%;
            }
            th, td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
        </style>
    </head>
    <body>
        <br>
        <br>
        <br>
        <div class="container">
            <h3>Location Detail</h3>
            <table>
                <thead>
                    <tr>
                        <th>Location ID</th>
                        <th>Location Name</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="location" items="${locations}">
                        <tr>
                            <td>${location.locationId}</td>
                            <td>${location.locationName}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <h3>Tour Detail</h3>
            <table>
                <tr>
                    <th>Tour ID</th>
                    <td>${tour.tourId}</td>
                </tr>
                <tr>
                    <th>Tour Name</th>
                    <td>${tour.tourName}</td>
                </tr>
                <tr>
                    <th>Description</th>
                    <td>${tour.description}</td>
                </tr>
                <tr>
                    <th>Tour Price</th>
                    <td>${tour.tourPrice}</td>
                </tr>
                <tr>
                    <th>Image</th>
                    <td><img src="images/${tour.imageUrl}" alt="Tour Image" width="100"></td>
                </tr>
                <tr>
                    <th>Start Location</th>
                    <td>${tour.startLocation}</td>
                </tr>
                <tr>
                    <th>Max Capacity</th>
                    <td>${tour.maxCapacity}</td>
                </tr>
            </table>

            <h3>Tour Dates List</h3>
            <table>
                <thead>
                    <tr>
                        <th>Tour Date ID</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>Current Capacity</th>
                    </tr>
                </thead>
                <tbody>
                    <%-- Lặp qua danh sách TourDates và hiển thị thông tin --%>
                    <c:forEach var="tourDate" items="${tourDatesList}">
                        <tr>
                            <td>${tourDate.tourDateId}</td>
                            <td>${tourDate.startDate}</td>
                            <td>${tourDate.endDate}</td>
                            <td>${tourDate.currentCapacity}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <h3>Employee Information</h3>
            <table>
                <tr>
                    <th>Employee ID</th>
                    <td>${tour.employee.employeeId}</td>
                </tr>
                <tr>
                    <th>Full Name</th>
                    <td>${tour.employee.fullName}</td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td>${tour.employee.email}</td>
                </tr>
                <tr>
                    <th>Position</th>
                    <td>${tour.employee.position}</td>
                </tr>
            </table>

            <h3>Transportation Information</h3>
            <table>
                <tr>
                    <th>Transportation ID</th>
                    <th>Transportation Name</th>
                    <th>Departure Time</th>
                    <th>Return Time</th>
                    <th>Image</th>
                </tr>
                <c:forEach var="transportation" items="${transportations}">
                    <tr>
                        <td>${transportation.transportationId}</td>
                        <td>${transportation.transportationName}</td>
                        <td>${transportation.departureTime}</td>
                        <td>${transportation.returnTime}</td>
                        <td><img src="images/${transportation.imageUrl}" alt="Transportation Image" width="100"></td>
                    </tr>
                </c:forEach>
            </table>

            <h3>Activity Schedules</h3>
            <table>
                <tr>
                    <th>Day Number</th>
                    <th>Activity Name</th>
                    <th>Start Time</th>
                    <th>End Time</th>
                    <th>Location</th>
                    <th>Description</th>
                </tr>
                <c:forEach var="schedule" items="${activityScheduleList}">
                    <tr>
                        <td>${schedule.dayNumber}</td>
                        <td>${schedule.activityName}</td>
                        <td>${schedule.startTime}</td>
                        <td>${schedule.endTime}</td>
                        <td>${schedule.location}</td>
                        <td>${schedule.description}</td>
                    </tr>
                </c:forEach>
            </table>

            <h3>Hotel Information</h3>
            <table>
                <thead>
                    <tr>
                        <th>Hotel Name</th>
                        <th>Address</th>
                        <th>Image</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="hotel" items="${hotelList}">
                        <tr>
                            <td>${hotel.hotelName}</td>
                            <td>${hotel.address}</td>
                            <td><img src="images/${hotel.imageUrl}" alt="Hotel Image" width="100"></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <h3>Restaurant Information</h3>
            <table>
                <thead>
                    <tr>
                        <th>Restaurant Name</th>
                        <th>Address</th>
                        <th>Image</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="restaurant" items="${restaurantList}">
                        <tr>
                            <td>${restaurant.restaurantName}</td>
                            <td>${restaurant.address}</td>
                            <td><img src="images/${restaurant.imageUrl}" alt="Restaurant Image" width="100"></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <br>
            <br>
            <br>
            <a href="ApprovalTourServlet?" class="btn btn-primary">Back to Manage Tours</a>
        </div>
        <%@include file="includes/footer.jsp" %>
    </body>
</html>
