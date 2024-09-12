$(document).ready(function() {
	// 홈페이지로 돌아가는 함수
	$("img[alt='logo']").click(function(){
		location.href="../index.do";
	});
	
    // 특정 필드를 검사하고, 오류 메시지를 #checkinput에 추가하는 함수
    function validateField(field) {
        const id = $(field).attr('id');
        const value = $(field).val().trim();
        let message = '';

        // 필수 입력란만 검사
        if ($(field).prop('required')) {
            // 필드 값이 비어있는 경우 메시지 설정 및 포커스 이동
            if (value === '') {
                if (id === 'id') {
                    message = '아이디는 필수 입력란입니다.';
                } else if (id === 'pwd') {
                    message = '비밀번호는 필수 입력란입니다.';
                } else if (id === 'repwd') {
                    message = '비밀번호 확인은 필수 입력란입니다.';
                } else if (id === 'name') {
                    message = '이름은 필수 입력란입니다.';
                }
                // 이미 메시지가 있는지 확인
                if (!$(field).data('has-error')) {
                    // 메시지를 #checkinput에 추가
                    $('#checkinput').append(`<li data-field="${id}">${message}</li>`);
                    // 해당 필드에 포커스 이동
                    $(field).focus();
                    // 필드에 오류가 있음을 기록
                    $(field).data('has-error', true);
                }
            } else if (id === 'repwd') { // 비밀번호 재입력 검사
                const pwdValue = $('#pwd').val().trim();
                if (value !== pwdValue) {
                    message = '비밀번호가 일치하지 않습니다.';
                    // 이미 메시지가 있는지 확인
                    if (!$(field).data('has-error')) {
                        // 메시지를 #checkinput에 추가
                        $('#checkinput').append(`<li data-field="${id}">${message}</li>`);
                        // 비밀번호 입력 필드에 포커스 이동
                        $('#pwd').focus();
                        // 필드에 오류가 있음을 기록
                        $(field).data('has-error', true);
                    }
                } else {
                    // 비밀번호가 일치할 경우 메시지를 제거
                    $('#checkinput li').each(function() {
                        if ($(this).data('field') === id) {
                            $(this).remove();
                        }
                    });
                    // 필드에서 오류가 없음을 기록
                    $(field).data('has-error', false);
                }
            } else {
                // 값이 있을 경우 해당 필드에 대한 메시지 제거
                $('#checkinput li').each(function() {
                    if ($(this).data('field') === id) {
                        $(this).remove();
                    }
                });
                // 필드에서 오류가 없음을 기록
                $(field).data('has-error', false);
            }
        }
    }

    // 성별 필드 검사 함수
    function validateGender() {
        const genderChecked = $('input[name="gender"]:checked').length > 0;
        if (!genderChecked) {
            const message = '성별은 필수 입력입니다.';
            // 이미 메시지가 있는지 확인
            if (!$('#checkinput').find('li[data-field="gender"]').length) {
                // 메시지를 #checkinput에 추가
                $('#checkinput').append(`<li data-field="gender">${message}</li>`);
            }
        } else {
            // 성별이 선택된 경우 메시지 제거
            $('#checkinput li').each(function() {
                if ($(this).data('field') === 'gender') {
                    $(this).remove();
                }
            });
        }
    }

    // 전체 폼을 검사하는 함수
    function validateForm() {
        // 필수 입력 필드 검사
        $('#joinForm input[required]').each(function() {
            validateField(this);
        });
        // 성별 필드 검사
        validateGender();
    }

    // 폼 제출 시 전체 폼을 검사
    $('#joinForm').on('submit', function(e) {
        e.preventDefault(); // 기본 폼 제출 동작 방지
        validateForm();
    });

    // 입력값 변경 시 개별 필드 검사
    $('#joinForm input').on('change', function() {
        validateField(this);
        validateGender();
    });

    // 포커스와 블러 이벤트 시 필드 검사
    $('#joinForm input').on('focus blur', function(event) {
        if (event.type === 'blur') { // 블러 이벤트에서만 검사
            validateField(this);
        }
    });

    // 주소 검색 버튼 클릭 시
    $("button[type='button']").click(function() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                let addr = '';
				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('zipcode').value = data.zonecode;
	            document.getElementById("addr1").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("addr2").focus();
            }
        }).open();
    });

	$('#id').on('blur', function() {
	    const id = $('#id').val().trim();
	    // 입력값이 비어있는 경우 처리
	    if (id === '') {
	        const message = '아이디는 필수 입력란입니다.';
	        // 기존 메시지 제거
	        $('#checkinput li[data-field="id"]').remove();
	        // 메시지를 #checkinput에 추가
	        $('#checkinput').append(`<li data-field="id">${message}</li>`);
	        $('#id').focus();
	        return;
	    }

	    // 기존 메시지 제거
	    $('#checkinput li[data-field="id"]').remove();

	    $.ajax({
	        url: '../member/checkId.do',  // 서버의 중복 체크 URL
	        method: 'POST',
	        data: { id: id },
			dataType: 'text',
	        success: function(response) {
				console.log(response);
	            try {
					// 기존 메시지 제거
		            $('#checkinput li[data-field="id"]').remove();
					
	                if (response.trim() == "true") {
	                    $('#checkinput').append(`<li data-field="id">이미 가입된 아이디입니다.</li>`);
	                    $('#id').focus();
	                } else {
	                    $('#checkinput').append(`<li data-field="id">사용 가능한 아이디입니다.</li>`);
						setTimeout(function() {
		                    $('#checkinput li[data-field="id"]').remove();
		                }, 3000);
	                }
	            } catch (e) {
	                console.error('서버 응답 파싱 오류:', e);
	                $('#checkinput').append(`<li data-field="id">서버 응답 파싱 오류. 나중에 다시 시도해 주세요.</li>`);
	            }
	        },
	        error: function(error) {
	            console.error('AJAX 요청 오류:', error);
	            $('#checkinput').append(`<li data-field="id">서버와의 통신에 실패했습니다. 나중에 다시 시도해 주세요.</li>`);
	        }
	    });
	});

    // 회원가입 버튼 클릭 시 전체 폼을 검사
    $('#writebtn').on('click', function(e) {
        e.preventDefault(); // 기본 폼 제출 동작 방지
        validateForm();

        // 오류가 없는 경우 AJAX 요청으로 데이터 전송
        if ($('#checkinput li').length === 0) {
            // 폼 데이터 수집
            const formData = $('#joinForm').serialize();

            $.ajax({
                url: '../member/join.do',  // 서버의 회원가입 처리 URL
                method: 'POST',
                data: formData,
                success: function(response) {
                    if (response.includes('회원가입이 완료되었습니다.')) {
                        alert('회원가입이 완료되었습니다.');
                        window.location.href = '../index.do'; // 로그인 페이지로 이동
                    } else {
                        alert('회원가입에 실패했습니다. 다시 시도해 주세요.');
                    }
                },
                error: function() {
                    alert('서버와의 통신에 실패했습니다. 나중에 다시 시도해 주세요.');
                }
            });
        }
    });

    // 이메일 선택 필드 변화 시 #email2에 값 반영
    $('#email3').on('change', function() {
        const selectedValue = $(this).val();
        if (selectedValue === '직접입력') {
            $('#email2').val('');
            $('#email2').focus(); // 이메일 주소 필드에 포커스 이동
        } else {
            $('#email2').val(selectedValue);
            $('#email3').val(''); // 이메일 선택 필드 초기화
        }
    });

    // 이메일 직접 입력 필드 변화 시 #email2에 값 반영
    $('#email2').on('input', function() {
        const email3Value = $('#email3').val();
        if (email3Value === '직접입력') {
            $('#email2').val($(this).val());
        }
    });
});
