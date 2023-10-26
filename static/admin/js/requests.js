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
          
            $('#reqList').append(`
            <div class="list-group-item list-group-item-action d-flex justify-content-between gap-3 py-3 align-items-center" aria-current="true">
            <span>${i}</span>
             <h6 class="mb-0">${r.email}</h6>
            
            <div class="d-flex gap-2 justify-content-end align-items-center">
            <span class="opacity-70 text-nowrap">${day}.${month}.${year}</span>
                <div data-id=${r.id} 
                class="mb-0  request-accept btn-success text-white btn" >Забронировать</div>
                <div class="mb-0 btn-danger text-small btn text-white request-decline ">Отклонить</div>
              
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
})})
    
}
show()

  

