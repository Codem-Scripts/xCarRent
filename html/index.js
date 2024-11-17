const app = Vue.createApp({
    data: () => ({
        locales : {},
        menuOpen: false,
        selectedCategory: false,
        currentPage: 'main',
        selectedVehicle: false,
        paymentMethod: 'cash',
        timeprogress: false,
        timeprogress2: false,
        showTimeProgress: false,
        currentTime: false,
        remainTime: false,
        activeRent : false,
        vehicles: {
            ["sedan"]: [
                {
                    name: 'revolter',
                    label: 'Revolter',
                    image: 'Revolter.png',
                    speed: 5,
                    handling: 3,
                    acceleration: 4,
                    price: {
                        ["10"]: {
                            label: '10m',
                            cash: 10,
                            bank: 20,
                            selected: false,
                        },
                        ["20"]: {
                            label: '20m',
                            cash: 30,
                            bank: 50,
                            selected: false,
                        },
                        ["30"]: {
                            label: '30m',
                            cash: 40,
                            bank: 60,
                            selected: false,
                        },
                        ["60"]: {
                            label: '60m',
                            cash: 70,
                            bank: 90,
                            selected: false,
                        },
                    }

                },
            ],
            ["muscle"]: {},
            ["suv"]: {},
            ["sport"]: {},
            ["classic"]: {},
            ["motorcycle"]: {},
        },
        categories: [
            {
                name: 'sedan',
                label: 'SEDAN',
                icon: 'sedan.svg',
            },
            {
                name: 'muscle',
                label: 'MUSCLE',
                icon: 'muscle.svg',
            },
            {
                name: 'suv',
                label: 'SUV',
                icon: 'suv.svg',
            },
            {
                name: 'sport',
                label: 'SPORT',
                icon: 'sport.svg',
            },
            {
                name: 'classic',
                label: 'CLASSIC',
                icon: 'classic.svg',
            },
            {
                name: 'motorcycle',
                label: 'MOTORCYCLE',
                icon: 'motorcycle.svg',
            },
        ]
    }),
    computed: {
        categoryData() {
            return this.categories.find((category) => category.name == this.selectedCategory)
        },
        vehiclesData() {
            return this.vehicles[this.selectedCategory]
        },
        vehicleData() {
            return this.vehiclesData?.find((vehicle) => vehicle.name == this.selectedVehicle)
        },
        cashPrice() {
            let price = false
            for (let key in this.vehicleData.price) {
                const data = this.vehicleData.price[key]
                if (data.selected) {
                    price = data["cash"]
                }
            }
            return price
        },
        bankPrice() {
            let price = false
            for (let key in this.vehicleData.price) {
                const data = this.vehicleData.price[key]
                if (data.selected) {
                    price = data["bank"]
                }
            }
            return price
        },
        selectedTime() {
            let selectedTime = false
            for (let key in this.vehicleData.price) {
                const data = this.vehicleData.price[key]
                if (data.selected) {
                    selectedTime = Number(key)
                }
            }
            return selectedTime
        },

    },
    methods: {
        rentCar() {
            postNUI('rentCar', {
                price: this.paymentMethod == 'cash' ? this.cashPrice : this.bankPrice,
                vehicle: this.selectedVehicle,
                time: this.selectedTime,
                deposit : this.vehicleData.deposit,
                type : this.paymentMethod,
            })
        },
        selectTime(data, key, index) {
            let v = this.vehiclesData.find((vehicle) => vehicle.name == this.selectedVehicle)
            for (let key in v.price) {
                let data = v.price[key]
                data.selected = false
            }
            v.price[key].selected = true
        },
        setCurrentPage(value) {
            if(this.activeRent && value != 'timeprogress'){
                return
            }
            this.currentPage = value
        },
        selectVehicle(vehicle) {
            this.selectedVehicle = vehicle
            if (vehicle) {
                this.setCurrentPage('vehdetails')

            } else {
                this.setCurrentPage('rentveh')
            }
        },
        selectCategory(category) {
            this.selectedCategory = category

            if (category) {
                this.setCurrentPage('rentveh')

            } else {
                this.setCurrentPage('main')

            }
        },
        secondsToDate(seconds, includeHours) {
            const date = new Date(null);
            date.setSeconds(seconds); // specify value for SECONDS here

            let minutes = date.getMinutes()
            let secondss = date.getSeconds()
            if (minutes < 10) {
                minutes = '0' + minutes
            }
            if (secondss < 10) {
                secondss = '0' + secondss
            }


            let formattedClock = `${minutes}:${secondss}`

            return `${formattedClock}`
        },
        setProgressBar(time) {
            if (this.timeprogress && this.menuOpen) {
                this.timeprogress.destroy()
            }
            this.timeprogress = new ProgressBar.Circle('#time-progress', {
                strokeWidth: 8,
                duration: (time * 60000),
                color: 'rgba(255, 255, 255, 0.55)',
                trailColor: 'rgba(255, 255, 255, 0.25)',
                trailWidth: 8,
                svgStyle: null
            });
            this.timeprogress.set(0.0)
            this.timeprogress.animate(1.0)

        
            if(this.showTimeProgress){
                Vue.nextTick(() =>{
                    if (this.timeprogress2 ) {
                        this.timeprogress2.destroy()
                    }
        
                    this.timeprogress2 = new ProgressBar.Circle('#remain-time-progress', {
                        strokeWidth: 8,
                        duration: (time * 60000),
                        color: '#00E060',
                        trailColor: '#00361D',
                        trailWidth: 8,
                        svgStyle: null
                    });
                    this.timeprogress2.set(0.0)
                    this.timeprogress2.animate(1.0)
                })
            }
            this.activeRent = true
        },
        eventHandler(event) {
            switch (event.data.action) {
                case "open":
                    this.vehicles = event.data.payload.vehicles
                    this.categories = event.data.payload.categories
                    this.locales = event.data.payload.locales
                    this.menuOpen = true
                    break
                case "setCurrentTime":
                    this.currentTime = event.data.payload.time
                    this.showTimeProgress = true
                    this.setProgressBar(this.currentTime, event.data.payload.refresh)
                    break
                case "close":
                    this.close()
                    break
                case "destroyProgressbar":
                    if (this.timeprogress) {
                        this.timeprogress.destroy()
                        this.timeprogress = new ProgressBar.Circle('#time-progress', {
                            strokeWidth: 8,
                            easing: 'easeInOut',
                            duration: 1000,
                            color: 'rgba(255, 255, 255, 0.55)',
                            trailColor: 'rgba(255, 255, 255, 0.25)',
                            trailWidth: 8,
                            svgStyle: null
                        });
                        this.timeprogress.set(0.0)
                        this.currentTime = false
                    }
                    if (this.timeprogress2 &&  this.showTimeProgress) {
                        this.showTimeProgress = false

                        this.timeprogress2.destroy()
                        this.timeprogress2 = new ProgressBar.Circle('#remain-time-progress', {
                            strokeWidth: 8,
                            easing: 'easeInOut',
                            duration: 0,
                            color: '#00E060',
                            trailColor: '#00361D',
                            trailWidth: 8,
                            svgStyle: null
                        });
                        this.timeprogress2.set(0.0)
                    }
                    this.activeRent = false

                    break
                case "setRemainTime":
                    this.remainTime = event.data.payload
                    break
                default:
                    break
            }

        },
        close() {
            this.menuOpen = false
            postNUI('close')
        },
        keyHandler(e) {
            if (e.which == 27) {
                this.close()
            }
        },
    },
    mounted() {

        this.timeprogress = new ProgressBar.Circle('#time-progress', {
            strokeWidth: 8,
            duration: 0,
            color: 'rgba(255, 255, 255, 0.55)',
            trailColor: 'rgba(255, 255, 255, 0.25)',
            trailWidth: 8,
            svgStyle: null
        });

        // this.timeprogress2.set(0)
        // this.timeprogress2.animate(1.0)
        window.addEventListener("keyup", this.keyHandler);
        window.addEventListener("message", this.eventHandler);

    },
    watch: {
    
    }

})
let resourceName = 'xCarRent'
if (window.GetParentResourceName) {
    resourceName = window.GetParentResourceName();
}

window.postNUI = async (name, data) => {
    try {
        const response = await fetch(`https://${resourceName}/${name}`, {
            method: "POST",
            mode: "cors",
            cache: "no-cache",
            credentials: "same-origin",
            headers: {
                "Content-Type": "application/json"
            },
            redirect: "follow",
            referrerPolicy: "no-referrer",
            body: JSON.stringify(data)
        });
        return !response.ok ? null : response.json();
    } catch (error) {
        // console.log(error)
    }
};
app.mount("#app");