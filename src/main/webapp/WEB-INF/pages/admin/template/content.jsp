<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@page contentType="text/html" pageEncoding="UTF-8" %>

          <div class="col-md-9 animated bounce">
               <h3 class="page-header">To-do list</h3>
               <c:if test="${listCongViec.soDonHangMoi > 0}">
                    <p>You have <a href='<c:url value="/admin/don-hang" />'> ${listCongViec.soDonHangMoi} new orders</a>
                    <p>
               </c:if>

               <c:if test="${listCongViec.soDonhangChoDuyet > 0}">
                    <p>You have <a href='<c:url value="/admin/don-hang" />'> ${listCongViec.soDonhangChoDuyet} orders
                              waiting for approval</a>
                    <p>
               </c:if>

               <c:if test="${listCongViec.soLienHeMoi > 0}">
                    <p>You have <a href='<c:url value="/admin/lien-he" />'> ${listCongViec.soLienHeMoi} new contact</a>
                    <p>
               </c:if>

          </div>