<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.model.BoardBean"%>
<%@page import="board.model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../common/common.jsp"%>
<%@ include file="../main/mainHeader.jsp"%>
<%@ include file="../mypage/mypageSidebar.jsp"%>

<style type="text/css">
	body, table{
		text-align: center;
	}
	table{
		margin: auto;
		width: 630px;
		height: 50px;
	}
	td{
		width: 30%;
		height: 30px;
	}
	th{
		width: 15%;
		height: 40px;
	}
  
  .search-form {
  width: 80%;
  margin: 0 auto;
  margin-top: 1rem;
}

.search-form input {
  height: 100%;
  background: transparent;
  border: 0;
  display: block;
  width: 100%;
  padding: 1rem;
  height: 100%;
  font-size: 1rem;
}

.search-form select {
  background: transparent;
  border: 0;
  padding: 1rem;
  height: 100%;
  font-size: 1rem;
}

.search-form select:focus {
  border: 0;
}

.search-form button {
  height: 100%;
  width: 100%;
  font-size: 1rem;
}

.search-form button svg {
  width: 24px;
  height: 24px;
}

.card-margin {
  margin-bottom: 1.875rem;
}

@media (min-width: 992px) {
  .col-lg-2 {
    flex: 0 0 16.66667%;
    max-width: 16.66667%;
  }
}

.card {
  border: 0;
  box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
  -webkit-box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
  -moz-box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
  -ms-box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
}

.card {
  position: relative;
  display: flex;
  flex-direction: column;
  min-width: 0;
  word-wrap: break-word;
  background-color: #ffffff;
  background-clip: border-box;
  border: 1px solid #e6e4e9;
  border-radius: 8px;
}

    </style>


<main class="container">
<div class="col-lg-9" style="padding: 20px;">
	<div class="card info-card customers-card">
		<div class="card-body align-items-center justify-content-center">
    <header class="py-5 text-center">
        <h4>FAQ 상세내용</h4>
    </header>

	  <div class="form-group">
  <h4>제목 : ${board.question}</h4>
  </div><br><br>


    <div class="row g-5">
        <section class="col-md-3 col-lg-4 order-md-last">
            <aside style="text-align: left;">
                <p>번호 : ${board.movie_num}</p>
                <p>항목 : ${board.classification}</p>
                
                <c:if test="${loginInfo.member_id eq 'admin'}">
                <p><a>이메일 : ${loginInfo.member_email }</a></p>
                </c:if>
                <p>
                    <time>
                    작성일 : <fmt:formatDate value="${board.qdate}" type="date" pattern="yyyy-MM-dd"/>
                    </time>
                </p>
                <p>조회수 : ${board.hits}</p>
            </aside>
        </section>

        <article id="article-content" class="col-md-9 col-lg-8">
            <pre><textarea cols="45" rows="20" style="resize: none;" readonly>${board.content}</textarea></pre>
        </article>


    </div>
    </div>

    <div class="row 9-5">
        <sectoin>
            <form class="row g-3" style="margin-left: 20px;"> 
				<!-- 
                <div class="col-md-9 col-lg-8">
                    <label for="articleComment" hidden>댓글</label>
                    <textarea class="form-control" id="articleComment" placeholder="답글 작성" 
                    rows="3" style="resize: none;" required></textarea>
                </div>
                
                 -->
                <div class="col-md-3 col-lg-4" style="margin:auto; margin-bottom: 50px;">
                    <label for="comment-submit" hidden>댓글 쓰기</label>
                    
                    <c:if test="${loginInfo.member_id eq 'admin'}">			
                    <button class="btn btn-primary" id="FAQcomment-submit" type="button" onClick="location.href='faqUpdate.bd?movienum=${board.movie_num}'">관리자 수정</button>
					</c:if>
                    <button class="btn btn-primary" id="FAQcomment-submit" type="reset" onClick="location.href='faq.admin'">목록으로</button>
                </div>

            </form>
            
            <!-- 
            <ul id="article-comments" class="row col-md-10 col-lg-8 pt-3" style="margin-left: 20px;">
                <li>
                    <form>
                        <input hidden class="article-id">
                        <div class="row">
                            <div class="row col-md-10 col-lg-9">
                                <strong>Jyc</strong>
                                <small>
                                    <time>2022-01-01</time>
                                </small>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.<br>
                                    Lorem ipsum dolor sit amet
                                </p>
                            </div>
                        </div>
                    </form>
                </li>
                <li>
                    <form>
                        <input hidden class="article-id">
                        <div class="row">
                            <div class="row col-md-10 col-lg-9">
                                <strong>Jyc</strong>
                                <small>
                                    <time>2022-01-01</time>
                                </small>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.<br>
                                    Lorem ipsum dolor sit amet
                                </p>
                            </div>
                        </div>
                    </form>
                </li>
            </ul>
             -->

        </sectoin>
    </div>


</div>
</div>
</div>
</div>
</div>
</section>

</main>


</main>


<%@ include file="../main/mainFooter.jsp"%>




