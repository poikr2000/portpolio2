<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


	<form id="BoardDelForm" name="" action="/exec/front/Board/del/4"
		method="post" enctype="multipart/form-data" style="margin-top:60pt">
		<div class="xans-element- xans-board xans-board-read-4 xans-board-read xans-board-4">
			<!--
            $login_page_url = /member/login.html
            $deny_access_url = /board/product/list.html
        -->
			<div class="boardView ">
				<table border="1" summary="">

					<tbody>
						<tr>
							<th scope="row">제목</th>
							<td></td>
						</tr>
						<tr>
							<th scope="row">작성자</th>
							<td></td>
						</tr>
						<tr class="etcArea">
							<td colspan="2">
								<ul>
									<li class="date "><strong class="th">작성일</strong>
									<span class="td">2016-08-04</span></li>
									<li class="hit "><strong class="th">조회수</strong>
									<span class="td">297</span></li>
								</ul>
							</td>
						</tr>
						<tr class="view">
							<td colspan="2">
								<div class="detail">
									<p>고심끝에</p>
									<p>몇번을 전화했다가</p>
									<p>결국 이제품으로 결정을하고</p>
									<p>설치를 했음니다.</p>
									<p>작동도 잘되고 튼튼해</p>
									<p>모두들 만족하더근요</p>
									<p>항상 사업 번창하시고</p>
									<p>앞프로도 애용하겠음니다고맙슴니다.</p>
								</div>
							</td>
						</tr>
						<tr class="attach displaynone">
							<th scope="row">첨부파일</th>
							<td></td>
						</tr>
						<tr class="">
							<th scope="row">비밀번호</th>
							<td><input id="password" name="password" fw-filter=""
								fw-label="비밀번호" fw-msg=""
								onkeydown="if (event.keyCode == 13 || event.which == 13) { return false; }"
								value="" type="password" /> <span class="info"> <img
									src="http://img.echosting.cafe24.com/skin/base_ko_KR/board/ico_warning.gif"
									alt="" /> 삭제하려면 비밀번호를 입력하세요.
							</span></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="btnArea ">
				<span class="left"><a
					href="/board/product/list.html?board_act=list&board_no=4"><img
						src="/SkinImg/btn/btn_board_list.png" alt="목록" /></a></span> <a href="#none"
					onclick="BOARD_READ.article_delete('BoardDelForm','4');" class=""><img
					src="/SkinImg/btn/btn_board_delete.png" alt="삭제" /></a> <a
					href="/board/product/modify.html?board_act=edit&no=1209&board_no=4"
					class=""><img src="/SkinImg/btn/btn_board_modify.png" alt="수정" /></a>
				<a
					href="/board/product/reply.html?board_act=reply&no=1209&board_no=4&product_no=1983"
					class=""><img src="/SkinImg/btn/btn_board_reply.png" alt="답변" /></a>
			</div>
		</div>
	</form>

	<div
		class="xans-element- xans-board xans-board-commentpackage-4 xans-board-commentpackage xans-board-4 ">
		<!-- 코멘트 리스트 -->
		<!-- 코멘트 페이징 -->
		<!-- 댓글 수정 -->
		<form id="commentForm" name=""
			action="/exec/front/Board/CommentUpdate/4" method="post"
			enctype="multipart/form-data">
			<input id="board_no" name="board_no" value="4" type="hidden" /> <input
				id="no" name="no" value="1209" type="hidden" /> <input
				id="comment_no" name="comment_no" value="" type="hidden" /> <input
				id="member_id" name="member_id" value="" type="hidden" />
			<div
				class="xans-element- xans-board xans-board-commentform-4 xans-board-commentform xans-board-4 ">
				<fieldset>
					<legend>댓글 수정</legend>
					<p>
						비밀번호 : <input id="comment_password" name="comment_password"
							fw-filter="isFill" fw-label="댓글비밀번호" fw-msg="" value=""
							type="password" /> <span class="secret displaynone"><label>
								비밀댓글</label></span>
					</p>
					<div class="view">
						<textarea id="comment_modify" name="comment_modify"
							fw-filter="isFill" fw-label="댓글내용" fw-msg=""></textarea>
						<span class="submit"> <a href="#none"
							onclick="BOARD_COMMENT.comment_update_ok('commentForm');"><img
								src="/SkinImg/btn/btn_comment_modify1.png" alt="수정" /></a> <a
							href="#none"
							onclick="BOARD_COMMENT.comment_cancel_ok('commentForm');"><img
								src="/SkinImg/btn/btn_comment_cancel1.png" alt="취소" /></a>
						</span>
					</div>
					<p class="displaynone">/ byte</p>
				</fieldset>
			</div>
		</form>
		<!-- 비밀글 확인 -->
		<form id="commentSecretForm" name=""
			action="/exec/front/Board/CommentSecret/4" method="post"
			enctype="multipart/form-data">
			<input id="board_no" name="board_no" value="4" type="hidden" /> <input
				id="comment_no" name="comment_no" value="" type="hidden" /> <input
				id="pass_check" name="pass_check" value="F" type="hidden" />
			<div
				class="xans-element- xans-board xans-board-commentformsecret-1002 xans-board-commentformsecret xans-board-1002 ">
				<p>
					비밀번호 : <input id="secure_password" name="secure_password"
						fw-filter="isFill" fw-label="댓글비밀번호" fw-msg="" value=""
						type="password" /> <a href="#none"
						onclick="BOARD_COMMENT.show_secret_comment('commentSecretForm');"><img
						src="http://img.echosting.cafe24.com/skin/base_ko_KR/board/btn_ico_submit.gif"
						alt="확인" /></a> <a href="#none"
						onclick="BOARD_COMMENT.hide_secret_comment_form('commentSecretForm');"><img
						src="http://img.echosting.cafe24.com/skin/base_ko_KR/board/btn_ico_cancel.gif"
						alt="취소" /></a>
				</p>
			</div>
		</form>
		<!-- 댓글 쓰기 -->
		<form id="commentWriteForm" name=""
			action="/exec/front/Board/CommentWrite/4" method="post"
			enctype="multipart/form-data">
			<input id="board_no" name="board_no" value="4" type="hidden" /> <input
				id="no" name="no" value="1209" type="hidden" /> <input
				id="comment_no" name="comment_no" value="" type="hidden" /> <input
				id="member_id" name="member_id" value="" type="hidden" />
			<div
				class="xans-element- xans-board xans-board-commentwrite-4 xans-board-commentwrite xans-board-4 ">
				<!-- 댓글권한 있음 -->
				<div class="">
					<fieldset>
						<legend>댓글 입력</legend>
						<p>
							<strong>댓글달기</strong><span class="">이름 :<input
								id="comment_name" name="comment_name"
								fw-filter="isFill&isMaxByte[100]" fw-label="댓글작성자" fw-msg=""
								class="inputTypeText" placeholder="" value="" type="text" /></span>비밀번호
							: <input id="comment_password" name="comment_password"
								fw-filter="isFill" fw-label="댓글비밀번호" fw-msg="" value=""
								type="password" /><span class="secret displaynone"><label>
									비밀댓글</label></span><a href="#none" onclick="" class="displaynone"><img
								src="/SkinImg/btn/btn_reply_admin.png" alt="관리자답변보기" /></a>
						</p>
						<div class="view">
							<textarea id="comment" name="comment" fw-filter="isFill"
								fw-label="댓글내용" fw-msg=""></textarea>
							<a href="#none"
								onclick="BOARD_COMMENT.comment_insert('/exec/front/Board/CommentWrite/4');"
								class="submit "><img
								src="/SkinImg/btn/btn_comment_submit.png" alt="확인" /></a>
						</div>
						<p class="grade displaynone"></p>
						<p class="displaynone">/ byte</p>
						<p class="captcha ">
							<img src="/Exec/Front/Board/Captcha/?no=1209&type=CommentWrite"
								id="captcha_CommentWrite_1209" /> <input id="captcha"
								name="captcha" fw-filter="isFill" fw-label="보안문자" fw-msg=""
								class="inputTypeText" placeholder="보안문자를 입력해 주세요." value=""
								type="text" /> <img
								src="http://img.echosting.cafe24.com/skin/base_ko_KR/board/ico_warning.gif"
								alt="" /> 왼쪽의 문자를 공백없이 입력하세요.(대소문자구분)
						</p>
					</fieldset>
				</div>
				<!-- 댓글권한 없음 -->
				<div class="displaynone">
					<p>에게만 댓글 작성 권한이 있습니다.</p>
				</div>
			</div>
		</form>
		<!-- 댓글의 댓글 쓰기 -->
		<form id="commentReplyWriteForm" name=""
			action="/exec/front/Board/CommentWrite/4" method="post"
			enctype="multipart/form-data">
			<input id="board_no" name="board_no" value="4" type="hidden" /> <input
				id="no" name="no" value="1209" type="hidden" /> <input
				id="comment_no" name="comment_no" value="" type="hidden" /> <input
				id="member_id" name="member_id" value="" type="hidden" />
			<div
				class="xans-element- xans-board xans-board-commentreply-4 xans-board-commentreply xans-board-4 ">
				<!-- 댓글권한 있음 -->
				<div class="">
					<fieldset>
						<legend>댓글 입력</legend>
						<p>
							<strong>댓글달기</strong><span class="">이름 :<input
								id="comment_name" name="comment_name"
								fw-filter="isFill&isMaxByte[100]" fw-label="댓글작성자" fw-msg=""
								class="inputTypeText" placeholder="" value="" type="text" /></span>비밀번호
							: <input id="comment_password" name="comment_password"
								fw-filter="isFill" fw-label="댓글비밀번호" fw-msg="" value=""
								type="password" /><span class="secret displaynone"><label>
									비밀댓글</label></span>
						</p>
						<div class="view">
							<textarea id="comment" name="comment" fw-filter="isFill"
								fw-label="댓글내용" fw-msg=""></textarea>
							<a href="#none"
								onclick="BOARD_COMMENT.comment_reply_insert('/exec/front/Board/CommentWrite/4');"
								class="submit "><img
								src="http://img.echosting.cafe24.com/skin/base_ko_KR/board/btn_comment_submit.gif"
								alt="확인" /></a>
						</div>
						<p class="displaynone">/ byte</p>
						<p class="captcha ">
							<img src="/Exec/Front/Board/Captcha/?no=1209&type=CommentReply"
								id="captcha_CommentReply_1209" /> <input id="captcha"
								name="captcha" fw-filter="isFill" fw-label="보안문자" fw-msg=""
								class="inputTypeText" placeholder="보안문자를 입력해 주세요." value=""
								type="text" /> <img
								src="http://img.echosting.cafe24.com/skin/base_ko_KR/board/ico_warning.gif"
								alt="" /> 왼쪽의 문자를 공백없이 입력하세요.(대소문자구분)
						</p>
					</fieldset>
				</div>
				<!-- 댓글권한 없음 -->
				<div class="displaynone">
					<p>에게만 댓글 작성 권한이 있습니다.</p>
				</div>
			</div>
		</form>
	</div>

	<div
		class="xans-element- xans-board xans-board-movement-4 xans-board-movement xans-board-4 ">
		<ul>
			<li class="prev "><strong>이전글</strong><a
				href="/board/product/read.html?no=1212&board_no=4&page=">스테퍼</a></li>
			<li class="next "><strong>다음글</strong><a
				href="/board/product/read.html?no=1211&board_no=4&page=">만족스럽슴니다</a>
			</li>
		</ul>
	</div>

</body>
</html>