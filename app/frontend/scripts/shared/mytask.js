document.addEventListener('turbolinks:load', () => {
  let mytaskBtnAll = document.querySelector('.mytask-btn-for-status')
  if (mytaskBtnAll){
    let btns= document.querySelectorAll('.mytask-btn')
    let divOfMytasks = document.querySelectorAll('.mytask-type')
    btns.forEach((btn)=>{
      btn.addEventListener('click',function(){
        let selectedStatus = btn.getAttribute('status')
        divOfMytasks.forEach((divOfMytask)=>{
          let divStatus = divOfMytask.getAttribute('status')
          if (divStatus == selectedStatus){
            document.querySelector('.' + divStatus).classList.remove('is-removed-for-mytask')
            document.querySelector('.' + divStatus).classList.add('is-active-for-mytask')
          }else{
            document.querySelector('.' + divStatus).classList.add('is-removed-for-mytask')
            document.querySelector('.' + divStatus).classList.remove('is-active-for-mytask')
          }
        })
      })
    })
  }
});