<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@ include file="/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- <link rel="stylesheet" href="./resources/css/header.css"> -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/survey/surveyUpdateStyle.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<title>상세질문 수정하기</title>

</head>
<body>

	<h2>서베이 업데이트 페이지</h2>
	<h2>제목 : ${mainsurvey.main_title}</h2>
	<h4>리워드 : ${mainsurvey.main_reward}원</h4>
	<br>
	<form id="formSubmit"
		action="/survey/surveyUpdate?id=${mainsurvey.main_id}" method="post" onsubmit="copyOptionsToHiddenInputs()">
		<sec:csrfInput />
		<input name="id" type="hidden" value="${mainsurvey.main_id}">
		<table class="board-table">
			<thead>
				<tr>
					<th>구분</th>
					<th>질문내용</th>
					<th>예시답변</th>
				</tr>
			</thead>
			<c:set var="i" value="0" />
			<c:forEach items="${detailsurvey}" var="vo">
				<tr class="detail-item" data-detail-id="${vo.detail_id}">
					<td>
						<button class="old-delete-button" data-detail-id="${vo.detail_id}"
							type="button">삭제하기</button> <select
						class="detail-category-select" data-detail-id="${vo.detail_id}"
						name="detail_category_${vo.detail_id}">
							<option value="1" ${vo.detail_category == '1' ? 'selected' : ''}>지문형</option>
							<option value="2" ${vo.detail_category == '2' ? 'selected' : ''}>선택형</option>
							<option value="3" ${vo.detail_category == '3' ? 'selected' : ''}>체크박스형</option>
					</select>
					</td>
					<td><span class="detail-text2"
						data-detail-id="${vo.detail_id}"> <input type="hidden"
							name="detail_id" value="${vo.detail_id}"> <c:if
								test="${vo.detail_category == '1'}">
								<input class="detail-content-input"
									name="detail_content_${vo.detail_id}"
									value="${vo.detail_content}"></input>
									<td class="detail-text3"></td>
							</c:if> 
							<c:if test="${vo.detail_category == '2'}">
								<input class="detail-content-input"
									name="detail_content_${vo.detail_id}"
									value="${vo.detail_content}"></input>
								<td class="detail-text3"><input
									id="newOptionValue_${vo.detail_id}"
									placeholder='추가하실 값을 입력해주세요'></input>
									<button type="button" style=""
										onclick="addOption(${vo.detail_id})">옵션추가</button>
										<select
									class="additional-options-select" data-detail-id="${vo.detail_id}"
									name="additional_options_${vo.detail_id}" multiple required>
										<c:forEach items="${answersMap[vo.detail_id]}" var="option">
											<option value="${option.answerlist_answer}">${option.answerlist_answer}</option>
										</c:forEach>
										
								</select></td>
							</c:if>
							<c:if test="${vo.detail_category == '3'}">
								<span class="detail-text2"><input
									class="detail-content-input"
									name="detail_content_${vo.detail_id}"
									value="${vo.detail_content}"></input></span>
								<td class="detail-text3"><input type="checkbox"
									name="option1_${vo.detail_id}" value="1">1번 <br> <input
									type="checkbox" name="option2_${vo.detail_id}" value="2">2번
									<br> <input type="checkbox" name="option1_${vo.detail_id}"
									value="3">3번 <br> <input type="checkbox"
									name="option2_${vo.detail_id}" value="4">4번 <br> <input
									type="checkbox" name="option2_${vo.detail_id}" value="5">5번

									<br></td>
							</c:if>
					</span></td>
				</tr>
			</c:forEach>
		</table>
		<hr>
		<table class="board-table">
			<tbody id="newDetailArea"></tbody>
		</table>
		<div class="button-container">
			<button id="add-detail-button" type="button">질문 추가하기</button>
			<button type="submit">1수정완료</button>
		</div>
	</form>

</body>
<script>
function addOption(detailId) {
    var newOptionValue = document.getElementById('newOptionValue_' + detailId).value;

    if(newOptionValue) {
    	var selects = document.getElementsByName('additional_options_' + detailId);
        if(selects.length > 0) {
        	 var select = selects[0];
             var newOption = document.createElement("option");
             newOption.value = newOptionValue;
             newOption.text = newOptionValue;
             select.add(newOption);
        }else {
            console.log("Select element not found");
        }
    } else {
        alert('값을 입력해주세요.');
    }
}

