<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="mainHeader.jsp"%>
<link rel="stylesheet" href="resources/main/main_reset.css">
<link rel="stylesheet" href="resources/main/main_style.css">
<link rel="stylesheet" href="resources/main/main_swiper.css">
<style>
	body{
		margin-top: 49px;
	}
</style>
<main id="main">

	<section id="banner" style="padding:0px">
        
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
    
    
    <section id="movie" style="background-color:#120531; padding:0px">
        <div class="container">
            <div class="row">
                <h2 class="ir_so">영화 예매</h2>
                <div class="movie">
                <h2 style="color: #FFF;text-align: center;padding: 30px;">박스 오피스</h2>
                    <div class="movie_chart">
                        <div class="swiper-container2 swiper-container-initialized swiper-container-horizontal" style="display: block;">
                           <div class="chart_cont1 swiper-wrapper" style="transform: translate3d(-318px, 0px, 0px); transition-duration: 0ms;">
                               
                               <c:forEach var="weekly" items="${weeklyBoxOfficeList}" varStatus="status">
                               <div class="swiper-slide swiper-slide">
                                   <div class="poster" style="height:350px">
                                       <figure style="margin: 0;">
                                           <img style="width: 100%;height:350px;" src="${posters[status.index]}">
                                       </figure>
                                       <div class="rank"><strong>${status.count}</strong></div>
                                   </div>
                                   <div class="infor">
                                       <div class="tit-area" style="margin:0">
										<c:if test="${ratings[status.index] eq '18세관람가'}">
											<img
												src="https://img.megabox.co.kr/static/pc/images/common/txt/18_46x46.png"
												width="23px" height="23px">
										</c:if>
										<c:if test="${ratings[status.index] eq '15세관람가'}">
											<img
												src="https://img.megabox.co.kr/static/pc/images/common/txt/15_46x46.png"
												width="23px" height="23px">
										</c:if>
										<c:if test="${ratings[status.index] eq '12세관람가'}">
											<img
												src="https://img.megabox.co.kr/static/pc/images/common/txt/12_46x46.png"
												width="23px" height="23px">
										</c:if>
										<c:if
											test="${ratings[status.index] ne '18세관람가' &&  ratings[status.index] ne '12세관람가' && ratings[status.index] ne '15세관람가'}">
											<img
												src="https://img.megabox.co.kr/static/pc/images/common/txt/ALL_46x46.png"
												width="23px" height="23px">
										</c:if>
									 <strong style="color:#000;" class="tit">${weekly.get('movieNm')}</strong>
									</div>
                                       <div class="infor_btn" style="margin-top: 15px;">
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