async function showUser(){
    let id =window.location.href.split('?id=')[1]
    let response = await fetch('/api/users/'+id,{
        method: 'GET',
        headers: {
          'Content-Type': 'application/json;charset=utf-8'
        }
    })
    if(response.ok){    
        let res = await response.json()
        console.log(res)
        $('#email').val(res.email)
        $('#address').val(res.place)
        if(res.manager){
            $('#role').prop( "checked", true );
        }
    }
}
showUser()

$('#updateUser').on('submit', async (e)=>{
    e.preventDefault()
    let id =window.location.href.split('?id=')[1]
    let user = {
        email:$('#email').val(),
        place:$('#address').val(),
        manager:$('#role').is(':checked')
    }
    let response = await fetch('/api/users/update/'+id,{
        method: 'POST',
        headers: {
          'Content-Type': 'application/json;charset=utf-8'
        },
        body:JSON.stringify(user)
    })
    if(response.ok){    
       location.reload()
    }
})