<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ멤버 -->
<div style="clear: both; width: 97%;">
	<h1>MEMBERS</h1>
	<table class="member-table">
		<thead class="member-table-head">
			<tr>
				<th class="member-th member-id">아이디</th>
				<th class="member-th member-name">성함</th>
				<th class="member-th member-email">Email</th>
				<th class="member-th member-birth">생일</th>
				<th class="member-th member-gender">성별</th>
				<th class="member-th member-grade">분류</th>
				<th class="member-th member-sns">페북연동</th>
				<th class="member-th member-city">대표도시</th>
				<th class="member-th member-btn">수정/삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${memList }" var="mem" varStatus="m">
				<tr>
					<td class="member-th member-id">${mem.id }</td>
					<td class="member-th member-name">${mem.name }</td>
					<td class="member-th member-email">${mem.email }</td>
					<td class="member-th member-birtd">${mem.birth }</td>
					<c:choose>
						<c:when test="${mem.gender eq 1 }">
							<td class="member-th member-gender">MAN</td>
						</c:when>
						<c:otherwise>
							<td class="member-th member-gender">WOMAN</td>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${mem.grade eq 9 }">
							<td class="member-th member-grade">관리자</td>
						</c:when>
						<c:when test="${mem.grade eq 4 }">
							<td class="member-th member-grade">블랙리스트</td>
						</c:when>
						<c:when test="${mem.grade eq 1 }">
							<td class="member-th member-grade">플래너</td>
						</c:when>
						<c:otherwise>
							<td class="member-th member-grade">일반 고객</td>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${mem.social gt 0 }">
							<td class="member-th member-sns">O</td>
						</c:when>
						<c:otherwise>
							<td class="member-th member-sns">X</td>
						</c:otherwise>
					</c:choose>
					
					<td class="member-th member-city">${mem.helpcity }</td>
					<td class="member-th member-btn">
						<button class="member-update">수정</button>
						<button class="member-exclude">탈퇴</button>
					</td>
				</tr>
			</c:forEach>
		
		</tbody>
	
	
	</table>

</div>