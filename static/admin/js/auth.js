$('#registerForm').on('submit',async(e)=>{
    e.preventDefault()
   
    if($('#password').val()!=$('#repass').val()){
        return $('#error').text('Пароли не совпадают')
    }
    let user ={
        email:$('#email').val(),
        password:$('#password').val()
    }
    let response = await fetch('/api/users/register',{
        method: 'POST',
        headers: {
          'Content-Type': 'application/json;charset=utf-8'
        },
        body:JSON.stringify(user)
    })
    if(response.ok){
        window.location.href="/"
    }else{
        let msg = await response.json()
        return $('#error').text(msg.error)
    }
})
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
        window.location.href="/"
    }else{
        let msg = await response.json()
        return $('#error').text(msg.error)
    }

})