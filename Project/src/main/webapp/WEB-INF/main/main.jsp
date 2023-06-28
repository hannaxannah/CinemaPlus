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
	a{
		color:#000;
	}
	li{
		list-style:none;
	}
	.div_title{
	    height: auto;
	    margin: 0;
	    font-weight: 700;
	    font-size: 26px;
	    line-height: 1.423em;
	    background-image: none;
	    color: #000;
	    padding: 30px; 
	}
	
	#contaniner .contents {
	    width: 1300px;
	    height: 100%;
	    margin: 0 auto;
	}
	
	.giftcon_list_wrap {
	    display: flex;
	}
	
	.giftcon_list_wrap > li {
	    width: 375px;
	    padding: 20px 19px 0px;
	    border: 1px solid #e4e4e4;
	    border-radius: 10px;
	}
	
	.giftcon_list dt {
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
	    font-weight: 500;
	    font-size: 20px;
	    color: #222;
	    line-height: 1.450em;
	    font-weight: bold;
	}
	.giftcon_list dt .btn_more {
	    padding: 2px 15px 3px;
	    font-weight: 400;
	    font-size: 12px;
	    color: #666;
	    line-height: 1.417em;
	    border: 1px solid #f4f4f4;
	    border-radius: 11px;
	}
	.giftcon_list dd a {
	    display: flex;
	    justify-content: left;
	    align-items: center;
	}
	.giftcon_list dd a .img_wrap {
	    position: relative;
	    width: 150px;
	    height: 150px;
	    border-radius: 5px;
	}
	.giftcon_list_wrap > li ~ li {
	    margin-left: 30px;
	}
	.img_wrap > img {
	    position: absolute;
	    left: 0;
	    top: 50%;
	    width: 100%;
	    height: 100%;
	    object-fit: cover;
	    transform: translate(0, -50%);
	}
	.giftcon_list dd a .giftcon_info_wrap {
	    display: inline-flex;
	    flex-direction: column;
	    padding-left: 15px;
	}
	.giftcon_list dd a .giftcon_info_wrap span {
	    font-weight: 500;
	    font-size: 14px;
	    color: #222;
	    line-height: 1.429em;
	}
	.giftcon_list dd a .giftcon_info_wrap strong {
	    font-weight: 700;
	    font-size: 16px;
	    color: #222;
	    letter-spacing: -0.020em;
	    line-height: 1.444em;
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
    
    <section style="background: #FFF;padding: 30px 0 21px;">
    	<div class="store">
                <div class="contents" style="width: 1300px;height: 100%;margin: 0 auto;">
		    	 <h2 class="div_title">스토어</h2>
                    <div class="giftcon_wrap">
                <div class="contents">
                    <ul class="giftcon_list_wrap">
                        <li>
                        
                            <dl class="giftcon_list">
                                <dt>기프트카드<a href="categorylist.store?category_name=기프트카드" class="btn_more">더보기</a></dt>
                                <c:forEach var="giftlist" items="${giftlist}" end="2">
                                <dd>
                                    <a href="productDetail.store?product_code=${giftlist.product_code}">
                                        <div class="img_wrap" data-scale="false"><img src="<%=request.getContextPath()%>/resources/store_images/${giftlist.product_image}"></div>
                                        <div class="giftcon_info_wrap">
                                            <span>${giftlist.product_name}</span>
                                            <strong>${giftlist.product_sprice}원</strong>
                                        </div>
                                    </a>
                                </dd>
                                </c:forEach>
                               
                            </dl>
                        </li>
                        
                        <li>
                            <dl class="giftcon_list">
                               	<dt>영화티켓<a href="categorylist.store?category_name=영화티켓" class="btn_more">더보기</a></dt>
                                <c:forEach var="ticketlist" items="${ticketlist}" end="2">
                                <dd>
                                    <a href="productDetail.store?product_code=${ticketlist.product_code}">
                                        <div class="img_wrap" data-scale="false"><img src="<%=request.getContextPath()%>/resources/store_images/${ticketlist.product_image}"></div>
                                        <div class="giftcon_info_wrap">
                                            <span>${ticketlist.product_name}</span>
                                            <strong>${ticketlist.product_sprice}원</strong>
                                        </div>
                                    </a>
                                </dd>
                                </c:forEach>
                            </dl>
                        </li>
                        
                        <li>
                            <dl class="giftcon_list">
                                <dt>팝콘/음료/스낵<a href="categorylist.store?category_name=팝콘/음료/스낵" class="btn_more">더보기</a></dt>
                                <c:forEach var="snacklist" items="${snacklist}" end="2">
                                <dd>
                                    <a href="productDetail.store?product_code=${snacklist.product_code}">
                                        <div class="img_wrap" data-scale="false">
                                        <img style="width:130px;height:120px;" src="<%=request.getContextPath()%>/resources/store_images/${snacklist.product_image}"></div>
                                        <div class="giftcon_info_wrap">
                                            <span>${snacklist.product_name}</span>
                                            <strong>${snacklist.product_sprice}원</strong>
                                        </div>
                                    </a>
                                </dd>
                                </c:forEach>
                            </dl>
                        </li>
                        
                    </ul>
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