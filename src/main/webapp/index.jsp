<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = (String)session.getAttribute("memId");
	String name = (String)session.getAttribute("memName");
	String email = (String)session.getAttribute("memEmail");
	
	System.out.println("session id: " + id);
	System.out.println("session name: " + name);
	System.out.println("session email: " + email);
	System.out.println();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구름: 홈</title>
<link rel="stylesheet" type="text/css" href="./css/index.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.3/dist/sweetalert2.min.css">
</head>
<body>
	<div id="headerwrap">
		<div id="header">
			<div id="topnav">
				<div id="topawrap">
					<%if (id != null) {%>
							<a href="./member/logout.jsp">로그아웃</a> |
							<a href="./member/infoForm.jsp">회원정보</a> |
							<a href="./index.do">홈</a>
					<%} else {%>
						    <a href="./index.jsp">로그인</a> |
							<a href="./index.do">홈</a>
					<%}%>
				</div>
			</div>
		<div id="logowrap">
			<div id="logo">
				<img src="./image/logo.png" alt="logo">
				<br/><span>구름</span>
			</div>
		</div>
		<div id="menunav">
			<ul>
				<li>여행지정보</li>
				<li>커뮤니티</li>
				<li>일정관리</li>
			</ul> 
		</div>
	</div>
		
	<div id="wrap">
	    <div id="container">
	        <div id="topcontent">
	            <div id="dogIM">
	                <div id="slideimg">
	                    <img id="slide" src="./image/rich1.jpg" alt="slideimg">
	                </div>
	            </div>
	            <div id="loginwrap">
					<div id="userinfo">
						<div id="insertinfo">
							<%if (id != null) {%>
                                    <span id="inserid"><%out.print(id + " (" + name + " 님)");%></span>
                                    
                                    </div>
                                    <div id="userbtn">
                            			<div id="loginwrapmenu">
                            				<a href="#">여행지 정보</a>|
		                            		<a href="#">커뮤니티</a>|
		                            		<a href="#">일정관리</a>|
		                            		<a href="./member/infoForm.jsp">회원정보</a>
                            			</div>
	                                	<input type="button" id="logoutbtn" value="로그아웃" onclick="location.href='./member/logout.jsp'">
									</div>  
							<%} else {
								out.print("로그인이 필요합니다.");%>
                                </div>
								<div id="userbtn">
									<input type="button" id="loginbtn1" value="로그인">
									<div id="loginawrap">
										<a class="seachId">아이디 찾기</a>|<a class="seachPwd">비밀번호 찾기</a>|<a href="./member/joinForm.do">회원가입</a>
									</div>
								</div>
							<%}%>
					</div>
				</div>
			</div>
			<div id="maincontent">
				<div id="hotboard">
					나는 hotboard
				</div>
				<div id="currentboard">
					나는 currentboard
				</div>
			</div>
		</div>
    </div>
	    
	    <div id="footer">
	        <div id="copyligth">
	            나는 카피라이트
	        </div>
	    </div>
	</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript">
