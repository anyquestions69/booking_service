async function register(){
    const user = {
        email:$('#email').val(),
        password:$('#password').val(),
        first_name:$('#first_name').val(),
        last_name:$('#last_name').val(),
        repass : $('#repass').val(),
      }
     let response = await fetch('/api/auth/register',{
      method: 'POST',
      headers: {
        'Content-Type': 'application/json;charset=utf-8'
      },
      body: JSON.stringify(user)
     })
      let text = await response.text()
      if(response.ok){
        window.location.href ="/"
      }
      console.log(text)
          $('#feedback').empty().append(`<p>${text}</p>`)
         return text
}

async function login(){
    const user = {
        email:$('#email').val(),
        password:$('#password').val(),
       
      }
     let response = await fetch('/api/auth/login',{
      method: 'POST',
      headers: {
        'Content-Type': 'application/json;charset=utf-8'
      },
      body: JSON.stringify(user)
     })
      let text = await response.text()
      if(response.ok){
        window.location.href ="/"
      }
      console.log(text)
          $('#feedback').empty().append(`<p>${text}</p>`)
          return text
         
     
}

async function ping(){
    let response = await fetch('/api/',{
        method: 'GET',
        headers: {
          'Content-Type': 'application/json;charset=utf-8'
        }
       })
       let text = await response.text()
       console.log(text)
       $('#alertsDropdown').append(text)
}