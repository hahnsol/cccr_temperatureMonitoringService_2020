<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/49199b18c4.js" crossorigin="anonymous"></script>
    <title>MainContentStartPage</title>
    <link rel="stylesheet" href="resources/CSS/style.css">
    <link rel="stylesheet" href="resources/CSS/global.css">
    <link rel="stylesheet" href="resources/CSS/mainContentPage.css">
</head>
<body class="mainContentPage_body">



    <header class="mainContentPage_headerBox">
        <div class="mainContentPage_headerBox_header">
            <div class="mainContentPage_headerBox_header-logo">
                ARMtong
            </div>
            <a href="/logoutAction" class="mainContentPage_headerBox_header-logoutButton">
                Logout
            </a>
        </div>
    </header>

    <section class="MainContentPage_section1">
      <div class="MainContentPage_section1_wrapper">
        <form action="/mainContentPage" method="GET" enctype="multipart/form-data" class="MainContentPage_section1_top-selectDate"> 
            <input type="date" name="temperature_date">
            <button type="submit" >
                조회하기
            </button>
        </form>
        <div class="MainContentPage_section1_middle">
            TODAY
        </div>
        <div class="MainContentPage_section1_bottom">
            <div class="MainContentPage_section1_bottom_averageTem">
                <div class="MainContentPage_section1_bottom_averageTem-text">
                    평균온도
                </div>
                <div class="MainContentPage_section1_bottom_averageTem-iconBox">
                    <i class="fa fa-thermometer-three-quarters" aria-hidden="true"></i>
                </div>
                <div class="MainContentPage_section1_bottom_averageTem-temNum">
                    ${mainTodayTemAverage }
                </div>
            </div>
            <div class="MainContentPage_section1_bottom_right">
                <div class="MainContentPage_section1_bottom_right-countPeople MainContentPage_section1_bottom_right-countPeople1">
                    <div class="MainContentPage_section1_bottom_right-countPeople-top">
                        <div class="MainContentPage_section1_bottom_right-countPeople-text">
                            측정인원
                        </div>
                        <div class="MainContentPage_section1_bottom_right-countPeople-count">
                            ${totalMember }
                        </div>
                    </div>
                </div>
                <div class="MainContentPage_section1_bottom_right-countPeople MainContentPage_section1_bottom_right-countPeople2">
                    <div class="MainContentPage_section1_bottom_right-countPeople-top">
                        <div class="MainContentPage_section1_bottom_right-countPeople-text">
                            37도 이상 인원
                        </div>
                        <div class="MainContentPage_section1_bottom_right-countPeople-count">
                            ${memberCount }
                        </div>
                    </div>
                </div>
            </div>
        </div>
      </div>  
    </section>

    <section class="MainContentPage_section2">
        <div class="MainContentPage_section2_wrapper">
            <div class="MainContentPage_section1-text">
                전체보기
            </div>
            <div class="MainContentPage_section2-title">
                <div class="MainContentPage_section2-title-box1">
                    <div class="MainContentPage_section1-column-text">
                        name
                    </div>
                </div>
                <div class="MainContentPage_section2-title-box2">
                    <div class="MainContentPage_section1-column-text">
                        temperature
                    </div>
                </div>
                <div class="MainContentPage_section2-title-box3">
                    <div class="MainContentPage_section1-column-text">
                        location
                    </div>
                </div>
                <div class="MainContentPage_section2-title-box4">
                    <div class="MainContentPage_section1-column-text">
                        time
                    </div>
                </div>
            </div>

            <c:forEach items="${startContents}" var="todayContents">
                <c:choose>
                    <c:when test="${todayContents.temperatureBasicVo.temperature_tem < 37}">
                        <a href="/memberInfoPage?member_idx=${todayContents.memberBasicVo.member_idx}" target="_blank" class="MainContentPage_section1-column">
                            <div class="MainContentPage_section1-column-box1">
                                <div class="MainContentPage_section1-column-text">
                                    ${todayContents.memberBasicVo.member_name}
                                </div>
                            </div>
                            <div class="MainContentPage_section1-column-box2">
                                <div class="MainContentPage_section1-column-text">
                                    ${todayContents.temperatureBasicVo.temperature_tem}
                                </div>
                            </div>
                            <div class="MainContentPage_section1-column-box3">
                                <div class="MainContentPage_section1-column-text">
                                    ${todayContents.temperatureBasicVo.temperature_location}
                                </div>
                            </div>
                            <div class="MainContentPage_section1-column-box4">
                                <div class="MainContentPage_section1-column-text">
                                    ${todayContents.temperatureBasicVo.temperature_time}
                                </div>
                            </div>
                        </a>
                    </c:when>

                    
                    <c:otherwise>
                        <a href="/memberInfoPage?member_idx=${todayContents.memberBasicVo.member_idx}" target="_blank" class="MainContentPage_section1-column MainContentPage_section1-column_red">
                            <div class="MainContentPage_section1-column-box1">
                                <div class="MainContentPage_section1-column-text">
                                    ${todayContents.memberBasicVo.member_name}
                                </div>
                            </div>
                            <div class="MainContentPage_section1-column-box2">
                                <div class="MainContentPage_section1-column-text">
                                    ${todayContents.temperatureBasicVo.temperature_tem}
                                </div>
                            </div>
                            <div class="MainContentPage_section1-column-box3">
                                <div class="MainContentPage_section1-column-text">
                                    ${todayContents.temperatureBasicVo.temperature_location}
                                </div>
                            </div>
                            <div class="MainContentPage_section1-column-box4">
                                <div class="MainContentPage_section1-column-text">
                                    ${todayContents.temperatureBasicVo.temperature_time}
                                </div>
                            </div>
                        </a>
                    </c:otherwise>
                </c:choose>
            </c:forEach> 
        </div>
    </section>

</div>
</body>
</html>