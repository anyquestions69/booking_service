async function show(){
    $('#orderList').empty()
    let response = await fetch('/api/users/',{
        method: 'GET',
        headers: {
          'Content-Type': 'application/json;charset=utf-8'
        }
    })
    if(response.ok){    
        let res = await response.json()
        console.log(res)
        for(let r of res){
            let dateStart=new Date(r.createdAt)
            let day = dateStart.getDate();
            let month = dateStart.getMonth();
            let year = dateStart.getFullYear();
            if(r.manager){
              $('#orderList').append(`
              <a href="/user?id=${r._id}" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
              <img src="https://github.com/twbs.png" alt="twbs" width="32" height="32" class="rounded-circle flex-shrink-0">
              <div class="d-flex gap-2 w-100 justify-content-between">
                
                  <h6 class="mb-0">${r.email}</h6>
                  <small class="opacity-50 text-nowrap">Менеджер</small>
                  <p class="mb-0 opacity-75">Редактировать</p>
                
                
              </div>
            </a>
              `)
            }else{
              $('#orderList').append(`
              <a href="/user?id=${r._id}" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
              <img src="https://github.com/twbs.png" alt="twbs" width="32" height="32" class="rounded-circle flex-shrink-0">
              <div class="d-flex gap-2 w-100 justify-content-between">
               
                  <h6 class="mb-0">${r.email}</h6>
                  <p class="mb-0 opacity-75">Редактировать</p>
              </div>
            </a>
              `)
            }
       
        }
    }
    }
    
    show()