$(document).ready(async function () {
  let response = await fetch('/api/event/')
  if(!response.ok){
      console.log('Not authorized')
      window.location.href="/admin/login"
  }
});
function show(){
    $('#reqList').empty()
    fetch('/api/seat/requests',{
        method: 'GET',
        headers: {
          'Content-Type': 'application/json;charset=utf-8'
        }
    }).then(async (response)=> {
      if(response.ok){    
      let res = await response.json()
      console.log(res)
      let i=1
      for(let r of res){
        if(r.statusId==2){
          let dateStart=new Date(r.updatedAt)
          let day = dateStart.getDate();
          let month = dateStart.getMonth();
          let year = dateStart.getFullYear();
          let sector = ''
          let color=''
              switch (r.sectorId) {
                case 1:
                  sector =  'Bronze'
                  color='#CD7F32'
                  break;
                case 2:
                  sector =  'Silver'
                  color='#C0C0C0'
                  break;
                case 3:
                sector =  'Gold'
                color='#DAA520'
                  break;
                case 4:
                sector =  'Platinum'
                color='#E5E4E2'
                  break;
                default:
                  break;
              }
          
            $('#reqList').append(`
            <div class="list-group-item list-group-item-action d-md-flex justify-content-between gap-2 py-3 align-items-center" aria-current="true">
            
             <h6 class="mb-0"><span>${i}. </span>${r.email}</h6>
            
            <div class="d-lg-flex gap-2 justify-content-end align-items-center">
            <div><span style="color:${color}">${sector}</span> Ряд: ${r.row} Место: ${r.col}</div>
            <div class="opacity-50 text-nowrap">${day}.${month}.${year}</div>
                <div data-id=${r.id} 
                class="mb-0  request-accept btn-success text-white btn" >Забронировать</div>
                <div data-id=${r.id} class="mb-0 btn-danger text-small btn text-white request-decline ">Отклонить</div>
              
            </div>
          </div>
            `)
            i++
        }
      }
}}).then(fin=>{
  $('.request-accept').each(function (index, value) { 
  $(this).on('click', async function(){
    let id   = $(this).data('id')
   console.log(id)
   let res = await fetch('/api/seat/', {
    method:'POST',
    body:JSON.stringify({id:id}),
    headers: {
      'Content-Type': 'application/json;charset=utf-8'
    }
   })
   let resText = await res.json()
   console.log(resText)
   show()
  })
})
  $('.request-decline').each(function (index, value) { 
    $(this).on('click', async function(){
      let id   = $(this).data('id')
     console.log(id)
     let res = await fetch('/api/seat/decline', {
      method:'POST',
      body:JSON.stringify({id:id}),
      headers: {
        'Content-Type': 'application/json;charset=utf-8'
      }
     })
     let resText = await res.json()
     console.log(resText)
     show()
    })
  })
})
    
}
show()

  

