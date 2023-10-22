async function check (){
    let res = await fetch('/api/users/checkRole', {method:'PUT'})
    if( res.ok){
    let r= await res.text()
    console.log(r)
    if(r=='admin' || r=='manager'){
        $('#nav-menu').empty().append(`
        <a class="btn btn-light me-3" href="/profile">Профиль</a>
        <a class="btn btn-light me-3" href="/admin">Админ-панель</a>
        <span class="btn btn-light" id="logoutBtn" onclick=logout()>Выйти</span>
        `)
    }else{
        $('#nav-menu').empty().append(`
        <a class="btn btn-light me-3" href="/profile">Профиль</a>
        <span class="btn btn-light" id="logoutBtn" onclick=logout()>Выйти</span>
        `)
    }

    }else{
        $('#nav-menu').empty().append(`
        <a class="btn btn-light" href="/login">Войти</a>
        `)
    }
}
check()
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

async function deleteAccount(){
    let res = await fetch('/api/users/', {
        method:'DELETE'
    })
    let r = await res.text()
    console.log(r)
    //document.cookie = "user=; expires = Thu, 01 Jan 1970 00:00:00 GMT"
    //location.reload()
}
$('#trackForm').on('submit', async (e)=>{
    e.preventDefault()
    $('#submitErrorMessage').addClass('d-none')
    let str = $('#trackId').val()
    let trackId = str
    console.log(trackId)
    let response = await fetch('/api/orders/'+trackId,{
        method: 'GET',
        headers: {
          'Content-Type': 'application/json;charset=utf-8'
        }
    })
    if(response.ok){    
        let order = await response.json()
    
        $('#orderNumber').html(order.trackId)
        if('sender' in order & 'receiver' in order){
            $('#senderName').text(order.sender.name)
            $('#addressFrom').text(order.sender.place)
            $('#receiverName').text(order.receiver.name)
            $('#addressWhere').text(order.receiver.place)
        
        $('#routeTable').empty()
        let dateStart=new Date(order.createdAt)
        let day = dateStart.getDate();
        let month = dateStart.getMonth()+1;
        let year = dateStart.getFullYear();
        $('#routeTable').append(`
        <tr>
            <td>${day}.${month}.${year}</td>
            <td>Заказ создан</td>
            <td>${order.sender.place}</td>
         </tr>
        `)
        for(let p of order.points){
            let pointDate = new Date(p.date)
            if (pointDate.getDate()!=NaN){
            $('#routeTable').append(`
            <tr>
                <td>${pointDate.getDate()+'.'+(pointDate.getMonth()+1)+'.'+pointDate.getFullYear()||''}</td>
                <td>${p.status||''}</td>
                <td>${p.place||''}</td>
             </tr>
            `)
            }else{
                $('#routeTable').append(`
            <tr>
                <td>${''}</td>
                <td>${p.status||''}</td>
                <td>${p.place||''}</td>
             </tr>
            `)
            }
        }
        if(order.status==order.points.length){
            let deliverDate = new Date(order.points[order.status-1].date)
            $('#routeTable').append(`
            <tr>
                <td>${deliverDate.getDate()+'.'+(deliverDate.getMonth()+1)+'.'+deliverDate.getFullYear()}</td>
                <td>Доставлено получателю</td>
                <td>${order.receiver.place||''}</td>
             </tr>
            `)
        }else{
            $('#routeTable').append(`
            <tr>
                <td></td>
                <td></td>
                <td>${order.receiver.place||''}</td>
             </tr>
            `)
        }
    }
        $('#submitSuccessMessage').removeClass('d-none')
        $([document.documentElement, document.body]).animate({
            scrollTop: $("#submitSuccessMessage").offset().top
        }, 2000);
    }else{
        $('#submitErrorMessage').removeClass('d-none')
    }
    
})

 function filter(str){

    return str.replace(/[^\d]/g, '');
}