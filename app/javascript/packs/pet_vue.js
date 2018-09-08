/* eslint no-console: 0 */

import Vue from 'vue/dist/vue.esm'
import TurbolinksAdapter from 'vue-turbolinks'
import VueResource from 'vue-resource'

Vue.use(VueResource)
Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {
  Vue.http.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content')

  var element = document.getElementById("pet-form")

  if (element != null) {
    var id = element.dataset.id
    var pet = JSON.parse(element.dataset.pet)

    var app = new Vue({
      el: element,
      data: function() {
        return { id: id, pet: pet }
      },
      methods: {
        save: function() {
          // Create a new pet
          if (this.id == null) {
            this.$http.post('/pets', { pet: this.pet }).then(response => {
              console.log(response.body)
              Turbolinks.visit(`/pets/${response.body.id}`)
            }, response => {
              console.log(response.body)
            })

          // Edit an existing pet
          } else {
            this.$http.put(`/pets/${this.id}`, { pet: this.pet }).then(response => {
              console.log(response.body)
              Turbolinks.visit(`/pets/${response.body.id}`)
            }, response => {
              console.log(response.body)
            })
          }
        },

        existingPet: function() {
          return this.pet.id != null
        }
      }
    })
  }
})