$(function(){let slideIndex = 0;
	const images = ["./image/rich1.jpg", 
					"./image/rich2.jpg", 
					"./image/rich3.jpg",
					"./image/rich4.jpg",
					"./image/rich5.jpg",
					"./image/rich6.jpg"]; // 교체할 이미지 경로 배열
	const slide = document.getElementById("slide");

	function changeImage() {
	    slideIndex = (slideIndex + 1) % images.length;  // 배열의 다음 이미지로 인덱스 순환
	    slide.src = images[slideIndex];  // 이미지 변경
	}

	setInterval(changeImage, 4000);  // 3초마다 changeImage 함수 실행
	
	let id = '<%=id%>';
	
	console.log(id);
	if(id != null) {
		$("#inserid").click(function(){
			window.location.href = './member/infoForm.jsp';
		});
	}
	
	$("#logo > img").click(function() {
    	location.href="./index.do";
    });
	
	// 로그인 버튼 클릭 시 로그인 폼을 표시
    $("#loginbtn1").click(function() {
        // 기존 요소 숨기기
        $("#userinfo").hide();
    
        // 로그인 폼 추가 (한 번만 추가되도록 방지)
        if ($("#loginform").length === 0) {
            $("#loginwrap").append(`
                <form id="loginForm">
                <div id="loginform">
                    <div id="logoimg">
                        <img src="./image/logo.png" alt="loginlogo">
                        <span>구름 로그인</span>
                    </div>
                    <div id="inputwrap">
                        <div id="inwrap">
                            <input type="text" id="id" name="id" placeholder="아이디" maxlength="15" required="required">
                        </div>
                        <div id="pwdwrap">
                            <input type="password" id="pwd" name="pwd" placeholder="비밀번호" required="required">
                        </div>
                        <div id="checkinfo"></div>
                        <div id="btnwrap">
                            <input type="button" id="loginbtn2" value="로그인">
                        </div>
                        <div id="locationa">
                            <a class="seachId">아이디 찾기</a> |
                            <a class="seachPwd">비밀번호 찾기</a> |
                            <a href="../member/joinForm.do">회원가입</a>
                        </div>
                    </div>
                </div>
                </form>
            `);
        }
        
        $("#logoimg").click(function() {
            $("#loginform").remove(); // 폼 삭제
            $("#userinfo").show(); // 기존 요소 다시 보이기
        });
    });
    
    // 로그인 버튼 클릭 시 폼 중복 전송 방지
    $(document).on('click', "#loginbtn2", function(e) {
        e.preventDefault(); // 기본 폼 제출 방지

        // 입력값 확인
        if ($("#pwd").val() != '' && $("#id").val() != '') {
            // 로그인 버튼 비활성화 (중복 전송 방지)
            $(this).attr('disabled', true);

            // 폼 데이터 수집
            const formData = $('#loginForm').serialize();

            $.ajax({
                url: './member/login.jsp',
                method: 'POST',
                data: formData,
                success: function(data) {
                    let result = data.trim();
                    
                    if (result != 'err') {
                        let resultArray = result.split("|");
                        let id = resultArray[0];
                        let name = resultArray[1];
                        let email = resultArray[2];
                        
                        swal.fire({
                        	title : id + "님 환영합니다.",
                        	icon  : "success",
                        	customClass: {
                                confirmButton: 'custom-confirm2-button',  // 확인 버튼 클래스
                            },
                            buttonsStyling: false,  // 기본 스타일링 비활성화
                        	closeOnClickOutside : true
                        	}).then(function(){
                        	location.href="./index.do"
                        });
                        
                    } else {
                        $("#checkinfo").html('아이디 또는 비밀번호를 확인해주세요');
                        $('#loginbtn2').attr('disabled', false);  // 실패 시 버튼 다시 활성화
                    }
                },
                error: function(e) {
                    console.log(e);
                    swal.fire("서버와의 통신에 실패했습니다. 나중에 다시 시도해 주세요.","", {icon: "warning"});
                    $('#loginbtn2').attr('disabled', false);  // 오류 시 버튼 다시 활성화
                }
            });
        } else {
        	if($("#id").val() == "") {
        		$("#checkinfo").html("아이디를 입력해주세요.");
        	} else if($("#pwd").val() == "") {
        		$("#checkinfo").html("비밀번호를 입력해주세요.");
        	}          
        }
    });
    
    //아이디 찾기
    $(document).on('click', ".seachId", function() {
        Swal.fire({
            title: '아이디 찾기',
            html:
                '<input type="text" id="swal-name" class="swal2-input" placeholder="이름">' +
                '<input type="email" id="swal-email" class="swal2-input" placeholder="이메일">',
            focusConfirm: false,
            showCancelButton: true,
            confirmButtonText: '아이디 찾기',
            cancelButtonText: '취소',
            customClass: {
            	title: 'swal2-title-custom',
                text: 'swal2-text-custom',
                confirmButton: 'custom-confirm-button',  // 확인 버튼 클래스
                cancelButton: 'custom-cancel-button'     // 취소 버튼 클래스
            },
            buttonsStyling: false,  // 기본 스타일링 비활성화
            preConfirm: () => {
                const name = document.getElementById('swal-name').value;
                const email = document.getElementById('swal-email').value;
                if (!name) {
                    Swal.showValidationMessage('이름을 입력해 주세요.');
                    return false;
                } else if(!email) {
                	Swal.showValidationMessage('이메일을 입력해 주세요.');
                    return false;
                }
                return { name: name, email: email };
            }
        }).then((result) => {
            if (result.isConfirmed) {
                const name = result.value.name;
                const email = result.value.email;

                $.ajax({
                    url: './member/searchId.jsp', // 실제 서버 경로로 수정
                    type: 'POST',
                    data: { name: name, email: email },
                    success: function(response) {
                    	console.log(response);
                        Swal.fire({
                            title: '아이디 찾기 결과',
                            text: "당신의 아이디 : " + response,
                            customClass: {
                            	title: 'swal2-title-custom',
                                text: 'swal2-text-custom',
                                confirmButton: 'custom-confirm2-button',  // 확인 버튼 클래스
                            },
                            buttonsStyling: false,  // 기본 스타일링 비활성화
                        });
                    },
                    error: function() {
                        Swal.fire({
                            title: '서버와의 연결에 실패했습니다.',
                            text: '나중에 다시 시도해주세요',
                            icon: 'error',
                           	customClass: {
                            	title: 'swal2-title-custom',
                                text: 'swal2-text-custom',
								confirmButton: 'custom-confirm2-button',  // 확인 버튼 클래스
							},
							buttonsStyling: false,  // 기본 스타일링 비활성화
                        });
                    }
                });
            }
        });
    });
    
	//비밀번호 찾기
    $(document).on('click', ".seachPwd", function() {
        Swal.fire({
            title: '비밀번호 찾기',
            html:
            	'<input type="text" id="swal-id" class="swal2-input" placeholder="아이디">' +
            	'<input type="text" id="swal-name" class="swal2-input" placeholder="이름">' +
                '<input type="email" id="swal-email" class="swal2-input" placeholder="이메일">',
            focusConfirm: false,
            showCancelButton: true,
            confirmButtonText: '비밀번호 찾기',
            cancelButtonText: '취소',
            customClass: {
            	title: 'swal2-title-custom',
                text: 'swal2-text-custom',
                confirmButton: 'custom-confirm-button',  // 확인 버튼 클래스
                cancelButton: 'custom-cancel-button'     // 취소 버튼 클래스
            },
            buttonsStyling: false,  // 기본 스타일링 비활성화
            preConfirm: () => {
            	const id = document.getElementById('swal-id').value;
            	const name = document.getElementById('swal-name').value;
                const email = document.getElementById('swal-email').value;
                if (!id) {
                    Swal.showValidationMessage('아이디를 입력해 주세요.');
                    return false;
                } else if(!name) {
                	Swal.showValidationMessage('이름을 입력해 주세요.');
                	return false;
                } else if(!email) {
                	Swal.showValidationMessage('이메일을 입력해 주세요.');
                	return false;
                }
                return { id : id, name: name, email: email };
            }
        }).then((result) => {
            if (result.isConfirmed) {
            	const id = result.value.id;
            	const name = result.value.name;
                const email = result.value.email;

                $.ajax({
                    url: './member/searchPwd.jsp', // 실제 서버 경로로 수정
                    type: 'POST',
                    data: { id: id, name: name, email: email },
                    success: function(response) {
                    	console.log(response);
                        Swal.fire({
                            title: '비밀번호 찾기 결과',
                            text: "당신의 비밀번호 : " + response,
                            customClass: {
                            	title: 'swal2-title-custom',
                                text: 'swal2-text-custom',
                                confirmButton: 'custom-confirm2-button',  // 확인 버튼 클래스
                            },
                            buttonsStyling: false,  // 기본 스타일링 비활성화
                        });
                    },
                    error: function() {
                        Swal.fire({
                            title: '서버와의 연결에 실패했습니다.',
                            text: '나중에 다시 시도해주세요',
                            icon: 'error',
                           	customClass: {
								confirmButton: 'custom-confirm2-button',  // 확인 버튼 클래스
							},
							buttonsStyling: false,  // 기본 스타일링 비활성화
                        });
                    }
                });
            }
        });
    });
});
</script>
</body>
</html>
