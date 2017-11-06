import Vue from "vue";
import axios from "axios";


new Vue({
    el: "#takso-app",
    data: {
        message: "Hello there", 
        pickup_address: "Liivi 2",
        dropoff_address: ""
    },
    methods: {
        submitBookingRequest: function(){
            console.log(this.pickup_address, this.dropoff_address);
            axios.post("/api/bookings", 
                {pickup_address: this.pickup_address, dropoff_address: this.dropoff_address})
                .then(function (response) { console.log(response); })
                .catch(function (error) { console.log(error); });
        }
    },
    mounted: function() {
        navigator.geolocation.getCurrentPosition(function (position) {
            console.log(position);
        });
    }
});