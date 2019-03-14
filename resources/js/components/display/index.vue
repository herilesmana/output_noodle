<template>
    <div>
        <el-container>
            <el-header>
                <el-menu class="el-menu-demo" mode="horizontal" style="height: 50px">
                    <el-row>
                        <el-col :span="4">
                            <img src="images/logo.png" alt="PT. PAS" height="45px">
                        </el-col>
                        <el-col :span="16" style="text-align: center">
                            <span style="font-size: 30px">Display Output Noodle 1</span><i style="font-size: 10px"> v.1.0</i>
                        </el-col>
                        <el-col :span="4">
                            <span class="jam" style="font-size: 20px">{{ jam }}</span><br>
                            <span class="tanggal">{{ tanggal }}</span>
                        </el-col>
                    </el-row>
                </el-menu>
            </el-header>
            <el-main>
                <el-row class="variant variant-header">
                    <el-col class="variant-item" :span="10">Variant</el-col>
                    <el-col class="variant-item" :span="4">Periode</el-col>
                    <el-col class="variant-item" :span="3">Target</el-col>
                    <el-col class="variant-item" :span="3">Actual</el-col>
                    <el-col class="variant-item" :span="4">Achievement</el-col>
                </el-row>
                <el-row v-for="(achievement, index) in achievements" :key="achievement.id" class="variant" v-if="actual[achievement.barcode_variant] != 0 && (target[achievement.barcode_variant]/actual[achievement.barcode_variant]) * 100 > 100">
                    <el-col class="variant-item" :span="10">{{ achievement.nama_variant }}</el-col>
                    <el-col class="variant-item" :span="4">{{ getDate(achievement.start_date) }} - {{ getDate(achievement.end_date) }}</el-col>
                    <el-col class="variant-item" :span="3">
                        {{ target[achievement.barcode_variant].toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1.") }}
                    </el-col>
                    <el-col class="variant-item" :span="3">
                        <span v-if="actual[achievement.barcode_variant]">
                            {{ actual[achievement.barcode_variant].toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1.") }}
                        </span>
                        <span v-else>Waiting..</span>
                    </el-col>
                    <el-col class="variant-item" :span="4">
                    {{ getPersentase(target[achievement.barcode_variant],actual[achievement.barcode_variant]) }}
                    </el-col>
                </el-row>
                <el-row class="variant">
                    <el-col class="variant-item" :span="10"><strong>Target Tercapai</strong></el-col>
                    <el-col class="variant-item" :span="14">
                        <marquee direction="up" scrollamount="1">
                            <ul class="tercapai">
                                <li v-for="(achievement, index) in achievements" :key="achievement.id" v-if="actual[achievement.barcode_variant] != 0 && ( (target[achievement.barcode_variant]/actual[achievement.barcode_variant]) * 100 ) < 100">{{ achievement.nama_variant }} ( {{ getPersentase(target[achievement.barcode_variant],actual[achievement.barcode_variant]) }} )</li>
                            </ul>
                        </marquee>
                    </el-col>
                </el-row>
            </el-main>
        </el-container>
    </div>
</template>

<style scoped>
    ul.tercapai li {
        margin: 0;
        padding: 0
    }
    ul.tercapai {
        margin: 0;
        padding: 0;
        height: 20px;
    }
    .row1 {
        background: #eee;
    }
    .row2 {
        background: #fff;
    }
    .variant {
        font-family: Calibri;
        border-bottom: 1px solid #999;
        border-right: 1px solid #999;
    }
    .variant .variant-item {
        border-left: 1px solid #999;
        padding: 10px;
        padding-top: 10px;
        padding-bottom: 10px;
    }
    .variant.variant-header {
        border-top: 1px solid #999;
        border-bottom: 2px solid #999;
        background: #BC0303;
        color: #fff;
    }
    .variant.variant-header .variant-item {
        text-align: center;
        font-weight: bold;
    }
</style>

<script>
    export default {
        data () {
            return {
                tampil: false,
                item: {},
                target: [],
                actual: {},
                myachievement : [],
                getting_date : '',
                getTercapai : '',
                jam : '00:00',
                tanggal : '00 Januari 0000',
                achievements : []
            }
        },
        mounted: function () {
            this.getAchievements();
            this.setTglJam();
            this.doRefresh();
            // this.tercapaiItem();
            // this.getAchievement(18998866200315);
        },
        methods: {
            // tercapaiItem: function () {
            //     var vm = this;
            //     var no = 1;
            //     this.getTercapai = setInterval( function () {
            //         vm.item[no] = true;
            //         no ++;
            //     }, 3000)
            // },
            doRefresh: function () {
                setTimeout(function() {
                    location.reload();
                }, 60000);
            },
            getDate: function (date) {
                return date.substring(5,7)+"/"+date.substring(8);
            },
            getPersentase : function (target, actual)
            {
                var hasil = (actual / target) * 100;
                var result = "";
                if (isNaN(hasil)) {
                    result = "Calculating.."
                }else{
                    result = hasil.toFixed(2)+" %";
                }
                // console.log(hasil);
                return result;
            },
            getAchievements : function ()
            {
                var vm = this;
                axios.get('api/display/get_achievements')
                .then( function ( response ) {
                    // console.log( response.data );
                    vm.achievements = response.data;
                    vm.actual = [];
                    for (var i = 0; i < vm.achievements.length; i++) {
                        vm.target[vm.achievements[i].barcode_variant] = vm.achievements[i].target;
                        vm.getAchievement(vm.achievements[i].barcode_variant, vm.achievements[i].start_date, vm.achievements[i].end_date);
                    }
                })
                .catch( function ( error ) {
                    console.log( error )
                })
            },
            getAchievement : function (barcode, start_date, end_date)
            {
                var vm = this;
                axios.get('api/display/get_achievement/'+barcode+'/'+start_date+'/'+end_date)
                .then( function ( response ) {
                    // vm.myachievement = JSON.stringify(response.data.barcode);
                    // console.log( barcode + ' +- ' + JSON.stringify(response.data.barcode) );
                    vm.actual[response.data.barcode] = response.data.actual;
                    localStorage.setItem(vm.actual[response.data.barcode],response.data.actual);
                    // console.log(response.data.nobatch)
                     // console.log(vm.actual);
                })
                .catch( function ( error ) {
                    console.log( error )
                })
            },
            setTime : function ( time )
            {
                if (time < 10) {
                   return '0'+time;
                }
                return time;
            },
            setTglJam : function ()
            {
                var vm = this;
                this.getting_date = setInterval(function() {
                    var date = new Date();
                    var h = vm.setTime(date.getHours());
                    var i = vm.setTime(date.getMinutes());
                    var s = vm.setTime(date.getSeconds());
                    var d = vm.setTime(date.getDate());
                    var dateString = date.toString();
                    var arrDate = dateString.split(' ');
                    var htmlDate = arrDate[0] + ", " + arrDate[2] + " " + arrDate[1] + " " + arrDate[3];
                    vm.jam = h+':'+i+':'+s;
                    vm.tanggal = htmlDate;
                 }, 1000);
            }
        }
    }
</script>
