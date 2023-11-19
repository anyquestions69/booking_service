let uuid = window.location.href.split('check/')[1]

let res =  fetch('/api/seat/'+uuid).then(async res=>{
    let r = await res.json()
    let sector=''
    switch (r.sectorId) {
        case 1:
            sector='Bronze'
            break;
        case 2:
            sector='Platinum'
            break;
        case 3:
            sector='Gold'
            break;
        case 4:
            sector='Silver'
            break;
        default:
            break;
        }
    if(res.ok){
        $('#main').append(`
        <div>Ряд ${r.row}</div>
        <div>Место ${r.col}</div>
        <div>Сектор ${sector}</div>
        <div>Email ${r.email}</div
        `)
    }else{
        $('#main').append(`
        <div>Некорректный билет</div
        `)
    }
})
