<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/newcss.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pay</title>
        <%@include file="includes/header.jsp" %>
    </head>
    <body>
        <br>
        <br>
        <br>
        <div class="container">
            <div class="card w-50 mx-auto my-5">
                <div class="card-header text-center">Payment</div>
                <div class="card-body">
                    <div class="payment-section">
                        <form action="CreateBillServlet" method="POST" id="payment-form">
                            <input type="hidden" id="name" name="name" value="${param.name}" />
                            <input type="hidden" id="email" name="email" value="${param.email}" />
                            <input type="hidden" id="totalPrice" name="totalPrice" value="${param.totalPrice}" />
                            <input type="hidden" id="bookingId" name="bookingId" value="${param.bookingId}">
                            <div class="form-group">
                                <label for="paymentDate">Payment Date</label>
                                <i class="fas fa-credit-card"></i>
                                <input type="date" id="paymentDate" name="paymentDate" required>
                            </div>

                            <label for="paymentMethod">Payment Method:</label>
                            <select id="paymentMethod" name="paymentMethod" required>
                                <option value="Cash">Cash</option>
                                <option value="Visa Card">Visa Card</option>
                            </select>

                            <br>
                            <div style="text-align: center;">
                                <button type="submit" class="btn btn-dark">Next</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="includes/footer.jsp" %>

        <!-- jQuery and Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    </body>
</html>
