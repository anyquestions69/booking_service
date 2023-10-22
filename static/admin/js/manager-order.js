async function showUser(){
    let id =window.location.href.split('?id=')[1]
    let checkManager = true//await fetch('/api/orders/check/'+id)
    if(checkManager){
        let response = await fetch('/api/orders/'+id,{
            method: 'GET',
            headers: {
            'Content-Type': 'application/json;charset=utf-8'
            }
        })
        if(response.ok){    
            let res = await response.json()
            console.log(res)
            $('#orderId').text('Заказ '+ res.trackId)
            if('sender' in order & 'receiver' in order){
            if(res.status==res.points.length){
                $('#pointsList').empty().append('<p>Заказ доставлен</p>')
                $('#moveSubmit').remove()
                $('#statusSubmit').remove()
            }else{
                $('#status').val(res.points[res.status].status)
            }
        }
        }
    }else{
        alert('Товар не в вашем пункте')
        window.location.href="/admin"
    }
}
showUser()
$('#addForm').on('submit', async (e)=>{
    e.preventDefault()
    let id =window.location.href.split('?id=')[1]
    let response  = await fetch('/api/orders/status/'+id,{
            method: 'POST',
            headers: {
              'Content-Type': 'application/json;charset=utf-8'
            },
            body:JSON.stringify({status:$('#status').val()})
        })
    
})
$('#moveForward').on('submit', async (e)=>{
    e.preventDefault()
    let id =window.location.href.split('?id=')[1]
    let response = await fetch('/api/orders/next/'+id,{
        method: 'POST',
        headers: {
          'Content-Type': 'application/json;charset=utf-8'
        }
    })
    if(response.ok){    
        window.location.href="/admin"    
    }
})