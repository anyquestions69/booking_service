

$('#addForm').on('submit', async (e)=>{
    e.preventDefault()
    
    let order = {
        name:$('#eventName').val(),
        date:$('#date').val(),
        arena:$('#arena').val(),
        stalls:$('#stalls').val(),
        silver:$('#silver').val(),
        gold:$('#platinum').val(),
        platinum:$('#platinum').val(),
        disabled:$('#disabled').val(),
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
    }
})
