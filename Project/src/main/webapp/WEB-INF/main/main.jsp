<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="mainHeader.jsp"%>
<link rel="stylesheet" href="resources/main/main_reset.css">
<link rel="stylesheet" href="resources/main/main_style.css">
<link rel="stylesheet" href="resources/main/main_swiper.css">

<main id="main">

	<section id="banner">
        
        <div class="slider">
           <div class="swiper-container swiper-container-initialized swiper-container-horizontal">
                <div class="swiper-wrapper" style="transition-duration: 0ms; transform: translate3d(-3038px, 0px, 0px);">
                    <div class="swiper-slide ss1" style="width: 1519px;">
                        <div class="container">
                            <div class="row">
                                <h3></h3>
                                <p></p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="swiper-slide ss2 swiper-slide-prev" style="width: 1519px;">
                        <div class="container">
                            <div class="row">
                                <h3></h3>
                                <p></p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="swiper-slide ss3 swiper-slide-active" style="width: 1519px;">
                        <div class="container">
                            <div class="row">
                                <h3></h3>
                                <p></p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-pagination swiper-pagination-bullets"><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet swiper-pagination-bullet-active"></span></div>
                <div class="swiper-button-prev" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="false"></div>
                <div class="swiper-button-next swiper-button-disabled" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></div>
            <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
        </div>
    </section>
    <!-- //banner -->
    
    
    <section id="movie" style="background-color:#120531;">
        <div class="container">
            <div class="row">
                <h2 class="ir_so">영화 예매</h2>
                <div class="movie">
                    <div class="movie_chart">
                        <div class="swiper-container2 swiper-container-initialized swiper-container-horizontal" style="display: block;">
                           <div class="chart_cont1 swiper-wrapper" style="transform: translate3d(-318px, 0px, 0px); transition-duration: 0ms;">
                               
                               <c:forEach var="weekly" items="${weeklyBoxOfficeList}" varStatus="status">
                               <div class="swiper-slide swiper-slide">
                                   <div class="poster" >
                                       <figure>
                                           <img src="${posters[status.index]}">
                                       </figure>
                                       <div class="rank"><strong>${status.count}</strong></div>
                                       <div class="mx">
                                           <span class="icon m ir_pm">MX</span>
                                           <span class="icon b ir_pm">Boutique</span>
                                       </div>
                                   </div>
                                   <div class="infor">
                                       <h3><span class="icon all ir_pm">전체관람가</span> <strong>${weekly.get('movieNm')}</strong></h3>
                                       <div class="infor_btn">
                                           <a href="movieDetail.mv?title=${weekly.get('movieNm')}&date=${weekly.get('openDt')}">상세정보</a>
                                           <a href="movieDetail.mv?title=${weekly.get('movieNm')}&date=${weekly.get('openDt')}" style="cursor: pointer;">예매하기</a>
                                       </div>
                                   </div>
                               </div>
                               </c:forEach>
                           </div>
                        <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
                    </div>
                </div>
            </div>
        </div>
    </section>  
</main>
<!-- End #main -->
<%@ include file="mainFooter.jsp"%>

<script>
        //배너 이미지 슬라이드
        var swiper = new Swiper('.swiper-container',{
            pagination: {
                el: '.swiper-pagination',
            },
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
            autoplay: {
                delay: 5000,
            },
        });
        
        //영화차트 이미지 슬라이드
        var swiper = new Swiper('.swiper-container2',{
            slidesPerView: 4,
            spaceBetween: 24,
//            mousewheel: {
//                invert: true,
//            },
            keyboard: {
                enabled: true,
                onlyInViewport: false,
            },
            autoplay: {
                delay: 6000,
            },
            breakpoints: {
                300: {
                    slidesPerView: 1.4,
                    spaceBetween: 24
                },
                600: {
                    slidesPerView: 2,
                    spaceBetween: 24
                },
                900: {
                    slidesPerView: 3,
                    spaceBetween: 24
                },
                1200: {
                    slidesPerView: 4,
                    spaceBetween: 24
                },
                1500: {
                    slidesPerView: 5,
                    spaceBetween: 24
                }
            }
        });
        
        
    </script>