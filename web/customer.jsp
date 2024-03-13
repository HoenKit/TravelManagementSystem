<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Customer List</title>
        <%@ include file="includes/header.jsp" %>
    </head>
    <body>
        <%@ include file="includes/navbar.jsp" %>
        <br>
        <br>
        <div class="container">
            <br>
            <br>
            <h2>Customer Information</h2>
            <table class="table table-light">
                <thead>
                    <tr>
                        <th scope="col">Name</th>
                        <th scope="col">Phone</th>
                        <th scope="col">ID Card</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="customer" items="${customerList}">
                        <tr>
                            <td>${customer.name}</td>
                            <td>${customer.phone}</td>
                            <td>${customer.idCard}</td>
                            <td>
                                <button onclick="confirmDelete(${customer.customerId}, ${bookingId}, '${name}', '${email}', ${totalPrice})" type="button" class="btn btn-danger">Delete</button>

                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <br>
            <br>
            <form action="AddCustomerServlet" method="post">
                <h4>Add Customer Information</h4>
                <div style="padding: 20px; background-color: #ededed; display: flex; flex-wrap: wrap">
                    <input type="hidden" id="name" name="name" value="${name}" />
                    <input type="hidden" id="email" name="email" value="${email}" />
                    <input type="hidden" id="totalPrice" name="totalPrice" value="${totalPrice}" />
                    <input type="hidden" id="bookingId" name="bookingId" value="${bookingId}">
                    <div style="width: 50%; padding: 20px">
                        <label>Full Name</label><span style="color: red">*</span>
                        <input name="fullname" class="form-control"/>
                    </div>
                    <div style="width: 50%; padding: 20px">
                        <label>Phone</label><span style="color: red">*</span>
                        <input name="phone" class="form-control"/>
                    </div>
                    <div style="width: 50%; padding: 20px">
                        <label>ID Card</label>
                        <input name="idCard" class="form-control"/>
                    </div>
                </div>
                <br>
                <br>
                <input type="submit" value="Add Customer Information">
            </form>
            <br>
            <br>
            <a href="Home" class="btn btn-primary">Back to Homepage</a>
            <a href="Bill.jsp?bookingId=${bookingId}&name=${name}&email=${email}&totalPrice=${totalPrice}" class="btn btn-secondary">Next</a>
        </div>
        <%@ include file="includes/footer.jsp" %>
        <!-- Modal for confirming customer deletion -->
        <div class="modal fade" id="confirmDeleteModal" tabindex="-1" role="dialog" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="confirmDeleteModalLabel">Confirm Delete</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Are you sure you want to delete this customer?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <button type="button" class="btn btn-danger" id="confirmDeleteButton">Delete</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS and jQuery -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

        <script>
                                    // Khai báo biến toàn cục cho customerIdToDelete và bookingIdToDelete
                                    var customerIdToDelete;
                                    var bookingIdToDelete;

                                    function confirmDelete(customerId, bookingId, name, email, totalPrice) {
                                        customerIdToDelete = customerId;
                                        bookingIdToDelete = bookingId;
                                        $('#name').val(name);
                                        $('#email').val(email);
                                        $('#totalPrice').val(totalPrice);
                                        $('#confirmDeleteModal').modal('show');
                                    }

                                    $(document).on('click', '#confirmDeleteButton', function () {
                                        // Lấy giá trị của các tham số name, email, totalPrice từ các input hidden
                                        var name = $('#name').val();
                                        var email = $('#email').val();
                                        var totalPrice = $('#totalPrice').val();

                                        // Thực hiện chuyển hướng đến servlet để xóa khách hàng
                                        window.location.href = 'DeleteCustomerServlet?customerId=' + customerIdToDelete + '&bookingId=' + bookingIdToDelete + '&name=' + name + '&email=' + email + '&totalPrice=' + totalPrice;
                                    });
        </script>
    </body>
</html>
