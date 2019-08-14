//js폴더 / member.js
//Member클래스 정의
/*
클래스명 = function(){}
		------------
		생성자 함수 정의
		
*/

//Member = function(){} 기본 생성자  => var m = new Member();
Member = function(name, id, securityNo){
	
	this.name=name;
	this.id=id;
	this.securityNo=securityNo;
	
	
} //오버로딩 생성자 
// 사용법: var m = new Member('홍길동','gildong','960302-012345');


//클래스에 메소드(함수)정의: 키워드 prototype 
Member.prototype.setName = function (name){
	this.name=name;
	
}
Member.prototype.setValue = function (name, id, securityNo){
	this.name=name;
	this.id=id;
	this.securityNo=securityNo;
}

Member.prototype.getAge=function(){//function getAge(){}같은 의미
	// securityNo = '960302-012345'
	var birthYear; //1996
		birthYear = parseInt(this.securityNo.substr(0,2)); //"96" --> 96
	var code; 
		code=this.securityNo.charAt(7); // 자료형은 '2' 
	birthYear = (code < '3')? 1900+birthYear : 2000+birthYear; 
	//1996
	
	
	
	//현재 년도 구하기
	var year = new Date().getFullYear();
	return year-birthYear+1;
}//getAge

Member.prototype.toString=function(){//toString()함수 정의
	
	return"[이름:"+this.name+", 아이디:"+this.id+"]"
	
	
	
}