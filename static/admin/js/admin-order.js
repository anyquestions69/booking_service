async function showUser(){
    let id =window.location.href.split('?id=')[1]
    let response = await fetch('/api/orders/'+id,{
        method: 'GET',
        headers: {
          'Content-Type': 'application/json;charset=utf-8'
        }
    })
    if(response.ok){    
        let res = await response.json()
        if('sender' in res & 'receiver' in res){
        $('#senderName').val(res.sender.name)
        $('#senderAddress').val(res.sender.place)
        $('#receiverName').val(res.receiver.name)
        $('#receiverAddress').val(res.receiver.place)
        $('#receiverEmail').val(res.receiver.email)
        }
        $('#trackId').val(res.trackId)
        
        
    }
}
showUser()

$('#addForm').on('submit', async (e)=>{
    e.preventDefault()
    let id =window.location.href.split('?id=')[1]
    var arrPoints = new Array();
    $('.inputAddress').each(function(){
        arrPoints.push({place:$(this).val()});
    })
    console.log(arrPoints)
    let order = {
        trackId:$('#trackId').val(),
        sender:{
            name:$('#senderName').val(),
            place:$('#senderAddress').val()
        },
        receiver:{
            name:$('#receiverName').val(),
            place:$('#receiverAddress').val(),
            email:$('#receiverEmail').val()
        },
        points:arrPoints
    }

    let response = await fetch('/api/orders/'+id,{
        method: 'POST',
        headers: {
          'Content-Type': 'application/json;charset=utf-8'
        },
        body:JSON.stringify(order)
    })
    if(response.ok){    
       location.reload()
    }
})


