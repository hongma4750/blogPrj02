<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<!-- tag들 필요하면 Ctrl+c  /   Ctrl+v -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<fmt:requestEncoding value="utf-8"/>
<!-- tag들 필요하면 Ctrl+c  /   Ctrl+v -->

<!-- 부트스트랩 링크 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- 부트스트랩 링크 -->



앙 블로그띠

        <div ng-app="myApp">
    <div class="inbox" ng-controller="EmailsCtrl">
        My Inbox:
        <ul>
            <li ng-repeat="message in emails.messages">
                <p>From: {{ message.from }}</p>
                <p>Subject: {{ message.subject }}</p>
                <p>{{ message.sent | date:'MMM d, y h:mm:ss a' }}</p>
            </li>
        </ul>
    </div>
</div>





<script>
	 
	 var m_id = '${login.m_id}';
	 if(m_id != " "){
		 var myApp = angular.module('myApp', []);
		 myApp.controller('EmailsCtrl', ['$scope', function ($scope) {
			    $scope.emails = {};
			    $scope.emails.messages = [
					<c:forEach items="${newMyMessageList}" var="item1">
					    {
					    	
					    	
					        "from": "${item1.message_sender}",
					        "subject": "${item1.message_receiver}",
					        "sent": "${item1.message_content}"
					    },
			    	</c:forEach>
			    ];
			    
			}]);
	 }
	 </script>
