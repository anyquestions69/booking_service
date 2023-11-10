$(document).ready(async function () {
    let response = await fetch('/api/event/')
    if(!response.ok){
        console.log('Not authorized')
        window.location.href="/admin/login"
    }
});

$('#addForm').on('submit', async (e)=>{
    e.preventDefault()
    
    let order = {
        name:$('#eventName').val(),
        date:$('#date').val(),
        bronze:$('#bronze').val(),
        silver:$('#silver').val(),
        gold:$('#gold').val(),
        platinum:$('#platinum').val(),
       
    }
    console.log(JSON.stringify(order))
    let response = await fetch('/api/event/',{
        method: 'POST',
        headers: {
          'Content-Type': 'application/json;charset=utf-8'
        },
        body:JSON.stringify(order)
    })
    if(response.ok){    
        let res = await response.json()
        console.log(res)
        window.location.href="/admin/event"
    }
})
$('#updatePrice').on('submit', async (e)=>{
    e.preventDefault()
    let user = {
        price:$('#price').val(),
        sectorId:$('#sector').val(),
        row:{
            start: $('#row-start').val(),
            end: $('#row-end').val()
        },
        col:{
            start: $('#col-start').val(),
            end: $('#col-end').val()
        },
    }
    console.log(user)
    let response = await fetch('/api/seat/',{
        method: 'PUT',
        headers: {
          'Content-Type': 'application/json;charset=utf-8'
        },
        body:JSON.stringify(user)
    })
    let text = await response.json()
    
    if(response.ok){    
       location.reload()
    }
})
$('#book').on('submit', async (e)=>{
    e.preventDefault()
    let user = {
        sectorId:$('#sectorBook').val(),
        row:$('#row').val(),
        col:$('#col').val(),
        email:$('#email').val()
    }
    console.log(user)
    let response = await fetch('/api/seat/request',{
        method: 'POST',
        headers: {
          'Content-Type': 'application/json;charset=utf-8'
        },
        body:JSON.stringify(user)
    })
    let text = await response.json()
    
    if(response.ok){    
        document.getElementById('frame').contentWindow.location.reload();
        
    }else{
        $('#error').text(text.error)
    }
})