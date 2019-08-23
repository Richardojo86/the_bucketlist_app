$(document).ready(function(e) { 
    getBucketlists();
    sortBtnFunction();
})

const addNewLink = (event) => {
    //event.preventDefault();
    const bucketName = $('#bucket_name').val();
    fetch('/bucketlists', {
      method: 'POST',
      body: JSON.stringify({name: bucketName }),
      headers: {
        'Content-Type': 'application/json'
      }
    }).then(res => res.json())
    .then(bucket => {
      console.log(bucket)
    })
    .catch((error) => error);
}

const getBucketlists = () => {
  fetch(`/bucketlists.json`)
    .then(res => res.json())
    .then(bucketlists => {
       $("#bucketlists").html('');
      bucketlists.forEach(bucketlist => {
        let newBucketlist = new Bucketlist(bucketlist)
        let bucketlistHtml = newBucketlist.formatIndex()
        $("#bucketlists").append(bucketlistHtml)
        let myButton = document.createElement('a')
        myButton.innerText = "View"
        myButton.dataset.id = bucketlist.id
        myButton.href = "http://localhost:3000/bucketlists/" + [bucketlist.id]
        let div = document.getElementById("bucketlists")
        div.append(myButton)

        myButton.addEventListener('click', function(event) {
          event.preventDefault();
          let id = ($(this).attr('data-id'))
            fetch(`/bucketlists/${id}.json`)
            .then(res => res.json())
            .then(list => {
              let singlelist = new Bucketlist(list)
              let listHtml = singlelist.formatShow()
              $("#app-container").html('')
              $('#app-container').append(listHtml)

              const update_btn = document.getElementById('submitbtn')
              update_btn.addEventListener('click', function(event) {
                event.preventDefault();
                const bucket_listName = $('#bucketlist_name').val();
                fetch(`/bucketlists/${id}.json`,
                  {method: 'PUT',
                  body: JSON.stringify({name: bucket_listName}),
                  headers: {'Content-Type': 'application/json'} })
                  .then(res => res.json())
                  .then(bucket => {
                    let newlist = new Bucketlist(bucket)
                  let newlisthtml = newlist.formatShow()
                  $("#app-container").html('')
                  $("#app-container").append(newlisthtml)
                })
                // .catch(() => window.location.reload());
                console.log(id,list.name)
            })

            const delete_btn = document.getElementById('deletebtn')
            delete_btn.addEventListener('click', function(event) {
              event.preventDefault();
              console.log(id,list.name, "item to be removed")
              // fetch(`/bucketlists/${id}.json`, {
              //   method: 'DELETE'
              // headers: {'Content-Type': 'application/json'},
              // }).then(() => {console.log('removed'); })
            })

        })

      })
    })
  })
 }
 // this is part of the logic for my delete button its kinda incomplete but this is the general idea
 // const delete_btn = document.getElementById('deletebtn')
 // delete_btn.addEventListener('click', function(event) {
 //   event.preventDefault();
 //   fetch(`/bucketlists/${id}.json`, {
 //     method: 'Delete'
 //   }).then(() => {console.log('removed'); })
 // })

 function sortBtnFunction(){
   const sort_btn = document.getElementById("srt")
   sort_btn.addEventListener('click', function(event) {
     fetch(`/bucketlists.json`)
       .then(res => res.json())
       .then(bucketlists => {
          $("#bucketlists").html('');
          bucketlists.sort(function(a, b) {
            var nameA = a.name.toUpperCase(); // ignore upper and lowercase
            var nameB = b.name.toUpperCase(); // ignore upper and lowercase
            if (nameA < nameB) {
              return -1;
            }
            if (nameA > nameB) {
              return 1;
            }

            // names must be equal
            return 0;
          });

         bucketlists.forEach(bucketlist => {
           let newBucketlist = new Bucketlist(bucketlist)
           let bucketlistHtml = newBucketlist.formatIndex()
           $("#bucketlists").append(bucketlistHtml)
           let myButton = document.createElement('a')
           myButton.innerText = "View"
           myButton.dataset.id = bucketlist.id
           myButton.href = "http://localhost:3000/bucketlists/" + [bucketlist.id]
           let div = document.getElementById("bucketlists")
           div.append(myButton)
 })
});
})}

function Bucketlist(bucketlist){
  this.id = bucketlist.id
  this.name = bucketlist.name
  this.items = bucketlist.items
}

Bucketlist.prototype.formatIndex = function(){
  let bucketlistHtml = `
  <h2>${this.name}</h2>
  `
  return bucketlistHtml
}

Bucketlist.prototype.formatShow = function(){
    let singlelistHtml = `
    <h1> Single Bucketlist</h1> <br>
    <h2> Bucketlist Name: ${this.name} </h2> <br>
    <form id="updateform">
    <input type="text" value="${this.name}" name="bucketlist[name]" id="bucketlist_name">
    <button type="submit" name="commit" value="Update" id="submitbtn" class="btn-primary">update</button>
    <button type="delete"  name="destroy" value="Remove" id="deletebtn" class="btn-delete">delete</button>
    </form> <br>
    <h3> Items for: ${this.name} </h3>
    <a href= "/bucketlists/${this.id}/items">
            ${this.items.length} items
            </a> <br>
    <a href= "/bucketlists">
    Back to bucketlists
    </a>
    `
    return singlelistHtml
}
