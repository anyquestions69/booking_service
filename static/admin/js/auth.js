
$('#loginForm').on('submit',async(e)=>{
   
    e.preventDefault()
    let user ={
        email:$('#email').val(),
        password:$('#password').val()
    }
    console.log(user)

    let response = await fetch('/api/users/login',{
        method: 'POST',
        headers: {
          'Content-Type': 'application/json;charset=utf-8'
        },
        body:JSON.stringify(user)
    })
    if(response.ok){
        window.location.href="/admin"
    }else{
        let msg = await response.json()
        return $('#error').text(msg.error)
    }

})
$('#forgotPass').on('click',async(e)=>{
   e.preventDefault()
   $('#msg').show()
    
    

    let response = await fetch('/api/users/forgotPassword',{
        method: 'POST'
    })
        let msg = await response.json()
       console.log(msg)
})