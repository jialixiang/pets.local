/* eslint no-console: 0 */

import Vue from 'vue/dist/vue.esm'
import TurbolinksAdapter from 'vue-turbolinks'
import VueResource from 'vue-resource'

Vue.use(VueResource)
Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {
  Vue.http.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content')

  var element = document.getElementById("customer-form")

  if (element != null) {
    var id = element.dataset.id
    var customer = JSON.parse(element.dataset.customer)
    var preference_attributes = JSON.parse(element.dataset.preferenceAttributes)
    var pet_id_to_adopt = null
    if (!preference_attributes) {
      preference_attributes = {
        id: null,
        age: null,
        species: [],
        breed: []
      }
    }
    customer.preference_attributes = preference_attributes

    var app = new Vue({
      el: element,
      data: function() {
        return { id: id, customer: customer, pet_id_to_adopt: pet_id_to_adopt }
      },
      methods: {
        save: function() {
          // Create a new customer
          if (this.id == null) {
            this.$http.post('/customers', { customer: this.customer }).then(response => {
              Turbolinks.visit(`/customers/${response.body.id}`)
            }, response => {
              console.log(response.body)
            })

          // Edit an existing customer
          } else {
            this.$http.put(`/customers/${this.id}`, { customer: this.customer }).then(response => {
              Turbolinks.visit(`/customers/${response.body.id}`)
            }, response => {
              console.log(response.body)
            })
          }
        },

        adopt: function() {
          if (this.pet_id_to_adopt) {
            // Create a new adoption
            this.$http.post(`/customers/${this.id}/adopt?pet_id=${this.pet_id_to_adopt}`).then(response => {
              Turbolinks.visit(`/customers/${response.body.id}`)
            }, response => {
              console.log(response.body)
            })
          }
        }
      }
    })
  }
})