document.addEventListener('DOMContentLoaded', function() {
	//추가한 서베이 삭제
    const deleteButtons = document.querySelectorAll('.delete-button');

    var olddeleteButtons = document.querySelectorAll('.old-delete-button');
    var deleteButton = document.querySelectorAll('.delete-button');

    //서베이 추가
    const addDetailButton = document.getElementById('add-detail-button');
 	const newDetailArea = document.getElementById('newDetailArea');
 	
 	
 	
 	//구분용 인덱스 생성
    function generateNewDetailId() {
        const existingDetailIds = document.querySelectorAll('input[name="detail_id"]');
        let maxDetailId = -1;
        existingDetailIds.forEach(function(input) {
            const detailId = parseInt(input.value);
            if (!isNaN(detailId) && detailId > maxDetailId) {
                maxDetailId = detailId; 
            }
        });
        return maxDetailId+1;
    }
 	
    
	//기존거 삭제하기 및 생성하기 	
	olddeleteButtons.forEach(function(button) {
		 button.addEventListener('click', function() {
		 var detailId = this.getAttribute('data-detail-id');
		 var inputField = document.querySelector('input[name="detail_content_' + detailId + '"]');
	     var detailItem = document.querySelector('.detail-item[data-detail-id="' + detailId + '"]'); // tr 요소 참조

	        
	     var detailSpan = document.querySelector('.detail-text2[data-detail-id="' + detailId + '"]');
	     var specificDeleteButton = document.querySelector('.old-delete-button[data-detail-id="' + detailId + '"]');		 

	     if (detailItem) {
	    	 if (detailItem.classList.contains('deleted')) {
	                detailItem.classList.remove('deleted'); // 클래스 제거
	                this.textContent = '삭제하기';
	            } else {
	                detailItem.classList.add('deleted'); // 클래스 추가
	                this.textContent = '삭제취소';
	            }
	     } else {
	            console.error('Detail item not found for detailId:', detailId);
	        }
		 });
	 });
    
	//기존거 변경용
    document.querySelectorAll('.detail-category-select').forEach(function(selectElement) {
    	 selectElement.addEventListener('change', function() {
    	        const detailId = this.getAttribute('data-detail-id');
    	        const parentRow = this.closest('tr'); // 가장 가까운 tr 요소를 찾음
    	        const parentRow2 = event.target.closest('.detail-item');

    	        const detailTextSpan = parentRow.querySelector('.detail-text2[data-detail-id="' + detailId + '"]');
    	        const detailTextSpantest = parentRow.querySelector('.detail-text3');

    	        const inputsToRemove = detailTextSpan.querySelectorAll('.detail-content-input');
    	        inputsToRemove.forEach(input => {
    	            detailTextSpan.removeChild(input);
    	        });

	        	const selectElement = document.querySelector('.additional-options-select[data-detail-id="424"]');
	        	if (selectElement) {
	        	    const parentTd = selectElement.parentElement;
	        	    console.log(parentTd)
	        	        parentTd.innerHTML = '';

	        	}

//     	        const inputsToRemove2 = detailTextSpan.querySelectorAll('.detail-text2');
//     	        inputsToRemove2.forEach(input => {
//     	            detailTextSpan.removeChild(input);
//     	            console.log("나 실행");
//     	        });

//     	        const elementsToRemove2 = document.querySelectorAll('.fragment-' + detailId);
    	        
//     	        elementsToRemove2.forEach(tdElement => {
//     	            console.log(tdElement);
//     	            if (tdElement.parentNode) {
//         	            console.log("나 실행2");

//     	                tdElement.parentNode.removeChild(tdElement);
//     	            }
//     	        });
    	        removeCheckboxTd(detailId);
    	        
    	        const existingInputs = parentRow.querySelectorAll('.dynamic-input,.dynamic-input2, .option-input, .checkbox-container, .option-input2');
    	        existingInputs.forEach(input => {
    	        input.parentNode.removeChild(input);
    	    });
    	        
    	        const selectedValue = this.value;
    	        let newField;
    	        if (selectedValue === '1') {
    	            newField = createTextInput(detailId, 'additional-class-for-A');
    	            if (newField) {
        	            detailTextSpan.appendChild(newField); // detailTextSpan에 새 필드 추가
        	        }
    	            console.log("1번");
    	            
    	        } else if (selectedValue === '2') {
    	            newField = createSelectInputWithOptions(detailId, parentRow, 'additional-class-for-A');
    	            const inputField = newField.inputField;
    	            const selectField = newField.selectField;
    	            const optionInput = newField.optionInput;
    	            const addOptionButton = newField.addOptionButton;

    	            if (detailTextSpan) {
    	                detailTextSpan.appendChild(inputField);
    	                console.log(inputField);
    	            }
    	            
    	            console.log("2번");

    	        } else if (selectedValue === '3') {
    	            newField = createCheckBoxes(detailId, 'additional-class-for-A');

    	            const fragment = newField.fragment;
    	            const input = newField.input;

    	            if (detailTextSpan) {
    	                detailTextSpan.appendChild(input);
    	            }

    	            if (detailTextSpantest) {
    	                detailTextSpantest.appendChild(fragment);
    	            }

    	        }
	            console.log("3번");

    	       
    });
    });
	//기존거 변경용 끝
	
	
	//클릭시 진행
addDetailButton.addEventListener('click', function() {
    const newDetailId = generateNewDetailId(); // 새로운 detail_id 생성 함수 호출

    
    // 신규 행 생성
    const newRow = document.createElement('tr');
    newRow.classList.add('detail-item');
    newRow.setAttribute('data-detail-id', newDetailId);

    // 삭제 버튼과 selectInput을 함께 담을 td 생성
    const tdForDeleteButtonAndSelect = document.createElement('td');
    const newDeleteButton = document.createElement('button');
    newDeleteButton.textContent = '삭제하기';
    tdForDeleteButtonAndSelect.appendChild(newDeleteButton);

    const selectInput = createSelectInput(newDetailId);
    tdForDeleteButtonAndSelect.appendChild(selectInput);
    newRow.appendChild(tdForDeleteButtonAndSelect);

 // 두 번째 td 생성 (detail-text2 클래스를 가질 td)
    const tdForDetailText = document.createElement('td');
    tdForDetailText.classList.add('detail-text2');
    // 이 td에 추가할 내용을 설정할 수 있습니다. 예를 들어, 빈 span 요소:
    const spanForInput = document.createElement('span');
    tdForDetailText.appendChild(spanForInput);
    
    newRow.appendChild(tdForDetailText);

    // 두 번째 td 생성 (detail-text2 클래스를 가질 td)
    const tdForDetailText2 = document.createElement('td');
    tdForDetailText2.classList.add('detail-text3');
    // 이 td에 추가할 내용을 설정할 수 있습니다. 예를 들어, 빈 span 요소:
    const spanForInput2 = document.createElement('span');
    tdForDetailText2.appendChild(spanForInput2);
    
    newRow.appendChild(tdForDetailText2);
    
    // 숨겨진 input 추가
    const hiddenInput = document.createElement('input');
    hiddenInput.type = 'hidden';
    hiddenInput.name = 'detail_id';
    hiddenInput.value = newDetailId;
    newRow.appendChild(hiddenInput);

    newDeleteButton.addEventListener('click', function() {
        newRow.remove();
    });

    newDetailArea.appendChild(newRow);
});

    //select문 생성기
    function createSelectInput(newDetailId) {
        const selectInput = document.createElement('select');
        selectInput.name = "detail_category_" + newDetailId; // Set the name attribute
        selectInput.innerHTML = `
        <hr>
            <option value="">선택하세요</option>
            <option value="1">지문형</option>
            <option value="2">선택형</option>
            <option value="3">체크박스형</option>
        `;
        selectInput.style.marginLeft = "10px"; // selectInput에 왼쪽 마진 추가
        selectInput.style.width = "600px;"
        selectInput.addEventListener('change', function() {
            handleSelectChange(this, newDetailId);
        });
        
        
        return selectInput;
    }
    
    function handleSelectChange(selectInput, newDetailId) {
        const selectedValue = selectInput.value;
        const parentRow = selectInput.parentNode; // 현재 selectInput이 포함된 행을 가져옴
        const tdForDetailText = selectInput.closest('tr').querySelector('.detail-text2');
        const tdForDetailText2 = selectInput.closest('tr').querySelector('.detail-text3');


        const parentRow2 = event.target.closest('.detail-item');

        const detailTextSpan = parentRow.querySelector('.detail-text2[data-detail-id="' + newDetailId + '"]');
        const detailTextSpan3 = parentRow2.querySelector('.detail-text3[data-detail-id="' + newDetailId + '"]');
        const detailTextSpantest = parentRow.querySelector('.detail-text3');
        const detailTextSpantest2 = parentRow2.querySelector('.detail-text2');
        const detailTextSpantest3= parentRow2.querySelector('.detail-text3');
		
		
       
 		const existingInputs = parentRow.querySelectorAll('.dynamic-input,.dynamic-input2, .option-input, .checkbox-container, .option-input2');
 		const elementsToRemove = document.querySelectorAll('.checkbox-group-' + newDetailId);
 		const existingAdditionalTd = parentRow.querySelector('.additional-class-for-B');
			 if (existingAdditionalTd) {
			     existingAdditionalTd.parentNode.removeChild(existingAdditionalTd);
			 }
 
 		const optionInputContainer = parentRow.querySelector('.option-input-container');
			 if (optionInputContainer) {
			     optionInputContainer.parentNode.removeChild(optionInputContainer);
			 }

 			removeCheckboxTd(newDetailId);
 
		const existingTd = parentRow.querySelector('.additional-class-for-B');
			 if (existingTd) {
			     existingTd.parentNode.removeChild(existingTd);
			 }
 
 			existingInputs.forEach(input => {
    			 if (input.parentNode) {
         			input.parentNode.removeChild(input);
     			}
 			});
        
        elementsToRemove.forEach(element => {
            element.parentNode.removeChild(element);
        });

        while (tdForDetailText.firstChild) {
            tdForDetailText.removeChild(tdForDetailText.firstChild);
        }
        
        while (detailTextSpantest3 && detailTextSpantest3.firstChild) {
            detailTextSpantest3.removeChild(detailTextSpantest3.firstChild);
        }
        
        let newField;

        if (selectedValue === '1') {
            newField = createTextInput(newDetailId, 'additional-class-for-B');
            if (newField) {
            	tdForDetailText.appendChild(newField);
            }
        } else if (selectedValue === '2') {
            newField = createSelectInputWithOptions(newDetailId, parentRow, 'additional-class-for-B');
            const inputField = newField.inputField;
            const selectField = newField.selectField;
            const optionInput = newField.optionInput;
            const addOptionButton = newField.addOptionButton;
			
            if (detailTextSpantest2) {
            	detailTextSpantest2.appendChild(inputField);
            
            if (detailTextSpantest3) {
            	
            	detailTextSpantest3.appendChild(optionInput);
            	detailTextSpantest3.appendChild(addOptionButton);
            	detailTextSpantest3.appendChild(selectField);
            }

        }
        }else if (selectedValue === '3') {
            newField = createCheckBoxes(newDetailId,'additional-class-for-B');
            
            const fragment = newField.fragment;
            const input = newField.input;
            if (detailTextSpan) {
                detailTextSpan.appendChild(input);
            }
            if (detailTextSpantest2) {
                detailTextSpantest2.appendChild(input);
            }
            
            if (detailTextSpantest3) {
                detailTextSpantest3.appendChild(fragment);
            }
        }
    }

    function createTextInput(detailId, additionalClass) {
        const input = document.createElement('input');
        input.type = 'text';
        input.name = 'detail_content_' + detailId;
        input.classList.add('dynamic-input2');
        if (additionalClass) {
            input.classList.add(additionalClass);
        }
        
        return input;
    }

    
    function createSelectInputWithOptions(detailId, parentRow, additionalClass) {
        const tdForDetailText2 = parentRow.querySelector('.detail-text2');
        const tdForDetailText3 = parentRow.querySelector('.detail-text3');
        const container = document.createElement('div');
		
        
        const inputField = document.createElement('input');
        inputField.type = 'text';
        inputField.name = 'detail_content_' + detailId;
        inputField.placeholder = '질문 내용을 입력해주세요';
        inputField.classList.add('dynamic-input2');


        // 선택 필드 및 추가 옵션 입력 필드 생성
        const selectField = document.createElement('select');
        selectField.name = 'detail_answer_' + detailId;
        selectField.classList.add('option-input');
        selectField.multiple = true; // Set the multiple attribute
        selectField.required = true; // Set the required attribute
        const optionInput = document.createElement('input');
        optionInput.type = 'text';
        optionInput.placeholder = '추가하실 값을 입력해주세요';
        optionInput.classList.add('option-input');
        optionInput.id = 'newOptionValue_' + detailId;

        const addOptionButton = document.createElement('button');
        addOptionButton.textContent = '옵션 추가';
        addOptionButton.type = 'button';
        addOptionButton.classList.add('option-input');
        addOptionButton.style.marginLeft = "10px";
        addOptionButton.onclick = function() {
            const optionValue = optionInput.value;
            if (optionValue) {
                const newOption = document.createElement('option');
                newOption.value = optionValue;
                newOption.textContent = optionValue;
                selectField.appendChild(newOption);
            } else {
                alert("옵션을 입력해주세요.");
            }
        };

        
        container.appendChild(optionInput);
        container.appendChild(addOptionButton);
        container.appendChild(selectField);

        const elements = {
                inputField: inputField,
                
                optionInput: optionInput,
                addOptionButton: addOptionButton,
                selectField: selectField
            };
        
        // tdForDetailText3에 컨테이너 추가
        if (tdForDetailText3) {
            tdForDetailText3.appendChild(container);
        }
        
        return elements;
    }

    function createCheckBoxes(detailId, additionalClass) {
        // 텍스트 입력 필드와 체크박스를 포함할 td 생성
        const fragment = document.createElement('td');
        fragment.classList.add('fragment-' + detailId); // 고유한 클래스 추가

        // 텍스트 입력 필드 생성 및 td에 추가
        const input = document.createElement('input');
        input.type = 'text';
        input.name = 'detail_content_' + detailId;
        input.classList.add('dynamic-input2');
        fragment.appendChild(input);
		console.log("실행완료");
        // 체크박스 생성 및 td에 추가
        for (let i = 1; i <= 5; i++) {
            const checkbox = document.createElement('input');
            checkbox.type = 'checkbox';
            checkbox.name = 'detail_answer_' + detailId;
            checkbox.value = i;
            checkbox.id = 'option' + i + '_' + detailId;
            checkbox.classList.add('checkbox-group-' + detailId); // 클래스 추가

            const label = document.createElement('label');
            label.htmlFor = checkbox.id;
            label.textContent = '옵션 ' + i;
            label.classList.add('checkbox-group-' + detailId);
            
            fragment.appendChild(checkbox);
            fragment.appendChild(label);
            const lineBreak = document.createElement('br');
            lineBreak.classList.add('checkbox-group-' + detailId);
            fragment.appendChild(lineBreak);
        }
        
        const elements = {
        		fragment: fragment,
        		input: input,
            };
        
        return elements;
    }
    
    var form = document.getElementById('formSubmit');
    

    //form에서 비활성화된 값은 미제출
    form.addEventListener('submit', function(event) {
        // 'deleted' 클래스를 가진 행의 모든 input 필드를 비활성화
        this.querySelectorAll('.detail-item.deleted input').forEach(function(input) {
            input.disabled = true; // 비활성화하여 서버로 제출되지 않도록 함
        });

    });
    function removeCheckboxTd(detailId) {
        const tdToRemove = document.querySelector('.fragment-' + detailId);
        if (tdToRemove) {
            tdToRemove.parentNode.removeChild(tdToRemove);
        }
    }
    

});

</script>
</html>