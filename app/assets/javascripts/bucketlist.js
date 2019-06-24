$(document).ready(function(e) { 
    getBucketlists()
})
const getBucketlists = () => {
  fetch(`/bucketlists.json`)
    .then(res => res.json())
    .then(bucketlists => {
       $("#bucketlists").html('')
      bucketlists.forEach(bucketlist => {
        let newBucketlist = new Bucketlist(bucketlist)
        console.log(newBucketlist)
        let bucketlistHtml = newBucketlist.formatIndex()
        console.log(bucketlistHtml)
        $("#bucketlists").append(bucketlistHtml)
        let myButton = document.createElement('a')
        myButton.innerText = "View"
        myButton.href = "http://localhost:3000/bucketlists/" + [bucketlist.id]
        let div = document.getElementById("bucketlists")
        div.append(myButton)
      })
})
}


function Bucketlist(bucketlist){
  this.id = bucketlist.id
  this.name = bucketlist.name
  this.items = bucketlist.items
}
Bucketlist.prototype.formatIndex = function(){
  let bucketlistHtml = `
  <h1>${this.name}</h1>
  `
  return bucketlistHtml
}

// $('#new_list').submit(function(event){
//   event.preventDefault()
//   const values = $(this).serialize()
//   $.post("/posts", values).done(function(data)
//       const newlist = new Bucketlist(data)
//       const newlistHtml = newlist.formatIndex()
//     $("#bucketlists").append(newlistHtml)
//   })
//
// });
