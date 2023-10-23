
async function logout(){
    let res = await fetch('/api/users/logout')
    let r = await res.text()
    console.log(r)
    //document.cookie = "user=; expires = Thu, 01 Jan 1970 00:00:00 GMT"
    location.reload()
}

async function showUser(){
    let res = await fetch('/api/users/profile')
    let r = await res.json()
    console.log(r)
    $('#email').val(r.email)
    $('#address').val(res.place)}



 function filter(str){

    return str.replace(/[^\d]/g, '');
}