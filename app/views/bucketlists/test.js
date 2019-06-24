document.addEventListener("DOMContentLoaded", (e)=>{
  let myButton = document.createElement('a')
  myButton.innerText = "http://localhost:3000/bucketlists/13"
  myButton.href = "http://localhost:3000/bucketlists/13"

  let div = document.getElementById("form1")
  div.append(myButton)
})
