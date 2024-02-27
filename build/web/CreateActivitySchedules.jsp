<%-- 
    Document   : CreateActivitySchedules
    Created on : Feb 13, 2024, 10:34:24 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="includes/header.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Activity Schedule</title>

    </head>
    <body>
        <br>
        <br>
        <br>
        <br>
        <br>
        <form action="ActivityScheduleServlet" method="post" onsubmit="return validateForm()">
            <div class="container">
                <input type="hidden" name="update" value="${param.update}">
                <input type="hidden" name="locationId" value="${param.locationId}">
                <input type="hidden" id="tourId" name="tourId" value="${param.tourId}">

                <div class="form-group">
                    <label for="dayNumber">Day Number:</label>
                    <input type="number" id="dayNumber" name="dayNumber" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="activityName">Activity Name:</label>
                    <input type="text" id="activityName" name="activityName" class="form-control">
                </div>
                <div class="form-group">
                    <label for="startTime">Start Time:</label>
                    <input type="time" id="startTime" name="startTime" class="form-control">
                </div>
                <div class="form-group">
                    <label for="endTime">End Time:</label>
                    <input type="time" id="endTime" name="endTime" class="form-control">
                </div>
                <div class="form-group">
                    <label for="location">Location:</label>
                    <input type="text" id="location" name="location" class="form-control">
                </div>
                <div class="form-group">
                    <label for="activityDescription">Activity Description:</label>
                    <textarea id="activityDescription" name="activityDescription" class="form-control" rows="3"></textarea>
                </div>
                <br>
                <br>
                <!-- Add Button -->
                <button type="submit" class="btn btn-primary">Add</button>

                <!-- Back Button -->
                <button type="button" onclick="history.back();" class="btn btn-secondary">Back</button>
            </div>
        </form>
        <footer>
            <%@include file="includes/footer.jsp" %>
        </footer>
        <script>
            function validateForm() {
                var startTime = document.getElementById("startTime").value;
                var endTime = document.getElementById("endTime").value;

                // Chuyển đổi thời gian sang định dạng số giờ và phút
                var startTimeParts = startTime.split(":");
                var endTimeParts = endTime.split(":");
                var startHour = parseInt(startTimeParts[0]);
                var startMinute = parseInt(startTimeParts[1]);
                var endHour = parseInt(endTimeParts[0]);
                var endMinute = parseInt(endTimeParts[1]);

                // Kiểm tra nếu end time trước start time
                if (endHour < startHour || (endHour === startHour && endMinute <= startMinute)) {
                    alert("End time must be after start time.");
                    return false; // Ngăn chặn submit form
                }
                return true; // Cho phép submit form nếu thời gian hợp lệ
            }
        </script>
    </body>
</html>
