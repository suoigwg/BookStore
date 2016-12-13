/**
 * Created by ysyang on 12/12/2016.
 */

function addItem() {
    var num = document.getElementById("buyamount").valueOf();
    num++;
    console.log(num);
    document.getElementById("buyamount").innerHTML=num;
}

function removeItem() {
    var num = document.getElementById("buyamount").valueOf();
    num--;
    console.log(num);
    document.getElementById("buyamount").innerHTML=num;
}

function addtoCart() {
    var amt = document.getElementById("buyamount").value;
    var id = document.getElementById("id").value;
    console.log(amt);
    console.log(id);
    document.chatform.action = "/cartservlet";
    document.chatform.submit();
}