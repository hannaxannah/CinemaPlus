<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/mainHeader.jsp"%>
<%@ include file="mypageSidebar.jsp"%>
					<div class="col-lg-9" style="padding: 20px;">
						<!-- 회원 상세 정보 요약 -->
							<div class="card info-card customers-card">
								<div class="card-body align-items-center justify-content-center">
									<ul class="nav nav-tabs" id="myTab" role="tablist">
									  <li class="nav-item" role="presentation">
									    <button class="nav-link active" id="reservation-tab" data-bs-toggle="tab" data-bs-target="#reservation-tab-pane" type="button" role="tab" aria-controls="reservation-tab-pane" aria-selected="true">예매내역</button>
									  </li>
									  <li class="nav-item" role="presentation">
									    <button class="nav-link" id="purchase-tab" data-bs-toggle="tab" data-bs-target="#purchase-tab-pane" type="button" role="tab" aria-controls="purchase-tab-pane" aria-selected="false">구매내역</button>
									  </li>
									</ul>
									<div class="tab-content" id="myTabContent">
									  <div class="tab-pane fade show active" id="reservation-tab-pane" role="tabpanel" aria-labelledby="reservation-tab" tabindex="0" style="display:flex;flex-flow:column;padding-top:20px;">
									  	<div style="width:100%;">
									  		<div class="my-reservation-search">
									  			<a style="font-size:1.1rem;font-weight:600;padding-right:20px;">조회기간</a>
									  			<input type="date" class="my-reservation-search-date">
									  			<a style="font-size:1.1rem;font-weight:600;padding:0 10px;">~</a>
									  			<input type="date" class="my-reservation-search-date">
									  			<input type="submit" class="my-search" value="검색">
									  		</div>
									  		<div style="width: 100%;display: flex;flex-direction: row-reverse;">
									  			<ol>
											      <li><a href="" style="color:#6B39EA;font-size:1rem;">예매내역</a></li>
											      <li><a href="" style="font-size:1rem;">취소내역</a></li>
											      <!-- 선택한 순서일 때, 글자색: #6B39EA, 원래: #FCFBFF -->
											    </ol>
											</div>
								            <div style="width: 100%;display: flex;">
								              <!-- Table -->
								              <table class="table">
								                <thead>
								                  <tr>
								                    <th scope="col" width="10%">번호</th>
								                    <th scope="col" width="20%">예매번호</th>
								                    <th scope="col" width="20%">영화관</th>
								                    <th scope="col" width="25%">영화</th>
								                    <th scope="col" width="25%">상영일</th>
								                  </tr>
								                </thead>
								                <tbody>
								                  <tr>
								                    <th scope="row">1</th>
								                    <td>Brandon Jacob</td>
								                    <td>Designer</td>
								                    <td>28</td>
								                    <td>2016-05-25</td>
								                  </tr>
								                  <tr>
								                    <th scope="row">2</th>
								                    <td>Bridie Kessler</td>
								                    <td>Developer</td>
								                    <td>35</td>
								                    <td>2014-12-05</td>
								                  </tr>
								                  <tr>
								                    <th scope="row">3</th>
								                    <td>Ashleigh Langosh</td>
								                    <td>Finance</td>
								                    <td>45</td>
								                    <td>2011-08-12</td>
								                  </tr>
								                  <tr>
								                    <th scope="row">4</th>
								                    <td>Angus Grady</td>
								                    <td>HR</td>
								                    <td>34</td>
								                    <td>2012-06-11</td>
								                  </tr>
								                  <tr>
								                    <th scope="row">5</th>
								                    <td>Raheem Lehner</td>
								                    <td>Dynamic Division Officer</td>
								                    <td>47</td>
								                    <td>2011-04-19</td>
								                  </tr>
								                </tbody>
								              </table>
								              <!-- Table -->
								            </div>
									  	</div>
									  </div>
									  <div class="tab-pane fade" id="purchase-tab-pane" role="tabpanel" aria-labelledby="purchase-tab" tabindex="0">
									  	<div style="width:100%;">
									  		<div class="my-reservation-search">
									  			<a style="font-size:1.1rem;font-weight:600;padding-right:20px;">조회기간</a>
									  			<input type="date" class="my-reservation-search-date">
									  			<a style="font-size:1.1rem;font-weight:600;padding:0 10px;">~</a>
									  			<input type="date" class="my-reservation-search-date">
									  			<input type="submit" class="my-search" value="검색">
									  		</div>
									  		<div style="width: 100%;display: flex;flex-direction: row-reverse;">
									  			<ol>
											      <li><a href="" style="color:#6B39EA;font-size:1rem;background:#FCFBFF;">구매내역</a></li>
											      <li><a href="" style="font-size:1rem;background:#FCFBFF;">취소내역</a></li>
											      <!-- 선택한 순서일 때, 글자색: #6B39EA, 원래: #FCFBFF -->
											    </ol>
											</div>
								             <div style="width: 100%;display: flex;">
								              <!-- Table -->
								              <table class="table">
								                <thead>
								                  <tr>
								                    <th scope="col" width="10%">번호</th>
								                    <th scope="col" width="20%">결제번호</th>
								                    <th scope="col" width="50%">상품명</th>
								                    <th scope="col" width="20%">결제일</th>
								                  </tr>
								                </thead>
								                <tbody>
								                  <tr>
								                    <th scope="row">1</th>
								                    <td>Brandon Jacob</td>
								                    <td>Designer</td>
								                    <td>2016-05-25</td>
								                  </tr>
								                  <tr>
								                    <th scope="row">2</th>
								                    <td>Bridie Kessler</td>
								                    <td>Developer</td>
								                    <td>2014-12-05</td>
								                  </tr>
								                  <tr>
								                    <th scope="row">3</th>
								                    <td>Ashleigh Langosh</td>
								                    <td>Finance</td>
								                    <td>2011-08-12</td>
								                  </tr>
								                  <tr>
								                    <th scope="row">4</th>
								                    <td>Angus Grady</td>
								                    <td>HR</td>
								                    <td>2012-06-11</td>
								                  </tr>
								                  <tr>
								                    <th scope="row">5</th>
								                    <td>Raheem Lehner</td>
								                    <td>Dynamic Division Officer</td>
								                    <td>2011-04-19</td>
								                  </tr>
								                </tbody>
								              </table>
								              <!-- Table -->
								             </div>
									  	</div>
									  </div>
									</div>
							</div>
						</div>
			</div>
		</div>
	</div>
</section>

</main>
<!-- End #main -->
<%@ include file="../main/mainFooter.jsp"%>