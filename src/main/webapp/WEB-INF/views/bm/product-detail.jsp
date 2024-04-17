<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Product detail</title>
</head>
<script>
let pvo = ${pvoJson}; 
const path = "${path}";
</script>
<script defer src="${path}/resources/public/js/bm/detail.js"></script>
<link href="${path}/resources/public/css/bm/detail.css" rel="stylesheet" />
<body>
	<%@ include file="../js/header.jsp"%>

	<main class="products">
        <div class="cart-container hidden">
          <div class="cart-container--1">
           
                <div class="cart-detail cart-detail--1"><span class="quantity-incart"></span> item in cart</div>
                <div class="cart-detail cart-detail--2">subtotal <span class="subtotal-incart"></span></div>

          </div>
          <div class="cart-container--2">
            <a href="cart.do" class="btn-cart btn-cart--viewcart">view/edit cart</a>
             <button class="btn-cart btn-cart--cancel">remove item</button> 
          </div>
        </div>

        
        <div class="product-detail">                       
                <div class="slide">
                    <div class="slide-img">
                        
                    </div>
        
                  <button class="slider__btn slider__btn--left">&larr;</button>
                  <button class="slider__btn slider__btn--right">&rarr;</button>
                  <div class="dots"></div>
                </div>
           

            <div class="product-detail--sup">
                <div class="product-detail-sub product-detail-sub--1">
                    <h3 class="product-heading"> name </h3>
                    <c:choose>
                    <c:when test="${count == 0}">
                    <p class="product-rating">상품 만족도 (${count} review)</p>
                    </c:when>
                    <c:otherwise>
                    <a href="reviewAll.do?pro_idx=${pvo.pro_idx}" class="product-rating">상품 만족도 (${count} reviews) ${starRating } </a>
                    </c:otherwise>
                    </c:choose>
                    <p class="product-text"></p>
                </div>
                <div class="product-detail-sub product-detail-sub--2">
                   <span class="product-detail--price"></span><span>&#8361;</span>
                </div>
                <div class="product-detail--select">
                    <span class="label label-size"> size </span>
                    <select class="product-size">
                        <option value="0" class="size-s">small</option>
                        <option value="1" class="size-m">medium</option>
                        <option value="2" class="size-l">large</option>
                    </select>
    
                    <div class="product-quantity">
                        <span class="label label-quantity"> quantity </span>
                        <button class="btn product-quantity-minus">-</button>
                         <span class="small-label quantity">1</span>
                        <button class="btn product-quantity-plus">+</button>
                    </div>
                </div>
                <div class="product-incart hidden">
                    <span>&#10004;in cart</span>
                
                </div>
    
                <div class="btns-product">
                    <button class="btn-product btn-add">add to cart</button>                  
                    <a href="products.do?pro_type=${pvo.pro_type}" class="btn-product btn-shopping">keep shopping</a>                  
                </div>
            </div>
        
        </div>
        
        
        <div class="purchase-info-contatiner">
        <div class="btns-container">
            <button class="btn-purchase-info" data-content="1">shipping</button>
            <button class="btn-purchase-info" data-content="2">exchange/refund</button>
            <button class="btn-purchase-info" data-content="3">size</button>
            <button class="btn-purchase-info" data-content="4">review</button>

        </div>
        <div class="purchase-info">
            <div class="purchase-content purchase-content--1">
                <h4 class="purchase-heading">배송안내</h4>
                <p class="purchase-text"> 
                    CJ대한통운 또는 한진택배를 이용합니다. <br>
                    배송비 : 무료배송 <br>
                    배송 기간 : 2일 ~ 5일 (택배사 사정에 따라 배송이 지연될 수 있습니다.) <br>
                    오후 2시 이전 주문 건은 당일 발송 처리되며, 오전 10시 오후 2시 하루 두 번 출고가 진행되므로, <br>
                    해당 시간 이전 주문 건들은 출고 시간이 지난 경우 주문 취소가 불가하여 수령 후 반품 접수 해주시기 바랍니다. <br>
                    (ex. 10시 이전 주문 건 10시 이후 취소 불가, 10시~2시 사이 주문 건 2시 이후 취소 불가)    <br>               
                </p>
            </div>  
            <div class="purchase-content purchase-content--2">
                <h4 class="purchase-heading">환불/교환정책</h4>
                <p class="purchase-text">
                    교환은 반품 후 재주문을 통해 가능합니다. <br>
                    상품 수령 후 7일 이내 마이페이지 주문내역에서 반품 접수해주세요. <br>
                    색상 및 사이즈 오차 등 단순변심에 의한 반품은 고객님께 배송비가 부과됩니다. <br>
                    고객님의 부주의로 인한 스크래치, 손상, 구김, 이염 등은 교환, 반품 사유에 해당하지 않습니다. <br>
                    제품을 보내실 때는 수령한 상태 그대로 재포장 되어야 하며, 동봉되어 있던 반품 신청서를 작성하여 발송해 주셔야 빠르게 검수가 가능합니다. <br>
                    (반품시 보내드린 사은품이 동봉하지 않을 경우, 환불이 불가하며 상품이 반송되어 추가 배송비가 발생합니다.) <br>
           
                    </p>
                 
            </div>  
            <div class="purchase-content purchase-content--3">
                <h4 class="purchase-heading">size detail</h4>
                <p class="purchase-text">
                   <span class="size-s">s</span>53-55 cm
                   <span class="size-m">m</span>56-58 cm
                   <span class="size-l">l</span>59-61 cm
                </p>
            </div>
            <div class="purchase-content purchase-content--4">
 
   <c:choose>
        <c:when test="${empty reviews}">
            <p>작성된 리뷰가 없습니다.</p>
        </c:when>
        
        <c:otherwise>
            <div class="review-rating">
                <span class="review-count">상품 만족도 (${count} reviews) </span>
                <span class="star-rating">${avg}/5.0 ${starRating }</span>
            </div>
            <c:forEach var="r" items="${reviews}">
                <div class="review-img-container">     
                    <a href="${path}/resources/upload/${r.review_file}" class="user-imgurl">
                        <img src="${path}/resources/upload/${r.review_file}" style="width: 100px" class="user-img">
                    </a>
                </div>
            </c:forEach>
            
            <c:forEach var="img" items="${reviews}">
                <div class="user-review">
                    <div class="review-header">    
                        <div class="user-info">
                            <c:set var="hiddenId" value="${img.member_id.substring(0, img.member_id.length() - 2)}**" />
                            <span class="user-id">${hiddenId}</span>
                            <span class="user-rate"> 
                                <c:forEach var="i" begin="1" end="${img.rating}">&#9733;</c:forEach>
                            </span>
                        </div>
                        <div class="date">${img.review_regdate }</div>
                    </div>   
                    <div class="review-content">
                        <c:set var="shortContent" value="${fn:substring(img.review_content, 0, 50)}" />
                        <span class="review-content">${shortContent}...</span>
                    </div> 
                </div>  
            </c:forEach>
    <a href="reviewAll.do?pro_idx=${pvo.pro_idx}" class="more-review">more reviews</a>
        </c:otherwise>
    </c:choose>
    <a href="review.do?pro_idx=${pvo.pro_idx}" class="more-review">임시버튼 리뷰</a>

               
            </div>
        </div> 
    </div>
    </main>
	<footer class="footer">
		<%@ include file="../hj/footer.jsp"%>
</footer>

</body>
</html>
