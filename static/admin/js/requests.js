$(document).ready(async function () {
  let response = await fetch('/api/event/')
  if(!response.ok){
      console.log('Not authorized')
      window.location.href="/admin/login"
  }

  let result = await fetch('/api/seat/requests',{
    method: 'GET',
    headers: {
      'Content-Type': 'application/json;charset=utf-8'
    }
  })
  let res = await result.json()
  show(res)
 
});

async function show(res){
    $('#reqList').empty()
    
      let i=1
      for(let r of res){
        if(r.statusId==2){
          let dateStart=new Date(r.updatedAt)
          let day = dateStart.getDate();
          let month = dateStart.getMonth();
          let year = dateStart.getFullYear();
          let sector = ''
          let color=''
          let row=-6
              switch (r.sectorId) {
                case 1:
                  sector =  'Bronze'
                  color='#c9c9c9'
                  break;
                case 4:
                  sector =  'Silver'
                  color='#5F2C9F'
                  break;
                case 3:
                sector =  'Gold'
                color='#F4D581'
                  break;
                case 2:
                sector =  'Platinum'
                color='#313131'
                  break;
                default:
                  break;
              }
              row+=r.row
              if(row<=0){
                row+=6
              }
            $('#reqList').append(`
            <div class="list-group-item list-group-item-action d-md-flex justify-content-between gap-2  align-items-center" aria-current="true">
            <div class="d-lg-flex gap-2 req justify-content-between align-items-center">
             <h6 class="mb-0"><span>${i}. </span>${r.email}</h6>
            
            
            <div><div style="color:${color}">${sector}</div> Ряд: ${row} Место: ${r.col}</div>
            <div class="opacity-50 text-nowrap">${day}.${month}.${year}</div>
            </div>
            <div class="d-sm-dlex gap-1 justify-content-end align-items-center">
            
                <div data-id=${r.id} 
                class="mb-1 p-1 request-accept btn-success text-white btn btn-10" >Оплачено</div>
                <div data-id=${r.id} class=" p-1 mb-1 btn-danger text-small btn text-white btn-10 request-decline ">Отклонить</div>
              
           
          </div>
            `)
            i++
            }
            
}
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
     show(resText)
     showBooked()
    })
  })
}
    


function showBooked(){
  $('#bookList').empty()
  fetch('/api/seat/booked',{
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
      console.log(r)
     
        let dateStart=new Date(r.updatedAt)
        let day = dateStart.getDate();
        let month = dateStart.getMonth();
        let year = dateStart.getFullYear();
        let sector = ''
        let color=''
        let row=-6
            switch (r.sectorId) {
              case 1:
                sector =  'Bronze'
                color='#c9c9c9'
                break;
              case 4:
                sector =  'Silver'
                color='#5F2C9F'
                break;
              case 3:
              sector =  'Gold'
              color='#F4D581'
                break;
              case 2:
              sector =  'Platinum'
              color='#313131'
                break;
              default:
                break;
            }
            console.log(r.sectorId)
          row+=r.row
        if(row<=0){
          row+=6
        }
          $('#bookList').append(`
          <div class="list-group-item list-group-item-action d-md-flex justify-content-between gap-2  align-items-center" aria-current="true">
          <div class="d-lg-flex gap-2 req justify-content-start align-items-center">
           <h6 class="mb-0"><span>${i}. </span>${r.email}</h6>
          
          
          <div><div style="color:${color}">${sector}</div> Ряд: ${row} Место: ${r.col}</div>
          <div class="opacity-50 text-nowrap">${day}.${month}.${year}</div>
          </div>
          <div class="d-sm-dlex gap-1 justify-content-end align-items-center">
          <div class='mb-1'>
          <a href='/api/seat/download/${r.id}' class=" p-1 mb-0 btn-info text-small btn btn-10 text-white book-download ">Скачать билет</a>
            <div data-id=${r.id} class=" p-1 mb-0 btn-warning text-small btn btn-10 text-white book-resend ">Отправить повторно</div>
            </div><div>
              <div data-id=${r.id} class=" p-1 mb-0 btn-danger text-small btn btn-10 text-white book-decline ">Отменить</div>
              <div data-id=${r.id} class=" p-1 mb-0 btn-warning text-small btn btn-10 text-white book-changeEmail ">Изменить email</div>
            </div>
         
        </div>
          `)
          i++
      }
    }
}).then(fin=>{

  $('.book-decline').each(function (index, value) { 
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
    showBooked()
    show()
    })
  })
  
  $('.book-resend').each(function (index, value) { 
    $(this).on('click', async function(){
      let id   = $(this).data('id')
    let res = await fetch('/api/seat/resend/'+id)
    let resText = await res.json()
    console.log(resText)
    })
})
})
  
}
showBooked()

$('.filter').on('input', async function(e){
  let order
  let segment
  let row
    order=$('#order').val()
  
    segment=$('#segment').val()
  if($('#row').val()!=''){
    row=$('#row').val()
   
  }
  var status = [];
  $('#checks input:checked').each(function() {
      status.push($(this).val());
  });

  let str = `/api/seat/filter?order=${order}&segment=${segment}&`
  if(row){
    str+=`row=${row}&`
  }
  for(let s of status){
    str+=`sectorId=${s}&`
  }
  console.log(str)
  
  let response = await fetch(str)
  let res = await response.json()
  console.log(res)
  if(response.ok){
    show(res)
  }
})