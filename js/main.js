var app = new Vue({
    el: '#app',
    data: {
        showaddhotel: false,
        id_hotel: "",
        msgError: "",
        msgSuccess: "",
        hoteis: [],
        quartos: [],
        newHotel: {
            name: "", localizacao: "", sobre: "", fotos: "", comodidades: ""
        },
        newQuarto: {
            nome: "", descricao: "", preco: "", capacidade: "", fotos: ""
        },
        currentHotel: {},
        currentQuarto: {}
    },
    methods: {
        getAllhoteis() {
            axios.get("http://localhost/Rbarcos/data/process.php?action=read").then(response => {
                if (response.data.error) {
                    this.msgError = response.data.message;

                } else {
                    this.hoteis = response.data.hoteis;
                }
            })
        },
        getAllquartos(id) {
            axios.get("http://localhost/Rbarcos/data/process.php?action=readquartos&id=" + id).then(response => {
                if (response.data.error) {
                    this.msgError = response.data.message;

                } else {
                    this.quartos = response.data.quartos;
                    this.qtdquartos = this.quartos.length;
                }
            })
        },
        addHotel() {
            var formdata = this.toformdata(this.newHotel);
            axios.post("http://localhost/Rbarcos/data/process.php?action=create", formdata).then(response => {
                this.newHotel = { name: "", localizacao: "", sobre: "", fotos: "", comodidades: "" };
                if (response.data.error) {
                    this.msgError = response.data.message;

                } else {
                    this.msgSuccess = response.data.message;
                    this.getAllquartos();
                }
            })
        },
        addQuarto(id) {
            var formdata = this.toformdata(this.newQuarto);
            axios.post("http://localhost/Rbarcos/data/process.php?action=createquarto&id=" + id, formdata).then(response => {
                this.newQuarto = { nome: "", descricao: "", preco: "", capacidade: "", fotos: "" };
                if (response.data.error) {
                    this.msgError = response.data.message;

                } else {
                    this.msgSuccess = response.data.message;
                    this.getAllquartos();
                }
            })
        },

        toformdata(obj) {
            var fd = new FormData();
            for (var i in obj) {
                fd.append(i, obj[i]);
            }
            return fd;
        },
        pegarid(id) {
            this.id_hotel = id;
        }

    },
    created() {
        this.getAllhoteis();
        this.getAllquartos(1);
    }
})

