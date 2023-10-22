async function show(){
  let role = await fetch('/api/users/checkRole', {method:'PUT'})
  if( role.ok){
    let rtext= await role.text()
    if(rtext=='admin'){
    let response = await fetch('/api/orders/',{
        method: 'GET',
        headers: {
          'Content-Type': 'application/json;charset=utf-8'
        }
    })
      if(response.ok){    
      let res = await response.json()
        for(let r of res){
          if(!(r.status&&r.receiver&&r.sender)){
            $('#orderList').append(`
            <a href="/order?id=${r.trackId}" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
            <img src="https://github.com/twbs.png" alt="twbs" width="32" height="32" class="rounded-circle flex-shrink-0">
            <div class="d-flex gap-2 w-100 justify-content-between">
              <div>
                <h6 class="mb-0">${r.trackId}</h6>
              
              </div>
              
            </div>
          </a>
            `)
          }else{
          if(r.status==r.points.length){
            $('#orderList').append(`
            <a href="/order?id=${r.trackId}" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
            <img src="https://github.com/twbs.png" alt="twbs" width="32" height="32" class="rounded-circle flex-shrink-0">
            <div class="d-flex gap-2 w-100 justify-content-between">
              <div>
                <h6 class="mb-0">${r.trackId}</h6>
                <p class="mb-0 opacity-75">${r.receiver.place}</p>
              </div>
              <small class="opacity-50 text-nowrap">${'Доставлено'}</small>
            </div>
          </a>
            `)
          }else{
            $('#orderList').append(`
            <a href="/order?id=${r.trackId}" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
            <img src="https://github.com/twbs.png" alt="twbs" width="32" height="32" class="rounded-circle flex-shrink-0">
            <div class="d-flex gap-2 w-100 justify-content-between">
              <div>
                <h6 class="mb-0">${r.trackId}</h6>
                <p class="mb-0 opacity-75">${r.points[parseInt(r.status)].place||r.receiver.place}</p>
              </div>
              <small class="opacity-50 text-nowrap">${r.points[parseInt(r.status)].status||'Доставлено'}</small>
            </div>
          </a>
            `)
          }
          }
        }
      }else{
        for(let r of res){
          if(!(r.status&&r.receiver&&r.sender)){
            $('#orderList').append(`
            <a href="/order?id=${r.trackId}" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
            <img src="https://github.com/twbs.png" alt="twbs" width="32" height="32" class="rounded-circle flex-shrink-0">
            <div class="d-flex gap-2 w-100 justify-content-between">
              <div>
                <h6 class="mb-0">${r.trackId}</h6>
              
              </div>
              
            </div>
          </a>
            `)
          }else{
          if(r.status==r.points.length){
            $('#orderList').append(`
            <a href="/manager-order?id=${r.trackId}" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
            <img src="https://github.com/twbs.png" alt="twbs" width="32" height="32" class="rounded-circle flex-shrink-0">
            <div class="d-flex gap-2 w-100 justify-content-between">
              <div>
                <h6 class="mb-0">${r.trackId}</h6>
                <p class="mb-0 opacity-75">${r.receiver.place}</p>
              </div>
              <small class="opacity-50 text-nowrap">${'Доставлено'}</small>
            </div>
          </a>
            `)
          }else{
          $('#orderList').append(`
          <a href="/manager-order?id=${r.trackId}" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
          <img src="https://github.com/twbs.png" alt="twbs" width="32" height="32" class="rounded-circle flex-shrink-0">
          <div class="d-flex gap-2 w-100 justify-content-between">
            <div>
              <h6 class="mb-0">${r.trackId}</h6>
              <p class="mb-0 opacity-75">${r.points[parseInt(r.status)].place||r.receiver.place}</p>
            </div>
            <small class="opacity-50 text-nowrap">${r.points[parseInt(r.status)].status||'Доставлено'}</small>
          </div>
        </a>
          `)
          }
        }
      }
      }
  }else if(rtext=='manager'){
    let response = await fetch('/api/orders/',{
      method: 'GET',
      headers: {
        'Content-Type': 'application/json;charset=utf-8'
      }
  })
    if(response.ok){    
    let res = await response.json()
      for(let r of res){
        if(!(r.status&&r.receiver&&r.sender)){
          $('#orderList').append(`
          <a href="/manager-order?id=${r.trackId}" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
          <img src="https://github.com/twbs.png" alt="twbs" width="32" height="32" class="rounded-circle flex-shrink-0">
          <div class="d-flex gap-2 w-100 justify-content-between">
            <div>
              <h6 class="mb-0">${r.trackId}</h6>
            
            </div>
            
          </div>
        </a>
          `)
        }else{
        if(r.status==r.points.length){
          $('#orderList').append(`
          <a href="/manager-order?id=${r.trackId}" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
          <img src="https://github.com/twbs.png" alt="twbs" width="32" height="32" class="rounded-circle flex-shrink-0">
          <div class="d-flex gap-2 w-100 justify-content-between">
            <div>
              <h6 class="mb-0">${r.trackId}</h6>
              <p class="mb-0 opacity-75">${r.receiver.place||''}</p>
            </div>
            <small class="opacity-50 text-nowrap">${'Доставлено'}</small>
          </div>
        </a>
          `)
        }else{
          $('#orderList').append(`
          <a href="/manager-order?id=${r.trackId}" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
          <img src="https://github.com/twbs.png" alt="twbs" width="32" height="32" class="rounded-circle flex-shrink-0">
          <div class="d-flex gap-2 w-100 justify-content-between">
            <div>
              <h6 class="mb-0">${r.trackId}</h6>
              <p class="mb-0 opacity-75">${r.points[parseInt(r.status)].place||r.receiver.place}</p>
            </div>
            <small class="opacity-50 text-nowrap">${r.points[parseInt(r.status)].status||'Доставлено'}</small>
          </div>
        </a>
          `)
        }
        }
      }
    }else{
      for(let r of res){
        if(r.status==r.points.length){
          $('#orderList').append(`
          <a href="/manager-order?id=${r.trackId}" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
          <img src="https://github.com/twbs.png" alt="twbs" width="32" height="32" class="rounded-circle flex-shrink-0">
          <div class="d-flex gap-2 w-100 justify-content-between">
            <div>
              <h6 class="mb-0">${r.trackId}</h6>
              <p class="mb-0 opacity-75">${r.receiver.place}</p>
            </div>
            <small class="opacity-50 text-nowrap">${'Доставлено'}</small>
          </div>
        </a>
          `)
        }else{
        $('#orderList').append(`
        <a href="/manager-order?id=${r.trackId}" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
        <img src="https://github.com/twbs.png" alt="twbs" width="32" height="32" class="rounded-circle flex-shrink-0">
        <div class="d-flex gap-2 w-100 justify-content-between">
          <div>
            <h6 class="mb-0">${r.trackId}</h6>
            <p class="mb-0 opacity-75">${r.points[parseInt(r.status)].place||r.receiver.place}</p>
          </div>
          <small class="opacity-50 text-nowrap">${r.points[parseInt(r.status)].status||'Доставлено'}</small>
        </div>
      </a>
        `)
        }
    }
    }
  }
}
}

show()

$('#importXls').on('submit', async (e)=>{
  e.preventDefault()
  //console.log(e)
  var form = new FormData(); 
  form.append("table", $("#inputGroupFile04")[0].files[0]);
  console.log(form)
  let response = await fetch('/api/upload', { // Your POST endpoint
    method: 'POST',
    body: form // This is your file object
  })
  let text = await response.json()
  console.log(text)
  location.reload()
})