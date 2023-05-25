<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ page trimDirectiveWhitespaces="true" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
          <c:import url="/WEB-INF/views/inc/top.jsp" />
          <style>
            .main .content-container .homemain {
              display: flex;
              justify-content: space-between;
            }
            .ad-container {
              width: 1000px;
              height: 200px;
              margin: 40px auto 100px auto;
            }
            .ad,
            .ad .ad-item {
              width: 1000px;
              height: 200px;
            }
            .ad .ad-item img {
              width: 1000px;
              height: 200px;
              object-fit: cover;
            }

            /* 메인화면 왼쪽 관리 요령 */
            .tip-container {
              width: 500px;
              position: relative;
              margin: 0 auto 100px auto;
            }

            .tip,
            .tip .tip-item {
              width: 100%;
              height: 100%;
            }

            .tip .tip-item img {
              width: 100%;
              height: 100%;
              object-fit: cover;
            }
            /* slick 화살표 css */
            .slick-prev,
            .slick-next {
              position: absolute;
              top: 50%;
              display: block;
              width: 21px;
              height: 20px;
              padding: 0;
              -webkit-transform: translate(0, -50%);
              transform: translate(0, -50%);
              cursor: pointer;
              color: transparent;
              border: none;
              outline: none;
              background: transparent;
            }

            .slick-prev:hover,
            .slick-prev:focus,
            .slick-next:hover,
            .slick-next:focus {
              color: transparent;
              outline: none;
              background: transparent;
            }

            .slick-prev:hover:before,
            .slick-prev:focus:before,
            .slick-next:hover:before,
            .slick-next:focus:before {
              opacity: 1;
            }

            .slick-prev.slick-disabled:before,
            .slick-next.slick-disabled:before {
              opacity: .25;
            }

            .slick-prev:before,
            .slick-next:before {
              display: block;
              line-height: 1;
              font-family: 'slick';
              font-size: 30px;
              opacity: .50;
              color: white;
              background-color: gray;
              -webkit-font-smoothing: antialiased;
            }

            .slick-prev {
              left: 0px;
              position: relative;
              z-index: 9999;
            }

            .slick-prev:before {
              content: '<';
            }

            .slick-next {
              right: 0px;
            }

            .slick-next:before {
              content: '>';
            }
            
            /* slick dots css */
            .slick-dots {
              position: absolute;
              display: block;
              width: 100%;
              padding: 0;
              margin: 0;
              list-style: none;
              text-align: center;
            }

            .slick-dots li {
              position: relative;
              display: inline-block;
              width: 20px;
              height: 20px;
              margin: 0 5px;
              padding: 0;
              cursor: pointer;
            }

            .slick-dots li button {
              font-size: 0;
              line-height: 0;
              display: block;
              width: 20px;
              height: 20px;
              padding: 5px;
              cursor: pointer;
              color: transparent;
              border: 0;
              outline: none;
              background: transparent;
            }

            .slick-dots li button:hover,
            .slick-dots li button:focus {
              outline: none;
            }

            .slick-dots li button:hover:before,
            .slick-dots li button:focus:before {
              opacity: 1;
            }

            .slick-dots li button:before {
              font-family: 'slick';
              font-size: 10px;
              line-height: 20px;
              position: absolute;
              top: 0;
              left: 0;
              width: 20px;
              height: 20px;
              content: '■';
              text-align: center;
              opacity: .25;
              color: black;
              -webkit-font-smoothing: antialiased;
            }

            .slick-dots li.slick-active button:before {
              opacity: .75;
              color: black;
            }

            /* 메인화면 중앙 로그인/회원가입 */
            .login {
              width: 100px;
            }

            .login a {
              text-decoration: none;
              color: black;
              display: block;
              width: 150px;
              height: 30px;
              padding-top: 5px;
              margin: auto;
            }

            .login a {
              background-color: #0039f5;
              color: white;
              margin-bottom: 40px;
              transition: all 0.5s;
            }

            .login a:hover {
              background-color: #f7f7f7;
              color: black;
              border: 1px solid black;
            }


            .booking {
              margin-right: 50px;
            }
            .booking h1 {
              margin-bottom: 50px;
              font-size: 20px;
            }
            .booking table {
              margin: auto;
              width: 400px;
              line-height: 3;
            }
          </style>
          <div class="ad-container">
            <div class="ad">
              <div class="ad-item">
                <img src="${contextPath}/assets/img/ad1.jpg" />
              </div>
              <div class="ad-item">
                <img src="${contextPath}/assets/img/ad2.jpg" />
              </div>
              <div class="ad-item">
                <img src="${contextPath}/assets/img/ad3.jpg" />
              </div>
              <div class="ad-item">
                <img src="${contextPath}/assets/img/ad4.jpg" />
              </div>
              <div class="ad-item">
                <img src="${contextPath}/assets/img/ad5.jpg" />
              </div>
            </div>
          </div>

          <div class="homemain">
            <div class="tip-container">
              <div class="login"> <!-- 메인 가운데 로그인/회원가입 -->
                <a href="${contextPath}/login">Log In</a>
              </div>
              <!-- 요령 slick 본체-->
              <div class="tip">
                <div class="tip-item">
                  <img src="${contextPath}/assets/img/2.jpg" />
                </div>
                <div class="tip-item">
                  <img src="${contextPath}/assets/img/3.jpg" />
                </div>
                <div class="tip-item">
                  <img src="${contextPath}/assets/img/4.jpg" />
                </div>
                <div class="tip-item">
                  <img src="${contextPath}/assets/img/5.jpg" />
                </div>
              </div>
            </div>

            

            <div class="booking">
              <h1>오늘의 예약 현황</h1>
              <table>
                <tr>
                  <th colspan="3">2023년 X월 XX일 X요일</th>
                </tr>
                <tr>
                  <th>시간</th>
                  <th>차종</th>
                  <th>이름</th>
                </tr>
                <tr>
                  <td>09:00</td>
                  <td>OK자동차</td>
                  <td>11가1111 가X다 고객님</td>
                </tr>
                <tr>
                  <td>09:30</td>
                  <td>OK자동차</td>
                  <td>11가1111 가X다 고객님</td>
                </tr>
                <tr>
                  <td>10:00</td>
                  <td>OK자동차</td>
                  <td>11가1111 가X다 고객님</td>
                </tr>
                <tr>
                  <td>10:30</td>
                  <td>OK자동차</td>
                  <td>11가1111 가X다 고객님</td>
                </tr>
                <tr>
                  <td>11:00</td>
                  <td>OK자동차</td>
                  <td>11가1111 가X다 고객님</td>
                </tr>
                <tr>
                  <td>13:00</td>
                  <td>OK자동차</td>
                  <td>11가1111 가X다 고객님</td>
                </tr>
                <tr>
                  <td>14:00</td>
                  <td>OK자동차</td>
                  <td>11가1111 가X다 고객님</td>
                </tr>
                <tr>
                  <td>15:00</td>
                  <td>OK자동차</td>
                  <td>11가1111 가X다 고객님</td>
                </tr>
                <tr>
                  <td>16:00</td>
                  <td>OK자동차</td>
                  <td>11가1111 가X다 고객님</td>
                </tr>
                <tr>
                  <th>17:00</td>
                  <td>OK자동차</td>
                  <td>11가1111 가X다 고객님</td>
                </tr>
              </table>
            </div>
          </div>

          <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
          <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

          <script>
            $(document).ready(function () {
              $('.ad').slick({
                slidesToShow: 1,
                slidesToScroll: 1,
                autoplay: true,
                autoplaySpeed: 2000,
                arrows: false,
                dots: false
              });
            });
            $(document).ready(function () {
              $('.tip').slick({
                slidesToShow: 1,
                slidesToScroll: 1,
                autoplay: true,
                autoplaySpeed: 3000,
                dots: true,
                arrows: true,
                prevArrow: "<button type='button' class='slick-prev'><</button>",
                nextArrow: "<button type='button' class='slick-next'>></button>",
                dotsClass: "slick-dots"
              });
            });

          </script>
          <c:import url="/WEB-INF/views/inc/bottom.jsp" />